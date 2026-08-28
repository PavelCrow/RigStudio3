# -*- coding: utf-8 -*-
"""Автономный прогон сверки pk_wing с Bifrost-графом под mayapy.

    "C:\\Program Files\\Autodesk\\Maya2022\\bin\\mayapy.exe" pk_wing_test.py [сцена]

Сцена открывается и НИКОГДА не сохраняется: сразу после открытия делается
file -rename на временный путь, чтобы даже случайный save не задел оригинал.
"""

import os
import sys
import time

DEFAULT_SCENE = r"F:\Projects\SMF\owl\owl.v000.ma"
SCRATCH = os.environ.get("PK_SCRATCH", os.path.join(os.environ.get("TEMP", "."), "pk_wing_test"))

HERE = os.path.dirname(os.path.abspath(__file__))


def log(msg):
    print("[test] %s" % msg)
    sys.stdout.flush()


def axis_angle(a, b):
    import math
    na = sum(c * c for c in a) ** 0.5
    nb = sum(c * c for c in b) ** 0.5
    if na < 1e-9 or nb < 1e-9:
        return float("nan")
    d = sum(a[k] * b[k] for k in range(3)) / (na * nb)
    return math.degrees(math.acos(max(-1.0, min(1.0, d))))


_REF_CACHE = {}


def reference(cmds, graph, attr, layer, feathers, n_ctrl):
    """Матрицы графа читаются один раз - при свипе они не меняются."""
    key = (graph, attr, layer, feathers, n_ctrl)
    if key in _REF_CACHE:
        return _REF_CACHE[key]

    rows = {}
    for f in range(feathers):
        for k in range(n_ctrl):
            plug = "%s.%s[%s].%s_A[%s].%s_A_B[%s]" % (graph, attr, layer, attr, f, attr, k)
            try:
                rows[(f, k)] = cmds.getAttr(plug)
            except Exception:
                pass

    _REF_CACHE[key] = rows
    return rows


def compare(cmds, node, graph, attr, stage, layer, max_feathers=None):
    """Сравнить мои матрицы стадии stage с выходом attr графа. Возвращает сводку."""
    cmds.setAttr(node + ".debug_stage", stage)
    cmds.setAttr(node + ".debug_layer", layer)

    idx = cmds.getAttr(node + ".debug_matrices", mi=True) or []
    mine = [cmds.getAttr("%s.debug_matrices[%s]" % (node, i)) for i in idx]

    n_ctrl = cmds.getAttr("%s.layer_feather_controls_count[%s]" % (node, layer))
    feathers = cmds.getAttr("%s.layer_feathers_count[%s]" % (node, layer))
    if max_feathers:
        feathers = min(feathers, max_feathers)

    refs = reference(cmds, graph, attr, layer, feathers, n_ctrl)

    worst = {"pos": 0.0, "x": 0.0, "y": 0.0, "z": 0.0, "at": ""}
    total = 0
    missing = 0

    for f in range(feathers):
        for k in range(n_ctrl):
            flat = f * n_ctrl + k
            if flat >= len(mine):
                break

            ref = refs.get((f, k))
            if ref is None:
                missing += 1
                continue

            m = mine[flat]
            pos = sum((ref[12 + c] - m[12 + c]) ** 2 for c in range(3)) ** 0.5
            ax = axis_angle(ref[0:3], m[0:3])
            ay = axis_angle(ref[4:7], m[4:7])
            az = axis_angle(ref[8:11], m[8:11])
            total += 1

            if max(ax, ay, az) > max(worst["x"], worst["y"], worst["z"]) or pos > worst["pos"]:
                if max(ax, ay, az) >= max(worst["x"], worst["y"], worst["z"]):
                    worst.update(x=ax, y=ay, z=az, at="feather %s ctrl %s" % (f, k))
                worst["pos"] = max(worst["pos"], pos)

    return {"attr": attr, "compared": total, "missing": missing, "worst": worst}


