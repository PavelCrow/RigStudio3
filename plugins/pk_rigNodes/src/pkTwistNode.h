#pragma once

#include <maya/MPxNode.h>
#include <maya/MQuaternion.h>
#include <maya/MVector.h>

#include <vector>

// Twist chain solver - one node drives the whole chain of twist joints of one
// bone from a single control sitting in the middle of it.
//
// The joints are a nested chain: joint 0 is a child of the bone, every next one
// a child of the one before. The only thing the node is told about a joint is
// its `position` - where it sits along the bone, 0 at the root and 1 at the
// child, the same meaning the `pos` attribute of the old twist has. Everything
// else is worked out from `boneTranslate`, the vector from the bone to its
// child:
//
//     rest position of a joint = (position - 0.5) * boneTranslate
//
// stated from the control, which sits at the middle of the bone. Nothing about
// the rest pose is baked in, so the chain follows the bone: stretch the bone
// and the joints spread evenly over the new length, move `position` and the
// joint travels along it.
//
// The node works out where every joint has to end up, in the frame of the bone,
// and only then turns that into the local translate and rotate of a nested
// chain. That order matters: driving the joints by local values directly makes
// the chain accumulate, and every joint after the first lands where its parents
// left it rather than where it belongs - the far end of the chain drifts.
//
// Two things move the joints, both weighted by a bell that is 1 in the middle
// of the bone and 0 at both of its ends:
//
//     weight(u) = sin(pi * u) ^ falloff
//
// falloff 1 is the plain bell; higher pulls the reaction towards the middle
// joints alone, lower spreads it over the whole chain. The ends stay pinned at
// any falloff - sin() is 0 there, and 0 to any power stays 0.
//
//   translate of the control - taken as it is, so the chain bulges towards it.
//
//   rotate of the control - split about the bone first, because the two halves
//   of a rotation do entirely different things here.
//
//     the swing, what turns the bone away from its axis, is taken as a
//     sideways shift and not as a rotation around the control: with the swing
//     as an axis n and an angle a, a joint at offset p is moved by
//
//         (n x p) * a
//
//     which is perpendicular to the bone and grows with the distance from the
//     control, linearly with the angle. Multiplied by the bell it is zero at
//     both ends of the chain and zero in its middle (p is zero there), with the
//     two halves going opposite ways - the S.
//
//     the twist, what turns around the bone itself, only rolls the joints and
//     never moves them: each one turns around its own axis by the angle times
//     the bell, so the middle follows the control and the ends stay put. This
//     is the half that (n x p) cannot carry at all - the cross product of two
//     parallel vectors is zero - so without the split a twist would be lost.
//
// Neighbouring bones twist the chain as well, which is what twist joints are
// for in the first place: the hand rolls and the forearm follows it, the
// shoulder rolls and the upper arm follows. `driver` is an array, so a chain
// can have one at each end - the upper arm answers to the shoulder above it and
// to the elbow below it at the same time.
//
// `driverRotate` is the rotate channel of that bone, `driverOrient` its
// jointOrient and `driverRest` what the rotate was when it was attached. All
// three are needed: the rotate channel of a joint turns around its own axes,
// which differ from the ones of the bone the chain hangs on by exactly that
// jointOrient. Ignore it and a hand whose jointOrient carries half a turn - a
// mirrored side - twists the chain the wrong way.
//
// The difference is then taken in the frame the joints hang in:
//
//     driver above the chain:  q * rest.inverse()
//     driver below the chain:  rest.inverse() * q      (q = rotate * orient)
//
// The order is not interchangeable. The one above states the change in the
// frame of the bone itself, which is what its children get; the one below
// states the change of the child in the frame of the bone. Swap either and the
// axis comes out turned by the rest pose - harmless while that pose is small, a
// change of sign once it approaches half a turn.
//
// Only the part of that difference which turns around the bone is taken - a
// bend of the elbow must not leak into the twist. It is spread linearly from
// the end the driver sits at, `driverPosition`, to the other one:
//
//     ramp(u) = 1 - |u - driverPosition| / max(driverPosition, 1 - driverPosition)
//
// so 1 puts the full twist at the child end and none at the root, 0 the other
// way round, and 0.5 makes a tent with the middle of the bone following the
// driver. `driverAmount` scales the whole thing.
//
// `driverInherited` says whether the chain is already turning with the driver.
// It is, whenever the driver is the bone the chain hangs from or something
// above it: the joints are its children and they carry its whole rotation
// before the node says anything. Then the twist has to be taken away towards
// the far end rather than added towards the near one - the shoulder keeps its
// roll, the elbow gives it up:
//
//     out = driverAngle * (ramp(u) - (driverInherited ? 1 : 0))
//
// summed over the drivers.
//
// With the hand driving a forearm nothing is inherited - the hand is below the
// chain, not above it - and the same formula just adds the twist towards the
// wrist. What the control does and what the driver does are independent and
// simply add up.
//
// Orientation is not given by the control at all: every joint looks along the
// tangent of the curve the chain lies on - the smooth form of "halfway between
// where it comes from and where it goes". It is worked out from the formula
// rather than from the joints around it, and it is stated as a small turn from
// the bone onto that tangent - the joints are built with the orientation of the
// bone and keep it, the node only adds the deformation on top. Turning them
// onto the tangent from the X axis instead would put half a turn on every joint
// of a side whose bones run the other way, and the two sides would stop being
// mirrors of each other. At rest the tangent is the bone itself, so nothing is
// added at all.
class PkTwistNode : public MPxNode
{
public:
    static void*   creator();
    static MStatus initialize();

