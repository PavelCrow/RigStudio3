# Крайние положения ключицы для костей модуля shoulder (2026-10-09).
#
# У каждой кости (scapula, scapulaTip, pecUpper, pecLower, lat, trap) три
# локатора: forward, back, up. Локатор живёт в кадре кости без поправки (при
# нулях стоит прямо в кости и смотрит её осями); его перенос и поворот - это
# смещение кости, которое включается целиком, когда ключица в крайнем
# положении. Тащишь локатор - кость идёт за ним (в крайнем положении совпадает
# с ним, на полпути - на половине).
#
# Показ: на скиновой кости галочки showForward / showBack / showUp - локатор
# этой позы для этой кости; такие же на кости ключицы - для всех костей сразу.
# Правые локаторы всегда скрыты и повторяют левые.
#
# Крайние положения - углы ключицы на её кости (root_skinJoint): forwardAngle,
# backAngle, upAngle. Угол - поворот контрола ключицы относительно груди:
# ry < 0 - вперёд, ry > 0 - назад, rz > 0 - вверх. Сначала мерили направление
# сустав -> акромион, но ключица в покое смотрит наружу-назад, и подъём давал
# заметный вес "назад" (rz 30 -> назад 0.38) - Павел двигает ключицу контролом,
# и мерить надо то же самое. Вес позы = smoothstep(угол / крайний угол):
# плавно от покоя, без излома, за крайним углом держится 1. Вниз поз нет.
#
# Атрибуты на скиновой кости дублируются на outJoint (так они есть в
# shoulder.ma и копируются на скиновую кость, когда модуль её создаёт);
# connect_skin() подаёт их со скиновой кости. Смещение строится в кадре груди,
# в котором обе стороны одинаковы, поэтому одни и те же числа дают зеркало.
#
# История этого дня: множители смещения (сеть _dir*), потом группы атрибутов
# forwardTranslate/Rotate... на костях - "неудобно настраивать, нужно схватить
# кость и потащить". upgrade_scene() переводит сцену с любой из прежних версий,
# числа из атрибутов переносятся в положения локаторов. Пересобирать модуль
# нельзя - пересоздаются скиновые кости и рвётся скин.
import maya.cmds as cmds

try:
    from . import fibers          # в студии - модуль пакета
except ImportError:
    import fibers                 # в генераторе - рядом лежащий файл

POSES = ("forward", "back", "up")
JOINTS = ("scapula", "scapulaTip", "pecUpper", "pecLower", "lat", "trap")
ANGLES = {"forward": 25.0, "back": 25.0, "up": 30.0}     # крайние углы ключицы по умолчанию
COLORS = {"forward": 6, "back": 13, "up": 14}             # синий, красный, зелёный
LOC_SCALE = 0.4


def _show(p):
    return "show" + p[0].upper() + p[1:]


# В Maya 2026 часть старых типов переименована (multDoubleLinear -> multDL,
# pointMatrixMult -> pointMatrixMultDL ...), а createNode на неизвестный тип
# молча создаёт пустую ноду unknown. Тип подбираем, как utils.nodeTypeName:
# по тому, что в этой Maya есть.
_DL_TYPES = {"multDoubleLinear": "multDL", "addDoubleLinear": "addDL"}


def _node_type(t):
    available = set(cmds.allNodeTypes() or [])
    if t in available:
        return t
    for candidate in (_DL_TYPES.get(t), t + "DL"):
        if candidate and candidate in available:
            return candidate
    raise RuntimeError("Node type %s is not available in this Maya" % t)


def _add_attrs(obj, angles, keyable):
    if angles:
        for p in POSES:
            a = p + "Angle"
            if not cmds.objExists(obj + "." + a):
                cmds.addAttr(obj, ln=a, at="double", dv=ANGLES[p], min=1)
            cmds.setAttr(obj + "." + a, e=1, k=keyable)
    for p in POSES:
        a = _show(p)
        if not cmds.objExists(obj + "." + a):
            cmds.addAttr(obj, ln=a, at="bool", dv=0)
        cmds.setAttr(obj + "." + a, e=1, k=keyable)


