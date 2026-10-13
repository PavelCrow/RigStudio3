# Генератор шаблона shoulderFan.ma из point.ma (mayapy 2022).
#
# Плечевой пояс с веером (fan.py): ключица - цепочка point как есть, лопатка
# скользит по эллипсоиду рёбер (как в shoulder, но без своей скиновой кости -
# она только ведущий для костей веера), из центра fanCenter - веер костей.
# Мышечных костей shoulder здесь нет: их работу делает веер.
#
# Кадр всех расчётов - группа controls (кадр груди), покой = кадр root_poser;
# подробности - в generate_shoulder.py, отсюда берутся его кирпичики.
import os
import sys
import maya.cmds as cmds

HERE = os.path.dirname(os.path.abspath(__file__))
sys.path.insert(0, HERE)
sys.path.insert(0, os.path.join(os.path.dirname(HERE), "shoulder"))
import generate_shoulder as gs
import fan

# Позеры в кадре mainPoser (грудино-ключичный сустав), левая сторона:
# X - наружу, Y - вверх, Z - вперёд. Пропорции шаблона human (как в shoulder).
POSERS = [
    ("shoulder", (1.85, 0.65, -1.35), 0.25, 17),
    ("scapulaTop", (0.40, -0.40, -2.90), 0.2, 13),
    ("fanCenter", (-1.216, -2.70, -1.00), 0.3, 20),
]
SETTINGS = [  # на mainPoser: имя, значение по умолчанию, min, max
    ("scapulaFollow", 0.6, 0.0, 1.0),     # доля сдвига акромиона, на которую едет лопатка
    ("scapulaUp", 30.0, None, None),      # поворот лопатки, когда плечевая кость смотрит вверх
    ("scapulaDown", -20.0, None, None),   # ... вниз
]


