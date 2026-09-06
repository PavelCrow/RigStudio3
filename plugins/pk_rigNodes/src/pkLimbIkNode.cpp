#include "pkLimbIkNode.h"

#include <maya/MArrayDataBuilder.h>
#include <maya/MEulerRotation.h>
#include <maya/MFnEnumAttribute.h>
#include <maya/MFnMatrixAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MFnUnitAttribute.h>
#include <maya/MMatrix.h>
#include <maya/MPoint.h>
#include <maya/MQuaternion.h>
#include <maya/MTransformationMatrix.h>
#include <maya/MVector.h>

#include <algorithm>
#include <cmath>

MObject PkLimbIkNode::aRootMatrix;
MObject PkLimbIkNode::aGoalMatrix;
MObject PkLimbIkNode::aPoleMatrix;
MObject PkLimbIkNode::aLengthA;
MObject PkLimbIkNode::aLengthB;
MObject PkLimbIkNode::aLength1;
MObject PkLimbIkNode::aLength2;
MObject PkLimbIkNode::aScale;
MObject PkLimbIkNode::aAutoStretch;
MObject PkLimbIkNode::aSoftIk;
MObject PkLimbIkNode::aSnap;
MObject PkLimbIkNode::aStretchVolume;
MObject PkLimbIkNode::aMidOffset;
MObject PkLimbIkNode::aMidOffsetX, PkLimbIkNode::aMidOffsetY, PkLimbIkNode::aMidOffsetZ;
MObject PkLimbIkNode::aRootOrient;
MObject PkLimbIkNode::aMidOrient;
MObject PkLimbIkNode::aEndOrient;
MObject PkLimbIkNode::aParentInverseMatrix;
MObject PkLimbIkNode::aRootJointOrient;
MObject PkLimbIkNode::aRootJointOrientX, PkLimbIkNode::aRootJointOrientY, PkLimbIkNode::aRootJointOrientZ;
MObject PkLimbIkNode::aMidJointOrient;
MObject PkLimbIkNode::aMidJointOrientX, PkLimbIkNode::aMidJointOrientY, PkLimbIkNode::aMidJointOrientZ;
MObject PkLimbIkNode::aEndJointOrient;
MObject PkLimbIkNode::aEndJointOrientX, PkLimbIkNode::aEndJointOrientY, PkLimbIkNode::aEndJointOrientZ;
MObject PkLimbIkNode::aRotateOrder;
MObject PkLimbIkNode::aMidCtrlParentInverseMatrix;
MObject PkLimbIkNode::aIkFk;
MObject PkLimbIkNode::aFkRootMatrix;
MObject PkLimbIkNode::aFkMidMatrix;
MObject PkLimbIkNode::aFkEndMatrix;
MObject PkLimbIkNode::aFkElbowAutoTwist;
MObject PkLimbIkNode::aMirrored;
MObject PkLimbIkNode::aOutRootMatrix;
MObject PkLimbIkNode::aOutMidMatrix;
MObject PkLimbIkNode::aOutEndMatrix;
MObject PkLimbIkNode::aOutIkEndMatrix;
MObject PkLimbIkNode::aOutVolumeA;
MObject PkLimbIkNode::aOutVolumeB;
MObject PkLimbIkNode::aOutLengthA;
MObject PkLimbIkNode::aOutLengthB;
MObject PkLimbIkNode::aOutTranslate;
MObject PkLimbIkNode::aOutTranslateX, PkLimbIkNode::aOutTranslateY, PkLimbIkNode::aOutTranslateZ;
MObject PkLimbIkNode::aOutRotate;
MObject PkLimbIkNode::aOutRotateX, PkLimbIkNode::aOutRotateY, PkLimbIkNode::aOutRotateZ;
MObject PkLimbIkNode::aOutMidBaseTranslate;
MObject PkLimbIkNode::aOutMidBaseTranslateX, PkLimbIkNode::aOutMidBaseTranslateY, PkLimbIkNode::aOutMidBaseTranslateZ;
MObject PkLimbIkNode::aOutMidBaseRotate;
MObject PkLimbIkNode::aOutMidBaseRotateX, PkLimbIkNode::aOutMidBaseRotateY, PkLimbIkNode::aOutMidBaseRotateZ;
MObject PkLimbIkNode::aOutReach;

namespace
{
    const double kEps = 1.0e-9;

    // the range the softIk attribute is remapped onto, as the module has it
    const double kSoftMax = 20.0;
    const double kSoftOutMin = 0.001;
    const double kSoftOutMax = 2.0;

    MVector positionOf(const MMatrix& m)
    {
        return MVector(m[3][0], m[3][1], m[3][2]);
    }

