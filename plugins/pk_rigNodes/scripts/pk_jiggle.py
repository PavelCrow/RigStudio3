# -*- coding: utf-8 -*-
"""Тряска одной косточки на pk_jiggle - живот, щёки, челюсть.

    fromSelection()                 - на выделенных костях, настройки на них же
    fromSelection(host="body_ctrl") - настройки собрать на одном контроле
    buildControl()                  - кубик-контрол с костью и тряской, с нуля
    collider("belly_jnt", "plane")  - коллайдер тряске: plane, sphere, capsule, box
    nodeFrom(obj)                   - тряска выделенного: кость, водитель, контрол
    build("belly_jnt")              - на одной кости
    delete("belly_jnt")             - убрать, кость вернуть как была

Кость остаётся там, где была в скелете: её мировое место считает нода и отдаёт
в offsetParentMatrix, а локальный трансформ у кости обнуляется и остаётся
аниматору. Где кость должна быть без тряски - помнит водитель: пустой трансформ
рядом с ней, под тем же родителем. Он и едет по ригу.

Настройки живут на контроле (или на самой кости, если контрол не указан):
jiggle, jiggleWeight, jiggleStiffness, jiggleDamping, jiggleGravity,
jiggleTranslate, jiggleRotate. Остальное - axisScale, limit, substeps - на самой
ноде: это настройка, а не то, что анимируют.
"""
import os

import maya.cmds as cmds

# коллайдеры у тряски и у цепочки одни и те же - и в ноде, и в сцене
import pk_chain_dyn as _chain


PLUGIN = "pk_dynamics"
NODE = "pk_jiggle"

