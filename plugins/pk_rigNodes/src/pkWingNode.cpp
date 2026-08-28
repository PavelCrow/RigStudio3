#include "pkWingNode.h"

#include <maya/MArrayDataBuilder.h>
#include <maya/MFnCompoundAttribute.h>
#include <maya/MFnEnumAttribute.h>
#include <maya/MFnMatrixAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MTransformationMatrix.h>

#include <algorithm>
#include <cmath>
#include <string>

MObject PkWingNode::aCurvesPosition;
MObject PkWingNode::aCurvesPositionA;
MObject PkWingNode::aRootOffset[7];
MObject PkWingNode::aInitCurvesLength;
MObject PkWingNode::aGlobalTransform;
MObject PkWingNode::aMainPoserTransform;
MObject PkWingNode::aMirror;
MObject PkWingNode::aFlatten;
MObject PkWingNode::aAutoTwistRoot;
MObject PkWingNode::aAutoTwistTip;
MObject PkWingNode::aLayersCount;
MObject PkWingNode::aLayerFeathersCount;
MObject PkWingNode::aLayerControlsCount;
MObject PkWingNode::aLayerWide;
MObject PkWingNode::aLayerPosMin;
MObject PkWingNode::aLayerPosMax;
MObject PkWingNode::aLayerLengthMin;
MObject PkWingNode::aLayerLengthMax;
MObject PkWingNode::aLayerTwistRoot;
MObject PkWingNode::aLayerTwistTip;
MObject PkWingNode::aLayerBend;
MObject PkWingNode::aLayerOffsetRoot;
MObject PkWingNode::aLayerOffsetTip;
MObject PkWingNode::aWide,       PkWingNode::aWideA;
MObject PkWingNode::aRootPos,    PkWingNode::aRootPosA;
MObject PkWingNode::aTipPos,     PkWingNode::aTipPosA;
MObject PkWingNode::aPos2Offset, PkWingNode::aPos2OffsetA;
MObject PkWingNode::aPos3Offset, PkWingNode::aPos3OffsetA;
MObject PkWingNode::aLength,     PkWingNode::aLengthA;
MObject PkWingNode::aLengthMin,  PkWingNode::aLengthMinA;
MObject PkWingNode::aTwistRoot,  PkWingNode::aTwistRootA;
MObject PkWingNode::aTwistTip,   PkWingNode::aTwistTipA;
MObject PkWingNode::aBend,       PkWingNode::aBendA;
MObject PkWingNode::aDebugStage;
MObject PkWingNode::aDebugLayer;
MObject PkWingNode::aStretchK;
MObject PkWingNode::aOutControls,  PkWingNode::aOutControlsA,  PkWingNode::aOutControlsAB;
MObject PkWingNode::aOutJointsIn,  PkWingNode::aOutJointsInA,  PkWingNode::aOutJointsInAB;
MObject PkWingNode::aOutJointsOut, PkWingNode::aOutJointsOutA, PkWingNode::aOutJointsOutAB;
MObject PkWingNode::aDebugPoints;
MObject PkWingNode::aDebugLengths;
MObject PkWingNode::aDebugMatrices;
MObject PkWingNode::aDebugScalars;

namespace
{
    const int kVerticalCurves = 7;    // graph: for_each_get_main_bSplines1, 7 iterations
    const int kMainCurves     = 4;    // graph: for_each_get_main_bSplines,  4 iterations
    const int kReparamSamples = 50;   // graph: reparameterize_bSpline.samples

    // lerp fractions of center_position_0..3 in the graph
    const double kCenterFraction[kMainCurves] = { 0.0, 0.333000004, 0.666000009, 1.0 };

    const double kPi = 3.14159265358979323846;

    void writePoints(MDataBlock& data, MObject attr, const std::vector<MPoint>& points)
    {
        MArrayDataHandle outArray = data.outputArrayValue(attr);
        MArrayDataBuilder builder(&data, attr, unsigned(points.size()));

        for (unsigned i = 0; i < points.size(); ++i)
            builder.addElement(i).set3Float(float(points[i].x), float(points[i].y), float(points[i].z));

        outArray.set(builder);
        outArray.setAllClean();
    }

    void writeDoubles(MDataBlock& data, MObject attr, const std::vector<double>& values)
    {
        MArrayDataHandle outArray = data.outputArrayValue(attr);
        MArrayDataBuilder builder(&data, attr, unsigned(values.size()));

        for (unsigned i = 0; i < values.size(); ++i)
            builder.addElement(i).setDouble(values[i]);

        outArray.set(builder);
        outArray.setAllClean();
    }

    void writeMatrices(MDataBlock& data, MObject attr, const std::vector<MMatrix>& values)
    {
        MArrayDataHandle outArray = data.outputArrayValue(attr);
        MArrayDataBuilder builder(&data, attr, unsigned(values.size()));

        for (unsigned i = 0; i < values.size(); ++i)
            builder.addElement(i).setMMatrix(values[i]);

        outArray.set(builder);
        outArray.setAllClean();
    }

    // Plain multi of floats into a dense vector by logical index. The arrays can
    // be sparse (wing2.py removes multi instances), missing slots keep `fill`.
    void readFloats(MDataBlock& data, MObject attr, std::vector<double>& out, double fill = 0.0)
    {
        out.clear();
        MArrayDataHandle h = data.inputArrayValue(attr);

        for (unsigned e = 0; e < h.elementCount(); ++e)
        {
            if (h.jumpToArrayElement(e) != MS::kSuccess)
                continue;

            const unsigned index = h.elementIndex();
            if (out.size() <= index)
                out.resize(index + 1, fill);
            out[index] = h.inputValue().asFloat();
        }
    }

