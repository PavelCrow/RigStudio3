# -*- coding: utf-8 -*-
"""Отладка ноды pk_wing: перенос входов из Bifrost-графа и локаторы на точки.

Ничего в рабочих скриптах авторига не трогает - только читает атрибуты графа.

    import sys
    sys.path.append(r"f:\\Maya_Projects\\rigStudio3\\plugins\\pk_rigNodes\\scripts")
    import pk_wing_debug as d

    d.rebuild()                 # собрать плагин заново и загрузить
    n = d.make_from_graph()     # создать pk_wing и залить в неё входы графа
    d.show_points(n, stage=3)   # локаторы на CV главных сплайнов
    d.show_points(n, stage=8)   # опорные точки перьев: center + in + out
    d.check_splines(n)          # сверка сплайнов с кривыми Maya
"""

import os

import maya.cmds as cmds

def _mll_path():
    """Сборка под версию Maya, в которой мы сейчас работаем."""
    try:
        version = cmds.about(version=True).split()[0].split(".")[0]
    except Exception:
        version = "2022"
    return os.path.abspath(os.path.join(os.path.dirname(__file__), "..", "..",
                                        "plug-ins", version, "pk_rigNodes.mll"))

VERTICAL_CURVES = 7
LOC_GROUP_SUFFIX = "_pk_debug_locs"


def load_plugin(path=None):
    """Загрузить плагин, предварительно выгрузив старую версию."""
    path = path or _mll_path()
    name = os.path.splitext(os.path.basename(path))[0]

    if cmds.pluginInfo(name, q=True, loaded=True):
        for node in cmds.ls(type="pk_wing") or []:
            cmds.delete(node)
        cmds.flushUndo()
        cmds.unloadPlugin(name)

    cmds.loadPlugin(path)
    print("loaded: " + path)


def rebuild(maya_version=None):
    """Выгрузить плагин, собрать заново и загрузить. Одна команда на итерацию."""
    import subprocess

    root = os.path.abspath(os.path.join(os.path.dirname(__file__), ".."))
    script = os.path.join(root, "build.ps1")
    maya_version = maya_version or cmds.about(version=True).split()[0].split(".")[0]

    name = "pk_rigNodes"
    if cmds.pluginInfo(name, q=True, loaded=True):
        for node in cmds.ls(type="pk_wing") or []:
            cmds.delete(node)
        cmds.flushUndo()
        cmds.unloadPlugin(name)
        print("unloaded " + name)

    cmd = ["powershell", "-NoProfile", "-ExecutionPolicy", "Bypass",
           "-File", script, "-MayaVersion", maya_version]
    proc = subprocess.Popen(cmd, stdout=subprocess.PIPE, stderr=subprocess.STDOUT)
    out = proc.communicate()[0]
    if not isinstance(out, str):
        out = out.decode("cp1251", "replace")

    ok = proc.returncode == 0
    for line in out.splitlines():
        if ("error" in line.lower()) or ("->" in line) or line.startswith("Built:"):
            print(line.rstrip())

    if not ok:
        cmds.warning("build failed, plugin not loaded")
        return False

    load_plugin()
    return True


def find_graph(name=None):
    """Нод Bifrost-графа wing2: по имени модуля, по выделению или первый в сцене."""
    if name:
        node = name if name.endswith("_bifrostGraphShape") else name + "_bifrostGraphShape"
        if cmds.objExists(node):
            return node

    for sel in cmds.ls(sl=True) or []:
        if cmds.objectType(sel) == "bifrostGraphShape":
            return sel

    graphs = [g for g in cmds.ls(type="bifrostGraphShape") or []
              if cmds.objExists(g + ".curves_position")]
    if not graphs:
        cmds.warning("bifrostGraphShape with curves_position not found")
        return None

    return graphs[0]


def read_curves(graph):
    """curves_position графа -> [[(x, y, z), ...], ...] по индексам кривых."""
    curves = {}
    for i in (cmds.getAttr(graph + ".curves_position", mi=True) or []):
        child = "%s.curves_position[%s].curves_position_A" % (graph, i)
        points = []
        for j in (cmds.getAttr(child, mi=True) or []):
            points.append(cmds.getAttr("%s[%s]" % (child, j))[0])
        curves[i] = points
    return curves


SCALARS = ["layers_count", "mirror", "flatten",
           "auto_twist_root", "auto_twist_tip",
           "root_offset_1", "root_offset_2", "root_offset_3", "root_offset_4",
           "root_offset_5", "root_offset_6", "root_offset_7"]

MATRICES = ["global_transform", "mainPoser_transform"]

MULTIS = ["init_curves_length", "layer_feathers_count",
          "layer_feather_controls_count", "layer_wide",
          "layer_pos_min", "layer_pos_max",
          "layer_length_min", "layer_length_max",
          "layer_twist_root", "layer_twist_tip", "layer_bend",
          "layer_offset_root", "layer_offset_tip"]

NESTED = ["wide", "root_pos", "tip_pos", "pos_2_offset", "pos_3_offset",
          "length", "length_min", "twist_root", "twist_tip", "bend"]


def _copy_scalar(graph, node, attr):
    if cmds.objExists("%s.%s" % (graph, attr)):
        cmds.setAttr("%s.%s" % (node, attr), cmds.getAttr("%s.%s" % (graph, attr)))


