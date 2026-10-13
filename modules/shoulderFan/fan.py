# Веер плеча (2026-10-12, по посту @heartandpaw_rig «joint-only shoulder»).
#
# Из центра (позер fanCenter, в глубине грудной клетки) веером идут кости к
# точкам под кожей груди, спины и верха плеча - по позеру spoke_<k> на кость.
# Кость только поворачивается вокруг центра, длина постоянна, поэтому кожа на
# ней едет по сфере вокруг рёбер. Скиновая - конец кости (spoke_<k>_skinJoint),
# корень у центра (spoke_<k>_hub_skinJoint) только рисует линию.
#
# Куда смотрит кость: точку покоя её конца несут грудь, ключица, лопатка и
# плечевая кость с весами chest / clav / scapula / arm (атрибуты на кости).
# Цель - средневзвешенное, поэтому chest - якорь: chest 1 - кость стоит,
# chest 0.5 + arm 0.5 - идёт за рукой на половину. Для каждого ведущего в кадре
# центра одна общая матрица «покой -> сейчас»; у кости wtAddMatrix этих матриц
# с весами, точка покоя через неё, aimMatrix без secondary (кратчайший поворот
# от кадра покоя - кручения нет).
#
# Крайние положения: у каждой кости шесть локаторов - вперёд / назад / вверх от
# ключицы и то же от руки. Локатор стоит в конце кости (её осями); его t/r -
# смещение конца, которое включается целиком в крайнем положении. Вес позы -
# smoothstep(clamp(угол / крайний угол)); углы и показ локаторов - на кости
# ключицы (clavForwardAngle..., armForwardAngle..., showClavForward...).
#   ключица: поворот контрола в кадре груди (ry < 0 вперёд, ry > 0 назад, rz > 0 вверх);
#   рука: направление плечевой кости относительно покоя в кадре груди - вверх
#   = прирост подъёма над горизонтом, вперёд/назад = поворот проекции на
#   горизонталь (у вертикальной руки гаснет, там направление не определено).
#
# Всё в кадре группы controls (кадр груди), как в shoulder: справа он отражён,
# поэтому одни формулы дают зеркало. Все ноды кости называются spoke_<k>_...:
# по этому имени кость снимается при смене их числа.
import maya.cmds as cmds

DEFAULT_COUNT = 10
GROUPS = ("clav", "arm")
POSES = ("forward", "back", "up")
DRIVERS = ("clav", "scapula", "arm")            # chest - единичная матрица
WEIGHTS = ("chest",) + DRIVERS
ANGLES = {("clav", "forward"): 25.0, ("clav", "back"): 25.0, ("clav", "up"): 30.0,
          ("arm", "forward"): 70.0, ("arm", "back"): 40.0, ("arm", "up"): 70.0}
POSE_COLORS = {"forward": 6, "back": 13, "up": 14}
LOC_SCALE = 0.3

# Раскладка по умолчанию (кадр mainPoser, левая сторона: X наружу, Y вверх,
# Z вперёд; пропорции human): положение позера и веса chest, clav, scapula, arm.
DEFAULT_SPOKES = [
    ((-0.90, -0.60, 1.20), (0.85, 0.15, 0.0, 0.0)),   # 1 верх грудины
    ((0.60, -0.20, 1.00), (0.20, 0.80, 0.0, 0.0)),    # 2 под ключицей
    ((0.90, -2.00, 1.30), (0.60, 0.20, 0.0, 0.20)),   # 3 середина груди
    ((2.40, -1.60, 0.30), (0.15, 0.05, 0.0, 0.80)),   # 4 передний край подмышки
    ((0.00, 1.50, -1.50), (0.50, 0.50, 0.0, 0.0)),    # 5 трапеция у шеи
    ((1.50, 0.90, -1.00), (0.0, 0.30, 0.0, 0.70)),    # 6 верх плеча
    ((0.40, -0.40, -3.20), (0.10, 0.0, 0.90, 0.0)),   # 7 верх лопатки
    ((1.60, -0.80, -2.60), (0.0, 0.30, 0.40, 0.30)),  # 8 край лопатки у плеча
    ((0.90, -3.80, -3.00), (0.20, 0.0, 0.80, 0.0)),   # 9 нижний угол лопатки
    ((2.40, -1.80, -2.00), (0.15, 0.0, 0.15, 0.70)),  # 10 задний край подмышки
]
SPOKE_NAMES = ["верх грудины", "под ключицей", "середина груди", "передний край подмышки",
               "трапеция у шеи", "верх плеча", "верх лопатки", "край лопатки у плеча",
               "нижний угол лопатки", "задний край подмышки"]

