# -*- coding: utf-8 -*-
"""Цепочка с динамикой на pk_chainDynamics - без модуля и без nucleus.

    build("tail", count=6, length=10)   - собрать цепочку с нуля
    build("tail", count=3, joints=10)   - контролов меньше, чем костей
    fromSelection("tail")               - на выделенных трансформах, по порядку
    moveSettings(ctrl, other)           - ручки динамики на другой контрол
    linkSettings(master, other)         - настройки одной цепочки ведут другую
    unlinkSettings(ctrl)                - и обратно, ручки снова свои
    demo("tail")                        - ключи на корень, чтобы было на что смотреть
    setJoints("tail", 20)               - поменять число костей у готовой цепочки
    rebuild("tail")                     - перецепить ноду на текущие контролы,
                                          когда их добавили или убрали
    testAnim("tail")                    - прогонная анимация: все случаи подряд
    cylinder("tail")                    - цилиндр по костям, заскиненный на них
    editWeights("tail")                 - кривая веса динамики по костям
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

У каждой кости есть pos - где она стоит вдоль цепочки, от 0 у корня до 1 на
кончике, как у джоинтов спайна. По умолчанию они разложены ровно; кость можно
сдвинуть туда, где нужна геометрия, и больше ничего от этого не поменяется.
Работает это там, где костей больше, чем контролов - только тогда нода и
режет кривую.

Настройки динамики выведены на первый контрол (или на корень выделения).
localTranslate и localRotate говорят, насколько цепочка работает в системе
корневого контрола, а не в мире: при 1 она просто едет за ним, не отставая.
Порознь для переноса и для поворота.
Кривые - веса динамики и жёсткости - и всё остальное на самой ноде: это
настройка цепочки, а не то, что анимируют.
"""
import math
import os

import maya.cmds as cmds


PLUGIN = "pk_dynamics"

# Тип ноды - переменной, а не строкой по месту: рядом живёт второй плагин с
# такой же нодой, где пробуется новое (см. pk_chain_dyn2.py), и весь скрипт
# работает с ним тем же кодом.
NODE = "pk_chainDynamics"

AXES = {"x": (1, 0, 0), "y": (0, 1, 0), "z": (0, 0, 1),
        "-x": (-1, 0, 0), "-y": (0, -1, 0), "-z": (0, 0, -1)}

