# -*- coding: utf-8 -*-
"""Переключает конечность со штатного IK на pk_limbIk и обратно.

    swap("limb")         - на ноду
    revert("limb")       - вернуть как было
    cleanup("limb")      - удалить то, что нода заменила собой
    addAutoTwist("limb") - перевести автоподворот FK на ноду в уже
                           переключённом и вычищенном модуле

Нода отдаёт уже смешанный результат, IK с FK, поэтому ведёт она сразу финальные
кости. Штатная машинерия не удаляется: ikHandle выключается через ikBlend,
констрейны блендинга отключаются от костей, но остаются в сцене со всеми своими
настройками. revert возвращает всё на место.
"""
import os

import maya.cmds as cmds
import maya.api.OpenMaya as om


def _loadPlugin():
    """rigStudio3 грузит плагин лениво, только когда доходит до корректов или
    твистов, - здесь он может быть ещё не загружен."""
    if "pk_rigNodes" in (cmds.pluginInfo(q=1, listPlugins=1) or []):
        return True

    version = cmds.about(v=True).split(" ")[0]
    path = os.path.normpath(os.path.join(
        os.path.dirname(__file__), "..", "..", "plug-ins", version, "pk_rigNodes.mll"))

    if not os.path.isfile(path):
        cmds.warning("pk_rigNodes.mll is not built for Maya %s - %s" % (version, path))
        return False

    cmds.loadPlugin(path)
    return "pk_rigNodes" in (cmds.pluginInfo(q=1, listPlugins=1) or [])


def _names(m):
    return {
        "node":    m + "_pkIk_solver",
        # Корень берётся с локатора под ik_root, а не с кости: он следует за
        # тем же, что и она, но переживает удаление IK-цепочки. Штатная обвязка
        # мерит длину от него же.
        "ikRoot":  m + "_snap_root_loc",
        "volume":  [m + "_root_volume_outJoint", m + "_middle_volume_outJoint"],
        # Откуда нода читает FK-цепочку. Для первых двух - кости: без
        # pairBlend их поворот равен повороту контрола. А вот вместо
        # end_fkJoint взят сам контрол: на кости висит зеркальный флип
        # mirror_condition.sx, и риг проводит его через канал скейла, чтобы
        # он ушёл в fk_out_grp. Констрейн такой флип игнорировал, а нода
        # читает матрицу целиком - и он оседал в повороте кисти.
        "fk":      [m + "_a_fkJoint", m + "_b_fkJoint", m + "_fk_end"],
        # Кому pairBlend вёл поворот - только им его и снимать.
        "fkTwisted": [m + "_a_fkJoint", m + "_b_fkJoint"],
        "final":   [m + "_a_finalJoint", m + "_b_finalJoint", m + "_end_finalJoint"],
        "fParent": [m + "_joints", m + "_a_finalJoint", m + "_b_finalJoint"],
        "consts":  [m + "_a_joint_parentConstraint1",
                    m + "_b_joint_parentConstraint1",
                    m + "_end_joint_parentConstraint1"],
        "goal":    m + "_ik_connector",
        "pole":    m + "_ik_aim",
        "control": m + "_control",
        "midCtrl": m + "_middleOffset",
        "midGrp":  m + "_middleOffset_group",
        "midPoint": m + "_middle_control_pointConstraint1",
        "midOrientC": m + "_middle_control_orientConstraint1",
        "handle":  m + "_ikHandle",
        # Сырые длины костей, до умножения на length1/length2. Ноды названы по
        # месту назначения, а не по источнику: fk_end_group_decomposeMatrix
        # выдаёт длину ПЕРВОЙ кости, её потом множат на length1 и кладут в
        # fk_b_group.tx. Брать сам translate группы нельзя - там уже умножено.
        "scale":   m + "_root_connector_decomposeMatrix",
        # Реверс-стопа: за ним следует ikRev_connector стопы, и ему нужен
        # чистый IK - штатный end_ikJoint от ikFk не зависел.
        "ikRev":   m + "_multMatrix38",
        "lenA":    m + "_fk_end_group_decomposeMatrix",
        "lenB":    m + "_fk_b_group_decomposeMatrix",
    }


