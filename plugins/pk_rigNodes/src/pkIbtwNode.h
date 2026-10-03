#pragma once

#include <maya/MPxNode.h>

#include <vector>

// Local inbetween solver - replaces the whole DG network of one local
// inbetween (see modules/_psdLocal.ma and inbetweens.py) with a single node.
//
// The driver is the local rotation of one joint. The corrective joints hang
// directly under it, so they inherit its rotation; the node gives each of them
// back a rotation of its own (how much it follows the joint is `bind`) and a
// position.
//
// A corrective can be told to mirror another one of the same node: `mirrorOf`
// holds its index, and then the angles, the positions and the swing are read
// off that one with their signs flipped - the two end up reflected in the plane
// the bone and the other axis lie in. It is what the two sides of a centre bone
// want: the spine answers to the left and to the right the same way, and the
// pair is tuned in one place. `bind` and `reverse` come from the same place
// unchanged, and nothing else is needed - no sign node per channel, and on a
// mirrored side the whole element of the array already arrives by one
// connection, `mirrorOf` with it.
//
// Geometry of one corrective joint, in the frame of the driver:
//
//     radius r along Y (or Z), then swung around the joint origin by `swing`,
//     so it travels along a circle of radius r towards the bone (+X) instead of
//     sliding along it:
//
//         axis Y:  p = ( r*sin(swing),  r*cos(swing),  0            )
//         axis Z:  p = ( r*sin(swing),  0,             r*cos(swing) )
//
//     and then that position, and the orientation with it, is rotated back by
//     `1 - bind` of the driver rotation. The joint is a child of the driver, so
//     this is what puts it between the bone and its parent: at bind 0.5 it
//     travels half the way the bone does, along the same circle `swing` moves
//     it along by hand. `swing` is left as an offset on top of that.
//
// The driver is read one of two ways, `driverMode`:
//
//     local  - `driverRotate`, the rotate channel of the joint the correctives
//              hang under. Its zero is the rest pose.
//     matrix - `childMatrix` and `parentInverseMatrix`, so the two can sit in
//              unrelated hierarchies and the driver can be a control, an IK
//              joint, anything with a world matrix. What counts as the rest
//              pose is `restMatrix` - the child stated in the space of the
//              parent as it was when the correctives were built. It is an
//              input, not a constant baked at build time, so a locator can
//              drive it and the neutral pose stays adjustable afterwards.
//
//     Both give the same thing: the rotation stated in the frame the child had
//     at rest, which is the frame the correctives live in.
//
// Driver angles: from a swing/twist decomposition of the driver rotation about
// the bone axis X, NOT from its euler channels - those only hold for a bend in
// one plane and stop being the bend angle once a twist is mixed in. Both are in
// degrees, zero in the default pose, and positive means the tip of the bone
// moved towards that axis:
//
//     bendY = angle * swingAxis.z
//     bendZ = -angle * swingAxis.y
//
// `mirrorAxis` lets the opposite side share the whole joint array of the left
// one through a single connection per joint. It holds the sign of each local
// axis of this joint against the mirror image of the axis of the left one - it
// is measured from the two joints when the mirror is connected, not assumed,
// because the right side of a rig is not always built the same way. It is (1,
// 1, 1) on the driving side and on a rig mirrored by a negative scale, where
// the local channels of the two sides are already equal.
//
// A vector of the left frame becomes D*v in this frame, D = diag(mirrorAxis),
// so the offset of the joint is mapped that way, the measured bend is read
// back into the left frame the same way before it drives the ramp, and the
// rotation offset is conjugated by D.
class PkIbtwNode : public MPxNode
{
public:
    static void*   creator();
    static MStatus initialize();

    MStatus compute(const MPlug& plug, MDataBlock& data) override;

