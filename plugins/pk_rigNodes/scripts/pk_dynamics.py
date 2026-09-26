# -*- coding: utf-8 -*-
"""Динамика rigStudio на плагине pk_dynamics: цепочки, тряска и окно.

Один файл на весь инструмент - нарочно. Раньше это были три модуля, и они
ссылались друг на друга: тряска брала у цепочки коллайдеры и начало анимации,
окно - и то и другое. А перезагружают модули по одному, и свежий рядом со старым
давал то, чего в риге быть не должно: сборка падала на том, что у соседа ещё нет
функции, которая у него уже есть на диске. В одном файле такому взяться негде.

Окно:

    import pk_dynamics
    pk_dynamics.show()

Цепочка - имена без приставки:

    build("tail", count=6, length=10)   - собрать цепочку с нуля
    build("tail", count=3, joints=10)   - контролов меньше, чем костей
    fromSelection("tail")               - на выделенных трансформах, по порядку
    moveSettings(ctrl, other)           - ручки динамики на другой контрол
    linkSettings(master, other)         - настройки одной цепочки ведут другую
    unlinkSettings(ctrl)                - и обратно, ручки снова свои
    setJoints("tail", 20)               - поменять число костей у готовой цепочки
    rebuild("tail")                     - перецепить ноду на текущие контролы
    cylinder("tail")                    - цилиндр по цепочке, привязанный к костям
    collider("tail", "plane")           - коллайдер: plane, sphere, capsule, box
    thicknessGuide("tail")              - шарики, которыми видно толщину
    demo("tail"), testAnim("tail")      - ключи, чтобы было на что смотреть

Тряска - имена с приставкой jiggle, потому что у цепочки есть свои такие же:

    jiggleFromSelection()               - на выделенных костях, настройки на них же
    jiggleFromSelection(host="body_ctrl") - настройки собрать на одном контроле
    buildControl()                      - кубик-контрол с костью и тряской, с нуля
    dynamicCopy("hand_ctrl")            - динамика на готовый контрол: копия внутри
    removeDynamicCopy("hand_ctrl")      - и обратно, контрол как был
    rewire()                            - досвязать копии в сцене, собранной раньше
    jiggleCollider("belly_jnt", "plane") - коллайдер тряске
    jiggleBuild("belly_jnt")            - на одной кости
    jiggleDelete("belly_jnt")           - убрать, кость вернуть как была
    nodeFrom(obj)                       - тряска выделенного: кость, водитель, контрол

Настройки тряски живут на контроле (или на самой кости, если контрол не указан):
jiggle, jiggleWeight, jiggleStiffness, jiggleDamping, jiggleGravity,
jiggleTranslate, jiggleRotate. Остальное - axisScale, limit, substeps - на самой
ноде: это настройка, а не то, что анимируют.
"""
import math
import os

import maya.cmds as cmds


# =============================================================================
#   Цепочка: pk_chainDynamics
# =============================================================================

PLUGIN = "pk_dynamics"

# Тип ноды - переменной, а не строкой по месту: так его можно подменить, если
# понадобится собрать вторую ноду рядом и погонять на ней что-то новое, не
# трогая рабочую.
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
            kw = {"ln": attr, "k": True, "dv": _default(attr, dv)}
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


def sceneStart():
    """С какого кадра считать динамику: начало анимации сцены. Одна на весь файл -
    и цепочке, и тряске нужна та же.

    Нода сбрасывается на своём startFrame и на всём, что раньше него, - там она
    просто сидит на цели. Пока это было жёсткой единицей, сцена с нулевого кадра
    теряла первый шаг движения целиком: замерено, при анимации с кадра 0 и
    startFrame 1 отставание шло 0.0000 0.0000 0.3347 вместо 0.0000 0.3347 0.4219,
    то есть кадр 0->1 съедал сброс. А в сценах, которые начинаются с сотого, так
    съедалось бы всё до него.

    Берём именно animationStartTime, а не начало видимого диапазона: диапазон
    аниматор двигает по ходу работы, а это внешняя граница, раньше которой кадров
    не бывает."""
    return cmds.playbackOptions(q=True, ast=True)


def _default(attr, dv):
    """startFrame - из сцены, остальное из таблицы."""
    return sceneStart() if attr == "startFrame" else dv


def _addOne(host, attr, dv, mn, mx):
    if cmds.attributeQuery(attr, node=host, exists=True):
        return
    kw = {"ln": attr, "k": True, "dv": _default(attr, dv)}
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

    print("pk_chainDynamics: test animation on %s, frames 1-%d" % (root, f))
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


TYPES = {"plane": 0, "sphere": 1, "capsule": 2, "box": 3}
KINDS = dict((v, k) for k, v in TYPES.items())

# цвет каркаса, чтобы коллайдер не путался с контролами - один на все формы
COLOR = 14

# плоскость сеткой, а не одним квадратом - по ней видно, куда она наклонена;
# у капсулы шапки в четыре доли, иначе они читаются гранёными
SUBDIV = {"polyPlane": (("subdivisionsWidth", 5), ("subdivisionsHeight", 5)),
          "polyCylinder": (("subdivisionsCaps", 4),),
          "polySphere": (),
          "polyCube": ()}


def _shape(loc, kind):
    """Форма коллайдера - примитив под самим коллайдером, а размеры приходят
    связями в его construction history.

    Примитивы выбраны так, чтобы картинка была ровно тем, что считает солвер, а
    не похожим на него: polySphere radius это тот же радиус, а polyCylinder с
    круглыми шапками это и есть капсула - отрезок длиной height, обтянутый
    радиусом, и в габарит он даёт length + 2 * radius. Проверено замером.

    Рисуются они каркасом (overrideShading 0): сквозь коллайдер видно цепочку,
    ради которой он и стоит. Хочется плотный - выключить оверрайд на шейпе. И
    не рендерятся: это оснастка, а не геометрия."""
    if kind == "plane":
        made = cmds.polyPlane(w=1.0, h=1.0, sx=5, sy=5, ax=(0, 1, 0), ch=True)
        cmds.connectAttr(loc + ".size", made[1] + ".width")
        cmds.connectAttr(loc + ".size", made[1] + ".height")
    elif kind == "sphere":
        made = cmds.polySphere(r=1.0, sx=16, sy=10, ch=True)
        cmds.connectAttr(loc + ".radius", made[1] + ".radius")
    elif kind == "box":
        made = cmds.polyCube(w=1.0, h=1.0, d=1.0, sx=1, sy=1, sz=1, ch=True)
        cmds.connectAttr(loc + ".sizeX", made[1] + ".width")
        cmds.connectAttr(loc + ".sizeY", made[1] + ".height")
        cmds.connectAttr(loc + ".sizeZ", made[1] + ".depth")
    else:
        made = cmds.polyCylinder(r=1.0, h=1.0, sx=16, sy=1, sz=4, rcp=True,
                                 ax=(0, 1, 0), ch=True)
        cmds.connectAttr(loc + ".radius", made[1] + ".radius")
        cmds.connectAttr(loc + ".length", made[1] + ".height")

    shape = cmds.listRelatives(made[0], s=True, f=True)[0]
    shape = cmds.parent(shape, loc, r=True, s=True)[0]
    cmds.delete(made[0])
    shape = cmds.rename(shape, loc + "Shape")

    _look(shape)
    return shape


def _look(shape):
    """Вид коллайдера: зелёный каркас, в рендер не идёт, доли примитива такие,
    по которым форму видно. Отдельно от сборки, чтобы тем же кодом привести к
    этому виду и те коллайдеры, что стоят в сцене с прошлых версий."""
    cmds.setAttr(shape + ".overrideEnabled", 1)
    cmds.setAttr(shape + ".overrideShading", 0)
    cmds.setAttr(shape + ".overrideColor", COLOR)
    for a in ("castsShadows", "receiveShadows", "primaryVisibility",
              "visibleInReflections", "visibleInRefractions"):
        cmds.setAttr(shape + "." + a, 0)

    for made in cmds.listConnections(shape + ".inMesh", s=True, d=False) or []:
        for attr, value in SUBDIV.get(cmds.nodeType(made), ()):
            if cmds.attributeQuery(attr, node=made, exists=True):
                cmds.setAttr(made + "." + attr, value)
    return shape


def _attrs(loc, kind, size, length):
    """Размеры живут на самом коллайдере: их видно в канал боксе, они же идут
    в ноду и они же задают форму."""
    if kind == "plane":
        if not cmds.attributeQuery("size", node=loc, exists=True):
            cmds.addAttr(loc, ln="size", at="double", min=0.01, dv=float(size), k=True)
        # бесконечная плоскость это пол: у него нет края, и так нужно чаще
        if not cmds.attributeQuery("infinite", node=loc, exists=True):
            cmds.addAttr(loc, ln="infinite", at="bool", dv=1, k=True)
        return

    if kind == "box":
        if not cmds.attributeQuery("size", node=loc, exists=True):
            cmds.addAttr(loc, ln="size", at="double3", k=True)
            for a in "XYZ":
                cmds.addAttr(loc, ln="size" + a, at="double", p="size",
                             min=0.0, dv=float(size), k=True)
        return

    if not cmds.attributeQuery("radius", node=loc, exists=True):
        cmds.addAttr(loc, ln="radius", at="double", min=0.0, dv=float(size), k=True)
    if kind == "capsule" and not cmds.attributeQuery("length", node=loc, exists=True):
        cmds.addAttr(loc, ln="length", at="double", min=0.0, dv=float(length), k=True)


def _hasShape(loc):
    return bool(cmds.listRelatives(loc, ad=True, type="mesh") or
                cmds.listRelatives(loc, ad=True, type="nurbsCurve") or [])


