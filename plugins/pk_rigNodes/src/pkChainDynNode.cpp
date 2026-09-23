#include "pkChainDynNode.h"

#include <maya/MArrayDataBuilder.h>
#include <maya/MEvaluationNode.h>
#include <maya/MFileIO.h>
#include <maya/MFloatArray.h>
#include <maya/MFnEnumAttribute.h>
#include <maya/MFnMatrixAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MFnUnitAttribute.h>
#include <maya/MIntArray.h>
#include <maya/MNodeCacheDisablingInfo.h>
#include <maya/MNodeCacheSetupInfo.h>
#include <maya/MObjectArray.h>
#include <maya/MQuaternion.h>
#include <maya/MTransformationMatrix.h>
#include <maya/MRampAttribute.h>
#include <maya/MTime.h>

#include <algorithm>
#include <cmath>

MObject PkChainDynNode::aTime;
MObject PkChainDynNode::aStartFrame;
MObject PkChainDynNode::aEnable;
MObject PkChainDynNode::aWeight;
MObject PkChainDynNode::aStiffness;
MObject PkChainDynNode::aStiffnessRamp;
MObject PkChainDynNode::aDamping;
MObject PkChainDynNode::aGravity;
MObject PkChainDynNode::aGravityDirection;
MObject PkChainDynNode::aGravityDirectionX, PkChainDynNode::aGravityDirectionY, PkChainDynNode::aGravityDirectionZ;
MObject PkChainDynNode::aLengthKeep;
MObject PkChainDynNode::aSubsteps;
MObject PkChainDynNode::aSpaceMatrix;
MObject PkChainDynNode::aFollowSpace;
MObject PkChainDynNode::aGoalMatrix;
MObject PkChainDynNode::aOutputCount;
MObject PkChainDynNode::aAimAxis;
MObject PkChainDynNode::aOutMatrix;

namespace
{
    const double kEps = 1.0e-9;

    // more than this many frames forward at once is not simulated through -
    // it is a jump across the timeline, not playback
    const double kMaxJump = 1000.0;

    // and a batch never gets more steps than this, whatever substeps says
    const int kMaxSteps = 10000;

    // the spring at stiffness 1, per frame squared: the chain follows it with
    // a period of about a frame and a half
    const double kMaxK = 20.0;

    // A chain with no stiffness at all has no frequency to measure damping
    // against, and would keep swinging for ever. This is the frequency it is
    // damped by instead - stiffness 0.02 worth of it.
    const double kMinW = 0.09;

    MPoint lerp(const MPoint& a, const MPoint& b, double t)
    {
        return a + (b - a) * t;
    }
}

void* PkChainDynNode::creator()
{
    return new PkChainDynNode();
}