def _copy_matrix(graph, node, attr):
    if cmds.objExists("%s.%s" % (graph, attr)):
        values = cmds.getAttr("%s.%s" % (graph, attr))
        cmds.setAttr("%s.%s" % (node, attr), *values, type="matrix")


def _copy_multi(graph, node, attr):
    src = "%s.%s" % (graph, attr)
    if not cmds.objExists(src):
        return 0
    count = 0
    for i in (cmds.getAttr(src, mi=True) or []):
        cmds.setAttr("%s.%s[%s]" % (node, attr, i), cmds.getAttr("%s[%s]" % (src, i)))
        count += 1
    return count


def _copy_nested(graph, node, attr):
    """attr[i].attr_A[j] - вложенные массивы графа."""
    src = "%s.%s" % (graph, attr)
    if not cmds.objExists(src):
        return 0
    count = 0
    for i in (cmds.getAttr(src, mi=True) or []):
        child = "%s[%s].%s_A" % (src, i, attr)
        for j in (cmds.getAttr(child, mi=True) or []):
            cmds.setAttr("%s.%s[%s].%s_A[%s]" % (node, attr, i, attr, j),
                         cmds.getAttr("%s[%s]" % (child, j)))
            count += 1
    return count


def make_from_graph(graph=None, node=None, stage=3):
    """Создать pk_wing (или взять существующую) и залить в неё все входы графа."""
    graph = find_graph(graph)
    if not graph:
        return None

    if node is None:
        node = cmds.createNode("pk_wing")

    curves = read_curves(graph)
    for i, points in curves.items():
        for j, p in enumerate(points):
            cmds.setAttr("%s.curves_position[%s].curves_position_A[%s]" % (node, i, j),
                         p[0], p[1], p[2], type="float3")

    for attr in SCALARS:
        _copy_scalar(graph, node, attr)
    for attr in MATRICES:
        _copy_matrix(graph, node, attr)

    multis = sum(_copy_multi(graph, node, a) for a in MULTIS)
    nested = sum(_copy_nested(graph, node, a) for a in NESTED)

    cmds.setAttr(node + ".debug_stage", stage)

    print("%s <- %s" % (node, graph))
    print("   curves: %s (%s points), multi values: %s, nested values: %s"
          % (len(curves), sum(len(p) for p in curves.values()), multis, nested))
    print("   layers_count = %s, feathers per layer = %s"
          % (cmds.getAttr(node + ".layers_count"),
             [cmds.getAttr("%s.layer_feathers_count[%s]" % (node, i))
              for i in (cmds.getAttr(node + ".layer_feathers_count", mi=True) or [])]))
    return node


def show_points(node, stage=None, size=0.15, live=True, layer=None, limit=400):
    """Локаторы на debug_points. live=True - подключены, ездят за ригом.

    layer=N - только слой N (-1 или None = все слои)
    limit   - предохранитель от тысяч локаторов; сколько отброшено, печатается
    """
    if not cmds.objExists(node):
        cmds.warning("%s does not exist - создай ноду заново: n = d.make_from_graph()" % node)
        return None

    if stage is not None:
        cmds.setAttr(node + ".debug_stage", stage)
    if layer is not None:
        cmds.setAttr(node + ".debug_layer", layer)

    group = node + LOC_GROUP_SUFFIX
    if cmds.objExists(group):
        # сначала разрываем связи: удаление подключённых локаторов уносит
        # с собой и саму ноду - Maya чистит апстрим-историю
        for loc in (cmds.listRelatives(group, ad=True, type="transform") or []):
            for src in (cmds.listConnections(loc + ".translate", s=True, d=False, p=True) or []):
                cmds.disconnectAttr(src, loc + ".translate")
        cmds.delete(group)
    group = cmds.group(empty=True, n=group)

    indices = cmds.getAttr(node + ".debug_points", mi=True) or []
    dropped = 0
    if limit and len(indices) > limit:
        dropped = len(indices) - limit
        indices = indices[:limit]

    for i in indices:
        loc = cmds.spaceLocator(n="%s_p%s" % (node, i))[0]
        cmds.setAttr(loc + ".localScaleX", size)
        cmds.setAttr(loc + ".localScaleY", size)
        cmds.setAttr(loc + ".localScaleZ", size)
        cmds.parent(loc, group)

        plug = "%s.debug_points[%s]" % (node, i)
        if live:
            cmds.connectAttr(plug, loc + ".translate")
        else:
            cmds.setAttr(loc + ".translate", *cmds.getAttr(plug)[0])

    print("%s locators for stage %s, layer %s%s"
          % (len(indices), cmds.getAttr(node + ".debug_stage"),
             cmds.getAttr(node + ".debug_layer"),
             (", %s points dropped by limit=%s" % (dropped, limit)) if dropped else ""))
    return group


def lengths(node, graph=None):
    """Длины главных сплайнов рядом с init_curves_length графа."""
    ours = [cmds.getAttr("%s.debug_curve_lengths[%s]" % (node, i))
            for i in (cmds.getAttr(node + ".debug_curve_lengths", mi=True) or [])]

    graph = find_graph(graph)
    theirs = []
    if graph and cmds.objExists(graph + ".init_curves_length"):
        theirs = [cmds.getAttr("%s.init_curves_length[%s]" % (graph, i))
                  for i in (cmds.getAttr(graph + ".init_curves_length", mi=True) or [])]

    print("pk_wing debug_curve_lengths: %s" % ["%.4f" % v for v in ours])
    print("graph init_curves_length:    %s" % ["%.4f" % v for v in theirs])
    return ours, theirs


