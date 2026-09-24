#include "pkChainDyn2Node.h"

#include <maya/MAngle.h>
#include <maya/MArrayDataBuilder.h>
#include <maya/MEvaluationNode.h>
#include <maya/MFileIO.h>
#include <maya/MFloatArray.h>
#include <maya/MFnCompoundAttribute.h>
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

MObject PkChainDyn2Node::aTime;
MObject PkChainDyn2Node::aStartFrame;
MObject PkChainDyn2Node::aEnable;
MObject PkChainDyn2Node::aWeight;
MObject PkChainDyn2Node::aWeightRamp;
MObject PkChainDyn2Node::aStiffness;
MObject PkChainDyn2Node::aStiffnessRamp;
MObject PkChainDyn2Node::aDamping;
MObject PkChainDyn2Node::aDampingEven;
MObject PkChainDyn2Node::aGravity;
MObject PkChainDyn2Node::aGravityDirection;
MObject PkChainDyn2Node::aGravityDirectionX, PkChainDyn2Node::aGravityDirectionY, PkChainDyn2Node::aGravityDirectionZ;
MObject PkChainDyn2Node::aStretch;
MObject PkChainDyn2Node::aStretchLimit;
MObject PkChainDyn2Node::aStretchSpeed;
MObject PkChainDyn2Node::aStretchDamping;
MObject PkChainDyn2Node::aStretchRelease;
MObject PkChainDyn2Node::aMaxBend;
MObject PkChainDyn2Node::aBendSoftness;
MObject PkChainDyn2Node::aSubsteps;
MObject PkChainDyn2Node::aSpaceMatrix;
MObject PkChainDyn2Node::aLocalTranslate;
MObject PkChainDyn2Node::aLocalRotate;
MObject PkChainDyn2Node::aGoalMatrix;
MObject PkChainDyn2Node::aOutputCount;
MObject PkChainDyn2Node::aPosition;
MObject PkChainDyn2Node::aAimAxis;
MObject PkChainDyn2Node::aCollide;
MObject PkChainDyn2Node::aThickness;
MObject PkChainDyn2Node::aBounce;
MObject PkChainDyn2Node::aFriction;
MObject PkChainDyn2Node::aCollider;
MObject PkChainDyn2Node::aColliderType;
MObject PkChainDyn2Node::aColliderMatrix;
MObject PkChainDyn2Node::aColliderRadius;
MObject PkChainDyn2Node::aColliderLength;
MObject PkChainDyn2Node::aOutMatrix;

namespace
{
    const double kEps = 1.0e-9;
    const double kPi  = 3.14159265358979323846;

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

    // How many times the points are put back out of the colliders before it is
    // called a day - see pushOut.
    const int kCollideRounds = 8;

    // How long the give of the lengths takes to come back, in frames: it
    // piles up while the chain is being pulled and runs out once it is not.
    const double kStretchTau = 5.0;

    MPoint lerp(const MPoint& a, const MPoint& b, double t)
    {
        return a + (b - a) * t;
    }
}

void* PkChainDyn2Node::creator()
{
    return new PkChainDyn2Node();
}

