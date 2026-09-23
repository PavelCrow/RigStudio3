# -*- coding: utf-8 -*-
"""Цепочка с динамикой на pk_chainDynamics - без модуля и без nucleus.

    build("tail", count=6, length=10)   - собрать цепочку с нуля
    build("tail", count=3, joints=10)   - контролов меньше, чем костей
    fromSelection("tail")               - на выделенных трансформах, по порядку
    demo("tail")                        - ключи на корень, чтобы было на что смотреть
    editRamp("tail")                    - окно с кривой жёсткости вдоль цепочки
    upgrade("tail")                     - цепочку прошлой версии на новую ноду,
                                          контролы и джоинты те же
    delete("tail")                      - убрать всё, что собрал build/fromSelection

Контролы - цель, анимированная поза. Нода симулирует точки и отдаёт мировые
матрицы, они идут в offsetParentMatrix отдельных джоинтов - на них и
скинить. Джоинты не в иерархии и не наследуют трансформ: матрица у каждого
уже мировая.

Костей может быть больше, чем контролов: joints=10 при трёх контролах. Тогда
нода протягивает через контролы кривую, режет её на равные части и считает
динамику уже на них - каждая кость отстаёт сама по себе.

Настройки динамики выведены на первый контрол (или на корень выделения).
Кривая жёсткости, lengthKeep и substeps - на самой ноде: это настройка
цепочки, а не то, что анимируют.
"""
import math
import os

import maya.cmds as cmds


PLUGIN = "pk_dynamics"

AXES = {"x": (1, 0, 0), "y": (0, 1, 0), "z": (0, 0, 1),
        "-x": (-1, 0, 0), "-y": (0, -1, 0), "-z": (0, 0, -1)}

# атрибут на контроле -> атрибут ноды, значение по умолчанию, min, max
SETTINGS = [
    ("dynamic",      "enable",       1,   0,    1),
    ("dynamicWeight", "weight",      1.0, 0.0,  1.0),
    ("startFrame",   "startFrame",   1.0, None, None),
    ("stiffness",    "stiffness",    0.3, 0.0,  1.0),
    ("damping",      "damping",      0.15, 0.0, 1.0),
    ("gravity",      "gravity",      0.0, None, None),
    ("followSpace",  "followSpace",  0.0, 0.0,  1.0),
]


def loadPlugin():
    if PLUGIN in (cmds.pluginInfo(q=1, listPlugins=1) or []):
        return True

    version = cmds.about(v=True).split(" ")[0]
    path = os.path.normpath(os.path.join(
        os.path.dirname(__file__), "..", "..", "plug-ins", version, PLUGIN + ".mll"))

    if not os.path.isfile(path):
        cmds.warning("%s.mll is not built for Maya %s - %s" % (PLUGIN, version, path))
        return False

    cmds.loadPlugin(path)
    return PLUGIN in (cmds.pluginInfo(q=1, listPlugins=1) or [])


def _names(name):
    return {
        "top":    name + "_dyn_grp",
        "ctrls":  name + "_ctrls",
        "joints": name + "_dynJoints",
        "node":   name + "_chainDynamics",
    }


def _addSettings(host, node):
    if not cmds.attributeQuery("dynamicSettings", node=host, exists=True):
        cmds.addAttr(host, ln="dynamicSettings", at="enum", en="Dynamic:", k=0)
        cmds.setAttr(host + ".dynamicSettings", channelBox=True)

    for attr, nodeAttr, dv, mn, mx in SETTINGS:
        if not cmds.attributeQuery(attr, node=host, exists=True):
            kw = {"ln": attr, "k": True, "dv": dv}
            kw["at"] = "bool" if attr == "dynamic" else "double"
            if mn is not None and attr != "dynamic":
                kw["min"] = mn
            if mx is not None and attr != "dynamic":
                kw["max"] = mx
            cmds.addAttr(host, **kw)
        cmds.connectAttr(host + "." + attr, node + "." + nodeAttr, f=True)


def _makeNode(name, goals, space):
    node = cmds.createNode("pk_chainDynamics", n=_names(name)["node"])
    cmds.connectAttr("time1.outTime", node + ".time")
    if space:
        cmds.connectAttr(space + ".worldMatrix[0]", node + ".spaceMatrix")

    for i, g in enumerate(goals):
        cmds.connectAttr(g + ".worldMatrix[0]", "%s.goalMatrix[%d]" % (node, i))
    return node