def check_splines(node, samples=20, keep_curves=True):
    """Сверить мою математику с кривыми Maya.

    По CV главных сплайнов (stage 3) строится обычная кубическая кривая Maya
    с такими же зажатыми узлами. Сравниваются длина (arcLength против
    debug_curve_lengths) и позиции: Maya в параметре t * spans против моего
    sample(t) - это проверяет и узлы, и de Boor.

    keep_curves=True оставляет кривые в сцене, чтобы посмотреть глазами.
    """
    stage = cmds.getAttr(node + ".debug_stage")
    cmds.setAttr(node + ".debug_stage", 3)

    indices = cmds.getAttr(node + ".debug_points", mi=True) or []
    points = [cmds.getAttr("%s.debug_points[%s]" % (node, i))[0] for i in indices]

    per_curve = 7
    curves_count = len(points) // per_curve
    ours_len = [cmds.getAttr("%s.debug_curve_lengths[%s]" % (node, i))
                for i in (cmds.getAttr(node + ".debug_curve_lengths", mi=True) or [])]

    group = node + "_pk_check_curves"
    if cmds.objExists(group):
        cmds.delete(group)
    group = cmds.group(empty=True, n=group)

    print("curve |   maya arcLength |   pk length | diff   | max point deviation")

    worst_all = 0.0
    for c in range(curves_count):
        cvs = points[c * per_curve:(c + 1) * per_curve]
        crv = cmds.curve(d=3, p=[list(p) for p in cvs])
        crv = cmds.rename(crv, "%s_check_%s" % (node, c))
        cmds.parent(crv, group)

        maya_len = cmds.arclen(crv)
        spans = cmds.getAttr(crv + ".spans")

        # позиции: параметр Maya = t * spans, мой параметр = t (узлы ремапнуты в 0..1)
        cmds.setAttr(node + ".debug_stage", 4)
        mine_all = [cmds.getAttr("%s.debug_points[%s]" % (node, i))[0]
                    for i in (cmds.getAttr(node + ".debug_points", mi=True) or [])]
        per_sample = len(mine_all) // curves_count
        mine = mine_all[c * per_sample:(c + 1) * per_sample]

        worst = 0.0
        for s, p in enumerate(mine):
            t = float(s) / float(per_sample - 1)
            m = cmds.pointOnCurve(crv, pr=t * spans, p=True)
            d = sum((m[k] - p[k]) ** 2 for k in range(3)) ** 0.5
            worst = max(worst, d)
        worst_all = max(worst_all, worst)

        cmds.setAttr(node + ".debug_stage", 3)
        pk_len = ours_len[c] if c < len(ours_len) else float("nan")
        print("  %s   | %16.5f | %11.5f | %6.3f | %.6f"
              % (c, maya_len, pk_len, pk_len - maya_len, worst))

    if not keep_curves:
        cmds.delete(group)

    cmds.setAttr(node + ".debug_stage", stage)
    print("worst point deviation: %.6f  (ждём < 0.001)" % worst_all)
    return worst_all


def _module_name(graph):
    return graph[:-len("_bifrostGraphShape")] if graph.endswith("_bifrostGraphShape") else graph


def inputs(graph=None):
    """Печатает входы графа, важные для масштаба: скейлы, длины, wide."""
    graph = find_graph(graph)
    if not graph:
        return

    def m_scale(attr):
        if not cmds.objExists("%s.%s" % (graph, attr)):
            return None
        v = cmds.getAttr("%s.%s" % (graph, attr))
        rows = [v[0:4], v[4:8], v[8:12]]
        return ["%.4f" % (sum(c * c for c in r) ** 0.5) for r in rows]

    print("global_transform scale     : %s" % m_scale("global_transform"))
    print("mainPoser_transform scale  : %s" % m_scale("mainPoser_transform"))
    print("init_curves_length         : %s"
          % ["%.4f" % cmds.getAttr("%s.init_curves_length[%s]" % (graph, i))
             for i in (cmds.getAttr(graph + ".init_curves_length", mi=True) or [])])
    print("layer_wide                 : %s"
          % ["%.4f" % cmds.getAttr("%s.layer_wide[%s]" % (graph, i))
             for i in (cmds.getAttr(graph + ".layer_wide", mi=True) or [])])
    w = "%s.wide[0].wide_A" % graph
    if cmds.objExists(w):
        idx = (cmds.getAttr(w, mi=True) or [])[:6]
        print("wide[0][0:6]               : %s"
              % ["%.4f" % cmds.getAttr("%s[%s]" % (w, i)) for i in idx])
    print("mirror                     : %s" % cmds.getAttr(graph + ".mirror"))