MStatus PkChainDyn2Node::initialize()
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

    aWeightRamp = MRampAttribute::createCurveRamp("weightRamp", "wr");

    aStiffness = nAttr.create("stiffness", "st", MFnNumericData::kDouble, 0.15);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aStiffnessRamp = MRampAttribute::createCurveRamp("stiffnessRamp", "str");

    aDamping = nAttr.create("damping", "dmp", MFnNumericData::kDouble, 0.5);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aDampingEven = nAttr.create("dampingEven", "dme", MFnNumericData::kDouble, 1.0);
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

    // no ceiling on either of these: 1 is where the chain gives as much as
    // it wants to, and past that is a matter of taste rather than of physics
    aStretch = nAttr.create("stretch", "stc", MFnNumericData::kDouble, 0.6);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(5.0);
    nAttr.setKeyable(true);

    aStretchLimit = nAttr.create("stretchLimit", "stl", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(3.0);
    nAttr.setKeyable(true);

    aStretchSpeed = nAttr.create("stretchSpeed", "sts", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aStretchDamping = nAttr.create("stretchDamping", "std", MFnNumericData::kDouble, 0.5);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aStretchRelease = nAttr.create("stretchRelease", "stre", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(8.0);
    nAttr.setKeyable(true);

    aMaxBend = uAttr.create("maxBend", "mb", MFnUnitAttribute::kAngle, kPi);
    uAttr.setMin(0.0);
    uAttr.setMax(kPi);
    uAttr.setKeyable(true);

    aBendSoftness = nAttr.create("bendSoftness", "bsf", MFnNumericData::kDouble, 0.5);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aSubsteps = nAttr.create("substeps", "ss", MFnNumericData::kInt, 1);
    nAttr.setMin(1);
    nAttr.setSoftMax(10);
    nAttr.setKeyable(true);

    aSpaceMatrix = mAttr.create("spaceMatrix", "spm");

    aLocalTranslate = nAttr.create("localTranslate", "lt", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aLocalRotate = nAttr.create("localRotate", "lr", MFnNumericData::kDouble, 0.0);
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

    aPosition = nAttr.create("position", "pos", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);
    nAttr.setArray(true);
    nAttr.setUsesArrayDataBuilder(true);

    aCollide = nAttr.create("collide", "cld", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aThickness = nAttr.create("thickness", "thk", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(5.0);
    nAttr.setKeyable(true);

    aBounce = nAttr.create("bounce", "bnc", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aFriction = nAttr.create("friction", "frc", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    aColliderType = eAttr.create("colliderType", "clt", 0);
    eAttr.addField("plane", 0);
    eAttr.addField("sphere", 1);
    eAttr.addField("capsule", 2);
    eAttr.setKeyable(false);

    aColliderMatrix = mAttr.create("colliderMatrix", "clm");
    // коллайдер удалили - элемент списка уходит с ним. Иначе матрица осталась бы
    // единичной, и на месте пола, которого больше нет, продолжала бы стоять
    // плоскость в начале координат
    mAttr.setDisconnectBehavior(MFnAttribute::kDelete);

    aColliderRadius = nAttr.create("colliderRadius", "clr", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(20.0);
    nAttr.setKeyable(true);

    aColliderLength = nAttr.create("colliderLength", "cll", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(20.0);
    nAttr.setKeyable(true);

    // один элемент - один коллайдер: пол плоскостью, голова сферой, бедро
    // капсулой, и всё это одновременно
    MFnCompoundAttribute cAttr;
    aCollider = cAttr.create("collider", "cl");
    cAttr.addChild(aColliderType);
    cAttr.addChild(aColliderMatrix);
    cAttr.addChild(aColliderRadius);
    cAttr.addChild(aColliderLength);
    cAttr.setArray(true);

    aGoalMatrix = mAttr.create("goalMatrix", "gm");
    mAttr.setArray(true);
    mAttr.setDisconnectBehavior(MFnAttribute::kDelete);

    aOutMatrix = mAttr.create("outMatrix", "om");
    mAttr.setArray(true);
    mAttr.setUsesArrayDataBuilder(true);
    mAttr.setWritable(false);
    mAttr.setStorable(false);

    const MObject ins[] = {
        aTime, aStartFrame, aEnable, aWeight, aWeightRamp, aStiffness, aStiffnessRamp,
        aDamping, aDampingEven,
        aGravity, aGravityDirection, aStretch, aStretchLimit,
        aStretchSpeed, aStretchDamping, aStretchRelease,
        aMaxBend, aBendSoftness, aSubsteps, aSpaceMatrix,
        aLocalTranslate, aLocalRotate,
        aGoalMatrix, aOutputCount, aAimAxis, aPosition,
        aCollide, aThickness, aBounce, aFriction, aCollider,
    };
    for (const MObject& in : ins)
        addAttribute(in);
    addAttribute(aOutMatrix);

    for (const MObject& in : ins)
        attributeAffects(in, aOutMatrix);

    return MS::kSuccess;
}

void PkChainDyn2Node::postConstructor()
{
    MPxNode::postConstructor();

    // The curves a new node starts with. Not while a file is read - the
    // scene brings its own entries, and these would be left over among them.
    if (MFileIO::isReadingFile())
        return;

    // Stiffness even along the chain: uneven, it gives every point a beat of
    // its own and they settle out of step with each other. The shape of the
    // swing is drawn on the other curve instead.
    MRampAttribute ramp(thisMObject(), aStiffnessRamp);
    MFloatArray values, positions;
    MIntArray   interps;
    values.append(1.0f); positions.append(0.0f); interps.append(MRampAttribute::kSmooth);
    values.append(1.0f); positions.append(1.0f); interps.append(MRampAttribute::kSmooth);
    ramp.setRamp(values, positions, interps);

    // And the swing itself: nothing at the root, everything at the tip, with
    // the rise held back at first. The root is pinned to its control, so if
    // the point after it were given the whole of the motion at once, the
    // whole of the lag would land on that one bone and it alone would bend.
    MRampAttribute weights(thisMObject(), aWeightRamp);
    MFloatArray wv, wp;
    MIntArray   wi;
    wv.append(0.00f); wp.append(0.00f); wi.append(MRampAttribute::kSpline);
    wv.append(0.16f); wp.append(0.30f); wi.append(MRampAttribute::kSpline);
    wv.append(0.55f); wp.append(0.69f); wi.append(MRampAttribute::kSpline);
    wv.append(1.00f); wp.append(1.00f); wi.append(MRampAttribute::kSmooth);
    weights.setRamp(wv, wp, wi);
}

void PkChainDyn2Node::getCacheSetup(const MEvaluationNode& evalNode,
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
void PkChainDyn2Node::resample(const std::vector<MMatrix>& ctrl,
                              const std::vector<double>& along,
                              const MVector& aim, std::vector<MMatrix>& out)
{
    const size_t m = ctrl.size();
    const size_t count = along.size();
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
        const double want = total * std::min(1.0, std::max(0.0, along[i]));
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
PkChainDyn2Node::Step PkChainDyn2Node::solveStep(double w, double zeta, double h)
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

namespace
{
    // The points of a ramp - position, value and interpolation of each -
    // taken straight from the data block.
    void markRamp(MDataBlock& data, const MObject& attr, std::vector<double>& out)
    {
        MFnCompoundAttribute fn(attr);
        if (fn.numChildren() < 3)
            return;

        const MObject cPos = fn.child(0);
        const MObject cVal = fn.child(1);
        const MObject cInt = fn.child(2);

        MStatus status;
        MArrayDataHandle h = data.inputArrayValue(attr, &status);
        if (!status)
            return;

        const unsigned count = h.elementCount();
        out.push_back(double(count));

        for (unsigned i = 0; i < count; ++i)
        {
            if (!h.jumpToArrayElement(i))
                break;

            MDataHandle e = h.inputValue();
            out.push_back(e.child(cPos).asFloat());
            out.push_back(e.child(cVal).asFloat());
            out.push_back(double(e.child(cInt).asShort()));
        }
    }
}

void PkChainDyn2Node::readCurves(MDataBlock& data, size_t n)
{
    std::vector<double> mark;
    mark.reserve(32);
    markRamp(data, aStiffnessRamp, mark);
    markRamp(data, aWeightRamp, mark);

    if (mark == mCurveMark && mCurveCount == n
        && mStiffCurve.size() == n && mWeightCurve.size() == n)
        return;

    mCurveMark  = mark;
    mCurveCount = n;

    mStiffCurve.assign(n, 1.0);
    mWeightCurve.assign(n, 1.0);

    MRampAttribute stiff(thisMObject(), aStiffnessRamp);
    MRampAttribute weights(thisMObject(), aWeightRamp);

    // A scene saved before the weight curve existed has nothing in it, and a
    // curve of one point cannot be a shape - either way the chain gets all of
    // the simulation, the way it did before.
    const bool drawn = weights.getNumEntries() > 1;

    for (size_t i = 0; i < n; ++i)
    {
        const float u = (n > 1) ? float(i) / float(n - 1) : 0.0f;

        float r = 1.0f;
        stiff.getValueAtPosition(u, r);
        mStiffCurve[i] = std::max(0.0f, r);

        if (drawn)
        {
            float v = 1.0f;
            weights.getValueAtPosition(u, v);
            mWeightCurve[i] = std::min(1.0f, std::max(0.0f, v));
        }
    }
}

void PkChainDyn2Node::reset(const std::vector<MPoint>& goals, const MMatrix& space)
{
    mCur.pos   = goals;
    mCur.vel.assign(goals.size(), MVector::zero);
    mCur.slack.assign(goals.size(), 0.0);
    mCur.slackVel.assign(goals.size(), 0.0);
    mCur.pull.assign(goals.size(), 0.0);
    mCur.goal  = goals;
    mCur.space = space;
    mBase      = mCur;
    mLastDt    = 0.0;
    mInit      = true;
}

bool PkChainDyn2Node::depthOf(const Collider& c, const MPoint& p, double pad,
                              MVector& dir, double& depth)
{
    if (c.type == 0)
    {
        // a plane has no edges here: everything above its own Y is outside
        const double d = MVector(p - c.o) * c.n - pad;
        if (d >= 0.0)
            return false;

        dir   = c.n;
        depth = -d;
        return true;
    }

    MPoint centre = c.o;
    if (c.type == 2)
    {
        // a capsule is a sphere about the nearest point of its axis
        const double half = c.n.length();
        if (half > kEps)
        {
            const MVector axis = c.n / half;
            const double  t    = std::min(half, std::max(-half, MVector(p - c.o) * axis));
            centre = c.o + axis * t;
        }
    }

    const MVector v    = p - centre;
    const double  len  = v.length();
    const double  want = c.radius + pad;
    if (len >= want)
        return false;

    // dead in the middle there is no shortest way out, so any way will do
    dir   = (len > kEps) ? (v / len) : MVector::yAxis;
    depth = want - len;
    return true;
}

void PkChainDyn2Node::pushOut(std::vector<MPoint>& pos, std::vector<MVector>* vel,
                              const Params& p)
{
    if (p.collide <= kEps || p.colliders.empty())
        return;

    // Round after round until nothing is inside any more. A point squeezed
    // between two colliders is put back inside the first by the second, and in
    // a corner between them that takes a few goes - while the ordinary case,
    // where nothing touches anything, costs one look and leaves.
    //
    // The cap is there for the one case that has no answer at all: colliders
    // overlapping deeper than the chain is thick leave no room where both are
    // satisfied, and the point settles between them instead of being thrown
    // about for ever.
    for (int round = 0; round < kCollideRounds; ++round)
    {
        bool moved = false;

        // from 1: the root sits on its control
        for (size_t i = 1; i < pos.size(); ++i)
        {
            for (const Collider& c : p.colliders)
            {
                MVector dir;
                double  depth;
                if (!depthOf(c, pos[i], p.thickness, dir, depth))
                    continue;

                moved = true;

                pos[i] += dir * (depth * p.collide);
                if (!vel)
                    continue;

                MVector&     v    = (*vel)[i];
                const double into = v * dir;
                if (into < 0.0)
                    v -= dir * (into * (1.0 + p.bounce) * p.collide);

                if (p.friction > kEps)
                {
                    const MVector along = v - dir * (v * dir);
                    v -= along * (p.friction * p.collide);
                }
            }
        }

        if (!moved)
            break;
    }
}

void PkChainDyn2Node::simulate(State& s, const std::vector<MPoint>& goals,
                              const MMatrix& space, double dt, const Params& p)
{
    const size_t n = goals.size();

    // What the space did since the last frame, carried into the points: as
    // much of the turn as localRotate says, as much of the move as
    // localTranslate. Taken apart around the space's own origin, so the turn
    // is a turn about the space and not about the middle of the scene.
    if (p.localTranslate > kEps || p.localRotate > kEps)
    {
        const MPoint from(s.space[3][0], s.space[3][1], s.space[3][2]);
        const MPoint to(space[3][0], space[3][1], space[3][2]);

        MMatrix wasRot = s.space, nowRot = space;
        wasRot[3][0] = wasRot[3][1] = wasRot[3][2] = 0.0;
        nowRot[3][0] = nowRot[3][1] = nowRot[3][2] = 0.0;

        const MQuaternion turn = MTransformationMatrix(wasRot.inverse() * nowRot).rotation();
        const MQuaternion part = slerp(MQuaternion::identity, turn, p.localRotate);
        const MVector     move = (to - from) * p.localTranslate;

        for (size_t i = 0; i < n; ++i)
        {
            s.pos[i] = from + MVector(s.pos[i] - from).rotateBy(part) + move;
            // a velocity is a direction: it turns with the space, and where
            // the space moved to is nothing to it
            s.vel[i] = s.vel[i].rotateBy(part);
        }
    }

    const int    steps = std::min(kMaxSteps, std::max(1, int(std::ceil(dt * p.substeps - kEps))));
    const double h     = dt / steps;

    const MVector accel = p.gravity * h;

    // The spring is solved exactly over the step, so the step itself neither
    // adds energy nor eats it: at damping 0 the chain keeps swinging however
    // big the step is, and the decay is the damping and nothing else.
    std::vector<Step> step(n);
    for (size_t i = 0; i < n; ++i)
        step[i] = solveStep(p.w[i], p.zeta[i], h);

    const double bend = p.maxBend;

    // The give of the lengths has a spring of its own, solved the same way.
    // Left at 0 it takes the chain's own frequency, doubled so the stretch
    // reads as the quicker of the two, and is held to a period between three
    // and eight frames - slower than that and it answers after the motion is
    // over, quicker and the whole of it happens between two frames.
    const double wAuto = std::min(2.0 * kPi / 3.0, std::max(2.0 * kPi / 8.0, 2.0 * p.stiffW));
    const double wGive = (p.stretchSpeed > kEps) ? std::sqrt(kMaxK) * p.stretchSpeed : wAuto;
    const Step give = solveStep(wGive, p.stretchDamping, h);

    std::vector<MPoint> g(n);
    for (int k = 1; k <= steps; ++k)
    {
        const double a = double(k) / steps;
        for (size_t i = 0; i < n; ++i)
            g[i] = lerp(s.goal[i], goals[i], a);

        for (size_t i = 1; i < n; ++i)
        {
            const MVector d = s.pos[i] - g[i];   // where it is against its goal
            const MVector v = s.vel[i] + accel;

            s.pos[i] = g[i] + d * step[i].dd + v * step[i].dv;
            s.vel[i] = d * step[i].vd + v * step[i].vv;
        }

        s.pos[0] = g[0];
        s.vel[0] = MVector::zero;

        // What the lengths are about to take away, kept for the output to
        // give back as much of it as stretch asks for.
        if (s.slack.size() != n)
        {
            s.slack.assign(n, 0.0);
            s.slackVel.assign(n, 0.0);
            s.pull.assign(n, 0.0);
        }

        // How much the chain wants to give, and how much it actually does.
        //
        // The wanting is what the lengths are about to take away, piling up
        // while the pull lasts and running out when it stops.
        //
        // The giving is a spring towards it, with a mass of its own. That is
        // what makes the bone arrive at its length, carry on past it and
        // swing back, instead of merely fading home.
        const double load = std::exp(-h / kStretchTau);
        const double release = (p.stretchRelease > kEps) ? p.stretchRelease : 1.0;
        const double free_ = std::exp(-h / std::max(release, 0.05));
        for (size_t i = 1; i < n; ++i)
        {
            const double rest = (g[i] - g[i - 1]).length();
            const double now  = (s.pos[i] - s.pos[i - 1]).length() - rest;

            // still being pulled the way it already is, or let go of
            const bool loading = (now * s.pull[i] > 0.0) || std::fabs(s.pull[i]) < kEps;
            s.pull[i] = s.pull[i] * (loading ? load : free_) + now;
            const double want = p.stretch * s.pull[i];

            const double d = s.slack[i] - want;
            const double v = s.slackVel[i];
            s.slack[i]    = want + d * give.dd + v * give.dv;
            s.slackVel[i] = d * give.vd + v * give.vv;
        }

        // The lengths the goals have now - an animated stretch goes through -
        // and, in the same walk down the chain, how far a bone may turn away
        // from where the goals put it against the one before it.
        //
        // Both are done to one point at a time, from the root out: a point is
        // put at the right distance from the one before it and, if it is over
        // the limit, turned back around that same point. Turning around it
        // keeps the distance, so neither undoes the other, and the points
        // after it are dealt with in their turn rather than being swung along
        // as one piece - a chain whose root bone is straightened does not
        // throw its tail across the sky.
        //
        // The limit is measured against the bend the goals have at that
        // joint, not against a straight line, so a chain built curled keeps
        // its curl and only what the simulation adds on top of it is limited.
        for (size_t i = 1; i < n; ++i)
        {
            MVector dir = s.pos[i] - s.pos[i - 1];
            if (dir.length() <= kEps)
                continue;

            if (bend < kPi - kEps)
            {
                // where this bone would lie with no bend of its own: the one
                // before it, turned the way the goals turn here
                MVector ref = (i == 1) ? (g[1] - g[0]) : (s.pos[i - 1] - s.pos[i - 2]);
                if (i > 1)
                {
                    const MVector a = g[i - 1] - g[i - 2];
                    const MVector b = g[i] - g[i - 1];
                    if (a.length() > kEps && b.length() > kEps)
                        ref = ref.rotateBy(MQuaternion(a, b));
                }

                const double angle = (ref.length() > kEps) ? ref.angle(dir) : 0.0;

                // Where the limit starts pushing back, and how much of the
                // angle is left after it has. Below the knee nothing happens;
                // past it what is left over is squeezed into what room there
                // is, so the limit is approached and never crossed.
                double allowed = angle;
                if (bend < kPi - kEps && angle > kEps)
                {
                    const double knee = bend * (1.0 - p.bendSoftness);
                    if (angle > knee)
                    {
                        const double room = std::max(bend - knee, kEps);
                        allowed = knee + room * (1.0 - std::exp(-(angle - knee) / room));
                    }
                }

                if (allowed < angle - kEps)
                {
                    MVector axis = ref ^ dir;
                    if (axis.length() <= kEps)
                    {
                        // turned right around: no one axis brings it back, so
                        // any across it will do - without this the chain can
                        // sit folded back on itself for good
                        const MVector any = (std::fabs(ref.x) < 0.9) ? MVector::xAxis
                                                                     : MVector::yAxis;
                        axis = ref ^ any;
                    }

                    if (axis.length() > kEps)
                    {
                        axis.normalize();
                        const MQuaternion back(-(angle - allowed), axis);

                        // A turn is a turn: the velocity goes round with the
                        // bone instead of being handed the distance it moved.
                        // Counting that distance as new velocity is division
                        // by the step, and once blew the chain up.
                        dir = dir.rotateBy(back);
                        s.vel[i] = s.vel[i].rotateBy(back);
                    }
                }
            }

            // the lengths, on the other hand, move the point - and that is
            // motion like any other
            const double rest = (g[i] - g[i - 1]).length();
            const MPoint moved = s.pos[i - 1] + dir * (rest / dir.length());

            s.vel[i] += (moved - s.pos[i]) / h;
            s.pos[i] = moved;
        }

        // The lengths have just had their say; now the surfaces do. What this
        // moves is felt - the velocity going into a surface is taken away -
        // and the next substep puts the lengths back.
        pushOut(s.pos, &s.vel, p);
    }

    s.goal  = goals;
    s.space = space;
}

MStatus PkChainDyn2Node::compute(const MPlug& plug, MDataBlock& data)
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

        // where each point sits along the chain: evenly unless told otherwise
        std::vector<double> along(static_cast<size_t>(wanted));
        for (size_t i = 0; i < along.size(); ++i)
            along[i] = double(i) / double(along.size() - 1);

        MArrayDataHandle hPos = data.inputArrayValue(aPosition, &status);
        if (status)
        {
            const unsigned given = hPos.elementCount();
            for (unsigned i = 0; i < given; ++i)
            {
                if (!hPos.jumpToArrayElement(i))
                    break;
                const unsigned at = hPos.elementIndex();
                if (at < along.size())
                    along[at] = hPos.inputValue().asDouble();
            }
        }

        std::vector<MMatrix> dense;
        resample(goalM, along, kAxes[std::min<short>(5, std::max<short>(0, axis))], dense);
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
    p.damping = data.inputValue(aDamping).asDouble();
    {
        const double stiffness = data.inputValue(aStiffness).asDouble();
        p.stiffW = std::sqrt(kMaxK) * stiffness;
        readCurves(data, n);

        p.k.resize(n);
        p.w.resize(n);
        for (size_t i = 0; i < n; ++i)
        {
            const double sr = stiffness * mStiffCurve[i];
            p.k[i] = kMaxK * sr * sr;
            p.w[i] = std::sqrt(p.k[i]);
        }

        // A point the ramp made soft swings slower and would ring on long
        // after the rest; dampingEven gives it back exactly what the ramp
        // took, so what damping asks for is a time to settle rather than a
        // ratio, and the ramp is left to shape the trail and nothing else.
        const double even = data.inputValue(aDampingEven).asDouble();
        const double wRef = *std::max_element(p.w.begin(), p.w.end());

        p.zeta.resize(n);
        for (size_t i = 0; i < n; ++i)
        {
            const double w = std::max(p.w[i], kMinW);
            const double lift = (wRef > kEps) ? std::pow(wRef / w, even) : 1.0;
            p.zeta[i] = std::min(4.0, p.damping * lift);
        }
    }
    p.maxBend      = data.inputValue(aMaxBend).asAngle().asRadians();
    p.bendSoftness = data.inputValue(aBendSoftness).asDouble();
    p.stretch      = data.inputValue(aStretch).asDouble();
    p.stretchLimit = data.inputValue(aStretchLimit).asDouble();
    p.stretchSpeed = data.inputValue(aStretchSpeed).asDouble();
    p.stretchDamping = data.inputValue(aStretchDamping).asDouble();
    p.stretchRelease = data.inputValue(aStretchRelease).asDouble();
    p.localTranslate = data.inputValue(aLocalTranslate).asDouble();
    p.localRotate    = data.inputValue(aLocalRotate).asDouble();
    p.substeps     = std::max(1, data.inputValue(aSubsteps).asInt());
    p.gravity      = gDir * (data.inputValue(aGravity).asDouble() / (fps * fps));

    p.collide   = data.inputValue(aCollide).asDouble();
    p.thickness = data.inputValue(aThickness).asDouble();
    p.bounce    = data.inputValue(aBounce).asDouble();
    p.friction  = data.inputValue(aFriction).asDouble();

    if (p.collide > kEps)
    {
        MArrayDataHandle hc = data.inputArrayValue(aCollider, &status);
        if (status)
        {
            const unsigned count = hc.elementCount();
            p.colliders.reserve(count);
            for (unsigned i = 0; i < count; ++i)
            {
                if (!hc.jumpToArrayElement(i))
                    break;

                MDataHandle   e = hc.inputValue();
                const MMatrix m = e.child(aColliderMatrix).asMatrix();

                Collider c;
                c.type   = e.child(aColliderType).asShort();
                c.radius = e.child(aColliderRadius).asDouble();
                c.o      = MPoint(m[3][0], m[3][1], m[3][2]);

                // the axes as they are, so scaling the transform scales the
                // collider - a locator pulled bigger is a bigger sphere
                const MVector x(m[0][0], m[0][1], m[0][2]);
                const MVector y(m[1][0], m[1][1], m[1][2]);
                const MVector z(m[2][0], m[2][1], m[2][2]);
                const double  up = y.length();

                if (c.type == 0)
                {
                    c.n = (up > kEps) ? (y / up) : MVector::yAxis;
                }
                else
                {
                    c.radius *= (x.length() + up + z.length()) / 3.0;
                    if (c.type == 2 && up > kEps)
                        c.n = (y / up) * (e.child(aColliderLength).asDouble() * up * 0.5);
                }

                if (c.type == 0 || c.radius > kEps)
                    p.colliders.push_back(c);
            }
        }
    }

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

        std::vector<double> share(n, weight);
        for (size_t i = 0; i < n; ++i)
        {
            share[i] = weight * mWeightCurve[i];
            sim[i] = lerp(goals[i], mCur.pos[i], share[i]);
        }

        // Give under the pull - afterwards, along the chain as it already
        // lies. The directions are the ones the solve produced, so nothing
        // that was tuned moves; only how far apart the points sit.
        if (p.stretch > kEps)
        {
            // The give is shared out evenly, every segment taking the same
            // part of its own length. A chain dragged by its root is pulled
            // almost entirely at the root, and one swung around at the tip,
            // and letting each segment give only what it is under tore the
            // chain unevenly for no gain: what a shape needs from a stretch
            // is the whole of it giving together.
            std::vector<double> give(n, 0.0);
            double totalGive = 0.0, totalRest = 0.0;
            for (size_t i = 1; i < n; ++i)
            {
                // by stretch alone, not by the weight curve: that curve says
                // how much of the swinging a point takes, and a point held
                // still by it is still pulled at - the root most of all, and
                // scaling the give by it threw away exactly where the chain
                // is under the most tension
                give[i]    = (i < mCur.slack.size()) ? mCur.slack[i] * weight : 0.0;
                totalGive += give[i];
                totalRest += (goals[i] - goals[i - 1]).length();
            }

            const double even = (totalRest > kEps) ? totalGive / totalRest : 0.0;
            for (size_t i = 1; i < n; ++i)
                give[i] = even * (goals[i] - goals[i - 1]).length();

            std::vector<MPoint> out(n);
            out[0] = sim[0];

            for (size_t i = 1; i < n; ++i)
            {
                MVector dir = sim[i] - sim[i - 1];
                const double len = dir.length();
                if (len <= kEps)
                {
                    out[i] = out[i - 1];
                    continue;
                }
                dir /= len;

                const double rest = (goals[i] - goals[i - 1]).length();

                // left at 0 the limit sits out of the way of whatever stretch
                // could ask for, and only catches what runs away
                const double cap = (p.stretchLimit > kEps) ? p.stretchLimit
                                                           : std::max(1.0, 3.0 * p.stretch);
                double want = len + give[i];
                const double most = rest * cap;
                want = std::min(len + most, std::max(len - most, want));

                out[i] = out[i - 1] + dir * std::max(want, rest * 0.01);
            }

            sim.swap(out);
        }

        // Last word. The weight curve pulled every point part of the way back
        // to its control and the stretch slid them along, and both of those can
        // put a point back through a surface it had been pushed out of.
        pushOut(sim, nullptr, p);
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