    void readLongs(MDataBlock& data, MObject attr, std::vector<int>& out)
    {
        out.clear();
        MArrayDataHandle h = data.inputArrayValue(attr);

        for (unsigned e = 0; e < h.elementCount(); ++e)
        {
            if (h.jumpToArrayElement(e) != MS::kSuccess)
                continue;

            const unsigned index = h.elementIndex();
            if (out.size() <= index)
                out.resize(index + 1, 0);
            out[index] = h.inputValue().asLong();
        }
    }

    // Nested multi (compound[] -> float[]) as the graph exposes array<array<float>>
    void readNestedFloats(MDataBlock& data, MObject parent, MObject child,
                          std::vector<std::vector<double> >& out)
    {
        out.clear();
        MArrayDataHandle outer = data.inputArrayValue(parent);

        for (unsigned e = 0; e < outer.elementCount(); ++e)
        {
            if (outer.jumpToArrayElement(e) != MS::kSuccess)
                continue;

            const unsigned index = outer.elementIndex();
            if (out.size() <= index)
                out.resize(index + 1);

            MDataHandle element = outer.inputValue();
            MArrayDataHandle inner(element.child(child));

            std::vector<double>& row = out[index];
            for (unsigned k = 0; k < inner.elementCount(); ++k)
            {
                if (inner.jumpToArrayElement(k) != MS::kSuccess)
                    continue;

                const unsigned slot = inner.elementIndex();
                if (row.size() <= slot)
                    row.resize(slot + 1, 0.0);
                row[slot] = inner.inputValue().asFloat();
            }
        }
    }

    MVector matrixScale(const MMatrix& m)
    {
        double s[3] = { 1.0, 1.0, 1.0 };
        MTransformationMatrix(m).getScale(s, MSpace::kTransform);
        return MVector(s[0], s[1], s[2]);
    }

    // center_position_0..3: clamp keeps the feather half its width away from the
    // curve ends, then the curve is sampled at that parameter
    double centerParameter(double base, double wideFactor, double length)
    {
        const double half = length != 0.0 ? wideFactor / length : 0.0;
        const double lo = std::min(half, 1.0 - half);
        const double hi = std::max(half, 1.0 - half);
        return std::max(lo, std::min(hi, base));
    }

    // multi compound + multi float child, the layout bifrost gives array<array<float>>
    void makeNested(const char* longName, const char* shortName, MObject& parent, MObject& child)
    {
        MFnNumericAttribute  nAttr;
        MFnCompoundAttribute cAttr;

        const std::string childLong  = std::string(longName) + "_A";
        const std::string childShort = std::string(shortName) + "a";

        child = nAttr.create(childLong.c_str(), childShort.c_str(), MFnNumericData::kFloat, 0.0f);
        nAttr.setArray(true);
        nAttr.setKeyable(true);

        parent = cAttr.create(longName, shortName);
        cAttr.addChild(child);
        cAttr.setArray(true);
        cAttr.setKeyable(true);
    }

    // <name>[i].<name>_A[j].<name>_A_B[k] - three nested multis ending in a
    // matrix, the layout the graph exposed and wing2.py connects to
    void makeNestedMatrix(const char* longName, const char* shortName,
                          MObject& top, MObject& mid, MObject& deep)
    {
        MFnMatrixAttribute   mAttr;
        MFnCompoundAttribute cAttr;

        const std::string midLong   = std::string(longName) + "_A";
        const std::string midShort  = std::string(shortName) + "a";
        const std::string deepLong  = std::string(longName) + "_A_B";
        const std::string deepShort = std::string(shortName) + "ab";

        deep = mAttr.create(deepLong.c_str(), deepShort.c_str(), MFnMatrixAttribute::kDouble);
        mAttr.setArray(true);
        mAttr.setUsesArrayDataBuilder(true);
        mAttr.setWritable(false);
        mAttr.setStorable(false);

        mid = cAttr.create(midLong.c_str(), midShort.c_str());
        cAttr.addChild(deep);
        cAttr.setArray(true);
        cAttr.setUsesArrayDataBuilder(true);
        cAttr.setWritable(false);
        cAttr.setStorable(false);

        top = cAttr.create(longName, shortName);
        cAttr.addChild(mid);
        cAttr.setArray(true);
        cAttr.setUsesArrayDataBuilder(true);
        cAttr.setWritable(false);
        cAttr.setStorable(false);
    }

    MObject makeFloatArray(const char* longName, const char* shortName, float def)
    {
        MFnNumericAttribute nAttr;
        MObject a = nAttr.create(longName, shortName, MFnNumericData::kFloat, def);
        nAttr.setArray(true);
        nAttr.setKeyable(true);
        return a;
    }

    MObject makeLongArray(const char* longName, const char* shortName)
    {
        MFnNumericAttribute nAttr;
        MObject a = nAttr.create(longName, shortName, MFnNumericData::kInt, 0);
        nAttr.setArray(true);
        nAttr.setKeyable(true);
        return a;
    }
}

void* PkWingNode::creator()
{
    return new PkWingNode();
}

