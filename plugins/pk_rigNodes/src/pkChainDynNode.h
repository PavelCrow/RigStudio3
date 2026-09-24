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
//     w  = sqrt(kMaxK) * stiffness              the frequency of the spring
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
// Three of these work themselves out when left at 0, which is where they
// start: stretchSpeed takes the chain's own frequency, held between three and
// eight frames; stretchRelease takes a frame; stretchLimit takes whatever
// stretch could ask for, so it only ever catches the wild ones.
//
// Every point gets the same spring, and that is the whole of it. A curve of
// stiffness along the chain was tried and thrown out: a point made soft by it
// swings at a frequency of its own, so the chain no longer settles as one piece.
// Measured on twelve points with a sloped curve, the tip was still moving at
// frame 39 while the base was done at 12, and in the middle the points spent
// between a third and two thirds of the time moving against the tip. With one
// spring for all of them every point is in step with every other, all of them
// settle on the same frame, and the shape of the trail is drawn by weightRamp
// instead - which does it without touching anybody's frequency.
//
// dampingEven went with it. It existed to give a point back the damping the
// stiffness curve took away, so it only ever did anything while that curve had
// a slope - with the flat curve the output was the same to the ninth digit
// either way. And where it did act it did not deliver what it promised: raising
// the ratio made the tip creep home instead of swinging home, and it settled at
// frame 113 rather than 39.
//
// maxBend is how far a bone may turn away from where the goals put it against
// the one before it. The first bone is measured against its control rather
// than against nothing, so a chain whose root is yanked away cannot answer by
// folding that bone back onto the rest. bendSoftness is how the limit is met:
// at 0 it is a wall, which shows as a corner at one joint, and turned up it
// starts pushing back before it is reached, so the corner becomes a tight but
// smooth arc. The limit itself is never passed either way.
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
//
// Within a frame the goals are interpolated between the last frame and this
// one, so the substeps see the motion, not just its end.
//
// weightRamp is how much of the simulation each point along the chain is
// given: at 0 the point sits on its control and is not simulated at all, at 1
// it is where the solve put it. It is what shapes how far each bone swings,
// and it does that without giving anybody a frequency of their own: every
// point keeps the same beat and the chain settles as one piece. How much
// swinging there is at all is the stiffness, how it is shared out along the
// chain is this curve.
//
// --- collision --------------------------------------------------------------
//
// collider is a list, so a shape too awkward for one primitive is built out of
// several: the floor as a plane, the head as a sphere, a thigh as a capsule.
// Each takes a matrix, so every one of them can be parented and animated for
// nothing, and a radius of its own.
//
// A point that has gone inside is pushed out the shortest way, and its velocity
// loses what was going in - bounce says how much of that comes back instead,
// friction how much of the sliding along is taken away. thickness is the
// chain's own radius: the points are kept that far off every surface, and
// thicknessRamp is how much of it each point along the chain has - a tail that
// tapers touches the floor with its tip long after its base would.
//
// The pushing happens twice over: a point squeezed between two colliders is put
// back inside the first by the second, and one round would leave it there. It
// also happens twice in the frame, and for two different reasons. Inside the
// substep, right after the lengths, so the collision is part of the simulation
// - the chain carries on with the velocity it should have, and the next substep
// puts the lengths back. And once at the very end, after the weight curve and
// the stretch, because both of those move finished points and would otherwise
// put them straight back through the surface: the weight curve pulls a point
// towards its control, and the control can be anywhere. So the surface wins
// over the weight curve - which is what is wanted of a floor, and worth knowing
// before wondering why a point with weight 0.2 still will not go through it.
//
// The root is left alone. It is pinned to its control and belongs to the
// animator, not to the solver.
//
// outThickness is what the standoff of each point came out as - thickness times
// the curve at that point. It is there so the thing that draws the chain's own
// volume can take the number from the solver instead of working it out again:
// one source, so the picture cannot drift from what is really kept off the
// surfaces, and it follows both the slider and the curve without anything being
// rebuilt.
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
// localTranslate and localRotate say how much of the chain's work happens in
// the space of spaceMatrix rather than in the world. What the space did since
// the last frame is carried into the simulated points, so the chain rides
// along with it instead of lagging behind it.
//
// They are apart because a chain answers the two quite differently: turn the
// root and every bone is moved across itself, which is what a chain lags
// behind freely; move the root along the chain and the lengths let nothing
// lag at all, so the whole answer arrives at once when the move stops. One
// number could never suit both. At 0 the chain lags behind everything, in the
// world, the way nucleus does it.
//
// --- more points than controls ----------------------------------------------
//
// outputCount asks for more points than the goals give. A Catmull-Rom curve
// is laid through the goals, and each point takes its place on it by length,
// with a frame of its own: the turn from one goal to the next, taken part of
// the way, so the twist and the scale of the controls are carried along. The
// simulation then runs on those points, not on the controls - ten bones on
// three controls can each lag on their own instead of repeating three
// motions.
//
// position says where each of them sits, from 0 at the root to 1 at the tip.
// Left alone they are spread evenly, which is what the chain is built with;
// set, they go where they are put, and a bone can be slid to where the
// geometry needs it without changing anything else. It is the `pos` of the
// joint in the rig, the same thing the spine has.
//
// The frames are then aimed along the curve: the X axis of a control is the
// one that runs down the chain, and it is turned onto the tangent. So a
// control that is moved and not turned still bends the bones with it, while
// the twist stays whatever the controls have. With one point per control
// nothing of this happens - there the control's own matrix is the frame.
//
// X and not a choice of axis: the rig builds its chains along X, and the
// attribute that used to offer the other five was never set by anything.
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
    static MObject aDamping;          // damping ratio, 1 - critical
    static MObject aGravity;          // units / s^2
    static MObject aGravityDirection;
    static MObject aGravityDirectionX, aGravityDirectionY, aGravityDirectionZ;
    static MObject aStretch;          // how much the chain gives under a pull
    static MObject aStretchLimit;     // and how far it may ever give
    static MObject aStretchSpeed;     // how fast the give comes back
    static MObject aStretchDamping;   // 1 - it comes back without overshooting
    static MObject aStretchRelease;   // frames the pull takes to let go
    static MObject aMaxBend;          // how far one bone may turn from the one before it
    static MObject aBendSoftness;     // 0 - a wall at that angle, 1 - resistance all the way
    static MObject aSubsteps;         // steps per frame
    static MObject aSpaceMatrix;
    static MObject aLocalTranslate;   // how much of the space's move the chain just rides
    static MObject aLocalRotate;      // the same for the space turning
    static MObject aGoalMatrix;       // multi, root first
    static MObject aOutputCount;      // 0 - one point per goal
    static MObject aPosition;         // multi: where along the chain each point sits
    static MObject aCollide;          // 0 - off, 1 - the points stay out of the colliders
    static MObject aThickness;        // the chain's own radius
    static MObject aThicknessRamp;    // and how much of it each point along it has
    static MObject aBounce;           // 0 - the surface takes the speed, 1 - hands it back
    static MObject aFriction;         // how much of the sliding along is taken away
    static MObject aCollider;         // multi compound, one per collider
    static MObject aColliderType;     // plane / sphere / capsule
    static MObject aColliderMatrix;   // where it sits; a plane faces its own Y
    static MObject aColliderRadius;
    static MObject aColliderLength;   // capsule only, along its Y

    // --- outputs -----------------------------------------------------------
    static MObject aOutMatrix;        // multi, world
    static MObject aOutThickness;     // multi: the standoff of each point