def _loc(prefix, j, p):
    return "%s%s_%s_poseLoc" % (prefix, j, p)


def _network_names():
    """Имена нод сети поз (без префикса) - по ним снимается сеть, и недостроенная тоже."""
    names = ["poseClav_decomposeMatrix", "poseClavForward_multDoubleLinear", "poseWeight_setRange",
             "poseWeightSq_multiplyDivide", "poseWeightK_setRange", "poseWeights_multiplyDivide"]
    for j in JOINTS:
        names += ["%s_pose%s_plusMinusAverage" % (j, kind) for kind in ("Translate", "Rotate")]
        names += ["%s_%s%s_multiplyDivide" % (j, p, kind) for p in POSES for kind in ("Translate", "Rotate")]
        names += ["%s_%s_show_plusMinusAverage" % (j, p) for p in POSES]
        names += [j + "_pose_composeMatrix", j + "_pose_multMatrix", j + "_poseSpace"]
    return names


def is_added(prefix):
    """Сеть поз с локаторами собрана целиком."""
    for j in JOINTS:
        om = prefix + j + "_pose_multMatrix"
        if not cmds.objExists(om) or not cmds.isConnected(om + ".matrixSum", prefix + j + "_local_multMatrix.matrixIn[1]"):
            return False
        if not all(cmds.objExists(_loc(prefix, j, p)) for p in POSES):
            return False
    return True


def _remove_poses(prefix):
    """Снять сеть поз (любой версии, в том числе недостроенную), вернуть кость к её матрице."""
    for j in JOINTS:
        om = prefix + j + "_pose_multMatrix"
        local = prefix + j + "_local_multMatrix.matrixIn[1]"
        if cmds.objExists(om) and cmds.isConnected(om + ".matrixSum", local):
            src = cmds.listConnections(om + ".matrixIn[1]", s=1, d=0, p=1)
            if src:
                cmds.connectAttr(src[0], local, f=1)
    existing = [prefix + n for n in _network_names() if cmds.objExists(prefix + n)]
    if existing:
        cmds.delete(existing)
    return existing


