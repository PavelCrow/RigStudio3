# Мышечные кости модуля shoulder не крутятся, когда мышца схлопывается
# (2026-10-12).
#
# Кость мышцы целится от начала к прикреплению. Если прикрепление проходит
# вплотную к началу (у медведя при руке вперёд pecUpper сжималась до 14%
# длины покоя), направление между ними разворачивается за пару кадров - кость
# перекручивалась на 30 градусов за кадр (bear_rig_new2.ma, кадр 157).
#
# Цель прицела: брюшко + (I - O) + k * (I0 - O0): к волокнам добавляется
# направление покоя. k = fiberHold * (1 - smoothstep(длина / покой / fiberHoldBelow)):
# пока мышца длиннее fiberHoldBelow от покоя, k = 0 и кость смотрит точно
# вдоль волокон, как раньше; чем короче, тем сильнее держится направление
# покоя. Подобрано на анимации медведя: fiberHold 1, fiberHoldBelow 0.7 -
# 1-6 градусов за кадр вместо 30 (обычные мышцы там же - до 8).
#
# add(prefix) строит сеть и в генераторе (prefix = ""), и в собранном модуле.
import math
import maya.cmds as cmds
import maya.api.OpenMaya as om

MUSCLES = ("pecUpper", "pecLower", "lat", "trap")
SETTINGS = (("fiberHold", 1.0, 0.0, None), ("fiberHoldBelow", 0.7, 0.01, 1.0))
_DL_TYPES = {"multDoubleLinear": "multDL", "addDoubleLinear": "addDL"}


def _node_type(t):
    """Тип ноды для этой Maya (в 2026 часть типов переименована, см. poses.py)."""
    available = set(cmds.allNodeTypes() or [])
    if t in available:
        return t
    for candidate in (_DL_TYPES.get(t), t + "DL"):
        if candidate and candidate in available:
            return candidate
    raise RuntimeError("Node type %s is not available in this Maya" % t)


def is_added(prefix):
    return cmds.objExists(prefix + "pecUpper_fiberTarget_plusMinusAverage")


def is_roll_fixed(prefix):
    return cmds.objExists(prefix + "pecUpper_restFrame_aimMatrix")


_POSE_CHANNELS = {"forward": ("ry", -1), "back": ("ry", 1), "up": ("rz", 1)}


def _rest_pose():
    """Отключить анимационные кривые и поставить значения по умолчанию; вернуть, что вернуть."""
    links, values = [], []
    for crv in cmds.ls(type="animCurve") or []:
        for dst in cmds.listConnections(crv + ".output", s=0, d=1, p=1) or []:
            links.append((crv + ".output", dst))
    for src, dst in links:
        values.append((dst, cmds.getAttr(dst)))
        cmds.disconnectAttr(src, dst)
        node, attr = dst.split(".", 1)
        try:
            cmds.setAttr(dst, cmds.attributeQuery(attr.split("[")[0], n=node, listDefault=1)[0])
        except Exception:
            pass
    return links


def _restore(links):
    for src, dst in links:
        cmds.connectAttr(src, dst, f=1)


def _pose_frames(prefix, keys):
    """Кадр кости без поправки (M, в кадре груди) в крайних положениях ключицы."""
    ctrl = cmds.listConnections(prefix + "clav_multMatrix.matrixIn[0]", s=1, d=0)[0]
    saved = {a: cmds.getAttr(ctrl + "." + a) for a in ("rx", "ry", "rz")}
    out = {}
    for j, pose in keys:
        for a in saved:
            cmds.setAttr(ctrl + "." + a, 0)
        ch, sign = _POSE_CHANNELS[pose]
        cmds.setAttr(ctrl + "." + ch, sign * cmds.getAttr(prefix + "root_outJoint.%sAngle" % pose))
        out[(j, pose)] = om.MMatrix(cmds.getAttr(prefix + j + "_poseSpace.offsetParentMatrix"))
    for a, v in saved.items():
        cmds.setAttr(ctrl + "." + a, v)
    return out