    // The same orientation and place, without any scale. The frames the solver
    // builds have none, the ones that come from the scene do - and the local
    // values below have to be worked out the same way for both, or the scale of
    // the module lands on the bones twice on one path and not at all on the other.
    //
    // The sign of the scale goes with it. The mirrored side of the rig is built
    // on a negative one, so its world matrices are left-handed, and a left-handed
    // frame is not an orientation the joints can be given - it is an orientation
    // plus a reflection. Divide two of them, as the local values below do, and
    // the reflections cancel: the elbow comes out bending the way the other arm
    // does instead of the way it should. The stock rig never met this because a
    // parentConstraint reads its target's rotation and ignores the sign of its
    // scale; one axis is rebuilt from the other two here for the same reason.
    //
    // Which axis, depends on where the reflection came from, and there is no
    // universal answer - rebuilding the wrong one turns the reflection into a
    // half turn instead of undoing it. For the bones it is Z: X is the bone
    // itself and Y the axis it bends around, both meant. For the IK goal it is
    // X: there the reflection is ikSymmetryBehaviour, and that one is a flip of
    // `sx` on the mirror group of the control - along the frame's own X.
    MMatrix withoutScale(const MMatrix& m, bool mirrored, int rebuild = 2)
    {
        MVector x(m[0][0], m[0][1], m[0][2]);
        MVector y(m[1][0], m[1][1], m[1][2]);
        MVector z(m[2][0], m[2][1], m[2][2]);

        if (x.length() > kEps) x.normalize();
        if (y.length() > kEps) y.normalize();
        if (z.length() > kEps) z.normalize();

        // Отражения приходят только с зеркальной стороны: общее зеркало туда и
        // не заглядывает, а ikSymmetryBehaviour умножен на mod.mirror. На
        // обычной стороне проверять нечего.
        if (mirrored && (x ^ y) * z < 0.0)
        {
            if (rebuild == 0)
                x = y ^ z;
            else
                z = x ^ y;
        }

        const double r[4][4] = {
            { x.x, x.y, x.z, 0.0 },
            { y.x, y.y, y.z, 0.0 },
            { z.x, z.y, z.z, 0.0 },
            { m[3][0], m[3][1], m[3][2], 1.0 }
        };

        return MMatrix(r);
    }

    // The inverse of a matrix that is only a rotation and a place - which every
    // frame here is. Transposing the axes and carrying the position back through
    // them is exact and a fraction of what a general inversion costs.
    MMatrix rigidInverse(const MMatrix& m)
    {
        const MVector t(m[3][0], m[3][1], m[3][2]);

        const double r[4][4] = {
            { m[0][0], m[1][0], m[2][0], 0.0 },
            { m[0][1], m[1][1], m[2][1], 0.0 },
            { m[0][2], m[1][2], m[2][2], 0.0 },
            { -(t.x * m[0][0] + t.y * m[0][1] + t.z * m[0][2]),
              -(t.x * m[1][0] + t.y * m[1][1] + t.z * m[1][2]),
              -(t.x * m[2][0] + t.y * m[2][1] + t.z * m[2][2]), 1.0 }
        };

        return MMatrix(r);
    }

    // The same frame, turned so its X points at `target`, by the smallest turn
    // that does it - so whatever roll the frame carried is carried on. Used for
    // the FK chain, where the roll belongs to the controls and rebuilding the
    // frame from scratch would throw it away.
    MMatrix reAim(const MMatrix& m, const MVector& target, const MVector& at)
    {
        MVector x(m[0][0], m[0][1], m[0][2]);

        if (x.length() <= kEps || target.length() <= kEps)
            return m;

        x.normalize();
        const MVector t = target.normal();

        // почти разворот на месте - минимальная дуга там не определена
        if (x * t < -0.9999)
            return m;

        const MQuaternion q(x, t);

        MVector y(m[1][0], m[1][1], m[1][2]);
        MVector z(m[2][0], m[2][1], m[2][2]);

        const MVector rx = x.rotateBy(q);
        y = y.rotateBy(q);
        z = z.rotateBy(q);

        const double r[4][4] = {
            { rx.x, rx.y, rx.z, 0.0 },
            { y.x, y.y, y.z, 0.0 },
            { z.x, z.y, z.z, 0.0 },
            { at.x, at.y, at.z, 1.0 }
        };

        return MMatrix(r);
    }

    // A frame at `p` with X exactly along `x` and Z as close to `zRef` as it can
    // be. The two are only perpendicular while the chain lies in the plane the
    // pole set - move the knee out of it and they stop being, so the frame is
    // squared up here rather than taken on trust. Left as it was, the axes come
    // out non-orthogonal and the matrix carries a shear: the joints slide off.
    MMatrix frameAt(const MVector& p, const MVector& x, const MVector& zRef)
    {
        MVector ay = zRef ^ x;

        if (ay.length() <= kEps)
        {
            ay = MVector::yAxis ^ x;
            if (ay.length() <= kEps)
                ay = MVector::zAxis ^ x;
        }
        ay.normalize();

        const MVector az = x ^ ay;

        double m[4][4] = {
            { x.x, x.y, x.z, 0.0 },
            { ay.x, ay.y, ay.z, 0.0 },
            { az.x, az.y, az.z, 0.0 },
            { p.x, p.y, p.z, 1.0 }
        };

        return MMatrix(m);
    }

    const double kPi = 3.14159265358979323846;

    // The remapValue of the module: softIk over 0..20 onto 0.001..2, smooth.
    // Maya's "smooth" is the cosine, not the cubic smoothstep - read off the
    // curve of the module itself, point by point. One cosine costs the same as
    // the polynomial and is computed once per solve, so there is nothing to
    // gain by approximating it.
    double softZone(double softIk)
    {
        const double u = std::min(std::max(softIk / kSoftMax, 0.0), 1.0);
        const double v = (1.0 - std::cos(kPi * u)) * 0.5;

        return kSoftOutMin + v * (kSoftOutMax - kSoftOutMin);
    }