    // --- inputs ------------------------------------------------------------
    static MObject aDriverMode;         // 0 = local rotate, 1 = matrices
    static MObject aDriverRotate;       // <- driver joint .rotate
    static MObject aDriverRotateX, aDriverRotateY, aDriverRotateZ;
    static MObject aDriverRotateOrder;  // <- driver joint .rotateOrder
    static MObject aChildMatrix;        // <- child .worldMatrix
    static MObject aParentInverseMatrix;// <- parent .worldInverseMatrix
    static MObject aRestMatrix;         // the child in parent space at rest

    // Where the rest comes from: 0 - `restMatrix` above, 1 - worked out of the
    // posers. The initLoc of a poser carries the frame the bone is built with,
    // so it states the default pose without the rig having to be put into it -
    // the inbetween can be made in any pose, and a poser moved afterwards
    // takes the neutral with it.
    //
    // The matrices are the world matrices of those initLocs. A joint of a twist
    // chain sits a share of the way along its bone, so `position` moves the
    // point from the initLoc of the bone towards the initLoc of its child -
    // 0 is the bone itself, 1 its far end. The axes are taken off the first one
    // and straightened: an initLoc of a mirrored side comes with a reflection
    // in it, so Z is rebuilt out of X and Y.
    //
    // Plain inputs, stored like any other: when the posers are baked away and
    // the connections go with them, the values that came last stay on the node
    // and the neutral does not move. `outRestMatrix` hands out what was worked
    // out, so baking can put it into `restMatrix` and switch `restMode` back to
    // 0 without repeating any of this.
    static MObject aRestMode;
    static MObject aRestChildMatrix;
    static MObject aRestChildEndMatrix;
    static MObject aRestChildPosition;
    static MObject aRestParentMatrix;
    static MObject aRestParentEndMatrix;
    static MObject aRestParentPosition;
    static MObject aOffsetRotate;       // shifts the neutral pose
    static MObject aOffsetRotateX, aOffsetRotateY, aOffsetRotateZ;
    static MObject aScale;              // scales every corrective position at once
    static MObject aMirrorAxis;         // per axis sign against the mirror of the left side
    static MObject aMirrorAxisX, aMirrorAxisY, aMirrorAxisZ;

    // Which corrective this one is the mirror of, -1 - none. A parallel array
    // and not a child of `joint`: maya writes the elements of that compound as
    // one flat list of values per element, so a scene saved before is read
    // crooked the moment it gains a child - the values slide over into the
    // neighbouring fields. Nothing may be added to `joint` any more.
    static MObject aMirrorOf;           // multi, indices match aJoint

    static MObject aJoint;              // multi compound, one per corrective joint
    static MObject aAxis;               //   0 = Y, 1 = Z
    static MObject aBind;               //   0 - keeps the parent frame, 1 - follows the bone
    static MObject aAngleMin, aAngleMax;
    static MObject aPosMin,   aPosMax;
    static MObject aSwingMin, aSwingMax;
    static MObject aReverse;

    // --- outputs -----------------------------------------------------------
    static MObject aOutBendY, aOutBendZ;    // the driver angles, for reading

    static MObject aOut;                // multi compound, indices match aJoint
    static MObject aOutTranslate;       //   -> .translate of the corrective joint
    static MObject aOutTranslateX, aOutTranslateY, aOutTranslateZ;
    static MObject aOutRotate;          //   -> .rotate of the corrective joint
    static MObject aOutRotateX, aOutRotateY, aOutRotateZ;
    static MObject aOutDriverAngle;     //   what this joint is driven by

    static MObject aOutRestMatrix;      // the rest it worked out, for baking

private:
    // Parameters of one corrective, read out of the array before anything is
    // worked out: one that mirrors another has to look at it, and jumping
    // around the array handle in the middle of the pass is not worth it.
    struct Param
    {
        unsigned int index;
        short        axis;
        double       bind;
        double       angleMin, angleMax;
        double       posMin,   posMax;
        double       swingMin, swingMax;
        bool         reverse;
        int          mirrorOf;
    };

    // kept on the node and only cleared: compute runs on every frame, and a
    // fresh vector every time is a heap allocation per inbetween per frame for
    // nothing
    std::vector<Param> mParams;
};