def _rig(name, goals, host, space, joints=0):
    """Нода + джоинты на готовой цепочке целей. joints - сколько костей, если
    их должно быть больше, чем контролов."""
    n = _names(name)
    node = _makeNode(name, goals, space)

    count = len(goals)
    if joints and joints > count:
        cmds.setAttr(node + ".outputCount", joints)
        count = joints

    if not cmds.objExists(n["joints"]):
        cmds.createNode("transform", n=n["joints"])
        if cmds.objExists(n["top"]):
            cmds.parent(n["joints"], n["top"])
    cmds.setAttr(n["joints"] + ".inheritsTransform", 0)

    joints = []
    for i in range(count):
        cmds.select(cl=True)
        j = cmds.joint(n="%s_dyn_%d_jnt" % (name, i + 1))
        cmds.parent(j, n["joints"])
        for a in ("t", "r", "jo"):
            cmds.setAttr(j + "." + a, 0, 0, 0)
        cmds.connectAttr("%s.outMatrix[%d]" % (node, i), j + ".offsetParentMatrix")
        joints.append(j)

    _addSettings(host, node)
    cmds.select(host)
    return node, joints


def build(name="chain", count=6, length=10.0, axis="x", radius=None, joints=0):
    """Цепочка FK-контролов с нуля, от начала координат вдоль axis. joints -
    число костей, если их нужно больше, чем контролов."""
    if not loadPlugin():
        return None

    n = _names(name)
    if cmds.objExists(n["top"]):
        cmds.error("%s already exists - delete(%r) first" % (n["top"], name))

    count = max(2, int(count))
    step = float(length) / (count - 1)
    d = AXES[axis]
    if radius is None:
        radius = max(step * 0.4, 0.01)

    top = cmds.createNode("transform", n=n["top"])
    ctrlsGrp = cmds.createNode("transform", n=n["ctrls"], p=top)

    ctrls = []
    parent = ctrlsGrp
    for i in range(count):
        grp = cmds.createNode("transform", n="%s_%d_ctrl_grp" % (name, i + 1), p=parent)
        if i:
            cmds.setAttr(grp + ".t", d[0] * step, d[1] * step, d[2] * step)
        ctrl = cmds.circle(n="%s_%d_ctrl" % (name, i + 1), nr=d, r=radius, ch=False)[0]
        cmds.parent(ctrl, grp, r=True)
        cmds.setAttr(cmds.listRelatives(ctrl, s=True)[0] + ".overrideEnabled", 1)
        cmds.setAttr(cmds.listRelatives(ctrl, s=True)[0] + ".overrideColor", 17 if i else 13)
        ctrls.append(ctrl)
        parent = ctrl

    # пространство - группа контролов: двигать её = нести персонажа целиком
    node, bones = _rig(name, ctrls, ctrls[0], ctrlsGrp, joints)
    print("pk_chainDynamics: %s, %d controls, %d joints" % (node, count, len(bones)))
    return {"node": node, "ctrls": ctrls, "joints": bones}


def _isControl(obj):
    """Контрол - трансформ с кривой в шейпах. Джоинты, локаторы и пустые
    группы между контролами так отсеиваются."""
    return bool(cmds.listRelatives(obj, s=True, type="nurbsCurve"))


def chainFromRoot(root, limit=100):
    """Цепочка контролов вниз по иерархии от корня. Промежуточные группы
    (ctrl -> grp -> ctrl) проходятся насквозь, ищется ближайший контрол."""
    chain = [root]
    current = root

    for _ in range(limit):
        found = None
        level = cmds.listRelatives(current, c=True, type="transform", f=True) or []
        while level and not found:
            nxt = []
            for obj in level:
                if _isControl(obj):
                    found = obj if found is None else found
                else:
                    nxt += cmds.listRelatives(obj, c=True, type="transform", f=True) or []
            level = [] if found else nxt

        if not found:
            break

        # ветвление - дальше идти некуда, честнее остановиться и сказать
        siblings = [o for o in (cmds.listRelatives(cmds.listRelatives(found, p=True, f=True)[0],
                                                   c=True, type="transform", f=True) or [])
                    if _isControl(o)]
        if len(siblings) > 1:
            cmds.warning("%s branches into %d controls - taking the first"
                         % (current.split("|")[-1], len(siblings)))

        chain.append(found.split("|")[-1])
        current = found

    return chain


