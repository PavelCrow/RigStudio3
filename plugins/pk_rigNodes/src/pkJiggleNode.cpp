#include "pkJiggleNode.h"

#include <maya/MEvaluationNode.h>
#include <maya/MFnMatrixAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MFnUnitAttribute.h>
#include <maya/MNodeCacheDisablingInfo.h>
#include <maya/MNodeCacheSetupInfo.h>
#include <maya/MObjectArray.h>
#include <maya/MTime.h>
#include <maya/MTransformationMatrix.h>

#include <algorithm>
#include <cmath>

MObject PkJiggleNode::aTime;
MObject PkJiggleNode::aStartFrame;
MObject PkJiggleNode::aEnable;
MObject PkJiggleNode::aWeight;
MObject PkJiggleNode::aStiffness;
MObject PkJiggleNode::aDamping;
MObject PkJiggleNode::aTranslate;
MObject PkJiggleNode::aRotate;
MObject PkJiggleNode::aLimit;
MObject PkJiggleNode::aAxisScale;
MObject PkJiggleNode::aAxisScaleX, PkJiggleNode::aAxisScaleY, PkJiggleNode::aAxisScaleZ;
MObject PkJiggleNode::aGravity;
MObject PkJiggleNode::aGravityDirection;
MObject PkJiggleNode::aGravityDirectionX, PkJiggleNode::aGravityDirectionY, PkJiggleNode::aGravityDirectionZ;
MObject PkJiggleNode::aSubsteps;
pk::Attrs PkJiggleNode::aHit;
MObject PkJiggleNode::aInMatrix;
MObject PkJiggleNode::aParentInverse;
MObject PkJiggleNode::aOutMatrix;

namespace
{
    const double kEps = 1.0e-9;

    // more than this many frames forward at once is a jump across the
    // timeline, not playback
    const double kMaxJump = 1000.0;
    const int    kMaxSteps = 10000;

    // the spring at stiffness 1, per frame squared - the same one the chain
    // has, so a number tuned there means the same thing here
    const double kMaxK = 20.0;

    // what a chain with no stiffness at all is damped by, since there is no
    // frequency of its own to measure the ratio against
    const double kMinW = 0.09;

    MPoint lerp(const MPoint& a, const MPoint& b, double t)
    {
        return a + (b - a) * t;
    }
}

void* PkJiggleNode::creator()
{
    return new PkJiggleNode();
}