def add(prefix=""):
    """Сеть крайних положений в модуле с префиксом нод prefix ("" - в генераторе)."""
    nodes_set = prefix + "nodesSet" if prefix and cmds.objExists(prefix + "nodesSet") else None

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

    # keyable на outJoint - чтобы при создании модуля скиновая кость получила
    # их копией видимыми; connect_skin потом прячет их на outJoint
    clav = prefix + "root_outJoint"
    _add_attrs(clav, angles=True, keyable=True)
    for j in JOINTS:
        _add_attrs(prefix + j + "_outJoint", angles=False, keyable=True)

    # --- углы ключицы: поворот контрола ключицы в кадре груди, в его же
    # порядке осей - те числа, которыми аниматор ставит ключицу. ry < 0 -
    # вперёд, ry > 0 - назад, rz > 0 - вверх (оси root_poser: Y вверх, Z вперёд)
    rot = node("decomposeMatrix", "poseClav_decomposeMatrix")
    c(prefix + "clav_multMatrix.matrixSum", rot + ".inputMatrix")
    # контрол - по связи, а не по имени: его могли переименовать
    ctrl = cmds.listConnections(prefix + "clav_multMatrix.matrixIn[0]", s=1, d=0)[0]
    c(ctrl + ".rotateOrder", rot + ".inputRotateOrder")
    fwd = node("multDoubleLinear", "poseClavForward_multDoubleLinear")
    c(rot + ".outputRotateY", fwd + ".input1")
    cmds.setAttr(fwd + ".input2", -1)

    # --- веса поз: smoothstep(clamp(угол / крайний угол))
    t = node("setRange", "poseWeight_setRange")
    c(fwd + ".output", t + ".valueX")
    c(rot + ".outputRotateY", t + ".valueY")
    c(rot + ".outputRotateZ", t + ".valueZ")
    for p, ax in zip(POSES, "XYZ"):
        c(clav + "." + p + "Angle", t + ".oldMax" + ax)
    cmds.setAttr(t + ".max", 1, 1, 1)
    t2 = node("multiplyDivide", "poseWeightSq_multiplyDivide")
    c(t + ".outValue", t2 + ".input1")
    c(t + ".outValue", t2 + ".input2")
    k = node("setRange", "poseWeightK_setRange")              # 3 - 2t
    c(t + ".outValue", k + ".value")
    cmds.setAttr(k + ".oldMax", 1, 1, 1)
    cmds.setAttr(k + ".min", 3, 3, 3)
    cmds.setAttr(k + ".max", 1, 1, 1)
    w = node("multiplyDivide", "poseWeights_multiplyDivide")
    c(t2 + ".output", w + ".input1")
    c(k + ".outValue", w + ".input2")
    weights = [w + ".outputX", w + ".outputY", w + ".outputZ"]

    # --- кость = O * M, O = сумма весов * локаторов (в осях кости без поправки)
    for j in JOINTS:
        out = prefix + j + "_outJoint"
        local = prefix + j + "_local_multMatrix.matrixIn[1]"
        src = cmds.listConnections(local, s=1, d=0, p=1)[0]          # M - кость без поправки

        # кадр локаторов: группа под controls (= кадр груди), стоит в M
        space = node("transform", j + "_poseSpace")
        cmds.parent(space, prefix + "controls", r=1)
        c(src, space + ".offsetParentMatrix")
        for a in ("t", "r", "s"):
            for ax in "xyz":
                cmds.setAttr(space + "." + a + ax, l=1, k=0)

        sums = {kind: node("plusMinusAverage", "%s_pose%s_plusMinusAverage" % (j, kind))
                for kind in ("Translate", "Rotate")}
        for i, (p, wp) in enumerate(zip(POSES, weights)):
            loc = cmds.spaceLocator(n=_loc(prefix, j, p))[0]
            assert loc == _loc(prefix, j, p), loc
            cmds.parent(loc, space, r=1)
            if nodes_set:
                cmds.sets(loc, e=1, forceElement=nodes_set)
            shape = cmds.listRelatives(loc, s=1)[0]
            cmds.setAttr(shape + ".localScale", LOC_SCALE, LOC_SCALE, LOC_SCALE)
            cmds.setAttr(shape + ".overrideEnabled", 1)
            cmds.setAttr(shape + ".overrideColor", COLORS[p])
            for a in ("sx", "sy", "sz"):
                cmds.setAttr(loc + "." + a, l=1, k=0)
            show = node("plusMinusAverage", "%s_%s_show_plusMinusAverage" % (j, p))
            c(out + "." + _show(p), show + ".input1D[0]")
            c(clav + "." + _show(p), show + ".input1D[1]")
            c(show + ".output1D", loc + ".visibility")
            cmds.setAttr(loc + ".v", k=0)
            for kind, plug in (("Translate", ".translate"), ("Rotate", ".rotate")):
                m = node("multiplyDivide", "%s_%s%s_multiplyDivide" % (j, p, kind))
                c(loc + plug, m + ".input1")
                for ax in "XYZ":
                    c(wp, m + ".input2" + ax)
                c(m + ".output", sums[kind] + ".input3D[%d]" % i)
        o = node("composeMatrix", j + "_pose_composeMatrix")
        c(sums["Translate"] + ".output3D", o + ".inputTranslate")
        c(sums["Rotate"] + ".output3D", o + ".inputRotate")
        om = node("multMatrix", j + "_pose_multMatrix")
        c(o + ".outputMatrix", om + ".matrixIn[0]")
        c(src, om + ".matrixIn[1]")
        c(om + ".matrixSum", local)


def _skin_pairs(module_name):
    """(скиновая кость, outJoint, есть ли углы) модуля."""
    pairs = [("%s_root_skinJoint" % module_name, "%s_root_outJoint" % module_name, True)]
    for j in JOINTS:
        pairs.append(("%s_%s_skinJoint" % (module_name, j), "%s_%s_outJoint" % (module_name, j), False))
    return pairs