MStatus PkWingNode::initialize()
{
    MFnNumericAttribute  nAttr;
    MFnCompoundAttribute cAttr;
    MFnEnumAttribute     eAttr;
    MFnMatrixAttribute   mAttr;

    // curves_position[i].curves_position_A[j] - cvs of the i-th vertical curve
    aCurvesPositionA = nAttr.createPoint("curves_position_A", "cpa");
    nAttr.setArray(true);
    nAttr.setKeyable(true);

    aCurvesPosition = cAttr.create("curves_position", "cp");
    cAttr.addChild(aCurvesPositionA);
    cAttr.setArray(true);
    cAttr.setKeyable(true);
    addAttribute(aCurvesPosition);

    const char* offsetLong[7]  = { "root_offset_1", "root_offset_2", "root_offset_3",
                                   "root_offset_4", "root_offset_5", "root_offset_6",
                                   "root_offset_7" };
    const char* offsetShort[7] = { "ro1", "ro2", "ro3", "ro4", "ro5", "ro6", "ro7" };

    for (int i = 0; i < 7; ++i)
    {
        aRootOffset[i] = nAttr.create(offsetLong[i], offsetShort[i], MFnNumericData::kFloat, 0.0f);
        nAttr.setKeyable(true);
        addAttribute(aRootOffset[i]);
    }

    aInitCurvesLength = makeFloatArray("init_curves_length", "icl", 0.0f);
    addAttribute(aInitCurvesLength);

    aGlobalTransform = mAttr.create("global_transform", "gtr", MFnMatrixAttribute::kDouble);
    addAttribute(aGlobalTransform);

    aMainPoserTransform = mAttr.create("mainPoser_transform", "mptr", MFnMatrixAttribute::kDouble);
    addAttribute(aMainPoserTransform);

    aMirror = nAttr.create("mirror", "mir", MFnNumericData::kBoolean, false);
    nAttr.setKeyable(true);
    addAttribute(aMirror);

    aFlatten = nAttr.create("flatten", "flt", MFnNumericData::kBoolean, false);
    nAttr.setKeyable(true);
    addAttribute(aFlatten);

    aAutoTwistRoot = nAttr.create("auto_twist_root", "atr", MFnNumericData::kFloat, 0.0f);
    nAttr.setKeyable(true);
    addAttribute(aAutoTwistRoot);

    aAutoTwistTip = nAttr.create("auto_twist_tip", "att", MFnNumericData::kFloat, 0.0f);
    nAttr.setKeyable(true);
    addAttribute(aAutoTwistTip);

    aLayersCount = nAttr.create("layers_count", "lyc", MFnNumericData::kInt, 1);
    nAttr.setKeyable(true);
    nAttr.setMin(0);
    addAttribute(aLayersCount);

    aLayerFeathersCount = makeLongArray("layer_feathers_count", "lfc");
    addAttribute(aLayerFeathersCount);

    aLayerControlsCount = makeLongArray("layer_feather_controls_count", "lfcc");
    addAttribute(aLayerControlsCount);

    aLayerWide       = makeFloatArray("layer_wide",        "lwd",  1.0f); addAttribute(aLayerWide);
    aLayerPosMin     = makeFloatArray("layer_pos_min",     "lpmn", 0.0f); addAttribute(aLayerPosMin);
    aLayerPosMax     = makeFloatArray("layer_pos_max",     "lpmx", 1.0f); addAttribute(aLayerPosMax);
    aLayerLengthMin  = makeFloatArray("layer_length_min",  "llmn", 0.0f); addAttribute(aLayerLengthMin);
    aLayerLengthMax  = makeFloatArray("layer_length_max",  "llmx", 1.0f); addAttribute(aLayerLengthMax);
    aLayerTwistRoot  = makeFloatArray("layer_twist_root",  "ltwr", 0.0f); addAttribute(aLayerTwistRoot);
    aLayerTwistTip   = makeFloatArray("layer_twist_tip",   "ltwt", 0.0f); addAttribute(aLayerTwistTip);
    aLayerBend       = makeFloatArray("layer_bend",        "lbnd", 0.0f); addAttribute(aLayerBend);
    aLayerOffsetRoot = makeFloatArray("layer_offset_root", "lofr", 0.0f); addAttribute(aLayerOffsetRoot);
    aLayerOffsetTip  = makeFloatArray("layer_offset_tip",  "loft", 0.0f); addAttribute(aLayerOffsetTip);

    makeNested("wide",         "wd",  aWide,       aWideA);        addAttribute(aWide);
    makeNested("root_pos",     "rp",  aRootPos,    aRootPosA);     addAttribute(aRootPos);
    makeNested("tip_pos",      "tp",  aTipPos,     aTipPosA);      addAttribute(aTipPos);
    makeNested("pos_2_offset", "p2o", aPos2Offset, aPos2OffsetA);  addAttribute(aPos2Offset);
    makeNested("pos_3_offset", "p3o", aPos3Offset, aPos3OffsetA);  addAttribute(aPos3Offset);
    makeNested("length",       "len", aLength,     aLengthA);      addAttribute(aLength);
    makeNested("length_min",   "lmn", aLengthMin,  aLengthMinA);   addAttribute(aLengthMin);
    makeNested("twist_root",   "twr", aTwistRoot,  aTwistRootA);   addAttribute(aTwistRoot);
    makeNested("twist_tip",    "twt", aTwistTip,   aTwistTipA);    addAttribute(aTwistTip);
    makeNested("bend",         "bnd", aBend,       aBendA);        addAttribute(aBend);

    makeNestedMatrix("out_controls_local_matrixes", "oclm",
                     aOutControls, aOutControlsA, aOutControlsAB);
    addAttribute(aOutControls);

    makeNestedMatrix("out_joints_in_matrixes", "ojim",
                     aOutJointsIn, aOutJointsInA, aOutJointsInAB);
    addAttribute(aOutJointsIn);

    makeNestedMatrix("out_joints_out_matrixes", "ojom",
                     aOutJointsOut, aOutJointsOutA, aOutJointsOutAB);
    addAttribute(aOutJointsOut);

    aDebugStage = eAttr.create("debug_stage", "dstg", 0);
    eAttr.addField("off", 0);
    eAttr.addField("input cvs", 1);
    eAttr.addField("reparameterized vertical curves", 2);
    eAttr.addField("main spline cvs", 3);
    eAttr.addField("main splines sampled", 4);
    eAttr.addField("feather center points", 5);
    eAttr.addField("feather in points", 6);
    eAttr.addField("feather out points", 7);
    eAttr.addField("feather center + in + out", 8);
    eAttr.addField("joints in (world)", 9);
    eAttr.addField("joints out (world)", 10);
    eAttr.addField("feather centers (world)", 11);
    eAttr.addField("controls local", 12);
    eAttr.addField("joints in (local)", 13);
    eAttr.addField("joints out (local)", 14);
    eAttr.addField("frames in, no twist", 15);
    eAttr.addField("frames out, no twist", 16);
    eAttr.setKeyable(true);
    addAttribute(aDebugStage);

    aDebugLayer = nAttr.create("debug_layer", "dlyr", MFnNumericData::kInt, -1);
    nAttr.setKeyable(true);
    addAttribute(aDebugLayer);

    // the graph keeps 1.355 in a value node inside stretch_factor; exposed here
    // so it can be calibrated against the graph outputs instead of guessed
    aStretchK = nAttr.create("stretch_constant", "stk", MFnNumericData::kDouble, 1.355);
    nAttr.setKeyable(true);
    addAttribute(aStretchK);

    aDebugPoints = nAttr.createPoint("debug_points", "dpt");
    nAttr.setArray(true);
    nAttr.setUsesArrayDataBuilder(true);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aDebugPoints);

    aDebugLengths = nAttr.create("debug_curve_lengths", "dcl", MFnNumericData::kDouble, 0.0);
    nAttr.setArray(true);
    nAttr.setUsesArrayDataBuilder(true);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aDebugLengths);

    aDebugMatrices = mAttr.create("debug_matrices", "dmx", MFnMatrixAttribute::kDouble);
    mAttr.setArray(true);
    mAttr.setUsesArrayDataBuilder(true);
    mAttr.setWritable(false);
    mAttr.setStorable(false);
    addAttribute(aDebugMatrices);

    aDebugScalars = nAttr.create("debug_scalars", "dsc", MFnNumericData::kDouble, 0.0);
    nAttr.setArray(true);
    nAttr.setUsesArrayDataBuilder(true);
    nAttr.setWritable(false);
    nAttr.setStorable(false);
    addAttribute(aDebugScalars);

    MObject inputs[] = { aCurvesPosition, aCurvesPositionA, aInitCurvesLength,
                         aGlobalTransform, aMainPoserTransform, aMirror, aFlatten,
                         aAutoTwistRoot, aAutoTwistTip,
                         aLayersCount, aLayerFeathersCount, aLayerControlsCount,
                         aLayerWide, aLayerPosMin, aLayerPosMax,
                         aLayerLengthMin, aLayerLengthMax,
                         aLayerTwistRoot, aLayerTwistTip, aLayerBend,
                         aLayerOffsetRoot, aLayerOffsetTip,
                         aWide, aWideA, aRootPos, aRootPosA, aTipPos, aTipPosA,
                         aPos2Offset, aPos2OffsetA, aPos3Offset, aPos3OffsetA,
                         aLength, aLengthA, aLengthMin, aLengthMinA,
                         aTwistRoot, aTwistRootA, aTwistTip, aTwistTipA,
                         aBend, aBendA,
                         aDebugStage, aDebugLayer, aStretchK,
                         aRootOffset[0], aRootOffset[1], aRootOffset[2], aRootOffset[3],
                         aRootOffset[4], aRootOffset[5], aRootOffset[6] };

    for (size_t i = 0; i < sizeof(inputs) / sizeof(inputs[0]); ++i)
    {
        attributeAffects(inputs[i], aDebugPoints);
        attributeAffects(inputs[i], aDebugLengths);
        attributeAffects(inputs[i], aDebugMatrices);
        attributeAffects(inputs[i], aDebugScalars);
        attributeAffects(inputs[i], aOutControls);
        attributeAffects(inputs[i], aOutControlsA);
        attributeAffects(inputs[i], aOutControlsAB);
        attributeAffects(inputs[i], aOutJointsIn);
        attributeAffects(inputs[i], aOutJointsInA);
        attributeAffects(inputs[i], aOutJointsInAB);
        attributeAffects(inputs[i], aOutJointsOut);
        attributeAffects(inputs[i], aOutJointsOutA);
        attributeAffects(inputs[i], aOutJointsOutAB);
    }

    return MS::kSuccess;
}

