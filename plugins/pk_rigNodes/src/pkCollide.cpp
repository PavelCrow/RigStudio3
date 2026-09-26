#include "pkCollide.h"

#include <maya/MArrayDataHandle.h>
#include <maya/MFnAttribute.h>
#include <maya/MDataHandle.h>
#include <maya/MFnCompoundAttribute.h>
#include <maya/MFnEnumAttribute.h>
#include <maya/MFnMatrixAttribute.h>
#include <maya/MFnNumericAttribute.h>
#include <maya/MPlug.h>
#include <maya/MString.h>

#include <algorithm>
#include <cmath>

namespace
{
    const double kEps = 1.0e-9;

    // MPlug::child берёт номер, а не атрибут - ищем свой по атрибуту
    bool connected(const MPlug& el, const MObject& attr)
    {
        for (unsigned k = 0; k < el.numChildren(); ++k)
        {
            MPlug c = el.child(k);
            if (c.attribute() == attr)
                return c.isConnected();
        }
        return false;
    }
}

namespace pk
{

void make(Attrs& a)
{
    MFnNumericAttribute  nAttr;
    MFnEnumAttribute     eAttr;
    MFnMatrixAttribute   mAttr;
    MFnCompoundAttribute cAttr;

    a.collide = nAttr.create("collide", "cld", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    a.thickness = nAttr.create("thickness", "thk", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(5.0);
    nAttr.setKeyable(true);

    a.bounce = nAttr.create("bounce", "bnc", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    a.friction = nAttr.create("friction", "frc", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setKeyable(true);

    a.type = eAttr.create("colliderType", "clt", 0);
    eAttr.addField("plane", 0);
    eAttr.addField("sphere", 1);
    eAttr.addField("capsule", 2);
    eAttr.addField("box", 3);
    eAttr.setKeyable(false);

    a.infinite = nAttr.create("colliderInfinite", "cli", MFnNumericData::kBoolean, true);
    nAttr.setKeyable(true);

    a.sizeX = nAttr.create("colliderSizeX", "clsx", MFnNumericData::kDouble, 1.0);
    a.sizeY = nAttr.create("colliderSizeY", "clsy", MFnNumericData::kDouble, 1.0);
    a.sizeZ = nAttr.create("colliderSizeZ", "clsz", MFnNumericData::kDouble, 1.0);
    a.size  = nAttr.create("colliderSize", "cls", a.sizeX, a.sizeY, a.sizeZ);
    nAttr.setKeyable(true);

    a.matrix = mAttr.create("colliderMatrix", "clm");
    // коллайдер удалили - элемент списка уходит с ним. Иначе матрица осталась бы
    // единичной, и на месте пола, которого больше нет, продолжала бы стоять
    // плоскость в начале координат
    mAttr.setDisconnectBehavior(MFnAttribute::kDelete);

    a.radius = nAttr.create("colliderRadius", "clr", MFnNumericData::kDouble, 1.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(20.0);
    nAttr.setKeyable(true);

    a.length = nAttr.create("colliderLength", "cll", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setSoftMax(20.0);
    nAttr.setKeyable(true);

    // один элемент - один коллайдер: пол плоскостью, голова сферой, бедро
    // капсулой, ящик боксом, и всё это одновременно
    a.collider = cAttr.create("collider", "cl");
    cAttr.addChild(a.type);
    cAttr.addChild(a.infinite);
    cAttr.addChild(a.size);
    cAttr.addChild(a.matrix);
    cAttr.addChild(a.radius);
    cAttr.addChild(a.length);
    cAttr.setArray(true);
}

void list(const Attrs& a, std::vector<MObject>& out)
{
    out.push_back(a.collide);
    out.push_back(a.thickness);
    out.push_back(a.bounce);
    out.push_back(a.friction);
    out.push_back(a.collider);
}

void read(MDataBlock& data, const Attrs& a, const MObject& node, World& w)
{
    w.collide  = data.inputValue(a.collide).asDouble();
    w.bounce   = data.inputValue(a.bounce).asDouble();
    w.friction = data.inputValue(a.friction).asDouble();
    w.colliders.clear();

    if (w.collide <= kEps)
        return;

    MStatus status;
    MArrayDataHandle hc = data.inputArrayValue(a.collider, &status);
    if (!status)
        return;

    const unsigned count = hc.elementCount();
    w.colliders.reserve(count);

    MPlug all(node, a.collider);

    for (unsigned i = 0; i < count; ++i)
    {
        if (!hc.jumpToArrayElement(i))
            break;

        // Коллайдер удалили, а элемент остался: связи у него рвутся по одной, и
        // та, что рвётся последней, заводит элемент заново - удалиться он уже
        // не успевает. Матрица у такого элемента единичная, то есть плоскость в
        // начале координат, и кость упирается в пол, которого нет. Поэтому
        // спрашиваем у графа: есть ли у матрицы кто-то на входе.
        if (!connected(all.elementByLogicalIndex(hc.elementIndex()), a.matrix))
            continue;

        MDataHandle   e = hc.inputValue();
        const MMatrix m = e.child(a.matrix).asMatrix();

        Collider c;
        c.type     = e.child(a.type).asShort();
        c.radius   = e.child(a.radius).asDouble();
        c.o        = MPoint(m[3][0], m[3][1], m[3][2]);
        c.infinite = e.child(a.infinite).asBool();
        c.xf       = m;
        c.inv      = m.inverse();

        const MVector side = e.child(a.size).asDouble3();
        c.half = MVector(side.x, side.y, side.z) * 0.5;

        // оси как есть, поэтому масштаб трансформа масштабирует и коллайдер -
        // растянутый локатор это и правда большая сфера
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
                c.n = (y / up) * (e.child(a.length).asDouble() * up * 0.5);
        }

        // у конечных нужен размер, у круглых радиус
        const bool sized = (c.half.x > kEps && c.half.z > kEps
                            && (c.type != 3 || c.half.y > kEps));
        const bool ok = (c.type == 0) ? (c.infinite || sized)
                      : (c.type == 3) ? sized
                                      : (c.radius > kEps);
        if (ok)
            w.colliders.push_back(c);
    }
}

bool depthOf(const Collider& c, const MPoint& p, double pad,
             MVector& dir, double& depth)
{
    if (c.type == 0)
    {
        const double d = MVector(p - c.o) * c.n - pad;

        // бесконечная - всё, что выше её Y, снаружи
        if (c.infinite)
        {
            if (d >= 0.0)
                return false;

            dir   = c.n;
            depth = -d;
            return true;
        }

        // конечная: внутри своего квадрата она пол, а за краем - сам край,
        // обтянутый толщиной. Иначе кость, сходящая с пола, цеплялась бы за
        // угол или проваливалась ровно на его границе
        const MPoint lp = p * c.inv;
        if (std::fabs(lp.x) <= c.half.x && std::fabs(lp.z) <= c.half.z)
        {
            if (d >= 0.0)
                return false;

            dir   = c.n;
            depth = -d;
            return true;
        }

        const MPoint edge(std::min(c.half.x, std::max(-c.half.x, lp.x)), 0.0,
                          std::min(c.half.z, std::max(-c.half.z, lp.z)));
        const MVector away = p - (edge * c.xf);
        const double  len  = away.length();
        if (len >= pad)
            return false;

        dir   = (len > kEps) ? (away / len) : c.n;
        depth = pad - len;
        return true;
    }

    if (c.type == 3)
    {
        // бокс: в его собственной системе достаточно зажать точку по трём
        // сторонам - это и есть ближайшее к ней место на нём
        const MPoint lp = p * c.inv;
        const bool inside = std::fabs(lp.x) <= c.half.x
                         && std::fabs(lp.y) <= c.half.y
                         && std::fabs(lp.z) <= c.half.z;

        if (!inside)
        {
            const MPoint near(std::min(c.half.x, std::max(-c.half.x, lp.x)),
                              std::min(c.half.y, std::max(-c.half.y, lp.y)),
                              std::min(c.half.z, std::max(-c.half.z, lp.z)));
            const MVector away = p - (near * c.xf);
            const double  len  = away.length();
            if (len >= pad)
                return false;

            dir   = (len > kEps) ? (away / len) : MVector::yAxis;
            depth = pad - len;
            return true;
        }

        // Внутри - наружу через ближайшую грань. Выпускать назад, откуда
        // пришли, пробовалось и откачено: при почти стоячей точке "против
        // движения" выбирает далёкую боковую грань, и точку с покоя на крышке
        // большого бокса швыряло на тридцать единиц в сторону.
        const double gap[3] = { c.half.x - std::fabs(lp.x),
                                c.half.y - std::fabs(lp.y),
                                c.half.z - std::fabs(lp.z) };
        int axis = 0;
        if (gap[1] < gap[axis]) axis = 1;
        if (gap[2] < gap[axis]) axis = 2;

        MPoint out = lp;
        out[axis] = (lp[axis] >= 0.0) ? c.half[axis] : -c.half[axis];

        const MVector away = (out * c.xf) - p;
        const double  len  = away.length();
        dir   = (len > kEps) ? (away / len) : MVector::yAxis;
        depth = len + pad;
        return true;
    }

    MPoint centre = c.o;
    if (c.type == 2)
    {
        // капсула - сфера вокруг ближайшей точки своей оси
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

    // ровно в середине кратчайшего пути наружу нет, поэтому сойдёт любой
    dir   = (len > kEps) ? (v / len) : MVector::yAxis;
    depth = want - len;
    return true;
}

bool clear(MPoint& p, MVector* vel, const World& w, double pad)
{
    bool moved = false;

    for (size_t k = 0; k < w.colliders.size(); ++k)
    {
        const Collider& c = w.colliders[k];

        MVector dir;
        double  depth;
        if (!depthOf(c, p, pad, dir, depth))
            continue;

        moved = true;
        p += dir * (depth * w.collide);
        if (!vel)
            continue;

        const double into = (*vel) * dir;
        if (into < 0.0)
            *vel -= dir * (into * (1.0 + w.bounce) * w.collide);

        if (w.friction > kEps)
        {
            const MVector along = *vel - dir * ((*vel) * dir);
            *vel -= along * (w.friction * w.collide);
        }
    }

    return moved;
}

}   // namespace pk