def _feed(node, plug, source, attr):
    """Связь со знаком: длина в ноде положительная, а канал кости может быть
    отрицательным на зеркальной стороне."""
    if cmds.getAttr(source + "." + attr) < 0:
        neg = cmds.createNode("multDoubleLinear", n=node + "_" + plug + "_neg")
        cmds.setAttr(neg + ".input2", -1)
        cmds.connectAttr(source + "." + attr, neg + ".input1")
        cmds.connectAttr(neg + ".output", node + "." + plug)
    else:
        cmds.connectAttr(source + "." + attr, node + "." + plug)


def _measureOrient(node, out, joint):
    """Поправка ориентации: как кость сидит вокруг своей оси в этом риге.

    Солвер строит систему по своей конвенции - X вдоль кости, Z по нормали
    плоскости сгиба. В модуле она может быть другой: у limb цепочка гнётся
    вокруг Y, и разница выходит в четверть оборота. Вместо того чтобы её
    угадывать, снимаем со сцены: O = W * F^-1, где W - как кость стоит сейчас,
    F - что выдал солвер. Позиции при этом совпадают, поэтому O чистый поворот.
    """
    f = om.MMatrix(cmds.getAttr(node + "." + out))
    w = om.MMatrix(cmds.getAttr(joint + ".worldMatrix[0]"))

    o = w * f.inverse()

    # положение берём из солвера, поправка отвечает только за поворот
    shift = max(abs(o.getElement(3, i)) for i in range(3))
    if shift > 1e-4:
        cmds.warning(" %s: solver and rig differ by %.4f in position" % (joint, shift))

    return [0.0 if r == 3 and c < 3 else o.getElement(r, c)
            for r in range(4) for c in range(4)]