std::vector<pk::BSpline> PkWingNode::buildMainSplines(MDataBlock& data,
                                                      std::vector<std::vector<MPoint> >* verticalCvs,
                                                      std::vector<pk::BSpline>* verticalReparam)
{
    // curves_position can be sparse - wing2.py removes multi instances - so
    // elements are stored by their logical index, not by iteration order
    std::vector<std::vector<MPoint> > cvs(kVerticalCurves);

    MArrayDataHandle outer = data.inputArrayValue(aCurvesPosition);
    for (unsigned e = 0; e < outer.elementCount(); ++e)
    {
        if (outer.jumpToArrayElement(e) != MS::kSuccess)
            continue;

        const int curve = int(outer.elementIndex());
        if (curve < 0 || curve >= kVerticalCurves)
            continue;

        MDataHandle element = outer.inputValue();
        MArrayDataHandle inner(element.child(aCurvesPositionA));

        std::vector<MPoint> points;
        for (unsigned k = 0; k < inner.elementCount(); ++k)
        {
            if (inner.jumpToArrayElement(k) != MS::kSuccess)
                continue;

            const float3& p = inner.inputValue().asFloat3();
            points.push_back(MPoint(p[0], p[1], p[2]));
        }

        cvs[curve] = points;
    }

    // 4 stations along every vertical curve:
    //     param = root_offset + j * (1 - root_offset) / 3
    std::vector<std::vector<MPoint> > stations(kMainCurves);
    std::vector<pk::BSpline> reparam;

    for (int i = 0; i < kVerticalCurves; ++i)
    {
        if (cvs[i].size() < 2)
            continue;

        const pk::BSpline vertical  = pk::BSpline::construct(cvs[i], 3, true, 0.0, 1.0);
        const pk::BSpline resampled = vertical.reparameterize(kReparamSamples);
        reparam.push_back(resampled);

        const double offset = data.inputValue(aRootOffset[i]).asFloat();
        const double step   = (1.0 - offset) / double(kMainCurves - 1);

        for (int j = 0; j < kMainCurves; ++j)
            stations[j].push_back(resampled.sample(offset + step * double(j)));
    }

    std::vector<pk::BSpline> main;
    for (int j = 0; j < kMainCurves; ++j)
    {
        if (stations[j].size() < 2)
            continue;

        main.push_back(pk::BSpline::construct(stations[j], 3, true, 0.0, 1.0));
    }

    if (verticalCvs)
        *verticalCvs = cvs;
    if (verticalReparam)
        *verticalReparam = reparam;

    return main;
}