# плаги общей части (в шаблоне), без префикса модуля
CENTER = "fanCenter_rest_pointMatrixMult.output"          # центр в кадре груди
CENTER_M = "fanCenter_composeMatrix.outputMatrix"
DRIVER_PLUG = {d: "fan_%s_multMatrix.matrixSum" % d for d in DRIVERS}
REST_WEIGHT = "fanPose_rest_plusMinusAverage.output1D"     # 1 - сумма весов поз
POSE_WEIGHT = {("clav", p): "fanPoseClav_weights_multiplyDivide.output" + ax for p, ax in zip(POSES, "XYZ")}
POSE_WEIGHT.update({("arm", p): "fanPoseArm_final_multiplyDivide.output" + ax for p, ax in zip(POSES, "XYZ")})
ZFLIP = "zFlip_composeMatrix.outputMatrix"
CLAV_INV = "clav_inverseMatrix.outputMatrix"


def cap(s):
    return s[0].upper() + s[1:]


def angle_attr(group, pose):
    return "%s%sAngle" % (group, cap(pose))


def show_attr(group, pose):
    return "show%s%s" % (cap(group), cap(pose))


def spoke_name(k):
    return "spoke_%d" % k


def loc_name(k, group, pose):
    return "spoke_%d_%s%s_poseLoc" % (k, group, cap(pose))


def default_spoke(k):
    """Положение позера и веса кости k по умолчанию. Сверх 10 - посередине
    между соседними по номеру (по кругу)."""
    if k <= len(DEFAULT_SPOKES):
        return DEFAULT_SPOKES[k - 1]
    i = (k - len(DEFAULT_SPOKES) - 1) % len(DEFAULT_SPOKES)
    (pa, wa), (pb, wb) = DEFAULT_SPOKES[i], DEFAULT_SPOKES[(i + 1) % len(DEFAULT_SPOKES)]
    return (tuple((a + b) * 0.5 for a, b in zip(pa, pb)), tuple((a + b) * 0.5 for a, b in zip(wa, wb)))


# В Maya 2026 часть типов переименована (multDoubleLinear -> multDL,
# pointMatrixMult -> pointMatrixMultDL), а createNode на неизвестный тип молча
# даёт пустую ноду unknown - тип подбираем по тому, что в этой Maya есть.
_DL = {"multDoubleLinear": "multDL", "addDoubleLinear": "addDL"}
_types = {}


def node_type(t):
    if t not in _types:
        available = set(cmds.allNodeTypes() or [])
        _types[t] = t
        if t not in available:
            for cand in (_DL.get(t), t + "DL"):
                if cand and cand in available:
                    _types[t] = cand
                    break
    return _types[t]


class Net(object):
    """Создание нод модуля: префикс имени, набор нод модуля."""

    def __init__(self, prefix=""):
        self.P = prefix
        self.nodes_set = prefix + "nodesSet" if prefix and cmds.objExists(prefix + "nodesSet") else None

    def n(self, name):
        return self.P + name

    def add(self, *nodes):
        if self.nodes_set:
            cmds.sets(list(nodes), e=1, forceElement=self.nodes_set)

    def node(self, t, name, parent=None):
        t = node_type(t)
        kw = {"p": self.n(parent)} if parent else {}
        made = cmds.createNode(t, n=self.n(name), **kw)
        assert made == self.n(name), (made, self.n(name))
        assert cmds.nodeType(made) == t, (made, cmds.nodeType(made), t)
        self.add(made)
        return made

    def c(self, a, b):
        cmds.connectAttr(self.n(a), self.n(b), f=1)

    def mmat(self, name, plugs):
        m = self.node("multMatrix", name + "_multMatrix")
        for i, p in enumerate(plugs):
            self.c(p, "%s.matrixIn[%d]" % (m[len(self.P):], i))
        return name + "_multMatrix.matrixSum"

    def compose(self, name, translate=None, rotate=None):
        m = self.node("composeMatrix", name + "_composeMatrix")
        if translate: self.c(translate, name + "_composeMatrix.inputTranslate")
        if rotate: self.c(rotate, name + "_composeMatrix.inputRotate")
        return name + "_composeMatrix.outputMatrix"

    def pmm(self, name, point, matrix):
        self.node("pointMatrixMult", name + "_pointMatrixMult")
        self.c(point, name + "_pointMatrixMult.inPoint")
        self.c(matrix, name + "_pointMatrixMult.inMatrix")
        return name + "_pointMatrixMult.output"

    def pma(self, name, a, b, op):
        self.node("plusMinusAverage", name + "_plusMinusAverage")
        cmds.setAttr(self.n(name + "_plusMinusAverage.operation"), op)
        self.c(a, name + "_plusMinusAverage.input3D[0]")
        self.c(b, name + "_plusMinusAverage.input3D[1]")
        return name + "_plusMinusAverage.output3D"

    def inverse(self, name, m):
        self.node("inverseMatrix", name + "_inverseMatrix")
        self.c(m, name + "_inverseMatrix.inputMatrix")
        return name + "_inverseMatrix.outputMatrix"