def fromSelection(name="chain", space=None, joints=0, walk=None):
    """Солвер и кости по уже готовым контролам. Сами контролы не меняются,
    динамика уходит на новые джоинты.

    Выделить можно либо все контролы по порядку, корень первым, либо только
    корень - тогда цепочка соберётся вниз по иерархии (walk). space - от чего
    отсчитывается followSpace, по умолчанию родитель корня. joints - сколько
    сделать костей, если их нужно больше, чем контролов."""
    if not loadPlugin():
        return None

    goals = cmds.ls(sl=True, type="transform", long=False) or []
    if walk or (walk is None and len(goals) == 1):
        goals = chainFromRoot(goals[0]) if goals else []
    if len(goals) < 2:
        cmds.error("select the controls in order, or just the root of the chain")

    n = _names(name)
    if cmds.objExists(n["node"]):
        cmds.error("%s already exists - delete(%r) first" % (n["node"], name))

    if space is None:
        par = cmds.listRelatives(goals[0], p=True)
        space = par[0] if par else None

    node, bones = _rig(name, goals, goals[0], space, joints)
    print("pk_chainDynamics: %s, %d controls, %d joints" % (node, len(goals), len(bones)))
    return {"node": node, "ctrls": goals, "joints": bones}


def demo(name="chain", start=1, end=120):
    """Качает корень туда-сюда и останавливает - смотреть, как хвост догоняет."""
    root = "%s_1_ctrl" % name
    if not cmds.objExists(root):
        cmds.error("%s not found - demo works on a chain made by build()" % root)

    cmds.playbackOptions(min=start, max=end)
    cmds.cutKey(root, at=("ty", "rz"), cl=True)
    keys = [(start, 0, 0), (start + 15, 5, 40), (start + 30, -5, -40),
            (start + 45, 5, 40), (start + 60, 0, 0)]
    for f, ty, rz in keys:
        cmds.setKeyframe(root, at="ty", t=f, v=ty)
        cmds.setKeyframe(root, at="rz", t=f, v=rz)
    cmds.setAttr(root + ".startFrame", start)
    cmds.currentTime(start)


