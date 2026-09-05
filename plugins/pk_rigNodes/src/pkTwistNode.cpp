#include "pkTwistNode.h"

#include <maya/MAngle.h>
#include <maya/MArrayDataBuilder.h>
#include <maya/MEulerRotation.h>
#include <maya/MFnCompoundAttribute.h>
#include <maya/MFnEnumAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MFnUnitAttribute.h>

#include <algorithm>
#include <cmath>

MObject PkTwistNode::aCtrlTranslate;
MObject PkTwistNode::aCtrlTranslateX, PkTwistNode::aCtrlTranslateY, PkTwistNode::aCtrlTranslateZ;
MObject PkTwistNode::aCtrlRotate;
MObject PkTwistNode::aCtrlRotateX, PkTwistNode::aCtrlRotateY, PkTwistNode::aCtrlRotateZ;
MObject PkTwistNode::aCtrlRotateOrder;
MObject PkTwistNode::aBoneTranslate;
MObject PkTwistNode::aBoneTranslateX, PkTwistNode::aBoneTranslateY, PkTwistNode::aBoneTranslateZ;
MObject PkTwistNode::aFalloff;
MObject PkTwistNode::aDriver;
MObject PkTwistNode::aDriverRotate;
MObject PkTwistNode::aDriverRotateX, PkTwistNode::aDriverRotateY, PkTwistNode::aDriverRotateZ;
MObject PkTwistNode::aDriverRotateOrder;
MObject PkTwistNode::aDriverRest;
MObject PkTwistNode::aDriverOrient;
MObject PkTwistNode::aDriverOrientX, PkTwistNode::aDriverOrientY, PkTwistNode::aDriverOrientZ;
MObject PkTwistNode::aDriverRestX, PkTwistNode::aDriverRestY, PkTwistNode::aDriverRestZ;
MObject PkTwistNode::aDriverPosition;
MObject PkTwistNode::aDriverAmount;
MObject PkTwistNode::aDriverInherited;
MObject PkTwistNode::aJoint;
MObject PkTwistNode::aPosition;
MObject PkTwistNode::aOut;
MObject PkTwistNode::aOutTranslate;
MObject PkTwistNode::aOutTranslateX, PkTwistNode::aOutTranslateY, PkTwistNode::aOutTranslateZ;
MObject PkTwistNode::aOutRotate;
MObject PkTwistNode::aOutRotateX, PkTwistNode::aOutRotateY, PkTwistNode::aOutRotateZ;
MObject PkTwistNode::aOutWeight;

namespace
{
    const double kEps = 1.0e-9;
    const double kPi  = 3.14159265358979323846;

    // where the control sits along the bone
    const double kCtrlPosition = 0.5;

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

    // The bell: 0 at both ends of the bone, 1 in its middle.
    double weight(double u, double falloff)
    {
        const double s = std::sin(kPi * u);
        if (s <= 0.0)
            return 0.0;

        return (std::fabs(falloff - 1.0) <= kEps) ? s : std::pow(s, falloff);
    }

    // How fast the bell changes - what the tangent of the chain is built from.
    double weightSlope(double u, double falloff)
    {
        const double s = std::sin(kPi * u);
        const double c = std::cos(kPi * u);

        if (std::fabs(falloff - 1.0) <= kEps)
            return kPi * c;

        // at the very ends the bell itself is zero, so a slope of zero is the
        // honest answer for falloff > 1 and harmless for falloff < 1, where the
        // exact one is unbounded
        if (s <= kEps)
            return 0.0;

        return falloff * std::pow(s, falloff - 1.0) * kPi * c;
    }

    // How much of the driver reaches a joint: all of it at the end the driver
    // sits at, none at the other one.
    double driverRamp(double u, double position)
    {
        const double reach = std::max(position, 1.0 - position);
        if (reach <= kEps)
            return 0.0;

        return std::max(0.0, 1.0 - std::fabs(u - position) / reach);
    }

    // The part of a rotation that turns around `axis`, as a signed angle.
    // Everything else - the bend - is dropped, and has to be: the elbow bending
    // must not read as the forearm twisting.
    double twistAbout(const MQuaternion& q, const MVector& axis)
    {
        const double proj = MVector(q.x, q.y, q.z) * axis;
        const double len  = std::sqrt(proj * proj + q.w * q.w);
        if (len <= kEps)
            return 0.0;

        double angle = 2.0 * std::atan2(proj / len, q.w / len);
        while (angle >  kPi) angle -= 2.0 * kPi;
        while (angle < -kPi) angle += 2.0 * kPi;

        return angle;
    }

}