void PkWingNode::readInputs(MDataBlock& data)
{
    WingInputs& in = mInputs;

    in.layersCount   = std::max(0, data.inputValue(aLayersCount).asInt());
    in.mirror        = data.inputValue(aMirror).asBool();
    in.flatten       = data.inputValue(aFlatten).asBool() ? 0.0 : 1.0;
    in.autoTwistRoot = data.inputValue(aAutoTwistRoot).asFloat();
    in.autoTwistTip  = data.inputValue(aAutoTwistTip).asFloat();
    in.stretchK      = data.inputValue(aStretchK).asDouble();
    in.globalScale   = matrixScale(data.inputValue(aGlobalTransform).asMatrix());

    // scale_correct: (init / mainPoser.scale.z) * (global.scale.z * (mirror ? -1 : 1))
    std::vector<double> rawInit;
    readFloats(data, aInitCurvesLength, rawInit);

    const double gz = in.globalScale.z;
    const double mz = matrixScale(data.inputValue(aMainPoserTransform).asMatrix()).z;
    const double sign = in.mirror ? -1.0 : 1.0;

    in.initLength.assign(kMainCurves, 0.0);
    for (int k = 0; k < kMainCurves; ++k)
    {
        const double init = k < int(rawInit.size()) ? rawInit[k] : 0.0;
        in.initLength[k] = mz != 0.0 ? (init / mz) * (gz * sign) : init * gz * sign;
    }

    readLongs(data, aLayerFeathersCount, in.feathersCount);
    readLongs(data, aLayerControlsCount, in.controlsCount);

    readFloats(data, aLayerWide,       in.layerWide, 1.0);
    readFloats(data, aLayerPosMin,     in.posMin);
    readFloats(data, aLayerPosMax,     in.posMax, 1.0);
    readFloats(data, aLayerLengthMin,  in.lengthMin);
    readFloats(data, aLayerLengthMax,  in.lengthMax, 1.0);
    readFloats(data, aLayerTwistRoot,  in.twistRoot);
    readFloats(data, aLayerTwistTip,   in.twistTip);
    readFloats(data, aLayerBend,       in.bend);
    readFloats(data, aLayerOffsetRoot, in.offsetRoot);
    readFloats(data, aLayerOffsetTip,  in.offsetTip);

    readNestedFloats(data, aWide,       aWideA,       in.fWide);
    readNestedFloats(data, aRootPos,    aRootPosA,    in.fRootPos);
    readNestedFloats(data, aTipPos,     aTipPosA,     in.fTipPos);
    readNestedFloats(data, aPos2Offset, aPos2OffsetA, in.fPos2);
    readNestedFloats(data, aPos3Offset, aPos3OffsetA, in.fPos3);
    readNestedFloats(data, aLength,     aLengthA,     in.fLength);
    readNestedFloats(data, aLengthMin,  aLengthMinA,  in.fLengthMin);
    readNestedFloats(data, aTwistRoot,  aTwistRootA,  in.fTwistRoot);
    readNestedFloats(data, aTwistTip,   aTwistTipA,   in.fTwistTip);
    readNestedFloats(data, aBend,       aBendA,       in.fBend);
}