def swap(m):
    if not _loadPlugin():
        return

    n = _names(m)

    if cmds.objExists(n["node"]):
        cmds.warning("%s already swapped" % m)
        return

    node = cmds.createNode("pk_limbIk", n=n["node"])

    for plug, obj in (("rootMatrix", n["ikRoot"]), ("goalMatrix", n["goal"]),
                      ("poleMatrix", n["pole"])):
        cmds.connectAttr(obj + ".worldMatrix[0]", node + "." + plug)

    for plug, obj in (("fkRootMatrix", n["fk"][0]), ("fkMidMatrix", n["fk"][1]),
                      ("fkEndMatrix", n["fk"][2])):
        cmds.connectAttr(obj + ".worldMatrix[0]", node + "." + plug)

    # длины живые, из тех же нод, что читает штатная обвязка
    _feed(node, "lengthA", n["lenA"], "outputTranslateX")
    _feed(node, "lengthB", n["lenB"], "outputTranslateX")

    for a in ("ikFk", "autoStretch", "softIk", "snap", "length1", "length2",
              "stretchVolume"):
        cmds.connectAttr(n["control"] + "." + a, node + "." + a)

    # Автоподворот FK: его считает нода, поэтому старый механизм отключается
    # здесь же. Оставить его - и подворот сложится дважды: сначала pairBlend
    # довернёт кость, потом нода довернёт то, что с неё прочитает.
    autoTwist = m + "_fk_b.autoTwist"
    if cmds.objExists(autoTwist):
        cmds.connectAttr(autoTwist, node + ".fkElbowAutoTwist")
    else:
        cmds.warning(" Missed " + autoTwist)

    for joint in n["fkTwisted"]:
        src = cmds.connectionInfo(joint + ".rotate", sourceFromDestination=True)
        if src:
            cmds.disconnectAttr(src, joint + ".rotate")
        cmds.setAttr(joint + ".rotate", 0, 0, 0)

    # объём: кость утоньшается ровно во столько, во сколько растянулась
    for joint, out in zip(n["volume"], ("outVolumeA", "outVolumeB")):
        if not cmds.objExists(joint):
            cmds.warning(" Missed " + joint)
            continue

        for axis in ("scaleY", "scaleZ"):
            src = cmds.connectionInfo(joint + "." + axis, sourceFromDestination=True)
            if src:
                cmds.disconnectAttr(src, joint + "." + axis)
            cmds.connectAttr(node + "." + out, joint + "." + axis)

    # Выход на реверс-стопу. Он шёл с end_ikJoint, а тот уйдёт вместе со
    # штатной цепочкой - подставляется конец до смешивания с FK.
    if cmds.objExists(n["ikRev"]):
        plug = n["ikRev"] + ".matrixIn[0]"
        src = cmds.connectionInfo(plug, sourceFromDestination=True)
        if src:
            cmds.disconnectAttr(src, plug)
        cmds.connectAttr(node + ".outIkEndMatrix", plug)
    else:
        cmds.warning(" Missed " + n["ikRev"] + " - the reverse foot has no source")

    # масштаб модуля: длины построены в его единицах, а матрицы мировые
    cmds.connectAttr(n["scale"] + ".outputScaleX", node + ".scale")

    # средний контрол двигает локоть. Берётся его локальный translate: он
    # приходит от аниматора, а не считается ригом, поэтому петли не будет -
    # хотя группа контрола и висит на костях, которые ведёт нода
    if cmds.objExists(n["midCtrl"]):
        cmds.connectAttr(n["midCtrl"] + ".translate", node + ".midOffset")

        # Группа контрола садится на локоть ДО смещения - иначе контрол уезжает
        # вдвое: сам сдвинул локоть, за локтем поехала группа. И ориентацию
        # тоже ведёт нода: смещение задаётся в системе контрола, а он сидит
        # между костями, не по средней кости. Разница - половина угла сгиба, и
        # локоть уходил в сторону от того, куда тянут.
        cmds.connectAttr(n["midGrp"] + ".parentInverseMatrix[0]",
                         node + ".midCtrlParentInverseMatrix")

        for a in ("translate", "rotate"):
            for axis in "XYZ":
                plug = n["midGrp"] + "." + a + axis
                src = cmds.connectionInfo(plug, sourceFromDestination=True)
                if src:
                    cmds.disconnectAttr(src, plug)

        cmds.connectAttr(node + ".outMidBaseTranslate", n["midGrp"] + ".translate")
        cmds.connectAttr(node + ".outMidBaseRotate", n["midGrp"] + ".rotate")
    else:
        cmds.warning(" Missed " + n["midCtrl"])

    # Поправки ориентации снимаются, пока риг ещё ведёт штатный солвер: тогда
    # сравнивать есть с чем. На время замера нужен чистый IK.
    ikFk = cmds.getAttr(n["control"] + ".ikFk")
    cmds.setAttr(n["control"] + ".ikFk", 1)

    for out, joint, plug in (("outRootMatrix", n["final"][0], "rootOrient"),
                             ("outMidMatrix", n["final"][1], "midOrient"),
                             ("outEndMatrix", n["final"][2], "endOrient")):
        cmds.setAttr(node + "." + plug, _measureOrient(node, out, joint), type="matrix")

    cmds.setAttr(n["control"] + ".ikFk", ikFk)

    # штатный солвер больше не нужен
    cmds.setAttr(n["handle"] + ".ikBlend", 0)

    # финальные кости: снимаем констрейны блендинга, ставим выход ноды
    for i, joint in enumerate(n["final"]):
        for a in ("translate", "rotate"):
            for axis in "XYZ":
                plug = joint + "." + a + axis
                src = cmds.connectionInfo(plug, sourceFromDestination=True)
                if src:
                    cmds.disconnectAttr(src, plug)

    # Локальные каналы идут из ноды напрямую: ни multMatrix, ни decomposeMatrix
    # на кость снаружи не нужно - обратные матрицы своей цепочки нода знает
    # сама, а извне ей нужна только одна, родителя первой кости.
    cmds.connectAttr(n["final"][0] + ".parentInverseMatrix[0]",
                     node + ".parentInverseMatrix")

    for joint, plug in zip(n["final"], ("rootJointOrient", "midJointOrient", "endJointOrient")):
        jo = cmds.getAttr(joint + ".jointOrient")[0]
        cmds.setAttr(node + "." + plug, jo[0], jo[1], jo[2], type="double3")

    order = cmds.getAttr(n["final"][0] + ".rotateOrder")
    for joint in n["final"][1:]:
        if cmds.getAttr(joint + ".rotateOrder") != order:
            cmds.warning(" %s has a different rotateOrder, the node takes one for all"
                         % joint)
    cmds.setAttr(node + ".rotateOrder", order)

    for i, joint in enumerate(n["final"]):
        cmds.connectAttr("%s.outTranslate[%s]" % (node, i), joint + ".translate")
        cmds.connectAttr("%s.outRotate[%s]" % (node, i), joint + ".rotate")

    print("%s: конечность на pk_limbIk. Смещение локтя - %s.midOffset" % (m, node))
    cmds.select(node)


