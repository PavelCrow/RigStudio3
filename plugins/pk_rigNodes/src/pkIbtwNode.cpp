#include "pkIbtwNode.h"

#include <maya/MAngle.h>
#include <maya/MArrayDataBuilder.h>
#include <maya/MEulerRotation.h>
#include <maya/MFnCompoundAttribute.h>
#include <maya/MFnEnumAttribute.h>
#include <maya/MFnMatrixAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MFnUnitAttribute.h>
#include <maya/MMatrix.h>
#include <maya/MQuaternion.h>
#include <maya/MTransformationMatrix.h>
#include <maya/MVector.h>

#include <algorithm>
#include <cmath>

MObject PkIbtwNode::aDriverMode;
MObject PkIbtwNode::aDriverRotate;
MObject PkIbtwNode::aDriverRotateX, PkIbtwNode::aDriverRotateY, PkIbtwNode::aDriverRotateZ;
MObject PkIbtwNode::aDriverRotateOrder;
MObject PkIbtwNode::aChildMatrix;
MObject PkIbtwNode::aParentInverseMatrix;
MObject PkIbtwNode::aRestMatrix;
MObject PkIbtwNode::aOffsetRotate;
MObject PkIbtwNode::aOffsetRotateX, PkIbtwNode::aOffsetRotateY, PkIbtwNode::aOffsetRotateZ;
MObject PkIbtwNode::aScale;
MObject PkIbtwNode::aMirrorAxis;
MObject PkIbtwNode::aMirrorAxisX, PkIbtwNode::aMirrorAxisY, PkIbtwNode::aMirrorAxisZ;
MObject PkIbtwNode::aJoint;
MObject PkIbtwNode::aAxis;
MObject PkIbtwNode::aBind;
MObject PkIbtwNode::aAngleMin, PkIbtwNode::aAngleMax;
MObject PkIbtwNode::aPosMin,   PkIbtwNode::aPosMax;
MObject PkIbtwNode::aSwingMin, PkIbtwNode::aSwingMax;
MObject PkIbtwNode::aReverse;
MObject PkIbtwNode::aOutBendY, PkIbtwNode::aOutBendZ;
MObject PkIbtwNode::aOut;
MObject PkIbtwNode::aOutTranslate;
MObject PkIbtwNode::aOutTranslateX, PkIbtwNode::aOutTranslateY, PkIbtwNode::aOutTranslateZ;
MObject PkIbtwNode::aOutRotate;
MObject PkIbtwNode::aOutRotateX, PkIbtwNode::aOutRotateY, PkIbtwNode::aOutRotateZ;
MObject PkIbtwNode::aOutDriverAngle;

namespace
{
    const double kEps = 1.0e-9;
    const double kPi  = 3.14159265358979323846;

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

    // Swing/twist split about the bone axis X. Returns the swing part, that is
    // the bend with the rotation around the bone itself taken out.
    MQuaternion swingAboutX(const MQuaternion& q)
    {
        MQuaternion twist(q.x, 0.0, 0.0, q.w);
        const double len = std::sqrt(twist.x * twist.x + twist.w * twist.w);

        if (len < kEps)
        {
            // exactly 180 degrees around something in the YZ plane - no twist
            return q;
        }

        twist.x /= len;
        twist.w /= len;

        return q * twist.inverse();
    }

    // Rotation scaled by t - slerp from identity. Scaling euler channels
    // instead breaks down on compound rotations, which is what the DG version
    // did.
    MQuaternion scaledRotation(const MQuaternion& q, double t)
    {
        if (t <= kEps)
            return MQuaternion::identity;
        if (std::fabs(t - 1.0) <= kEps)
            return q;

        return slerp(MQuaternion::identity, q, t);
    }

    double sign(double v)
    {
        return v < 0.0 ? -1.0 : 1.0;
    }

    double lerp(double a, double b, double t)
    {
        return a + (b - a) * t;
    }
}

void* PkIbtwNode::creator()
{
    return new PkIbtwNode();
}

