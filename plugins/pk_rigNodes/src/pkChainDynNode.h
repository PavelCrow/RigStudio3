#pragma once

#include <maya/MMatrix.h>
#include <maya/MPoint.h>
#include <maya/MPxNode.h>

#include <vector>

// Simple dynamics of a chain - what the chainIk module gets out of nucleus
// today: a follicle, a hairSystem and a nucleus of its own, for five points
// that lag behind and spring back.
//
// The chain comes in as the world matrices of its goals - the animated pose.
// The node keeps its own copy of the points, lets them fly with the momentum
// they have, pulls each back towards its goal and keeps the segments at the
// length the goals have. The root is pinned to its goal.
//
// --- one step ---------------------------------------------------------------
//
// Every point is a mass on a spring towards its goal:
//
//     w  = sqrt(kMaxK) * stiffness * ramp(u)    the frequency of the spring
//     x'' = -w^2 * (x - goal) - 2 * damping * w * x'
//
// which is solved exactly over the step - the closed form of the damped
// oscillator, not a Verlet or an Euler of it. Nothing about the result then
// depends on how big the step is: at damping 0 the chain swings for ever at
// any substeps, and none of the decay comes from the integration. After it
// the segments are put back to the length the goals have, and what that
// moved counts as motion, so the points of the chain pull on each other.
//
// Gravity is in units per second squared.
//
// damping is the damping ratio, not a fraction of the velocity per frame: it
// is measured against the frequency of the spring, w. A stiff chain swings
// faster, so it has to lose more per frame to settle the same way, and that
// is exactly what tying it to w does - the decay stays as it was when
// stiffness is changed. 0 never settles, 1 is critical: the chain comes back
// to the goal without overshooting it at all.
//
// stiffness goes through a square so the soft end of the slider is not
// squeezed into its first tenth: at 1 the chain follows almost rigidly, at
// 0.1 it swings for a couple of seconds, at 0 only the lengths hold it.
// ramp(u) is a curve along the chain, 0 at the root and 1 at the tip - how
// much of the stiffness each point gets.
//
// Within a frame the goals are interpolated between the last frame and this
// one, so the substeps see the motion, not just its end.
//
// --- time -------------------------------------------------------------------
//
// At startFrame and before it, when time goes back, and when enable is off,
// the chain is reset onto its goals. Going forward by more than a frame is
// simulated through - the skipped frames become substeps.
//
// The node evaluates the same frame more than once - the animator moves a
// control on a paused frame, the viewport asks again. So it keeps the state
// the last frame started from and redoes that one step with the goals as they
// are now: re-evaluating a frame never pushes the simulation further, and a
// control moved on a paused frame is followed at once.
//
// --- space ------------------------------------------------------------------
//
// followSpace takes the motion of spaceMatrix into the simulated points: at 0
// the chain lags behind everything (world, the way nucleus does it), at 1 it
// lags only behind what happens inside the space - a character carried across
// the scene by its root does not make its tail fly.
//
// --- more points than controls ----------------------------------------------
//
// outputCount asks for more points than the goals give. A Catmull-Rom curve
// is laid through the goals and cut into that many pieces of equal length,
// and each piece gets a frame of its own: the turn from one goal to the next,
// taken part of the way, so the twist and the scale of the controls are
// carried along. The simulation then runs on those points, not on the
// controls - ten bones on three controls can each lag on their own instead of
// repeating three motions.
//
// The frames are then aimed along the curve: aimAxis says which axis of a
// control runs down the chain, and that axis is turned onto the tangent. So a
// control that is moved and not turned still bends the bones with it, while
// the twist stays whatever the controls have. With one point per control
// nothing of this happens - there the control's own matrix is the frame.
//
// --- output -----------------------------------------------------------------
//
// outMatrix[i] is the goal matrix of the point moved onto the simulated
// position and turned by the rotation that takes the goal segment to the
// simulated one. The twist, the scale and a negative scale of the mirrored
// side come from the goal unchanged. The tip takes the turn of the last
// segment.
class PkChainDynNode : public MPxNode
{
public:
    static void*   creator();
    static MStatus initialize();

    void    postConstructor() override;
    MStatus compute(const MPlug& plug, MDataBlock& data) override;

    SchedulingType schedulingType() const override { return kParallel; }
    void getCacheSetup(const MEvaluationNode& evalNode,
                       MNodeCacheDisablingInfo& disablingInfo,
                       MNodeCacheSetupInfo& cacheSetupInfo,
                       MObjectArray& monitoredAttributes) const override;

    // --- inputs ------------------------------------------------------------
    static MObject aTime;
    static MObject aStartFrame;
    static MObject aEnable;
    static MObject aWeight;           // 0 - the goals as they are, 1 - the simulation
    static MObject aStiffness;        // the whole chain, 0..1
    static MObject aStiffnessRamp;    // curve along the chain, root to tip
    static MObject aDamping;          // damping ratio, 1 - critical
    static MObject aGravity;          // units / s^2
    static MObject aGravityDirection;
    static MObject aGravityDirectionX, aGravityDirectionY, aGravityDirectionZ;
    static MObject aLengthKeep;       // 1 - the segments keep their length exactly
    static MObject aSubsteps;         // steps per frame
    static MObject aSpaceMatrix;
    static MObject aFollowSpace;
    static MObject aGoalMatrix;       // multi, root first
    static MObject aOutputCount;      // 0 - one point per goal
    static MObject aAimAxis;          // which axis of a control runs down the chain

    // --- outputs -----------------------------------------------------------
    static MObject aOutMatrix;        // multi, world

private:
    struct State
    {
        std::vector<MPoint>  pos;
        std::vector<MVector> vel;     // per frame
        std::vector<MPoint>  goal;    // the goals this state was stepped to
        MMatrix              space;
    };

    // The step of one oscillator, as a 2x2 matrix on (offset from the goal,
    // velocity). Same for every point with the same frequency, so it is built
    // once per batch and used on all three axes.
    struct Step
    {
        double dd, dv;                // the new offset, from the old two
        double vd, vv;                // the new velocity
    };

    static Step solveStep(double w, double zeta, double h);

    struct Params
    {
        std::vector<double> k;        // spring per point, 1 / frame^2
        std::vector<double> w;        // its frequency, sqrt(k)
        double damping, lengthKeep, followSpace;
        MVector gravity;              // units / frame^2
        int substeps;
    };

    // The goals of the simulated points: the controls themselves, or the
    // curve through them cut into `count` pieces of equal length.
    static void resample(const std::vector<MMatrix>& ctrl, size_t count,
                         const MVector& aim, std::vector<MMatrix>& out);

    void reset(const std::vector<MPoint>& goals, const MMatrix& space);
    static void simulate(State& s, const std::vector<MPoint>& goals,
                         const MMatrix& space, double dt, const Params& p);

    State  mBase;                     // what the last frame started from
    State  mCur;
    double mLastTime = 0.0;
    double mLastDt   = 0.0;
    bool   mInit     = false;
};