def width_check(node, graph=None, layer=0, feathers=5):
    """Ширина пера: эталон из джойнтов графа против моих in/out точек.

    Эталон - расстояние между <name>_layer_L_feather_F_0_in_outJoint и
    ..._out_outJoint в мире. Моё - расстояние между in[0] и out[0] той же
    стадии (8 -> по 12 точек на перо, первые из in и out - корневые).
    """
    graph = find_graph(graph)
    name = _module_name(graph)

    cmds.setAttr(node + ".debug_stage", 8)
    cmds.setAttr(node + ".debug_layer", layer)
    idx = cmds.getAttr(node + ".debug_points", mi=True) or []
    pts = [cmds.getAttr("%s.debug_points[%s]" % (node, i))[0] for i in idx]

    print("feather |  graph width |  pk width |  ratio")
    for f in range(feathers):
        a = "%s_layer_%s_feather_%s_0_in_outJoint" % (name, layer, f)
        b = "%s_layer_%s_feather_%s_0_out_outJoint" % (name, layer, f)
        if not (cmds.objExists(a) and cmds.objExists(b)):
            print("  %s     - джойнты не найдены (%s)" % (f, a))
            continue

        pa = cmds.xform(a, q=True, ws=True, t=True)
        pb = cmds.xform(b, q=True, ws=True, t=True)
        graph_w = sum((pa[k] - pb[k]) ** 2 for k in range(3)) ** 0.5

        base = f * 12
        if base + 8 >= len(pts):
            break
        p_in, p_out = pts[base + 4], pts[base + 8]
        pk_w = sum((p_in[k] - p_out[k]) ** 2 for k in range(3)) ** 0.5

        ratio = pk_w / graph_w if graph_w else float("nan")
        print("   %s    | %12.4f | %9.4f | %6.3f" % (f, graph_w, pk_w, ratio))


MTX_GROUP_SUFFIX = "_pk_debug_mtx"


def show_matrices(node, stage=9, layer=0, size=0.4, limit=200):
    """Локаторы на debug_matrices - с ориентацией (через offsetParentMatrix).

    stage: 9 - джойнты in (мир), 10 - джойнты out (мир), 11 - центры перьев,
           12 - локальные матрицы контролов, 13/14 - джойнты in/out локально
    """
    if not cmds.objExists(node):
        cmds.warning("%s does not exist" % node)
        return None

    cmds.setAttr(node + ".debug_stage", stage)
    cmds.setAttr(node + ".debug_layer", layer)

    group = node + MTX_GROUP_SUFFIX
    if cmds.objExists(group):
        for loc in (cmds.listRelatives(group, ad=True, type="transform") or []):
            for a in ("offsetParentMatrix", "translate"):
                for src in (cmds.listConnections(loc + "." + a, s=True, d=False, p=True) or []):
                    cmds.disconnectAttr(src, loc + "." + a)
        cmds.delete(group)
    group = cmds.group(empty=True, n=group)

    indices = cmds.getAttr(node + ".debug_matrices", mi=True) or []
    dropped = 0
    if limit and len(indices) > limit:
        dropped = len(indices) - limit
        indices = indices[:limit]

    for i in indices:
        loc = cmds.spaceLocator(n="%s_m%s" % (node, i))[0]
        for axis in "XYZ":
            cmds.setAttr(loc + ".localScale" + axis, size)
        cmds.parent(loc, group)
        cmds.connectAttr("%s.debug_matrices[%s]" % (node, i), loc + ".offsetParentMatrix")

    print("%s matrix locators, stage %s, layer %s%s"
          % (len(indices), stage, layer,
             (", %s dropped by limit=%s" % (dropped, limit)) if dropped else ""))
    return group


def matrix_check(node, graph=None, layer=0, feathers=3, controls=None):
    """Сверка мировых матриц джойнтов с эталоном из сцены.

    Эталон: <name>_layer_L_feather_F_K_in_outJoint / _out_outJoint.
    Печатает ошибку позиции и угол между осями X (прицел) и Y.
    """
    import math

    graph = find_graph(graph)
    name = _module_name(graph)

    def angle(a, b):
        d = sum(a[k] * b[k] for k in range(3))
        na = sum(x * x for x in a) ** 0.5
        nb = sum(x * x for x in b) ** 0.5
        if na < 1e-9 or nb < 1e-9:
            return float("nan")
        return math.degrees(math.acos(max(-1.0, min(1.0, d / (na * nb)))))

    for side, stage in (("in", 9), ("out", 10)):
        cmds.setAttr(node + ".debug_stage", stage)
        cmds.setAttr(node + ".debug_layer", layer)
        idx = cmds.getAttr(node + ".debug_matrices", mi=True) or []
        mats = [cmds.getAttr("%s.debug_matrices[%s]" % (node, i)) for i in idx]

        n_ctrl = controls or cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))
        print("--- %s side, layer %s, %s controls per feather" % (side, layer, n_ctrl))
        print("feather ctrl |  pos error |  X angle |  Y angle")

        for f in range(feathers):
            for k in range(n_ctrl):
                flat = f * n_ctrl + k
                if flat >= len(mats):
                    break
                m = mats[flat]

                jnt = "%s_layer_%s_feather_%s_%s_%s_outJoint" % (name, layer, f, k, side)
                if not cmds.objExists(jnt):
                    print("   %s   %s   - нет %s" % (f, k, jnt))
                    continue

                w = cmds.xform(jnt, q=True, ws=True, m=True)
                pos_err = sum((w[12 + c] - m[12 + c]) ** 2 for c in range(3)) ** 0.5
                ax = angle(w[0:3], m[0:3])
                ay = angle(w[4:7], m[4:7])
                print("   %s     %s   | %10.4f | %8.2f | %8.2f" % (f, k, pos_err, ax, ay))