# ============================================================================ общая часть

def add_settings_attrs(obj, keyable):
    """Крайние углы и показ локаторов (на кости ключицы)."""
    for g in GROUPS:
        for p in POSES:
            a = angle_attr(g, p)
            if not cmds.objExists(obj + "." + a):
                cmds.addAttr(obj, ln=a, at="double", dv=ANGLES[(g, p)], min=1)
            cmds.setAttr(obj + "." + a, e=1, k=keyable)
    for g in GROUPS:
        for p in POSES:
            a = show_attr(g, p)
            if not cmds.objExists(obj + "." + a):
                cmds.addAttr(obj, ln=a, at="bool", dv=0)
            cmds.setAttr(obj + "." + a, e=1, k=keyable)


def add_weight_attrs(obj, weights, keyable):
    for a, v in zip(WEIGHTS, weights):
        if not cmds.objExists(obj + "." + a):
            cmds.addAttr(obj, ln=a, at="double", min=0, dv=v)
        cmds.setAttr(obj + "." + a, e=1, k=keyable)


def _smoothstep(net, name, values, maxima):
    """smoothstep(clamp(value / max)) по трём каналам."""
    t = net.node("setRange", name + "_setRange")
    for v, m, ax in zip(values, maxima, "XYZ"):
        net.c(v, "%s_setRange.value%s" % (name, ax))
        net.c(m, "%s_setRange.oldMax%s" % (name, ax))
    cmds.setAttr(t + ".max", 1, 1, 1)
    sq = net.node("multiplyDivide", name + "Sq_multiplyDivide")
    net.c(name + "_setRange.outValue", name + "Sq_multiplyDivide.input1")
    net.c(name + "_setRange.outValue", name + "Sq_multiplyDivide.input2")
    k = net.node("setRange", name + "K_setRange")             # 3 - 2t
    net.c(name + "_setRange.outValue", name + "K_setRange.value")
    cmds.setAttr(k + ".oldMax", 1, 1, 1)
    cmds.setAttr(k + ".min", 3, 3, 3)
    cmds.setAttr(k + ".max", 1, 1, 1)
    net.node("multiplyDivide", name + "_weights_multiplyDivide")
    net.c(name + "Sq_multiplyDivide.output", name + "_weights_multiplyDivide.input1")
    net.c(name + "K_setRange.outValue", name + "_weights_multiplyDivide.input2")
    return name + "_weights_multiplyDivide.output"