def build():
    # --- 0. то, на что опираемся в point.ma
    gs.expect("root_decomposeMatrix.inputMatrix", "root_multMatrix.matrixSum")
    gs.expect("root_multMatrix.matrixIn[1]", "root.worldMatrix")
    gs.expect("root_outJoint.translate", "root_decomposeMatrix.outputTranslate")
    gs.expect("controls.offsetParentMatrix", "root_connector.worldMatrix")
    gs.expect("mirror_condition.firstTerm", "mod.mirror")

    # --- 1. позеры, настройки
    for name, t, size, color in POSERS:
        gs.poser(name, t, size, color)
    rib = gs.poser("ribcage", gs.RIBCAGE["t"], 1.0, 20)
    cmds.disconnectAttr("ribcage_size_multDoubleLinear.output", "ribcage_makeNurbSphere.radius")
    cmds.delete("ribcage_size_multDoubleLinear")
    cmds.deleteAttr(rib + ".size")
    cmds.setAttr("ribcage_makeNurbSphere.radius", 1)
    for a in ("rx", "ry", "rz", "sx", "sy", "sz"):
        cmds.setAttr(rib + "." + a, l=0, k=1)
    cmds.setAttr(rib + ".s", *gs.RIBCAGE["s"])
    cmds.setAttr("ribcage_poserShape.overrideShading", 0)
    cmds.setAttr("ribcage_poserShape.dvu", 2)
    cmds.setAttr("ribcage_poserShape.dvv", 2)

    for name, t in gs.REST_LOCS:
        loc = cmds.spaceLocator(n=name + "_loc")[0]
        assert loc == name + "_loc"
        cmds.parent(loc, "shoulder_poser", r=1)
        cmds.setAttr(loc + ".t", *t)
        cmds.setAttr(loc + ".v", 0)

    gs.guide_line("scapula", ["scapulaTop_poser", "shoulder_poser"], 13)
    gs.guide_line("clavicle", ["root_poser", "shoulder_poser"], 17)

    for name, dv, mn, mx in SETTINGS:
        kw = {}
        if mn is not None: kw["min"] = mn
        if mx is not None: kw["max"] = mx
        cmds.addAttr("mainPoser", ln=name, at="double", dv=dv, **kw)
        cmds.setAttr("mainPoser." + name, e=1, k=1)
    cmds.addAttr("mod", ln="armConnected", at="double", dv=0)        # shoulderFan.py

    # --- 2. рука (входы переключает shoulderFan.py), ключица
    humerus_rest = gs.mmat("humerusRest", ["shoulder_poser.worldMatrix[0]", "root_poser.worldInverseMatrix[0]"])
    elbow_rest = gs.mmat("elbowRest", ["elbowRest_loc.worldMatrix[0]", "root_poser.worldInverseMatrix[0]"])
    S0 = gs.translation("humerusRest", humerus_rest)
    F = gs.mmat("clav", ["root.worldMatrix[0]", "controls.worldInverseMatrix[0]"])
    humerus = gs.mmat("humerus", [humerus_rest, F])
    elbow = gs.mmat("elbow", [elbow_rest, F])
    h_hat = gs.normalize("humerusDir", gs.sub("humerusDir", gs.translation("elbow", elbow), gs.translation("humerus", humerus)))
    h0_hat = gs.normalize("humerusDirRest", gs.sub("humerusDirRest", gs.translation("elbowRest", elbow_rest), S0))
    scap_delta2 = gs.smooth_delta("scapulaRhythm", [h_hat + "Y", None, None], [h0_hat + "Y", None, None],
                                  ["mainPoser.scapulaUp", None, None], ["mainPoser.scapulaDown", None, None])
    scap_w = gs.node("multDoubleLinear", "scapulaRhythm_weight_multDoubleLinear")
    gs.conn("mod.armConnected", scap_w + ".input1")
    cmds.setAttr(scap_w + ".input2", -0.5)
    scap_angle = gs.node("multDoubleLinear", "scapulaRhythm_angle_multDoubleLinear")
    gs.conn(scap_delta2 + "X", scap_angle + ".input1")
    gs.conn(scap_w + ".output", scap_angle + ".input2")

    # отражение для локальных матриц детей кости ключицы и её обратный кадр
    zc = gs.node("condition", "zFlip_condition")
    gs.conn("mod.mirror", zc + ".firstTerm")
    cmds.setAttr(zc + ".secondTerm", 1)
    cmds.setAttr(zc + ".colorIfTrueR", -1)
    cmds.setAttr(zc + ".colorIfFalseR", 1)
    zf = gs.node("composeMatrix", "zFlip_composeMatrix")
    gs.conn(zc + ".outColorR", zf + ".inputScaleZ")
    gs.inverse("clav", F)

    # --- 3. эллипсоид рёбер и лопатка (ведущий для веера)
    E = gs.mmat("ribcage", ["ribcage_poser.matrix", "root_poser.inverseMatrix"])
    Einv = gs.inverse("ribcage", E)
    tr = gs.node("transposeMatrix", "ribcageNormal_transposeMatrix")
    gs.conn(Einv, tr + ".inputMatrix")
    EinvT = tr + ".outputMatrix"

    def project(name, p, p_rest):
        q = gs.pmm(name + "_sphere", p, Einv)
        n = gs.normalize(name + "_sphere", q)
        gap = gs.node("distanceBetween", name + "_gap_distanceBetween")
        gs.conn(gs.pmm(name + "_sphereRest", p_rest, Einv), gap + ".point1")
        qs = gs.mul(name + "_surface", n, (1, 1, 1))
        for ax in "XYZ":
            gs.conn(gap + ".distance", qs.replace(".output", ".input2" + ax))
        pt = gs.pmm(name + "_onRibs", qs, E)
        nv = gs.node("vectorProduct", name + "_normal_vectorProduct")
        cmds.setAttr(nv + ".operation", 3)
        cmds.setAttr(nv + ".normalizeOutput", 1)
        gs.conn(n, nv + ".input1")
        gs.conn(EinvT, nv + ".matrix")
        return pt, nv + ".output"

    def frame(name, origin, target, normal):
        a = gs.node("aimMatrix", name + "_aimMatrix")
        gs.conn(gs.pos_matrix(name + "_origin", origin), a + ".inputMatrix")
        gs.conn(gs.pos_matrix(name + "_target", target), a + ".primaryTargetMatrix")
        cmds.setAttr(a + ".primaryInputAxis", 1, 0, 0)
        cmds.setAttr(a + ".secondaryInputAxis", 0, 1, 0)
        cmds.setAttr(a + ".secondaryMode", 2)
        gs.conn(normal, a + ".secondaryTargetVector")
        return a + ".outputMatrix"

    Ac0 = gs.rest_point("shoulder_poser")
    Ac = gs.pmm("acromion", Ac0, F)
    T0 = gs.rest_point("scapulaTop_poser")
    follow = gs.mul("scapulaFollow", gs.sub("acromionShift", Ac, Ac0), (1, 1, 1))
    for ax in "XYZ":
        gs.conn("mainPoser.scapulaFollow", follow.replace(".output", ".input2" + ax))
    T, N = project("scapulaTop", gs.add("scapulaTop", T0, follow), T0)
    scap = frame("scapula", T, Ac, N)
    _, N0 = project("scapulaTopRest", T0, T0)
    scap0 = frame("scapulaRest", T0, Ac0, N0)
    # лопатка целиком: кадр верхнего угла, повёрнутый вокруг нормали по ритму
    ry = gs.node("composeMatrix", "scapulaRotation_composeMatrix")
    gs.conn(scap_angle + ".output", ry + ".inputRotateY")
    scap_bone = gs.mmat("scapulaBone", [ry + ".outputMatrix", scap])

    # --- 4. веер
    net = fan.Net("")
    fan.build_base(net, {
        "F": F, "clav_ctrl": "root",
        "scapula": scap_bone, "scapulaRest": scap0,
        "humerus": humerus, "humerusRest": humerus_rest,
        "humerusDir": h_hat, "humerusDirRest": h0_hat,
        "armConnected": "mod.armConnected",
    })
    for k in range(1, fan.DEFAULT_COUNT + 1):
        fan.build_spoke(net, k)


if __name__ == "__main__":
    import maya.standalone
    maya.standalone.initialize()
    for p in ("matrixNodes",):
        cmds.loadPlugin(p, quiet=1)
    SRC = r"F:/Maya_Projects/rigStudio3/modules/point/point.ma"
    DST = sys.argv[1] if len(sys.argv) > 1 else os.path.join(HERE, "shoulderFan.ma").replace("\\", "/")
    cmds.file(SRC, o=1, f=1)
    build()
    cmds.file(rename=DST)
    cmds.file(save=1, type="mayaAscii")
    print("saved", DST)