def collider(name="chain", kind="plane", size=1.0, length=4.0, at=None,
             node=None, under=None):
    """Коллайдер цепочке - трансформ с формой, чей worldMatrix идёт в очередной
    элемент collider.

    Плоскость смотрит своим Y и считается бесконечной, квадрат нарисован только
    чтобы её было видно; sphere берёт radius, capsule ещё и length по своему Y.
    Размеры стоят атрибутами на самом коллайдере: они же идут в ноду, они же
    задают форму - картинка и расчёт это одно число. Масштаб коллайдера солвер
    читает из матрицы, поэтому увеличенный трансформ это и правда больший
    коллайдер, а не только большая картинка."""
    if kind not in TYPES:
        cmds.error("collider: kind is one of %s" % ", ".join(sorted(TYPES)))

    # node и under - для тряски: у неё своя нода на каждую кость и нет группы
    # цепочки, а коллайдеры те же самые
    node = node or _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    used = cmds.getAttr(node + ".collider", mi=True) or []
    i = (max(used) + 1) if used else 0

    loc = cmds.createNode("transform", n="%s_%s_%d_collider" % (name, kind, i + 1))
    if at:
        cmds.xform(loc, ws=True, t=at)
    if kind == "plane" and size <= 1.0:
        size = 10.0                      # пол размером в пол, а не в кулак

    _attrs(loc, kind, size, length)
    _shape(loc, kind)

    top = under if under is not None else _names(name)["top"]
    if top and cmds.objExists(top):
        cmds.parent(loc, top)

    cmds.connectAttr(loc + ".worldMatrix[0]", "%s.collider[%d].colliderMatrix" % (node, i))
    cmds.setAttr("%s.collider[%d].colliderType" % (node, i), TYPES[kind])
    _sizes(loc, node, i, kind)

    if cmds.getAttr(node + ".collide") <= 0.0:
        cmds.setAttr(node + ".collide", 1.0)

    cmds.select(loc)
    print("pk_chainDynamics: %s collider[%d] = %s" % (kind, i, loc))
    return loc


def _free(node):
    """Следующий свободный элемент списка коллайдеров ноды."""
    used = cmds.getAttr(node + ".collider", mi=True) or []
    return (max(used) + 1) if used else 0


# примитив, из которого сделан коллайдер -> какой он коллайдер
OF_PRIM = {"polyPlane": "plane", "polySphere": "sphere",
           "polyCylinder": "capsule", "polyCube": "box"}


def kindOf(obj):
    """Какой это коллайдер: по той цепочке, где он уже стоит, а если его сняли
    со всех - по его собственной форме. Иначе снятый коллайдер нельзя было бы
    подключить обратно."""
    for plug in cmds.listConnections(obj + ".worldMatrix[0]", p=True,
                                     s=False, d=True) or []:
        if plug.endswith(".colliderMatrix"):
            return KINDS.get(cmds.getAttr(plug.replace(".colliderMatrix",
                                                       ".colliderType")))

    for shape in cmds.listRelatives(obj, ad=True, type="mesh", f=True) or []:
        for made in cmds.listConnections(shape + ".inMesh", s=True, d=False) or []:
            kind = OF_PRIM.get(cmds.nodeType(made))
            if kind:
                return kind
    return None


def addCollider(name, obj, kind=None, node=None):
    """Тот же коллайдер ещё одной цепочке.

    Список коллайдеров живёт на ноде, то есть у каждой цепочки свой. Сам
    коллайдер при этом один: его worldMatrix уходит во все цепочки, которые
    должны о него биться. Пол так и делается - одна плоскость на весь риг, а не
    по своей на каждый хвост."""
    node = node or _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)
    if not cmds.objExists(obj):
        cmds.error("%s not found" % obj)

    for plug in cmds.listConnections(obj + ".worldMatrix[0]", p=True,
                                     s=False, d=True) or []:
        if plug.startswith(node + "."):
            print("pk_chainDynamics: %s is already on %s" % (obj, node))
            return plug.split("[")[1].split("]")[0]

    kind = kind or kindOf(obj)
    if kind not in TYPES:
        cmds.error("addCollider: %s is on no chain yet - say which kind it is" % obj)

    i = _free(node)
    plug = "%s.collider[%d]" % (node, i)
    cmds.connectAttr(obj + ".worldMatrix[0]", plug + ".colliderMatrix")
    cmds.setAttr(plug + ".colliderType", TYPES[kind])

    # размеры берутся с самого коллайдера, поэтому у всех цепочек они те же
    _sizes(obj, node, i, kind)

    if cmds.getAttr(node + ".collide") <= 0.0:
        cmds.setAttr(node + ".collide", 1.0)

    print("pk_chainDynamics: %s (%s) added to %s as collider[%d]"
          % (obj, kind, node, i))
    return i


def shareColliders(source, *names):
    """Все коллайдеры одной цепочки - остальным названным. Удобно, когда риг
    собран и надо, чтобы весь он знал про пол и про голову."""
    node = _names(source)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    objs = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        src = cmds.listConnections("%s.collider[%d].colliderMatrix" % (node, i),
                                   s=True, d=False) or []
        if src:
            objs.append(src[0])

    for name in names:
        for obj in objs:
            addCollider(name, obj)

    print("pk_chainDynamics: %d colliders of %s shared with %s"
          % (len(objs), source, ", ".join(names)))
    return objs


def colliders(name="chain", node=None):
    """Коллайдеры цепочки по порядку элементов."""
    node = node or _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    out = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        src = cmds.listConnections("%s.collider[%d].colliderMatrix" % (node, i),
                                   s=True, d=False) or []
        if src:
            out.append(src[0])
    return out


def removeCollider(name, obj, node=None):
    """Снять коллайдер с цепочки. Сам он остаётся в сцене и на других цепочках -
    уходит только элемент списка у этой.

    Удалить коллайдер целиком можно и просто удалив объект: элемент уходит за
    ним следом, у colliderMatrix для этого стоит kDelete. А выключить всю
    коллизию цепочки, ничего не отцепляя, это collide 0.

    Отмена этого не возвращает: элемент массива уходит вместе со связью, и undo
    восстанавливает связь, а не элемент - проверено. Если коллайдер нужен назад,
    подключить его заново, addCollider."""
    node = node or _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    gone = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        plug = "%s.collider[%d]" % (node, i)
        src = cmds.listConnections(plug + ".colliderMatrix", s=True, d=False) or []
        if not src or src[0] != obj:
            continue

        # Отключаем всех детей, а не только матрицу: пока к элементу идёт хоть
        # одна связь, он жив, а матрица у него становится единичной - и на месте
        # пола, которого больше нет, остаётся плоскость в начале координат. У
        # плоскости кроме матрицы подключены size и infinite, и именно на них я
        # на этом и попался. Список берём у самой ноды, чтобы новые дети не
        # завели ту же ошибку заново.
        #
        # А удаляет элемент removeMultiInstance, и без него никак: замерено -
        # ни отключение матрицы, ни отключение всех детей элемент не убирают,
        # остаётся он с единичной матрицей, то есть плоскостью в начале
        # координат. kDelete у colliderMatrix срабатывает только когда удаляют
        # сам объект-коллайдер. В 3.28.33 я решил обратное и вызов убрал -
        # неверно, померил тогда как раз удаление объекта.
        for child in (cmds.attributeQuery("collider", node=node,
                                          listChildren=True) or []):
            at = "%s.%s" % (plug, child)
            for source in cmds.listConnections(at, p=True, s=True, d=False) or []:
                cmds.disconnectAttr(source, at)

        if i in (cmds.getAttr(node + ".collider", mi=True) or []):
            cmds.removeMultiInstance(plug, b=True)
        gone.append(i)

    if not gone:
        cmds.warning("%s: %s is not a collider of this chain" % (name, obj))
    else:
        print("pk_chainDynamics: %s taken off %s (element %s)"
              % (obj, node, ", ".join(str(i) for i in gone)))
    return gone


def clearColliders(name="chain", node=None):
    """Снять с цепочки все коллайдеры. Сами они остаются в сцене."""
    gone = []
    for obj in colliders(name, node):
        gone += removeCollider(name, obj, node)
    print("pk_chainDynamics: %s has no colliders now, %d taken off"
          % (node or _names(name)["node"], len(gone)))
    return gone


def thicknessAt(name="chain"):
    """Толщина у каждой кости: thickness, помноженный на кривую вдоль цепочки.
    Кривая читается той же MRampAttribute, что и в ноде, поэтому числа здесь и
    в расчёте одни и те же."""
    import maya.api.OpenMaya as om

    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    count = len(bones(name)) or len(cmds.getAttr(node + ".goalMatrix", mi=True) or [])
    if count < 1:
        return []

    thickness = cmds.getAttr(node + ".thickness")
    sel = om.MSelectionList()
    sel.add(node + ".thicknessRamp")
    ramp = om.MRampAttribute(sel.getPlug(0))

    out = []
    for i in range(count):
        u = (float(i) / (count - 1)) if count > 1 else 0.0
        out.append(thickness * max(0.0, ramp.getValueAtPosition(u)))
    return out


