#pragma once

#include <maya/MPxNode.h>

// Two bone IK solver - the arm and the leg.
//
// A chain of two bones with its ends pinned has one degree of freedom left: the
// whole thing can spin around the line from the root to the goal. The pole is
// what picks a position out of that circle - it says which way the knee points.
// Everything else is the law of cosines.
//
//     d  = |goal - root|
//     A  = acos((L1^2 + d^2 - L2^2) / (2 * L1 * d))     at the root
//     x  = the direction from the root to the goal
//     u  = the part of (pole - root) across x, normalised
//     mid = root + L1 * (cos(A) * x + sin(A) * u)
//
// There is no sign anywhere in that, and no axis is assumed. A mirrored side
// solves correctly because its geometry is mirrored - not because a multiplier
// was found for it by hand.
//
// Nothing is baked at build time either: the lengths and the poses are inputs,
// so moving a poser moves the solve with it and the rig does not need to be
// rebuilt. That is the whole point of this autorig, and a solver that stored
// its rest pose would take it away.
//
// --- the length of the chain -----------------------------------------------
//
// The same formula the module builds out of twenty nodes today:
//
//     L    = lengthA * length1 + lengthB * length2
//
// The lengths come in as the module has them built, and the matrices in world
// space, so the two are only in the same units while the module is at scale 1.
// `scale` is what tells them apart: the length maths is done in the units of
// the module, and what comes out of it is taken back to world. Without it a
// scaled poser makes the bones change length on their own.
//     s    = the softIk zone, softIk 0..20 remapped to 0.001..2
//     da   = L - s                       where the softening starts
//
//     softIk > 0:  d_soft = da + s * (1 - e^(-(d - da) / s))
//     softIk = 0:  d_soft = L
//
//     d past that point:  factor = d / d_soft, otherwise 1
//     factor = 1 + (factor - 1) * autoStretch
//
// With softIk off the chain keeps its length until it is straight and stretches
// after that. With softIk on it starts stretching before it is straight and
// never quite straightens, which is what takes the snap out.
//
// `snap` then pulls the two lengths towards the distances to the pole, so at 1
// the knee sits exactly on it.
//
// --- IK and FK --------------------------------------------------------------
//
// `ikFk` blends the whole thing with the FK chain, which comes in as three
// world matrices: 1 is IK, 0 is FK. Positions are interpolated, orientations
// slerped. With it inside the node the module needs neither the duplicate chain
// of joints the constraints blended between, nor the constraints themselves.
//
// `fkElbowAutoTwist` is what makes the FK bones roll by themselves, the way
// they do under IK. Each bone aims at the next control with its Z turned
// towards the far end of the chain - so both bones share one plane, which is
// exactly what the solver gives them. It is the same construction the module builds out of
// two locators, two aim constraints and two pairBlends; here it is the frame
// the node was going to build anyway.
//
// The stretch goes with it: at FK the factor is 1, the way `ikfk_blend` of the
// module has it, so FK keeps the bones at their built length.
//
// --- the offset of the knee -------------------------------------------------
//
// `midOffset` moves the knee wherever it is told, after everything else. The
// bones do not keep their lengths through it - they follow the new point and
// reach from the root to it and from it to the end, so the wrist stays on the
// goal. Stated in the frame of the solved knee (X along the first bone, Z along
// the normal of the plane), so it travels with the limb.
class PkLimbIkNode : public MPxNode
{
public:
    static void*   creator();
    static MStatus initialize();

    MStatus compute(const MPlug& plug, MDataBlock& data) override;

    // --- inputs ------------------------------------------------------------
    static MObject aRootMatrix;     // where the chain starts
    static MObject aGoalMatrix;     // where its end has to get to
    static MObject aPoleMatrix;     // which way the knee points
    static MObject aLengthA;        // root to knee, as the rig is built
    static MObject aLengthB;        // knee to end
    static MObject aLength1;        // what the animator scales them by
    static MObject aLength2;
    static MObject aScale;          // the scale of the module, as its poser sets it
    static MObject aAutoStretch;    // how much of the stretch is let through
    static MObject aSoftIk;         // 0 - none, 20 - the whole zone
    static MObject aSnap;           // pulls the knee onto the pole
    static MObject aStretchVolume;  // how much the bones thin out as they stretch
    static MObject aMidOffset;      // moves the knee, after everything else
    static MObject aMidOffsetX, aMidOffsetY, aMidOffsetZ;