def _attr_names(angles):
    return ([p + "Angle" for p in POSES] if angles else []) + [_show(p) for p in POSES]


def connect_skin(module_name):
    """Значения - со скиновой кости в outJoint, где их читает сеть."""
    for skin, out, angles in _skin_pairs(module_name):
        if not cmds.objExists(out) or not cmds.objExists(skin) or not cmds.objExists(out + "." + _show("forward")):
            continue
        _add_attrs(skin, angles, keyable=True)
        for a in _attr_names(angles):
            if cmds.listConnections(out + "." + a, s=1, d=0, p=1) != [skin + "." + a]:
                cmds.connectAttr(skin + "." + a, out + "." + a, f=1)
        _add_attrs(out, angles, keyable=False)


def get_values(module_name):
    """Крайние углы и положения локаторов - для шаблона (галочки показа - нет)."""
    p = module_name + "_"
    data = {"angles": {}, "locators": {}}
    clav = p + "root_skinJoint"
    for pose in POSES:
        if cmds.objExists(clav + "." + pose + "Angle"):
            data["angles"][pose] = cmds.getAttr(clav + "." + pose + "Angle")
    for j in JOINTS:
        for pose in POSES:
            loc = _loc(p, j, pose)
            if cmds.objExists(loc):
                data["locators"]["%s_%s" % (j, pose)] = {"t": list(cmds.getAttr(loc + ".t")[0]),
                                                          "r": list(cmds.getAttr(loc + ".r")[0])}
    return data


def set_values(module_name, data):
    p = module_name + "_"

    def put(plug, value):
        if cmds.objExists(plug) and not cmds.listConnections(plug, s=1, d=0):
            cmds.setAttr(plug, value)

    data = data or {}
    for pose, v in data.get("angles", {}).items():
        put(p + "root_skinJoint." + pose + "Angle", v)
    for key, v in data.get("locators", {}).items():
        loc = p + key + "_poseLoc"
        for i, ax in enumerate("xyz"):
            put(loc + ".t" + ax, v["t"][i])
            put(loc + ".r" + ax, v["r"][i])


def link_settings(module_name):
    """Правая сторона берёт настройки с левой: mainPoser, крайние углы, локаторы.

    Правый модуль получает их копией при создании и дальше живёт сам: правка
    слева справа не видна. На mainPoser связываются все пользовательские
    keyable-атрибуты, кроме размеров позеров. Правые локаторы скрыты: их
    положение приходит с левых.
    """
    if not module_name.startswith("r_"):
        return
    left = "l" + module_name[1:]
    pairs = []
    src_mp, dst_mp = left + "_mainPoser", module_name + "_mainPoser"
    if cmds.objExists(src_mp):
        for a in cmds.listAttr(src_mp, ud=1, k=1) or []:
            if a not in ("size", "globalSize", "lineSize", "lineWidth"):
                pairs.append((src_mp + "." + a, dst_mp + "." + a))
    for pose in POSES:
        pairs.append(("%s_root_skinJoint.%sAngle" % (left, pose), "%s_root_skinJoint.%sAngle" % (module_name, pose)))
    for j in JOINTS:
        for pose in POSES:
            l_loc, r_loc = _loc(left + "_", j, pose), _loc(module_name + "_", j, pose)
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


# ------------------------------------------------------------------ прежние версии
# Множители forward/back/up (на mainPoser <кость>_forward, затем на костях
# forward/back/up): сеть _dir* врезана между точкой кости и тем, что из неё
# строится. Снимаем и соединяем напрямую.
_OLD_POINTS = {
    "scapula": ("scapulaTop_plusMinusAverage.output3D", "scapulaTop_sphere_pointMatrixMult.inPoint"),
    "scapulaTip": ("scapulaTip_pointMatrixMult.output", "scapulaTip_sphere_pointMatrixMult.inPoint"),
}
_OLD_MUSCLES = ("pecUpper", "pecLower", "lat", "trap")
_OLD_SUFFIXES = ("_dirShift_plusMinusAverage", "_dirSide_setRange", "_dirSideSq_multiplyDivide", "_dirSideK_setRange",
                 "_dirSmooth_multiplyDivide", "_dirSpan_plusMinusAverage", "_dirSpanS_multiplyDivide",
                 "_dirMult_plusMinusAverage", "_dirScaled_multiplyDivide", "_dirOut_plusMinusAverage")