std::vector<PkWingNode::FeatherLocs> PkWingNode::featherLocs(int layer,
                                                             const std::vector<pk::BSpline>& main)
{
    const WingInputs& in = mInputs;
    const std::vector<double>& initLength = in.initLength;

    std::vector<FeatherLocs> result;
    if (int(main.size()) < kMainCurves)
        return result;

    const int count = (layer >= 0 && layer < int(in.feathersCount.size()))
                    ? in.feathersCount[layer] : 0;
    if (count <= 0)
        return result;

    // Measured against the graph joints: the 0.1 constant from the top level is
    // not in the width path - without it the width matches the graph to four
    // digits (see pk_wing_spec.md, the constants section).
    const double wideMul = in.layerValue(in.layerWide, layer, 1.0);
    const double posMin  = in.layerValue(in.posMin, layer, 0.0);
    const double posMax  = in.layerValue(in.posMax, layer, 1.0);

    // pos_limits: 0..1 -> pos_min..pos_max, clamped
    std::vector<double> rootPos(count), tipPos(count), wide(count);
    for (int f = 0; f < count; ++f)
    {
        rootPos[f] = pk::changeRange(in.featherValue(in.fRootPos, layer, f, 0.0), posMin, posMax);
        tipPos[f]  = pk::changeRange(in.featherValue(in.fTipPos, layer, f, 0.0), posMin, posMax);
        wide[f]    = in.featherValue(in.fWide, layer, f, 0.0) * wideMul;
    }

    // in_out_position converts a world width into a parameter offset using
    // get_d1_bSpline_length, which measures the control polygon - not the arc
    double curveLength[kMainCurves];
    for (int k = 0; k < kMainCurves; ++k)
        curveLength[k] = main[k].polygonLength();

    result.reserve(count);

    for (int f = 0; f < count; ++f)
    {
        const double wideFactor = initLength[0] * wide[f];

        double param[kMainCurves];
        FeatherLocs locs;
        locs.center.resize(kMainCurves);
        locs.in.resize(kMainCurves);
        locs.out.resize(kMainCurves);

        for (int k = 0; k < kMainCurves; ++k)
        {
            double base = 0.0;
            if (k == 0)
                base = rootPos[f];
            else if (k == kMainCurves - 1)
                base = tipPos[f];
            else
            {
                const double lerped = rootPos[f] + (tipPos[f] - rootPos[f]) * kCenterFraction[k];
                base = lerped + in.featherValue(k == 1 ? in.fPos2 : in.fPos3, layer, f, 0.0);
            }

            param[k] = centerParameter(base, wideFactor, initLength[k]);
            locs.center[k] = main[k].sample(param[k]);
        }

        // in / out on curves 1..3: same curve, +- half width in parameter space
        for (int k = 1; k < kMainCurves; ++k)
        {
            const double half = curveLength[k] != 0.0 ? wideFactor / curveLength[k] : 0.0;
            locs.out[k] = main[k].sample(param[k] + half);
            locs.in[k]  = main[k].sample(param[k] - half);
        }

        // in / out at the root come from an aim frame whose up vector is the
        // wing surface normal (cross of the neighbour direction and the feather)
        {
            // graph if7.true_case = 1: the first feather looks at the NEXT one,
            // and if8 swaps the cross operands to keep the normal consistent
            int neighbourIndex = f == 0 ? 1 : f - 1;
            if (neighbourIndex >= count)
                neighbourIndex = f;

            const double neighbourParam = centerParameter(rootPos[neighbourIndex], wideFactor, initLength[0]);
            const MPoint neighbour = main[0].sample(neighbourParam);

            // graph: subtract = neighbour - center0, subtract1 = center1 - center0
            const MVector vN = MVector(neighbour - locs.center[0]);       // towards the neighbour
            const MVector vF = MVector(locs.center[1] - locs.center[0]);  // along the feather
            const MVector n  = (f == 0 ? (vN ^ vF) : (vF ^ vN)).normal();

            const MMatrix aim = pk::aimMatrix(locs.center[0], locs.center[1], locs.center[0] + n);

            locs.out[0] = MPoint(0.0, 0.0,  wideFactor) * aim;
            locs.in[0]  = MPoint(0.0, 0.0, -wideFactor) * aim;
        }

        result.push_back(locs);
    }

    return result;
}