void* PkTwistNode::creator()
{
    return new PkTwistNode();
}

MStatus PkTwistNode::initialize()
{
    MFnNumericAttribute  nAttr;
    MFnUnitAttribute     uAttr;
    MFnEnumAttribute     eAttr;
    MFnCompoundAttribute cAttr;

    // --- inputs ------------------------------------------------------------
    aCtrlTranslateX = nAttr.create("ctrlTranslateX", "ctx", MFnNumericData::kDouble, 0.0);
    aCtrlTranslateY = nAttr.create("ctrlTranslateY", "cty", MFnNumericData::kDouble, 0.0);
    aCtrlTranslateZ = nAttr.create("ctrlTranslateZ", "ctz", MFnNumericData::kDouble, 0.0);
    aCtrlTranslate  = nAttr.create("ctrlTranslate", "ct", aCtrlTranslateX, aCtrlTranslateY, aCtrlTranslateZ);
    nAttr.setKeyable(true);
    addAttribute(aCtrlTranslate);

    aCtrlRotateX = uAttr.create("ctrlRotateX", "crx", MFnUnitAttribute::kAngle, 0.0);
    aCtrlRotateY = uAttr.create("ctrlRotateY", "cry", MFnUnitAttribute::kAngle, 0.0);
    aCtrlRotateZ = uAttr.create("ctrlRotateZ", "crz", MFnUnitAttribute::kAngle, 0.0);
    aCtrlRotate  = nAttr.create("ctrlRotate", "cr", aCtrlRotateX, aCtrlRotateY, aCtrlRotateZ);
    nAttr.setKeyable(true);
    addAttribute(aCtrlRotate);

    aCtrlRotateOrder = eAttr.create("ctrlRotateOrder", "cro", 0);
    eAttr.addField("xyz", 0);
    eAttr.addField("yzx", 1);
    eAttr.addField("zxy", 2);
    eAttr.addField("xzy", 3);
    eAttr.addField("yxz", 4);
    eAttr.addField("zyx", 5);
    eAttr.setKeyable(true);
    addAttribute(aCtrlRotateOrder);

    aBoneTranslateX = nAttr.create("boneTranslateX", "btx", MFnNumericData::kDouble, 1.0);
    aBoneTranslateY = nAttr.create("boneTranslateY", "bty", MFnNumericData::kDouble, 0.0);
    aBoneTranslateZ = nAttr.create("boneTranslateZ", "btz", MFnNumericData::kDouble, 0.0);
    aBoneTranslate  = nAttr.create("boneTranslate", "bt", aBoneTranslateX, aBoneTranslateY, aBoneTranslateZ);
    nAttr.setKeyable(true);
    addAttribute(aBoneTranslate);

    aFalloff = nAttr.create("falloff", "fo", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.01);
    nAttr.setSoftMax(8.0);
    nAttr.setKeyable(true);
    addAttribute(aFalloff);

    aDriverRotateX = uAttr.create("driverRotateX", "drx", MFnUnitAttribute::kAngle, 0.0);
    aDriverRotateY = uAttr.create("driverRotateY", "dry", MFnUnitAttribute::kAngle, 0.0);
    aDriverRotateZ = uAttr.create("driverRotateZ", "drz", MFnUnitAttribute::kAngle, 0.0);
    aDriverRotate  = nAttr.create("driverRotate", "dr", aDriverRotateX, aDriverRotateY, aDriverRotateZ);
    nAttr.setKeyable(true);

    aDriverRotateOrder = eAttr.create("driverRotateOrder", "dro", 0);
    eAttr.addField("xyz", 0);
    eAttr.addField("yzx", 1);
    eAttr.addField("zxy", 2);
    eAttr.addField("xzy", 3);
    eAttr.addField("yxz", 4);
    eAttr.addField("zyx", 5);
    eAttr.setKeyable(true);

    aDriverRestX = uAttr.create("driverRestX", "drrx", MFnUnitAttribute::kAngle, 0.0);
    aDriverRestY = uAttr.create("driverRestY", "drry", MFnUnitAttribute::kAngle, 0.0);
    aDriverRestZ = uAttr.create("driverRestZ", "drrz", MFnUnitAttribute::kAngle, 0.0);
    aDriverRest  = nAttr.create("driverRest", "drr", aDriverRestX, aDriverRestY, aDriverRestZ);
    nAttr.setKeyable(true);

    aDriverOrientX = uAttr.create("driverOrientX", "dorx", MFnUnitAttribute::kAngle, 0.0);
    aDriverOrientY = uAttr.create("driverOrientY", "dory", MFnUnitAttribute::kAngle, 0.0);
    aDriverOrientZ = uAttr.create("driverOrientZ", "dorz", MFnUnitAttribute::kAngle, 0.0);
    aDriverOrient  = nAttr.create("driverOrient", "dor", aDriverOrientX, aDriverOrientY, aDriverOrientZ);
    nAttr.setKeyable(true);

    aDriverPosition = nAttr.create("driverPosition", "dpo", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aDriverAmount = nAttr.create("driverAmount", "dam", MFnNumericData::kDouble, 1.0);
    nAttr.setSoftMin(0.0);
    nAttr.setSoftMax(1.0);
    nAttr.setKeyable(true);

    aDriverInherited = nAttr.create("driverInherited", "din", MFnNumericData::kBoolean, false);
    nAttr.setKeyable(true);

    aDriver = cAttr.create("driver", "drv");
    cAttr.addChild(aDriverRotate);
    cAttr.addChild(aDriverRotateOrder);
    cAttr.addChild(aDriverRest);
    cAttr.addChild(aDriverOrient);
    cAttr.addChild(aDriverPosition);
    cAttr.addChild(aDriverAmount);
    cAttr.addChild(aDriverInherited);
    cAttr.setArray(true);
    addAttribute(aDriver);

    aPosition = nAttr.create("position", "pos", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aJoint = cAttr.create("joint", "jnt");
    cAttr.addChild(aPosition);
    cAttr.setArray(true);
    addAttribute(aJoint);

    // --- outputs -----------------------------------------------------------
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

    aOutWeight = nAttr.create("outWeight", "ow", MFnNumericData::kDouble, 0.0);
    nAttr.setWritable(false);
    nAttr.setStorable(false);

    aOut = cAttr.create("out", "out");
    cAttr.addChild(aOutTranslate);
    cAttr.addChild(aOutRotate);
    cAttr.addChild(aOutWeight);
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
        aCtrlTranslate, aCtrlTranslateX, aCtrlTranslateY, aCtrlTranslateZ,
        aCtrlRotate, aCtrlRotateX, aCtrlRotateY, aCtrlRotateZ,
        aCtrlRotateOrder,
        aBoneTranslate, aBoneTranslateX, aBoneTranslateY, aBoneTranslateZ,
        aFalloff,
        aDriver,
        aDriverRotate, aDriverRotateX, aDriverRotateY, aDriverRotateZ,
        aDriverRotateOrder,
        aDriverRest, aDriverRestX, aDriverRestY, aDriverRestZ,
        aDriverOrient, aDriverOrientX, aDriverOrientY, aDriverOrientZ,
        aDriverPosition, aDriverAmount, aDriverInherited,
        aJoint, aPosition
    };
    const MObject outputs[] = { aOut };

    for (const MObject& in : inputs)
        for (const MObject& out : outputs)
            attributeAffects(in, out);

    return MS::kSuccess;
}

MStatus PkTwistNode::compute(const MPlug& plug, MDataBlock& data)
{
    const MObject attr = plug.attribute();
    const bool wanted = (attr == aOut || attr == aOutTranslate ||
                         attr == aOutTranslateX || attr == aOutTranslateY ||
                         attr == aOutTranslateZ || attr == aOutRotate ||
                         attr == aOutRotateX || attr == aOutRotateY ||
                         attr == aOutRotateZ || attr == aOutWeight);
    if (!wanted)
        return MS::kUnknownParameter;

    MStatus status;

    const double3& ct    = data.inputValue(aCtrlTranslate, &status).asDouble3();
    if (!status) return status;
    const double3& cr    = data.inputValue(aCtrlRotate, &status).asDouble3();
    const short    order = data.inputValue(aCtrlRotateOrder, &status).asShort();
    const double3& bt    = data.inputValue(aBoneTranslate, &status).asDouble3();
    const double   falloff = data.inputValue(aFalloff, &status).asDouble();


    const MVector bone(bt[0], bt[1], bt[2]);
    const MVector ctrlT(ct[0], ct[1], ct[2]);

    const MEulerRotation::RotationOrder ro = orderFromEnum(order);
    const MQuaternion qCtrl = MEulerRotation(cr[0], cr[1], cr[2], ro).asQuaternion();

    // The rotation of the control is split about the bone: what turns around
    // the bone itself is the twist and only rolls the joints, the rest is the
    // swing and only shifts them sideways. Without the split a twist would be
    // lost - (axis x offset) is zero when the two are parallel - and a mixed
    // rotation would leak from one into the other.
    const MVector boneDir = (bone.length() > kEps) ? bone.normal() : MVector::xAxis;

    const double twistAngle = twistAbout(qCtrl, boneDir);

    const MQuaternion qTwist(twistAngle, boneDir);
    const MQuaternion qSwing = qCtrl * qTwist.inverse();

    // the swing as an axis and an angle: what the joints get out of it is a
    // sideways shift along (axis x offset), not a swing around the control
    MVector rotAxis(0.0, 0.0, 1.0);
    double  rotAngle = 0.0;
    qSwing.getAxisAngle(rotAxis, rotAngle);
    if (rotAngle > kPi)
    {
        rotAngle = 2.0 * kPi - rotAngle;
        rotAxis  = -rotAxis;
    }

    // --- 0. the bones that twist the chain -----------------------------------
    // worked out once: they are the same for every joint of the chain
    std::vector<Driver>& drivers = mDrivers;
    drivers.clear();

    MArrayDataHandle hDrivers = data.inputArrayValue(aDriver, &status);
    if (status)
    {
        drivers.reserve(hDrivers.elementCount());

        for (unsigned int i = 0; i < hDrivers.elementCount(); ++i)
        {
            if (!hDrivers.jumpToArrayElement(i))
                continue;

            MDataHandle hDriver = hDrivers.inputValue(&status);
            if (!status) continue;

            const double3& dr  = hDriver.child(aDriverRotate).asDouble3();
            const double3& drr = hDriver.child(aDriverRest).asDouble3();
            const double3& dor = hDriver.child(aDriverOrient).asDouble3();
            const MEulerRotation::RotationOrder dro =
                orderFromEnum(hDriver.child(aDriverRotateOrder).asShort());

            // the whole local orientation, rotate and jointOrient together: the
            // rotate channel alone turns around the axes of the driver itself,
            // and those are not the axes of the bone the chain hangs on
            const MQuaternion qOrient =
                MEulerRotation(dor[0], dor[1], dor[2], MEulerRotation::kXYZ).asQuaternion();

            const MQuaternion q     = MEulerRotation(dr[0], dr[1], dr[2], dro).asQuaternion() * qOrient;
            const MQuaternion qRest = MEulerRotation(drr[0], drr[1], drr[2], dro).asQuaternion() * qOrient;

            const bool inherited = hDriver.child(aDriverInherited).asBool();

            // Above the chain: the change of the bone itself, as its children
            // see it. Below: the change of the child, stated in the frame of
            // the bone. The two orders are not interchangeable - either one
            // taken the wrong way round turns the axis by the rest pose, and
            // that is a change of sign on a mirrored side.
            const MQuaternion delta = inherited ? (q * qRest.inverse())
                                               : (qRest.inverse() * q);

            Driver d;
            d.angle     = twistAbout(delta, boneDir)
                        * hDriver.child(aDriverAmount).asDouble();
            d.position  = hDriver.child(aDriverPosition).asDouble();
            d.inherited = inherited ? 1.0 : 0.0;

            drivers.push_back(d);
        }
    }

    MArrayDataHandle hJoints = data.inputArrayValue(aJoint, &status);
    if (!status) return status;

    MArrayDataHandle hOuts = data.outputArrayValue(aOut, &status);
    if (!status) return status;
    MArrayDataBuilder builder = hOuts.builder(&status);
    if (!status) return status;

    // --- 1. where every joint has to end up, in the frame of the bone --------
    // The elements come in the order of the chain: that is how they are built,
    // one element per joint, index 0 at the root of the bone.
    std::vector<Item>& items = mItems;
    items.clear();
    items.reserve(hJoints.elementCount());

    for (unsigned int i = 0; i < hJoints.elementCount(); ++i)
    {
        if (!hJoints.jumpToArrayElement(i))
            continue;

        MDataHandle hJoint = hJoints.inputValue(&status);
        if (!status) continue;

        const double u = std::min(std::max(hJoint.child(aPosition).asDouble(), 0.0), 1.0);

        // nothing about the rest pose is stored: it is the bone itself, so the
        // chain spreads over whatever length the bone has right now
        const MVector offset = bone * (u - kCtrlPosition);

        const double w  = weight(u, falloff);
        const double wp = weightSlope(u, falloff);

        Item it;
        it.index        = hJoints.elementIndex();
        it.weight       = w;
        // what is already there is taken off: with a driver above the chain its
        // rotation is inherited by every joint before the node says anything,
        // so what is left to do is give it back towards the far end
        it.driverRoll = 0.0;
        for (size_t k = 0; k < drivers.size(); ++k)
            it.driverRoll += drivers[k].angle
                           * (driverRamp(u, drivers[k].position) - drivers[k].inherited);

        it.position = offset + (ctrlT + (rotAxis ^ offset) * rotAngle) * w;

        // Where the joint looks: the tangent of the curve the chain lies on,
        // worked out from the formula rather than from the joints around it.
        //
        // Aiming at the next joint is the same thing only while the joints keep
        // their order, and they do not have to: move the control along the bone
        // far enough and a joint slides past its neighbour, the segment to it
        // turns backwards and the joint ends up looking at the middle of the
        // chain. The tangent is where the curve goes, not where the next joint
        // happens to be, and it is smooth by construction.
        //
        //   position(u) = offset(u) + (ctrlT + (n x offset(u)) * a) * weight(u)
        //   offset(u)   = bone * (u - 0.5)
        //
        // so differentiating by u gives:
        it.tangent = bone + ctrlT * wp
                   + (rotAxis ^ bone) * rotAngle * (w + (u - kCtrlPosition) * wp);

        items.push_back(it);
    }

    // the bone itself, where the chain hangs from
    const MVector boneRoot = bone * -kCtrlPosition;

    // --- 2. where every joint has to look ------------------------------------
    // What the node hands out is the deformation, not an orientation: the
    // joints are built with the orientation of the bone and keep it, and all
    // that is added is how far the tangent has moved away from the bone.
    //
    // Pointing them at the tangent starting from the X axis instead puts half a
    // turn on every joint of a side whose bones run the other way - a skeleton
    // mirrored by turning the joints rather than by a negative scale has
    // exactly that. Their own axes then end up opposite to the ones on the
    // other side, and the two sides stop being mirrors of each other.
    //
    // The turn from the bone onto the tangent is also small by construction -
    // the tangent is the bone plus the deformation - so it never comes near the
    // one place a shortest-rotation is undefined.
    for (size_t i = 0; i < items.size(); ++i)
    {
        const MVector dir = items[i].tangent;

        const MQuaternion qAim = (dir.length() > kEps)
                               ? MQuaternion(boneDir, dir.normal())
                               : MQuaternion::identity;

        // around the bone, the same axis the twist was measured about - not
        // around X, which is a different axis entirely on a side whose bones
        // run backwards. The control and the neighbouring bone are independent
        // and add up.
        const double roll = twistAngle * items[i].weight + items[i].driverRoll;

        items[i].rotation = MQuaternion(roll, boneDir) * qAim;
    }

    // --- 3. the same, stated the way a nested chain wants it ------------------
    MVector     prevPos = boneRoot;
    MQuaternion prevRot = MQuaternion::identity;

    for (size_t i = 0; i < items.size(); ++i)
    {
        const Item& it = items[i];

        const MQuaternion prevInv = prevRot.inverse();
        const MVector     localT  = (it.position - prevPos).rotateBy(prevInv);
        const MQuaternion localQ  = it.rotation * prevInv;

        MDataHandle hOut = builder.addElement(it.index, &status);
        if (!status) continue;

        hOut.child(aOutTranslate).set3Double(localT.x, localT.y, localT.z);

        const MEulerRotation eRot = localQ.asEulerRotation();
        hOut.child(aOutRotate).set3Double(eRot.x, eRot.y, eRot.z);

        hOut.child(aOutWeight).setDouble(it.weight);

        prevPos = it.position;
        prevRot = it.rotation;
    }

    hOuts.set(builder);
    hOuts.setAllClean();

    return MS::kSuccess;
}