    MEulerRotation::RotationOrder orderFromEnum(short v)
    {
        switch (v)
        {
        case 1:  return MEulerRotation::kYZX;
        case 2:  return MEulerRotation::kZXY;
        case 3:  return MEulerRotation::kXZY;
        case 4:  return MEulerRotation::kYXZ;
        case 5:  return MEulerRotation::kZYX;
        default: return MEulerRotation::kXYZ;
        }
    }

    double lerp(double a, double b, double t)
    {
        return a + (b - a) * t;
    }

    // Position interpolated, orientation slerped - what a constraint blending
    // between two targets does, only without the constraint.
    MMatrix blendMatrix(const MMatrix& a, const MMatrix& b, double t)
    {
        if (t <= kEps)
            return a;
        if (t >= 1.0 - kEps)
            return b;

        MQuaternion qa = MTransformationMatrix(a).rotation();
        const MQuaternion qb = MTransformationMatrix(b).rotation();

        // Кватернион и его отрицание - один и тот же поворот, но slerp между
        // разными полушариями идёт длинной дорогой, через полоборота. На концах
        // шкалы этого не видно: там возвращаются сами матрицы. Вылезает только
        // на промежуточном ikFk, и тем вернее, чем дальше разошлись источники.
        if (qa.x * qb.x + qa.y * qb.y + qa.z * qb.z + qa.w * qb.w < 0.0)
            qa = MQuaternion(-qa.x, -qa.y, -qa.z, -qa.w);

        MMatrix m = slerp(qa, qb, t).asMatrix();

        m[3][0] = lerp(a[3][0], b[3][0], t);
        m[3][1] = lerp(a[3][1], b[3][1], t);
        m[3][2] = lerp(a[3][2], b[3][2], t);

        return m;
    }
}

void* PkLimbIkNode::creator()
{
    return new PkLimbIkNode();
}