# Механизм автоподворота FK: два локатора с aim-констрейнами, два pairBlend и
# condition, который замораживал констрейны при нулевом autoTwist. Всё это
# теперь считает нода, поэтому удаляется целиком.
AUTOTWIST_LEFTOVERS = [
    "fk_a_twist_loc", "fk_b_twist_loc",   # aim-констрейны сидят внутри них
    "pairBlend1", "pairBlend2", "condition1",
]


def addAutoTwist(m):
    """Переводит автоподворот FK на ноду - из состояния после swap + cleanup.

    Отдельно от swap, потому что модуль уже сохранён переключённым: старый
    механизм в нём ещё стоит, а нода про него не знала.
    """
    if not _loadPlugin():
        return

    n = _names(m)
    node = n["node"]

    if not cmds.objExists(node):
        cmds.warning(" %s is not swapped, nothing to do" % m)
        return

    # Нода из сцены могла быть создана прежней сборкой плагина. Выгрузка с
    # живыми нодами оставляет тип-заглушку, и перезагрузка этого не лечит.
    if not cmds.objExists(node + ".fkElbowAutoTwist"):
        cmds.warning(" %s has no autoTwist - Maya is running an older build of "
                     "pk_rigNodes. Restart Maya and open the scene again." % node)
        return

    # 1. Сам вход. Атрибут живёт на среднем FK-контроле.
    autoTwist = m + "_fk_b.autoTwist"

    if not cmds.objExists(autoTwist):
        cmds.warning(" Missed " + autoTwist)
        return

    if cmds.connectionInfo(node + ".fkElbowAutoTwist", sourceFromDestination=True):
        print("%s.autoTwist is already driven" % node)
    else:
        cmds.connectAttr(autoTwist, node + ".fkElbowAutoTwist")

    # 2. Старый подворот с костей снимается. Оставить его - и подворот сложится
    # дважды: сначала pairBlend довернёт кость, потом нода довернёт то, что с
    # неё прочитает. Значение после отключения остаётся последним, поэтому
    # обнуляется руками.
    for joint in n["fkTwisted"]:
        if not cmds.objExists(joint):
            cmds.warning(" Missed " + joint)
            continue

        src = cmds.connectionInfo(joint + ".rotate", sourceFromDestination=True)
        if src:
            cmds.disconnectAttr(src, joint + ".rotate")

        for axis in "XYZ":
            plug = joint + ".rotate" + axis
            src = cmds.connectionInfo(plug, sourceFromDestination=True)
            if src:
                cmds.disconnectAttr(src, plug)

        cmds.setAttr(joint + ".rotate", 0, 0, 0)

    # 3. И сама машинерия.
    removed = []

    for name in AUTOTWIST_LEFTOVERS:
        obj = m + "_" + name
        if cmds.objExists(obj):
            cmds.delete(obj)
            removed.append(name)

    print("%s: autoTwist is on the node, removed %d nodes" % (m, len(removed)))
    if removed:
        print("  %s" % ", ".join(removed))