    MStatus compute(const MPlug& plug, MDataBlock& data) override;

    // --- inputs ------------------------------------------------------------
    static MObject aCtrlTranslate;      // <- the control .translate
    static MObject aCtrlTranslateX, aCtrlTranslateY, aCtrlTranslateZ;
    static MObject aCtrlRotate;         // <- the control .rotate
    static MObject aCtrlRotateX, aCtrlRotateY, aCtrlRotateZ;
    static MObject aCtrlRotateOrder;    // <- the control .rotateOrder
    static MObject aBoneTranslate;      // <- .translate of the child of the bone
    static MObject aBoneTranslateX, aBoneTranslateY, aBoneTranslateZ;
    static MObject aFalloff;            // exponent of the bell

    // one element per bone that twists the chain, any number of them
    static MObject aDriver;
    static MObject aDriverRotate;       // <- .rotate of the bone that twists the chain
    static MObject aDriverRotateX, aDriverRotateY, aDriverRotateZ;
    static MObject aDriverRotateOrder;  // <- .rotateOrder of that bone
    static MObject aDriverRest;         // what it was when it was attached
    static MObject aDriverRestX, aDriverRestY, aDriverRestZ;
    static MObject aDriverOrient;       // <- .jointOrient of that bone
    static MObject aDriverOrientX, aDriverOrientY, aDriverOrientZ;
    static MObject aDriverPosition;     // which end of the chain it sits at
    static MObject aDriverAmount;       // how much of its twist reaches the chain
    static MObject aDriverInherited;    // the chain already turns with the driver

    // one element per twist joint, in the order of the chain
    static MObject aJoint;
    static MObject aPosition;           //   0 at the root of the bone, 1 at its child

    // --- outputs -----------------------------------------------------------
    static MObject aOut;                // multi compound, indices match aJoint
    static MObject aOutTranslate;       //   -> .translate of the twist joint
    static MObject aOutTranslateX, aOutTranslateY, aOutTranslateZ;
    static MObject aOutRotate;          //   -> .rotate of the twist joint
    static MObject aOutRotateX, aOutRotateY, aOutRotateZ;
    static MObject aOutWeight;          //   what the bell gives this joint, for reading

private:
    // One joint of the chain, read out of the array before anything is worked
    // out: the pass that places a joint needs the one after it.
    struct Item
    {
        unsigned int index;
        double       weight;      // the bell, what the control reaches it with
        double       driverRoll;   // what the neighbouring bones add up to here
        MVector      position;  // where it has to end up, relative to the control
        MVector      tangent;   // where the curve goes there - what it aims along
        MQuaternion  rotation;  // where it has to look, in the frame of the bone
    };

    // one driver, already worked out - the same for every joint of the chain
    struct Driver
    {
        double angle;
        double position;
        double inherited;
    };

    std::vector<Driver> mDrivers;

    // kept on the node and only cleared: compute runs on every frame, and a
    // fresh vector every time is a heap allocation per chain per frame for
    // nothing. One node is never computed by two threads at once, so this is
    // safe under parallel evaluation.
    std::vector<Item> mItems;
};