def twist_probe(node, graph=None, layer=0, feathers=2, side="in"):
    """Измеряет твист графа и печатает рядом мой.

    Твист графа = знаковый угол между Y-осью его джойнта и Y моего
    нетвистованного фрейма (stage 15/16), отсчитанный вокруг оси X фрейма.
    Заодно печатает знак совпадения осей X - это отвечает на вопрос про 180.
    """
    import math

    graph = find_graph(graph)
    name = _module_name(graph)
    stage = 15 if side == "in" else 16

    cmds.setAttr(node + ".debug_stage", stage)
    cmds.setAttr(node + ".debug_layer", layer)

    idx = cmds.getAttr(node + ".debug_matrices", mi=True) or []
    frames = [cmds.getAttr("%s.debug_matrices[%s]" % (node, i)) for i in idx]
    sidx = cmds.getAttr(node + ".debug_scalars", mi=True) or []
    mine = [cmds.getAttr("%s.debug_scalars[%s]" % (node, i)) for i in sidx]

    n_ctrl = cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))

    def dot(a, b):
        return sum(a[k] * b[k] for k in range(3))

    def cross(a, b):
        return [a[1] * b[2] - a[2] * b[1], a[2] * b[0] - a[0] * b[2], a[0] * b[1] - a[1] * b[0]]

    print("side %s, layer %s" % (side, layer))
    print("feather ctrl | graph twist | my twist |  diff   | X dot")
    for f in range(feathers):
        for k in range(n_ctrl):
            flat = f * n_ctrl + k
            if flat >= len(frames):
                break

            m = frames[flat]
            fx, fy = m[0:3], m[4:7]

            jnt = "%s_layer_%s_feather_%s_%s_%s_outJoint" % (name, layer, f, k, side)
            if not cmds.objExists(jnt):
                print("   %s   %s  - нет %s" % (f, k, jnt))
                continue

            w = cmds.xform(jnt, q=True, ws=True, m=True)
            jy = w[4:7]

            graph_twist = math.degrees(math.atan2(dot(cross(fy, jy), fx), dot(fy, jy)))
            my_twist = mine[flat] if flat < len(mine) else float("nan")

            print("   %s     %s   | %11.3f | %8.3f | %7.3f | %5.2f"
                  % (f, k, graph_twist, my_twist, graph_twist - my_twist, dot(w[0:3], fx)))


def twist_inputs(node, graph=None, layer=0, feather=0):
    """Сырые входы твиста и посчитанные из них члены формулы."""
    graph = find_graph(graph)

    def g(attr):
        return cmds.getAttr("%s.%s" % (graph, attr)) if cmds.objExists("%s.%s" % (graph, attr)) else None

    def n_(attr):
        return cmds.getAttr("%s.%s" % (node, attr)) if cmds.objExists("%s.%s" % (node, attr)) else None

    def safe(plug, default=0.0):
        """Элемента мульти-атрибута может не быть - тогда действует дефолт."""
        try:
            return cmds.getAttr(plug)
        except Exception:
            return default

    atr_g, att_g = g("auto_twist_root"), g("auto_twist_tip")
    atr_n, att_n = n_("auto_twist_root"), n_("auto_twist_tip")
    ltr = safe("%s.layer_twist_root[%s]" % (graph, layer))
    ltt = safe("%s.layer_twist_tip[%s]" % (graph, layer))
    tr = safe("%s.twist_root[%s].twist_root_A[%s]" % (graph, layer, feather))
    tt = safe("%s.twist_tip[%s].twist_tip_A[%s]" % (graph, layer, feather))
    lb = safe("%s.layer_bend[%s]" % (graph, layer))
    bd = safe("%s.bend[%s].bend_A[%s]" % (graph, layer, feather))

    init0 = safe(graph + ".init_curves_length[0]")
    init3 = safe(graph + ".init_curves_length[3]")
    len0 = safe(node + ".debug_curve_lengths[0]", 1.0)
    len3 = safe(node + ".debug_curve_lengths[3]", 1.0)

    print("(отсутствующий элемент мульти-атрибута = дефолт 0)")

    print("auto_twist_root: graph %s / node %s" % (atr_g, atr_n))
    print("auto_twist_tip : graph %s / node %s" % (att_g, att_n))
    print("layer_twist_root[%s] = %.4f   layer_twist_tip = %.4f" % (layer, ltr, ltt))
    print("twist_root[%s][%s]   = %.4f   twist_tip       = %.4f" % (layer, feather, tr, tt))
    print("layer_bend = %.4f   bend[%s][%s] = %.4f" % (lb, layer, feather, bd))
    print("init len 0/3 = %.4f / %.4f    my len 0/3 = %.4f / %.4f" % (init0, init3, len0, len3))

    for k, label in ((1.355, "K = 1.355"), (1.0, "K = 1.0")):
        s0 = init0 / (len0 * k)
        s3 = init3 / (len3 * k)
        root = (atr_n or 0) * (1 - s0) - ltr - tr
        tip = (att_n or 0) * (1 - s3) - ltt - tt
        print("%s: stretch %.4f / %.4f -> root term %.3f, tip term %.3f"
              % (label, s0, s3, root, tip))

    print("no stretch    : root term %.3f, tip term %.3f"
          % ((atr_n or 0) - ltr - tr, (att_n or 0) - ltt - tt))