def build_base(net, plugs):
    """Общая часть веера (генератор шаблона). plugs - плаги сети shoulder:
    F (ключица в груди), clav_ctrl (контрол ключицы), scapula / scapulaRest
    (кадр лопатки и её покой), humerus / humerusRest, humerusDir / humerusDirRest
    (единичные направления плечевой кости), armConnected."""
    clav = "root_outJoint"
    add_settings_attrs(net.n(clav), keyable=True)

    # центр и сопряжение «покой -> сейчас» в кадр центра: Tc * R * Tc^-1
    net.pmm("fanCenter_rest", "fanCenter_poser.translate", "root_poser.inverseMatrix")
    net.compose("fanCenter", translate=CENTER)
    tci = net.inverse("fanCenter", CENTER_M)
    rel = {
        "clav": [plugs["F"]],
        "scapula": [net.inverse("fanScapulaRest", plugs["scapulaRest"]), plugs["scapula"]],
        "arm": [net.inverse("fanHumerusRest", plugs["humerusRest"]), plugs["humerus"]],
    }
    for d in DRIVERS:
        net.mmat("fan_" + d, [CENTER_M] + rel[d] + [tci])

    # --- веса поз ключицы: поворот контрола в кадре груди в его порядке осей
    rot = net.node("decomposeMatrix", "fanPoseClav_decomposeMatrix")
    net.c(plugs["F"], "fanPoseClav_decomposeMatrix.inputMatrix")
    net.c(plugs["clav_ctrl"] + ".rotateOrder", "fanPoseClav_decomposeMatrix.inputRotateOrder")
    fwd = net.node("multDoubleLinear", "fanPoseClavForward_multDoubleLinear")
    net.c("fanPoseClav_decomposeMatrix.outputRotateY", fwd[len(net.P):] + ".input1")
    cmds.setAttr(fwd + ".input2", -1)
    _smoothstep(net, "fanPoseClav",
                [fwd[len(net.P):] + ".output", "fanPoseClav_decomposeMatrix.outputRotateY", "fanPoseClav_decomposeMatrix.outputRotateZ"],
                [clav + "." + angle_attr("clav", p) for p in POSES])

    # --- веса поз руки: направление плечевой кости в кадре груди
    h, h0 = plugs["humerusDir"], plugs["humerusDirRest"]
    # вверх: на сколько выросла высота над горизонтом = угол от вертикали в покое - сейчас
    for tag, v in (("Rest", h0), ("", h)):
        ab = net.node("angleBetween", "fanArmVertical%s_angleBetween" % tag)
        net.c(v, "fanArmVertical%s_angleBetween.vector1" % tag)
        cmds.setAttr(ab + ".vector2", 0, 1, 0)
    up = net.node("plusMinusAverage", "fanArmUp_plusMinusAverage")
    cmds.setAttr(up + ".operation", 2)
    net.c("fanArmVerticalRest_angleBetween.angle", "fanArmUp_plusMinusAverage.input1D[0]")
    net.c("fanArmVertical_angleBetween.angle", "fanArmUp_plusMinusAverage.input1D[1]")
    # вперёд / назад: поворот проекции на горизонталь вокруг Y (знак - по оси;
    # одиночная связь с axisY в Maya не считается - берём весь axis)
    for tag, v in (("Rest", h0), ("", h)):
        flat = net.node("multiplyDivide", "fanArmFlat%s_multiplyDivide" % tag)
        net.c(v, "fanArmFlat%s_multiplyDivide.input1" % tag)
        cmds.setAttr(flat + ".input2", 1, 0, 1)
    ab = net.node("angleBetween", "fanArmSwing_angleBetween")
    net.c("fanArmFlatRest_multiplyDivide.output", "fanArmSwing_angleBetween.vector1")
    net.c("fanArmFlat_multiplyDivide.output", "fanArmSwing_angleBetween.vector2")
    sg = net.node("multiplyDivide", "fanArmSwing_multiplyDivide")
    net.c("fanArmSwing_angleBetween.axis", "fanArmSwing_multiplyDivide.input1")
    for ax in "XYZ":
        net.c("fanArmSwing_angleBetween.angle", "fanArmSwing_multiplyDivide.input2" + ax)
    back = "fanArmSwing_multiplyDivide.outputY"                     # +Y: от наружу к назад
    fwd = net.node("multDoubleLinear", "fanArmForward_multDoubleLinear")
    net.c(back, fwd[len(net.P):] + ".input1")
    cmds.setAttr(fwd + ".input2", -1)
    w = _smoothstep(net, "fanPoseArm", [fwd[len(net.P):] + ".output", back, "fanArmUp_plusMinusAverage.output1D"],
                    [clav + "." + angle_attr("arm", p) for p in POSES])
    # у почти вертикальной руки поворот по горизонтали не определён - гасим:
    # длина проекции 0..0.5 -> 0..1; без руки позы руки выключены
    ln = net.node("distanceBetween", "fanArmFlat_distanceBetween")
    net.c("fanArmFlat_multiplyDivide.output", "fanArmFlat_distanceBetween.point1")
    k = net.node("setRange", "fanArmFlat_setRange")
    net.c("fanArmFlat_distanceBetween.distance", "fanArmFlat_setRange.valueX")
    cmds.setAttr(k + ".oldMaxX", 0.5)
    cmds.setAttr(k + ".maxX", 1)
    kk = net.node("multiplyDivide", "fanPoseArmGate_multiplyDivide")
    for ax in "XY":
        net.c("fanArmFlat_setRange.outValueX", "fanPoseArmGate_multiplyDivide.input1" + ax)
    cmds.setAttr(kk + ".input1Z", 1)
    for ax in "XYZ":
        net.c(plugs["armConnected"], "fanPoseArmGate_multiplyDivide.input2" + ax)
    net.node("multiplyDivide", "fanPoseArm_final_multiplyDivide")
    net.c(w, "fanPoseArm_final_multiplyDivide.input1")
    net.c("fanPoseArmGate_multiplyDivide.output", "fanPoseArm_final_multiplyDivide.input2")

    # вес покоя = 1 - сумма весов поз (для смеси матриц локаторов)
    rest = net.node("plusMinusAverage", "fanPose_rest_plusMinusAverage")
    cmds.setAttr(rest + ".operation", 2)
    cmds.setAttr(rest + ".input1D[0]", 1)
    i = 1
    for g in GROUPS:
        for p in POSES:
            net.c(POSE_WEIGHT[(g, p)], "fanPose_rest_plusMinusAverage.input1D[%d]" % i)
            i += 1