def add_roll_fix(prefix=""):
    """См. _add_roll_fix. Настроенные локаторы поз пересчитываются: смещение у
    них в осях кости, а оси после правки другие (кость больше не крутится) -
    без пересчёта та же поправка легла бы иначе. Пересчёт точный в каждом
    крайнем положении ключицы (рука в покое).
    """
    keys = []
    if prefix.startswith("l_") or not cmds.objExists("l" + prefix[1:] + "mainPoser"):
        for m in MUSCLES:
            for pose in _POSE_CHANNELS:
                loc = "%s%s_%s_poseLoc" % (prefix, m, pose)
                if cmds.objExists(loc) and any(abs(x) > 1e-9 for x in cmds.getAttr(loc + ".t")[0] + cmds.getAttr(loc + ".r")[0]):
                    keys.append((m, pose))
    if not keys:
        _add_roll_fix(prefix)
        return []
    links = _rest_pose()
    try:
        old = _pose_frames(prefix, keys)
        _add_roll_fix(prefix)
        new = _pose_frames(prefix, keys)
        for m, pose in keys:
            loc = "%s%s_%s_poseLoc" % (prefix, m, pose)
            tm = om.MTransformationMatrix()
            tm.setTranslation(om.MVector(*cmds.getAttr(loc + ".t")[0]), om.MSpace.kTransform)
            tm.setRotation(om.MEulerRotation(*[math.radians(a) for a in cmds.getAttr(loc + ".r")[0]]))
            o = om.MTransformationMatrix(tm.asMatrix() * old[(m, pose)] * new[(m, pose)].inverse())
            cmds.setAttr(loc + ".t", *o.translation(om.MSpace.kTransform))
            cmds.setAttr(loc + ".r", *[math.degrees(a) for a in o.rotation()])
    finally:
        _restore(links)
    return keys


def _add_roll_fix(prefix=""):
    """Кость мышцы - поворот от её положения покоя, а не доворот к фиксированной оси.

    Было: aimMatrix с secondary Align на постоянный вектор груди (pec - вперёд,
    lat - назад, trap - вверх). При смене направления волокон кость крутилась
    вокруг себя, чтобы держать Y на этом векторе: у медведя при руке вперёд на
    100 градусов - почти 48 (и 52 за кадр, когда волокна ложились на вектор).
    Стало: вход прицела - кадр покоя мышцы (тот же Align, но статично, на
    точках покоя) в текущем брюшке, secondary None - кратчайший поворот X от
    покоя к волокнам, без кручения. В покое кость та же самая - скин не задет.
    """
    nodes_set = prefix + "nodesSet" if prefix and cmds.objExists(prefix + "nodesSet") else None
    mp = prefix + "mainPoser"

    def node(t, name):
        t = _node_type(t)
        n = cmds.createNode(t, n=prefix + name)
        assert n == prefix + name, (n, prefix + name)
        assert cmds.nodeType(n) == t, (n, cmds.nodeType(n), t)
        if nodes_set:
            cmds.sets(n, e=1, forceElement=nodes_set)
        return n

    def c(a, b):
        cmds.connectAttr(a, b, f=1)

    for m in MUSCLES:
        p = prefix + m
        aim = p + "_aimMatrix"
        O0 = cmds.listConnections(p + "Rest_distanceBetween.point1", s=1, d=0, p=1)[0]
        I0 = cmds.listConnections(p + "Rest_distanceBetween.point2", s=1, d=0, p=1)[0]
        belly = node("blendColors", m + "_restFrameBelly_blendColors")
        c(I0, belly + ".color1")
        c(O0, belly + ".color2")
        c(mp + ".%sBelly" % m, belly + ".blender")
        origin = node("composeMatrix", m + "_restFrameOrigin_composeMatrix")
        c(belly + ".output", origin + ".inputTranslate")
        target = node("composeMatrix", m + "_restFrameTarget_composeMatrix")
        c(I0, target + ".inputTranslate")
        rest = node("aimMatrix", m + "_restFrame_aimMatrix")
        c(origin + ".outputMatrix", rest + ".inputMatrix")
        c(target + ".outputMatrix", rest + ".primaryTargetMatrix")
        cmds.setAttr(rest + ".primaryInputAxis", 1, 0, 0)
        cmds.setAttr(rest + ".secondaryInputAxis", *cmds.getAttr(aim + ".secondaryInputAxis")[0])
        cmds.setAttr(rest + ".secondaryMode", 2)
        cmds.setAttr(rest + ".secondaryTargetVector", *cmds.getAttr(aim + ".secondaryTargetVector")[0])
        pick = node("pickMatrix", m + "_restFrame_pickMatrix")
        c(rest + ".outputMatrix", pick + ".inputMatrix")
        cmds.setAttr(pick + ".useTranslate", 0)
        inp = node("multMatrix", m + "_restFrame_multMatrix")
        c(pick + ".outputMatrix", inp + ".matrixIn[0]")
        c(p + "_origin_composeMatrix.outputMatrix", inp + ".matrixIn[1]")
        c(inp + ".matrixSum", aim + ".inputMatrix")
        cmds.setAttr(aim + ".secondaryMode", 0)