def thicknessGuide(name="chain", show=True):
    """Показать во вьюпорте, какой толщины цепочка для коллизии.

    Зазор держится у каждой точки свой и во все стороны, то есть настоящая форма
    это шарик вокруг каждой кости. Его и рисуем.

    Шарики - меши, как и коллайдеры, и видны при тех же настройках вьюпорта:
    кривые в анимационном окне часто выключены, и каркас из кругов было бы
    просто не видно. И висят они не под костями, а в своей группе, а матрицу
    берут прямо с ноды, тем же outMatrix - кости в риге обычно спрятаны, а
    спрятанная кость спрятала бы и то, что под ней.

    Размер берётся с ноды готовым - outThickness, то есть thickness уже
    помноженный на кривую. Поэтому и ползунок, и кривая доходят до шариков сами,
    и переставлять их после правок не нужно. show=False убирает."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    grp = name + "_dynThickness"
    if cmds.objExists(grp):
        cmds.delete(grp)
    for old in cmds.ls(name + "_dyn_*_thickness*", name + "_dyn_*_thickness_mul") or []:
        if cmds.objExists(old):
            cmds.delete(old)

    if not show:
        print("pk_chainDynamics: thickness guides of %s removed" % name)
        return []

    sizes = thicknessAt(name)
    if not sizes:
        cmds.error("%s: no joints to show the thickness on" % name)
    if cmds.getAttr(node + ".thickness") <= 0.0:
        cmds.warning(u"%s: thickness is 0 - the chain pushes nothing away, "
                     u"so the balls come out of no size at all" % name)

    cmds.createNode("transform", n=grp)
    cmds.setAttr(grp + ".inheritsTransform", 0)
    top = _names(name)["top"]
    if cmds.objExists(top):
        cmds.parent(grp, top)

    made = []
    for i, size in enumerate(sizes):
        ball = cmds.polySphere(n="%s_dyn_%d_thickness" % (name, i + 1),
                              r=1.0, sx=12, sy=8, ch=True)
        guide = cmds.parent(ball[0], grp)[0]
        cmds.connectAttr("%s.outMatrix[%d]" % (node, i), guide + ".offsetParentMatrix")

        for shape in cmds.listRelatives(guide, s=True, f=True) or []:
            _look(shape)

        # размер берётся с ноды готовым: она сама отдаёт зазор каждой точки,
        # thickness уже помноженный на кривую. Поэтому и ползунок, и кривая
        # доходят до шарика сами, и обновлять руками нечего
        for a in "XYZ":
            cmds.connectAttr("%s.outThickness[%d]" % (node, i), "%s.scale%s" % (guide, a))

        made.append(guide)

    print("pk_chainDynamics: %d thickness guides on %s, radii %s"
          % (len(made), name, " ".join("%.2f" % v for v in sizes)))
    return made


def hasGuides(name="chain"):
    return cmds.objExists(name + "_dynThickness")


def _sizes(loc, node, i, kind):
    """Размеры коллайдера - те же числа, что задают его форму: картинка и расчёт
    не могут разойтись."""
    plug = "%s.collider[%d]" % (node, i)
    if kind == "plane":
        # у плоскости квадрат один на обе стороны, а Y ей не нужен
        for a in "XZ":
            cmds.connectAttr(loc + ".size", plug + ".colliderSize" + a, f=True)
        cmds.connectAttr(loc + ".infinite", plug + ".colliderInfinite", f=True)
        cmds.setAttr(plug + ".colliderRadius", 0.0)
        return

    if kind == "box":
        for a in "XYZ":
            cmds.connectAttr(loc + ".size" + a, plug + ".colliderSize" + a, f=True)
        cmds.setAttr(plug + ".colliderRadius", 0.0)
        return

    cmds.connectAttr(loc + ".radius", plug + ".colliderRadius", f=True)
    if kind == "capsule":
        cmds.connectAttr(loc + ".length", plug + ".colliderLength", f=True)


def reshape(name="chain", node=None):
    """Дать форму коллайдерам, собранным прежней версией - они были локаторами.
    Размеры снимаются с ноды и переезжают на сам коллайдер.

    У кого форма уже есть, тому обновляется вид - цвет и доли примитива, если
    они с тех пор менялись. Ничего не пересобирается, так что звать можно
    сколько угодно."""
    node = node or _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    done = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        plug = "%s.collider[%d]" % (node, i)
        src = cmds.listConnections(plug + ".colliderMatrix", s=True, d=False) or []
        if not src:
            continue

        loc = src[0]
        if _hasShape(loc):
            # форма есть - просто привести к нынешнему виду
            for shape in cmds.listRelatives(loc, ad=True, type="mesh", f=True) or []:
                _look(shape)
            continue

        kind = KINDS.get(cmds.getAttr(plug + ".colliderType"), "plane")
        size = cmds.getAttr(plug + ".colliderRadius")
        length = cmds.getAttr(plug + ".colliderLength")
        if kind in ("plane", "box"):
            size = max(cmds.getAttr(plug + ".colliderSize")[0]) or size

        for shape in cmds.listRelatives(loc, s=True, type="locator") or []:
            cmds.delete(shape)

        _attrs(loc, kind, size if size > 0.0 else 10.0, length if length > 0.0 else 4.0)
        _shape(loc, kind)

        _sizes(loc, node, i, kind)

        done.append(loc)

    print("pk_chainDynamics: %d colliders got a shape, the rest brought up to date%s"
          % (len(done), (": " + ", ".join(done)) if done else ""))
    return done


# =============================================================================
#   Тряска: pk_jiggle
# =============================================================================

JIGGLE_NODE = "pk_jiggle"

# атрибут на контроле -> атрибут ноды, значение по умолчанию, min, max
#
# Все с приставкой jiggle, и не ради красоты: у джоинта есть свой встроенный
# stiffness (double3, для IK-солвера), и настройки часто вешают прямо на кость.
# А ещё на одном контроле может сидеть и цепочка со своими stiffness и damping -
# разойтись им негде, если имена те же.
JIGGLE_SETTINGS = [
    ("jiggle",          "enable",    1,    0,    1),
    ("jiggleWeight",    "weight",    1.0,  0.0,  1.0),
    ("jiggleStiffness", "stiffness", 0.25, 0.0,  1.0),
    ("jiggleDamping",   "damping",   0.35, 0.0,  1.0),
    ("jiggleGravity",   "gravity",   0.0,  None, None),
    ("jiggleTranslate", "translate", 1.0,  0.0,  1.0),
    ("jiggleRotate",    "rotate",    0.0,  0.0,  1.0),
]


def _jiggleNames(joint):
    return {"node": joint + "_jiggle", "driver": joint + "_jiggleDriver"}


def _addJiggleSettings(host, node):
    if not cmds.attributeQuery("jiggleSettings", node=host, exists=True):
        cmds.addAttr(host, ln="jiggleSettings", at="enum", en="Jiggle:", k=0)
        cmds.setAttr(host + ".jiggleSettings", channelBox=True)

    for attr, nodeAttr, dv, mn, mx in JIGGLE_SETTINGS:
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


def jiggleCollider(joint, kind="plane", size=1.0, length=4.0, at=None):
    """Коллайдер этой тряске: plane, sphere, capsule, box - те же, что у
    цепочки. Плоскость по умолчанию бесконечная, у неё есть галка infinite."""
    return collider(joint, kind, size=size, length=length, at=at,
                    node=_jiggleNames(joint)["node"], under="")


def jiggleColliders(joint):
    """Коллайдеры этой тряски по порядку."""
    return colliders(joint, node=_jiggleNames(joint)["node"])


def jiggleAddCollider(joint, obj, kind=None):
    """Тот же коллайдер ещё и этой тряске - объект один на всех."""
    return addCollider(joint, obj, kind, node=_jiggleNames(joint)["node"])


def jiggleRemoveCollider(joint, obj):
    """Снять коллайдер с этой тряски. Сам он остаётся в сцене."""
    return removeCollider(joint, obj, node=_jiggleNames(joint)["node"])


def jiggleClearColliders(joint):
    """Снять все."""
    return clearColliders(joint, node=_jiggleNames(joint)["node"])


# Что у трансформа отдаёт его положение - и что с этим делать.
#
# Мировую матрицу копия отдаёт сама, её и перецепляем как есть. А локальные
# выходы - нет: у копии translate, rotate и scale нули, а matrix единичная,
# потому что её движение целиком живёт в offsetParentMatrix. Замерено:
# потребитель, перецепленный на copy.matrix, получал нули на всех кадрах, а
# оставленный на ctrl.translate - жёсткое движение контрола (5.333 там, где копия
# была на 4.590). Поэтому локальные выходы собираются из мировой матрицы копии,
# переведённой в пространство родителя контрола: это ровно то, что контрол отдавал
# бы, если бы двигался динамически сам. Две ноды на контрол, и только если кому-то
# это и правда нужно.
#
# Пивоты и rotateAxis контрола в это не входят - decomposeMatrix их не знает. У
# контролов rigStudio они нулевые, но если такой попадётся, углы у потребителя
# rotate уедут на величину rotateAxis.
WORLD = ("worldMatrix",)

# атрибут контрола -> откуда его брать у копии
LOCAL = (("matrix",    "matrix", "matrixSum"),
         ("translate", "parts",  "outputTranslate"),
         ("rotate",    "parts",  "outputRotate"),
         ("scale",     "parts",  "outputScale"))


def _localOf(ctrl, copy, make=True):
    """Сеть, которая отдаёт копию так, как контрол отдаёт свои локальные выходы.
    make=False - только имена, ничего не создавая."""
    net = {"matrix": copy + "_dynLocalMatrix", "parts": copy + "_dynLocal"}
    if not make:
        return net

    if not cmds.objExists(net["matrix"]):
        cmds.createNode("multMatrix", n=net["matrix"])
        cmds.connectAttr(copy + ".worldMatrix[0]", net["matrix"] + ".matrixIn[0]")
        # именно родителя контрола: локальные выходы контрола живут в его
        # пространстве, а не в своём собственном
        cmds.connectAttr(ctrl + ".parentInverseMatrix", net["matrix"] + ".matrixIn[1]")
    if not cmds.objExists(net["parts"]):
        cmds.createNode("decomposeMatrix", n=net["parts"])
        cmds.connectAttr(net["matrix"] + ".matrixSum", net["parts"] + ".inputMatrix")
        # порядок поворотов у контролов разный - без этого углы выйдут не те
        cmds.connectAttr(ctrl + ".rotateOrder", net["parts"] + ".inputRotateOrder")
    return net


def _eaters(node, attr):
    """Кто читает этот выход - вместе с детьми: translate и translateX приходят
    как разные связи, и обе надо поймать. Спрашиваем сами связи, а не индексы
    массива: у выходного worldMatrix getAttr -mi отдаёт None даже когда
    worldMatrix[0] кому-то отдан, и перецеплять оказывается нечего."""
    got, seen = [], set()
    for tail in ("", "X", "Y", "Z"):
        if not cmds.attributeQuery(attr + tail, node=node, exists=True):
            continue
        pairs = cmds.listConnections("%s.%s%s" % (node, attr, tail),
                                     p=True, s=False, d=True, c=True) or []
        for i in range(0, len(pairs), 2):
            key = (pairs[i], pairs[i + 1])
            if key not in seen:
                seen.add(key)
                got.append(key)
    return got


def _moveConnections(src, dst, keep):
    """Перецепить с контрола на копию всё, что выдаёт его положение. keep - кого
    не трогать: это водитель тряски, сама копия и её нода - они обязаны слушать
    исходный контрол."""
    moved = 0
    for attr in WORLD:
        for mine, dest in _eaters(src, attr):
            if dest.split(".")[0].split("|")[-1] in keep:
                continue
            cmds.disconnectAttr(mine, dest)
            cmds.connectAttr("%s.%s" % (dst, mine.split(".", 1)[1]), dest, f=True)
            moved += 1

    net = None
    for attr, which, out in LOCAL:
        for mine, dest in _eaters(src, attr):
            if dest.split(".")[0].split("|")[-1] in keep:
                continue
            if net is None:
                net = _localOf(src, dst)
            tail = mine.split(".", 1)[1][len(attr):]      # "" или "X"
            cmds.disconnectAttr(mine, dest)
            cmds.connectAttr("%s.%s%s" % (net[which], out, tail), dest, f=True)
            moved += 1
    return moved


def _backConnections(copy, ctrl):
    """Обратно: мировая матрица напрямую, локальные выходы - с сети, а сама сеть
    удаляется. Без этого removeDynamicCopy оставлял бы висеть две ноды и
    потребителей на них."""
    moved = 0
    for attr in WORLD:
        for mine, dest in _eaters(copy, attr):
            cmds.disconnectAttr(mine, dest)
            cmds.connectAttr("%s.%s" % (ctrl, mine.split(".", 1)[1]), dest, f=True)
            moved += 1

    net = _localOf(ctrl, copy, make=False)
    for attr, which, out in LOCAL:
        if not cmds.objExists(net[which]):
            continue
        for mine, dest in _eaters(net[which], out):
            tail = mine.split(".", 1)[1][len(out):]
            cmds.disconnectAttr(mine, dest)
            cmds.connectAttr("%s.%s%s" % (ctrl, attr, tail), dest, f=True)
            moved += 1
    for one in net.values():
        if cmds.objExists(one):
            cmds.delete(one)
    return moved


def controlOf(obj):
    """Контрол, к которому относится этот объект: сам контрол, его динамическая
    копия, её водитель или её нода - всё ведёт в одно место.

    В аутлайнере копия лежит внутри контрола, ровно там, куда метишь мышкой, и
    выделить её вместо контрола проще всего. Раньше это значило, что снятие тихо
    ничего не делало - у копии своей копии нет, - а сборка потом ругалась, что
    копия уже есть. Теперь обе кнопки понимают, на что показали."""
    if not obj or not cmds.objExists(obj):
        return obj

    if cmds.objectType(obj) == JIGGLE_NODE:                  # нода тряски
        obj = jointOf(obj) or obj
    if obj.endswith("_jiggleDriver"):                 # её водитель
        obj = obj[:-len("_jiggleDriver")]

    short = obj.split("|")[-1]
    if short.endswith("_dyn_ctrl") and cmds.objExists(obj):
        up = (cmds.listRelatives(obj, p=True) or [None])[0]
        if up:
            up = up.split("|")[-1]
            base = up[:-5] if up.endswith("_ctrl") else up
            # именно копия этого контрола, а не контрол с похожим именем
            if base + "_dyn_ctrl" == short:
                return up
    return obj


def rewire(ctrl=None):
    """Перецепить на копию то, что осталось висеть на контроле. Для сцен,
    собранных до того, как локальные выходы стали уводиться тоже: там потребители
    translate, rotate и scale продолжают читать жёсткий контрол, а те, что
    достались copy.matrix, читают нули. Настройки и подкрутка при этом остаются на
    месте - снимать и ставить динамику заново не надо.

    Без аргумента - все динамические копии сцены, сколько бы их ни было."""
    ctrl = controlOf(ctrl)
    if ctrl is None:
        done = 0
        for node in jiggleNodes():
            copy = jointOf(node)
            if not copy or not copy.endswith("_dyn_ctrl"):
                continue          # обычная тряска на кости, а не копия контрола
            host = (cmds.listRelatives(copy, p=True) or [None])[0]
            if host:
                done += rewire(host)
        print("pk_jiggle: %d connections rerouted in the scene" % done)
        return done

    if not cmds.objExists(ctrl):
        cmds.error("%s not found" % ctrl)
    copy = (ctrl[:-5] if ctrl.endswith("_ctrl") else ctrl) + "_dyn_ctrl"
    if not cmds.objExists(copy):
        cmds.error("%s has no dynamic copy" % ctrl)

    n = _jiggleNames(copy)
    keep = set([n["driver"].split("|")[-1], copy.split("|")[-1], n["node"]])
    moved = _moveConnections(ctrl, copy, keep)

    # и те, кому досталась пустая copy.matrix
    net = None
    for mine, dest in _eaters(copy, "matrix"):
        if dest.split(".")[0].split("|")[-1] in keep:
            continue
        if net is None:
            net = _localOf(ctrl, copy)
        cmds.disconnectAttr(mine, dest)
        cmds.connectAttr(net["matrix"] + ".matrixSum", dest, f=True)
        moved += 1

    print("pk_jiggle: %s -> %s, %d connections rerouted" % (ctrl, copy, moved))
    return moved


def dynamicCopy(ctrl, host=None, selectable=False):
    """Динамика на готовый контрол: внутри него появляется его копия, и всё, что
    было в контроле, переезжает в неё.

    Аниматор продолжает крутить свой контрол, а копия идёт за ним с отставанием -
    и с ней идёт всё, что под контролом висело: подконтролы, кости, группы. Тем,
    что слушало матрицу контрола со стороны, тоже отдаётся копия.

    Сам контрол при этом остаётся нетронутым: и анимация, и его место в
    иерархии, и настройки тряски, которые садятся на него же. Поэтому и
    отключить всё это можно одним jiggle 0 - тогда копия стоит ровно на контроле
    и риг ведёт себя точно как раньше.

    Форма копии повторяет форму контрола, но зелёная и невыбираемая: видно, куда
    её уводит, а схватить мышкой вместо контрола нельзя. selectable=True - если
    всё-таки нужно."""
    if not loadPlugin():
        return None
    if not cmds.objExists(ctrl):
        cmds.error("%s not found" % ctrl)

    ctrl = controlOf(ctrl)
    base = ctrl[:-5] if ctrl.endswith("_ctrl") else ctrl
    copy = base + "_dyn_ctrl"
    if cmds.objExists(copy):
        # именно removeDynamicCopy: jiggleDelete() снимает с копии тряску, но саму
        # копию оставляет на месте, и по такому совету не выбраться
        cmds.error("%s already has a dynamic copy - removeDynamicCopy(%r) first"
                   % (ctrl, ctrl))

    # Формы копируем до того, как заведём саму копию: duplicate тащит за собой
    # всё содержимое контрола, и если копия внутри уже есть, в сцене оказываются
    # два объекта с одним именем.
    forms, trash = [], []
    for shape in cmds.listRelatives(ctrl, s=True, f=True) or []:
        tmp = cmds.duplicate(shape, rr=True)[0]
        forms.append(cmds.listRelatives(tmp, s=True, f=True)[0])
        trash.append(tmp)

    # копия внутри контрола и ровно на нём
    copy = cmds.createNode("transform", n=copy, p=ctrl)
    for form in forms:
        made = cmds.parent(form, copy, r=True, s=True)[0]
        made = cmds.rename(made, copy.split("|")[-1] + "Shape")
        cmds.setAttr(made + ".overrideEnabled", 1)
        cmds.setAttr(made + ".overrideColor", COPY_COLOR)
        if not selectable:
            # reference: видно, но мышкой не схватить - контрол остаётся один
            cmds.setAttr(made + ".overrideDisplayType", 2)
    if trash:
        cmds.delete(trash)

    # всё, что было в контроле, переезжает в копию
    kids = [k for k in (cmds.listRelatives(ctrl, c=True, type="transform", f=True) or [])
            if k.split("|")[-1] != copy.split("|")[-1]]
    if kids:
        # relative: локальные значения детей не трогаем. Копия стоит ровно на
        # контроле, так что место у них то же, а вот компенсация, которую Maya
        # пишет без этого флага, впечатала бы в них то, где копию держит тряска
        cmds.parent(kids, copy, r=True)

    made = jiggleBuild(copy, host=host or ctrl)
    if not made:
        return None

    # и то, что слушало матрицу контрола со стороны
    keep = set([made["driver"].split("|")[-1], copy.split("|")[-1], made["node"]])
    moved = _moveConnections(ctrl, copy, keep)

    cmds.select(ctrl)
    print("pk_jiggle: %s -> %s, %d children moved, %d connections rerouted"
          % (ctrl, copy, len(kids), moved))
    made["control"] = ctrl
    made["copy"] = copy
    return made


def removeDynamicCopy(ctrl):
    """Убрать динамику с контрола: дети возвращаются в него, связи тоже, копия и
    её тряска уходят. Контрол остаётся ровно таким, каким был до вызова
    dynamicCopy - иначе всё это было бы дорогой в одну сторону."""
    ctrl = controlOf(ctrl)
    base = ctrl[:-5] if ctrl.endswith("_ctrl") else ctrl
    copy = base + "_dyn_ctrl"
    if not cmds.objExists(copy):
        # имя обязательно назвать: раньше это была единственная дорога, по которой
        # снятие уходило молча и ничего не делало, и понять было нечего
        cmds.warning("pk_jiggle: %s has no dynamic copy - looked for %s"
                     % (ctrl, copy))
        return False

    # дети наружу, пока копию не удалили вместе с ними
    kids = cmds.listRelatives(copy, c=True, type="transform", f=True) or []
    if kids:
        cmds.parent(kids, ctrl, r=True)

    _backConnections(copy, ctrl)

    # Тряска снимается с копии со всей аккуратностью - вернуть место, убрать
    # настройки с контрола, - и любой её шаг может упереться, скажем, в запертый
    # атрибут. Но копия при этом обязана уйти всё равно: полкопии в риге хуже, чем
    # оставшийся атрибут, и собрать заново уже не выйдет. Поэтому её удаление
    # стоит после, в finally, а то, что не получилось, называется вслух.
    try:
        if cmds.objExists(_jiggleNames(copy)["node"]):
            jiggleDelete(copy)
    except Exception as why:
        cmds.warning("pk_jiggle: jiggle of %s left something behind - %s"
                     % (copy, why))
    finally:
        if cmds.objExists(copy):
            cmds.delete(copy)

    # настройки на контроле, если их больше никто не слушает
    for attr, nodeAttr, dv, mn, mx in JIGGLE_SETTINGS:
        if cmds.attributeQuery(attr, node=ctrl, exists=True) and \
                not (cmds.listConnections(ctrl + "." + attr, s=False, d=True) or []):
            _dropAttr(ctrl, attr)
    if cmds.attributeQuery("jiggleSettings", node=ctrl, exists=True) and \
            not cmds.attributeQuery(JIGGLE_SETTINGS[0][0], node=ctrl, exists=True):
        _dropAttr(ctrl, "jiggleSettings")

    cmds.select(ctrl)
    print("pk_jiggle: dynamic copy removed from %s, %d children back" % (ctrl, len(kids)))
    return True


def jiggleHasSettings(obj):
    """Есть ли на объекте настройки тряски."""
    return bool(obj) and cmds.objExists(obj) and \
        cmds.attributeQuery(JIGGLE_SETTINGS[0][0], node=obj, exists=True)


def jointOf(node):
    """Кость, которую ведёт нода."""
    got = cmds.listConnections(node + ".outMatrix", s=False, d=True) or []
    return got[0] if got else None


def hostOf(node):
    """Контрол, на котором живут её настройки."""
    got = cmds.listConnections(node + "." + JIGGLE_SETTINGS[0][1], s=True, d=False) or []
    return got[0] if got else None


def jiggleNodes(host=None):
    """Все тряски сцены, или те, что ведёт этот контрол."""
    if host is None:
        return sorted(cmds.ls(type=JIGGLE_NODE) or [])
    if not jiggleHasSettings(host):
        return []
    got = cmds.listConnections("%s.%s" % (host, JIGGLE_SETTINGS[0][0]),
                               s=False, d=True, type=JIGGLE_NODE) or []
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

    if cmds.nodeType(obj) == JIGGLE_NODE:
        return obj

    # кость: её место приходит из ноды
    for src in cmds.listConnections(obj + ".offsetParentMatrix", s=True, d=False,
                                    type=JIGGLE_NODE) or []:
        return src

    # водитель: его матрица уходит в ноду
    if cmds.attributeQuery("worldMatrix", node=obj, exists=True):
        for dst in cmds.listConnections(obj + ".worldMatrix[0]", s=False, d=True,
                                        type=JIGGLE_NODE) or []:
            return dst

    # контрол с настройками: он может вести сразу несколько
    got = jiggleNodes(obj)
    if got:
        return got[0]

    return None


# каркас кубика одной кривой: обход всех рёбер, не отрывая карандаша
CUBE = [(-1, -1, -1), (1, -1, -1), (1, -1, 1), (-1, -1, 1), (-1, -1, -1),
        (-1, 1, -1), (1, 1, -1), (1, -1, -1), (1, 1, -1), (1, 1, 1),
        (1, -1, 1), (1, 1, 1), (-1, 1, 1), (-1, -1, 1), (-1, 1, 1), (-1, 1, -1)]

# цвет кубика - чтобы он не путался с контролами рига
COPY_COLOR = 17


def _freeName(base):
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

    name = _freeName(name)
    half = max(1e-4, float(size)) * 0.5

    ctrl = cmds.curve(n=name + "_ctrl", d=1,
                      p=[(x * half, y * half, z * half) for x, y, z in CUBE])
    for shape in cmds.listRelatives(ctrl, s=True, f=True) or []:
        cmds.setAttr(shape + ".overrideEnabled", 1)
        cmds.setAttr(shape + ".overrideColor", COPY_COLOR)

    if at:
        if isinstance(at, (list, tuple)):
            cmds.xform(ctrl, ws=True, t=at)
        elif cmds.objExists(at):
            cmds.xform(ctrl, ws=True, m=cmds.xform(at, q=True, ws=True, m=True))
    if parent and cmds.objExists(parent):
        cmds.parent(ctrl, parent)

    joint = cmds.createNode("joint", n=name + "_jnt", p=ctrl)

    made = jiggleBuild(joint, host=ctrl)
    cmds.select(ctrl)
    print("pk_jiggle: %s and %s, settings on %s" % (ctrl, joint, ctrl))
    if made:
        made["control"] = ctrl
    return made


def jiggleBuild(joint, host=None):
    """Тряска на одну кость. host - где собрать настройки; по умолчанию на самой
    кости."""
    if not loadPlugin():
        return None
    if not cmds.objExists(joint):
        cmds.error("%s not found" % joint)

    n = _jiggleNames(joint)
    if cmds.objExists(n["node"]):
        cmds.error("%s already has jiggle - delete(%r) first" % (joint, joint))

    parent = (cmds.listRelatives(joint, p=True, f=True) or [None])[0]

    # водитель помнит, где кость должна быть без тряски: тот же родитель, то же
    # место. Дальше он едет по ригу, а кость идёт за ним с отставанием
    driver = cmds.createNode("transform", n=n["driver"])
    if parent:
        cmds.parent(driver, parent)
    cmds.xform(driver, ws=True, m=cmds.xform(joint, q=True, ws=True, m=True))

    node = cmds.createNode(JIGGLE_NODE, n=n["node"])
    # считать с начала анимации сцены, а не с жёсткого первого кадра: иначе в
    # сцене с нулевого кадра сброс съедает первый шаг движения
    cmds.setAttr(node + ".startFrame", sceneStart())
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

    _addJiggleSettings(host or joint, node)
    cmds.select(host or joint)
    print("pk_jiggle: %s on %s, settings on %s" % (node, joint, host or joint))
    return {"node": node, "driver": driver, "joint": joint}


def jiggleFromSelection(host=None):
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
        made.append(jiggleBuild(joint, host))
    if host:
        cmds.select(host)
    return made


def _dropAttr(host, attr):
    """Убрать наш атрибут с контрола. Он мог быть заперт - запертые каналы на
    контролах дело обычное, - а из-за одного такого атрибута снятие динамики
    валилось целиком, уже после того, как копия удалена."""
    plug = "%s.%s" % (host, attr)
    try:
        if cmds.getAttr(plug, lock=True):
            cmds.setAttr(plug, lock=False)
        cmds.deleteAttr(host, at=attr)
        return True
    except Exception as why:
        cmds.warning("pk_jiggle: %s stays on %s - %s" % (attr, host, why))
        return False


def jiggleDelete(joint):
    """Убрать тряску, кость вернуть как была: место из водителя переезжает ей
    обратно в offsetParentMatrix, чтобы она осталась там же, где стоит."""
    n = _jiggleNames(joint)
    if not cmds.objExists(n["node"]):
        cmds.warning("%s has no jiggle" % joint)
        return

    keep = cmds.getAttr(n["node"] + ".outMatrix")
    src = cmds.listConnections(joint + ".offsetParentMatrix", p=True, s=True, d=False) or []
    if src:
        cmds.disconnectAttr(src[0], joint + ".offsetParentMatrix")
    cmds.setAttr(joint + ".offsetParentMatrix", keep, type="matrix")

    for host in (cmds.listConnections(n["node"] + ".stiffness", s=True, d=False) or []):
        for attr, nodeAttr, dv, mn, mx in JIGGLE_SETTINGS:
            if cmds.attributeQuery(attr, node=host, exists=True):
                others = [c for c in (cmds.listConnections(host + "." + attr, s=False,
                                                           d=True) or [])
                          if c != n["node"]]
                if not others:
                    _dropAttr(host, attr)
        if cmds.attributeQuery("jiggleSettings", node=host, exists=True) and \
                not cmds.attributeQuery(JIGGLE_SETTINGS[0][0], node=host, exists=True):
            _dropAttr(host, "jiggleSettings")

    cmds.delete(n["node"])
    if cmds.objExists(n["driver"]):
        cmds.delete(n["driver"])
    print("pk_jiggle: jiggle removed from %s" % joint)


# =============================================================================
#   Окно
# =============================================================================

WIN = "pkChainDynWindow"
SUFFIX = "_chainDynamics"

# что показывать слайдером: атрибут контрола, подпись, границы слайдера и поля
SLIDERS = [
    ("stiffness",      u"Stiffness",       0.0, 1.0,   0.0, 1.0),
    ("damping",        u"Damping",         0.0, 1.0,   0.0, 1.0),
    ("stretch",        u"Stretch",         0.0, 3.0,   0.0, 1000.0),
    ("stretchDamping", u"Stretch damping", 0.0, 1.0,   0.0, 1.0),
    ("gravity",        u"Gravity",         0.0, 1000.0, 0.0, 100000.0),
    ("dynamicWeight",  u"Weight",          0.0, 1.0,   0.0, 1.0),
    ("localTranslate", u"Local translate", 0.0, 1.0,   0.0, 1.0),
    ("localRotate",    u"Local rotate",    0.0, 1.0,   0.0, 1.0),
]

# то же для тряски
JSLIDERS = [
    ("jiggleStiffness", u"Stiffness", 0.0, 1.0,    0.0, 1.0),
    ("jiggleDamping",   u"Damping",   0.0, 1.0,    0.0, 1.0),
    ("jiggleGravity",   u"Gravity",   0.0, 1000.0, 0.0, 100000.0),
    ("jiggleWeight",    u"Weight",    0.0, 1.0,    0.0, 1.0),
    ("jiggleTranslate", u"Translate", 0.0, 1.0,    0.0, 1.0),
    ("jiggleRotate",    u"Rotate",    0.0, 1.0,    0.0, 1.0),
]

# то, что настраивают редко - на самой ноде, обычными полями. outputCount тут
# нет нарочно: число точек ставит сборщик вместе с числом костей, и менять его
# врозь незачем - для этого есть поле Bones
NODE_ATTRS = ["maxBend", "bendSoftness", "substeps", "stretchLimit"]
JNODE_ATTRS = ["axisScale", "limit", "substeps"]

# атрибут контрола -> атрибут ноды, чтобы найти, кто его ведёт
NODE_OF = dict((attr, nodeAttr) for attr, nodeAttr, _dv, _mn, _mx in SETTINGS)
JNODE_OF = dict((attr, nodeAttr) for attr, nodeAttr, _dv, _mn, _mx in JIGGLE_SETTINGS)

_state = {"name": None, "jiggle": None, "playback": None}

# на сколько кадров вперёд уводится диапазон в живом просмотре
LIVE_FRAMES = 100000


# --- поиск ------------------------------------------------------------------

def solverFrom(obj):
    """Нода цепочки, к которой относится объект: сам контрол, его кость, шейп
    или что-то, что висит под контролом. Связи ищутся по типу ноды, а не по
    именам - переименованная цепочка находится так же."""
    if not obj or not cmds.objExists(obj):
        return None

    seen = set()
    walk = [obj]
    for _ in range(64):
        if not walk:
            break
        current = walk.pop(0)
        if current in seen:
            continue
        seen.add(current)

        found = cmds.listConnections(current, type=NODE) or []
        if found:
            return found[0]

        # шейпы контрола и вверх по иерархии - выделить могли что угодно
        walk += cmds.listRelatives(current, s=True, f=False) or []
        walk += cmds.listRelatives(current, p=True, f=False) or []

    return None


def _driver(node, nodeAttr, has=None):
    """Плаг контрола, который правда ведёт эту настройку этой ноды. Настройки
    могли перенести на кастомный контрол, связать с общим, а на одной из них
    связь разорвать - слайдер должен менять того, кого он и меняет."""
    has = has or hasSettings
    src = cmds.listConnections("%s.%s" % (node, nodeAttr), s=True, d=False, p=True) or []
    if not src:
        return None

    plug = src[0]
    for _ in range(8):
        up = cmds.listConnections(plug, s=True, d=False, p=True) or []
        # выше может быть и анимация - у неё настроек нет, и мы остаёмся здесь
        if not up or not has(up[0].split(".")[0]):
            break
        plug = up[0]
    return plug


def nameOf(node):
    """Имя цепочки по имени ноды - его ждут функции скрипта."""
    if node and node.endswith(SUFFIX):
        return node[:-len(SUFFIX)]
    return node


def pick(quiet=False):
    """Взять по выделению то, что там есть - цепочку или тряску, - и открыть
    закладку, которой это принадлежит."""
    for obj in cmds.ls(sl=True, o=True) or []:
        node = solverFrom(obj)
        if node:
            attach(nameOf(node))
            _tab(0)
            return nameOf(node)

    for obj in cmds.ls(sl=True, o=True) or []:
        node = nodeFrom(obj)
        if node:
            attachJiggle(node)
            _tab(1)
            return node

    if not quiet:
        cmds.warning(u"pk dynamics: select a control or a bone of a chain, "
                     u"or a bone that has jiggle")
    return None


def _tab(index):
    tabs = WIN + "_tabs"
    if cmds.control(tabs, exists=True):
        cmds.tabLayout(tabs, e=True, sti=index + 1)


# --- цепочка ----------------------------------------------------------------

def attach(name):
    """Перестроить содержимое окна под цепочку name."""
    _state["name"] = name
    if cmds.window(WIN, exists=True):
        _fill()


def _root(name):
    """Корневой контрол цепочки - первая цель ноды."""
    node = _names(name)["node"]
    src = cmds.listConnections(node + ".goalMatrix[0]", s=True, d=False) or []
    return src[0] if src else None


def _host(name):
    """Контрол, на котором живут настройки. Это не обязательно корень цепочки:
    ручки могли перенести на кастомный контрол, а могли и связать с общим -
    тогда идём по связям до того, кто их правда ведёт, чтобы слайдеры в окне
    были рабочими, а не заблокированными."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        return None

    first = SETTINGS[0][0]
    src = cmds.listConnections(node + "." + SETTINGS[0][1],
                               s=True, d=False, p=True) or []
    host = src[0].split(".")[0] if src else None
    if not host:
        root = cmds.listConnections(node + ".goalMatrix[0]", s=True, d=False) or []
        return root[0] if root else None

    for _ in range(8):
        up = cmds.listConnections("%s.%s" % (host, first), s=True, d=False, p=True) or []
        if not up:
            break
        above = up[0].split(".")[0]
        # выше может оказаться анимация или что-то ещё, что настройкой не
        # является - тогда остаёмся здесь
        if not hasSettings(above):
            break
        host = above

    return host