# ============================================================================ кости

def _poser(net, name, t, size, color):
    """Позер как в shoulder: сфера size * globalSize, двигается только переносом."""
    p = net.node("transform", name + "_poser", parent="mainPoser")
    cmds.addAttr(p, ln="size", at="double", dv=size, min=0, k=1)
    cmds.setAttr(p + ".ove", 1)
    cmds.setAttr(p + ".ovc", color)
    cmds.setAttr(p + ".t", *t)
    for a in ("rx", "ry", "rz", "sx", "sy", "sz"):
        cmds.setAttr(p + "." + a, l=1, k=0)
    cmds.setAttr(p + ".v", k=0)
    sphere = net.node("makeNurbSphere", name + "_makeNurbSphere")
    shape = net.node("nurbsSurface", name + "_poserShape", parent=name + "_poser")
    net.c(name + "_makeNurbSphere.outputSurface", name + "_poserShape.create")
    for a, v in (("ove", 1), ("ovc", color), ("vir", 1), ("vif", 1), ("tw", 1), ("dvu", 3), ("dvv", 3)):
        cmds.setAttr(shape + "." + a, v)
    net.node("multDoubleLinear", name + "_size_multDoubleLinear")
    net.c(name + "_poser.size", name + "_size_multDoubleLinear.input1")
    net.c("mainPoser.globalSize", name + "_size_multDoubleLinear.input2")
    net.c(name + "_size_multDoubleLinear.output", name + "_makeNurbSphere.radius")
    return p


def _guide(net, name, posers, color):
    """Линия-подсказка между позерами (не выделяется)."""
    crv = cmds.curve(d=1, p=[(0, 0, i) for i in range(len(posers))], n=net.n(name + "_guide"))
    assert crv == net.n(name + "_guide"), crv
    shape = cmds.rename(cmds.listRelatives(crv, s=1)[0], net.n(name + "_guideShape"))
    crv = cmds.parent(crv, net.n("mainPoser"), r=1)[0]
    net.add(crv, shape)
    cmds.setAttr(shape + ".ove", 1)
    cmds.setAttr(shape + ".ovc", color)
    cmds.setAttr(shape + ".ovdt", 2)
    for a in ("t", "r", "s"):
        for ax in "xyz":
            cmds.setAttr(crv + "." + a + ax, l=1, k=0)
    for i, p in enumerate(posers):
        net.c(p + ".translate", "%s_guideShape.controlPoints[%d]" % (name, i))