PERTURB_SPECS = [
    ("layer_twist_root", -40.0, 40.0),
    ("layer_twist_tip", -40.0, 40.0),
    ("layer_bend", -6.0, 6.0),
    ("layer_wide", 0.005, 0.15),
    ("layer_pos_min", 0.0, 0.4),
    ("layer_pos_max", 0.6, 1.0),
    ("layer_length_min", 0.0, 0.3),
    ("layer_length_max", 0.7, 1.0),
    ("layer_offset_root", -2.0, 2.0),
    ("layer_offset_tip", -2.0, 2.0),
]

NESTED_SPECS = [
    ("twist_root", -30.0, 30.0),
    ("twist_tip", -30.0, 30.0),
    ("bend", -4.0, 4.0),
    ("length", 0.3, 1.0),
    ("root_pos", 0.0, 1.0),
    ("tip_pos", 0.0, 1.0),
]


def source_plug(cmds, plug):
    """Плаг-источник, если он свободен для записи, иначе None."""
    src = cmds.listConnections(plug, s=True, d=False, p=True) or []
    if not src:
        return plug
    s = src[0]
    if cmds.listConnections(s, s=True, d=False) or cmds.getAttr(s, lock=True):
        return None
    return s


def perturb(cmds, graph, layer, rnd):
    """Случайно сдвинуть входы графа через их источники. Возвращает число правок."""
    changed = 0

    for attr, lo, hi in PERTURB_SPECS:
        plug = "%s.%s[%s]" % (graph, attr, layer)
        try:
            target = source_plug(cmds, plug)
        except Exception:
            target = None
        if not target:
            continue
        try:
            cmds.setAttr(target, rnd.uniform(lo, hi))
            changed += 1
        except Exception:
            pass

    feathers = min(6, cmds.getAttr("%s.layer_feathers_count[%s]" % (graph, layer)) or 0)
    for attr, lo, hi in NESTED_SPECS:
        for f in range(feathers):
            plug = "%s.%s[%s].%s_A[%s]" % (graph, attr, layer, attr, f)
            try:
                target = source_plug(cmds, plug)
            except Exception:
                target = None
            if not target:
                continue
            try:
                cmds.setAttr(target, rnd.uniform(lo, hi))
                changed += 1
            except Exception:
                pass

    for attr, lo, hi in (("auto_twist_root", -20.0, 20.0), ("auto_twist_tip", -20.0, 20.0)):
        try:
            target = source_plug(cmds, "%s.%s" % (graph, attr))
            if target:
                cmds.setAttr(target, rnd.uniform(lo, hi))
                changed += 1
        except Exception:
            pass

    return changed


def check_graph(cmds, d, graph, layers, label=""):
    node = d.make_from_graph(graph)
    worst_all = {"pos": 0.0, "ang": 0.0}

    for layer in layers:
        for stage, attr in ((12, "out_controls_local_matrixes"),
                            (13, "out_joints_in_matrixes"),
                            (14, "out_joints_out_matrixes")):
            r = compare(cmds, node, graph, attr, stage, layer, max_feathers=8)
            w = r["worst"]
            ang = max(w["x"], w["y"], w["z"])
            worst_all["pos"] = max(worst_all["pos"], w["pos"])
            worst_all["ang"] = max(worst_all["ang"], ang)
            log("%s%-28s layer %s | n %3s | pos %8.5f  ang %7.3f" %
                (label, attr, layer, r["compared"], w["pos"], ang))

    log("%sWORST: pos %.5f, angle %.3f" % (label, worst_all["pos"], worst_all["ang"]))
    cmds.delete(node)
    return worst_all


