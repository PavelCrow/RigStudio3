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
MObject PkIbtwNode::aRestMode;
MObject PkIbtwNode::aRestChildMatrix;
MObject PkIbtwNode::aRestChildEndMatrix;
MObject PkIbtwNode::aRestChildPosition;
MObject PkIbtwNode::aRestParentMatrix;
MObject PkIbtwNode::aRestParentEndMatrix;
MObject PkIbtwNode::aRestParentPosition;
MObject PkIbtwNode::aOutRestMatrix;
MObject PkIbtwNode::aFrameMode;
MObject PkIbtwNode::aFrameReference;
MObject PkIbtwNode::aFrameRotate;
MObject PkIbtwNode::aFrameRotateX, PkIbtwNode::aFrameRotateY, PkIbtwNode::aFrameRotateZ;
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
MObject PkIbtwNode::aMirrorOf;
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
    // Кадр из initLoc позера. Оси нормализуются и ортогонализируются, и
    // отражение при этом снимается само: Z строится из X и Y, так что тройка
    // всегда правая. На зеркальной стороне initLoc несёт минус в скейле, и без
    // этого отражение попадало в нейтраль - у правой ключицы, например, Z
    // смотрит против кости.
    //
    // Позиция сдвигается вдоль кости на `u`: косточка твистовой цепочки стоит
    // не в начале кости, а в своей доле её длины, и длина живая - она меняется
    // вместе с позерами. 0 - сама кость, 1 - её дальний конец, то есть initLoc
    // ребёнка. При u 0 второй кадр не читается вовсе.
    MMatrix restFrame(const MMatrix& m, const MMatrix& end, double u)
    {
        MVector x(m(0, 0), m(0, 1), m(0, 2));
        MVector y(m(1, 0), m(1, 1), m(1, 2));
        MVector p(m(3, 0), m(3, 1), m(3, 2));

        x.normalize();
        const MVector z = (x ^ y).normal();
        y = z ^ x;

        if (u > kEps)
        {
            const MVector e(end(3, 0), end(3, 1), end(3, 2));
            p += (e - p) * u;
        }

        const double out[4][4] = {
            { x.x, x.y, x.z, 0.0 },
            { y.x, y.y, y.z, 0.0 },
            { z.x, z.y, z.z, 0.0 },
            { p.x, p.y, p.z, 1.0 }
        };
        return MMatrix(out);
    }

    // Рабочий кадр, построенный по самой кости: X ведётся на её конец, а
    // поперечное направление тела - мировой X - уходит в Z. Оба кадра приходят
    // мировыми, а ответ нужен в осях кости, поэтому всё сводится к скалярным
    // произведениям с её осями.
    //
    // Пусто (единичный поворот), если вести не на что: конец совпал с началом
    // или кость идёт ровно поперёк тела.
    MQuaternion aimFrame(const MMatrix& rest, const MMatrix& end, const MMatrix& reference)
    {
        const MVector x0(rest(0, 0), rest(0, 1), rest(0, 2));
        const MVector y0(rest(1, 0), rest(1, 1), rest(1, 2));
        const MVector z0(rest(2, 0), rest(2, 1), rest(2, 2));
        const MVector p0(rest(3, 0), rest(3, 1), rest(3, 2));
        const MVector pe(end(3, 0), end(3, 1), end(3, 2));

        MVector d = pe - p0;
        if (d.length() <= kEps)
            return MQuaternion::identity;
        d.normalize();

        // направление на конец и поперечное направление тела, в осях кости
        MVector x(d * x0, d * y0, d * z0);
        if (x.length() <= kEps)
            return MQuaternion::identity;
        x.normalize();

        // поперёк тела - ось X того пространства, в котором стоят позеры
        MVector ref(reference(0, 0), reference(0, 1), reference(0, 2));
        if (ref.length() <= kEps)
            return MQuaternion::identity;
        ref.normalize();

        MVector across(ref * x0, ref * y0, ref * z0);
        const double k = across * x;
        MVector z = across - x * k;
        if (z.length() <= kEps)
            return MQuaternion::identity;
        z.normalize();

        const MVector y = z ^ x;

        const double m[4][4] = {
            { x.x, x.y, x.z, 0.0 },
            { y.x, y.y, y.z, 0.0 },
            { z.x, z.y, z.z, 0.0 },
            { 0.0, 0.0, 0.0, 1.0 }
        };
        return MTransformationMatrix(MMatrix(m)).rotation();
    }

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

    // Откуда берётся нейтраль. "matrix" - из restMatrix выше, "posers" - из
    // initLoc позеров: тот несёт кадр, с которым кость построена, то есть
    // дефолтную позу, и для этого риг не надо в неё ставить. Инбитвин можно
    // делать в любой позе, а двинутый потом позер уводит нейтраль за собой.
    aRestMode = eAttr.create("restMode", "rmo", 0);
    eAttr.addField("matrix", 0);
    eAttr.addField("posers", 1);
    eAttr.setKeyable(false);
    addAttribute(aRestMode);

    // Мировые матрицы initLoc драйвера и родителя, и доля вдоль кости: косточка
    // твистовой цепочки стоит не в начале кости, поэтому позиция сдвигается от
    // initLoc кости к initLoc её ребёнка - 0 это сама кость, 1 её дальний конец.
    //
    // Обычные сторимые атрибуты: запекут позеры, связи оборвутся вместе с ними -
    // последние пришедшие значения останутся на ноде, и нейтраль не поедет.
    aRestChildMatrix = mAttr.create("restChildMatrix", "rcm");
    mAttr.setStorable(true);
    addAttribute(aRestChildMatrix);

    aRestChildEndMatrix = mAttr.create("restChildEndMatrix", "rcem");
    mAttr.setStorable(true);
    addAttribute(aRestChildEndMatrix);

    aRestChildPosition = nAttr.create("restChildPosition", "rcp", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setStorable(true);
    addAttribute(aRestChildPosition);

    aRestParentMatrix = mAttr.create("restParentMatrix", "rpm");
    mAttr.setStorable(true);
    addAttribute(aRestParentMatrix);

    aRestParentEndMatrix = mAttr.create("restParentEndMatrix", "rpem");
    mAttr.setStorable(true);
    addAttribute(aRestParentEndMatrix);

    aRestParentPosition = nAttr.create("restParentPosition", "rpp", MFnNumericData::kDouble, 0.0);
    nAttr.setMin(0.0);
    nAttr.setMax(1.0);
    nAttr.setStorable(true);
    addAttribute(aRestParentPosition);

    // Доворот рабочего кадра: в нём меряется изгиб и по его осям ставятся
    // коррективы. Ноль у обычной кости, где X идёт по кости. Нужен там, где оси
    // кости не те - у головы четвероногого кадр совпадает с мировым, X смотрит
    // в сторону, и пары лево-право среди косточек не оказывается вовсе.
    //
    // Читается в порядке XYZ, независимо от rotateOrder драйвера: в мировом
    // режиме тот вообще ни к чему не подключён.
    // Откуда берётся рабочий кадр. "bone" - оси самой кости, как было всегда.
    // "rest" - кадр строится из матриц нейтрали: X ведётся на конец кости, а
    // поперечное направление тела уходит в Z. Второй идёт от позеров и живой:
    // повернули позер - кадр повернулся, запечённого значения нет.
    //
    // Это для центральной кости. На зеркальной паре обе стороны строили бы Z к
    // мировому плюс X и перестали быть зеркалом друг другу - там путь через
    // frameRotate, он задан в кадре левой стороны и сопрягается знаками.
    aFrameMode = eAttr.create("frameMode", "frm", 0);
    eAttr.addField("bone", 0);
    eAttr.addField("rest", 1);
    eAttr.setKeyable(false);
    addAttribute(aFrameMode);

    // Пространство, из которого берётся поперечное направление тела - его ось
    // X. В нём живут позеры рига, поэтому поворот всего персонажа кадр
    // относительно тела не сдвигает. Единичная матрица - это мир.
    aFrameReference = mAttr.create("frameReferenceMatrix", "frref");
    mAttr.setStorable(true);
    addAttribute(aFrameReference);

    aFrameRotateX = uAttr.create("frameRotateX", "frrx", MFnUnitAttribute::kAngle, 0.0);
    aFrameRotateY = uAttr.create("frameRotateY", "frry", MFnUnitAttribute::kAngle, 0.0);
    aFrameRotateZ = uAttr.create("frameRotateZ", "frrz", MFnUnitAttribute::kAngle, 0.0);
    aFrameRotate  = nAttr.create("frameRotate", "frr", aFrameRotateX, aFrameRotateY, aFrameRotateZ);
    nAttr.setKeyable(false);
    nAttr.setStorable(true);
    addAttribute(aFrameRotate);

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

    // Какую косточку зеркалит эта: её углы, позиции и свинг читаются с обратным
    // знаком, -1 - свои. Индексы те же, что у joint.
    //
    // Отдельным массивом, а не ребёнком joint: элементы того компаунда maya
    // пишет в сцену одним плоским списком значений, и стоит компаунду получить
    // нового ребёнка, как все уже сохранённые сцены читаются вкривь - значения
    // съезжают в соседние поля. В joint больше ничего добавлять нельзя.
    aMirrorOf = nAttr.create("mirrorOf", "mof", MFnNumericData::kInt, -1);
    nAttr.setMin(-1);
    nAttr.setKeyable(false);
    nAttr.setArray(true);
    addAttribute(aMirrorOf);

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

    // что нода посчитала нейтралью: запекание переложит это в restMatrix и
    // вернёт restMode в 0, не повторяя математику
    aOutRestMatrix = mAttr.create("outRestMatrix", "orsm");
    mAttr.setWritable(false);
    mAttr.setStorable(false);
    addAttribute(aOutRestMatrix);

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
        aRestMode,
        aRestChildMatrix, aRestChildEndMatrix, aRestChildPosition,
        aRestParentMatrix, aRestParentEndMatrix, aRestParentPosition,
        aFrameMode, aFrameReference,
        aFrameRotate, aFrameRotateX, aFrameRotateY, aFrameRotateZ,
        aOffsetRotate, aOffsetRotateX, aOffsetRotateY, aOffsetRotateZ,
        aScale,
        aMirrorAxis, aMirrorAxisX, aMirrorAxisY, aMirrorAxisZ,
        aJoint, aAxis, aBind, aAngleMin, aAngleMax, aPosMin, aPosMax,
        aSwingMin, aSwingMax, aReverse, aMirrorOf
    };
    const MObject outputs[] = { aOutBendY, aOutBendZ, aOut, aOutRestMatrix };

    for (const MObject& in : inputs)
        for (const MObject& out : outputs)
            attributeAffects(in, out);

    return MS::kSuccess;
}