def editRamp(name="chain"):
    """Кривая жёсткости вдоль цепочки: слева корень, справа кончик, по
    вертикали - какая доля stiffness достаётся точке."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    win = name + "_stiffnessRamp_win"
    if cmds.window(win, exists=True):
        cmds.deleteUI(win)

    cmds.window(win, t="%s - stiffness along the chain" % name, wh=(420, 230))
    form = cmds.formLayout()
    grad = cmds.gradientControl(at=node + ".stiffnessRamp", h=160)
    cmds.formLayout(form, e=True,
                    af=[(grad, "top", 6), (grad, "left", 6), (grad, "right", 6), (grad, "bottom", 6)])
    cmds.showWindow(win)


# что было на контроле в первой версии, а теперь живёт на ноде или ушло
_OLD_HOST_ATTRS = ("stiffnessTip", "lengthKeep", "substeps")


def _inputs(plug):
    """{индекс: источник} входящих коннектов multi-атрибута."""
    node, attr = plug.split(".", 1)
    out = {}
    for i in cmds.getAttr(plug, mi=True) or []:
        src = cmds.listConnections("%s.%s[%d]" % (node, attr, i), s=True, d=False) or []
        if src:
            out[i] = src[0]
    return out


def _outputs(plug):
    """{индекс: приёмник} исходящих коннектов multi-атрибута."""
    node, attr = plug.split(".", 1)
    out = {}
    for i in cmds.getAttr(plug, mi=True) or []:
        dst = cmds.listConnections("%s.%s[%d]" % (node, attr, i), s=False, d=True) or []
        if dst:
            out[i] = dst[0]
    return out


def _oldToNew(stiffness, substeps):
    """Та же пружина в новой шкале. Старая нода притягивала на
    1 - (1 - s)^(1/N) за подшаг, и это превращалось в скорость, - по факту
    пружина K = pull * N^2 на кадр в квадрате. Новая: K = 20 * s^2."""
    s = min(1.0, max(0.0, stiffness))
    n = max(1, int(round(substeps)))
    pull = 1.0 - (1.0 - s) ** (1.0 / n)
    return min(1.0, (pull * n * n / 20.0) ** 0.5)


def _oldDampToRatio(damping, stiffness):
    """Старое затухание - доля скорости, теряемая за кадр. Новое - отношение
    к частоте пружины: за кадр остаётся e^(-2 * ratio * w)."""
    d = min(0.999, max(0.0, damping))
    w = (20.0 ** 0.5) * max(1e-4, stiffness)
    return min(1.0, -math.log(1.0 - d) / (2.0 * w))


def upgrade(name="chain", keepLook=True):
    """Цепочку, собранную прошлой версией, - на новую ноду. Контролы,
    джоинты и пространство остаются теми же, коннекты восстанавливаются,
    атрибуты на контроле приводятся к нынешнему набору.

    keepLook - пересчитать stiffness и stiffnessTip в новую шкалу так, чтобы
    цепочка вела себя как раньше при тех substeps, что стояли. Иначе
    значения переносятся как есть, а кривая по умолчанию."""
    if not loadPlugin():
        return None

    n = _names(name)
    node = n["node"]

    # --- что было ------------------------------------------------------------
    goals, joints, space = {}, {}, None
    if cmds.objExists(node):
        goals = _inputs(node + ".goalMatrix")
        joints = _outputs(node + ".outMatrix")
        src = cmds.listConnections(node + ".spaceMatrix", s=True, d=False) or []
        space = src[0] if src else None

    # нода могла потерять коннекты (плагин выгружали со сценой) - тогда по
    # именам, какие даёт build
    if not goals:
        i = 1
        while cmds.objExists("%s_%d_ctrl" % (name, i)):
            goals[i - 1] = "%s_%d_ctrl" % (name, i)
            i += 1
    if not joints:
        i = 0
        while cmds.objExists("%s_dyn_%d_jnt" % (name, i + 1)):
            joints[i] = "%s_dyn_%d_jnt" % (name, i + 1)
            i += 1
    if space is None and cmds.objExists(n["ctrls"]):
        space = n["ctrls"]

    order = sorted(goals)
    goals = [goals[i] for i in order]
    if len(goals) < 2:
        cmds.error("%s: no chain found - nothing to upgrade" % name)
    joints = [joints[i] for i in sorted(joints)]
    if not joints:
        cmds.error("%s: no joints found" % name)
    host = goals[0]

    def value(attr, default):
        for obj in (host, node):
            if cmds.objExists(obj) and cmds.attributeQuery(attr, node=obj, exists=True):
                try:
                    return cmds.getAttr(obj + "." + attr)
                except RuntimeError:
                    pass
        return default

    outputCount = value("outputCount", 0)
    stiffness = value("stiffness", 0.3)
    damping   = value("damping", 0.1)
    tip       = value("stiffnessTip", None)
    lengthKeep = value("lengthKeep", 1.0)
    substeps  = value("substeps", 2)

    # --- замена ---------------------------------------------------------------
    if cmds.objExists(node):
        cmds.delete(node)
    for attr in _OLD_HOST_ATTRS:
        if cmds.attributeQuery(attr, node=host, exists=True):
            cmds.deleteAttr(host + "." + attr)

    node = _makeNode(name, goals, space)
    for i, j in enumerate(joints):
        cmds.connectAttr("%s.outMatrix[%d]" % (node, i), j + ".offsetParentMatrix", f=True)
    _addSettings(host, node)

    cmds.setAttr(node + ".outputCount", outputCount)
    cmds.setAttr(node + ".lengthKeep", lengthKeep)
    cmds.setAttr(node + ".substeps", max(1, int(round(substeps))))

    # --- значения ------------------------------------------------------------
    # stiffnessTip на контроле - признак первой версии: только у неё старая
    # шкала, уже обновлённую цепочку пересчитывать нельзя
    ramp = node + ".stiffnessRamp"
    if keepLook and tip is not None:
        root = _oldToNew(stiffness, substeps)
        cmds.setAttr(host + ".stiffness", root)
        cmds.setAttr(host + ".damping", _oldDampToRatio(damping, root))

        tipNew = _oldToNew(tip, substeps)
        ratio = min(1.0, tipNew / root) if root > 1e-6 else 1.0
        # старая нода вела жёсткость линейно - так и ставим
        for i in cmds.getAttr(ramp, mi=True) or []:
            cmds.removeMultiInstance("%s[%d]" % (ramp, i), b=True)
        for i, (pos, val) in enumerate(((0.0, 1.0), (1.0, ratio))):
            cmds.setAttr("%s[%d].stiffnessRamp_Position" % (ramp, i), pos)
            cmds.setAttr("%s[%d].stiffnessRamp_FloatValue" % (ramp, i), val)
            cmds.setAttr("%s[%d].stiffnessRamp_Interp" % (ramp, i), 1)

    print("pk_chainDynamics: %s upgraded, %d points, stiffness %.3f -> %.3f"
          % (name, len(goals), stiffness, cmds.getAttr(host + ".stiffness")))
    cmds.select(host)
    return {"node": node, "ctrls": goals, "joints": joints}


def delete(name="chain"):
    n = _names(name)
    for k in ("node", "joints", "top"):
        if cmds.objExists(n[k]):
            cmds.delete(n[k])
