#pragma once

#include "pkMath.h"

#include <maya/MPxNode.h>
#include <map>
#include <vector>

// Replacement for the bifrost graph of the wing2 module.
// Attribute names follow the graph ports so the python side keeps working -
// see plugins/pk_rigNodes/pk_wing_spec.md.
//
// Done so far: the 4 main splines, the support points of every feather and the
// control / joint matrices, all published through the debug outputs so they can
// be compared with the graph. The nested output arrays the rig connects to come
// with the integration step.
class PkWingNode : public MPxNode
{
public:
    static void*   creator();
    static MStatus initialize();

    MStatus compute(const MPlug& plug, MDataBlock& data) override;

    // --- inputs ------------------------------------------------------------
    static MObject aCurvesPosition;         // multi compound
    static MObject aCurvesPositionA;        //   child: multi float3, cvs of a vertical curve
    static MObject aRootOffset[7];
    static MObject aInitCurvesLength;       // multi float
    static MObject aGlobalTransform;
    static MObject aMainPoserTransform;
    static MObject aMirror;
    static MObject aFlatten;
    static MObject aAutoTwistRoot;
    static MObject aAutoTwistTip;

    static MObject aLayersCount;
    static MObject aLayerFeathersCount;     // multi long
    static MObject aLayerControlsCount;     // multi long
    static MObject aLayerWide;              // multi float
    static MObject aLayerPosMin;
    static MObject aLayerPosMax;
    static MObject aLayerLengthMin;
    static MObject aLayerLengthMax;
    static MObject aLayerTwistRoot;
    static MObject aLayerTwistTip;
    static MObject aLayerBend;
    static MObject aLayerOffsetRoot;
    static MObject aLayerOffsetTip;

    // per feather: multi compound -> multi float child, indexed [layer][feather]
    static MObject aWide,        aWideA;
    static MObject aRootPos,     aRootPosA;
    static MObject aTipPos,      aTipPosA;
    static MObject aPos2Offset,  aPos2OffsetA;
    static MObject aPos3Offset,  aPos3OffsetA;
    static MObject aLength,      aLengthA;
    static MObject aLengthMin,   aLengthMinA;
    static MObject aTwistRoot,   aTwistRootA;
    static MObject aTwistTip,    aTwistTipA;
    static MObject aBend,        aBendA;

    static MObject aDebugStage;
    static MObject aDebugLayer;             // -1 = all layers
    static MObject aStretchK;               // stretch_factor constant, graph value 1.355

    // --- outputs -----------------------------------------------------------
    // the arrays the rig connects to: multi compound -> multi compound ->
    // multi matrix, indexed [layer][feather][control], exactly as the graph
    // exposed them (see wing2.py:502-506)
    static MObject aOutControls,  aOutControlsA,  aOutControlsAB;
    static MObject aOutJointsIn,  aOutJointsInA,  aOutJointsInAB;
    static MObject aOutJointsOut, aOutJointsOutA, aOutJointsOutAB;

    static MObject aDebugPoints;            // multi float3
    static MObject aDebugLengths;           // multi double
    static MObject aDebugMatrices;          // multi matrix
    static MObject aDebugScalars;           // multi double - twist per control

private:
    // Every input read once per evaluation. Reading the nested arrays inside the
    // per layer functions meant re-reading all of them for each of the layers,
    // which dominated the evaluation time.
    struct WingInputs
    {
        int    layersCount;
        bool   mirror;
        double flatten;         // 0 when flatten is on, 1 otherwise
        double autoTwistRoot;
        double autoTwistTip;
        double stretchK;
        MVector globalScale;

        std::vector<double> initLength;      // corrected by scale_correct

        // per layer
        std::vector<int>    feathersCount, controlsCount;
        std::vector<double> layerWide, posMin, posMax, lengthMin, lengthMax;
        std::vector<double> twistRoot, twistTip, bend, offsetRoot, offsetTip;

        // per layer, per feather
        std::vector<std::vector<double> > fWide, fRootPos, fTipPos, fPos2, fPos3;
        std::vector<std::vector<double> > fLength, fLengthMin, fTwistRoot, fTwistTip, fBend;

        double layerValue(const std::vector<double>& v, int layer, double fallback) const
        {
            return (layer >= 0 && layer < int(v.size())) ? v[layer] : fallback;
        }

        double featherValue(const std::vector<std::vector<double> >& v,
                            int layer, int feather, double fallback) const
        {
            if (layer < 0 || layer >= int(v.size()))
                return fallback;
            const std::vector<double>& row = v[layer];
            return (feather >= 0 && feather < int(row.size())) ? row[feather] : fallback;
        }
    };

    WingInputs mInputs;

    void readInputs(MDataBlock& data);

    // support points of one feather - cvs of its center / in / out splines
    struct FeatherLocs
    {
        std::vector<MPoint> center;
        std::vector<MPoint> in;
        std::vector<MPoint> out;
    };

    // one side of a feather: for_each_in_matrixes
    struct SideFrames
    {
        std::vector<MMatrix> frame;      // out_matrix   - aim + offset, no twist
        std::vector<MMatrix> twisted;    // twisted_matrix
    };

    // feather_solver
    struct FeatherMatrices
    {
        std::vector<MMatrix> center;         // world, twist free
        std::vector<MMatrix> jointsInWorld;
        std::vector<MMatrix> jointsOutWorld;
        std::vector<MMatrix> jointsIn;       // local, relative to center
        std::vector<MMatrix> jointsOut;
        std::vector<MMatrix> controlsLocal;
        std::vector<MMatrix> framesIn;       // untwisted, for diagnostics
        std::vector<MMatrix> framesOut;
        std::vector<double>  twistDegrees;
    };

    // 7 vertical curves -> 4 stations on each -> 4 main cubic splines
    std::vector<pk::BSpline> buildMainSplines(MDataBlock& data,
                                              std::vector<std::vector<MPoint> >* verticalCvs,
                                              std::vector<pk::BSpline>* verticalReparam);

    // for_each_feather_locs for one layer
    std::vector<FeatherLocs> featherLocs(int layer, const std::vector<pk::BSpline>& main);

    // fills the three nested output arrays for every layer
    MStatus computeOutputs(MDataBlock& data);

    // feather_solver for one layer
    std::vector<FeatherMatrices> featherMatrices(int layer,
                                                 const std::vector<FeatherLocs>& locs,
                                                 const std::vector<pk::BSpline>& main);
};