MStatus PkJiggleNode::initialize()
{
    MFnNumericAttribute nAttr;
    MFnUnitAttribute    uAttr;
    MFnMatrixAttribute  mAttr;

    aTime = uAttr.create("time", "tm", MFnUnitAttribute::kTime, 0.0);
    uAttr.setKeyable(false);

    aStartFrame = nAttr.create("startFrame", "sf", MFnNumericData::kDouble, 1.0);
    nAttr.setKeyable(true);

    aEnable = nAttr.create("enable", "en", MFnNumericData::kBoolean, true);
    nAttr.setKeyable(true);

    aWeight = nAttr.create("weight", "w", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aStiffness = nAttr.create("stiffness", "st", MFnNumericData::kDouble, 0.25);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aDamping = nAttr.create("damping", "dmp", MFnNumericData::kDouble, 0.35);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aTranslate = nAttr.create("translate", "trn", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aRotate = nAttr.create("rotate", "rot", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aLimit = nAttr.create("limit", "lim", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(10.0);
    nAttr.setKeyable(true);

    aAxisScaleX = nAttr.create("axisScaleX", "asx", MFnNumericData::kDouble, 1.0);
    aAxisScaleY = nAttr.create("axisScaleY", "asy", MFnNumericData::kDouble, 1.0);
    aAxisScaleZ = nAttr.create("axisScaleZ", "asz", MFnNumericData::kDouble, 1.0);
    aAxisScale = nAttr.create("axisScale", "as", aAxisScaleX, aAxisScaleY, aAxisScaleZ);
    nAttr.setKeyable(true);

    aGravity = nAttr.create("gravity", "gr", MFnNumericData::kDouble, 0.0);
    nAttr.setKeyable(true);

    aGravityDirectionX = nAttr.create("gravityDirectionX", "gdx", MFnNumericData::kDouble, 0.0);
    aGravityDirectionY = nAttr.create("gravityDirectionY", "gdy", MFnNumericData::kDouble, -1.0);
    aGravityDirectionZ = nAttr.create("gravityDirectionZ", "gdz", MFnNumericData::kDouble, 0.0);
    aGravityDirection = nAttr.create("gravityDirection", "gd",
                                     aGravityDirectionX, aGravityDirectionY, aGravityDirectionZ);
    nAttr.setKeyable(true);

    aSubsteps = nAttr.create("substeps", "ss", MFnNumericData::kInt, 1);
    nAttr.setMin(1);
    nAttr.setSoftMax(10);
    nAttr.setKeyable(true);

    pk::make(aHit);

    aInMatrix = mAttr.create("inMatrix", "im");
    aParentInverse = mAttr.create("parentInverseMatrix", "pim");

    aOutMatrix = mAttr.create("outMatrix", "om");
    mAttr.setWritable(false);
    mAttr.setStorable(false);

    const MObject ins[] = {
        aTime, aStartFrame, aEnable, aWeight, aStiffness, aDamping,
        aTranslate, aRotate, aLimit, aAxisScale,
        aGravity, aGravityDirection, aSubsteps, aInMatrix, aParentInverse,
    };

    std::vector<MObject> every(ins, ins + sizeof(ins) / sizeof(ins[0]));
    pk::list(aHit, every);

    for (const MObject& in : every)
        addAttribute(in);
    addAttribute(aOutMatrix);

    for (const MObject& in : every)
        attributeAffects(in, aOutMatrix);

    return MS::kSuccess;
}

void PkJiggleNode::getCacheSetup(const MEvaluationNode& evalNode,
                                 MNodeCacheDisablingInfo& disablingInfo,
                                 MNodeCacheSetupInfo& cacheSetupInfo,
                                 MObjectArray& monitoredAttributes) const
{
    MPxNode::getCacheSetup(evalNode, disablingInfo, cacheSetupInfo, monitoredAttributes);

    // filled in order from the start frame and restarted when an input
    // changes, the way any simulation has to be
    cacheSetupInfo.setPreference(MNodeCacheSetupInfo::kWantToCacheByDefault, true);
    cacheSetupInfo.setRequirement(MNodeCacheSetupInfo::kSimulationSupport, true);
}

PkJiggleNode::Step PkJiggleNode::solveStep(double w, double zeta, double h)
{
    Step st;

    // no spring at all - it drifts, with the drag of kMinW
    if (w <= kEps)
    {
        st.dd = 1.0;
        st.dv = h;
        st.vd = 0.0;
        st.vv = std::exp(-2.0 * zeta * kMinW * h);
        return st;
    }

    const double e = std::exp(-zeta * w * h);

    if (std::fabs(zeta - 1.0) < 1.0e-4)   // critical
    {
        st.dd = e * (1.0 + w * h);
        st.dv = e * h;
        st.vd = e * (-w * w * h);
        st.vv = e * (1.0 - w * h);
        return st;
    }

    if (zeta < 1.0)                        // swings
    {
        const double wd = w * std::sqrt(1.0 - zeta * zeta);
        const double c  = std::cos(wd * h);
        const double s  = std::sin(wd * h);

        st.dd = e * (c + zeta * w / wd * s);
        st.dv = e * (s / wd);
        st.vd = e * (-w * w / wd * s);
        st.vv = e * (c - zeta * w / wd * s);
        return st;
    }

    // crawls back - two real roots
    const double r  = w * std::sqrt(zeta * zeta - 1.0);
    const double ch = std::cosh(r * h);
    const double sh = std::sinh(r * h);

    st.dd = e * (ch + zeta * w / r * sh);
    st.dv = e * (sh / r);
    st.vd = e * (-w * w / r * sh);
    st.vv = e * (ch - zeta * w / r * sh);
    return st;
}

MVector PkJiggleNode::logOf(const MQuaternion& q)
{
    MQuaternion n = q;
    n.normalizeIt();

    // -q это тот же поворот, но длинным путём - берём короткий
    if (n.w < 0.0)
        n = MQuaternion(-n.x, -n.y, -n.z, -n.w);

    const double s = std::sqrt(std::max(0.0, 1.0 - n.w * n.w));
    if (s < 1.0e-8)
        return MVector(n.x, n.y, n.z) * 2.0;      // почти ничего: линейно

    const double angle = 2.0 * std::acos(std::min(1.0, std::max(-1.0, n.w)));
    return MVector(n.x, n.y, n.z) * (angle / s);
}

MQuaternion PkJiggleNode::expOf(const MVector& v)
{
    const double len = v.length();
    if (len < 1.0e-8)
    {
        MQuaternion q(v.x * 0.5, v.y * 0.5, v.z * 0.5, 1.0);
        q.normalizeIt();
        return q;
    }
    return MQuaternion(len, v / len);
}

void PkJiggleNode::reset(const MPoint& goal, const MQuaternion& spin)
{
    mCur.pos      = goal;
    mCur.vel      = MVector::zero;
    mCur.spin     = MQuaternion::identity;
    mCur.spinVel  = MVector::zero;
    mCur.goal     = goal;
    mCur.goalSpin = spin;
    mBase         = mCur;
    mLastDt       = 0.0;
    mInit         = true;
}

MStatus PkJiggleNode::compute(const MPlug& plug, MDataBlock& data)
{
    if (plug != aOutMatrix)
        return MS::kUnknownParameter;

    MStatus status;

    const MMatrix in = data.inputValue(aInMatrix).asMatrix();
    const MPoint  goal(in[3][0], in[3][1], in[3][2]);

    MMatrix rotOnly = in;
    rotOnly[3][0] = rotOnly[3][1] = rotOnly[3][2] = 0.0;
    const MQuaternion goalSpin = MTransformationMatrix(rotOnly).rotation();

    const double  t          = data.inputValue(aTime).asTime().as(MTime::uiUnit());
    const double  startFrame = data.inputValue(aStartFrame).asDouble();
    const bool    enable     = data.inputValue(aEnable).asBool();
    const double  weight     = data.inputValue(aWeight).asDouble();
    const double  fps        = std::max(1.0, MTime(1.0, MTime::kSeconds).as(MTime::uiUnit()));

    const double stiffness = data.inputValue(aStiffness).asDouble();
    const double damping   = data.inputValue(aDamping).asDouble();
    const double translate = data.inputValue(aTranslate).asDouble();
    const double rotate    = data.inputValue(aRotate).asDouble();
    const double limit     = data.inputValue(aLimit).asDouble();
    const MVector axisScale = data.inputValue(aAxisScale).asDouble3();
    const int    substeps  = std::max(1, data.inputValue(aSubsteps).asInt());

    pk::World hit;
    pk::read(data, aHit, hit);
    const double pad = data.inputValue(aHit.thickness).asDouble();

    MVector gDir = data.inputValue(aGravityDirection).asDouble3();
    if (gDir.length() > kEps)
        gDir.normalize();
    const MVector gravity = gDir * (data.inputValue(aGravity).asDouble() / (fps * fps));

    const double w    = std::sqrt(kMaxK) * stiffness;
    const double zeta = damping;

    // --- time ---------------------------------------------------------------
    MPoint      pos  = goal;
    MQuaternion spin = MQuaternion::identity;

    if (!enable)
    {
        mInit = false;
    }
    else
    {
        const double dt = t - mLastTime;
        const bool restart = !mInit
                          || t <= startFrame + kEps
                          || dt < -kEps
                          || dt > kMaxJump;

        if (restart)
        {
            reset(goal, goalSpin);
            mLastTime = t;
        }
        else
        {
            // the same frame again is redone from where it started, so asking
            // twice never pushes the simulation on
            const double step = (std::fabs(dt) <= kEps) ? mLastDt : dt;
            if (step > kEps)
            {
                if (std::fabs(dt) <= kEps)
                    mCur = mBase;
                else
                    mBase = mCur;

                const int    steps = std::min(kMaxSteps,
                                              std::max(1, int(std::ceil(step * substeps - kEps))));
                const double h     = step / steps;

                const Step   sp    = solveStep(w, zeta, h);
                const MVector accel = gravity * h;

                const MPoint      wasGoal = mCur.goal;
                const MQuaternion wasSpin = mCur.goalSpin;

                // The goal moves during the step, and solving against it as if
                // it stood still is what made substeps matter: with one step a
                // frame the bone chased a target already at its destination and
                // came out stiffer than it is. Measured on a slow move, the lag
                // was 0.212 at one substep against 0.497 at sixteen.
                //
                // A spring on a goal moving at a steady speed settles at a fixed
                // distance behind it - 2 * zeta / w times that speed. Take that
                // offset out and what is left is the plain homogeneous swing,
                // which the closed form above solves exactly. So the step is
                // exact for a goal moving in a straight line, which is what a
                // goal does between two frames, and substeps stop changing the
                // answer at all.
                const MVector speed = MVector(goal - wasGoal) / step;   // per frame
                const MVector behind = (w > kEps) ? speed * (2.0 * zeta / w) : MVector::zero;

                // то же для поворота: цель крутится с какой-то угловой
                // скоростью, и пружина висит на постоянном угле позади неё
                const MVector spinSpeed = logOf(wasSpin.inverse() * goalSpin) / step;
                const MVector spinBehind = (w > kEps) ? spinSpeed * (2.0 * zeta / w)
                                                      : MVector::zero;

                for (int k = 1; k <= steps; ++k)
                {
                    const double a = double(k) / steps;
                    const MPoint      g  = lerp(wasGoal, goal, a);
                    const MPoint      gWas = lerp(wasGoal, goal, double(k - 1) / steps);
                    const MQuaternion gs = slerp(wasSpin, goalSpin, a);

                    const MVector d = (mCur.pos - gWas) + behind;
                    const MVector v = (mCur.vel - speed) + accel;
                    mCur.pos = g - behind + (d * sp.dd + v * sp.dv);
                    mCur.vel = (d * sp.vd + v * sp.vv) + speed;

                    // The orientation, on the same spring and in the same
                    // arithmetic, once the turn is written as a vector - an axis
                    // multiplied by an angle. Taking an axis and an angle apart
                    // instead does not work: for a turn close to nothing the
                    // axis a quaternion reports is noise, the velocity projected
                    // onto it changes sign at random, and the spring feeds itself
                    // - the bone ends up spinning like a top.
                    //
                    // The offset is the variable itself here, and its own
                    // equation already knows the goal is turning away: what that
                    // does is hold the offset at a steady angle behind, the same
                    // 2 * zeta / w times the speed as for the position. Take that
                    // out, step what is left, put it back - and nothing else is
                    // needed. Carrying the offset across the goal's turn on top of
                    // that was counting the same motion twice: the bone trailed
                    // four times further than it should, 20 degrees on a spin
                    // where the arithmetic says 4.8.
                    const MVector e  = logOf(mCur.spin) + spinBehind;
                    const MVector ev = mCur.spinVel;
                    const MVector e1 = e * sp.dd + ev * sp.dv;
                    mCur.spinVel = e * sp.vd + ev * sp.vv;
                    mCur.spin = expOf(e1 - spinBehind);

                    // и наружу из всего, что стоит на пути: здесь толчок
                    // чувствуется - скорость, идущая в поверхность, гасится
                    if (hit.any())
                    {
                        for (int round = 0; round < pk::kRounds; ++round)
                            if (!pk::clear(mCur.pos, &mCur.vel, hit, pad))
                                break;
                    }

                    mCur.goal     = g;
                    mCur.goalSpin = gs;
                }

                mLastTime = t;
                mLastDt   = step;
            }
            else
            {
                reset(goal, goalSpin);
            }
        }

        mCur.goal     = goal;
        mCur.goalSpin = goalSpin;

        // --- what of it is kept ---------------------------------------------
        MVector off = mCur.pos - goal;

        // each direction gets what axisScale gives it, and the directions are
        // the goal's own
        if (std::fabs(axisScale.x - 1.0) > kEps || std::fabs(axisScale.y - 1.0) > kEps
            || std::fabs(axisScale.z - 1.0) > kEps)
        {
            const MVector ax[3] = {
                MVector(in[0][0], in[0][1], in[0][2]),
                MVector(in[1][0], in[1][1], in[1][2]),
                MVector(in[2][0], in[2][1], in[2][2]),
            };
            const double sc[3] = { axisScale.x, axisScale.y, axisScale.z };

            MVector kept;
            for (int i = 0; i < 3; ++i)
            {
                const double len = ax[i].length();
                if (len <= kEps)
                    continue;
                const MVector dir = ax[i] / len;
                kept += dir * ((off * dir) * sc[i]);
            }
            off = kept;
        }

        // and a wall, because something has to stop a soft spring on a body
        // that teleports
        if (limit > kEps && off.length() > limit)
            off = off.normal() * limit;

        pos  = goal + off * (weight * translate);
        spin = slerp(MQuaternion::identity, mCur.spin, weight * rotate);

        // Последнее слово. Вес, translate, axisScale и limit двигают уже готовую
        // точку, и любой из них может вернуть её внутрь поверхности.
        if (hit.any())
        {
            for (int round = 0; round < pk::kRounds; ++round)
                if (!pk::clear(pos, 0, hit, pad))
                    break;
        }
    }

    // --- output -------------------------------------------------------------
    // the scale and the shear of the input are left alone: only where it sits
    // and which way it faces is ours
    MMatrix out = in;
    out[3][0] = out[3][1] = out[3][2] = 0.0;
    out = out * spin.asMatrix();
    out[3][0] = pos.x;
    out[3][1] = pos.y;
    out[3][2] = pos.z;

    out = out * data.inputValue(aParentInverse).asMatrix();

    MDataHandle hOut = data.outputValue(aOutMatrix, &status);
    CHECK_MSTATUS_AND_RETURN_IT(status);
    hOut.setMMatrix(out);
    hOut.setClean();

    return MS::kSuccess;
}