std::vector<PkWingNode::FeatherMatrices> PkWingNode::featherMatrices(int layer,
                                                                     const std::vector<FeatherLocs>& locs,
                                                                     const std::vector<pk::BSpline>& main)
{
    const WingInputs& in = mInputs;
    const std::vector<double>& initLength = in.initLength;

    std::vector<FeatherMatrices> result;
    if (locs.empty() || int(main.size()) < kMainCurves)
        return result;

    const int controls = (layer >= 0 && layer < int(in.controlsCount.size()))
                       ? in.controlsCount[layer] : 0;
    if (controls < 2)
        return result;

    const double gLenMin = in.layerValue(in.lengthMin, layer, 0.0);
    const double gLenMax = in.layerValue(in.lengthMax, layer, 1.0);

    const double mSign = in.mirror ? -1.0 : 1.0;

    // flatten_compound zeroes the layer twists and the bend
    const double globalTwistRoot = in.layerValue(in.twistRoot, layer, 0.0) * in.flatten;
    const double globalTwistTip  = in.layerValue(in.twistTip,  layer, 0.0) * in.flatten;
    const double layerBend       = in.layerValue(in.bend,      layer, 0.0) * in.flatten * mSign;

    const double offsetRoot = in.layerValue(in.offsetRoot, layer, 0.0) * mSign;
    const double offsetTip  = in.layerValue(in.offsetTip,  layer, 0.0) * mSign;

    // stretch_factor: init length / (current length * constant), where the
    // length is get_d1_bSpline_length - the control polygon
    const double lenRoot = main[0].polygonLength();
    const double lenTip  = main[kMainCurves - 1].polygonLength();
    const double stretchRoot = lenRoot != 0.0 ? initLength[0] / (lenRoot * in.stretchK) : 0.0;
    const double stretchTip  = lenTip  != 0.0 ? initLength[kMainCurves - 1] / (lenTip * in.stretchK) : 0.0;

    const MVector globalScale = in.globalScale;

    // the two sign flips of the graph cancel out - see pk_wing_spec.md
    const double scaleY = std::abs(globalScale.y) > 1e-9 ? std::abs(globalScale.y) : 1.0;

    // mirror compound: flips when the global scale is negative
    const MVector flip = globalScale.x >= 0.0 ? MVector(1.0, 1.0, 1.0) : MVector(-1.0, -1.0, 1.0);
    const MMatrix flipMatrix = pk::composeST(flip, MVector::zero);

    // buffers reused by every feather of this layer
    std::vector<MPoint> centerPos(controls), inPos(controls), outPos(controls);
    SideFrames side[2];
    side[0].frame.resize(controls);
    side[0].twisted.resize(controls);
    side[1].frame.resize(controls);
    side[1].twisted.resize(controls);
    std::vector<double> twistPerControl(controls, 0.0);

    result.reserve(locs.size());

    for (size_t f = 0; f < locs.size(); ++f)
    {
        const pk::BSpline centerSpline = pk::BSpline::construct(locs[f].center, 3, true, 0.0, 1.0);
        const pk::BSpline inSpline     = pk::BSpline::construct(locs[f].in,     3, true, 0.0, 1.0);
        const pk::BSpline outSpline    = pk::BSpline::construct(locs[f].out,    3, true, 0.0, 1.0);

        const double length    = in.featherValue(in.fLength, layer, int(f), 1.0);
        const double lengthMin = in.featherValue(in.fLengthMin, layer, int(f), 0.0);
        const double twistRoot = in.featherValue(in.fTwistRoot, layer, int(f), 0.0);
        const double twistTip  = in.featherValue(in.fTwistTip, layer, int(f), 0.0);
        const double bendValue = layerBend + in.featherValue(in.fBend, layer, int(f), 0.0);

        // for_each_feather_segment_*: positions along the feather
        for (int k = 0; k < controls; ++k)
        {
            const double t = double(k) / double(controls - 1);
            const double param = lengthMin + gLenMin
                               + t * (gLenMax - gLenMin) * (length - lengthMin);

            centerPos[k] = centerSpline.sample(param);
            inPos[k]     = inSpline.sample(param);
            outPos[k]    = outSpline.sample(param);
        }

        // both sides of the feather: same code, the up vector is negated for out
        for (int sd = 0; sd < 2; ++sd)
        {
            const std::vector<MPoint>& upPos = (sd == 0) ? inPos : outPos;
            const bool upNegate = (sd == 1);

            for (int k = 0; k < controls; ++k)
            {
                const bool isLast = (k == controls - 1);
                const MPoint end = isLast ? centerPos[k - 1] : centerPos[k + 1];

                const MMatrix aim = pk::aimMatrix(centerPos[k], end, upPos[k], isLast, upNegate);

                const double u = double(k) / double(controls - 1);
                const double offZ = offsetRoot * (1.0 - u) + offsetTip * u;

                const MVector translate(0.0, 0.0, offZ * globalScale.z);
                const MMatrix srt = pk::composeST(globalScale, translate);

                // bifrost [aim, srt] -> maya srt * aim
                const MMatrix frame = srt * aim;
                side[sd].frame[k] = frame;

                const double twistDeg =
                      (in.autoTwistRoot * (1.0 - stretchRoot) - globalTwistRoot - twistRoot) * (1.0 - u)
                    + (in.autoTwistTip  * (1.0 - stretchTip)  - globalTwistTip  - twistTip)  * u;

                // pk_rotate_quaternion rotates the up direction (0,1,0) about X by
                // twistDeg and its float3 result is consumed by a QUATERNION port,
                // so w = 0 - which is a 180 degree rotation about that tilted axis.
                const double twistRad = twistDeg * kPi / 180.0;
                const MQuaternion twist(0.0, cos(twistRad), sin(twistRad), 0.0);

                const MMatrix bendMatrix = pk::composeST(MVector(1.0, 1.0, 1.0),
                                                         MVector(0.0, 0.0, bendValue * double(k)));

                // bifrost [frame, quat, bend] -> maya bend * quat * frame
                side[sd].twisted[k] = bendMatrix * twist.asMatrix() * frame;

                if (sd == 0)
                    twistPerControl[k] = twistDeg;
            }
        }

        FeatherMatrices m;
        m.center.resize(controls);
        m.jointsInWorld.resize(controls);
        m.jointsOutWorld.resize(controls);
        m.jointsIn.resize(controls);
        m.jointsOut.resize(controls);
        m.controlsLocal.resize(controls);
        m.framesIn  = side[0].frame;
        m.framesOut = side[1].frame;
        m.twistDegrees = twistPerControl;

        // feather_solver: the half width offset goes along Y, divided by the
        // global scale because the frames already carry it
        const double wideDistance = MVector(locs[f].center[0] - locs[f].in[0]).length();
        const MVector halfOffset(0.0, wideDistance / scaleY, 0.0);

        const MMatrix srtIn  = pk::composeST(MVector(1.0, 1.0, 1.0),  halfOffset);
        const MMatrix srtOut = pk::composeST(MVector(1.0, 1.0, 1.0), -halfOffset);

        for (int k = 0; k < controls; ++k)
        {
            // the center matrix comes from the untwisted frames
            m.center[k] = pk::lerpMatrix(side[0].frame[k], side[1].frame[k], 0.5);

            const MMatrix inverseCenter = m.center[k].inverse();

            // bifrost [inverse(center), twisted, srt] -> maya srt * twisted * inverse(center)
            m.jointsInWorld[k]  = srtIn  * side[0].twisted[k];
            m.jointsOutWorld[k] = srtOut * side[1].twisted[k];
            m.jointsIn[k]  = m.jointsInWorld[k]  * inverseCenter;
            m.jointsOut[k] = m.jointsOutWorld[k] * inverseCenter;
        }

        for (int k = 0; k < controls; ++k)
        {
            const MMatrix mirrored = flipMatrix * m.center[k];
            m.controlsLocal[k] = (k == 0)
                ? mirrored
                : mirrored * (flipMatrix * m.center[k - 1]).inverse();
        }

        result.push_back(m);
    }

    return result;
}

MStatus PkWingNode::computeOutputs(MDataBlock& data)
{
    readInputs(data);

    const std::vector<pk::BSpline> main = buildMainSplines(data, 0, 0);
    const int layers = mInputs.layersCount;

    // the math runs once, the three outputs are then filled from it
    std::vector<std::vector<FeatherMatrices> > perLayer(layers);
    for (int layer = 0; layer < layers; ++layer)
    {
        const std::vector<FeatherLocs> locs = featherLocs(layer, main);
        perLayer[layer] = featherMatrices(layer, locs, main);
    }

    MObject top[3]  = { aOutControls,   aOutJointsIn,   aOutJointsOut };
    MObject mid[3]  = { aOutControlsA,  aOutJointsInA,  aOutJointsOutA };
    MObject deep[3] = { aOutControlsAB, aOutJointsInAB, aOutJointsOutAB };

    for (int o = 0; o < 3; ++o)
    {
        MArrayDataHandle topHandle = data.outputArrayValue(top[o]);
        MArrayDataBuilder topBuilder(&data, top[o], unsigned(layers));

        for (int layer = 0; layer < layers; ++layer)
        {
            const std::vector<FeatherMatrices>& mats = perLayer[layer];

            MDataHandle layerElement = topBuilder.addElement(unsigned(layer));
            MArrayDataHandle featherArray(layerElement.child(mid[o]));
            MArrayDataBuilder featherBuilder(&data, mid[o], unsigned(mats.size()));

            for (unsigned f = 0; f < mats.size(); ++f)
            {
                const std::vector<MMatrix>& src = (o == 0) ? mats[f].controlsLocal
                                                : (o == 1) ? mats[f].jointsIn
                                                           : mats[f].jointsOut;

                MDataHandle featherElement = featherBuilder.addElement(f);
                MArrayDataHandle controlArray(featherElement.child(deep[o]));
                MArrayDataBuilder controlBuilder(&data, deep[o], unsigned(src.size()));

                for (unsigned k = 0; k < src.size(); ++k)
                    controlBuilder.addElement(k).setMMatrix(src[k]);

                controlArray.set(controlBuilder);
            }

            featherArray.set(featherBuilder);
        }

        topHandle.set(topBuilder);
        topHandle.setAllClean();
    }

    return MS::kSuccess;
}