MStatus PkIbtwNode::compute(const MPlug& plug, MDataBlock& data)
{
    const MObject attr = plug.attribute();
    const bool wanted = (attr == aOutBendY || attr == aOutBendZ ||
                         attr == aOut || attr == aOutRestMatrix || attr == aOutTranslate ||
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

    // кадр нейтрали драйвера и конца его кости: ниже из них строится рабочий
    // кадр, если он берётся по кости
    MMatrix restChild;
    MMatrix restChildEnd;

    MQuaternion qDriver;
    if (data.inputValue(aDriverMode, &status).asShort() == 1)
    {
        const MMatrix child     = data.inputValue(aChildMatrix, &status).asMatrix();
        const MMatrix parentInv = data.inputValue(aParentInverseMatrix, &status).asMatrix();

        // Нейтраль - либо готовой матрицей, либо из позеров. Во втором случае
        // поза рига при создании ни при чём: initLoc стоит там, где кость
        // построена, и двинутый позер уводит нейтраль за собой.
        MMatrix rest;
        if (data.inputValue(aRestMode, &status).asShort() == 1)
        {
            restChildEnd = data.inputValue(aRestChildEndMatrix, &status).asMatrix();
            restChild    = restFrame(data.inputValue(aRestChildMatrix, &status).asMatrix(),
                                     restChildEnd,
                                     data.inputValue(aRestChildPosition, &status).asDouble());
            const MMatrix p = restFrame(data.inputValue(aRestParentMatrix, &status).asMatrix(),
                                        data.inputValue(aRestParentEndMatrix, &status).asMatrix(),
                                        data.inputValue(aRestParentPosition, &status).asDouble());
            rest = restChild * p.inverse();
        }
        else
        {
            rest = data.inputValue(aRestMatrix, &status).asMatrix();
        }

        // наружу - для запекания позеров: его дело переложить это в restMatrix
        // и вернуть restMode в 0
        MDataHandle hRest = data.outputValue(aOutRestMatrix, &status);
        if (status)
        {
            hRest.setMMatrix(rest);
            hRest.setClean();
        }

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

        // нейтраль локальному режиму не нужна, но спросить её могут
        MDataHandle hRest = data.outputValue(aOutRestMatrix, &status);
        if (status)
        {
            hRest.setMMatrix(MMatrix::identity);
            hRest.setClean();
        }
    }

    MQuaternion qOffset = MEulerRotation(ofr[0], ofr[1], ofr[2], ro).asQuaternion();
    // the offset comes from the left solver, so it is stated in the left frame
    qOffset = MQuaternion(det * sx * qOffset.x, det * sy * qOffset.y,
                          det * sz * qOffset.z, qOffset.w);

    // the offset moves the neutral pose: what is measured is how far the joint
    // is from the offset, not from its own zero
    const MQuaternion q = qOffset.inverse() * qDriver;

    // Доворот рабочего кадра. Пока он нулевой - а он нулевой у любой кости, у
    // которой X идёт по кости, - не считается ничего, кроме этой проверки.
    const double3& fr = data.inputValue(aFrameRotate, &status).asDouble3();
    bool framed = (std::fabs(fr[0]) > kEps ||
                   std::fabs(fr[1]) > kEps ||
                   std::fabs(fr[2]) > kEps);

    // Доворот задан в кадре левой стороны, и двум его применениям нужны разные
    // виды. Изгиб меряется в осях этой стороны, поэтому там кадр сопряжён
    // знаками зеркала, как и offsetRotate. А позиция косточки строится из
    // параметров, то есть сразу в кадре левой стороны, и знаки к ней
    // применяются ниже - там доворот идёт как задан, иначе зеркалится дважды и
    // косточку перебрасывает на другую сторону кости.
    MQuaternion qFrame;        // как задан
    MQuaternion qFrameSide;    // в осях этой стороны
    if (framed)
    {
        qFrame = MEulerRotation(fr[0], fr[1], fr[2], MEulerRotation::kXYZ).asQuaternion();
        qFrameSide = MQuaternion(det * sx * qFrame.x, det * sy * qFrame.y,
                                 det * sz * qFrame.z, qFrame.w);
    }

    // Кадр, построенный по самой кости - из тех же матриц нейтрали, что уже
    // пришли. Он от позеров и живой: повернули позер, и кадр с ним. Строится в
    // осях своей стороны, поэтому знаками не сопрягается; ручной доворот
    // применяется поверх него.
    if (data.inputValue(aFrameMode, &status).asShort() == 1)
    {
        const MQuaternion qAim = aimFrame(restChild, restChildEnd,
                                          data.inputValue(aFrameReference, &status).asMatrix());
        qFrame     = framed ? (qFrame * qAim) : qAim;
        qFrameSide = framed ? (qFrameSide * qAim) : qAim;
        framed     = true;
    }

    // Изгиб меряется в рабочем кадре, а `q` остаётся в кадре кости: по нему
    // считается отставание qLag, то есть локальный поворот самой косточки.
    const MQuaternion qBend = framed ? (qFrameSide * q * qFrameSide.inverse()) : q;

    // the bend, with the twist around the bone taken out
    MVector swAxis(0.0, 0.0, 1.0);
    double  swAngle = 0.0;
    swingAboutX(qBend).getAxisAngle(swAxis, swAngle);

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
    //
    // `sx` belongs here as well: the tip of the bone sits at sx along X, so on a
    // side whose X runs backwards the same rotation carries it the other way.
    // It is the same thing the axis of a rotation does under a reflection - the
    // map between the two frames is one whenever the signs multiply to -1, and
    // then an axis keeps its angle but gains that sign. Without it a mirrored
    // pose came out with the bend negated on the mirrored side, so the
    // corrective of the opposite direction fired: the bulge appeared on the
    // wrong side of the bone.
    const double bendY = swAngle * swAxis.z * sy * sx;
    const double bendZ = -swAngle * swAxis.y * sz * sx;

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

    // --- 1. параметры всех косточек ------------------------------------------
    // Читаются до счёта: косточка, которая зеркалит другую, должна в неё
    // заглянуть, а прыгать хэндлом по массиву посреди прохода незачем.
    std::vector<Param>& params = mParams;
    params.clear();
    params.reserve(hJoints.elementCount());

    const unsigned int count = hJoints.elementCount();
    for (unsigned int i = 0; i < count; ++i)
    {
        if (!hJoints.jumpToArrayElement(i))
            continue;

        MDataHandle hJoint = hJoints.inputValue(&status);
        if (!status) continue;

        Param pr;
        pr.index    = hJoints.elementIndex();
        pr.axis     = hJoint.child(aAxis).asShort();
        pr.bind     = hJoint.child(aBind).asDouble();
        pr.angleMin = hJoint.child(aAngleMin).asAngle().asRadians();
        pr.angleMax = hJoint.child(aAngleMax).asAngle().asRadians();
        pr.posMin   = hJoint.child(aPosMin).asDouble();
        pr.posMax   = hJoint.child(aPosMax).asDouble();
        pr.swingMin = hJoint.child(aSwingMin).asAngle().asRadians();
        pr.swingMax = hJoint.child(aSwingMax).asAngle().asRadians();
        pr.reverse  = hJoint.child(aReverse).asBool();
        pr.mirrorOf = -1;

        params.push_back(pr);
    }

    // зеркала - своим массивом, по тем же индексам
    MArrayDataHandle hMirror = data.inputArrayValue(aMirrorOf, &status);
    if (status)
    {
        for (unsigned int i = 0; i < hMirror.elementCount(); ++i)
        {
            if (!hMirror.jumpToArrayElement(i))
                continue;

            const unsigned int index = hMirror.elementIndex();
            const int value = hMirror.inputValue(&status).asInt();
            if (!status) continue;

            for (size_t k = 0; k < params.size(); ++k)
            {
                if (params[k].index == index)
                {
                    params[k].mirrorOf = value;
                    break;
                }
            }
        }
    }

    // --- 2. и сам счёт -------------------------------------------------------
    for (size_t n = 0; n < params.size(); ++n)
    {
        const Param& own = params[n];

        // Зеркальная косточка: углы, позиции и свинг берутся у ведущей с
        // обратным знаком. Это и есть отражение в плоскости, в которой лежат
        // кость и вторая ось: срабатывает она на изгиб в другую сторону и
        // выезжает в другую сторону, а вдоль кости уходит так же -
        // (-r)*sin(-swing) это те же r*sin(swing). `bind` и `reverse` приходят
        // оттуда же как есть, ось остаётся своя.
        const Param* src = &own;
        double flip = 1.0;

        if (own.mirrorOf >= 0 && own.mirrorOf != static_cast<int>(own.index))
        {
            for (size_t k = 0; k < params.size(); ++k)
            {
                if (static_cast<int>(params[k].index) == own.mirrorOf)
                {
                    src = &params[k];
                    flip = -1.0;
                    break;
                }
            }
        }

        const short  axis     = own.axis;
        const double bind     = src->bind;
        const bool   reverse  = src->reverse;
        const double angleMin = src->angleMin * flip;
        const double angleMax = src->angleMax * flip;
        const double posMin   = src->posMin   * flip;
        const double posMax   = src->posMax   * flip;
        const double swingMin = src->swingMin * flip;
        const double swingMax = src->swingMax * flip;

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

        // косточка посчитана в рабочем кадре - возвращаем её в кадр кости, под
        // которой она висит
        if (framed)
            p = p.rotateBy(qFrame);

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

        MDataHandle hOut = builder.addElement(own.index, &status);
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