def build_spoke(net, k, position=None, weights=None):
    """Кость веера k: позер, кость (корень у центра + скиновый конец), шесть
    локаторов крайних положений. Всё называется spoke_<k>_..."""
    s = spoke_name(k)
    dp, dw = default_spoke(k)
    position = position or dp
    weights = weights or dw
    clav = net.n("root_outJoint")

    _poser(net, s, position, 0.12, 18)
    _guide(net, s, ["fanCenter_poser", s + "_poser"], 18)

    # кости: корень в центре (только линия), конец - скиновый
    hub = net.node("joint", s + "_hub_outJoint", parent="root_outJoint")
    end = net.node("joint", s + "_outJoint", parent=s + "_hub_outJoint")
    cmds.setAttr(hub + ".radius", 0.2)
    cmds.setAttr(end + ".radius", 0.4)
    cmds.sets(end, e=1, forceElement=net.n("skinJointsSet"))
    add_weight_attrs(end, weights, keyable=True)

    # точка покоя в кадре груди и относительно центра
    p = net.pmm(s + "_rest", s + "_poser.translate", "root_poser.inverseMatrix")
    q = net.pma(s + "_offset", p, CENTER, 2)
    length = net.node("distanceBetween", s + "_length_distanceBetween")
    net.c(q, s + "_length_distanceBetween.point1")
    net.c(s + "_length_distanceBetween.distance", s + "_outJoint.translateX")

    # кадр покоя: X на позер, Y - вертикаль груди (у почти вертикальных - вперёд)
    rest = net.node("aimMatrix", s + "_rest_aimMatrix")
    net.c(CENTER_M, s + "_rest_aimMatrix.inputMatrix")
    net.c(net.compose(s + "_rest", translate=p), s + "_rest_aimMatrix.primaryTargetMatrix")
    cmds.setAttr(rest + ".primaryInputAxis", 1, 0, 0)
    cmds.setAttr(rest + ".secondaryInputAxis", 0, 1, 0)
    cmds.setAttr(rest + ".secondaryMode", 2)
    d = [b - a for a, b in zip(cmds.getAttr(net.n(CENTER))[0], cmds.getAttr(net.n(p))[0])]
    vertical = abs(d[1]) > 0.8 * (sum(x * x for x in d) ** 0.5)
    cmds.setAttr(rest + ".secondaryTargetVector", *((0, 0, 1) if vertical else (0, 1, 0)))

    # цель: точка покоя, перенесённая смесью ведущих (chest - единичная)
    wa = net.node("wtAddMatrix", s + "_drivers_wtAddMatrix")
    cmds.setAttr(wa + ".wtMatrix[0].matrixIn", [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1], type="matrix")
    net.c(s + "_outJoint.chest", s + "_drivers_wtAddMatrix.wtMatrix[0].weightIn")
    for i, drv in enumerate(DRIVERS, 1):
        net.c(DRIVER_PLUG[drv], "%s_drivers_wtAddMatrix.wtMatrix[%d].matrixIn" % (s, i))
        net.c(s + "_outJoint." + drv, "%s_drivers_wtAddMatrix.wtMatrix[%d].weightIn" % (s, i))
    v = net.pmm(s + "_target", q, s + "_drivers_wtAddMatrix.matrixSum")
    tgt = net.pma(s + "_target", v, CENTER, 1)
    aim = net.node("aimMatrix", s + "_aimMatrix")
    net.c(s + "_rest_aimMatrix.outputMatrix", s + "_aimMatrix.inputMatrix")
    net.c(net.compose(s + "_target", translate=tgt), s + "_aimMatrix.primaryTargetMatrix")
    cmds.setAttr(aim + ".primaryInputAxis", 1, 0, 0)
    cmds.setAttr(aim + ".secondaryMode", 0)                     # кратчайший поворот от покоя
    M = s + "_aimMatrix.outputMatrix"

    # конец кости без поправки (кадр локаторов) и обратно к корню
    t_len = net.node("composeMatrix", s + "_length_composeMatrix")
    net.c(s + "_length_distanceBetween.distance", s + "_length_composeMatrix.inputTranslateX")
    neg = net.node("multDoubleLinear", s + "_lengthNeg_multDoubleLinear")
    net.c(s + "_length_distanceBetween.distance", neg[len(net.P):] + ".input1")
    cmds.setAttr(neg + ".input2", -1)
    t_neg = net.node("composeMatrix", s + "_lengthNeg_composeMatrix")
    net.c(neg[len(net.P):] + ".output", s + "_lengthNeg_composeMatrix.inputTranslateX")
    end_m = net.mmat(s + "_end", [s + "_length_composeMatrix.outputMatrix", M])

    # локаторы крайних положений - в конце кости, её осями
    space = net.node("transform", s + "_poseSpace", parent="controls")
    net.c(end_m, s + "_poseSpace.offsetParentMatrix")
    for a in ("t", "r", "s"):
        for ax in "xyz":
            cmds.setAttr(space + "." + a + ax, l=1, k=0)
    blend = net.node("wtAddMatrix", s + "_pose_wtAddMatrix")
    cmds.setAttr(blend + ".wtMatrix[0].matrixIn", [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1], type="matrix")
    net.c(REST_WEIGHT, s + "_pose_wtAddMatrix.wtMatrix[0].weightIn")
    i = 1
    for g in GROUPS:
        for pose in POSES:
            ln = net.n(loc_name(k, g, pose))
            loc = cmds.spaceLocator(n=ln)[0]
            assert loc == ln, loc
            loc = cmds.parent(loc, net.n(s + "_poseSpace"), r=1)[0]
            shape = cmds.listRelatives(loc, s=1)[0]
            net.add(loc, shape)
            cmds.setAttr(shape + ".localScale", LOC_SCALE, LOC_SCALE, LOC_SCALE)
            cmds.setAttr(shape + ".overrideEnabled", 1)
            cmds.setAttr(shape + ".overrideColor", POSE_COLORS[pose])
            for a in ("sx", "sy", "sz"):
                cmds.setAttr(loc + "." + a, l=1, k=0)
            cmds.connectAttr(clav + "." + show_attr(g, pose), loc + ".visibility")
            cmds.setAttr(loc + ".v", k=0)
            net.c(loc_name(k, g, pose) + ".matrix", "%s_pose_wtAddMatrix.wtMatrix[%d].matrixIn" % (s, i))
            net.c(POSE_WEIGHT[(g, pose)], "%s_pose_wtAddMatrix.wtMatrix[%d].weightIn" % (s, i))
            i += 1
    # смесь матриц - не чистый поворот при частичных весах: перенос и поворот
    # берём из неё, масштаб и сдвиг - нет
    dec = net.node("decomposeMatrix", s + "_pose_decomposeMatrix")
    net.c(s + "_pose_wtAddMatrix.matrixSum", s + "_pose_decomposeMatrix.inputMatrix")
    O = net.compose(s + "_pose", translate=s + "_pose_decomposeMatrix.outputTranslate",
                    rotate=s + "_pose_decomposeMatrix.outputRotate")
    posed = net.mmat(s + "_posed", [s + "_lengthNeg_composeMatrix.outputMatrix", O, s + "_length_composeMatrix.outputMatrix", M])

    # локальная матрица корня под костью ключицы: L = Zf * M * F^-1 * Zf
    local = net.mmat(s + "_local", [ZFLIP, posed, CLAV_INV, ZFLIP])
    net.node("decomposeMatrix", s + "_local_decomposeMatrix")
    net.c(local, s + "_local_decomposeMatrix.inputMatrix")
    net.c(s + "_local_decomposeMatrix.outputTranslate", s + "_hub_outJoint.translate")
    net.c(s + "_local_decomposeMatrix.outputRotate", s + "_hub_outJoint.rotate")
    return end