def main():
    scene = sys.argv[1] if len(sys.argv) > 1 else DEFAULT_SCENE
    layers = [int(x) for x in (sys.argv[2].split(",") if len(sys.argv) > 2 else ["0"])]

    # VP2.0 в headless-режиме лезет к настоящему GPU и подвисает, если он занят
    # открытой Maya - форсируем виртуальное устройство. Плюс убираем телеметрию,
    # чтобы старт был короче.
    os.environ.setdefault("MAYA_VP2_DEVICE_OVERRIDE", "VirtualDeviceGL")
    os.environ.setdefault("MAYA_DISABLE_CIP", "1")
    os.environ.setdefault("MAYA_DISABLE_CER", "1")
    os.environ.setdefault("MAYA_DISABLE_CLIC_IPM", "1")

    t0 = time.time()
    import maya.standalone
    maya.standalone.initialize("Python")
    import maya.cmds as cmds
    log("standalone up in %.1fs" % (time.time() - t0))

    # ТОЛЬКО bifrostGraph: bifrostvisplugin тянет инициализацию VP2.0, а в
    # headless-режиме она подвисает (и конфликтует с открытой Maya за GPU).
    # Для сверки матриц вьюпорт не нужен.
    try:
        if not cmds.pluginInfo("bifrostGraph", q=True, loaded=True):
            cmds.loadPlugin("bifrostGraph")
        log("bifrostGraph loaded")
    except Exception as e:
        log("bifrostGraph: %s" % e)

    t0 = time.time()
    cmds.file(scene, open=True, force=True, prompt=False, ignoreVersion=True)
    log("scene opened in %.1fs" % (time.time() - t0))

    # защита от случайного сохранения поверх оригинала
    if not os.path.isdir(SCRATCH):
        os.makedirs(SCRATCH)
    cmds.file(rename=os.path.join(SCRATCH, "never_save_this.ma"))

    sys.path.insert(0, HERE)
    import pk_wing_debug as d

    d.load_plugin()
    graph = d.find_graph()
    log("graph: %s" % graph)
    if not graph:
        return 1

    if os.environ.get("PK_ALL_GRAPHS"):
        graphs = [g for g in (cmds.ls(type="bifrostGraphShape") or [])
                  if cmds.objExists(g + ".curves_position")]
        log("graphs found: %s" % graphs)

        for gr in graphs:
            mir = cmds.getAttr(gr + ".mirror") if cmds.objExists(gr + ".mirror") else None
            log("=== %s (mirror = %s)" % (gr, mir))
            check_graph(cmds, d, gr, layers, label="   ")

        if os.environ.get("PK_PERTURB"):
            import random
            for seed in (1, 2, 3):
                rnd = random.Random(seed)
                for gr in graphs:
                    n_changed = perturb(cmds, gr, layers[0], rnd)
                    log("=== seed %s, %s: %s inputs perturbed" % (seed, gr, n_changed))
                    _REF_CACHE.clear()
                    check_graph(cmds, d, gr, [layers[0]], label="   ")
        return 0

    node = d.make_from_graph(graph)

    if os.environ.get("PK_SWEEP_K"):
        log("--- sweeping stretch_constant on layer %s" % layers[0])
        for k in [0.8, 0.9, 1.0, 1.1, 1.2, 1.3, 1.355, 1.4, 1.5, 1.7, 2.0]:
            cmds.setAttr(node + ".stretch_constant", k)
            r = compare(cmds, node, graph, "out_joints_in_matrixes", 13, layers[0], max_feathers=4)
            w = r["worst"]
            log("K = %-6s worst pos %8.5f  Y %7.3f" % (k, w["pos"], w["y"]))
        cmds.setAttr(node + ".stretch_constant", 1.355)

    for layer in layers:
        log("--- layer %s" % layer)
        for stage, attr in ((12, "out_controls_local_matrixes"),
                            (13, "out_joints_in_matrixes"),
                            (14, "out_joints_out_matrixes")):
            r = compare(cmds, node, graph, attr, stage, layer)
            w = r["worst"]
            log("%-28s compared %4s  missing %3s | worst pos %8.5f  X %7.3f  Y %7.3f  Z %7.3f  (%s)"
                % (r["attr"], r["compared"], r["missing"], w["pos"], w["x"], w["y"], w["z"], w["at"]))

    return 0


if __name__ == "__main__":
    sys.exit(main())
