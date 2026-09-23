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
// stretch lets the chain give a little when it is pulled hard and gather up
// when it is shoved, and it does none of that in the simulation: the solve
// stays rigid, and only the finished points are slid along the chain
// afterwards. Directions are untouched, so every rotation the chain had it
// still has - what was tuned stays tuned - and only the distances change.
//
// What it goes by is how hard the segment is being pulled apart. The pull piles up while it lasts and lets go
// when it ends, in its own time - stretchRelease, in frames - and that time
// is what decides how much the give carries past its rest on the way back.
// Let go slowly and the chain merely follows the pull home; let go at once
// and whatever speed it had takes it straight past. Short is the whip, long
// is the rubber band.
//
// The give itself is a spring, not a fading memory, which is what lets it
// arrive at its length, carry on past it and swing back. stretchSpeed is how
// fast that swing is, stretchDamping how much of it there is at all.
// stretchSpread hands the give around the chain: a chain dragged by its root
// is pulled almost entirely at the root and one swung around at the tip, and
// at 1 every segment gives the same share of its own length instead.
//
// Three of these work themselves out when left at 0, which is where they
// start: stretchSpeed takes the chain's own frequency, held between three and
// eight frames; stretchRelease takes a frame; stretchLimit takes whatever
// stretch could ask for, so it only ever catches the wild ones.
//
// maxBend is how far a bone may turn away from where the goals put it against
// the one before it. The first bone is measured against its control rather
// than against nothing, so a chain whose root is yanked away cannot answer by
// folding that bone back onto the rest. bendSoftness is how the limit is met:
// at 0 it is a wall, which shows as a corner at one joint, and turned up it
// starts pushing back before it is reached, so the corner becomes a tight but
// smooth arc. The limit itself is never passed either way.
//
// dampingEven is what keeps the ramp from doing two jobs at once. A point the
// ramp made soft swings slower, and a slower swing takes longer to die down
// at the same ratio - so a soft tip not only trails further, which is wanted,
// but also keeps going long after the root is still, which is not, and the
// two cannot be told apart from one slider. At 1 the ratio of each point is
// raised by exactly as much as the ramp slowed it, so every point settles in
// the time damping asks for and the ramp is left to do nothing but shape the
// trail. At 0 the ratio is the same everywhere, as it used to be.
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
// weightRamp is how much of the simulation each point along the chain is
// given: at 0 the point sits on its control and is not simulated at all, at 1
// it is where the solve put it. It is drawn along the chain the way the
// stiffness ramp is, and it is what shapes how far each bone swings - which
// the stiffness ramp also did, but could not do without giving every point a
// frequency of its own and setting them all swinging out of step. With the
// shape drawn here instead, the stiffness can be left even, every point keeps
// the same beat, and the chain settles as one piece.
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
// followTranslate and followRotate take the motion of spaceMatrix into the
// simulated points, so the chain rides along with it instead of lagging
// behind it. They are apart because a chain answers the two quite
// differently: turn the root and every bone is moved across itself, which is
// what a chain lags behind freely; move the root along the chain and the
// lengths let nothing lag at all, so the whole answer arrives at once when
// the move stops. One number could never suit both. At 0 the chain lags
// behind everything, the way nucleus does it; at 1 that part of the motion is
// carried and leaves no wake at all. followSpace is what the two grew out of,
// kept so older scenes still open: whichever is the larger applies.
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
    static MObject aWeightRamp;       // and how much of that each point along the chain gets
    static MObject aStiffness;        // the whole chain, 0..1
    static MObject aStiffnessRamp;    // curve along the chain, root to tip
    static MObject aDamping;          // damping ratio, 1 - critical
    static MObject aDampingEven;      // 1 - every point settles in the same time
    static MObject aGravity;          // units / s^2
    static MObject aGravityDirection;
    static MObject aGravityDirectionX, aGravityDirectionY, aGravityDirectionZ;
    static MObject aStretch;          // how much the chain gives under a pull
    static MObject aStretchLimit;     // and how far it may ever give
    static MObject aStretchSpeed;     // how fast the give comes back
    static MObject aStretchDamping;   // 1 - it comes back without overshooting
    static MObject aStretchSpread;    // 1 - every segment gives the same share
    static MObject aStretchRelease;   // frames the pull takes to let go
    static MObject aMaxBend;          // how far one bone may turn from the one before it
    static MObject aBendSoftness;     // 0 - a wall at that angle, 1 - resistance all the way
    static MObject aSubsteps;         // steps per frame
    static MObject aSpaceMatrix;
    static MObject aFollowSpace;      // what the two below grew out of, kept for old scenes
    static MObject aFollowTranslate;  // how much of the space's move the chain just rides
    static MObject aFollowRotate;     // the same for the space turning
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
        std::vector<double>  slack;   // how far each segment is giving right now
        std::vector<double>  slackVel;// and how fast that is changing
        std::vector<double>  pull;    // and how much it is being asked to give
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
        std::vector<double> zeta;     // damping ratio per point

        // Everything starts at nothing: a field read before it is filled in
        // is a bug that hides until the memory under it happens to change,
        // and one of those cost an afternoon.
        double damping = 0.0, maxBend = 3.15, bendSoftness = 0.0;
        double followTranslate = 0.0, followRotate = 0.0;
        double stretch = 0.0, stretchLimit = 0.0, stretchSpeed = 0.0;
        double stretchDamping = 0.0, stretchSpread = 0.0, stretchRelease = 0.0;
        double stiffW = 0.0;          // the chain's own frequency, for the auto settings
        MVector gravity;              // units / frame^2
        int substeps = 1;
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
