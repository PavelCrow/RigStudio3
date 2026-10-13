# Генератор шаблона footRoll.ma из foot.ma (mayapy 2022).
#
# Перекат по профилю подошвы. Кривая soleProfile (вид сбоку: пятка, подушка,
# скруглённый носок) задаётся позерами sole1..sole7 - это её CV. При повороте
# стопы на угол rx на землю встаёт самая нижняя точка кривой: вокруг неё
# крутится heelTwist_group, и стопа опускается так, чтобы эта точка легла на
# уровень подошвы, и сдвигается на длину пройденной дуги (rollGrip) - качение
# без проскальзывания, а не поворот вокруг одной точки. Крен bank вокруг bankIn/bankOut. Трансляции ik_toe/fk_toe доходят до
# toe_outJoint.
import sys
import maya.cmds as cmds

SOLE = [                       # кадр mainPoser: Y вверх, Z вперёд, земля Y=0
    (0.0, 0.45, -2.75),
    (0.0, 0.0, -2.65),
    (0.0, 0.0, -1.6),
    (0.0, 0.0, 0.4),
    (0.0, 0.0, 2.0),
    (0.0, 0.1, 2.95),
    (0.0, 0.55, 3.0),
]
BANK = [
    ("bankIn", (-1.2, 0.0, 0.0)),
    ("bankOut", (1.0, 0.0, 0.0)),
]
FAR = 1000.0                   # "бесконечно далёкая" точка для поиска нижней точки кривой


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


def poser(name, t, size, color, lock_tx):
    """Позер как rigTools/poser.ma: сфера, size * globalSize."""
    p = cmds.group(em=1, n=name + "_poser", p="mainPoser")
    assert p == name + "_poser"
    cmds.addAttr(p, ln="size", at="double", dv=size, min=0, k=1)
    cmds.setAttr(p + ".ove", 1)
    cmds.setAttr(p + ".ovc", color)
    cmds.setAttr(p + ".t", *t)
    locks = ["rx", "ry", "rz", "sx", "sy", "sz"] + (["tx"] if lock_tx else [])
    for a in locks:
        cmds.setAttr(p + "." + a, l=1, k=0)
    cmds.setAttr(p + ".v", k=0)

    sphere = node("makeNurbSphere", name + "_makeNurbSphere")
    # форма сразу под позером: без родителя createNode оставил бы трансформ в корне
    shape = node("nurbsSurface", name + "_poserNurbsShape", parent=p)
    cmds.connectAttr(sphere + ".outputSurface", shape + ".create")
    # как у позеров шаблона: без шейдинг-группы, цвет - override
    for a, v in (("ove", 1), ("ovc", color), ("vir", 1), ("vif", 1), ("tw", 1), ("dvu", 3), ("dvv", 3)):
        cmds.setAttr(shape + "." + a, v)
    mdl = node("multDoubleLinear", name + "_size_multDoubleLinear")
    cmds.connectAttr(p + ".size", mdl + ".input1")
    cmds.connectAttr("mainPoser.globalSize", mdl + ".input2")
    cmds.connectAttr(mdl + ".output", sphere + ".radius")
    return p


def local_pos(p, space, name):
    """Положение позера в кадре другого позера (статично, считается один раз)."""
    mm = node("multMatrix", name + "_multMat")
    dm = node("decomposeMatrix", name + "_decMat")
    cmds.connectAttr(p + ".worldMatrix[0]", mm + ".matrixIn[0]")
    cmds.connectAttr(space + ".worldInverseMatrix[0]", mm + ".matrixIn[1]")
    cmds.connectAttr(mm + ".matrixSum", dm + ".inputMatrix")
    return dm + ".outputTranslate"


