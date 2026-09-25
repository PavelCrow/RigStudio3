#pragma once

#include <maya/MMatrix.h>
#include <maya/MPoint.h>
#include <maya/MPxNode.h>
#include <maya/MQuaternion.h>

// Jiggle of one bone - a belly, a cheek, a jaw of fat: the bone follows where
// the rig puts it, but with weight of its own, so it arrives late and settles
// with a shake.
//
// The chain node next door cannot do this and should not: there the root is
// pinned to its control and the lengths hold, which is what a tail is. A belly
// is the other thing - one point on a spring, free in all three directions,
// nothing holding its distance to anything.
//
// --- what comes in and what goes out ----------------------------------------
//
// inMatrix is where the bone would be with no jiggle at all: usually a
// transform that sits where the bone sits and rides the rig.
//
// outMatrix goes into the bone's offsetParentMatrix. When parentInverseMatrix
// is connected the output is already in the parent's space, so the bone can
// stay where it is in the skeleton - nothing has to be unparented, and its own
// local transform still belongs to the animator. Left alone, the output is in
// the world.
//
// The scale and the shear of inMatrix are passed through untouched: only where
// the bone sits and which way it faces is simulated.
//
// --- the spring -------------------------------------------------------------
//
// The same one the chain has, so the numbers mean the same thing:
//
//     w  = sqrt(kMaxK) * stiffness
//     x'' = -w^2 * (x - goal) - 2 * damping * w * x'
//
// solved exactly over the step, so substeps change nothing about the result -
// they only matter when the rig itself jumps within a frame. damping is a
// ratio: 0 never settles, 1 comes home without overshooting. stiffness goes
// through a square, so the soft end of the slider is not squeezed into its
// first tenth.
//
// translate and rotate are how much of the jiggle is kept, each on its own: a
// cheek wants the first and not the second, a jaw wants both. rotate springs
// the orientation the same way - the error from the goal, taken as an axis and
// an angle, with the angle on that same spring.
//
// --- what keeps it in hand --------------------------------------------------
//
// limit is how far the bone may ever be from where the rig put it, in units. 0
// leaves it alone. It is a wall, not a spring: something has to stop a jiggle
// that was given a stiffness of 0.01 and a body that teleports.
//
// axisScale is how much of the jiggle each direction gets, and the directions
// are the goal's own: 1, 1, 1 jiggles everywhere, 0, 1, 1 only across its own
// X. A cheek that should wobble up and down but not slide along the face is
// this and nothing else.
//
// gravity is in units per second squared, and it is what makes fat hang: with
// a soft spring the bone sits a little below where the rig holds it.
//
// --- time -------------------------------------------------------------------
//
// At startFrame and before it, when time runs back, and when enable is off,
// the bone is put on its goal and left there. Going forward by more than a
// frame is simulated through; the same frame asked for twice redoes that one
// step from the state it started in, so re-evaluating never pushes the
// simulation on and a control moved on a paused frame is followed at once.
class PkJiggleNode : public MPxNode
{
public:
    static void*   creator();
    static MStatus initialize();

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
    static MObject aWeight;           // 0 - the rig's pose, 1 - the jiggle
    static MObject aStiffness;        // 0..1
    static MObject aDamping;          // damping ratio, 1 - critical
    static MObject aTranslate;        // how much of the jiggle the position takes
    static MObject aRotate;           // and the orientation
    static MObject aLimit;            // units, 0 - no wall
    static MObject aAxisScale;        // per direction, in the goal's own axes
    static MObject aAxisScaleX, aAxisScaleY, aAxisScaleZ;
    static MObject aGravity;          // units / s^2
    static MObject aGravityDirection;
    static MObject aGravityDirectionX, aGravityDirectionY, aGravityDirectionZ;
    static MObject aSubsteps;
    static MObject aInMatrix;
    static MObject aParentInverse;    // if connected, the output is in that space

    // --- outputs -----------------------------------------------------------
    static MObject aOutMatrix;

private:
    // The step of one oscillator as a 2x2 matrix on (offset from the goal,
    // velocity) - the closed form, so the step size is not part of the answer.
    struct Step
    {
        double dd, dv;
        double vd, vv;
    };

    static Step solveStep(double w, double zeta, double h);

    struct State
    {
        MPoint      pos;
        MVector     vel;              // per frame
        MQuaternion spin;             // where the orientation is against its goal
        MVector     spinVel;          // axis times radians per frame
        MPoint      goal;
        MQuaternion goalSpin;
    };

    void reset(const MPoint& goal, const MQuaternion& spin);

    State  mBase;                     // what the last frame started from
    State  mCur;
    double mLastTime = 0.0;
    double mLastDt   = 0.0;
    bool   mInit     = false;
};