MStatus PkLimbIkNode::initialize()
{
    MFnMatrixAttribute  mAttr;
    MFnNumericAttribute nAttr;
    MFnUnitAttribute    uAttr;
    MFnEnumAttribute    eAttr;

    // --- inputs ------------------------------------------------------------
    aRootMatrix = mAttr.create("rootMatrix", "rm");
    addAttribute(aRootMatrix);

    aGoalMatrix = mAttr.create("goalMatrix", "gm");
    addAttribute(aGoalMatrix);

    aPoleMatrix = mAttr.create("poleMatrix", "pm");
    addAttribute(aPoleMatrix);

    aLengthA = nAttr.create("lengthA", "la", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setKeyable(true);
    addAttribute(aLengthA);

    aLengthB = nAttr.create("lengthB", "lb", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setKeyable(true);
    addAttribute(aLengthB);

    aLength1 = nAttr.create("length1", "l1", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setKeyable(true);
    addAttribute(aLength1);

    aLength2 = nAttr.create("length2", "l2", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setKeyable(true);
    addAttribute(aLength2);

    aScale = nAttr.create("scale", "scl", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.001);
    nAttr.setKeyable(true);
    addAttribute(aScale);

    aAutoStretch = nAttr.create("autoStretch", "ast", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);
    addAttribute(aAutoStretch);

    aSoftIk = nAttr.create("softIk", "sik", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(kSoftMax);
    nAttr.setKeyable(true);
    addAttribute(aSoftIk);

    aSnap = nAttr.create("snap", "snp", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);
    addAttribute(aSnap);

    aStretchVolume = nAttr.create("stretchVolume", "svl", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);
    addAttribute(aStretchVolume);

    aMidOffsetX = nAttr.create("midOffsetX", "mox", MFnNumericData::kDouble, 0.0);
    aMidOffsetY = nAttr.create("midOffsetY", "moy", MFnNumericData::kDouble, 0.0);
    aMidOffsetZ = nAttr.create("midOffsetZ", "moz", MFnNumericData::kDouble, 0.0);
    aMidOffset  = nAttr.create("midOffset", "mo", aMidOffsetX, aMidOffsetY, aMidOffsetZ);
    nAttr.setKeyable(true);
    addAttribute(aMidOffset);

    aRootOrient = mAttr.create("rootOrient", "ro");
    addAttribute(aRootOrient);

    aMidOrient = mAttr.create("midOrient", "mor");
    addAttribute(aMidOrient);

    aEndOrient = mAttr.create("endOrient", "eor");
    addAttribute(aEndOrient);

    aParentInverseMatrix = mAttr.create("parentInverseMatrix", "pim");
    addAttribute(aParentInverseMatrix);

    aRootJointOrientX = uAttr.create("rootJointOrientX", "rjox", MFnUnitAttribute::kAngle, 0.0);
    aRootJointOrientY = uAttr.create("rootJointOrientY", "rjoy", MFnUnitAttribute::kAngle, 0.0);
    aRootJointOrientZ = uAttr.create("rootJointOrientZ", "rjoz", MFnUnitAttribute::kAngle, 0.0);
    aRootJointOrient  = nAttr.create("rootJointOrient", "rjo",
                                     aRootJointOrientX, aRootJointOrientY, aRootJointOrientZ);
    addAttribute(aRootJointOrient);

    aMidJointOrientX = uAttr.create("midJointOrientX", "mjox", MFnUnitAttribute::kAngle, 0.0);
    aMidJointOrientY = uAttr.create("midJointOrientY", "mjoy", MFnUnitAttribute::kAngle, 0.0);
    aMidJointOrientZ = uAttr.create("midJointOrientZ", "mjoz", MFnUnitAttribute::kAngle, 0.0);
    aMidJointOrient  = nAttr.create("midJointOrient", "mjo",
                                    aMidJointOrientX, aMidJointOrientY, aMidJointOrientZ);
    addAttribute(aMidJointOrient);

    aEndJointOrientX = uAttr.create("endJointOrientX", "ejox", MFnUnitAttribute::kAngle, 0.0);
    aEndJointOrientY = uAttr.create("endJointOrientY", "ejoy", MFnUnitAttribute::kAngle, 0.0);
    aEndJointOrientZ = uAttr.create("endJointOrientZ", "ejoz", MFnUnitAttribute::kAngle, 0.0);
    aEndJointOrient  = nAttr.create("endJointOrient", "ejo",
                                    aEndJointOrientX, aEndJointOrientY, aEndJointOrientZ);
    addAttribute(aEndJointOrient);

    // короткое имя не "ro": оно уже занято rootOrient, а дубликат Maya не
    // переживает - падает при регистрации типа
    aRotateOrder = eAttr.create("rotateOrder", "rord", 0);
    eAttr.addField("xyz", 0);
    eAttr.addField("yzx", 1);
    eAttr.addField("zxy", 2);
    eAttr.addField("xzy", 3);
    eAttr.addField("yxz", 4);
    eAttr.addField("zyx", 5);
    addAttribute(aRotateOrder);

    aMidCtrlParentInverseMatrix = mAttr.create("midCtrlParentInverseMatrix", "mpim");
    addAttribute(aMidCtrlParentInverseMatrix);

    aIkFk = nAttr.create("ikFk", "ifk", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);
    addAttribute(aIkFk);

    aFkRootMatrix = mAttr.create("fkRootMatrix", "frm");
    addAttribute(aFkRootMatrix);

    aFkMidMatrix = mAttr.create("fkMidMatrix", "fmm");
    addAttribute(aFkMidMatrix);

    aFkEndMatrix = mAttr.create("fkEndMatrix", "fem");
    addAttribute(aFkEndMatrix);

    aMirrored = nAttr.create("mirrored", "mrr", MFnNumericData::kBoolean, false);
    nAttr.setKeyable(false);
    addAttribute(aMirrored);

    aFkElbowAutoTwist = nAttr.create("fkElbowAutoTwist", "fkat",
                                     MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);
    addAttribute(aFkElbowAutoTwist);

    // --- outputs -----------------------------------------------------------
    aOutRootMatrix = mAttr.create("outRootMatrix", "orm");
    mAttr.setWritable(false);
    mAttr.setStorable(false);
    addAttribute(aOutRootMatrix);

    aOutMidMatrix = mAttr.create("outMidMatrix", "omm");
    mAttr.setWritable(false);
    mAttr.setStorable(false);
    addAttribute(aOutMidMatrix);

    aOutEndMatrix = mAttr.create("outEndMatrix", "oem");
    mAttr.setWritable(false);
    mAttr.setStorable(false);
    addAttribute(aOutEndMatrix);

    aOutIkEndMatrix = mAttr.create("outIkEndMatrix", "oiem");
    mAttr.setWritable(false);
    mAttr.setStorable(false);
    addAttribute(aOutIkEndMatrix);

    aOutVolumeA = nAttr.create("outVolumeA", "ova", MFnNumericData::kDouble, 1.0);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutVolumeA);

    aOutVolumeB = nAttr.create("outVolumeB", "ovb", MFnNumericData::kDouble, 1.0);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutVolumeB);

    aOutLengthA = nAttr.create("outLengthA", "ola", MFnNumericData::kDouble, 0.0);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutLengthA);

    aOutLengthB = nAttr.create("outLengthB", "olb", MFnNumericData::kDouble, 0.0);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutLengthB);

    aOutTranslateX = nAttr.create("outTranslateX", "otx", MFnNumericData::kDouble, 0.0);
    aOutTranslateY = nAttr.create("outTranslateY", "oty", MFnNumericData::kDouble, 0.0);
    aOutTranslateZ = nAttr.create("outTranslateZ", "otz", MFnNumericData::kDouble, 0.0);
    aOutTranslate  = nAttr.create("outTranslate", "ot",
                                  aOutTranslateX, aOutTranslateY, aOutTranslateZ);
    nAttr.setArray(true);
    nAttr.setUsesArrayDataBuilder(true);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutTranslate);

    aOutRotateX = uAttr.create("outRotateX", "orox", MFnUnitAttribute::kAngle, 0.0);
    aOutRotateY = uAttr.create("outRotateY", "oroy", MFnUnitAttribute::kAngle, 0.0);
    aOutRotateZ = uAttr.create("outRotateZ", "oroz", MFnUnitAttribute::kAngle, 0.0);
    aOutRotate  = nAttr.create("outRotate", "oro", aOutRotateX, aOutRotateY, aOutRotateZ);
    nAttr.setArray(true);
    nAttr.setUsesArrayDataBuilder(true);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutRotate);

    aOutMidBaseTranslateX = nAttr.create("outMidBaseTranslateX", "ombx", MFnNumericData::kDouble, 0.0);
    aOutMidBaseTranslateY = nAttr.create("outMidBaseTranslateY", "omby", MFnNumericData::kDouble, 0.0);
    aOutMidBaseTranslateZ = nAttr.create("outMidBaseTranslateZ", "ombz", MFnNumericData::kDouble, 0.0);
    aOutMidBaseTranslate  = nAttr.create("outMidBaseTranslate", "omb",
                                         aOutMidBaseTranslateX, aOutMidBaseTranslateY,
                                         aOutMidBaseTranslateZ);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutMidBaseTranslate);

    aOutMidBaseRotateX = uAttr.create("outMidBaseRotateX", "ombrx", MFnUnitAttribute::kAngle, 0.0);
    aOutMidBaseRotateY = uAttr.create("outMidBaseRotateY", "ombry", MFnUnitAttribute::kAngle, 0.0);
    aOutMidBaseRotateZ = uAttr.create("outMidBaseRotateZ", "ombrz", MFnUnitAttribute::kAngle, 0.0);
    aOutMidBaseRotate  = nAttr.create("outMidBaseRotate", "ombr",
                                      aOutMidBaseRotateX, aOutMidBaseRotateY,
                                      aOutMidBaseRotateZ);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutMidBaseRotate);

    aOutReach = nAttr.create("outReach", "ore", MFnNumericData::kDouble, 0.0);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aOutReach);

    const MObject inputs[] = {
        aRootMatrix, aGoalMatrix, aPoleMatrix, aMirrored,
        aLengthA, aLengthB, aLength1, aLength2, aScale,
        aAutoStretch, aSoftIk, aSnap, aStretchVolume,
        aMidOffset, aMidOffsetX, aMidOffsetY, aMidOffsetZ,
        aIkFk, aFkRootMatrix, aFkMidMatrix, aFkEndMatrix, aFkElbowAutoTwist,
        aRootOrient, aMidOrient, aEndOrient,
        aParentInverseMatrix, aRotateOrder, aMidCtrlParentInverseMatrix,
        aRootJointOrient, aRootJointOrientX, aRootJointOrientY, aRootJointOrientZ,
        aMidJointOrient, aMidJointOrientX, aMidJointOrientY, aMidJointOrientZ,
        aEndJointOrient, aEndJointOrientX, aEndJointOrientY, aEndJointOrientZ
    };
    const MObject outputs[] = {
        aOutRootMatrix, aOutMidMatrix, aOutEndMatrix, aOutIkEndMatrix,
        aOutTranslate, aOutRotate, aOutMidBaseTranslate, aOutMidBaseRotate,
        aOutVolumeA, aOutVolumeB, aOutLengthA, aOutLengthB, aOutReach
    };

    for (const MObject& in : inputs)
        for (const MObject& out : outputs)
            attributeAffects(in, out);

    return MS::kSuccess;
}