# Всё, что после переключения больше не участвует в работе. Списком, а не
# поиском по типам: удалять надо ровно это и ничего вокруг.
LEFTOVERS = [
    # штатный солвер
    "ikHandle", "effector",
    "a_ikJoint",                       # с ним уйдут b_ikJoint и end_ikJoint
    # растяжение, мягкость, снап
    "current_length", "current_length_scaled",
    "init_length", "init_length_a", "init_length_b", "init_lenth_minus_softIk",
    "softIk_value", "softIk_condition",
    "stretch_condition", "stretch_blend", "final_length", "final_length_factor",
    "power", "one_minus", "one_minus_by_softIk", "return_softIk",
    "length_difference", "length_difference_minus", "length_difference_by_softIk",
    "snap_blend", "scale_to_translate_converter",
    "current_rootToSnapPoint_length", "current_endToSnapPoint_length",
    "current_toSnapPoint_length_scaled",
    "ikfk_blend",
    # объём теперь считает нода
    "volume_mult", "volume_blendColors",
    # считали поворот для end_ikJoint, а его больше нет
    "multMatrix29", "decomposeMatrix33",
    # блендинг IK/FK и средний контрол
    "a_joint_parentConstraint1", "b_joint_parentConstraint1",
    "end_joint_parentConstraint1",
    "middle_control_pointConstraint1", "middle_control_orientConstraint1",
] + AUTOTWIST_LEFTOVERS

# Это нужно и после переключения - на случай, если руки потянутся удалить.
KEEP = [
    "fk_end_group_decomposeMatrix",    # сырые длины костей, они же ведут FK-группы
    "fk_b_group_decomposeMatrix",
    "initScale1_mult", "initScaleEnd_mult",
    "root_connector_decomposeMatrix",  # масштаб модуля
    "snap_root_loc",                   # корень цепочки
    "a_fkJoint", "b_fkJoint", "end_fkJoint",
    "root_volume_outJoint", "middle_volume_outJoint",
]


def cleanup(m):
    """Убирает то, что нода заменила собой.

    Запускать только после swap: пока конечность на штатном солвере, всё это
    ей нужно.
    """
    n = _names(m)

    if not cmds.objExists(n["node"]):
        cmds.warning(" %s is not swapped, nothing to clean up" % m)
        return

    removed, missed = [], []

    for name in LEFTOVERS:
        obj = m + "_" + name
        if cmds.objExists(obj):
            cmds.delete(obj)
            removed.append(name)
        else:
            missed.append(name)

    print("%s: removed %d nodes" % (m, len(removed)))
    if missed:
        print("  not found: %s" % ", ".join(missed))

    for name in KEEP:
        if not cmds.objExists(m + "_" + name):
            cmds.warning(" %s_%s is gone and it should not be" % (m, name))


def revert(m):
    n = _names(m)

    if not cmds.objExists(n["node"]):
        cmds.warning("%s is not swapped" % m)
        return

    for joint in n["final"]:
        for a in ("translate", "rotate"):
            for axis in "XYZ":
                plug = joint + "." + a + axis
                src = cmds.connectionInfo(plug, sourceFromDestination=True)
                if src:
                    cmds.disconnectAttr(src, plug)

    for a in ("translate", "rotate"):
        for axis in "XYZ":
            plug = n["midGrp"] + "." + a + axis
            src = cmds.connectionInfo(plug, sourceFromDestination=True)
            if src:
                cmds.disconnectAttr(src, plug)

    cmds.delete([o for o in cmds.ls(n["node"] + "*") if cmds.objExists(o)])

    for const, a, c in ((n["midPoint"], "translate", "constraintTranslate"),
                        (n["midOrientC"], "rotate", "constraintRotate")):
        if not cmds.objExists(const):
            cmds.warning(" Missed " + const)
            continue

        for axis in "XYZ":
            cmds.connectAttr(const + "." + c + axis, n["midGrp"] + "." + a + axis, f=1)

    for const, joint in zip(n["consts"], n["final"]):
        if not cmds.objExists(const):
            cmds.warning(" Missed " + const)
            continue

        for a, c in (("translate", "constraintTranslate"), ("rotate", "constraintRotate")):
            for axis in "XYZ":
                cmds.connectAttr(const + "." + c + axis, joint + "." + a + axis, f=1)

    cmds.setAttr(n["handle"] + ".ikBlend", 1)

    print("%s: конечность вернулась на штатный IK" % m)