private:
    // A collider as the solve wants it: already in the world, already
    // measured, nothing left to work out per point per substep.
    struct Collider
    {
        short   type = 0;             // 0 plane, 1 sphere, 2 capsule
        MPoint  o;                    // where it is
        MVector n;                    // plane: the way out; capsule: half its axis
        double  radius = 0.0;
    };

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
        // one spring for the whole chain: every point has the same frequency,
        // so they stay in step and the step itself is worked out once
        double k = 0.0;               // spring, 1 / frame^2
        double w = 0.0;               // its frequency, sqrt(k)
        double zeta = 0.0;            // damping ratio

        // Everything starts at nothing: a field read before it is filled in
        // is a bug that hides until the memory under it happens to change,
        // and one of those cost an afternoon.
        double damping = 0.0, maxBend = 3.15, bendSoftness = 0.0;
        double localTranslate = 0.0, localRotate = 0.0;
        double stretch = 0.0, stretchLimit = 0.0, stretchSpeed = 0.0;
        double stretchDamping = 0.0, stretchRelease = 0.0;
        double collide = 0.0, bounce = 0.0, friction = 0.0;
        std::vector<double>   pad;     // thickness per point, along the chain
        std::vector<Collider> colliders;
        MVector gravity;              // units / frame^2
        int substeps = 1;
    };

    // The goals of the simulated points: the controls themselves, or the
    // curve through them cut at `along` - a place from 0 to 1 for each point.
    static void resample(const std::vector<MMatrix>& ctrl,
                         const std::vector<double>& along,
                         std::vector<MMatrix>& out);

    // The curves, sampled at the points the chain has now.
    void readCurves(MDataBlock& data, size_t n);

    // How deep the point is inside this collider, and which way is out.
    static bool depthOf(const Collider& c, const MPoint& p, double pad,
                        MVector& dir, double& depth);

    // Every point out of every collider. vel is given inside the simulation,
    // where the collision is to be felt, and left out at the end of the frame,
    // where it only has to hold.
    static void pushOut(std::vector<MPoint>& pos, std::vector<MVector>* vel,
                        const Params& p);

    void reset(const std::vector<MPoint>& goals, const MMatrix& space);
    static void simulate(State& s, const std::vector<MPoint>& goals,
                         const MMatrix& space, double dt, const Params& p);

    // Asking a ramp for a value goes through the graph, and it is asked once
    // per point per evaluation - more than all the arithmetic it feeds. The
    // curves are drawn once and then stand still, so they are sampled once
    // and kept here.
    //
    // What tells us they changed is the points themselves, read out of the
    // data block, which is cheap and never missed. Being told instead - by
    // the dirty callback - is not reliable here: the node is dirty every
    // frame from time alone, and Maya has no reason to walk the same dirt
    // again to mention the curve.
    std::vector<double> mWeightCurve;
    std::vector<double> mThickCurve;
    std::vector<double> mCurveMark;   // the ramps as they were when sampled
    size_t mCurveCount = 0;

    State  mBase;                     // what the last frame started from
    State  mCur;
    double mLastTime = 0.0;
    double mLastDt   = 0.0;
    bool   mInit     = false;
};
