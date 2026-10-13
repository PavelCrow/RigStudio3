# Генератор шаблона shoulder.ma из point.ma (mayapy 2022).
#
# Плечевой пояс: ключица, лопатка, которая скользит по рёбрам, и мышечные
# кости груди и спины.
#
# Всё считается в кадре группы controls (он же root_connector, "кадр груди"):
# этот кадр прибит к родительской кости и у правой стороны отражён, поэтому
# одни и те же локальные формулы дают зеркальное движение без отдельной
# настройки для правой стороны. Кадр покоя = кадр root_poser.
#
# - Ключица - ручной контрол, как у point (кость root_outJoint собрана так же).
#   Авто-подъёма от руки нет: Павлу он не нужен (2026-10-09). Её кадр в груди
#   F = root * controls^-1.
# - Лопатка. Верхний угол сдвигается вслед за акромионом (scapulaFollow) и
#   проецируется на эллипсоид рёбер (позер ribcage) с сохранением зазора покоя.
#   Ось X смотрит на акромион, Y - нормаль рёбер. Нижний угол поворачивается
#   вокруг нормали от подъёма плечевой кости (лопаточно-плечевой ритм) и тоже
#   ложится на эллипсоид.
# - Мышцы (грудная верх/низ, широчайшая, трапеция): кость в "брюшке" между
#   началом и прикреплением, X вдоль волокон, растяжение по X, объём по Y/Z.
#
# Гладкая отдача без излома в покое (как в birdTail): угол = f(u) - f(u0),
# f(u) = (O-C)/2 * u + (O+C)/2 * u^2, O - значение при u = 1 (рука вверх /
# вниз), C - при u = -1.
import os
import sys
import maya.cmds as cmds

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import fibers
import poses

# Позеры в кадре mainPoser (он стоит в грудино-ключичном суставе), левая сторона:
# X - наружу, Y - вверх, Z - вперёд. Пропорции шаблона human.
POSERS = [
    # name,              translate,                  size,  color
    ("shoulder",        (1.85, 0.65, -1.35),          0.25,  17),
    ("scapulaTop",      (0.40, -0.40, -2.90),         0.2,   13),
    ("scapulaTip",      (0.90, -3.80, -2.60),         0.2,   13),
    ("pecUpperOrigin",  (0.60, 0.10, -0.10),          0.15,  18),
    ("pecLowerOrigin",  (-0.70, -2.20, 1.10),         0.15,  18),
    ("pecInsert",       (3.15, 0.0, -1.10),           0.15,  18),
    ("latOrigin",       (0.40, -5.40, -2.50),         0.15,  18),
    ("latInsert",       (3.10, -0.10, -2.10),         0.15,  18),
    ("trapOrigin",      (-0.50, 1.70, -1.40),         0.15,  18),
    ("trapInsert",      (1.40, 0.90, -1.90),          0.15,  18),
]
RIBCAGE = {"t": (-1.216, -2.70, -1.00), "s": (3.0, 4.2, 2.0)}
# заглушка локтя, пока рука не подключена (в кадре позера shoulder)
REST_LOCS = [("elbowRest", (5.0, 0.0, 0.0))]

# Мышцы: начало и прикрепление - позер и кадр, в котором он едет
# ("chest" - грудь, "clav" - ключица, "humerus" - плечевая кость),
# второй вектор - куда смотрит ось Y кости (в кадре груди).
MUSCLES = [
    ("pecUpper", "pecUpperOrigin", "clav", "pecInsert", "humerus", (0, 0, 1)),
    ("pecLower", "pecLowerOrigin", "chest", "pecInsert", "humerus", (0, 0, 1)),
    ("lat", "latOrigin", "chest", "latInsert", "humerus", (0, 0, -1)),
    ("trap", "trapOrigin", "chest", "trapInsert", "clav", (0, 1, 0)),
]