MStatus PkLimbIkNode::compute(const MPlug& plug, MDataBlock& data)
{
    const MObject attr = plug.attribute();
    if (attr != aOutRootMatrix && attr != aOutMidMatrix && attr != aOutEndMatrix &&
        attr != aOutIkEndMatrix &&
        attr != aOutTranslate && attr != aOutTranslateX && attr != aOutTranslateY &&
        attr != aOutTranslateZ && attr != aOutRotate && attr != aOutRotateX &&
        attr != aOutRotateY && attr != aOutRotateZ &&
        attr != aOutMidBaseTranslate && attr != aOutMidBaseTranslateX &&
        attr != aOutMidBaseTranslateY && attr != aOutMidBaseTranslateZ &&
        attr != aOutMidBaseRotate && attr != aOutMidBaseRotateX &&
        attr != aOutMidBaseRotateY && attr != aOutMidBaseRotateZ &&
        attr != aOutVolumeA && attr != aOutVolumeB &&
        attr != aOutLengthA && attr != aOutLengthB && attr != aOutReach)
        return MS::kUnknownParameter;

    MStatus status;

    const MMatrix rootM = data.inputValue(aRootMatrix, &status).asMatrix();
    if (!status) return status;

    const bool mirrored = data.inputValue(aMirrored, &status).asBool();
    // 0 - отражение снимается по X: у цели его ставит ikSymmetryBehaviour,
    // флипом sx на группе mirror самого контрола
    const MMatrix goalM = withoutScale(data.inputValue(aGoalMatrix, &status).asMatrix(),
                                       mirrored, 0);
    const MMatrix poleM = data.inputValue(aPoleMatrix, &status).asMatrix();

    const double lengthARaw = data.inputValue(aLengthA, &status).asDouble();
    const double lengthBRaw = data.inputValue(aLengthB, &status).asDouble();

    const double la0 = lengthARaw * data.inputValue(aLength1, &status).asDouble();
    const double lb0 = lengthBRaw * data.inputValue(aLength2, &status).asDouble();

    const double scale       = data.inputValue(aScale, &status).asDouble();
    const double ikFk        = data.inputValue(aIkFk, &status).asDouble();
    const double autoStretch = data.inputValue(aAutoStretch, &status).asDouble()
                             * ikFk;
    const double softIk      = data.inputValue(aSoftIk, &status).asDouble();
    const double snap        = data.inputValue(aSnap, &status).asDouble();
    const double stretchVolume = data.inputValue(aStretchVolume, &status).asDouble();
    const double3& mo        = data.inputValue(aMidOffset, &status).asDouble3();

    const MEulerRotation::RotationOrder ro =
        orderFromEnum(data.inputValue(aRotateOrder, &status).asShort());

    const MVector root = positionOf(rootM);
    const MVector goal = positionOf(goalM);
    const MVector pole = positionOf(poleM);

    MVector toGoal = goal - root;
    const double d = toGoal.length();

    // the length maths runs in the units the module is built in, the geometry
    // in world - `scale` is the only thing that stands between them
    const double dLocal = (scale > kEps) ? (d / scale) : d;

    // the chain pointing straight at the goal, for a goal it cannot reach
    const MVector x = (d > kEps) ? (toGoal / d) : MVector::xAxis;

    // The plane the chain bends in. The pole says which way; when it sits on
    // the line itself there is no plane to speak of, and any perpendicular will
    // do - it is the one case where the answer really is arbitrary.
    MVector toPole = pole - root;
    MVector u = toPole - x * (toPole * x);

    if (u.length() <= kEps)
    {
        u = MVector::yAxis - x * (MVector::yAxis * x);
        if (u.length() <= kEps)
            u = MVector::zAxis - x * (MVector::zAxis * x);
    }
    u.normalize();

    // Нормаль плоскости сгиба. Векторное произведение - псевдовектор: x и u
    // зеркалятся как обычные векторы, а их произведение получает лишний минус.
    // Оставить как есть - и на зеркальной стороне кости прокручиваются вокруг
    // собственной оси на полоборота, причём только в IK: FK-ветка нормаль не
    // строит, и потому при переключении ik/fk кость разворачивало.
    const MVector z = (x ^ u).normal() * (mirrored ? -1.0 : 1.0);

    // --- how long the bones end up being -------------------------------------
    const double L = la0 + lb0;
    const double reach = (L > kEps) ? (dLocal / L) : 0.0;

    const double s  = softZone(softIk);
    const double da = L - s;

    const double threshold = (softIk > 0.0) ? da : L;
    double dSoft = L;

    if (softIk > 0.0)
        dSoft = (s > kEps) ? (da + s * (1.0 - std::exp(-(dLocal - da) / s))) : da;

    const double dEff = (dLocal >= threshold) ? dSoft : dLocal;

    double factor = (dEff > kEps) ? (dLocal / dEff) : 1.0;
    factor = 1.0 + (factor - 1.0) * autoStretch;

    // и обратно в мир: геометрия считается там
    double la = la0 * factor * scale;
    double lb = lb0 * factor * scale;

    // snap pulls the knee onto the pole: at 1 the bones are exactly as long as
    // the way there and back
    if (snap > 0.0)
    {
        la = lerp(la, (pole - root).length(), snap);
        lb = lerp(lb, (goal - pole).length(), snap);
    }

    // --- where the knee lands -------------------------------------------------
    const double dMin = std::fabs(la - lb) + kEps;
    const double dMax = la + lb - kEps;
    const double dc = std::min(std::max(d, dMin), dMax);

    double angleA = 0.0;
    if (la > kEps && dc > kEps)
    {
        const double cosA = (la * la + dc * dc - lb * lb) / (2.0 * la * dc);
        angleA = std::acos(std::min(std::max(cosA, -1.0), 1.0));
    }

    MVector mid = root + (x * std::cos(angleA) + u * std::sin(angleA)) * la;

    // the end follows the bones, not the goal: with softIk on they are two
    // different points, and that difference is the whole trick
    MVector midToGoal = goal - mid;
    const MVector end = mid + ((midToGoal.length() > kEps) ? midToGoal.normal() : x) * lb;

    const MVector midBase = mid;

    // --- FK-цепочка читается здесь, до контрола -------------------------------
    // Контрол среднего сидит на локте той цепочки, которая видна на самом деле,
    // а не на локте IK-решения. В штатном риге он висел point-констрейном на
    // b_finalJoint, то есть на уже смешанной кости. Пока кадр строился из IK,
    // достаточно было сдвинуть позвоночник - FK-цепочка уходила за плечом, IK
    // оставалась на месте, и контрол уезжал за ней.
    const bool useFk = (ikFk < 1.0 - kEps);

    MMatrix fkRoot, fkMid, fkEnd;
    MVector pA = root, pB = midBase, pE = end;

    if (useFk)
    {
        fkRoot = withoutScale(data.inputValue(aFkRootMatrix, &status).asMatrix(), mirrored);
        fkMid  = withoutScale(data.inputValue(aFkMidMatrix, &status).asMatrix(), mirrored);
        fkEnd  = withoutScale(data.inputValue(aFkEndMatrix, &status).asMatrix(), mirrored);

        pA = positionOf(fkRoot);
        pB = positionOf(fkMid);
        pE = positionOf(fkEnd);
    }

    const MVector bRoot = pA + (root - pA) * ikFk;
    const MVector bMid  = pB + (midBase - pB) * ikFk;
    const MVector bEnd  = pE + (end - pE) * ikFk;

    // --- where the middle control sits ----------------------------------------
    // Between the two bones, which is where the constraint of the module puts
    // it. That frame matters twice over: the control is placed by it, and the
    // offset it gives is stated in it. Taking the frame of the middle bone
    // instead - which is what the joint uses - is off by half the bend, and the
    // knee then travels at an angle to the drag.
    MVector xaPre = bMid - bRoot;
    xaPre = (xaPre.length() > kEps) ? xaPre.normal() : x;

    MVector xbPre = bEnd - bMid;
    xbPre = (xbPre.length() > kEps) ? xbPre.normal() : x;

    MVector xm = xaPre + xbPre;
    xm = (xm.length() > kEps) ? xm.normal() : xbPre;

    const MMatrix midOrient = data.inputValue(aMidOrient, &status).asMatrix();
    const MMatrix midCtrl = midOrient * frameAt(bMid, xm, z);

    // Куда сядет группа контрола - и в какой системе он потом окажется. Это не
    // одно и то же: наружу уходит поворот, а Maya примет его как поворот и
    // только, так что отражение, если оно есть в родителе, из локальной матрицы
    // выпадет. Кадр, в котором контрол реально живёт, надо собрать обратно.
    const MMatrix midCtrlParentInv =
        data.inputValue(aMidCtrlParentInverseMatrix, &status).asMatrix();

    MTransformationMatrix mct(midCtrl * midCtrlParentInv);

    // --- the knee is moved by hand, after everything else ----------------------
    // The bones do not keep their length through this: they reach from the root
    // to wherever the knee has been put, and from there to the end.
    //
    // Смещение приходит локальными каналами контрола, значит и толковать его
    // надо в том кадре, который у контрола получился на самом деле, а не в том,
    // из которого он выведен.
    //
    // Кадр собирается из того же кватерниона, что уходит наружу в
    // outMidBaseRotate: Maya построит поворот группы именно из него, и
    // отражение достанется группе от родителя. Через asRotateMatrix брать
    // нельзя - та оставляет отражение при себе, и на родителе оно сокращается
    // со вторым: кадр выходит правым, а группа левая, и локоть едет против Z.
    if (mo[0] != 0.0 || mo[1] != 0.0 || mo[2] != 0.0)
    {
        const MMatrix ctrlWorld =
            mct.rotation().asMatrix() * midCtrlParentInv.inverse();

        const MVector offset = MVector(mo[0], mo[1], mo[2]) * ctrlWorld;

        mid += offset;

        // Локоть двигается и в FK. Иначе смещение живёт только внутри
        // IK-решения и при ikFk = 0 пропадает вместе с ним. Кости при этом
        // доворачиваются наименьшим поворотом, а не строятся заново: крен в FK
        // принадлежит контролам, и кадр с нуля его потерял бы.
        if (useFk)
        {
            pB += offset;
            fkRoot = reAim(fkRoot, pB - pA, pA);
            fkMid  = reAim(fkMid, pE - pB, pB);
        }
    }

    MVector xa = mid - root;
    la = xa.length();
    xa = (la > kEps) ? (xa / la) : x;

    MVector xb = end - mid;
    lb = xb.length();
    xb = (lb > kEps) ? (xb / lb) : x;

    // the end keeps the orientation of the goal: that is what the ik control is
    // for, and the solver has nothing to say about it
    MMatrix endM = goalM;
    endM[3][0] = end.x;
    endM[3][1] = end.y;
    endM[3][2] = end.z;

    // the frames the solver builds are its own; the rig says how the joints sit
    // around the bone, and that is measured, not assumed
    MMatrix rootOut = data.inputValue(aRootOrient, &status).asMatrix() * frameAt(root, xa, z);
    MMatrix midOut  = midOrient * frameAt(mid, xb, z);
    MMatrix endOut  = data.inputValue(aEndOrient, &status).asMatrix() * endM;

    // Снимается до смешивания с FK: реверс-стопа ждёт чистый IK.
    const MMatrix ikEndOut = endOut;

    // --- and the FK chain, if it is asked for --------------------------------
    if (useFk)
    {
        // The bones rolling by themselves: each aims at the next control with
        // its Z turned towards the far end of the chain, so the two share one
        // plane - which is what the solver gives them under IK. The module does
        // this with two locators, two aim constraints and two pairBlends.
        const double autoTwist = data.inputValue(aFkElbowAutoTwist, &status).asDouble();

        if (autoTwist > kEps)
        {
            const MVector fkXa = pB - pA;
            const MVector fkXb = pE - pB;

            // Выпрямление левостороннего кадра переворачивает Z - значит на
            // зеркальной стороне туда же смотрит и опора автоподворота. Оставить
            // её как есть - и кости встают на 180 вокруг собственной оси.
            const double up = mirrored ? -1.0 : 1.0;

            if (fkXa.length() > kEps && fkXb.length() > kEps)
            {
                fkRoot = blendMatrix(fkRoot, frameAt(pA, fkXa.normal(), (pE - pA) * up), autoTwist);
                fkMid  = blendMatrix(fkMid,  frameAt(pB, fkXb.normal(), (pA - pB) * up), autoTwist);
            }
        }

        rootOut = blendMatrix(fkRoot, rootOut, ikFk);
        midOut  = blendMatrix(fkMid,  midOut,  ikFk);
        endOut  = blendMatrix(fkEnd,  endOut,  ikFk);

        la = lerp((pB - pA).length(), la, ikFk);
        lb = lerp((pE - pB).length(), lb, ikFk);
    }

    // --- out -------------------------------------------------------------------
    MDataHandle hRoot = data.outputValue(aOutRootMatrix, &status);
    if (status) { hRoot.setMMatrix(rootOut); hRoot.setClean(); }

    MDataHandle hMid = data.outputValue(aOutMidMatrix, &status);
    if (status) { hMid.setMMatrix(midOut); hMid.setClean(); }

    MDataHandle hIkEnd = data.outputValue(aOutIkEndMatrix, &status);
    if (status) { hIkEnd.setMMatrix(ikEndOut); hIkEnd.setClean(); }

    MDataHandle hEnd = data.outputValue(aOutEndMatrix, &status);
    if (status) { hEnd.setMMatrix(endOut); hEnd.setClean(); }

    // Что осталось от кости поперёк себя: построенная длина к итоговой. Берётся
    // длина ДО length1, как в старой обвязке: там length1 тоже утоньшает кость.
    // Длины с обеих сторон в мировых единицах, поэтому отношение безразмерное и
    // при масштабе позера не плывёт. Смещение локтя тоже учитывается - оно
    // меняет длины, а старая обвязка про него не знала.
    const double refA = lengthARaw * scale;
    const double refB = lengthBRaw * scale;

    const double volA = (la > kEps) ? (refA / la) : 1.0;
    const double volB = (lb > kEps) ? (refB / lb) : 1.0;

    MDataHandle hVa = data.outputValue(aOutVolumeA, &status);
    if (status) { hVa.setDouble(lerp(1.0, volA, stretchVolume)); hVa.setClean(); }

    MDataHandle hVb = data.outputValue(aOutVolumeB, &status);
    if (status) { hVb.setDouble(lerp(1.0, volB, stretchVolume)); hVb.setClean(); }

    MDataHandle hLa = data.outputValue(aOutLengthA, &status);
    if (status) { hLa.setDouble(la); hLa.setClean(); }

    MDataHandle hLb = data.outputValue(aOutLengthB, &status);
    if (status) { hLb.setDouble(lb); hLb.setClean(); }

    // где сидеть группе среднего контрола: на локте до его собственного
    // смещения, сразу в системе её родителя
    const MVector mb = mct.getTranslation(MSpace::kTransform);
    MEulerRotation mbr = mct.rotation().asEulerRotation();
    if (ro != MEulerRotation::kXYZ)
        mbr.reorderIt(ro);

    MDataHandle hMidBase = data.outputValue(aOutMidBaseTranslate, &status);
    if (status) { hMidBase.set3Double(mb.x, mb.y, mb.z); hMidBase.setClean(); }

    MDataHandle hMidBaseR = data.outputValue(aOutMidBaseRotate, &status);
    if (status) { hMidBaseR.set3Double(mbr.x, mbr.y, mbr.z); hMidBaseR.setClean(); }

    MDataHandle hReach = data.outputValue(aOutReach, &status);
    if (status) { hReach.setDouble(reach); hReach.setClean(); }

    // --- and the same as local channels ----------------------------------------
    // The chain knows its own frames, so the only inverse that has to come from
    // outside is the one of what the first joint hangs from. Doing this here and
    // not with a multMatrix and a decomposeMatrix per joint is six nodes and
    // three matrix inversions per limb that never happen.
    const MMatrix parentInv = data.inputValue(aParentInverseMatrix, &status).asMatrix();

    // Масштаб родителя, снятый с его же обратной матрицы. Он нужен для средней
    // и конечной кости: их родители - предыдущие кости цепочки, и масштаб
    // модуля они несут, а системы, которые строит солвер, всегда единичные.
    // Без этого длина умножается на масштаб дважды, и кости едут при
    // масштабировании позера.
    const MVector pRow(parentInv[0][0], parentInv[0][1], parentInv[0][2]);
    const double pLen = pRow.length();
    const double parentScale = (pLen > kEps) ? (1.0 / pLen) : 1.0;

    // Нормализовать эти три не нужно: каждый из них построен из ортонормированных
    // кадров - frameAt даёт такой по построению, goalM уже выпрямлен на входе,
    // а blendMatrix отдаёт кватернион. Девять корней за вызов ни за что.
    const MMatrix& rootN = rootOut;
    const MMatrix& midN  = midOut;
    const MMatrix& endN  = endOut;

    const MMatrix local[3] = { rootN * parentInv,
                               midN * rigidInverse(rootN),
                               endN * rigidInverse(midN) };
    const MObject orients[3] = { aRootJointOrient, aMidJointOrient, aEndJointOrient };

    MArrayDataHandle hOutT = data.outputArrayValue(aOutTranslate, &status);
    MArrayDataBuilder bT = hOutT.builder(&status);
    MArrayDataHandle hOutR = data.outputArrayValue(aOutRotate, &status);
    MArrayDataBuilder bR = hOutR.builder(&status);

    for (unsigned int i = 0; i < 3; ++i)
    {
        MMatrix m = local[i];

        const double3& jo = data.inputValue(orients[i], &status).asDouble3();
        if (jo[0] != 0.0 || jo[1] != 0.0 || jo[2] != 0.0)
        {
            // rotate * jointOrient * parent - значит поворот это локальная
            // матрица, с которой снята ориентация джоинта
            m = m * rigidInverse(MEulerRotation(jo[0], jo[1], jo[2],
                                                MEulerRotation::kXYZ).asMatrix());
        }

        MTransformationMatrix tm(m);

        MVector t = tm.getTranslation(MSpace::kTransform);

        // корню родителя масштаб уже учтён в parentInverseMatrix, остальным нет
        if (i > 0 && parentScale > kEps)
            t /= parentScale;
        MEulerRotation e = tm.rotation().asEulerRotation();
        if (ro != MEulerRotation::kXYZ)
            e.reorderIt(ro);

        MDataHandle hT = bT.addElement(i, &status);
        if (status) hT.set3Double(t.x, t.y, t.z);

        MDataHandle hR = bR.addElement(i, &status);
        if (status) hR.set3Double(e.x, e.y, e.z);
    }

    hOutT.set(bT);
    hOutT.setAllClean();
    hOutR.set(bR);
    hOutR.setAllClean();

    return MS::kSuccess;
}
