#include "pkMath.h"

#include <maya/MTransformationMatrix.h>

#include <algorithm>
#include <cmath>

namespace pk
{

std::vector<double> BSpline::makeKnots(int cvCount, int degree, bool remapRange, double mn, double mx)
{
    std::vector<double> knots;
    if (cvCount < 2)
        return knots;

    degree = std::min(degree, cvCount - 1);
    const int spans = cvCount - degree;

    knots.reserve(cvCount + degree + 1);
    for (int i = 0; i <= degree; ++i)
        knots.push_back(0.0);
    for (int i = 1; i < spans; ++i)
        knots.push_back(double(i));
    for (int i = 0; i <= degree; ++i)
        knots.push_back(double(spans));

    if (remapRange && spans > 0)
    {
        const double scale = (mx - mn) / double(spans);
        for (double& k : knots)
            k = mn + k * scale;
    }

    return knots;
}

BSpline BSpline::construct(const std::vector<MPoint>& cvs, int degree, bool remapRange, double mn, double mx)
{
    BSpline s;
    s.cvs = cvs;
    s.degree = cvs.size() >= 2 ? std::min(degree, int(cvs.size()) - 1) : degree;
    s.knots = makeKnots(int(cvs.size()), degree, remapRange, mn, mx);
    return s;
}

double BSpline::clampParameter(double t) const
{
    if (!valid())
        return t;
    return std::max(domainStart(), std::min(domainEnd(), t));
}

int BSpline::findSpan(double t, double& clamped) const
{
    clamped = clampParameter(t);
    if (!valid())
        return degree;

    const bool atEnd = !(clamped < knots.back());   // clamped == last knot

    int span = degree;
    for (size_t i = 0; i < knots.size(); ++i)
    {
        const bool inside = atEnd ? (knots[i] < clamped) : (knots[i] <= clamped);
        if (inside)
            span = int(i);
    }

    // the span must leave `degree` control points to its left and one to its right
    span = std::max(degree, std::min(span, int(cvs.size()) - 1));
    return span;
}

MPoint BSpline::sample(double t) const
{
    if (cvs.empty())
        return MPoint::origin;
    if (!valid())
        return cvs.front();

    double x = 0.0;
    const int span = findSpan(t, x);

    // de Boor
    std::vector<MPoint> d(degree + 1);
    for (int j = 0; j <= degree; ++j)
    {
        const int index = std::max(0, std::min(j + span - degree, int(cvs.size()) - 1));
        d[j] = cvs[index];
    }

    for (int r = 1; r <= degree; ++r)
    {
        for (int j = degree; j >= r; --j)
        {
            const int left  = j + span - degree;
            const int right = j + 1 + span - r;
            if (left < 0 || right >= int(knots.size()))
                continue;

            const double lo = knots[left];
            const double hi = knots[right];
            const double denom = hi - lo;
            const double a = denom > 1e-12 ? (x - lo) / denom : 0.0;

            d[j] = d[j - 1] * (1.0 - a) + d[j] * a;
        }
    }

    return d[degree];
}

double BSpline::length(int samplesPerSpan) const
{
    if (!valid())
        return 0.0;

    const int spans = int(cvs.size()) - degree;
    const int count = std::max(2, spans * std::max(2, samplesPerSpan));

    const double a = domainStart();
    const double b = domainEnd();

    double total = 0.0;
    MPoint prev = sample(a);
    for (int i = 1; i < count; ++i)
    {
        const MPoint p = sample(a + (b - a) * double(i) / double(count - 1));
        total += (p - prev).length();
        prev = p;
    }

    return total;
}

double BSpline::polygonLength() const
{
    double total = 0.0;
    for (size_t i = 1; i < cvs.size(); ++i)
        total += (cvs[i] - cvs[i - 1]).length();
    return total;
}

BSpline BSpline::reparameterize(int samples) const
{
    samples = std::max(2, samples);

    std::vector<MPoint> points;
    if (!valid())
        return construct(cvs, 1);

    // sample_bSpline_per_span: exactly `samples` steps per span, the same
    // density the graph uses - the polyline below depends on it
    const int spans = std::max(1, int(cvs.size()) - degree);
    const int dense = std::max(2, spans * samples);

    const double a = domainStart();
    const double b = domainEnd();

    std::vector<MPoint> raw(dense);
    std::vector<double> cumulative(dense, 0.0);
    for (int i = 0; i < dense; ++i)
    {
        raw[i] = sample(a + (b - a) * double(i) / double(dense - 1));
        if (i > 0)
            cumulative[i] = cumulative[i - 1] + (raw[i] - raw[i - 1]).length();
    }

    const double total = cumulative.back();
    points.reserve(samples);

    if (total < 1e-9)
    {
        points.assign(samples, raw.front());
        return construct(points, 1);
    }

    // walk the polyline picking positions spaced evenly by length
    int seg = 0;
    for (int i = 0; i < samples; ++i)
    {
        const double want = total * double(i) / double(samples - 1);
        while (seg + 1 < dense - 1 && cumulative[seg + 1] < want)
            ++seg;

        const double lo = cumulative[seg];
        const double hi = cumulative[seg + 1];
        const double f = (hi - lo) > 1e-12 ? (want - lo) / (hi - lo) : 0.0;

        points.push_back(raw[seg] + (raw[seg + 1] - raw[seg]) * f);
    }

    return construct(points, 1);
}

MMatrix aimMatrix(const MPoint& start, const MPoint& end, const MPoint& up,
                  bool endNegate, bool upNegate, double positionBlend)
{
    MVector aim = MVector(end - start);
    if (endNegate)
        aim = -aim;

    MVector upv = MVector(up - end);
    if (upNegate)
        upv = -upv;

    const MVector side  = (aim ^ upv).normal();
    const MVector upDir = (side ^ aim).normal();
    const MVector aimN  = aim.normal();

    const MPoint pos = start + (end - start) * std::max(0.0, std::min(1.0, positionBlend));

    double m[4][4] = {
        { aimN.x,  aimN.y,  aimN.z,  0.0 },
        { upDir.x, upDir.y, upDir.z, 0.0 },
        { side.x,  side.y,  side.z,  0.0 },
        { pos.x,   pos.y,   pos.z,   1.0 }
    };

    return MMatrix(m);
}

double changeRange(double value, double to0, double to1)
{
    const double v = std::max(0.0, std::min(1.0, value));
    return to0 + (to1 - to0) * v;
}

MMatrix composeSRT(const MVector& scale, const MQuaternion& rotation, const MVector& translation)
{
    // Built by hand instead of through MTransformationMatrix: this runs a few
    // thousand times per evaluation and the transformation matrix path is slow.
    // Maya multiplies row vectors, so M = S * R * T means the rotation rows are
    // scaled and the translation sits in the last row.
    MMatrix m = rotation.asMatrix();

    m[0][0] *= scale.x; m[0][1] *= scale.x; m[0][2] *= scale.x;
    m[1][0] *= scale.y; m[1][1] *= scale.y; m[1][2] *= scale.y;
    m[2][0] *= scale.z; m[2][1] *= scale.z; m[2][2] *= scale.z;

    m[3][0] = translation.x;
    m[3][1] = translation.y;
    m[3][2] = translation.z;

    return m;
}

MMatrix composeST(const MVector& scale, const MVector& translation)
{
    // scale + translation only, no rotation - the common case in the solver
    MMatrix m;
    m[0][0] = scale.x;
    m[1][1] = scale.y;
    m[2][2] = scale.z;
    m[3][0] = translation.x;
    m[3][1] = translation.y;
    m[3][2] = translation.z;
    return m;
}

namespace
{
    // Cheap decomposition: the rows of our frames are basis vectors scaled by
    // the global scale, so lengths give the scale and the normalized rows give
    // the rotation. MTransformationMatrix would do the same but much slower,
    // and lerpMatrix runs once per control of every feather.
    void decomposeFast(const MMatrix& m, MVector& scale, MQuaternion& rotation, MVector& translation)
    {
        MVector x(m[0][0], m[0][1], m[0][2]);
        MVector y(m[1][0], m[1][1], m[1][2]);
        MVector z(m[2][0], m[2][1], m[2][2]);

        scale = MVector(x.length(), y.length(), z.length());
        translation = MVector(m[3][0], m[3][1], m[3][2]);

        if (scale.x > 1e-12) x /= scale.x;
        if (scale.y > 1e-12) y /= scale.y;
        if (scale.z > 1e-12) z /= scale.z;

        double r[4][4] = {
            { x.x, x.y, x.z, 0.0 },
            { y.x, y.y, y.z, 0.0 },
            { z.x, z.y, z.z, 0.0 },
            { 0.0, 0.0, 0.0, 1.0 }
        };

        rotation = MQuaternion();
        rotation = MMatrix(r);
    }
}

MMatrix lerpMatrix(const MMatrix& a, const MMatrix& b, double fraction)
{
    MVector scaleA, scaleB, translationA, translationB;
    MQuaternion rotationA, rotationB;

    decomposeFast(a, scaleA, rotationA, translationA);
    decomposeFast(b, scaleB, rotationB, translationB);

    const MVector scale = scaleA + (scaleB - scaleA) * fraction;
    const MVector translation = translationA + (translationB - translationA) * fraction;

    // always_use_shorter_arc of the graph: a quaternion and its negation are
    // the same rotation, and Maya's slerp does NOT pick the short way by
    // itself. Without this the sign flips from frame to frame and the
    // interpolated frame jumps by ~180 degrees - the feathers jitter.
    MQuaternion target = rotationB;
    const double dot = rotationA.x * target.x + rotationA.y * target.y
                     + rotationA.z * target.z + rotationA.w * target.w;
    if (dot < 0.0)
        target.negateIt();

    const MQuaternion rotation = slerp(rotationA, target, fraction);

    return composeSRT(scale, rotation, translation);
}

} // namespace pk