def scene_count(prefix=""):
    k = 0
    while cmds.objExists("%s%s_poser" % (prefix, spoke_name(k + 1))):
        k += 1
    return k


def remove_spoke(prefix, k):
    """Снять кость k: все ноды spoke_<k>_*. Входы извне сначала отключаем -
    иначе Maya удалит вместе с нодами и общую часть, если та больше никуда не ведёт."""
    nodes = cmds.ls("%s%s_*" % (prefix, spoke_name(k))) or []
    own = set(nodes)
    for n in nodes:
        if not cmds.objExists(n):
            continue
        conns = cmds.listConnections(n, s=1, d=0, c=1, p=1) or []
        for dst, src in zip(conns[::2], conns[1::2]):
            if src.split(".")[0] not in own:
                cmds.disconnectAttr(src, dst)
    alive = [n for n in nodes if cmds.objExists(n)]
    if alive:
        cmds.delete(alive)


def set_count(prefix, count):
    """Сделать в модуле count костей (снять лишние с конца / достроить)."""
    net = Net(prefix)
    have = scene_count(prefix)
    for k in range(have, count, -1):
        remove_spoke(prefix, k)
    for k in range(have + 1, count + 1):
        build_spoke(net, k)


# ============================================================================ скиновые кости, данные

def skin_pairs(module_name):
    """(скиновая кость, outJoint, вид атрибутов) модуля."""
    p = module_name + "_"
    pairs = [(p + "root_skinJoint", p + "root_outJoint", "settings")]
    for k in range(1, scene_count(p) + 1):
        pairs.append((p + spoke_name(k) + "_skinJoint", p + spoke_name(k) + "_outJoint", "weights"))
    return pairs


def _attr_names(kind):
    if kind == "settings":
        return [angle_attr(g, p) for g in GROUPS for p in POSES] + [show_attr(g, p) for g in GROUPS for p in POSES]
    return list(WEIGHTS)


