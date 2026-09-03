#pragma once

#include <maya/MPxNode.h>

// Local inbetween solver - replaces the whole DG network of one local
// inbetween (see modules/_psdLocal.ma and inbetweens.py) with a single node.
//
// The driver is the local rotation of one joint. The corrective joints hang
// directly under it, so they inherit its rotation; the node gives each of them
// back a rotation of its own (how much it follows the joint is `bind`) and a
// position.
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
    static MObject aDriverRotate;       // <- driver joint .rotate
    static MObject aDriverRotateX, aDriverRotateY, aDriverRotateZ;
    static MObject aDriverRotateOrder;  // <- driver joint .rotateOrder
    static MObject aOffsetRotate;       // shifts the neutral pose
    static MObject aOffsetRotateX, aOffsetRotateY, aOffsetRotateZ;
    static MObject aScale;              // scales every corrective position at once
    static MObject aMirrorAxis;         // per axis sign against the mirror of the left side
    static MObject aMirrorAxisX, aMirrorAxisY, aMirrorAxisZ;

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
};