    // The rig decides which way the joints are oriented around the bone, and it
    // is not the solver's business to guess. These are measured off the rig
    // itself and applied to the IK frames before anything is blended: whatever
    // convention the joints follow, the solve arrives in it.
    static MObject aRootOrient;
    static MObject aMidOrient;
    static MObject aEndOrient;

    // What the joints hang from, and how they are oriented at rest. With these
    // the node hands out local values straight away - no multMatrix and no
    // decomposeMatrix per joint outside, and the two inverses of the chain it
    // needs it already has.
    static MObject aParentInverseMatrix;
    static MObject aRootJointOrient;
    static MObject aRootJointOrientX, aRootJointOrientY, aRootJointOrientZ;
    static MObject aMidJointOrient;
    static MObject aMidJointOrientX, aMidJointOrientY, aMidJointOrientZ;
    static MObject aEndJointOrient;
    static MObject aEndJointOrientX, aEndJointOrientY, aEndJointOrientZ;
    static MObject aRotateOrder;

    // Куда встать группе среднего контрола: он должен сидеть на локте ДО
    // своего же смещения, иначе уезжает вдвое - сам сдвинул локоть, за локтем
    // поехала группа, и он оказался вдвое дальше.
    static MObject aMidCtrlParentInverseMatrix;

    static MObject aIkFk;           // 1 - IK, 0 - FK
    static MObject aFkRootMatrix;   // the FK chain, as it already stands
    static MObject aFkMidMatrix;
    static MObject aFkEndMatrix;
    static MObject aFkElbowAutoTwist;  // how much the FK bones roll by themselves

    // Which side this is. Set once, from the rig - the module already has the
    // flag - rather than worked out from the matrices on every evaluation: it
    // changes when the rig is built, never while it is animated. Everything the
    // mirrored side needs is skipped outright when this is off.
    static MObject aMirrored;

    // --- outputs -----------------------------------------------------------
    // World matrices of the three joints. Orientation follows the convention of
    // the rig: X down the bone, Z along the normal of the plane the chain bends
    // in, Y across.
    static MObject aOutRootMatrix;
    static MObject aOutMidMatrix;
    static MObject aOutEndMatrix;

    // The end before the FK blend - pure IK, whatever ikFk says. The reverse
    // foot hangs off this: it only ever works in IK, and in the stock rig it
    // followed the IK chain, which the blend never touched.
    static MObject aOutIkEndMatrix;

    // The same, as local channels - what goes straight onto the joints.
    static MObject aOutTranslate;   // multi, 0 root, 1 mid, 2 end
    static MObject aOutTranslateX, aOutTranslateY, aOutTranslateZ;
    static MObject aOutRotate;
    static MObject aOutRotateX, aOutRotateY, aOutRotateZ;

    // What is left of the bones across their own axis when they stretch: the
    // length they were built with over the length they ended up with. 1 when
    // nothing stretched. Meant for the scaleY and scaleZ of the volume joints -
    // not of the bones themselves, or it would scale the twist chain with them.
    static MObject aOutVolumeA;
    static MObject aOutVolumeB;

    // What the bones ended up being - the same numbers the module puts on
    // b_ikJoint.tx and end_ikJoint.tx today
    static MObject aOutLengthA;
    static MObject aOutLengthB;

    // Where the knee is before `midOffset` moves it, in the space of whatever
    // the middle control hangs from.
    static MObject aOutMidBaseTranslate;
    static MObject aOutMidBaseTranslateX, aOutMidBaseTranslateY, aOutMidBaseTranslateZ;
    static MObject aOutMidBaseRotate;
    static MObject aOutMidBaseRotateX, aOutMidBaseRotateY, aOutMidBaseRotateZ;

    // How far the goal is compared to what the chain can reach: 1 is exactly
    // straight, more than 1 means the goal is out of reach.
    static MObject aOutReach;
};