def connect_skin(module_name):
    """Атрибуты - на скиновых костях (их видит аниматор), сеть читает outJoint."""
    for skin, out, kind in skin_pairs(module_name):
        if not cmds.objExists(skin) or not cmds.objExists(out):
            continue
        if kind == "settings":
            add_settings_attrs(skin, keyable=True)
        else:
            add_weight_attrs(skin, [cmds.getAttr(out + "." + a) for a in WEIGHTS], keyable=True)
        for a in _attr_names(kind):
            if cmds.listConnections(out + "." + a, s=1, d=0, p=1) != [skin + "." + a]:
                cmds.setAttr(skin + "." + a, cmds.getAttr(out + "." + a))
                cmds.connectAttr(skin + "." + a, out + "." + a, f=1)
        if kind == "settings":
            add_settings_attrs(out, keyable=False)
        else:
            add_weight_attrs(out, [0] * 4, keyable=False)


def get_values(module_name):
    """Углы, веса костей и положения локаторов - для шаблона (показ - нет)."""
    p = module_name + "_"
    data = {"angles": {}, "weights": {}, "locators": {}}
    root = p + "root_skinJoint"
    for g in GROUPS:
        for pose in POSES:
            a = angle_attr(g, pose)
            if cmds.objExists(root + "." + a):
                data["angles"][a] = cmds.getAttr(root + "." + a)
    for k in range(1, scene_count(p) + 1):
        j = p + spoke_name(k) + "_skinJoint"
        if cmds.objExists(j + ".chest"):
            data["weights"][spoke_name(k)] = [cmds.getAttr(j + "." + a) for a in WEIGHTS]
        for g in GROUPS:
            for pose in POSES:
                loc = p + loc_name(k, g, pose)
                if cmds.objExists(loc):
                    data["locators"][loc_name(k, g, pose)] = {"t": list(cmds.getAttr(loc + ".t")[0]),
                                                              "r": list(cmds.getAttr(loc + ".r")[0])}
    return data


def set_values(module_name, data):
    p = module_name + "_"

    def put(plug, value):
        if cmds.objExists(plug) and not cmds.listConnections(plug, s=1, d=0):
            cmds.setAttr(plug, value)

    data = data or {}
    for a, v in data.get("angles", {}).items():
        put(p + "root_skinJoint." + a, v)
    for s, w in data.get("weights", {}).items():
        for a, v in zip(WEIGHTS, w):
            put(p + s + "_skinJoint." + a, v)
    for ln, v in data.get("locators", {}).items():
        for i, ax in enumerate("xyz"):
            put(p + ln + ".t" + ax, v["t"][i])
            put(p + ln + ".r" + ax, v["r"][i])


def link_settings(module_name):
    """Правая сторона берёт настройки с левой: mainPoser, углы, веса, локаторы.
    Правые локаторы скрыты - их положение приходит с левых."""
    if not module_name.startswith("r_"):
        return
    left = "l" + module_name[1:]
    pairs = []
    src_mp, dst_mp = left + "_mainPoser", module_name + "_mainPoser"
    if cmds.objExists(src_mp):
        for a in cmds.listAttr(src_mp, ud=1, k=1) or []:
            if a not in ("size", "globalSize", "lineSize", "lineWidth"):
                pairs.append((src_mp + "." + a, dst_mp + "." + a))
    for g in GROUPS:
        for pose in POSES:
            a = angle_attr(g, pose)
            pairs.append(("%s_root_skinJoint.%s" % (left, a), "%s_root_skinJoint.%s" % (module_name, a)))
    for k in range(1, scene_count(module_name + "_") + 1):
        for a in WEIGHTS:
            pairs.append(("%s_%s_skinJoint.%s" % (left, spoke_name(k), a), "%s_%s_skinJoint.%s" % (module_name, spoke_name(k), a)))
        for g in GROUPS:
            for pose in POSES:
                l_loc, r_loc = "%s_%s" % (left, loc_name(k, g, pose)), "%s_%s" % (module_name, loc_name(k, g, pose))
                if not cmds.objExists(r_loc):
                    continue
                for a in ("translate", "rotate"):
                    pairs.append((l_loc + "." + a, r_loc + "." + a))
                src = cmds.listConnections(r_loc + ".visibility", s=1, d=0, p=1)
                if src:
                    cmds.disconnectAttr(src[0], r_loc + ".visibility")
                cmds.setAttr(r_loc + ".visibility", 0)
    for src, dst in pairs:
        if cmds.objExists(src) and cmds.objExists(dst) and not cmds.listConnections(dst, s=1, d=0):
            cmds.connectAttr(src, dst, f=1)