MStatus PkWingNode::compute(const MPlug& plug, MDataBlock& data)
{
    // the real outputs the rig reads
    const MObject attr = plug.attribute();
    if (attr == aOutControls   || attr == aOutControlsA   || attr == aOutControlsAB
     || attr == aOutJointsIn   || attr == aOutJointsInA   || attr == aOutJointsInAB
     || attr == aOutJointsOut  || attr == aOutJointsOutA  || attr == aOutJointsOutAB)
        return computeOutputs(data);

    const bool wantsDebug = plug == aDebugPoints   || plug.parent() == aDebugPoints
                         || plug == aDebugLengths  || plug.parent() == aDebugLengths
                         || plug == aDebugMatrices || plug.parent() == aDebugMatrices
                         || plug == aDebugScalars  || plug.parent() == aDebugScalars;
    if (!wantsDebug)
        return MS::kUnknownParameter;

    const int stage = data.inputValue(aDebugStage).asShort();

    std::vector<MPoint>  points;
    std::vector<double>  lengths;
    std::vector<MMatrix> matrices;
    std::vector<double>  scalars;

    if (stage != 0)
    {
        readInputs(data);

        std::vector<std::vector<MPoint> > cvs;
        std::vector<pk::BSpline> reparam;
        const std::vector<pk::BSpline> main = buildMainSplines(data, &cvs, &reparam);

        // report what the graph measures, so the numbers are comparable
        for (size_t i = 0; i < main.size(); ++i)
            lengths.push_back(main[i].polygonLength());

        if (stage >= 5)
        {
            const int layers = mInputs.layersCount;
            const int only   = data.inputValue(aDebugLayer).asInt();

            for (int layer = 0; layer < std::max(0, layers); ++layer)
            {
                if (only >= 0 && layer != only)
                    continue;

                const std::vector<FeatherLocs> locs = featherLocs(layer, main);

                if (stage <= 8)
                {
                    for (size_t f = 0; f < locs.size(); ++f)
                    {
                        if (stage == 5 || stage == 8)
                            points.insert(points.end(), locs[f].center.begin(), locs[f].center.end());
                        if (stage == 6 || stage == 8)
                            points.insert(points.end(), locs[f].in.begin(), locs[f].in.end());
                        if (stage == 7 || stage == 8)
                            points.insert(points.end(), locs[f].out.begin(), locs[f].out.end());
                    }
                    continue;
                }

                const std::vector<FeatherMatrices> mats = featherMatrices(layer, locs, main);

                for (size_t f = 0; f < mats.size(); ++f)
                {
                    const std::vector<MMatrix>* src = 0;
                    switch (stage)
                    {
                    case 9:  src = &mats[f].jointsInWorld;  break;
                    case 10: src = &mats[f].jointsOutWorld; break;
                    case 11: src = &mats[f].center;         break;
                    case 12: src = &mats[f].controlsLocal;  break;
                    case 13: src = &mats[f].jointsIn;       break;
                    case 14: src = &mats[f].jointsOut;      break;
                    case 15: src = &mats[f].framesIn;       break;
                    case 16: src = &mats[f].framesOut;      break;
                    default: break;
                    }

                    if (!src)
                        continue;

                    matrices.insert(matrices.end(), src->begin(), src->end());
                    scalars.insert(scalars.end(), mats[f].twistDegrees.begin(), mats[f].twistDegrees.end());
                    for (size_t k = 0; k < src->size(); ++k)
                        points.push_back(MPoint((*src)[k][3][0], (*src)[k][3][1], (*src)[k][3][2]));
                }
            }
        }
        else
        {
            switch (stage)
            {
            case 1:     // input cvs as they arrive
                for (size_t i = 0; i < cvs.size(); ++i)
                    points.insert(points.end(), cvs[i].begin(), cvs[i].end());
                break;

            case 2:     // vertical curves after arc length reparameterization
                for (size_t i = 0; i < reparam.size(); ++i)
                    points.insert(points.end(), reparam[i].cvs.begin(), reparam[i].cvs.end());
                break;

            case 3:     // cvs of the 4 main splines - the sampled stations
                for (size_t i = 0; i < main.size(); ++i)
                    points.insert(points.end(), main[i].cvs.begin(), main[i].cvs.end());
                break;

            case 4:     // the main splines themselves
            default:
                for (size_t i = 0; i < main.size(); ++i)
                {
                    const int samples = 24;
                    for (int s = 0; s < samples; ++s)
                        points.push_back(main[i].sample(double(s) / double(samples - 1)));
                }
                break;
            }
        }
    }

    writePoints(data, aDebugPoints, points);
    writeDoubles(data, aDebugLengths, lengths);
    writeMatrices(data, aDebugMatrices, matrices);
    writeDoubles(data, aDebugScalars, scalars);

    return MS::kSuccess;
}