def frame_probe(node, graph=None, layer=0, feather=0, ctrl=0, side="in"):
    """Сравнение осей моего фрейма и джойнта графа: поворот это или зеркало."""
    graph = find_graph(graph)
    name = _module_name(graph)

    cmds.setAttr(node + ".debug_stage", 15 if side == "in" else 16)
    cmds.setAttr(node + ".debug_layer", layer)

    n_ctrl = cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))
    flat = feather * n_ctrl + ctrl
    idx = cmds.getAttr(node + ".debug_matrices", mi=True) or []
    if flat >= len(idx):
        cmds.warning("нет матрицы с индексом %s" % flat)
        return
    m = cmds.getAttr("%s.debug_matrices[%s]" % (node, idx[flat]))

    jnt = "%s_layer_%s_feather_%s_%s_%s_outJoint" % (name, layer, feather, ctrl, side)
    w = cmds.xform(jnt, q=True, ws=True, m=True)

    def norm(v):
        n = sum(c * c for c in v) ** 0.5
        return [c / n for c in v] if n > 1e-9 else v

    def det(mm):
        a, b, c = norm(mm[0:3]), norm(mm[4:7]), norm(mm[8:11])
        return (a[0] * (b[1] * c[2] - b[2] * c[1])
                - a[1] * (b[0] * c[2] - b[2] * c[0])
                + a[2] * (b[0] * c[1] - b[1] * c[0]))

    for label, i in (("X", 0), ("Y", 4), ("Z", 8)):
        a, b = norm(m[i:i + 3]), norm(w[i:i + 3])
        print("%s: mine %s   joint %s   dot %+.4f"
              % (label, ["%+.3f" % c for c in a], ["%+.3f" % c for c in b],
                 sum(a[k] * b[k] for k in range(3))))
    print("determinant: mine %+.3f, joint %+.3f  (разные знаки = зеркало)" % (det(m), det(w)))
    print("translation: mine %s  joint %s"
          % (["%.3f" % c for c in m[12:15]], ["%.3f" % c for c in w[12:15]]))


OUTPUT_MAP = {
    13: "out_joints_in_matrixes",
    14: "out_joints_out_matrixes",
    12: "out_controls_local_matrixes",
}


def output_check(node, graph=None, layer=0, feathers=3, stage=13):
    """Сверка с ЭТАЛОНОМ - собственными выходами графа.

    Сравниваются мои локальные матрицы (stage 13/14/12) с
    out_joints_in_matrixes / out_joints_out_matrixes / out_controls_local_matrixes
    того же слоя и пера. Джойнты сцены тут не участвуют, поэтому их
    ориентация и родительство ничего не искажают.
    """
    import math

    graph = find_graph(graph)
    attr = OUTPUT_MAP[stage]

    cmds.setAttr(node + ".debug_stage", stage)
    cmds.setAttr(node + ".debug_layer", layer)

    idx = cmds.getAttr(node + ".debug_matrices", mi=True) or []
    mine = [cmds.getAttr("%s.debug_matrices[%s]" % (node, i)) for i in idx]
    n_ctrl = cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))

    def norm(v):
        n = sum(c * c for c in v) ** 0.5
        return [c / n for c in v] if n > 1e-9 else v

    def ang(a, b):
        a, b = norm(a), norm(b)
        return math.degrees(math.acos(max(-1.0, min(1.0, sum(a[k] * b[k] for k in range(3))))))

    print("%s, layer %s" % (attr, layer))
    print("feather ctrl |  pos error |  X angle |  Y angle |  Z angle")

    for f in range(feathers):
        for k in range(n_ctrl):
            flat = f * n_ctrl + k
            if flat >= len(mine):
                break

            plug = "%s.%s[%s].%s_A[%s].%s_A_B[%s]" % (graph, attr, layer, attr, f, attr, k)
            try:
                ref = cmds.getAttr(plug)
            except Exception:
                print("   %s     %s   - нет %s" % (f, k, plug))
                continue

            m = mine[flat]
            pos = sum((ref[12 + c] - m[12 + c]) ** 2 for c in range(3)) ** 0.5
            print("   %s     %s   | %10.4f | %8.2f | %8.2f | %8.2f"
                  % (f, k, pos, ang(ref[0:3], m[0:3]), ang(ref[4:7], m[4:7]), ang(ref[8:11], m[8:11])))