def _clear(body):
    for child in cmds.columnLayout(body, q=True, childArray=True) or []:
        cmds.deleteUI(body + "|" + child)
    cmds.setParent(body)


def _fill():
    body = WIN + "_body"
    if not cmds.control(body, exists=True):
        return
    _clear(body)

    name = _state["name"]
    node = _names(name)["node"] if name else None
    host = _host(name) if name else None

    if not host or not cmds.objExists(node):
        cmds.text(l=u"   no chain taken", al="left", h=28)
        cmds.text(l=u"   select one of its controls and press Pick, or build a new one",
                  al="left", h=20)
        return

    goals = len(cmds.getAttr(node + ".goalMatrix", mi=True) or [])
    bones = len(cmds.listConnections(node + ".outMatrix", s=False, d=True) or [])
    where = u"" if host == _root(name) else (u", settings on %s" % host)
    cmds.text(l=u"   %s: %d controls, %d bones%s" % (name, goals, bones, where),
              al="left", h=26)

    cmds.frameLayout(l=u"Settings", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True)

    def plugOf(attr):
        got = _driver(node, NODE_OF.get(attr, attr))
        if got:
            return got
        return (host + "." + attr) if cmds.attributeQuery(attr, node=host,
                                                          exists=True) else None

    for attr, label in ((u"dynamic", u"Dynamic"), (u"startFrame", u"Start frame")):
        plug = plugOf(attr)
        if plug:
            cmds.attrControlGrp(a=plug, l=label)

    for attr, label, lo, hi, flo, fhi in SLIDERS:
        plug = plugOf(attr)
        if not plug:
            continue
        cmds.attrFieldSliderGrp(at=plug, l=label, min=lo, max=hi,
                                fmn=flo, fmx=fhi, pre=3, cw3=(110, 60, 180))
    cmds.button(l=u"Move the settings onto the selected control", h=26,
                c=lambda *a: _moveSettings(),
                ann=u"Select the control that has the settings and the one to "
                    u"move them to")
    cmds.button(l=u"Link settings: the first drives the second", h=26,
                c=lambda *a: _linkSettings(),
                ann=u"Select two controls with settings - the second will follow "
                    u"the first. That is how several chains go under one control")
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"Dynamics weight along the chain", cll=True, cl=False, mw=4, mh=4)
    cmds.gradientControl(at=node + ".weightRamp", h=110)
    cmds.setParent("..")

    # раздела нет, если плагин старой сборки, без коллизии
    if cmds.attributeQuery("collide", node=node, exists=True):
        made = len(cmds.getAttr(node + ".collider", mi=True) or [])
        cmds.frameLayout(l=u"Collision%s" % (u": %d" % made if made else u""),
                         cll=True, cl=False, mw=4, mh=4)
        cmds.columnLayout(adj=True)
        for attr, label, hi in ((u"collide", u"Collide", 1.0),
                                (u"thickness", u"Thickness", 3.0),
                                (u"bounce", u"Bounce", 1.0),
                                (u"friction", u"Friction", 1.0)):
            cmds.attrFieldSliderGrp(at=node + "." + attr, l=label, min=0.0, max=hi,
                                    fmn=0.0, fmx=1000.0, pre=3, cw3=(110, 60, 180))
        if cmds.attributeQuery("thicknessRamp", node=node, exists=True):
            cmds.text(l=u"   thickness along the chain", al="left", h=18)
            cmds.gradientControl(at=node + ".thicknessRamp", h=90)
        cmds.checkBox(WIN + "_guide", l=u"Show the thickness in the viewport",
                      v=hasGuides(name),
                      cc=lambda on: _guide(on),
                      ann=u"A ball around every bone - that is the gap the chain "
                          u"keeps. Changed the curve? Toggle this again")
        cmds.optionMenu(WIN + "_colliderKind", l=u"Shape")
        for kind in ("plane", "sphere", "capsule", "box"):
            cmds.menuItem(l=kind)
        cmds.floatFieldGrp(WIN + "_colliderSize", nf=2, l=u"Radius / length",
                           v1=1.0, v2=4.0, cw3=(110, 60, 60), pre=2,
                           ann=u"For a plane and a box the radius is their size; "
                               u"the length is the capsule's only. A plane is "
                               u"endless until its infinite is turned off")
        cmds.button(l=u"Add a collider", h=26, c=lambda *a: _collider(),
                    ann=u"It appears at the middle of the chain - drag it from there")
        cmds.button(l=u"Give the colliders to the selected chains", h=26,
                    c=lambda *a: _shareColliders(),
                    ann=u"Select controls or bones of other chains - every collider "
                        u"of this one becomes theirs too, and stays one object")
        cmds.button(l=u"Take the selected colliders off", h=26,
                    c=lambda *a: _dropColliders(),
                    ann=u"Select colliders - they leave this chain's list but stay "
                        u"in the scene and on the other chains. To switch the whole "
                        u"collision off without unhooking anything, set Collide to 0")
        cmds.setParent("..")
        cmds.setParent("..")

    cmds.frameLayout(l=u"Chain", cll=True, cl=True, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    cmds.rowLayout(nc=2, cw2=(150, 190))
    cmds.intFieldGrp(WIN + "_bones", v1=bones, l=u"Bones", cw2=(70, 60),
                     cc=lambda *a: _setJoints())
    cmds.button(l=u"Apply", c=lambda *a: _setJoints())
    cmds.setParent("..")
    cmds.button(l=u"Reread the controls (rebuild)", h=26, c=lambda *a: _rebuild(),
                ann=u"When controls were added, removed or reordered")
    cmds.rowLayout(nc=3, cw3=(150, 130, 60))
    cmds.floatFieldGrp(WIN + "_radius", l=u"Radius", v1=0.5, cw2=(70, 60), pre=3,
                       ann=u"0 - by the length of the chain")
    cmds.intFieldGrp(WIN + "_sides", l=u"Sides", v1=8, cw2=(60, 50))
    cmds.setParent("..")
    cmds.button(l=u"Cylinder with skin", h=26, c=lambda *a: _cylinder(),
                ann=u"A cylinder on the bones, one split per bone")
    cmds.button(l=u"Delete the chain", h=26, c=lambda *a: _delete())
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"Node", cll=True, cl=True, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    for attr in NODE_ATTRS:
        if cmds.attributeQuery(attr, node=node, exists=True):
            cmds.attrControlGrp(a=node + "." + attr)
    cmds.setParent("..")
    cmds.setParent("..")


# --- тряска -----------------------------------------------------------------

def attachJiggle(node):
    """Перестроить вторую закладку под эту тряску."""
    _state["jiggle"] = node
    if cmds.window(WIN, exists=True):
        _jfill()


def _jfill():
    body = WIN + "_jbody"
    if not cmds.control(body, exists=True):
        return
    _clear(body)

    node = _state["jiggle"]
    if not node or not cmds.objExists(node):
        cmds.text(l=u"   no jiggle taken", al="left", h=28)
        cmds.text(l=u"   select a bone that has jiggle and press Pick, or make one",
                  al="left", h=20)
        return

    joint = jointOf(node)
    host = hostOf(node)
    family = jiggleNodes(host)
    more = u"" if len(family) < 2 else (u", with %d more bones" % (len(family) - 1))
    cmds.text(l=u"   %s: settings on %s%s" % (joint or node, host or u"?", more),
              al="left", h=26)

    cmds.frameLayout(l=u"Settings", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True)

    def plugOf(attr):
        got = _driver(node, JNODE_OF.get(attr, attr), jiggleHasSettings)
        if got:
            return got
        return (host + "." + attr) if host and cmds.attributeQuery(
            attr, node=host, exists=True) else None

    plug = plugOf(u"jiggle")
    if plug:
        cmds.attrControlGrp(a=plug, l=u"Jiggle")
    # startFrame у тряски не выносится на контрол - он на самой ноде
    cmds.attrControlGrp(a=node + ".startFrame", l=u"Start frame")

    for attr, label, lo, hi, flo, fhi in JSLIDERS:
        plug = plugOf(attr)
        if not plug:
            continue
        cmds.attrFieldSliderGrp(at=plug, l=label, min=lo, max=hi,
                                fmn=flo, fmx=fhi, pre=3, cw3=(110, 60, 180))
    cmds.setParent("..")
    cmds.setParent("..")

    # раздела нет, если плагин старой сборки, без коллизии
    if cmds.attributeQuery("collide", node=node, exists=True):
        made = len(cmds.getAttr(node + ".collider", mi=True) or [])
        cmds.frameLayout(l=u"Collision%s" % (u": %d" % made if made else u""),
                         cll=True, cl=False, mw=4, mh=4)
        cmds.columnLayout(adj=True)
        for attr, label, hi in ((u"collide", u"Collide", 1.0),
                                (u"thickness", u"Thickness", 3.0),
                                (u"bounce", u"Bounce", 1.0),
                                (u"friction", u"Friction", 1.0)):
            cmds.attrFieldSliderGrp(at=node + "." + attr, l=label, min=0.0, max=hi,
                                    fmn=0.0, fmx=1000.0, pre=3, cw3=(110, 60, 180))
        cmds.optionMenu(WIN + "_jcolKind", l=u"Shape")
        for kind in ("plane", "sphere", "capsule", "box"):
            cmds.menuItem(l=kind)
        cmds.floatFieldGrp(WIN + "_jcolSize", nf=2, l=u"Radius / length",
                           v1=1.0, v2=4.0, cw3=(110, 60, 60), pre=2,
                           ann=u"For a plane and a box the radius is their size; "
                               u"the length is the capsule's only. A plane is "
                               u"endless until its infinite is turned off")
        cmds.button(l=u"Add a collider", h=26, c=lambda *a: _jiggleCollider(),
                    ann=u"It appears at the bone - drag it where it belongs")
        cmds.button(l=u"Take the selected colliders off", h=26,
                    c=lambda *a: _jiggleDropColliders(),
                    ann=u"They leave this bone's list but stay in the scene and on "
                        u"whatever else uses them. To switch the whole collision "
                        u"off without unhooking anything, set Collide to 0")
        cmds.setParent("..")
        cmds.setParent("..")

    cmds.frameLayout(l=u"This bone", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    for attr in JNODE_ATTRS:
        if cmds.attributeQuery(attr, node=node, exists=True):
            cmds.attrControlGrp(a=node + "." + attr)
    cmds.button(l=u"Select the driver", h=26, c=lambda *a: _jiggleDriver(),
                ann=u"The transform that remembers where the bone belongs with no "
                    u"jiggle at all. It rides the rig; the bone follows it late")
    cmds.button(l=u"Remove the jiggle from the selected bones", h=26,
                c=lambda *a: _jiggleRemove(),
                ann=u"The bone stays exactly where it is now")
    cmds.setParent("..")
    cmds.setParent("..")


# --- живой просмотр ---------------------------------------------------------

def live(on):
    """Проигрывание вперёд, пока его не выключат: контролы во время него
    двигаются, а нода на каждом кадре делает свой шаг - это и есть живой
    просмотр динамики.

    Стоя на месте нода нарочно не шевелится: тот же кадр всегда считается
    одинаково, иначе ни сцраб, ни кеш не были бы предсказуемы. Поэтому время
    должно идти.

    Диапазон уводится далеко вперёд, а не зацикливается: на возврате к началу
    время идёт назад, и цепочка честно сбрасывается - дёргалась бы на каждом
    круге. Что изменено, то и возвращается на место при выключении."""
    if on:
        if _state["playback"] is not None:
            return
        now = cmds.currentTime(q=True)
        _state["playback"] = {
            "time": now,
            "min": cmds.playbackOptions(q=True, min=True),
            "max": cmds.playbackOptions(q=True, max=True),
            "ast": cmds.playbackOptions(q=True, ast=True),
            "aet": cmds.playbackOptions(q=True, aet=True),
            "loop": cmds.playbackOptions(q=True, loop=True),
        }
        cmds.playbackOptions(ast=now, aet=now + LIVE_FRAMES,
                             min=now, max=now + LIVE_FRAMES, loop="once")
        cmds.play(state=True, forward=True)
        return

    was = _state["playback"]
    _state["playback"] = None
    cmds.play(state=False)
    if was:
        cmds.playbackOptions(ast=was["ast"], aet=was["aet"],
                             min=was["min"], max=was["max"], loop=was["loop"])
        cmds.currentTime(was["time"])


def _liveOff():
    """Выключить, если окно закрыли или сцену сменили, не сняв галку."""
    if _state["playback"] is not None:
        live(False)


# --- действия: цепочка ------------------------------------------------------

def _need():
    name = _state["name"]
    if not name or not cmds.objExists(_names(name)["node"]):
        cmds.warning(u"pk chain: no chain taken")
        return None
    return name


def _setJoints():
    name = _need()
    if name:
        setJoints(name, cmds.intFieldGrp(WIN + "_bones", q=True, v1=True))
        _fill()


def _twoSelected(what):
    sel = cmds.ls(sl=True, o=True) or []
    if len(sel) != 2:
        cmds.warning(u"pk chain: select exactly two controls - %s" % what)
        return None, None
    return sel[0], sel[1]


def _moveSettings():
    """Настройки уезжают на второй выделенный. Порядок можно не соблюдать:
    источник тот, на котором они есть."""
    a, b = _twoSelected(u"the one that has the settings and the one to move them to")
    if not a:
        return

    if not hasSettings(a) and hasSettings(b):
        a, b = b, a
    if not hasSettings(a):
        cmds.warning(u"pk chain: neither of the selected controls has dynamic settings")
        return
    if hasSettings(b):
        cmds.warning(u"pk chain: %s already has settings - for two masters there is "
                     u"the other button, the linking one" % b)
        return

    moveSettings(a, b)
    _fill()


def _linkSettings():
    """Второй выделенный идёт за первым."""
    a, b = _twoSelected(u"the driving one and the driven one")
    if not a:
        return
    if not hasSettings(a):
        cmds.warning(u"pk chain: %s has no dynamic settings" % a)
        return

    linkSettings(a, b)
    _fill()


def _later(fn):
    """Перестроить окно не из коллбэка кнопки, а следующим делом: иначе кнопка
    сносит те самые контролы, из которых её и нажали."""
    cmds.evalDeferred(fn, lowestPriority=True)


def _guide(on):
    name = _need()
    if not name:
        return
    thicknessGuide(name, bool(on))


def _collider():
    name = _need()
    if not name:
        return
    kind = cmds.optionMenu(WIN + "_colliderKind", q=True, v=True)
    size = cmds.floatFieldGrp(WIN + "_colliderSize", q=True, v1=True)
    length = cmds.floatFieldGrp(WIN + "_colliderSize", q=True, v2=True)

    # у середины цепочки, а не в начале координат: оттуда его видно и оттуда
    # удобно тащить туда, где он нужен
    at = None
    bones = bones(name)
    if bones:
        at = cmds.xform(bones[len(bones) // 2], q=True, ws=True, t=True)

    collider(name, kind, size=size, length=length, at=at)
    _later(_fill)


def _otherChains(name):
    """Цепочки выделенных объектов, кроме той, с которой окно работает."""
    out = []
    for obj in cmds.ls(sl=True, o=True) or []:
        node = solverFrom(obj)
        if not node:
            continue
        other = nameOf(node)
        if other != name and other not in out:
            out.append(other)
    return out


def _shareColliders():
    name = _need()
    if not name:
        return

    if not colliders(name):
        cmds.warning(u"pk chain: %s has no colliders to give" % name)
        return

    others = _otherChains(name)
    if not others:
        cmds.warning(u"pk chain: select controls or bones of the chains "
                     u"to give the colliders to")
        return

    shareColliders(name, *others)
    _later(_fill)


def _dropColliders():
    name = _need()
    if not name:
        return

    mine = colliders(name)
    picked = [o for o in cmds.ls(sl=True, o=True) or [] if o in mine]
    if not picked:
        cmds.warning(u"pk chain: select colliders of this chain - "
                     u"there is nothing to take off")
        return

    cmds.undoInfo(openChunk=True, chunkName="pk chain: drop colliders")
    try:
        for obj in picked:
            removeCollider(name, obj)
    finally:
        cmds.undoInfo(closeChunk=True)
    _later(_fill)


def _rebuild():
    name = _need()
    if name:
        rebuild(name)
        _fill()


def _cylinder():
    name = _need()
    if not name:
        return
    radius = cmds.floatFieldGrp(WIN + "_radius", q=True, v1=True)
    sides = cmds.intFieldGrp(WIN + "_sides", q=True, v1=True)
    cylinder(name, radius=(radius if radius > 0 else None), sides=max(3, sides))


def _delete():
    name = _need()
    if not name:
        return
    if cmds.confirmDialog(t=u"Delete the chain", m=u"Delete %s?" % name,
                          b=[u"Delete", u"Cancel"], db=u"Cancel",
                          cb=u"Cancel") != u"Delete":
        return
    delete(name)
    _state["name"] = None
    _fill()


def _fromSelection():
    name = cmds.textFieldGrp(WIN + "_name", q=True, tx=True).strip() or "chain"
    if cmds.objExists(_names(name)["node"]):
        cmds.warning(u"pk chain: %s already exists - take it with Pick "
                     u"or give another name" % name)
        return
    r = fromSelection(name, joints=cmds.intFieldGrp(WIN + "_new", q=True, v2=True))
    if r:
        attach(name)
        _tab(0)


def _build():
    name = cmds.textFieldGrp(WIN + "_name", q=True, tx=True).strip() or "chain"
    if cmds.objExists(_names(name)["top"]):
        cmds.warning(u"pk chain: %s already exists - take it with Pick "
                     u"or give another name" % name)
        return
    count = cmds.intFieldGrp(WIN + "_new", q=True, v1=True)
    joints = cmds.intFieldGrp(WIN + "_new", q=True, v2=True)
    length = cmds.floatFieldGrp(WIN + "_len", q=True, v1=True)
    axis = cmds.optionMenu(WIN + "_axis", q=True, v=True)
    r = build(name, count=count, length=length, axis=axis, joints=joints)
    if r:
        attach(name)
        _tab(0)


# --- действия: тряска -------------------------------------------------------

def _needJiggle():
    node = _state["jiggle"]
    if not node or not cmds.objExists(node):
        cmds.warning(u"pk jiggle: no jiggle taken")
        return None
    return node


def _jiggleHost():
    """Контрол из поля, если он там есть и существует."""
    host = cmds.textFieldGrp(WIN + "_jhost", q=True, tx=True).strip()
    if not host:
        return None
    if not cmds.objExists(host):
        cmds.warning(u"pk jiggle: %s not found - leave the field empty to put the "
                     u"settings on the bones themselves" % host)
        return False
    return host


def _jiggleGrab():
    """Взять выделенное в поле контрола."""
    sel = cmds.ls(sl=True, o=True) or []
    if sel:
        cmds.textFieldGrp(WIN + "_jhost", e=True, tx=sel[0])


def _jiggleBuild():
    host = _jiggleHost()
    if host is False:
        return

    made = jiggleFromSelection(host=host)
    if made:
        attachJiggle(made[-1]["node"])
        _later(_jfill)


def _jiggleControl():
    """Кубик с костью: если что-то выделено - на его месте и под ним."""
    sel = cmds.ls(sl=True, o=True, type="transform") or []
    where = sel[0] if sel else None
    size = cmds.floatFieldGrp(WIN + "_jsize", q=True, v1=True)

    made = buildControl(size=size, at=where, parent=where)
    if made:
        attachJiggle(made["node"])
        _later(_jfill)


def _jiggleOnControl():
    """Динамика на выделенные контролы: копия внутри каждого."""
    sel = [o for o in (cmds.ls(sl=True, o=True, type="transform") or [])]
    if not sel:
        cmds.warning(u"pk jiggle: select the controls that should have dynamics")
        return

    made = None
    cmds.undoInfo(openChunk=True, chunkName="pk jiggle: dynamics on controls")
    try:
        for ctrl in sel:
            made = dynamicCopy(ctrl) or made
    finally:
        cmds.undoInfo(closeChunk=True)

    if made:
        attachJiggle(made["node"])
        _later(_jfill)


def _jiggleOffControl():
    """И обратно - всё возвращается в контрол."""
    sel = [o for o in (cmds.ls(sl=True, o=True, type="transform") or [])]
    if not sel:
        cmds.warning(u"pk jiggle: select the controls to take the dynamics off")
        return

    gone = 0
    cmds.undoInfo(openChunk=True, chunkName="pk jiggle: dynamics off controls")
    try:
        for ctrl in sel:
            if removeDynamicCopy(ctrl):
                gone += 1
    finally:
        cmds.undoInfo(closeChunk=True)

    # кнопка, нажатая на том, у чего динамики нет, должна сказать об этом, а не
    # оставить думать, что она сработала
    if not gone:
        cmds.warning(u"pk jiggle: nothing had dynamics on it - select the controls "
                     u"that do, or their green copies")

    _state["jiggle"] = None
    _later(_jfill)


def _jiggleRemove():
    """Снять тряску с выделенных костей - или с той, что взята в окне."""
    picked = []
    for obj in cmds.ls(sl=True, o=True) or []:
        node = nodeFrom(obj)
        if node and node not in picked:
            picked.append(node)
    if not picked:
        node = _needJiggle()
        if not node:
            return
        picked = [node]

    cmds.undoInfo(openChunk=True, chunkName="pk jiggle: remove")
    try:
        for node in picked:
            joint = jointOf(node)
            if joint:
                jiggleDelete(joint)
    finally:
        cmds.undoInfo(closeChunk=True)

    if _state["jiggle"] in picked:
        _state["jiggle"] = None
    _later(_jfill)


def _jiggleCollider():
    node = _needJiggle()
    if not node:
        return

    kind = cmds.optionMenu(WIN + "_jcolKind", q=True, v=True)
    size = cmds.floatFieldGrp(WIN + "_jcolSize", q=True, v1=True)
    length = cmds.floatFieldGrp(WIN + "_jcolSize", q=True, v2=True)

    joint = jointOf(node)
    at = cmds.xform(joint, q=True, ws=True, t=True) if joint else None
    jiggleCollider(joint, kind, size=size, length=length, at=at)
    _later(_jfill)


def _jiggleDropColliders():
    node = _needJiggle()
    if not node:
        return

    joint = jointOf(node)
    mine = jiggleColliders(joint)
    picked = [o for o in cmds.ls(sl=True, o=True) or [] if o in mine]
    if not picked:
        cmds.warning(u"pk jiggle: select colliders of this bone - "
                     u"there is nothing to take off")
        return

    cmds.undoInfo(openChunk=True, chunkName="pk jiggle: drop colliders")
    try:
        for obj in picked:
            jiggleRemoveCollider(joint, obj)
    finally:
        cmds.undoInfo(closeChunk=True)
    _later(_jfill)


def _jiggleDriver():
    node = _needJiggle()
    if not node:
        return
    src = cmds.listConnections(node + ".inMatrix", s=True, d=False) or []
    if src:
        cmds.select(src[0])


# --- сборка окна ------------------------------------------------------------

def show():
    if not loadPlugin():
        return

    if cmds.window(WIN, exists=True):
        cmds.deleteUI(WIN)

    cmds.window(WIN, t=u"pk dynamics", wh=(420, 700), mnb=True, mxb=False)
    cmds.columnLayout(adj=True, rs=2)

    cmds.rowLayout(nc=2, adj=1, cw2=(300, 100))
    cmds.textFieldGrp(WIN + "_name", l=u"Name", tx="chain", cw2=(40, 250))
    cmds.button(l=u"Pick", h=26, c=lambda *a: pick(),
                ann=u"Take whatever is selected - a chain's control or bone, "
                    u"or a bone that has jiggle")
    cmds.setParent("..")

    cmds.checkBox(WIN + "_live", l=u"Live preview - move the controls and watch",
                  v=False, onc=lambda *a: live(True), ofc=lambda *a: live(False),
                  ann=u"Playback runs forward while this is on: standing still the "
                      u"node does not move, so the time has to. Turn it off and the "
                      u"time and the range come back where they were")

    cmds.tabLayout(WIN + "_tabs", innerMarginWidth=4, innerMarginHeight=4)

    # --- закладка цепочек
    chain = cmds.columnLayout(adj=True, rs=2)
    cmds.frameLayout(l=u"Create", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True, rs=2)
    cmds.intFieldGrp(WIN + "_new", nf=2, l=u"Controls / bones", v1=5, v2=10,
                     cw3=(120, 60, 60),
                     ann=u"0 bones - one per control")
    cmds.rowLayout(nc=2, cw2=(230, 150))
    cmds.floatFieldGrp(WIN + "_len", l=u"Length", v1=10.0, cw2=(60, 70), pre=2)
    cmds.optionMenu(WIN + "_axis", l=u"Axis")
    for a in ("x", "y", "z", "-x", "-y", "-z"):
        cmds.menuItem(l=a)
    cmds.setParent("..")
    cmds.button(l=u"Chain from scratch", h=28, c=lambda *a: _build(),
                ann=u"Controls, the node and the bones, from the origin")
    cmds.button(l=u"From the selected controls", h=28, c=lambda *a: _fromSelection(),
                ann=u"Select the root of the chain and the rest is found down the "
                    u"hierarchy; or select every control in order")
    cmds.setParent("..")
    cmds.setParent("..")
    cmds.columnLayout(WIN + "_body", adj=True, rs=2)
    cmds.setParent("..")
    cmds.setParent("..")

    # --- закладка тряски
    shake = cmds.columnLayout(adj=True, rs=2)
    cmds.frameLayout(l=u"Create", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True, rs=2)
    cmds.rowLayout(nc=2, adj=1, cw2=(300, 60))
    cmds.textFieldGrp(WIN + "_jhost", l=u"Settings on", tx="", cw2=(80, 210),
                      ann=u"A control to gather the settings on. Empty - they go "
                          u"on the bones themselves")
    cmds.button(l=u"<<", h=26, c=lambda *a: _jiggleGrab(),
                ann=u"Take the selected object")
    cmds.setParent("..")
    cmds.button(l=u"Jiggle on the selected bones", h=28, c=lambda *a: _jiggleBuild(),
                ann=u"A belly, a cheek, a jaw of fat: the bone follows the rig with "
                    u"weight of its own. It stays where it is in the skeleton")
    cmds.rowLayout(nc=2, adj=1, cw2=(240, 120))
    cmds.floatFieldGrp(WIN + "_jsize", l=u"Size", v1=1.0, cw2=(80, 60), pre=2)
    cmds.setParent("..")
    cmds.button(l=u"Control with a bone", h=28, c=lambda *a: _jiggleControl(),
                ann=u"A cube control, a bone under it and the jiggle on that bone - "
                    u"something to try it on. Select a transform first and it lands "
                    u"there, under it, so it rides the rig")
    cmds.button(l=u"Dynamics on the selected controls", h=28,
                c=lambda *a: _jiggleOnControl(),
                ann=u"A copy of the control appears inside it and takes everything "
                    u"the control held - sub-controls, bones, and whatever listened "
                    u"to its matrix. You keep animating the control; the copy, and "
                    u"all of that with it, follows late. Jiggle 0 and the rig is "
                    u"exactly as it was")
    cmds.button(l=u"Take the dynamics off the selected controls", h=26,
                c=lambda *a: _jiggleOffControl(),
                ann=u"Everything goes back into the control and the copy is gone")
    cmds.setParent("..")
    cmds.setParent("..")
    cmds.columnLayout(WIN + "_jbody", adj=True, rs=2)
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.tabLayout(WIN + "_tabs", e=True,
                   tabLabel=((chain, u"Chains"), (shake, u"Jiggle")))
    cmds.setParent("..")

    cmds.showWindow(WIN)

    # закрыли окно или сменили сцену, не сняв галку - вернуть проигрывание
    cmds.scriptJob(uiDeleted=[WIN, _liveOff], protected=False)
    cmds.scriptJob(event=["NewSceneOpened", _liveOff], parent=WIN)

    # если что-то выделено - сразу взять это
    pick(quiet=True)
    _fill()
    _jfill()
