#pragma once

#include <maya/MMatrix.h>
#include <maya/MQuaternion.h>
#include <maya/MPoint.h>
#include <maya/MVector.h>
#include <vector>

namespace pk
{

// B-spline exactly as the bifrost graph stores it: control points, degree and a
// clamped knot vector (see plugins/pk_rigNodes/pk_wing_spec.md).
struct BSpline
{
    std::vector<MPoint> cvs;
    int                 degree = 3;
    std::vector<double> knots;

    bool valid() const { return cvs.size() >= 2 && knots.size() == cvs.size() + degree + 1; }

    // Clamped uniform knots: (degree + 1) zeros, then 1 .. spans - 1, then
    // (degree + 1) copies of spans, optionally remapped into [mn, mx].
    // Matches get_zeroToSpans_knot_vector + remap in the graph.
    static std::vector<double> makeKnots(int cvCount, int degree,
                                         bool remapRange = true, double mn = 0.0, double mx = 1.0);

    // construct_bSpline: degree is lowered when there are too few control points.
    static BSpline construct(const std::vector<MPoint>& cvs, int degree,
                             bool remapRange = true, double mn = 0.0, double mx = 1.0);

    double domainStart() const { return valid() ? knots[degree] : 0.0; }
    double domainEnd()   const { return valid() ? knots[cvs.size()] : 1.0; }

    double clampParameter(double t) const;

    // find_span: index of the last knot <= t, and < t at the very end of the
    // domain - the end-of-domain rule the graph uses.
    int findSpan(double t, double& clamped) const;

    // deBoor
    MPoint sample(double t) const;

    // Chord length of the curve, sampled per span.
    double length(int samplesPerSpan = 16) const;

    // What the graph calls get_d1_bSpline_length: the length of the polyline
    // through the control points (exact for degree 1, an approximation the
    // graph also applies to cubic curves - so it has to be matched, not fixed).
    double polygonLength() const;

    // reparameterize_bSpline: resample into a degree-1 spline whose cvs are
    // spaced evenly by arc length.
    BSpline reparameterize(int samples) const;
};

// pk_aim_matrix (the graph variant, with the negate flags):
//     aim  = end - start        , negated when endNegate
//     upv  = up  - end          , negated when upNegate
//     side = normalize(cross(aim, upv))
//     up   = normalize(cross(side, aim))
// Bifrost fills the columns c0..c3 with aim / up / side / position, which in
// Maya row-vector layout are rows 0..3.
MMatrix aimMatrix(const MPoint& start, const MPoint& end, const MPoint& up,
                  bool endNegate = false, bool upNegate = false, double positionBlend = 0.0);

// Core::Math::change_range with clamp, from 0..1 into to0..to1
double changeRange(double value, double to0, double to1);

// pk_lerp_matrix: lerp of scale and translation, slerp of the rotation
// (always_use_shorter_arc), recomposed back into a matrix.
MMatrix lerpMatrix(const MMatrix& a, const MMatrix& b, double fraction);

// scale / rotation / translation -> matrix, Maya row-vector layout
MMatrix composeSRT(const MVector& scale, const MQuaternion& rotation, const MVector& translation);

// same without a rotation - avoids building a quaternion matrix for nothing
MMatrix composeST(const MVector& scale, const MVector& translation);

} // namespace pk