# атрибут на контроле -> атрибут ноды, значение по умолчанию, min, max
#
# Все с приставкой jiggle, и не ради красоты: у джоинта есть свой встроенный
# stiffness (double3, для IK-солвера), и настройки часто вешают прямо на кость.
# А ещё на одном контроле может сидеть и цепочка со своими stiffness и damping -
# разойтись им негде, если имена те же.
SETTINGS = [
    ("jiggle",          "enable",    1,    0,    1),
    ("jiggleWeight",    "weight",    1.0,  0.0,  1.0),
    ("jiggleStiffness", "stiffness", 0.25, 0.0,  1.0),
    ("jiggleDamping",   "damping",   0.35, 0.0,  1.0),
    ("jiggleGravity",   "gravity",   0.0,  None, None),
    ("jiggleTranslate", "translate", 1.0,  0.0,  1.0),
    ("jiggleRotate",    "rotate",    0.0,  0.0,  1.0),
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


def _names(joint):
    return {"node": joint + "_jiggle", "driver": joint + "_jiggleDriver"}


def _addSettings(host, node):
    if not cmds.attributeQuery("jiggleSettings", node=host, exists=True):
        cmds.addAttr(host, ln="jiggleSettings", at="enum", en="Jiggle:", k=0)
        cmds.setAttr(host + ".jiggleSettings", channelBox=True)

    for attr, nodeAttr, dv, mn, mx in SETTINGS:
        if cmds.attributeQuery(attr, node=host, exists=True):
            # чужой атрибут с тем же именем: лучше сказать прямо, чем получить
            # невнятную ошибку на коннекте
            if cmds.attributeQuery(attr, node=host, numberOfChildren=True):
                cmds.error("%s.%s is somebody else's attribute - put the jiggle "
                           "settings on another control" % (host, attr))
        else:
            kw = {"ln": attr, "k": True, "dv": dv}
            kw["at"] = "bool" if attr == "jiggle" else "double"
            if mn is not None and attr != "jiggle":
                kw["min"] = mn
            if mx is not None and attr != "jiggle":
                kw["max"] = mx
            cmds.addAttr(host, **kw)
        cmds.connectAttr(host + "." + attr, node + "." + nodeAttr, f=True)


def collider(joint, kind="plane", size=1.0, length=4.0, at=None):
    """Коллайдер этой тряске: plane, sphere, capsule, box - те же, что у
    цепочки. Плоскость по умолчанию бесконечная, у неё есть галка infinite."""
    return _chain.collider(joint, kind, size=size, length=length, at=at,
                           node=_names(joint)["node"], under="")


def colliders(joint):
    """Коллайдеры этой тряски по порядку."""
    return _chain.colliders(joint, node=_names(joint)["node"])


def addCollider(joint, obj, kind=None):
    """Тот же коллайдер ещё и этой тряске - объект один на всех."""
    return _chain.addCollider(joint, obj, kind, node=_names(joint)["node"])


def removeCollider(joint, obj):
    """Снять коллайдер с этой тряски. Сам он остаётся в сцене."""
    return _chain.removeCollider(joint, obj, node=_names(joint)["node"])


def clearColliders(joint):
    """Снять все."""
    return _chain.clearColliders(joint, node=_names(joint)["node"])


def hasSettings(obj):
    """Есть ли на объекте настройки тряски."""
    return bool(obj) and cmds.objExists(obj) and \
        cmds.attributeQuery(SETTINGS[0][0], node=obj, exists=True)


def jointOf(node):
    """Кость, которую ведёт нода."""
    got = cmds.listConnections(node + ".outMatrix", s=False, d=True) or []
    return got[0] if got else None


def hostOf(node):
    """Контрол, на котором живут её настройки."""
    got = cmds.listConnections(node + "." + SETTINGS[0][1], s=True, d=False) or []
    return got[0] if got else None


def nodes(host=None):
    """Все тряски сцены, или те, что ведёт этот контрол."""
    if host is None:
        return sorted(cmds.ls(type=NODE) or [])
    if not hasSettings(host):
        return []
    got = cmds.listConnections("%s.%s" % (host, SETTINGS[0][0]),
                               s=False, d=True, type=NODE) or []
    out = []
    for n in got:
        if n not in out:
            out.append(n)
    return out


def nodeFrom(obj):
    """Нода тряски по выделенному: сама нода, кость, её водитель или контрол с
    настройками. Связи ищутся по типу ноды, а не по именам."""
    if not obj or not cmds.objExists(obj):
        return None

    if cmds.nodeType(obj) == NODE:
        return obj

    # кость: её место приходит из ноды
    for src in cmds.listConnections(obj + ".offsetParentMatrix", s=True, d=False,
                                    type=NODE) or []:
        return src

    # водитель: его матрица уходит в ноду
    if cmds.attributeQuery("worldMatrix", node=obj, exists=True):
        for dst in cmds.listConnections(obj + ".worldMatrix[0]", s=False, d=True,
                                        type=NODE) or []:
            return dst

    # контрол с настройками: он может вести сразу несколько
    got = nodes(obj)
    if got:
        return got[0]

    return None


# каркас кубика одной кривой: обход всех рёбер, не отрывая карандаша
CUBE = [(-1, -1, -1), (1, -1, -1), (1, -1, 1), (-1, -1, 1), (-1, -1, -1),
        (-1, 1, -1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (1, 1, 1),
        (1, -1, 1), (1, 1, 1), (-1, 1, 1), (-1, -1, 1), (-1, 1, 1), (-1, 1, -1)]

# цвет кубика - чтобы он не путался с контролами рига
COLOR = 17


def _free(base):
    """Свободное имя: jiggle, потом jiggle1, jiggle2..."""
    if not cmds.objExists(base + "_ctrl") and not cmds.objExists(base + "_jnt"):
        return base
    for i in range(1, 1000):
        if not cmds.objExists("%s%d_ctrl" % (base, i)) \
                and not cmds.objExists("%s%d_jnt" % (base, i)):
            return "%s%d" % (base, i)
    cmds.error("no free name left for %s" % base)


def buildControl(name="jiggle", size=1.0, at=None, parent=None):
    """Кубик-контрол, кость под ним и тряска на этой кости - всё разом, чтобы
    было чем попробовать.

    at - куда поставить: имя трансформа или три числа. parent - под кого
    подложить, обычно контрол рига: тогда кубик едет вместе с ним, а кость
    отстаёт от кубика. Настройки садятся на сам кубик."""
    if not loadPlugin():
        return None

    name = _free(name)
    half = max(1e-4, float(size)) * 0.5

    ctrl = cmds.curve(n=name + "_ctrl", d=1,
                      p=[(x * half, y * half, z * half) for x, y, z in CUBE])
    for shape in cmds.listRelatives(ctrl, s=True, f=True) or []:
        cmds.setAttr(shape + ".overrideEnabled", 1)
        cmds.setAttr(shape + ".overrideColor", COLOR)

    if at:
        if isinstance(at, (list, tuple)):
            cmds.xform(ctrl, ws=True, t=at)
        elif cmds.objExists(at):
            cmds.xform(ctrl, ws=True, m=cmds.xform(at, q=True, ws=True, m=True))
    if parent and cmds.objExists(parent):
        cmds.parent(ctrl, parent)

    joint = cmds.createNode("joint", n=name + "_jnt", p=ctrl)

    made = build(joint, host=ctrl)
    cmds.select(ctrl)
    print("pk_jiggle: %s and %s, settings on %s" % (ctrl, joint, ctrl))
    if made:
        made["control"] = ctrl
    return made


def build(joint, host=None):
    """Тряска на одну кость. host - где собрать настройки; по умолчанию на самой
    кости."""
    if not loadPlugin():
        return None
    if not cmds.objExists(joint):
        cmds.error("%s not found" % joint)

    n = _names(joint)
    if cmds.objExists(n["node"]):
        cmds.error("%s already has jiggle - delete(%r) first" % (joint, joint))

    parent = (cmds.listRelatives(joint, p=True, f=True) or [None])[0]

    # водитель помнит, где кость должна быть без тряски: тот же родитель, то же
    # место. Дальше он едет по ригу, а кость идёт за ним с отставанием
    driver = cmds.createNode("transform", n=n["driver"])
    if parent:
        cmds.parent(driver, parent)
    cmds.xform(driver, ws=True, m=cmds.xform(joint, q=True, ws=True, m=True))

    node = cmds.createNode(NODE, n=n["node"])
    cmds.connectAttr("time1.outTime", node + ".time")
    cmds.connectAttr(driver + ".worldMatrix[0]", node + ".inMatrix")
    if parent:
        cmds.connectAttr(parent + ".worldInverseMatrix[0]", node + ".parentInverseMatrix")
    cmds.connectAttr(node + ".outMatrix", joint + ".offsetParentMatrix", f=True)

    # место кости теперь целиком в offsetParentMatrix, а локальный трансформ
    # свободен - он остаётся аниматору поверх тряски
    for attr in ("translate", "rotate"):
        for a in "XYZ":
            plug = "%s.%s%s" % (joint, attr, a)
            if not cmds.listConnections(plug, s=True, d=False):
                cmds.setAttr(plug, 0)
    if cmds.attributeQuery("jointOrient", node=joint, exists=True):
        cmds.setAttr(joint + ".jointOrient", 0, 0, 0)

    _addSettings(host or joint, node)
    cmds.select(host or joint)
    print("pk_jiggle: %s on %s, settings on %s" % (node, joint, host or joint))
    return {"node": node, "driver": driver, "joint": joint}


def fromSelection(host=None):
    """На всех выделенных костях. host - собрать настройки на одном контроле:
    тогда все тряски идут от него."""
    sel = [o for o in (cmds.ls(sl=True, o=True) or []) if cmds.objExists(o)]
    if host and host in sel:
        sel.remove(host)
    if not sel:
        cmds.warning(u"pk jiggle: select the bones that should jiggle")
        return []

    made = []
    for joint in sel:
        made.append(build(joint, host))
    if host:
        cmds.select(host)
    return made


def delete(joint):
    """Убрать тряску, кость вернуть как была: место из водителя переезжает ей
    обратно в offsetParentMatrix, чтобы она осталась там же, где стоит."""
    n = _names(joint)
    if not cmds.objExists(n["node"]):
        cmds.warning("%s has no jiggle" % joint)
        return

    keep = cmds.getAttr(n["node"] + ".outMatrix")
    src = cmds.listConnections(joint + ".offsetParentMatrix", p=True, s=True, d=False) or []
    if src:
        cmds.disconnectAttr(src[0], joint + ".offsetParentMatrix")
    cmds.setAttr(joint + ".offsetParentMatrix", keep, type="matrix")

    for host in (cmds.listConnections(n["node"] + ".stiffness", s=True, d=False) or []):
        for attr, nodeAttr, dv, mn, mx in SETTINGS:
            if cmds.attributeQuery(attr, node=host, exists=True):
                others = [c for c in (cmds.listConnections(host + "." + attr, s=False,
                                                           d=True) or [])
                          if c != n["node"]]
                if not others:
                    cmds.deleteAttr(host, at=attr)
        if cmds.attributeQuery("jiggleSettings", node=host, exists=True) and \
                not cmds.attributeQuery(SETTINGS[0][0], node=host, exists=True):
            cmds.deleteAttr(host, at="jiggleSettings")

    cmds.delete(n["node"])
    if cmds.objExists(n["driver"]):
        cmds.delete(n["driver"])
    print("pk_jiggle: jiggle removed from %s" % joint)