SETTINGS = [  # на mainPoser: имя, значение по умолчанию, min, max
    ("scapulaFollow", 0.6, 0.0, 1.0),     # доля сдвига акромиона, на которую едет лопатка
    ("scapulaUp", 30.0, None, None),      # поворот лопатки, когда плечевая кость смотрит вверх
    ("scapulaDown", -20.0, None, None),   # ... вниз
    ("muscleVolume", 0.5, 0.0, 2.0),      # 1 - объём мышцы сохраняется полностью
    ("pecUpperBelly", 0.5, 0.0, 1.0),     # где на линии начало-прикрепление стоит кость
    ("pecLowerBelly", 0.5, 0.0, 1.0),
    ("latBelly", 0.5, 0.0, 1.0),
    ("trapBelly", 0.5, 0.0, 1.0),
]


def src(plug):
    c = cmds.listConnections(plug, s=1, d=0, p=1, scn=1)
    return c[0] if c else None


def expect(plug, source):
    got = src(plug)
    assert got == source, "%s <- %s, expected %s" % (plug, got, source)


def node(t, name, parent=None):
    if int(cmds.about(v=1).split()[0]) >= 2026:
        t = {"multDoubleLinear": "multDL", "addDoubleLinear": "addDL"}.get(t, t)
    made = cmds.createNode(t, n=name, p=parent) if parent else cmds.createNode(t, n=name)
    assert made == name, (made, name)
    return made


def conn(a, b):
    cmds.connectAttr(a, b, f=1)


def conn3(srcs, dst):
    """Три скалярных выхода (или None = 0) во вход-вектор."""
    for s, ax in zip(srcs, "XYZ"):
        if dst.endswith("]"):          # input3D[i] у plusMinusAverage: дети input3Dx..z
            child = "%s.%s%s" % (dst, dst.split(".")[-1].split("[")[0], ax.lower())
        else:
            child = dst + ax
        if s is None:
            cmds.setAttr(child, 0)
        elif isinstance(s, (int, float)):
            cmds.setAttr(child, s)
        else:
            conn(s, child)


def poser(name, t, size, color, parent="mainPoser"):
    """Позер как у шаблонов: сфера, size * globalSize, двигается только переносом."""
    p = cmds.group(em=1, n=name + "_poser", p=parent)
    assert p == name + "_poser"
    cmds.addAttr(p, ln="size", at="double", dv=size, min=0, k=1)
    cmds.setAttr(p + ".ove", 1)
    cmds.setAttr(p + ".ovc", color)
    cmds.setAttr(p + ".t", *t)
    for a in ["rx", "ry", "rz", "sx", "sy", "sz"]:
        cmds.setAttr(p + "." + a, l=1, k=0)
    cmds.setAttr(p + ".v", k=0)

    sphere = node("makeNurbSphere", name + "_makeNurbSphere")
    shape = node("nurbsSurface", name + "_poserShape", parent=p)
    conn(sphere + ".outputSurface", shape + ".create")
    for a, v in (("ove", 1), ("ovc", color), ("vir", 1), ("vif", 1), ("tw", 1), ("dvu", 3), ("dvv", 3)):
        cmds.setAttr(shape + "." + a, v)
    mdl = node("multDoubleLinear", name + "_size_multDoubleLinear")
    conn(p + ".size", mdl + ".input1")
    conn("mainPoser.globalSize", mdl + ".input2")
    conn(mdl + ".output", sphere + ".radius")
    return p


def guide_line(name, posers, color):
    """Линия-подсказка между позерами (CV = положения позеров, не выделяется)."""
    crv = cmds.curve(d=1, p=[(0, 0, i) for i in range(len(posers))], n=name + "_guide")
    assert crv == name + "_guide"
    shape = cmds.rename(cmds.listRelatives(crv, s=1)[0], name + "_guideShape")
    cmds.parent(crv, "mainPoser", r=1)
    cmds.setAttr(shape + ".ove", 1)
    cmds.setAttr(shape + ".ovc", color)
    cmds.setAttr(shape + ".ovdt", 2)
    for a in ("t", "r", "s"):
        for ax in "xyz":
            cmds.setAttr(crv + "." + a + ax, l=1, k=0)
    for i, p in enumerate(posers):
        conn(p + ".translate", shape + ".controlPoints[%d]" % i)


# ---------------------------------------------------------------- векторные кирпичики
def pmm(name, point, matrix):
    """Точка * матрица. point - плаг вектора или кортеж."""
    n = node("pointMatrixMult", name + "_pointMatrixMult")
    if isinstance(point, tuple):
        cmds.setAttr(n + ".inPoint", *point)
    else:
        conn(point, n + ".inPoint")
    conn(matrix, n + ".inMatrix")
    return n + ".output"