MStatus PkIbtwNode::initialize()
{
    MFnNumericAttribute  nAttr;
    MFnUnitAttribute     uAttr;
    MFnEnumAttribute     eAttr;
    MFnCompoundAttribute cAttr;
    MFnMatrixAttribute   mAttr;

    // --- inputs ------------------------------------------------------------
    aDriverMode = eAttr.create("driverMode", "dmo", 0);
    eAttr.addField("local", 0);
    eAttr.addField("matrix", 1);
    eAttr.setKeyable(true);
    addAttribute(aDriverMode);

    aDriverRotateX = uAttr.create("driverRotateX", "drx", MFnUnitAttribute::kAngle, 0.0);
    aDriverRotateY = uAttr.create("driverRotateY", "dry", MFnUnitAttribute::kAngle, 0.0);
    aDriverRotateZ = uAttr.create("driverRotateZ", "drz", MFnUnitAttribute::kAngle, 0.0);
    aDriverRotate  = nAttr.create("driverRotate", "dr", aDriverRotateX, aDriverRotateY, aDriverRotateZ);
    nAttr.setKeyable(true);
    addAttribute(aDriverRotate);

    aDriverRotateOrder = eAttr.create("driverRotateOrder", "dro", 0);
    eAttr.addField("xyz", 0);
    eAttr.addField("yzx", 1);
    eAttr.addField("zxy", 2);
    eAttr.addField("xzy", 3);
    eAttr.addField("yxz", 4);
    eAttr.addField("zyx", 5);
    eAttr.setKeyable(true);
    addAttribute(aDriverRotateOrder);

    aChildMatrix = mAttr.create("childMatrix", "chm");
    addAttribute(aChildMatrix);

    aParentInverseMatrix = mAttr.create("parentInverseMatrix", "pim");
    addAttribute(aParentInverseMatrix);

    // an input, not a constant: a locator can drive it, and moving that locator
    // moves what the node reads as the unbent pose
    aRestMatrix = mAttr.create("restMatrix", "rsm");
    mAttr.setStorable(true);
    addAttribute(aRestMatrix);

    aOffsetRotateX = uAttr.create("offsetRotateX", "ofrx", MFnUnitAttribute::kAngle, 0.0);
    aOffsetRotateY = uAttr.create("offsetRotateY", "ofry", MFnUnitAttribute::kAngle, 0.0);
    aOffsetRotateZ = uAttr.create("offsetRotateZ", "ofrz", MFnUnitAttribute::kAngle, 0.0);
    aOffsetRotate  = nAttr.create("offsetRotate", "ofr", aOffsetRotateX, aOffsetRotateY, aOffsetRotateZ);
    nAttr.setKeyable(true);
    addAttribute(aOffsetRotate);

    aScale = nAttr.create("scale", "scl", MFnNumericData::kDouble, 1.0);
    nAttr.setKeyable(true);
    addAttribute(aScale);

    aMirrorAxisX = nAttr.create("mirrorAxisX", "mirx", MFnNumericData::kDouble, 1.0);
    aMirrorAxisY = nAttr.create("mirrorAxisY", "miry", MFnNumericData::kDouble, 1.0);
    aMirrorAxisZ = nAttr.create("mirrorAxisZ", "mirz", MFnNumericData::kDouble, 1.0);
    aMirrorAxis  = nAttr.create("mirrorAxis", "mir", aMirrorAxisX, aMirrorAxisY, aMirrorAxisZ);
    nAttr.setKeyable(true);
    addAttribute(aMirrorAxis);

    aAxis = eAttr.create("axis", "ax", 0);
    eAttr.addField("y", 0);
    eAttr.addField("z", 1);
    eAttr.setKeyable(true);

    aBind = nAttr.create("bind", "bnd", MFnNumericData::kDouble, 0.5);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aAngleMin = uAttr.create("angleMin", "amn", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setKeyable(true);
    aAngleMax = uAttr.create("angleMax", "amx", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setKeyable(true);

    aPosMin = nAttr.create("posMin", "pmn", MFnNumericData::kDouble, 0.0);
    nAttr.setKeyable(true);
    aPosMax = nAttr.create("posMax", "pmx", MFnNumericData::kDouble, 0.0);
    nAttr.setKeyable(true);

    aSwingMin = uAttr.create("swingMin", "smn", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setKeyable(true);
    aSwingMax = uAttr.create("swingMax", "smx", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setKeyable(true);

    aReverse = nAttr.create("reverse", "rev", MFnNumericData::kBoolean, false);
    nAttr.setKeyable(true);

    aJoint = cAttr.create("joint", "jnt");
    cAttr.addChild(aAxis);
    cAttr.addChild(aBind);
    cAttr.addChild(aAngleMin);
    cAttr.addChild(aAngleMax);
    cAttr.addChild(aPosMin);
    cAttr.addChild(aPosMax);
    cAttr.addChild(aSwingMin);
    cAttr.addChild(aSwingMax);
    cAttr.addChild(aReverse);
    cAttr.setArray(true);
    cAttr.setUsesArrayDataBuilder(true);
    addAttribute(aJoint);

    // --- outputs -----------------------------------------------------------
    aOutBendY = uAttr.create("outBendY", "oby", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setWritable(false);
    uAttr.setStorable(false);
    addAttribute(aOutBendY);

    aOutBendZ = uAttr.create("outBendZ", "obz", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setWritable(false);
    uAttr.setStorable(false);
    addAttribute(aOutBendZ);

    aOutTranslateX = nAttr.create("outTranslateX", "otx", MFnNumericData::kDouble, 0.0);
    aOutTranslateY = nAttr.create("outTranslateY", "oty", MFnNumericData::kDouble, 0.0);
    aOutTranslateZ = nAttr.create("outTranslateZ", "otz", MFnNumericData::kDouble, 0.0);
    aOutTranslate  = nAttr.create("outTranslate", "ot", aOutTranslateX, aOutTranslateY, aOutTranslateZ);
    nAttr.setWritable(false);
    nAttr.setStorable(false);

    aOutRotateX = uAttr.create("outRotateX", "orox", MFnUnitAttribute::kAngle, 0.0);
    aOutRotateY = uAttr.create("outRotateY", "oroy", MFnUnitAttribute::kAngle, 0.0);
    aOutRotateZ = uAttr.create("outRotateZ", "oroz", MFnUnitAttribute::kAngle, 0.0);
    aOutRotate  = nAttr.create("outRotate", "oro", aOutRotateX, aOutRotateY, aOutRotateZ);
    nAttr.setWritable(false);
    nAttr.setStorable(false);

    aOutDriverAngle = uAttr.create("outDriverAngle", "oda", MFnUnitAttribute::kAngle, 0.0);
    uAttr.setWritable(false);
    uAttr.setStorable(false);

    aOut = cAttr.create("out", "out");
    cAttr.addChild(aOutTranslate);
    cAttr.addChild(aOutRotate);
    cAttr.addChild(aOutDriverAngle);
    cAttr.setArray(true);
    cAttr.setUsesArrayDataBuilder(true);
    cAttr.setWritable(false);
    cAttr.setStorable(false);
    addAttribute(aOut);

    // --- affects -----------------------------------------------------------
    // every child is listed next to its parent: a compound dirtied through the
    // parent is what a connection gives, a value typed in the channel box
    // dirties the child alone and never reaches compute if only the parent is
    // declared here
    const MObject inputs[] = {
        aDriverMode,
        aDriverRotate, aDriverRotateX, aDriverRotateY, aDriverRotateZ,
        aDriverRotateOrder,
        aChildMatrix, aParentInverseMatrix, aRestMatrix,
        aOffsetRotate, aOffsetRotateX, aOffsetRotateY, aOffsetRotateZ,
        aScale,
        aMirrorAxis, aMirrorAxisX, aMirrorAxisY, aMirrorAxisZ,
        aJoint, aAxis, aBind, aAngleMin, aAngleMax, aPosMin, aPosMax,
        aSwingMin, aSwingMax, aReverse
    };
    const MObject outputs[] = { aOutBendY, aOutBendZ, aOut };

    for (const MObject& in : inputs)
        for (const MObject& out : outputs)
            attributeAffects(in, out);

    return MS::kSuccess;
}

MStatus PkIbtwNode::compute(const MPlug& plug, MDataBlock& data)
{
    const MObject attr = plug.attribute();
    const bool wanted = (attr == aOutBendY || attr == aOutBendZ ||
                         attr == aOut || attr == aOutTranslate ||
                         attr == aOutTranslateX || attr == aOutTranslateY ||
                         attr == aOutTranslateZ || attr == aOutRotate ||
                         attr == aOutRotateX || attr == aOutRotateY ||
                         attr == aOutRotateZ || attr == aOutDriverAngle);
    if (!wanted)
        return MS::kUnknownParameter;

    MStatus status;

    const double3& dr = data.inputValue(aDriverRotate, &status).asDouble3();
    if (!status) return status;
    const short    order = data.inputValue(aDriverRotateOrder, &status).asShort();
    const double3& ofr   = data.inputValue(aOffsetRotate, &status).asDouble3();
    const double   scale = data.inputValue(aScale, &status).asDouble();
    const double3& mir   = data.inputValue(aMirrorAxis, &status).asDouble3();

    // on the mirrored side the same parameters are read through one connection
    // per joint, and the frames of the two sides are related by these signs
    const double sx = sign(mir[0]);
    const double sy = sign(mir[1]);
    const double sz = sign(mir[2]);
    // an odd number of flips turns the map into a reflection: a rotation
    // conjugated by it keeps its angle but its axis gains that sign
    const double det = sx * sy * sz;

    const MEulerRotation::RotationOrder ro = orderFromEnum(order);

    MQuaternion qDriver;
    if (data.inputValue(aDriverMode, &status).asShort() == 1)
    {
        const MMatrix child     = data.inputValue(aChildMatrix, &status).asMatrix();
        const MMatrix parentInv = data.inputValue(aParentInverseMatrix, &status).asMatrix();
        const MMatrix rest      = data.inputValue(aRestMatrix, &status).asMatrix();

        // the child stated in the space of the parent, and then only what
        // changed since the rest pose. In maya's row vector order that states
        // the change in the frame the child had at rest - the frame the
        // correctives are children of - so X is the bone axis here as well.
        const MMatrix delta = child * parentInv * rest.inverse();

        qDriver = MTransformationMatrix(delta).rotation();
    }
    else
    {
        qDriver = MEulerRotation(dr[0], dr[1], dr[2], ro).asQuaternion();
    }

    MQuaternion qOffset = MEulerRotation(ofr[0], ofr[1], ofr[2], ro).asQuaternion();
    // the offset comes from the left solver, so it is stated in the left frame
    qOffset = MQuaternion(det * sx * qOffset.x, det * sy * qOffset.y,
                          det * sz * qOffset.z, qOffset.w);

    // the offset moves the neutral pose: what is measured is how far the joint
    // is from the offset, not from its own zero
    const MQuaternion q = qOffset.inverse() * qDriver;

    // the bend, with the twist around the bone taken out
    MVector swAxis(0.0, 0.0, 1.0);
    double  swAngle = 0.0;
    swingAboutX(q).getAxisAngle(swAxis, swAngle);

    // keep the angle in [-pi, pi] so the sign of the bend stays readable
    if (swAngle > kPi)
    {
        swAngle = 2.0 * kPi - swAngle;
        swAxis  = -swAxis;
    }

    // degrees from zero in the default pose, positive when the tip of the bone
    // moves towards that axis. `sy`/`sz` read them back into the frame the
    // parameters are stated in, so the same angleMax picks out the mirrored
    // pose however this side happens to be oriented.
    const double bendY = swAngle * swAxis.z * sy;
    const double bendZ = -swAngle * swAxis.y * sz;

    MDataHandle hBendY = data.outputValue(aOutBendY, &status);
    if (status) { hBendY.setMAngle(MAngle(bendY, MAngle::kRadians)); hBendY.setClean(); }

    MDataHandle hBendZ = data.outputValue(aOutBendZ, &status);
    if (status) { hBendZ.setMAngle(MAngle(bendZ, MAngle::kRadians)); hBendZ.setClean(); }

    MArrayDataHandle hJoints = data.inputArrayValue(aJoint, &status);
    if (!status) return status;

    MArrayDataHandle hOuts = data.outputArrayValue(aOut, &status);
    if (!status) return status;
    MArrayDataBuilder builder = hOuts.builder(&status);
    if (!status) return status;

    const unsigned int count = hJoints.elementCount();
    for (unsigned int i = 0; i < count; ++i)
    {
        if (!hJoints.jumpToArrayElement(i))
            continue;

        const unsigned int index = hJoints.elementIndex();
        MDataHandle hJoint = hJoints.inputValue(&status);
        if (!status) continue;

        const short  axis     = hJoint.child(aAxis).asShort();
        const double bind     = hJoint.child(aBind).asDouble();
        const double angleMin = hJoint.child(aAngleMin).asAngle().asRadians();
        const double angleMax = hJoint.child(aAngleMax).asAngle().asRadians();
        const double posMin   = hJoint.child(aPosMin).asDouble();
        const double posMax   = hJoint.child(aPosMax).asDouble();
        const double swingMin = hJoint.child(aSwingMin).asAngle().asRadians();
        const double swingMax = hJoint.child(aSwingMax).asAngle().asRadians();
        const bool   reverse  = hJoint.child(aReverse).asBool();

        const double driver = (axis == 0) ? bendY : bendZ;

        // one formula for both directions: with angleMax < angleMin the
        // denominator flips sign and the clamp still lands 0 at angleMin and 1
        // at angleMax. a zero range holds at the min end instead of the jump to
        // the origin the setRange gave.
        double t = 0.0;
        const double range = angleMax - angleMin;
        if (std::fabs(range) > kEps)
            t = std::min(std::max((driver - angleMin) / range, 0.0), 1.0);

        const double radius = lerp(posMin, posMax, t) * (reverse ? -1.0 : 1.0) * scale;
        const double swing  = lerp(swingMin, swingMax, t);

        // where the joint rests: radius `radius` from the bone axis, swung
        // around the origin of the driver by `swing`, so it travels along a
        // circle instead of sliding along the bone
        const double along  = radius * std::sin(swing);
        const double radial = radius * std::cos(swing);

        MVector p(along, (axis == 0) ? radial : 0.0, (axis == 0) ? 0.0 : radial);

        // the offset is stated in the frame of the left side, this puts it in
        // the frame of this one
        p.x *= sx;
        p.y *= sy;
        p.z *= sz;

        // bind 0 - the joint keeps the frame of the parent, so the rotation of
        // the driver is fully taken back; bind 1 - it follows the driver.
        // the same partial inverse goes on the position, not only on the
        // orientation - the joint is a child of the driver, so without it the
        // position rides along with the bone whatever bind says, and the joint
        // never lands between the bone and its parent. rotating the position
        // around the origin is the same circular travel `swing` does by hand,
        // which is what makes 0.5 sit halfway.
        const MQuaternion qLag = scaledRotation(q, 1.0 - bind).inverse();
        p = p.rotateBy(qLag);

        MDataHandle hOut = builder.addElement(index, &status);
        if (!status) continue;

        hOut.child(aOutTranslate).set3Double(p.x, p.y, p.z);

        const MEulerRotation eRot = qLag.asEulerRotation();
        hOut.child(aOutRotate).set3Double(eRot.x, eRot.y, eRot.z);

        hOut.child(aOutDriverAngle).setMAngle(MAngle(driver, MAngle::kRadians));
    }

    hOuts.set(builder);
    hOuts.setAllClean();

    return MS::kSuccess;
}