def outputs_check(node, graph=None, layer=0, feathers=4, verbose=False):
    """Сверка НАСТОЯЩИХ выходов ноды с выходами графа.

    Сравниваются out_controls_local_matrixes / out_joints_in_matrixes /
    out_joints_out_matrixes ноды и графа по одинаковым индексам
    [слой][перо][контрол]. Это проверяет и математику, и раскладку массивов,
    к которой подключается wing2.py.
    """
    import math

    graph = find_graph(graph)
    if not graph:
        return

    def norm(v):
        n = sum(c * c for c in v) ** 0.5
        return [c / n for c in v] if n > 1e-9 else v

    def ang(a, b):
        a, b = norm(a), norm(b)
        return math.degrees(math.acos(max(-1.0, min(1.0, sum(a[k] * b[k] for k in range(3))))))

    n_ctrl = cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))
    total = 0
    worst = {"pos": 0.0, "ang": 0.0, "at": ""}

    for attr in ("out_controls_local_matrixes", "out_joints_in_matrixes", "out_joints_out_matrixes"):
        a_worst = {"pos": 0.0, "ang": 0.0, "at": ""}
        n = 0
        for f in range(feathers):
            for k in range(n_ctrl):
                tail = "[%s].%s_A[%s].%s_A_B[%s]" % (layer, attr, f, attr, k)
                try:
                    ref = cmds.getAttr("%s.%s%s" % (graph, attr, tail))
                    mine = cmds.getAttr("%s.%s%s" % (node, attr, tail))
                except Exception as e:
                    if verbose:
                        print("   пропуск %s %s %s: %s" % (attr, f, k, e))
                    continue

                pos = sum((ref[12 + c] - mine[12 + c]) ** 2 for c in range(3)) ** 0.5
                a = max(ang(ref[0:3], mine[0:3]), ang(ref[4:7], mine[4:7]), ang(ref[8:11], mine[8:11]))
                n += 1
                if pos > a_worst["pos"]:
                    a_worst["pos"] = pos
                if a > a_worst["ang"]:
                    a_worst["ang"] = a
                    a_worst["at"] = "перо %s контрол %s" % (f, k)

        total += n
        print("%-28s сравнено %3s | worst pos %8.5f  угол %7.3f  (%s)"
              % (attr, n, a_worst["pos"], a_worst["ang"], a_worst["at"]))
        worst["pos"] = max(worst["pos"], a_worst["pos"])
        worst["ang"] = max(worst["ang"], a_worst["ang"])

    print("ИТОГО: %s сравнений, worst pos %.5f, worst угол %.3f"
          % (total, worst["pos"], worst["ang"]))
    return worst


def mirror_probe(node, graph=None, layer=0, feather=0, ctrl=0):
    """Знаки на зеркальном крыле: mirror, скейлы, определитель и смещение."""
    graph = find_graph(graph)

    def det3(m):
        return (m[0] * (m[5] * m[10] - m[6] * m[9])
                - m[1] * (m[4] * m[10] - m[6] * m[8])
                + m[2] * (m[4] * m[9] - m[5] * m[8]))

    def rows(m):
        return [sum(m[i * 4 + c] ** 2 for c in range(3)) ** 0.5 for i in range(3)]

    for label, attr in (("global_transform", "global_transform"),
                        ("mainPoser_transform", "mainPoser_transform")):
        m = cmds.getAttr("%s.%s" % (graph, attr))
        print("%-20s длины строк %s  det %+.4f"
              % (label, ["%.4f" % v for v in rows(m)], det3(m)))

    print("mirror (graph) = %s, mirror (node) = %s"
          % (cmds.getAttr(graph + ".mirror"), cmds.getAttr(node + ".mirror")))

    for attr in ("out_joints_in_matrixes", "out_joints_out_matrixes"):
        tail = "[%s].%s_A[%s].%s_A_B[%s]" % (layer, attr, feather, attr, ctrl)
        ref = cmds.getAttr("%s.%s%s" % (graph, attr, tail))
        mine = cmds.getAttr("%s.%s%s" % (node, attr, tail))
        print("%-26s граф  T = %s" % (attr, ["%+.4f" % v for v in ref[12:15]]))
        print("%-26s моё   T = %s" % ("", ["%+.4f" % v for v in mine[12:15]]))


def benchmark(node, graph=None, iterations=30, layer=0):
    """Время одной оценки: Bifrost-граф против pk_wing.

    Каждая итерация меняет вход (это помечает выход грязным) и тянет один
    листовой плаг - этого достаточно, чтобы посчиталось всё дерево выходов.
    """
    import time

    graph = find_graph(graph)
    if not graph:
        return

    def leaf(target):
        attr = "out_joints_out_matrixes"
        return "%s.%s[%s].%s_A[0].%s_A_B[0]" % (target, attr, layer, attr, attr)

    # базовая стоимость пары setAttr/getAttr без вычислений - она одинакова
    # для графа и для ноды и занижает разницу, поэтому вычитается
    cmds.getAttr(node + ".auto_twist_root")
    t0 = time.time()
    for i in range(iterations):
        cmds.setAttr(node + ".auto_twist_root", 0.001 * (i % 7))
        cmds.getAttr(node + ".auto_twist_root")
    overhead = (time.time() - t0) / iterations * 1000.0
    print("%-14s %8.2f мс  (накладные расходы команд, вычитаются)" % ("overhead", overhead))

    results = {}
    for label, target in (("bifrost graph", graph), ("pk_wing", node)):
        if not cmds.objExists(leaf(target)):
            print("%s: нет выхода %s" % (label, leaf(target)))
            continue

        # прогреть
        cmds.getAttr(leaf(target))

        total = 0.0
        for i in range(iterations):
            cmds.setAttr(target + ".auto_twist_root", 0.001 * (i % 7))
            t0 = time.time()
            cmds.getAttr(leaf(target))
            total += time.time() - t0

        ms = total / iterations * 1000.0
        net = max(0.0, ms - overhead)
        results[label] = net
        print("%-14s %8.2f мс  (чистое время %.2f мс, %s итераций)" % (label, ms, net, iterations))

    if len(results) == 2:
        a = results["bifrost graph"]
        b = results["pk_wing"]
        if b > 0:
            print("ускорение: %.1fx" % (a / b))

    return results