def add(prefix=""):
    nodes_set = prefix + "nodesSet" if prefix and cmds.objExists(prefix + "nodesSet") else None
    mp = prefix + "mainPoser"

    def node(t, name):
        t = _node_type(t)
        n = cmds.createNode(t, n=prefix + name)
        assert n == prefix + name, (n, prefix + name)
        assert cmds.nodeType(n) == t, (n, cmds.nodeType(n), t)
        if nodes_set:
            cmds.sets(n, e=1, forceElement=nodes_set)
        return n

    def c(a, b):
        cmds.connectAttr(a, b, f=1)

    for name, dv, mn, mx in SETTINGS:
        if not cmds.objExists(mp + "." + name):
            kw = {"min": mn}
            if mx is not None:
                kw["max"] = mx
            cmds.addAttr(mp, ln=name, at="double", dv=dv, **kw)
            cmds.setAttr(mp + "." + name, e=1, k=1)

    for m in MUSCLES:
        p = prefix + m
        # начало и прикрепление - те же точки, что меряют длину мышцы
        O = cmds.listConnections(p + "_distanceBetween.point1", s=1, d=0, p=1)[0]
        I = cmds.listConnections(p + "_distanceBetween.point2", s=1, d=0, p=1)[0]
        O0 = cmds.listConnections(p + "Rest_distanceBetween.point1", s=1, d=0, p=1)[0]
        I0 = cmds.listConnections(p + "Rest_distanceBetween.point2", s=1, d=0, p=1)[0]

        raw = node("plusMinusAverage", m + "_fiber_plusMinusAverage")
        cmds.setAttr(raw + ".operation", 2)
        c(I, raw + ".input3D[0]")
        c(O, raw + ".input3D[1]")
        rest = node("plusMinusAverage", m + "_fiberRest_plusMinusAverage")
        cmds.setAttr(rest + ".operation", 2)
        c(I0, rest + ".input3D[0]")
        c(O0, rest + ".input3D[1]")

        # k = fiberHold * (1 - smoothstep(clamp(длина/покой / fiberHoldBelow)))
        t = node("setRange", m + "_fiberHold_setRange")
        c(p + "_stretch_multiplyDivide.outputX", t + ".valueX")
        c(mp + ".fiberHoldBelow", t + ".oldMaxX")
        cmds.setAttr(t + ".maxX", 1)
        t2 = node("multDoubleLinear", m + "_fiberHoldSq_multDoubleLinear")
        c(t + ".outValueX", t2 + ".input1")
        c(t + ".outValueX", t2 + ".input2")
        k3 = node("setRange", m + "_fiberHoldK_setRange")             # 3 - 2t
        c(t + ".outValueX", k3 + ".valueX")
        cmds.setAttr(k3 + ".oldMaxX", 1)
        cmds.setAttr(k3 + ".minX", 3)
        cmds.setAttr(k3 + ".maxX", 1)
        s = node("multDoubleLinear", m + "_fiberHoldSmooth_multDoubleLinear")
        c(t2 + ".output", s + ".input1")
        c(k3 + ".outValueX", s + ".input2")
        inv = node("reverse", m + "_fiberHold_reverse")
        c(s + ".output", inv + ".inputX")
        k = node("multDoubleLinear", m + "_fiberHoldK_multDoubleLinear")
        c(inv + ".outputX", k + ".input1")
        c(mp + ".fiberHold", k + ".input2")

        kr = node("multiplyDivide", m + "_fiberHoldRest_multiplyDivide")
        c(rest + ".output3D", kr + ".input1")
        for ax in "XYZ":
            c(k + ".output", kr + ".input2" + ax)
        target = node("plusMinusAverage", m + "_fiberTarget_plusMinusAverage")
        c(p + "_belly_blendColors.output", target + ".input3D[0]")
        c(raw + ".output3D", target + ".input3D[1]")
        c(kr + ".output", target + ".input3D[2]")
        c(target + ".output3D", p + "_target_composeMatrix.inputTranslate")