_rest_points = {}


def rest_point(p):
    """Положение позера в кадре покоя (кадре root_poser). Статично, одна нода на позер."""
    if p not in _rest_points:
        _rest_points[p] = pmm(p + "_rest", p + ".translate", "root_poser.inverseMatrix")
    return _rest_points[p]


def mmat(name, plugs):
    n = node("multMatrix", name + "_multMatrix")
    for i, pl in enumerate(plugs):
        conn(pl, n + ".matrixIn[%d]" % i)
    return n + ".matrixSum"


def translation(name, matrix):
    n = node("decomposeMatrix", name + "_decomposeMatrix")
    conn(matrix, n + ".inputMatrix")
    return n + ".outputTranslate"


def pos_matrix(name, vec):
    n = node("composeMatrix", name + "_composeMatrix")
    conn(vec, n + ".inputTranslate")
    return n + ".outputMatrix"


def sub(name, a, b):
    n = node("plusMinusAverage", name + "_plusMinusAverage")
    cmds.setAttr(n + ".operation", 2)
    conn(a, n + ".input3D[0]")
    conn(b, n + ".input3D[1]")
    return n + ".output3D"


def add(name, a, b):
    n = node("plusMinusAverage", name + "_plusMinusAverage")
    cmds.setAttr(n + ".operation", 1)
    conn(a, n + ".input3D[0]")
    conn(b, n + ".input3D[1]")
    return n + ".output3D"


def mul(name, a, b, op=1):
    n = node("multiplyDivide", name + "_multiplyDivide")
    cmds.setAttr(n + ".operation", op)
    for plug, dst in ((a, ".input1"), (b, ".input2")):
        if isinstance(plug, tuple):
            cmds.setAttr(n + dst, *plug)
        else:
            conn(plug, n + dst)
    return n + ".output"


def normalize(name, v):
    n = node("vectorProduct", name + "_vectorProduct")
    cmds.setAttr(n + ".operation", 0)
    cmds.setAttr(n + ".normalizeOutput", 1)
    conn(v, n + ".input1")
    return n + ".output"


def inverse(name, m):
    n = node("inverseMatrix", name + "_inverseMatrix")
    conn(m, n + ".inputMatrix")
    return n + ".outputMatrix"


def distance(name, a, b):
    n = node("distanceBetween", name + "_distanceBetween")
    conn(a, n + ".point1")
    conn(b, n + ".point2")
    return n + ".distance"


def smooth_delta(name, u, u0, opens, closes):
    """2 * (f(u) - f(u0)) по каналам, f(u) = (O-C)/2*u + (O+C)/2*u^2.

    u, u0, opens, closes - списки скалярных плагов (None = 0). Возвращает
    выход-вектор. 2*(f(u)-f(u0)) = (u-u0) * ((O-C) + (O+C)*(u+u0)).
    Каналы одной цепочки зависят друг от друга по мнению DG (атрибуты
    составные), поэтому то, что читает результат, не должно в неё же писать.
    """
    vu = node("plusMinusAverage", name + "_u_plusMinusAverage")
    conn3(u, vu + ".input3D[0]")
    vu0 = node("plusMinusAverage", name + "_u0_plusMinusAverage")
    conn3(u0, vu0 + ".input3D[0]")
    oc = node("plusMinusAverage", name + "_sumOC_plusMinusAverage")
    conn3(opens, oc + ".input3D[0]")
    conn3(closes, oc + ".input3D[1]")
    od = node("plusMinusAverage", name + "_diffOC_plusMinusAverage")
    cmds.setAttr(od + ".operation", 2)
    conn3(opens, od + ".input3D[0]")
    conn3(closes, od + ".input3D[1]")
    du = sub(name + "_du", vu + ".output3D", vu0 + ".output3D")
    su = add(name + "_su", vu + ".output3D", vu0 + ".output3D")
    slope = add(name + "_slope", od + ".output3D", mul(name + "_curve", oc + ".output3D", su))
    return mul(name + "_delta", du, slope)