MStatus PkChainDynNode::initialize()
{
    MFnNumericAttribute nAttr;
    MFnUnitAttribute    uAttr;
    MFnMatrixAttribute  mAttr;
    MFnEnumAttribute    eAttr;

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

    aStiffness = nAttr.create("stiffness", "st", MFnNumericData::kDouble, 0.3);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aStiffnessRamp = MRampAttribute::createCurveRamp("stiffnessRamp", "str");

    aDamping = nAttr.create("damping", "dmp", MFnNumericData::kDouble, 0.15);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aGravity = nAttr.create("gravity", "gr", MFnNumericData::kDouble, 0.0);
    nAttr.setKeyable(true);

    aGravityDirectionX = nAttr.create("gravityDirectionX", "gdx", MFnNumericData::kDouble, 0.0);
    aGravityDirectionY = nAttr.create("gravityDirectionY", "gdy", MFnNumericData::kDouble, -1.0);
    aGravityDirectionZ = nAttr.create("gravityDirectionZ", "gdz", MFnNumericData::kDouble, 0.0);
    aGravityDirection = nAttr.create("gravityDirection", "gd",
                                     aGravityDirectionX, aGravityDirectionY, aGravityDirectionZ);
    nAttr.setKeyable(true);

    aLengthKeep = nAttr.create("lengthKeep", "lk", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aSubsteps = nAttr.create("substeps", "ss", MFnNumericData::kInt, 2);
    nAttr.setMin(1);
    nAttr.setSoftMax(10);
    nAttr.setKeyable(true);

    aSpaceMatrix = mAttr.create("spaceMatrix", "spm");

    aFollowSpace = nAttr.create("followSpace", "fs", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aOutputCount = nAttr.create("outputCount", "oc", MFnNumericData::kInt, 0);
    nAttr.setMin(0);
    nAttr.setSoftMax(40);
    nAttr.setKeyable(false);

    aAimAxis = eAttr.create("aimAxis", "aa", 0);
    eAttr.addField("x", 0);
    eAttr.addField("y", 1);
    eAttr.addField("z", 2);
    eAttr.addField("-x", 3);
    eAttr.addField("-y", 4);
    eAttr.addField("-z", 5);
    eAttr.setKeyable(false);

    aGoalMatrix = mAttr.create("goalMatrix", "gm");
    mAttr.setArray(true);
    mAttr.setDisconnectBehavior(MFnAttribute::kDelete);

    aOutMatrix = mAttr.create("outMatrix", "om");
    mAttr.setArray(true);
    mAttr.setUsesArrayDataBuilder(true);
    mAttr.setWritable(false);
    mAttr.setStorable(false);

    const MObject ins[] = {
        aTime, aStartFrame, aEnable, aWeight, aStiffness, aStiffnessRamp, aDamping,
        aGravity, aGravityDirection, aLengthKeep, aSubsteps, aSpaceMatrix,
        aFollowSpace, aGoalMatrix, aOutputCount, aAimAxis,
    };
    for (const MObject& in : ins)
        addAttribute(in);
    addAttribute(aOutMatrix);

    for (const MObject& in : ins)
        attributeAffects(in, aOutMatrix);

    return MS::kSuccess;
}

void PkChainDynNode::postConstructor()
{
    MPxNode::postConstructor();

    // A new node gets the stock curve: all of the stiffness at the root, a
    // third of it at the tip. Not while a file is read - the scene brings its
    // own entries, and these would be left over among them.
    if (MFileIO::isReadingFile())
        return;

    MRampAttribute ramp(thisMObject(), aStiffnessRamp);
    MFloatArray values, positions;
    MIntArray   interps;
    values.append(1.0f);   positions.append(0.0f); interps.append(MRampAttribute::kSmooth);
    values.append(0.33f);  positions.append(1.0f); interps.append(MRampAttribute::kSmooth);
    ramp.setRamp(values, positions, interps);
}

void PkChainDynNode::getCacheSetup(const MEvaluationNode& evalNode,
                                   MNodeCacheDisablingInfo& disablingInfo,
                                   MNodeCacheSetupInfo& cacheSetupInfo,
                                   MObjectArray& monitoredAttributes) const
{
    MPxNode::getCacheSetup(evalNode, disablingInfo, cacheSetupInfo, monitoredAttributes);

    // the same deal nucleus has with cached playback: the cache is filled in
    // order from the start frame and restarted when an input changes
    cacheSetupInfo.setPreference(MNodeCacheSetupInfo::kWantToCacheByDefault, true);
    cacheSetupInfo.setRequirement(MNodeCacheSetupInfo::kSimulationSupport, true);
}

// Catmull-Rom through the goals, cut into `count` points of equal length.
// The frames ride along: within a segment the turn from one control to the
// next is taken part of the way, in the space of the first one, so whatever
// the controls carry - twist, scale, the negative scale of a mirrored side -
// arrives at the points between them. Then each frame is turned onto the
// curve, because the curve bends where the straight chords between the
// controls do not.
void PkChainDynNode::resample(const std::vector<MMatrix>& ctrl, size_t count,
                              const MVector& aim, std::vector<MMatrix>& out)
{
    const size_t m = ctrl.size();
    std::vector<MPoint> p(m);
    for (size_t i = 0; i < m; ++i)
        p[i] = MPoint(ctrl[i][3][0], ctrl[i][3][1], ctrl[i][3][2]);

    // a dense walk along the curve, so it can be cut by length and not by
    // parameter - otherwise the pieces come out uneven wherever it bends
    const int kPerSeg = 16;
    std::vector<MPoint> dense;
    std::vector<double> denseT, denseLen;
    dense.reserve((m - 1) * kPerSeg + 1);

    for (size_t a = 0; a + 1 < m; ++a)
    {
        const MVector p1(p[a]);
        const MVector p2(p[a + 1]);
        const MVector p0 = (a == 0)     ? p1 + (p1 - p2) : MVector(p[a - 1]);
        const MVector p3 = (a + 2 >= m) ? p2 + (p2 - p1) : MVector(p[a + 2]);

        for (int k = 0; k < kPerSeg; ++k)
        {
            const double t  = double(k) / kPerSeg;
            const double t2 = t * t;
            const double t3 = t2 * t;
            const MVector v = 0.5 * (2.0 * p1
                                   + (p2 - p0) * t
                                   + (2.0 * p0 - 5.0 * p1 + 4.0 * p2 - p3) * t2
                                   + (3.0 * p1 - p0 - 3.0 * p2 + p3) * t3);
            dense.push_back(MPoint(v));
            denseT.push_back(double(a) + t);
        }
    }
    dense.push_back(p[m - 1]);
    denseT.push_back(double(m - 1));

    denseLen.assign(dense.size(), 0.0);
    for (size_t i = 1; i < dense.size(); ++i)
        denseLen[i] = denseLen[i - 1] + (dense[i] - dense[i - 1]).length();

    const double total = denseLen.back();

    out.assign(count, MMatrix::identity);
    std::vector<MPoint> chord(count);   // which way each frame believes it goes

    size_t walk = 0;
    for (size_t i = 0; i < count; ++i)
    {
        const double want = total * double(i) / double(count - 1);
        while (walk + 2 < dense.size() && denseLen[walk + 1] < want)
            ++walk;

        const double span = denseLen[walk + 1] - denseLen[walk];
        const double f    = (span > kEps) ? (want - denseLen[walk]) / span : 0.0;
        const double par  = denseT[walk] + (denseT[walk + 1] - denseT[walk]) * f;

        const size_t a = std::min(m - 2, size_t(par));
        const double t = std::min(1.0, std::max(0.0, par - double(a)));

        // the turn from one control to the next, part of the way
        const MMatrix     local = ctrl[a + 1] * ctrl[a].inverse();
        const MQuaternion q     = MTransformationMatrix(local).rotation();
        const MQuaternion part  = slerp(MQuaternion::identity, q, t);

        MMatrix frame = part.asMatrix() * ctrl[a];

        // where the bone of this frame points, in the world
        MMatrix frameRot = frame;
        frameRot[3][0] = frameRot[3][1] = frameRot[3][2] = 0.0;
        chord[i] = MPoint(aim * frameRot);

        frame[3][0] = dense[walk].x + (dense[walk + 1].x - dense[walk].x) * f;
        frame[3][1] = dense[walk].y + (dense[walk + 1].y - dense[walk].y) * f;
        frame[3][2] = dense[walk].z + (dense[walk + 1].z - dense[walk].z) * f;
        out[i] = frame;
    }

    // A control that is moved and not turned leaves its frame pointing where
    // it did, while the curve through it bends - so every frame is turned
    // from where it believes the chain goes onto where the curve actually
    // goes. The twist the controls carry rides along untouched.
    for (size_t i = 0; i < count; ++i)
    {
        const size_t j = (i + 1 < count) ? i : i - 1;   // the tip takes the one before it
        const MVector along = MPoint(out[j + 1][3][0], out[j + 1][3][1], out[j + 1][3][2])
                            - MPoint(out[j][3][0], out[j][3][1], out[j][3][2]);
        const MVector mine = MVector(chord[i]);

        if (along.length() <= kEps || mine.length() <= kEps)
            continue;

        const double x = out[i][3][0], y = out[i][3][1], z = out[i][3][2];
        MMatrix mat = out[i];
        mat[3][0] = mat[3][1] = mat[3][2] = 0.0;
        mat = mat * MQuaternion(mine, along).asMatrix();
        mat[3][0] = x;
        mat[3][1] = y;
        mat[3][2] = z;
        out[i] = mat;
    }
}

// The damped oscillator over a step of h, in closed form. Underdamped,
// critical and overdamped are the same solution with different roots, and the
// two cases are kept apart only because the formula for one is singular where
// the other lives.
PkChainDynNode::Step PkChainDynNode::solveStep(double w, double zeta, double h)
{
    Step st;

    // no spring at all - the point just drifts, with the drag of kMinW
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

void PkChainDynNode::reset(const std::vector<MPoint>& goals, const MMatrix& space)
{
    mCur.pos   = goals;
    mCur.vel.assign(goals.size(), MVector::zero);
    mCur.goal  = goals;
    mCur.space = space;
    mBase      = mCur;
    mLastDt    = 0.0;
    mInit      = true;
}

void PkChainDynNode::simulate(State& s, const std::vector<MPoint>& goals,
                              const MMatrix& space, double dt, const Params& p)
{
    const size_t n = goals.size();

    // what the space did since the last frame, taken into the points - both
    // of them, so the velocity is carried along and not created
    if (p.followSpace > kEps)
    {
        const MMatrix delta = s.space.inverse() * space;
        for (size_t i = 0; i < n; ++i)
        {
            s.pos[i] = lerp(s.pos[i], s.pos[i] * delta, p.followSpace);
            // a velocity is a direction, so only the rotation of the space
            // reaches it - not where the space moved to
            s.vel[i] += (s.vel[i] * delta - s.vel[i]) * p.followSpace;
        }
    }

    const int    steps = std::min(kMaxSteps, std::max(1, int(std::ceil(dt * p.substeps - kEps))));
    const double h     = dt / steps;

    const double lenK   = p.lengthKeep;
    const MVector accel = p.gravity * h;

    // The spring is solved exactly over the step, so the step itself neither
    // adds energy nor eats it: at damping 0 the chain keeps swinging however
    // big the step is, and the decay is the damping and nothing else.
    std::vector<Step> step(n);
    for (size_t i = 0; i < n; ++i)
        step[i] = solveStep(p.w[i], p.damping, h);

    std::vector<MPoint> g(n);
    for (int k = 1; k <= steps; ++k)
    {
        const double a = double(k) / steps;
        for (size_t i = 0; i < n; ++i)
            g[i] = lerp(s.goal[i], goals[i], a);

        for (size_t i = 1; i < n; ++i)
        {
            const MVector d = s.pos[i] - g[i];   // where it is against its goal
            MVector       v = s.vel[i] + accel;

            s.pos[i] = g[i] + d * step[i].dd + v * step[i].dv;
            s.vel[i] = d * step[i].vd + v * step[i].vv;
        }

        s.pos[0] = g[0];
        s.vel[0] = MVector::zero;

        // the lengths the goals have now - an animated stretch goes through
        if (lenK > kEps)
        {
            for (size_t i = 1; i < n; ++i)
            {
                MVector dir = s.pos[i] - s.pos[i - 1];
                const double len = dir.length();
                if (len <= kEps)
                    continue;

                const double rest = (g[i] - g[i - 1]).length();
                const MPoint target = s.pos[i - 1] + dir * (rest / len);
                const MPoint moved  = lerp(s.pos[i], target, lenK);

                // what the constraint did is motion like any other
                s.vel[i] += (moved - s.pos[i]) / h;
                s.pos[i] = moved;
            }
        }
    }

    s.goal  = goals;
    s.space = space;
}

MStatus PkChainDynNode::compute(const MPlug& plug, MDataBlock& data)
{
    if (plug != aOutMatrix && plug.parent() != aOutMatrix)
        return MS::kUnknownParameter;

    MStatus status;

    // --- the goals ----------------------------------------------------------
    std::vector<MMatrix> goalM;
    {
        MArrayDataHandle h = data.inputArrayValue(aGoalMatrix, &status);
        CHECK_MSTATUS_AND_RETURN_IT(status);
        const unsigned count = h.elementCount();
        goalM.reserve(count);
        for (unsigned i = 0; i < count; ++i)
        {
            h.jumpToArrayElement(i);
            goalM.push_back(h.inputValue().asMatrix());
        }
    }

    // more points than controls: the curve through them, cut up
    const int wanted = data.inputValue(aOutputCount).asInt();
    if (goalM.size() >= 2 && wanted > int(goalM.size()))
    {
        static const MVector kAxes[6] = {
            MVector::xAxis, MVector::yAxis, MVector::zAxis,
            -MVector::xAxis, -MVector::yAxis, -MVector::zAxis,
        };
        const short axis = data.inputValue(aAimAxis).asShort();

        std::vector<MMatrix> dense;
        resample(goalM, size_t(wanted), kAxes[std::min<short>(5, std::max<short>(0, axis))], dense);
        goalM.swap(dense);
    }

    const size_t n = goalM.size();
    std::vector<MPoint> goals(n);
    for (size_t i = 0; i < n; ++i)
        goals[i] = MPoint(goalM[i][3][0], goalM[i][3][1], goalM[i][3][2]);

    // --- the rest of the inputs --------------------------------------------
    const MTime  time       = data.inputValue(aTime).asTime();
    const double t          = time.as(MTime::uiUnit());
    const double startFrame = data.inputValue(aStartFrame).asDouble();
    const bool   enable     = data.inputValue(aEnable).asBool();
    const double weight     = data.inputValue(aWeight).asDouble();
    const MMatrix space     = data.inputValue(aSpaceMatrix).asMatrix();

    const double fps = MTime(1.0, MTime::kSeconds).as(MTime::uiUnit());

    MVector gDir = data.inputValue(aGravityDirection).asDouble3();
    if (gDir.length() > kEps)
        gDir.normalize();

    Params p;
    {
        const double stiffness = data.inputValue(aStiffness).asDouble();
        MRampAttribute ramp(thisMObject(), aStiffnessRamp);
        p.k.resize(n);
        p.w.resize(n);
        for (size_t i = 0; i < n; ++i)
        {
            const float u = (n > 1) ? float(i) / float(n - 1) : 0.0f;
            float r = 1.0f;
            ramp.getValueAtPosition(u, r);
            const double sr = stiffness * std::max(0.0f, r);
            p.k[i] = kMaxK * sr * sr;
            p.w[i] = std::sqrt(p.k[i]);
        }
    }
    p.damping      = data.inputValue(aDamping).asDouble();
    p.lengthKeep   = data.inputValue(aLengthKeep).asDouble();
    p.followSpace  = data.inputValue(aFollowSpace).asDouble();
    p.substeps     = std::max(1, data.inputValue(aSubsteps).asInt());
    p.gravity      = gDir * (data.inputValue(aGravity).asDouble() / (fps * fps));

    // --- time ----------------------------------------------------------------
    std::vector<MPoint> sim = goals;
    if (!enable || n < 2)
    {
        mInit = false;
    }
    else
    {
        const double dt = t - mLastTime;
        const bool restart = !mInit
                          || mCur.pos.size() != n
                          || t <= startFrame + kEps
                          || dt < -kEps
                          || dt > kMaxJump;

        if (restart)
        {
            reset(goals, space);
            mLastTime = t;
        }
        else if (std::fabs(dt) <= kEps)
        {
            // the same frame again - redo its step with the goals as they are
            if (mLastDt > kEps)
            {
                mCur = mBase;
                simulate(mCur, goals, space, mLastDt, p);
            }
            else
            {
                reset(goals, space);
            }
        }
        else
        {
            mBase = mCur;
            simulate(mCur, goals, space, dt, p);
            mLastTime = t;
            mLastDt   = dt;
        }

        for (size_t i = 0; i < n; ++i)
            sim[i] = lerp(goals[i], mCur.pos[i], weight);
    }

    // --- output --------------------------------------------------------------
    MArrayDataHandle hOut = data.outputArrayValue(aOutMatrix, &status);
    CHECK_MSTATUS_AND_RETURN_IT(status);
    MArrayDataBuilder builder(&data, aOutMatrix, unsigned(n), &status);
    CHECK_MSTATUS_AND_RETURN_IT(status);

    MQuaternion turn;
    for (size_t i = 0; i < n; ++i)
    {
        if (i + 1 < n)
        {
            const MVector dg = goals[i + 1] - goals[i];
            const MVector ds = sim[i + 1] - sim[i];
            turn = (dg.length() > kEps && ds.length() > kEps) ? MQuaternion(dg, ds) : MQuaternion();
        }

        MMatrix m = goalM[i];
        m[3][0] = m[3][1] = m[3][2] = 0.0;
        m = m * turn.asMatrix();
        m[3][0] = sim[i].x;
        m[3][1] = sim[i].y;
        m[3][2] = sim[i].z;

        MDataHandle el = builder.addElement(unsigned(i), &status);
        CHECK_MSTATUS_AND_RETURN_IT(status);
        el.setMMatrix(m);
    }

    status = hOut.set(builder);
    CHECK_MSTATUS_AND_RETURN_IT(status);
    hOut.setAllClean();
    data.setClean(plug);

    return MS::kSuccess;
}