def swap_to_node(graph=None, node=None, verbose=False):
    """Подменить Bifrost-граф на pk_wing прямо в собранном риге.

    Входы ноды подключаются к тем же источникам, что кормят граф (значения
    без связей копируются), а выходы ноды перехватывают всех потребителей
    графа. Сам граф остаётся в сцене нетронутым - вернуть всё назад можно
    вызовом swap_back().
    """
    graph = find_graph(graph)
    if not graph:
        return None

    if node is None:
        node = cmds.createNode("pk_wing", n=_module_name(graph) + "_pk_wing")

    # --- входы: те же источники, что у графа
    conns = cmds.listConnections(graph, s=True, d=False, p=True, c=True) or []
    linked, skipped = 0, []
    for i in range(0, len(conns), 2):
        dst, src = conns[i], conns[i + 1]
        mine = dst.replace(graph + ".", node + ".", 1)
        try:
            if not cmds.objExists(mine.split("[")[0].split(".")[0] + "." + mine.split(".", 1)[1].split("[")[0]):
                skipped.append(dst)
                continue
            cmds.connectAttr(src, mine, f=True)
            linked += 1
        except Exception as e:
            skipped.append("%s (%s)" % (dst, e))

    # --- входы без связей: копируем значения
    copied = 0
    for attr in SCALARS + MATRICES:
        try:
            if cmds.listConnections("%s.%s" % (graph, attr), s=True, d=False):
                continue
            if attr in MATRICES:
                _copy_matrix(graph, node, attr)
            else:
                _copy_scalar(graph, node, attr)
            copied += 1
        except Exception:
            pass
    for attr in MULTIS:
        copied += _copy_multi_unconnected(graph, node, attr)

    # --- выходы: перехватываем потребителей графа
    outs = cmds.listConnections(graph, s=False, d=True, p=True, c=True) or []
    rewired = 0
    for i in range(0, len(outs), 2):
        src, dst = outs[i], outs[i + 1]
        if "out_" not in src:
            continue
        mine = src.replace(graph + ".", node + ".", 1)
        try:
            cmds.connectAttr(mine, dst, f=True)
            rewired += 1
        except Exception as e:
            skipped.append("%s -> %s (%s)" % (mine, dst, e))

    print("%s: подключено входов %s, скопировано значений %s, перехвачено выходов %s"
          % (node, linked, copied, rewired))
    if skipped:
        print("   пропущено %s плагов%s" % (len(skipped), (": " + ", ".join(skipped[:5])) if verbose else ""))
    return node


def _copy_multi_unconnected(graph, node, attr):
    """Значения элементов мульти-атрибута, у которых нет входящей связи."""
    src = "%s.%s" % (graph, attr)
    if not cmds.objExists(src):
        return 0
    count = 0
    for i in (cmds.getAttr(src, mi=True) or []):
        plug = "%s[%s]" % (src, i)
        if cmds.listConnections(plug, s=True, d=False):
            continue
        try:
            cmds.setAttr("%s.%s[%s]" % (node, attr, i), cmds.getAttr(plug))
            count += 1
        except Exception:
            pass
    return count


def swap_back(node, graph=None):
    """Вернуть управление Bifrost-графу."""
    graph = find_graph(graph)
    if not graph:
        return

    outs = cmds.listConnections(node, s=False, d=True, p=True, c=True) or []
    restored = 0
    for i in range(0, len(outs), 2):
        src, dst = outs[i], outs[i + 1]
        back = src.replace(node + ".", graph + ".", 1)
        try:
            cmds.connectAttr(back, dst, f=True)
            restored += 1
        except Exception:
            pass

    print("вернул графу %s связей" % restored)
    return restored


def frames_angle_probe(node, layer=0, feathers=2):
    """Угол между in- и out-фреймами (стадии 15/16).

    Если он около 180 - интерполяция вырождена и её результат неустойчив:
    именно это и дало бы дёрганье центрального джойнта.
    """
    import math

    def read(stage):
        cmds.setAttr(node + ".debug_stage", stage)
        cmds.setAttr(node + ".debug_layer", layer)
        idx = cmds.getAttr(node + ".debug_matrices", mi=True) or []
        return [cmds.getAttr("%s.debug_matrices[%s]" % (node, i)) for i in idx]

    fin, fout = read(15), read(16)
    n_ctrl = cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))

    def norm(v):
        n = sum(c * c for c in v) ** 0.5
        return [c / n for c in v] if n > 1e-9 else v

    def ang(a, b):
        a, b = norm(a), norm(b)
        return math.degrees(math.acos(max(-1.0, min(1.0, sum(a[k] * b[k] for k in range(3))))))

    print("перо ctrl |  X    |  Y    |  Z    | (углы между in- и out-фреймом)")
    for f in range(feathers):
        for k in range(n_ctrl):
            i = f * n_ctrl + k
            if i >= len(fin) or i >= len(fout):
                break
            a, b = fin[i], fout[i]
            print("  %s    %s   | %5.1f | %5.1f | %5.1f"
                  % (f, k, ang(a[0:3], b[0:3]), ang(a[4:7], b[4:7]), ang(a[8:11], b[8:11])))