# атрибут на контроле -> атрибут ноды, значение по умолчанию, min, max
SETTINGS = [
    ("dynamic",      "enable",       1,   0,    1),
    ("dynamicWeight", "weight",      1.0, 0.0,  1.0),
    ("startFrame",   "startFrame",   1.0, None, None),
    ("stiffness",    "stiffness",    0.15, 0.0, 1.0),
    ("damping",      "damping",      0.5,  0.0, 1.0),
    ("gravity",      "gravity",      0.0, None, None),
    ("stretch",      "stretch",      0.6, 0.0, None),
    ("stretchDamping", "stretchDamping", 0.5, 0.0, 1.0),
    ("localTranslate", "localTranslate", 0.0, 0.0, 1.0),
    ("localRotate",   "localRotate",   0.0, 0.0, 1.0),
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


def hasSettings(obj):
    """Есть ли на объекте настройки динамики."""
    return bool(obj) and cmds.objExists(obj) and \
        cmds.attributeQuery(SETTINGS[0][0], node=obj, exists=True)


def _addOne(host, attr, dv, mn, mx):
    if cmds.attributeQuery(attr, node=host, exists=True):
        return
    kw = {"ln": attr, "k": True, "dv": dv}
    kw["at"] = "bool" if attr == "dynamic" else "double"
    if mn is not None and attr != "dynamic":
        kw["min"] = mn
    if mx is not None and attr != "dynamic":
        kw["max"] = mx
    cmds.addAttr(host, **kw)


def moveSettings(src, dst):
    """Перенести настройки динамики с одного контрола на другой: значения, то
    что их ведёт, и все связи с нодами. На src их после этого не остаётся.

    Это для кастомного контрола: цепочка собирается как обычно, а ручки потом
    уезжают туда, где аниматору удобно. Ведущих нод может быть сколько угодно -
    если на src сидело несколько цепочек, все они переедут вместе."""
    if not hasSettings(src):
        cmds.error("%s has no dynamic settings on it" % src)
    if not cmds.objExists(dst):
        cmds.error("%s not found" % dst)
    if src == dst:
        cmds.error("moveSettings: it is the same control")

    if not cmds.attributeQuery("dynamicSettings", node=dst, exists=True):
        cmds.addAttr(dst, ln="dynamicSettings", at="enum", en="Dynamic:", k=0)
        cmds.setAttr(dst + ".dynamicSettings", channelBox=True)

    moved = []
    for attr, nodeAttr, dv, mn, mx in SETTINGS:
        if not cmds.attributeQuery(attr, node=src, exists=True):
            continue

        sPlug = "%s.%s" % (src, attr)
        dPlug = "%s.%s" % (dst, attr)
        value = cmds.getAttr(sPlug)
        _addOne(dst, attr, dv, mn, mx)

        # то, что ведёт настройку - анимация, другой контрол - уезжает тоже
        into = cmds.listConnections(sPlug, p=True, s=True, d=False) or []

        # а вниз - все ноды, сколько бы их ни висело
        outs = cmds.listConnections(sPlug, p=True, s=False, d=True) or []
        for plug in outs:
            cmds.disconnectAttr(sPlug, plug)
        if into:
            cmds.disconnectAttr(into[0], sPlug)

        cmds.setAttr(dPlug, value)
        if into:
            cmds.connectAttr(into[0], dPlug, f=True)
        for plug in outs:
            cmds.connectAttr(dPlug, plug, f=True)

        cmds.deleteAttr(src, at=attr)
        moved.append(attr)

    if cmds.attributeQuery("dynamicSettings", node=src, exists=True):
        cmds.deleteAttr(src, at="dynamicSettings")

    cmds.select(dst)
    print("pk_chainDynamics: %d settings moved %s -> %s" % (len(moved), src, dst))
    return moved


def linkSettings(master, other):
    """Настройки other ведутся настройками master - так несколько цепочек
    собираются под одним управлением.

    Связывается контрол с контролом, а не с нодой: у каждой цепочки её ручки
    остаются на месте и связь на любой из них можно разорвать, подстроив эту
    одну цепочку отдельно. Кривые - веса и жёсткости - живут на самих нодах и
    здесь не затрагиваются: это форма цепочки, а не то, чем управляют.

    Ручки ведомого убираются из канал бокса: менять их всё равно нельзя, а
    путать аниматора двумя наборами одних и тех же настроек незачем. Вернуть их
    туда - unlinkSettings."""
    if not hasSettings(master):
        cmds.error("%s has no dynamic settings on it" % master)
    if master == other:
        cmds.error("linkSettings: it is the same control")

    linked = []
    for attr, nodeAttr, dv, mn, mx in SETTINGS:
        if not cmds.attributeQuery(attr, node=master, exists=True):
            continue
        _addOne(other, attr, dv, mn, mx)
        plug = "%s.%s" % (other, attr)
        cmds.connectAttr("%s.%s" % (master, attr), plug, f=True)

        # ведётся мастером - в канал боксе ведомого ей делать нечего
        cmds.setAttr(plug, k=False, cb=False)
        linked.append(attr)

    if cmds.attributeQuery("dynamicSettings", node=other, exists=True):
        cmds.setAttr(other + ".dynamicSettings", cb=False)

    print("pk_chainDynamics: %d settings %s -> %s, hidden on %s"
          % (len(linked), master, other, other))
    return linked


def unlinkSettings(ctrl):
    """Снять связь с мастера: настройки остаются со своими значениями, снова
    видны в канал боксе и снова свои. Обратное для linkSettings."""
    if not hasSettings(ctrl):
        cmds.error("%s has no dynamic settings on it" % ctrl)

    free = []
    for attr, nodeAttr, dv, mn, mx in SETTINGS:
        plug = "%s.%s" % (ctrl, attr)
        if not cmds.attributeQuery(attr, node=ctrl, exists=True):
            continue

        for src in cmds.listConnections(plug, p=True, s=True, d=False) or []:
            # значение остаётся тем, каким его вёл мастер
            was = cmds.getAttr(plug)
            cmds.disconnectAttr(src, plug)
            cmds.setAttr(plug, was)
            free.append(attr)

        cmds.setAttr(plug, k=True)

    if cmds.attributeQuery("dynamicSettings", node=ctrl, exists=True):
        cmds.setAttr(ctrl + ".dynamicSettings", channelBox=True)

    print("pk_chainDynamics: %s is on its own again, %d settings freed"
          % (ctrl, len(free)))
    return free


def _makeNode(name, goals, space):
    """space - относительно чего работают localTranslate/localRotate. По
    умолчанию сам корневой контрол: его движение тогда можно снимать этими
    двумя ручками, не трогая остальную анимацию."""
    node = cmds.createNode(NODE, n=_names(name)["node"])
    cmds.connectAttr("time1.outTime", node + ".time")
    if space:
        cmds.connectAttr(space + ".worldMatrix[0]", node + ".spaceMatrix")

    for i, g in enumerate(goals):
        cmds.connectAttr(g + ".worldMatrix[0]", "%s.goalMatrix[%d]" % (node, i))
    return node


def _skinned(joint):
    """Кость, на которую что-то заскинено, удалять нельзя - скин развалится."""
    return bool(cmds.listConnections(joint + ".worldMatrix", type="skinCluster") or
                cmds.listConnections(joint, type="skinCluster") or [])


def _link(src, dst):
    """Соединить, если ещё не соединено - иначе Maya ругается на каждую кость."""
    if src not in (cmds.listConnections(dst, p=True, s=True, d=False) or []):
        cmds.connectAttr(src, dst, f=True)


def _count(name):
    """Сколько костей у цепочки сейчас - по именам, подряд от первой."""
    i = 0
    while cmds.objExists("%s_dyn_%d_jnt" % (name, i + 1)):
        i += 1
    return i


def bones(name="chain"):
    """Кости цепочки по порядку - те, что нода и правда тянет.

    Ищем именно джоинты: на тот же outMatrix могут сидеть и другие трансформы -
    например шарики, показывающие толщину, - и брать первое, что подключено,
    значит рано или поздно принять за кость что-то другое."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    out = []
    for i in sorted(cmds.getAttr(node + ".outMatrix", mi=True) or []):
        plug = "%s.outMatrix[%d]" % (node, i)
        got = cmds.listConnections(plug, s=False, d=True, type="joint") or []
        if got:
            out.append(got[0])
    return out


def _joints(name, node, count):
    """Ровно count костей под группой цепочки, подключённых к ноде по порядку.
    Лишние удаляются, недостающие создаются, уже существующие не трогаются -
    поэтому их можно скинить и потом менять число костей у других."""
    n = _names(name)

    if not cmds.objExists(n["joints"]):
        cmds.createNode("transform", n=n["joints"])
        if cmds.objExists(n["top"]):
            cmds.parent(n["joints"], n["top"])
    cmds.setAttr(n["joints"] + ".inheritsTransform", 0)

    # если число костей меняется, pos раскладываем заново: прежние доли
    # были долями прежней цепочки
    spread = _count(name) != count

    joints = []
    for i in range(count):
        j = "%s_dyn_%d_jnt" % (name, i + 1)
        fresh = not cmds.objExists(j)
        if fresh:
            cmds.select(cl=True)
            cmds.joint(n=j)
            cmds.parent(j, n["joints"])
            for a in ("t", "r", "jo"):
                cmds.setAttr(j + "." + a, 0, 0, 0)

        if not cmds.attributeQuery("pos", node=j, exists=True):
            cmds.addAttr(j, ln="pos", at="double", min=0, max=1, dv=0, k=1)
        if fresh or spread:
            cmds.setAttr(j + ".pos", float(i) / (count - 1) if count > 1 else 0.0)
        _link(j + ".pos", "%s.position[%d]" % (node, i))

        _link("%s.outMatrix[%d]" % (node, i), j + ".offsetParentMatrix")
        joints.append(j)

    # то, что стало лишним
    i = count
    kept = []
    while True:
        j = "%s_dyn_%d_jnt" % (name, i + 1)
        if not cmds.objExists(j):
            break
        if _skinned(j):
            # нода столько выходов больше не отдаёт, и кость прыгнула бы в
            # начало координат - отвязываем её там, где она сейчас
            m = cmds.getAttr(j + ".worldMatrix[0]")
            src = cmds.listConnections(j + ".offsetParentMatrix", p=True, s=True, d=False) or []
            if src:
                cmds.disconnectAttr(src[0], j + ".offsetParentMatrix")
            for dst in cmds.listConnections(j + ".pos", p=True, s=False, d=True) or []:
                cmds.disconnectAttr(j + ".pos", dst)
            cmds.setAttr(j + ".offsetParentMatrix", m, type="matrix")
            kept.append(j)
        else:
            cmds.delete(j)
        i += 1

    if kept:
        cmds.warning("%s: %d joints are skinned and were left in place: %s"
                     % (name, len(kept), ", ".join(kept)))

    return joints


def _rig(name, goals, host, space, joints=0):
    """Нода + джоинты на готовой цепочке целей. joints - сколько костей, если
    их должно быть больше, чем контролов."""
    node = _makeNode(name, goals, space)

    count = len(goals)
    if joints and joints > count:
        cmds.setAttr(node + ".outputCount", joints)
        count = joints

    bones = _joints(name, node, count)
    _addSettings(host, node)
    cmds.select(host)
    return node, bones


def setJoints(name="chain", count=0):
    """Поменять число костей в уже собранной цепочке. count 0 или меньше числа
    контролов - по одной кости на контрол. Кости, на которые уже что-то
    заскинено, не удаляются: о них скрипт предупредит."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    goals = len(cmds.getAttr(node + ".goalMatrix", mi=True) or [])
    if goals < 2:
        cmds.error("%s has no chain connected" % node)

    count = int(count)
    if count and count < goals:
        cmds.warning("%s: %d joints is fewer than the %d controls - taking one per control"
                     % (name, count, goals))
    if count <= goals:
        count = goals
        cmds.setAttr(node + ".outputCount", 0)
    else:
        cmds.setAttr(node + ".outputCount", count)

    bones = _joints(name, node, count)
    print("pk_chainDynamics: %s, %d controls, %d joints" % (node, goals, len(bones)))
    return bones


def rebuild(name="chain", joints=None, walk=True):
    """Перецепить ноду на те контролы, что есть в цепочке сейчас - после того,
    как контролы добавили, убрали или переставили.

    Нода остаётся та же, поэтому сохраняется всё, что на ней настроено: обе
    кривые, maxBend, bendSoftness, всё прочее. Полная пересборка через
    delete + build это потеряла бы.

    Цепочка берётся заново вниз по иерархии от корневого контрола (walk).
    С walk=False список остаётся прежним - это способ просто пересчитать
    кости под изменившееся outputCount. joints - сколько сделать костей,
    по умолчанию как было."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    was = _inputs(node + ".goalMatrix")
    if not was:
        cmds.error("%s: nothing is connected to goalMatrix" % node)

    root = was[min(was)]
    goals = chainFromRoot(root) if walk else [was[i] for i in sorted(was)]
    if len(goals) < 2:
        cmds.error("%s: the chain from %s is shorter than two controls" % (name, root))

    # цели отключаются, и элементы массива уходят следом - у goalMatrix
    # disconnectBehavior kDelete
    for i in sorted(was):
        plug = "%s.goalMatrix[%d]" % (node, i)
        src = cmds.listConnections(plug, p=True, s=True, d=False) or []
        if src:
            cmds.disconnectAttr(src[0], plug)
    for i in cmds.getAttr(node + ".goalMatrix", mi=True) or []:
        cmds.removeMultiInstance("%s.goalMatrix[%d]" % (node, i), b=True)

    for i, g in enumerate(goals):
        cmds.connectAttr(g + ".worldMatrix[0]", "%s.goalMatrix[%d]" % (node, i), f=True)

    count = int(joints) if joints else (cmds.getAttr(node + ".outputCount") or len(goals))
    if count <= len(goals):
        count = len(goals)
        cmds.setAttr(node + ".outputCount", 0)
    else:
        cmds.setAttr(node + ".outputCount", count)

    bones = _joints(name, node, count)
    _addSettings(goals[0], node)
    cmds.select(goals[0])

    added = [g for g in goals if g not in was.values()]
    gone = [g for g in was.values() if g not in goals]
    print("pk_chainDynamics: %s, %d controls, %d joints%s%s"
          % (node, len(goals), len(bones),
             (", added: " + ", ".join(added)) if added else "",
             (", dropped: " + ", ".join(gone)) if gone else ""))
    return {"node": node, "ctrls": goals, "joints": bones}


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

    # пространство - корневой контрол: localTranslate и localRotate
    # решают, насколько цепочка просто едет за ним
    node, bones = _rig(name, ctrls, ctrls[0], ctrls[0], joints)
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
    корень - тогда цепочка соберётся вниз по иерархии (walk). space - система,
    в которой считают localTranslate и localRotate, по умолчанию сам корень.
    joints - сколько сделать костей, если их нужно больше, чем контролов."""
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
        space = goals[0]

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


def testAnim(name="chain", root=None, size=None, hold=20):
    """Прогонная анимация: все случаи подряд, с паузой после каждого.

    Кладётся на корневой контрол цепочки (или на root, если он задан - удобно,
    когда корень цепочки сам к чему-то подвешен). size - размах переносов, по
    умолчанию длина цепочки. hold - пауза после каждого рывка, чтобы видеть,
    как цепочка успокаивается.

    Печатает, на каком кадре что смотреть."""
    if root is None:
        root = "%s_1_ctrl" % name
        if not cmds.objExists(root):
            node = _names(name)["node"]
            src = cmds.listConnections(node + ".goalMatrix[0]", s=True, d=False) if cmds.objExists(node) else None
            root = src[0] if src else None
    if not root or not cmds.objExists(root):
        cmds.error("%s: root control not found, pass root=" % name)

    if size is None:
        node = _names(name)["node"]
        pts = []
        for i in cmds.getAttr(node + ".goalMatrix", mi=True) or []:
            src = cmds.listConnections("%s.goalMatrix[%d]" % (node, i), s=True, d=False) or []
            if src:
                pts.append(cmds.xform(src[0], q=True, ws=True, t=True))
        size = 8.0
        if len(pts) > 1:
            size = sum(math.dist(pts[i], pts[i + 1]) for i in range(len(pts) - 1)) or 8.0

    chans = ("tx", "ty", "tz", "rx", "ry", "rz")
    for c in chans:
        cmds.cutKey(root, at=c, cl=True)
    rest = dict((c, cmds.getAttr(root + "." + c)) for c in chans)

    f = 1
    plan = []

    def key(frame, **vals):
        for c in chans:
            cmds.setKeyframe(root, at=c, t=frame,
                             v=rest[c] + vals.get(c, 0.0))

    def phase(title, frames, **vals):
        """Движение за frames кадров, потом пауза - смотреть затухание."""
        nonlocal f
        start = f
        key(f)
        f += frames
        key(f, **vals)
        cmds.keyTangent(root, at=chans, t=(start, f), itt="linear", ott="linear")
        f += hold
        key(f, **vals)
        plan.append((start, f, title))

    phase(u"поворот, плавный", 25, rz=70)
    phase(u"поворот, резкий - хлыст", 4, rz=-70)
    phase(u"возврат", 10, rz=0)
    phase(u"перенос вдоль цепочки - растяжение", 5, tx=-size)
    phase(u"перенос поперёк - отставание", 5, tx=-size, ty=size * 0.8)
    phase(u"назад и вверх, резко - складка у корня", 4, tx=-size * 1.8, ty=size * 1.4)
    phase(u"возврат на место", 12)
    phase(u"по кругу, не останавливаясь", 12, tx=size, ty=size)
    phase(u"", 12, tx=size * 2.0, ty=0.0)
    phase(u"", 12, tx=size, ty=-size)
    phase(u"стоп после круга", 1)
    phase(u"кручение вокруг своей оси - твист", 6, rx=180)
    phase(u"мелкая дрожь", 2, tx=-size * 0.3)
    phase(u"", 2, tx=size * 0.3)
    phase(u"", 2, tx=-size * 0.3)
    phase(u"возврат и покой", 8)

    cmds.playbackOptions(min=1, max=f, ast=1, aet=f)
    if cmds.attributeQuery("startFrame", node=root, exists=True):
        cmds.setAttr(root + ".startFrame", 1)
    cmds.currentTime(1)

    print("pk_chainDynamics: прогон на %s, кадры 1-%d" % (root, f))
    for a, b, title in plan:
        if title:
            print("   %3d - %3d  %s" % (a, b, title))
    return f


def _rampWindow(name, attr, title, size):
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    win = "%s_%s_win" % (name, attr)
    if cmds.window(win, exists=True):
        cmds.deleteUI(win)

    cmds.window(win, t="%s - %s" % (name, title), wh=size)
    form = cmds.formLayout()
    grad = cmds.gradientControl(at=node + "." + attr, h=160)
    cmds.formLayout(form, e=True,
                    af=[(grad, "top", 6), (grad, "left", 6), (grad, "right", 6), (grad, "bottom", 6)])
    cmds.showWindow(win)


def editWeights(name="chain"):
    """Кривая веса динамики: сколько её достаётся каждой кости. 0 - кость
    сидит на своём контроле, 1 - живёт полностью. Профиль размаха рисуется
    здесь, и только здесь: жёсткость у всей цепочки одна, поэтому все кости
    качаются в такт."""
    _rampWindow(name, "weightRamp", "how much dynamics along the chain", (420, 230))


# что было на контроле в первой версии, а теперь живёт на ноде или ушло
_OLD_HOST_ATTRS = ("stiffnessTip", "lengthKeep", "substeps", "followSpace", "bendStiffness",
                   "followTranslate", "followRotate")


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
    maxBend = value("maxBend", None)

    def readRamp(attr):
        out = []
        if not cmds.objExists(node):
            return out
        for i in cmds.getAttr("%s.%s" % (node, attr), mi=True) or []:
            out.append((cmds.getAttr("%s.%s[%d].%s_Position" % (node, attr, i, attr)),
                        cmds.getAttr("%s.%s[%d].%s_FloatValue" % (node, attr, i, attr)),
                        cmds.getAttr("%s.%s[%d].%s_Interp" % (node, attr, i, attr))))
        return out

    weightRamp = readRamp("weightRamp")
    stiffness = value("stiffness", 0.3)
    damping   = value("damping", 0.1)
    tip       = value("stiffnessTip", None)
    substeps  = value("substeps", 2)

    # --- замена ---------------------------------------------------------------
    if cmds.objExists(node):
        cmds.delete(node)
    for attr in _OLD_HOST_ATTRS:
        if cmds.attributeQuery(attr, node=host, exists=True):
            cmds.deleteAttr(host + "." + attr)

    node = _makeNode(name, goals, space or host)
    for i, j in enumerate(joints):
        cmds.connectAttr("%s.outMatrix[%d]" % (node, i), j + ".offsetParentMatrix", f=True)
    _addSettings(host, node)

    cmds.setAttr(node + ".outputCount", outputCount)
    if maxBend is not None:
        cmds.setAttr(node + ".maxBend", maxBend)
    def writeRamp(attr, points):
        if not points:
            return
        for i in cmds.getAttr("%s.%s" % (node, attr), mi=True) or []:
            cmds.removeMultiInstance("%s.%s[%d]" % (node, attr, i), b=True)
        for i, (pos, val, interp) in enumerate(points):
            cmds.setAttr("%s.%s[%d].%s_Position" % (node, attr, i, attr), pos)
            cmds.setAttr("%s.%s[%d].%s_FloatValue" % (node, attr, i, attr), val)
            cmds.setAttr("%s.%s[%d].%s_Interp" % (node, attr, i, attr), interp)

    writeRamp("weightRamp", weightRamp)
    cmds.setAttr(node + ".substeps", max(1, int(round(substeps))))

    # --- значения ------------------------------------------------------------
    # stiffnessTip на контроле - признак первой версии: только у неё старая
    # шкала, уже обновлённую цепочку пересчитывать нельзя
    if keepLook and tip is not None:
        root = _oldToNew(stiffness, substeps)
        cmds.setAttr(host + ".stiffness", root)
        cmds.setAttr(host + ".damping", _oldDampToRatio(damping, root))

        # своей жёсткости у кончика больше нет: у цепочки одна жёсткость, а
        # профиль размаха рисуется кривой веса - editWeights
        if tip is not None and abs(tip - stiffness) > 1e-6:
            cmds.warning("%s: tip stiffness %.3f is not carried over - draw the "
                         "profile with editWeights instead" % (name, tip))

    print("pk_chainDynamics: %s upgraded, %d points, stiffness %.3f -> %.3f"
          % (name, len(goals), stiffness, cmds.getAttr(host + ".stiffness")))
    cmds.select(host)
    return {"node": node, "ctrls": goals, "joints": joints}


def delete(name="chain"):
    n = _names(name)
    for k in ("node", "joints", "top"):
        if cmds.objExists(n[k]):
            cmds.delete(n[k])


def _axisPair(node):
    """Две оси кости поперёк цепочки. Вдоль цепочки всегда X, поперёк - Y и Z."""
    return (1, 2)


def _unit(v):
    n = math.sqrt(sum(c * c for c in v))
    return [c / n for c in v] if n > 1e-9 else [0.0, 0.0, 0.0]


def cylinder(name="chain", radius=0.5, sides=8, splits=None):
    """Цилиндр по костям цепочки, заскиненный на них. Сплитов по длине -
    столько же, сколько костей.

    Геометрия кладётся на кости как они стоят сейчас: каждое кольцо садится
    на своё место вдоль цепочки и разворачивается по кости, так что изогнутая
    цепочка получает изогнутый цилиндр, а бинд-поза - ровно текущая."""
    node = _names(name)["node"]
    joints = bones(name)
    if len(joints) < 2:
        cmds.error("%s: fewer than two joints to skin to" % name)
    if cmds.objExists(name + "_dyn_geo"):
        cmds.error("%s_dyn_geo already exists - delete it first" % name)

    mats = [cmds.getAttr(j + ".worldMatrix[0]") for j in joints]
    pos = [m[12:15] for m in mats]

    seg = [math.sqrt(sum((pos[i + 1][c] - pos[i][c]) ** 2 for c in range(3)))
           for i in range(len(pos) - 1)]
    total = sum(seg)
    if total < 1e-6:
        cmds.error("%s: the chain has no length" % name)

    if radius is None:     # по длине цепочки, если своего нет
        radius = total / 12.0
    splits = max(1, int(splits) if splits else len(joints) - 1)

    mesh = cmds.polyCylinder(n=name + "_dyn_geo", r=radius, h=total,
                             sx=int(sides), sy=splits, sz=1, ax=(0, 1, 0), ch=False)[0]

    # доля вдоль цепочки -> место и поперечные оси там
    a, b = _axisPair(node)

    def at(t):
        want = max(0.0, min(1.0, t)) * total
        i = 0
        run = 0.0
        while i < len(seg) - 1 and run + seg[i] < want:
            run += seg[i]
            i += 1
        u = (want - run) / seg[i] if seg[i] > 1e-9 else 0.0

        p = [pos[i][c] + (pos[i + 1][c] - pos[i][c]) * u for c in range(3)]
        ax = [_unit(mats[i][r * 4:r * 4 + 3]) for r in range(3)]
        bx = [_unit(mats[i + 1][r * 4:r * 4 + 3]) for r in range(3)]
        side = _unit([ax[a][c] + (bx[a][c] - ax[a][c]) * u for c in range(3)])
        up = _unit([ax[b][c] + (bx[b][c] - ax[b][c]) * u for c in range(3)])
        return p, side, up

    for v in cmds.ls(mesh + ".vtx[*]", fl=True):
        x, y, z = cmds.xform(v, q=True, os=True, t=True)
        p, side, up = at(y / total + 0.5)
        cmds.xform(v, ws=True, t=[p[c] + side[c] * x + up[c] * z for c in range(3)])

    top = _names(name)["top"]
    if cmds.objExists(top):
        cmds.parent(mesh, top)

    skin = cmds.skinCluster(joints, mesh, tsb=True, mi=3, dr=4.0,
                            n=name + "_dyn_skinCluster")[0]
    cmds.select(mesh)
    print("pk_chainDynamics: %s on %d joints, %d splits" % (mesh, len(joints), splits))
    return {"mesh": mesh, "skin": skin}