# ---------------------------------------------------------------- сборка
def build():
    # --- 0. то, на что опираемся в point.ma
    expect("root_decomposeMatrix.inputMatrix", "root_multMatrix.matrixSum")
    expect("root_multMatrix.matrixIn[1]", "root.worldMatrix")
    expect("root_multMatrix.matrixIn[2]", "outJoints.worldInverseMatrix")
    expect("root_outJoint.translate", "root_decomposeMatrix.outputTranslate")
    expect("root_outJoint.rotate", "root_decomposeMatrix.outputRotate")
    expect("controls.offsetParentMatrix", "root_connector.worldMatrix")
    expect("mirror_condition.firstTerm", "mod.mirror")

    # --- 1. позеры, настройки
    for name, t, size, color in POSERS:
        poser(name, t, size, color)
    rib = poser("ribcage", RIBCAGE["t"], 1.0, 20)
    # эллипсоид: сфера радиуса 1, форма - масштабом позера
    cmds.disconnectAttr("ribcage_size_multDoubleLinear.output", "ribcage_makeNurbSphere.radius")
    cmds.delete("ribcage_size_multDoubleLinear")
    cmds.deleteAttr(rib + ".size")
    cmds.setAttr("ribcage_makeNurbSphere.radius", 1)
    for a in ("rx", "ry", "rz", "sx", "sy", "sz"):
        cmds.setAttr(rib + "." + a, l=0, k=1)
    cmds.setAttr(rib + ".s", *RIBCAGE["s"])
    cmds.setAttr("ribcage_poserShape.overrideShading", 0)     # каркас - не закрывает тело
    cmds.setAttr("ribcage_poserShape.dvu", 2)
    cmds.setAttr("ribcage_poserShape.dvv", 2)

    for name, t in REST_LOCS:
        loc = cmds.spaceLocator(n=name + "_loc")[0]
        assert loc == name + "_loc"
        cmds.parent(loc, "shoulder_poser", r=1)
        cmds.setAttr(loc + ".t", *t)
        cmds.setAttr(loc + ".v", 0)

    guide_line("scapula", ["scapulaTop_poser", "shoulder_poser", "scapulaTip_poser", "scapulaTop_poser"], 13)
    guide_line("clavicle", ["root_poser", "shoulder_poser"], 17)
    for m, o, _, i, _, _ in MUSCLES:
        guide_line(m, [o + "_poser", i + "_poser"], 18)

    for name, dv, mn, mx in SETTINGS:
        kw = {}
        if mn is not None: kw["min"] = mn
        if mx is not None: kw["max"] = mx
        cmds.addAttr("mainPoser", ln=name, at="double", dv=dv, **kw)
        cmds.setAttr("mainPoser." + name, e=1, k=1)

    # заполняет shoulder.py, когда к модулю подключается рука
    cmds.addAttr("mod", ln="armConnected", at="double", dv=0)

    # --- 2. рука: кадры покоя (статично) и живые кадры в кадре груди
    # Пока руки нет - плечо в позере shoulder, локоть - заглушка под ним, а
    # живые кадры едут за ключицей. shoulder.py перекидывает входы.
    humerus_rest = mmat("humerusRest", ["shoulder_poser.worldMatrix[0]", "root_poser.worldInverseMatrix[0]"])
    elbow_rest = mmat("elbowRest", ["elbowRest_loc.worldMatrix[0]", "root_poser.worldInverseMatrix[0]"])
    S0 = translation("humerusRest", humerus_rest)

    # --- 3. ключица: кость root_outJoint - цепочка point как есть, здесь только
    # её кадр в груди для лопатки и мышц
    F = mmat("clav", ["root.worldMatrix[0]", "controls.worldInverseMatrix[0]"])

    # плечевая кость (для лопатки и мышц)
    humerus = mmat("humerus", [humerus_rest, F])               # shoulder.py: плечевая кость руки
    elbow = mmat("elbow", [elbow_rest, F])                     # shoulder.py: локоть руки
    h_hat = normalize("humerusDir", sub("humerusDir", translation("elbow", elbow), translation("humerus", humerus)))
    h0_hat = normalize("humerusDirRest", sub("humerusDirRest", translation("elbowRest", elbow_rest), S0))
    # поворот лопатки наружу = минус вокруг её нормали; 0.5 - от 2*f
    scap_delta2 = smooth_delta("scapulaRhythm", [h_hat + "Y", None, None], [h0_hat + "Y", None, None],
                               ["mainPoser.scapulaUp", None, None], ["mainPoser.scapulaDown", None, None])
    scap_w = node("multDoubleLinear", "scapulaRhythm_weight_multDoubleLinear")
    conn("mod.armConnected", scap_w + ".input1")
    cmds.setAttr(scap_w + ".input2", -0.5)
    scap_angle = node("multDoubleLinear", "scapulaRhythm_angle_multDoubleLinear")
    conn(scap_delta2 + "X", scap_angle + ".input1")
    conn(scap_w + ".output", scap_angle + ".input2")

    # Локальная матрица дочерней кости root_outJoint из кадра груди. Справа
    # кость ключицы - это контрол с перевёрнутой Z (собственный поворот), и
    # дети живут так же: L = Zf * M * F^-1 * Zf.
    zc = node("condition", "zFlip_condition")
    conn("mod.mirror", zc + ".firstTerm")
    cmds.setAttr(zc + ".secondTerm", 1)
    cmds.setAttr(zc + ".colorIfTrueR", -1)
    cmds.setAttr(zc + ".colorIfFalseR", 1)
    zf = node("composeMatrix", "zFlip_composeMatrix")
    conn(zc + ".outColorR", zf + ".inputScaleZ")
    Zf = zf + ".outputMatrix"
    Finv = inverse("clav", F)

    def joint(name, matrix, scale=None):
        j = cmds.createNode("joint", n=name + "_outJoint", p="root_outJoint")
        assert j == name + "_outJoint"
        cmds.setAttr(j + ".radius", 0.5)
        local = mmat(name + "_local", [Zf, matrix, Finv, Zf])
        d = node("decomposeMatrix", name + "_local_decomposeMatrix")
        conn(local, d + ".inputMatrix")
        conn(d + ".outputTranslate", j + ".translate")
        conn(d + ".outputRotate", j + ".rotate")
        if scale:
            conn3(scale, j + ".scale")
        cmds.sets(j, e=1, forceElement="skinJointsSet")
        return j

    # --- 4. эллипсоид рёбер (в кадре груди, статично)
    E = mmat("ribcage", ["ribcage_poser.matrix", "root_poser.inverseMatrix"])
    Einv = inverse("ribcage", E)
    tr = node("transposeMatrix", "ribcageNormal_transposeMatrix")
    conn(Einv, tr + ".inputMatrix")
    EinvT = tr + ".outputMatrix"

    def project(name, p, p_rest):
        """Точка на эллипсоид с зазором покоя; возвращает (точка, нормаль)."""
        q = pmm(name + "_sphere", p, Einv)
        n = normalize(name + "_sphere", q)
        gap = node("distanceBetween", name + "_gap_distanceBetween")
        conn(pmm(name + "_sphereRest", p_rest, Einv), gap + ".point1")
        qs = mul(name + "_surface", n, (1, 1, 1))
        for ax in "XYZ":
            conn(gap + ".distance", qs.replace(".output", ".input2" + ax))
        pt = pmm(name + "_onRibs", qs, E)
        nv = node("vectorProduct", name + "_normal_vectorProduct")
        cmds.setAttr(nv + ".operation", 3)
        cmds.setAttr(nv + ".normalizeOutput", 1)
        conn(n, nv + ".input1")
        conn(EinvT, nv + ".matrix")
        return pt, nv + ".output"

    # --- 5. лопатка
    Ac0 = rest_point("shoulder_poser")
    Ac = pmm("acromion", Ac0, F)
    T0 = rest_point("scapulaTop_poser")
    follow = mul("scapulaFollow", sub("acromionShift", Ac, Ac0), (1, 1, 1))
    for ax in "XYZ":
        conn("mainPoser.scapulaFollow", follow.replace(".output", ".input2" + ax))
    T, N = project("scapulaTop", add("scapulaTop", T0, follow), T0)

    def frame(name, origin, target, normal):
        a = node("aimMatrix", name + "_aimMatrix")
        conn(pos_matrix(name + "_origin", origin), a + ".inputMatrix")
        conn(pos_matrix(name + "_target", target), a + ".primaryTargetMatrix")
        cmds.setAttr(a + ".primaryInputAxis", 1, 0, 0)
        cmds.setAttr(a + ".secondaryInputAxis", 0, 1, 0)
        cmds.setAttr(a + ".secondaryMode", 2)                  # align
        if isinstance(normal, tuple):
            cmds.setAttr(a + ".secondaryTargetVector", *normal)
        else:
            conn(normal, a + ".secondaryTargetVector")
        return a + ".outputMatrix"

    scap = frame("scapula", T, Ac, N)
    joint("scapula", scap)

    # нижний угол: смещение покоя в кадре лопатки покоя, поворот вокруг нормали
    _, N0 = project("scapulaTopRest", T0, T0)
    scap0 = frame("scapulaRest", T0, Ac0, N0)
    tip0 = pmm("scapulaTip_offset", rest_point("scapulaTip_poser"), inverse("scapulaRest", scap0))
    ry = node("composeMatrix", "scapulaRotation_composeMatrix")
    conn(scap_angle + ".output", ry + ".inputRotateY")
    tipm = mmat("scapulaTip", [ry + ".outputMatrix", scap])
    tip, _ = project("scapulaTip", pmm("scapulaTip", tip0, tipm), rest_point("scapulaTip_poser"))
    rot = node("pickMatrix", "scapulaTip_pickMatrix")
    conn(tipm, rot + ".inputMatrix")
    cmds.setAttr(rot + ".useTranslate", 0)
    joint("scapulaTip", mmat("scapulaTipFrame", [rot + ".outputMatrix", pos_matrix("scapulaTip", tip)]))

    # --- 6. мышцы
    humerus_rest_inv = inverse("humerusRest", humerus_rest)
    vol = node("multDoubleLinear", "muscleVolume_multDoubleLinear")
    conn("mainPoser.muscleVolume", vol + ".input1")
    cmds.setAttr(vol + ".input2", -0.5)

    def attached(name, poser_name, space):
        rest = rest_point(poser_name + "_poser")
        if space == "chest":
            return rest, rest
        if space == "clav":
            return pmm(name, rest, F), rest
        local = pmm(name + "_humerusLocal", rest, humerus_rest_inv)
        return pmm(name, local, humerus), rest

    for m, o, o_space, i, i_space, up in MUSCLES:
        O, O0 = attached(m + "Origin", o, o_space)
        I, I0 = attached(m + "Insert", i, i_space)
        bc = node("blendColors", m + "_belly_blendColors")
        conn(I, bc + ".color1")
        conn(O, bc + ".color2")
        conn("mainPoser.%sBelly" % m, bc + ".blender")
        aim = frame(m, bc + ".output", I, up)
        ratio = node("multiplyDivide", m + "_stretch_multiplyDivide")
        cmds.setAttr(ratio + ".operation", 2)
        conn(distance(m, O, I), ratio + ".input1X")
        conn(distance(m + "Rest", O0, I0), ratio + ".input2X")
        pw = node("multiplyDivide", m + "_volume_multiplyDivide")
        cmds.setAttr(pw + ".operation", 3)
        conn(ratio + ".outputX", pw + ".input1X")
        conn(vol + ".output", pw + ".input2X")
        joint(m, aim, [ratio + ".outputX", pw + ".outputX", pw + ".outputX"])

    # --- 7. мышцы не крутятся, когда схлопываются (fibers.py)
    fibers.add("")
    fibers.add_roll_fix("")

    # --- 8. крайние положения ключицы: смещения костей вперёд / назад / вверх (poses.py)
    poses.add("")


if __name__ == "__main__":
    import maya.standalone
    maya.standalone.initialize()
    for p in ("matrixNodes",):
        cmds.loadPlugin(p, quiet=1)
    SRC = r"F:/Maya_Projects/rigStudio3/modules/point/point.ma"
    DST = sys.argv[1] if len(sys.argv) > 1 else r"F:/Maya_Projects/rigStudio3/modules/shoulder/shoulder.ma"
    cmds.file(SRC, o=1, f=1)
    build()
    cmds.file(rename=DST)
    cmds.file(save=1, type="mayaAscii")
    print("saved", DST)