def build():
    heel = "ik_heel"

    # --- 1. старый пивот по контуру edge убираем целиком
    expect("footPivot.translate", "nearestPointOnCurve1.position")
    expect("heelTwist_group.rotatePivot", "decomposeMatrix245.outputTranslate")
    expect("decomposeMatrix245.inputMatrix", "multMatrix199.matrixSum")
    aim_inputs = cmds.listConnections("footPivotAim_grp", s=1, d=0, type="unitConversion") or []
    cmds.delete("nearestPointOnCurve1", "footPivotAim_grp", "edge", "footPivot",
                "multMatrix199", "decomposeMatrix245", *aim_inputs)

    # --- 2. крен: две группы между mirror_group и footTwistFront_group
    bank_in = cmds.group(em=1, n="bank_in", p="mirror_group")
    bank_out = cmds.group(em=1, n="bank_out", p=bank_in)
    assert (bank_in, bank_out) == ("bank_in", "bank_out")
    cmds.parent("footTwistFront_group", bank_out, r=1)
    cmds.addAttr(heel, ln="bank", at="double", dv=0, k=1)
    cl = node("clamp", "bank_clamp")
    cmds.connectAttr(heel + ".bank", cl + ".inputR")
    cmds.connectAttr(heel + ".bank", cl + ".inputG")
    cmds.setAttr(cl + ".minR", -360); cmds.setAttr(cl + ".maxR", 0)
    cmds.setAttr(cl + ".minG", 0); cmds.setAttr(cl + ".maxG", 360)
    cmds.connectAttr(cl + ".outputG", bank_in + ".rotateZ")
    cmds.connectAttr(cl + ".outputR", bank_out + ".rotateZ")
    for name, t in BANK:
        p = poser(name, t, 0.15, 12, lock_tx=False)
        # кадр root_poser - это кадр mirror_group (как footTwistFront_group от toe_poser)
        pos = local_pos(p, "root_poser", name)
        cmds.connectAttr(pos, (bank_in if name == "bankIn" else bank_out) + ".rotatePivot")

    # --- 3. профиль подошвы: кривая под heelTwist_group, CV - позеры sole*
    # Кадр кривой - кадр родителя heelTwist_group в покое = footTwistFront_group,
    # он стоит в toe_poser (decomposeMatrix244 <- toe_poser * root_poser^-1).
    expect("footTwistFront_group.translate", "decomposeMatrix244.outputTranslate")
    expect("decomposeMatrix244.inputMatrix", "multMatrix198.matrixSum")
    expect("multMatrix198.matrixIn[0]", "toe_poser.worldMatrix")
    curve = cmds.curve(d=3, p=[(0, 0, i) for i in range(len(SOLE))], n="soleProfile")
    assert curve == "soleProfile"
    shape = cmds.rename(cmds.listRelatives(curve, s=1)[0], "soleProfileShape")
    cmds.parent(curve, "heelTwist_group", r=1)
    cmds.connectAttr("posers.visibility", curve + ".visibility")
    cmds.setAttr(shape + ".ove", 1)
    cmds.setAttr(shape + ".ovc", 17)
    cmds.setAttr(shape + ".ovdt", 2)          # не выделяется - правится позерами
    cmds.setAttr(shape + ".lineWidth", 2)
    for a in ("t", "r", "s"):
        for ax in "xyz":
            cmds.setAttr(curve + "." + a + ax, l=1, k=0)
    for i, t in enumerate(SOLE):
        name = "sole%d" % (i + 1)
        p = poser(name, t, 0.08, 17, lock_tx=True)
        cmds.connectAttr(local_pos(p, "toe_poser", name), shape + ".controlPoints[%d]" % i)

    # --- 4. точка касания
    # Стопа повёрнута на rx (та доля, что крутит всю стопу - condition222.R).
    # В кадре стопы "вниз" = Rx(-rx) * (0,-1,0); ближайшая к далёкой точке в этом
    # направлении точка кривой - самая нижняя, она и касается земли.
    expect("heelTwist_group.rotateX", "condition222.outColorR")
    neg = node("multDoubleLinear", "sole_angle_multDoubleLinear")
    cmds.connectAttr("condition222.outColorR", neg + ".input1")
    cmds.setAttr(neg + ".input2", -1)
    cm = node("composeMatrix", "sole_down_composeMatrix")
    cmds.connectAttr(neg + ".output", cm + ".inputRotateX")
    far = node("pointMatrixMult", "sole_down_pointMatrixMult")
    cmds.connectAttr(cm + ".outputMatrix", far + ".inMatrix")
    cmds.setAttr(far + ".inPoint", 0, -FAR, 0)
    contact = node("nearestPointOnCurve", "sole_contact_nearestPointOnCurve")
    cmds.connectAttr(shape + ".local", contact + ".inputCurve")
    cmds.connectAttr(far + ".output", contact + ".inPosition")
    # уровень подошвы - нижняя точка кривой в покое (статично)
    ground = node("nearestPointOnCurve", "sole_ground_nearestPointOnCurve")
    cmds.connectAttr(shape + ".local", ground + ".inputCurve")
    cmds.setAttr(ground + ".inPosition", 0, -FAR, 0)

    # поворот вокруг точки касания, и стопа опускается, пока она не встанет на землю
    cmds.connectAttr(contact + ".position", "heelTwist_group.rotatePivot")
    drop = node("plusMinusAverage", "sole_drop_plusMinusAverage")
    cmds.setAttr(drop + ".operation", 2)
    cmds.connectAttr(ground + ".positionY", drop + ".input1D[0]")
    cmds.connectAttr(contact + ".positionY", drop + ".input1D[1]")
    cmds.connectAttr(drop + ".output1D", "heelTwist_group.translateY")

    # Качение без проскальзывания: на земле точка касания уезжает на длину дуги,
    # пройденной по кривой от точки касания в покое (на носке - вперёд, на пятке -
    # назад). Без этого на загибе носка точка касания почти стоит на месте.
    # rollGrip 0..1: 1 - чистое качение, 0 - точка встаёт туда, где была в покое.
    cmds.addAttr(heel, ln="rollGrip", at="double", dv=1, min=0, max=1)
    cmds.setAttr(heel + ".rollGrip", cb=1)

    def arc_length(name, param_plug):
        # subCurve с нулевой длиной даёт ошибку curveInfo - параметр не ниже 1e-4
        cl = node("clamp", name + "_clamp")
        cmds.connectAttr(param_plug, cl + ".inputR")
        cmds.setAttr(cl + ".minR", 1e-4)
        cmds.setAttr(cl + ".maxR", cmds.getAttr(shape + ".maxValue"))
        sc = node("subCurve", name + "_subCurve")
        cmds.connectAttr(shape + ".local", sc + ".inputCurve")
        cmds.setAttr(sc + ".minValue", cmds.getAttr(shape + ".minValue"))
        cmds.connectAttr(cl + ".outputR", sc + ".maxValue")
        ci = node("curveInfo", name + "_curveInfo")
        cmds.connectAttr(sc + ".outputCurve", ci + ".inputCurve")
        return ci + ".arcLength"

    s = arc_length("sole_contact", contact + ".parameter")
    s0 = arc_length("sole_ground", ground + ".parameter")    # статично
    # на земле точка касания: z0 + (s - s0); стопе надо доехать на это минус z касания
    slide = node("plusMinusAverage", "sole_slide_plusMinusAverage")
    cmds.setAttr(slide + ".operation", 1)
    cmds.connectAttr(ground + ".positionZ", slide + ".input1D[0]")
    cmds.connectAttr(s, slide + ".input1D[1]")
    neg_s0 = node("multDoubleLinear", "sole_ground_arc_multDoubleLinear")
    cmds.connectAttr(s0, neg_s0 + ".input1")
    cmds.setAttr(neg_s0 + ".input2", -1)
    cmds.connectAttr(neg_s0 + ".output", slide + ".input1D[2]")
    neg_z = node("multDoubleLinear", "sole_contact_z_multDoubleLinear")
    cmds.connectAttr(contact + ".positionZ", neg_z + ".input1")
    cmds.setAttr(neg_z + ".input2", -1)
    cmds.connectAttr(neg_z + ".output", slide + ".input1D[3]")
    grip = node("multDoubleLinear", "sole_grip_multDoubleLinear")
    cmds.connectAttr(slide + ".output1D", grip + ".input1")
    cmds.connectAttr(heel + ".rollGrip", grip + ".input2")
    cmds.connectAttr(grip + ".output", "heelTwist_group.translateZ")

    # --- 5. палец IK: кость подушечки стоит там, где контрол
    expect("ik_toe_controlJoint.translateX", "root_toeBall_distance_scaled.outputX")
    cmds.disconnectAttr("root_toeBall_distance_scaled.outputX", "ik_toe_controlJoint.translateX")
    # Эффектор пятки брал позицию у кости пальца. Теперь она зависит от
    # поворота пятки, и через эффектор вышел бы цикл - он берёт длину напрямую.
    eff = "ik_heel_eff"
    for a in "XYZ":
        expect(eff + ".translate" + a, "ik_toe_controlJoint.translate" + a)
        cmds.disconnectAttr("ik_toe_controlJoint.translate" + a, eff + ".translate" + a)
    cmds.connectAttr("root_toeBall_distance_scaled.outputX", eff + ".translateX")
    cmds.setAttr(eff + ".translateY", 0)
    cmds.setAttr(eff + ".translateZ", 0)
    mm = node("multMatrix", "ik_toe_controlJoint_multMat")
    dm = node("decomposeMatrix", "ik_toe_controlJoint_decMat")
    cmds.connectAttr("ik_toe.worldMatrix[0]", mm + ".matrixIn[0]")
    cmds.connectAttr("ik_heel_controlJoint.worldInverseMatrix[0]", mm + ".matrixIn[1]")
    cmds.connectAttr(mm + ".matrixSum", dm + ".inputMatrix")
    cmds.connectAttr(dm + ".outputTranslate", "ik_toe_controlJoint.translate")

    # --- 6. выходная кость пальца: позиция из IK/FK по ikFk
    out_src = src("toe_outJoint.translateX")
    assert out_src and cmds.nodeType(out_src.split(".")[0]) in ("multDoubleLinear", "multDL"), out_src
    cmds.disconnectAttr(out_src, "toe_outJoint.translateX")
    bm = node("blendMatrix", "toe_outJoint_blendMat")
    cmds.connectAttr("fk_toe_controlJoint.worldMatrix[0]", bm + ".inputMatrix")
    cmds.connectAttr("ik_toe_controlJoint.worldMatrix[0]", bm + ".target[0].targetMatrix")
    cmds.connectAttr("mod.ikFk", bm + ".target[0].weight")
    mm = node("multMatrix", "toe_outJoint_multMat")
    dm = node("decomposeMatrix", "toe_outJoint_decMat")
    cmds.connectAttr(bm + ".outputMatrix", mm + ".matrixIn[0]")
    cmds.connectAttr("root_outJoint.worldInverseMatrix[0]", mm + ".matrixIn[1]")
    cmds.connectAttr(mm + ".matrixSum", dm + ".inputMatrix")
    cmds.connectAttr(dm + ".outputTranslate", "toe_outJoint.translate")

    # --- 7. трансляции контролов пальцев
    for c in ("ik_toe", "fk_toe"):
        for a in ("tx", "ty", "tz"):
            cmds.setAttr(c + "." + a, l=0, k=1)


if __name__ == "__main__":
    import maya.standalone
    maya.standalone.initialize()
    SRC = r"F:/Maya_Projects/rigStudio3/modules/foot/foot.ma"
    DST = sys.argv[1] if len(sys.argv) > 1 else r"F:/Maya_Projects/rigStudio3/modules/footRoll/footRoll.ma"
    cmds.file(SRC, o=1, f=1)
    build()
    cmds.file(rename=DST)
    cmds.file(save=1, type="mayaAscii")
    print("saved", DST)