def _remove_multipliers(name):
    p = name + "_"
    if not cmds.objExists(p + "pecUpper_dirOut_plusMinusAverage"):
        return False
    for j, (src, dst) in _OLD_POINTS.items():
        cmds.connectAttr(p + src, p + dst, f=1)
    for j in _OLD_MUSCLES:
        cmds.connectAttr(p + j + "_belly_blendColors.output", p + j + "_origin_composeMatrix.inputTranslate", f=1)
    for j in JOINTS:
        for s in _OLD_SUFFIXES:
            if cmds.objExists(p + j + s):
                cmds.delete(p + j + s)
    for j in _OLD_MUSCLES:
        if cmds.objExists(p + j + "_bellyRest_blendColors"):
            cmds.delete(p + j + "_bellyRest_blendColors")
    for j in JOINTS:
        for obj in (p + j + "_skinJoint", p + j + "_outJoint"):
            for d in ("forward", "back", "up"):
                if cmds.objExists(obj + "." + d):
                    cmds.deleteAttr(obj + "." + d)
        for d in ("forward", "back", "up"):
            if cmds.objExists("%smainPoser.%s_%s" % (p, j, d)):
                cmds.deleteAttr("%smainPoser.%s_%s" % (p, j, d))
    return True


def _take_attr_poses(name):
    """Позы в атрибутах на костях (forwardTranslate... - версия до локаторов):
    снять значения и сами атрибуты. Возвращает {<кость>_<поза>: {t, r}}."""
    p = name + "_"
    values = {}
    for j in JOINTS:
        skin, out = p + j + "_skinJoint", p + j + "_outJoint"
        src = skin if cmds.objExists(skin + ".forwardTranslate") else out
        if not cmds.objExists(src + ".forwardTranslate"):
            continue
        for pose in POSES:
            values["%s_%s" % (j, pose)] = {"t": list(cmds.getAttr(src + "." + pose + "Translate")[0]),
                                           "r": list(cmds.getAttr(src + "." + pose + "Rotate")[0])}
        for obj in (skin, out):
            for pose in POSES:
                for kind in ("Translate", "Rotate"):
                    if cmds.objExists(obj + "." + pose + kind):
                        cmds.deleteAttr(obj + "." + pose + kind)
    return values


def upgrade_scene():
    """Обновить модули shoulder сцены до крайних положений с локаторами; связать правые.

    Снимает прежние версии (множители, позы в атрибутах, недостроенную сеть),
    числа из атрибутов переносит в положения локаторов. Скиновые кости и скин
    не трогаются.
    """
    names = []
    for mod in cmds.ls("*_mod", type="transform") or []:
        if cmds.objExists(mod + ".moduleType") and cmds.getAttr(mod + ".moduleType") == "shoulder":
            names.append(mod[:-len("_mod")])
    names.sort(key=lambda n: n.startswith("r_"))
    done = []
    for name in names:
        note = []
        if _remove_multipliers(name):
            note.append("multipliers removed")
        if not is_added(name + "_"):
            if _remove_poses(name + "_"):
                note.append("old poses removed")
            old = _take_attr_poses(name)
            add(name + "_")
            note.append("pose locators added")
            if old and not name.startswith("r_"):
                set_values(name, {"locators": old})
                note.append("values moved to locators")
        if not fibers.is_added(name + "_"):
            fibers.add(name + "_")
            note.append("muscle collapse fix added")
        if not fibers.is_roll_fixed(name + "_"):
            fibers.add_roll_fix(name + "_")
            note.append("muscle roll fix added")
        connect_skin(name)
        if note:
            done.append("%s: %s" % (name, ", ".join(note)))
    for name in names:
        link_settings(name)
    return done
