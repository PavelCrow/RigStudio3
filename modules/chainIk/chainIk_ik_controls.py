r"""Add three box controls above the FK controls of a chainIk module.

Cube translation positions the FK controls. Cube rotation drives parent
offset groups while neutral FK pivots stay in place. Each FK control has a
linear weight between its adjacent cubes. Its own
Translate and Rotate channels remain free and use their rotated local axes.
The middle box can follow the end box's translation with a 0..1 weight.

Run from Maya's Python tab, for example::

    import sys, importlib
    sys.path.insert(0, r"F:\Maya_Projects")
    from rigStudio3.modules.chainIk import chainIk_ik_controls as extra
    importlib.reload(extra)
    extra.create("chainIkDemo")

For a chainIk module already in the scene, call extra.add_to_existing("name").
To repair rotation links on a new chain, call extra.add_rotations("name").
Use extra.ensure("name") to finish an existing chain without creating a duplicate.
Select an IK box and use extra.repair_selected_full_ikfk() to repair a
master-and-three-box chain.
The original chainIk.py is not modified.
"""

import os
import re
import tempfile

import maya.cmds as cmds

from rigStudio3 import utils, controller
from rigStudio3.modules.chainIk.chainIk import ChainIk


def _blend_pair(index, middle, last):
    """Return adjacent cubes and their linear FK blend weight."""
    if index <= middle:
        return "base", "middle", "ikBaseToMiddle", float(index) / middle
    return "middle", "end", "ikMiddleToEnd", float(index - middle) / (last - middle)


def _register(node, name, control=False):
    utils.addModuleNameAttr(node, name)
    cmds.sets(node, edit=True, forceElement=name + "_nodesSet")
    if control:
        cmds.sets(node, edit=True, forceElement=name + "_moduleControlSet")
        cmds.sets(node, edit=True, forceElement=name + "_controlSet")


def _cube(name, kind, target, controls_parent, color, size=2.5):
    ctrl = name + "_ik_" + kind
    controller.Control().create(ctrl, "box", colorId=color, offset=False, joint=False)
    cmds.setAttr(ctrl + ".scale", size, size, size, type="double3")
    cmds.makeIdentity(ctrl, apply=True, scale=True)
    utils.setUserAttr(ctrl, "internalName", "ik_" + kind)
    utils.setUserAttr(ctrl, "type", "control")
    _register(ctrl, name, control=True)

    group = cmds.group(ctrl, name=ctrl + "_group")
    cmds.parent(group, controls_parent, relative=True)
    cmds.xform(group, worldSpace=True, translation=cmds.xform(target, query=True, worldSpace=True, translation=True))
    _register(group, name)
    return ctrl, group


def _master_control(name, color=22, align_with_fk=False):
    ctrl = name + "_ik_master"
    controller.Control().create(ctrl, "circle", colorId=color,
                                offset=False, joint=False)
    cmds.setAttr(ctrl + ".scale", 4, 4, 4, type="double3")
    if align_with_fk:
        cmds.setAttr(ctrl + ".rotateZ", -90)
    cmds.makeIdentity(ctrl, apply=True, rotate=align_with_fk, scale=True)
    utils.setUserAttr(ctrl, "internalName", "ik_master")
    utils.setUserAttr(ctrl, "type", "control")
    _register(ctrl, name, control=True)
    group = cmds.group(ctrl, name=ctrl + "_group")
    cmds.parent(group, name + "_controls", relative=True)
    _register(group, name)
    return ctrl


def _middle_follows_end(name, middle, end):
    """Add a weighted end-cube translation to the middle cube's rest position."""
    group = middle + "_group"
    rest = cmds.getAttr(group + ".translate")[0]
    cmds.addAttr(middle, longName="followEndTranslate",
                 niceName="Follow End Translate", attributeType="double",
                 minValue=0, maxValue=1, defaultValue=0, keyable=True)

    scale = cmds.createNode("multiplyDivide", name=middle + "_followEnd_scale")
    summation = cmds.createNode("plusMinusAverage",
                                name=middle + "_followEnd_sum")
    effective = cmds.createNode("plusMinusAverage",
                                name=middle + "_followEnd_effective")
    for node in (scale, summation, effective):
        _register(node, name)
    cmds.connectAttr(end + ".translate", scale + ".input1")
    for axis in "XYZ":
        cmds.connectAttr(middle + ".followEndTranslate",
                         scale + ".input2" + axis)
    cmds.setAttr(summation + ".input3D[0]", *rest, type="double3")
    cmds.connectAttr(scale + ".output", summation + ".input3D[1]")
    cmds.connectAttr(middle + ".translate", effective + ".input3D[0]")
    cmds.connectAttr(scale + ".output", effective + ".input3D[1]")
    for axis in "XYZ":
        cmds.connectAttr(summation + ".output3D" + axis.lower(),
                         group + ".translate" + axis, force=True)


def _cube_position_rotation_setup(name, master):
    """Expose the base and end cube rotations for optional FK placement."""
    for kind in ("base", "end"):
        cube = name + "_ik_" + kind
        cmds.addAttr(cube, longName="rotationAffectsPosition",
                     niceName="Rotate FK Positions", attributeType="double",
                     minValue=0, maxValue=1, defaultValue=0, keyable=True)
        relative = cmds.createNode("multMatrix",
                                   name=cube + "_ikGuide_pivotMatrix")
        pivot = cmds.createNode("decomposeMatrix",
                                name=cube + "_ikGuide_pivot")
        rotation = cmds.createNode("composeMatrix",
                                   name=cube + "_ikGuide_rotationMatrix")
        for node in (relative, pivot, rotation):
            _register(node, name)
        cmds.connectAttr(cube + ".worldMatrix[0]", relative + ".matrixIn[0]")
        cmds.connectAttr(master + ".worldInverseMatrix[0]",
                         relative + ".matrixIn[1]")
        cmds.connectAttr(relative + ".matrixSum", pivot + ".inputMatrix")
        cmds.connectAttr(cube + ".rotate", rotation + ".inputRotate")
        cmds.connectAttr(cube + ".rotateOrder", rotation + ".inputRotateOrder")


def _rotation_position_guide(name, fk, guide, left_kind, right_kind,
                             blend_attr, base_sum):
    """Rotate the current FK-to-cube vectors without moving cube anchors."""
    weighted = {}
    for kind in (left_kind, right_kind):
        if kind not in ("base", "end"):
            continue
        cube = name + "_ik_" + kind
        prefix = guide + "_rotate_" + kind
        vector = cmds.createNode("plusMinusAverage", name=prefix + "_vector")
        rotated = cmds.createNode("vectorProduct", name=prefix + "_rotated")
        delta = cmds.createNode("plusMinusAverage", name=prefix + "_delta")
        gain = cmds.createNode("multiplyDivide", name=prefix + "_weighted")
        for node in (vector, rotated, delta, gain):
            _register(node, name)
        cmds.setAttr(vector + ".operation", 2)
        cmds.connectAttr(base_sum + ".output3D", vector + ".input3D[0]")
        cmds.connectAttr(cube + "_ikGuide_pivot.outputTranslate",
                         vector + ".input3D[1]")
        cmds.setAttr(rotated + ".operation", 3)
        cmds.connectAttr(vector + ".output3D", rotated + ".input1")
        cmds.connectAttr(cube + "_ikGuide_rotationMatrix.outputMatrix",
                         rotated + ".matrix")
        cmds.setAttr(delta + ".operation", 2)
        cmds.connectAttr(rotated + ".output", delta + ".input3D[0]")
        cmds.connectAttr(vector + ".output3D", delta + ".input3D[1]")
        cmds.connectAttr(delta + ".output3D", gain + ".input1")
        for axis in "XYZ":
            cmds.connectAttr(cube + ".rotationAffectsPosition",
                             gain + ".input2" + axis)
        weighted[kind] = gain + ".output"

    blend = cmds.createNode("blendColors", name=guide + "_rotationBlend")
    summation = cmds.createNode("plusMinusAverage",
                                name=guide + "_rotationSum")
    for node in (blend, summation):
        _register(node, name)
    if left_kind in weighted:
        cmds.connectAttr(weighted[left_kind], blend + ".color2")
    if right_kind in weighted:
        cmds.connectAttr(weighted[right_kind], blend + ".color1")
    cmds.connectAttr(fk + "." + blend_attr, blend + ".blender")
    cmds.connectAttr(base_sum + ".output3D", summation + ".input3D[0]")
    cmds.connectAttr(blend + ".output", summation + ".input3D[1]")
    cmds.connectAttr(summation + ".output3D", guide + ".translate")


def _position_guide(name, fk, master, root_reference,
                    left_kind, right_kind, blend_attr):
    """Define an FK position from cube translations and optional rotations."""
    world_position = cmds.xform(fk + "_group", query=True, worldSpace=True,
                                translation=True)
    guide = cmds.group(empty=True, name=fk + "_ikGuide", parent=master)
    cmds.xform(guide, worldSpace=True, translation=world_position)
    base = cmds.getAttr(guide + ".translate")[0]
    _register(guide, name)

    summation = cmds.createNode("plusMinusAverage", name=fk + "_ikGuide_sum")
    _register(summation, name)
    reference = cmds.getAttr(root_reference)[0]
    relative = [base[i] - reference[i] for i in range(3)]
    cmds.setAttr(summation + ".input3D[0]", *relative, type="double3")
    cmds.connectAttr(root_reference, summation + ".input3D[4]")
    blend = cmds.createNode("blendColors", name=guide + "_blend")
    _register(blend, name)
    cmds.connectAttr(_position_source(name, left_kind), blend + ".color2")
    cmds.connectAttr(_position_source(name, right_kind), blend + ".color1")
    cmds.connectAttr(fk + "." + blend_attr, blend + ".blender")
    cmds.connectAttr(blend + ".output", summation + ".input3D[1]")
    _rotation_position_guide(name, fk, guide, left_kind, right_kind,
                             blend_attr, summation)

    return guide


def _position_source(name, kind):
    if kind.startswith("middle"):
        return name + "_ik_" + kind + "_followEnd_effective.output3D"
    return name + "_ik_" + kind + ".translate"


def _compensated_fk_groups(name, controls):
    """Cancel cube rotation on FK spacing while preserving FK local axes."""
    first = controls[0]
    previous_orientation = cmds.group(empty=True,
                                      name=first + "_ikOrientationGuide",
                                      parent=first + "_ikOffset")
    _register(previous_orientation, name)

    for index, fk in enumerate(controls[1:], 1):
        fk_group = fk + "_group"
        orientation = cmds.group(empty=True, name=fk + "_ikOrientationGuide",
                                 parent=previous_orientation)
        _register(orientation, name)
        cmds.connectAttr(fk + "_ikOffset.rotate", orientation + ".rotate")
        cmds.connectAttr(fk + "_ikOffset.rotateOrder", orientation + ".rotateOrder")

        delta = cmds.createNode("plusMinusAverage", name=fk + "_ikGuide_delta")
        _register(delta, name)
        cmds.setAttr(delta + ".operation", 2)  # current position minus previous
        cmds.connectAttr(fk + "_ikGuide.translate", delta + ".input3D[0]")
        cmds.connectAttr(controls[index - 1] + "_ikGuide.translate",
                         delta + ".input3D[1]")

        axes = cmds.createNode("multMatrix", name=fk + "_ikGuide_axes")
        vector = cmds.createNode("vectorProduct", name=fk + "_ikGuide_localVector")
        _register(axes, name)
        _register(vector, name)
        cmds.connectAttr(name + "_ik_master.worldMatrix[0]",
                         axes + ".matrixIn[0]")
        cmds.connectAttr(previous_orientation + ".worldInverseMatrix[0]",
                         axes + ".matrixIn[1]")
        cmds.setAttr(vector + ".operation", 3)  # vector matrix product
        cmds.connectAttr(delta + ".output3D", vector + ".input1")
        cmds.connectAttr(axes + ".matrixSum", vector + ".matrix")
        # ChainIk already drives translateX/Y/Z separately from its poser
        # decomposeMatrix. A compound .translate link can coexist with those
        # child links while the old per-axis drivers still win in Maya.
        for axis in "XYZ":
            cmds.connectAttr(vector + ".output" + axis,
                             fk_group + ".translate" + axis, force=True)
        previous_orientation = orientation


def _attach_rotations(name, controls, base_rotations=None):
    """Blend box rotations per FK, then apply only the local difference."""
    middle = (len(controls) - 1) // 2
    last = len(controls) - 1
    rotations = {kind: name + "_ik_" + kind + ".rotate"
                 for kind in ("base", "middle", "end")}

    previous_blend = None
    for index, fk in enumerate(controls):
        left, right, blend_attr, _ = _blend_pair(index, middle, last)
        offset = fk + "_ikOffset"
        base = (base_rotations or {}).get(fk)
        if base is None:
            base = cmds.getAttr(offset + ".rotate")[0]

        blend = cmds.createNode("blendColors", name=fk + "_ikRotation_blend")
        delta = cmds.createNode("plusMinusAverage", name=fk + "_ikRotation_delta")
        summation = cmds.createNode("plusMinusAverage",
                                    name=fk + "_ikRotation_sum")
        for node in (blend, delta, summation):
            _register(node, name)
        cmds.connectAttr(rotations[left], blend + ".color2")
        cmds.connectAttr(rotations[right], blend + ".color1")
        cmds.connectAttr(fk + "." + blend_attr, blend + ".blender")
        cmds.setAttr(delta + ".operation", 2)  # current minus previous
        cmds.connectAttr(blend + ".output", delta + ".input3D[0]")
        if previous_blend:
            cmds.connectAttr(previous_blend, delta + ".input3D[1]")
        cmds.setAttr(summation + ".input3D[0]", *base, type="double3")
        cmds.connectAttr(delta + ".output3D", summation + ".input3D[1]")
        cmds.connectAttr(summation + ".output3D", offset + ".rotate",
                         force=True)
        previous_blend = blend + ".output"


def _source_of(destination):
    """Find the real driver, stepping through Maya's angle unit conversions."""
    source = cmds.connectionInfo(destination, sourceFromDestination=True)
    while source and cmds.nodeType(source.split(".", 1)[0]) == "unitConversion":
        source = cmds.connectionInfo(source.split(".", 1)[0] + ".input",
                                     sourceFromDestination=True)
    return source


def _rotation_source(fk):
    return _source_of(fk + "_ikOffset.rotate")


def _fk_controls(name):
    controls = []
    index = 1
    while cmds.objExists("{}_element_{}".format(name, index)):
        controls.append("{}_element_{}".format(name, index))
        index += 1
    if len(controls) < 4:
        raise ValueError("At least four FK controls are required for {}".format(name))
    return controls


def repair_position_links(name):
    """Reconnect the existing guide graph without changing any FK pose."""
    controls = _fk_controls(name)
    master = name + "_ik_master"
    if not cmds.objExists(master):
        raise ValueError("Master control for {} is missing".format(name))
    middle = (len(controls) - 1) // 2
    last = len(controls) - 1
    previous_orientation = controls[0] + "_ikOrientationGuide"

    def link(source, destination):
        if not cmds.objExists(source) or not cmds.objExists(destination):
            raise ValueError("Missing IK guide plug: {} -> {}".format(source, destination))
        existing = _source_of(destination)
        if existing == source:
            return
        if existing:
            raise ValueError("{} is driven by {}, expected {}".format(
                destination, existing, source))
        cmds.connectAttr(source, destination)

    middle_cube = name + "_ik_middle"
    end_cube = name + "_ik_end"
    scale = middle_cube + "_followEnd_scale"
    summation = middle_cube + "_followEnd_sum"
    if not cmds.objExists(middle_cube + ".followEndTranslate"):
        raise ValueError("{} has no middle-cube follow attribute; rebuild the module".format(name))
    link(end_cube + ".translate", scale + ".input1")
    for axis in "XYZ":
        link(middle_cube + ".followEndTranslate",
             scale + ".input2" + axis)
    link(scale + ".output", summation + ".input3D[1]")
    effective = middle_cube + "_followEnd_effective"
    link(middle_cube + ".translate", effective + ".input3D[0]")
    link(scale + ".output", effective + ".input3D[1]")
    for axis in "XYZ":
        link(summation + ".output3D" + axis.lower(),
             middle_cube + "_group.translate" + axis)

    for kind in ("base", "end"):
        cube = name + "_ik_" + kind
        relative = cube + "_ikGuide_pivotMatrix"
        pivot = cube + "_ikGuide_pivot"
        rotation = cube + "_ikGuide_rotationMatrix"
        if not cmds.objExists(cube + ".rotationAffectsPosition"):
            raise ValueError("{} has no rotation-position attribute; rebuild the module".format(cube))
        link(cube + ".worldMatrix[0]", relative + ".matrixIn[0]")
        link(master + ".worldInverseMatrix[0]", relative + ".matrixIn[1]")
        link(relative + ".matrixSum", pivot + ".inputMatrix")
        link(cube + ".rotate", rotation + ".inputRotate")
        link(cube + ".rotateOrder", rotation + ".inputRotateOrder")

    for index, fk in enumerate(controls):
        guide = fk + "_ikGuide"
        summation = guide + "_sum"
        link(controls[0] + "_group_decMat.outputTranslate",
             summation + ".input3D[4]")
        left, right, blend_attr, _ = _blend_pair(index, middle, last)
        blend = guide + "_blend"
        link(_position_source(name, left), blend + ".color2")
        link(_position_source(name, right), blend + ".color1")
        link(fk + "." + blend_attr, blend + ".blender")
        link(blend + ".output", summation + ".input3D[1]")
        for kind in (left, right):
            if kind == "middle":
                continue
            cube = name + "_ik_" + kind
            prefix = guide + "_rotate_" + kind
            vector = prefix + "_vector"
            rotated = prefix + "_rotated"
            delta = prefix + "_delta"
            gain = prefix + "_weighted"
            link(summation + ".output3D", vector + ".input3D[0]")
            link(cube + "_ikGuide_pivot.outputTranslate",
                 vector + ".input3D[1]")
            link(vector + ".output3D", rotated + ".input1")
            link(cube + "_ikGuide_rotationMatrix.outputMatrix",
                 rotated + ".matrix")
            link(rotated + ".output", delta + ".input3D[0]")
            link(vector + ".output3D", delta + ".input3D[1]")
            link(delta + ".output3D", gain + ".input1")
            for axis in "XYZ":
                link(cube + ".rotationAffectsPosition",
                     gain + ".input2" + axis)
        rotation_blend = guide + "_rotationBlend"
        rotation_sum = guide + "_rotationSum"
        if left != "middle":
            link(guide + "_rotate_" + left + "_weighted.output",
                 rotation_blend + ".color2")
        if right != "middle":
            link(guide + "_rotate_" + right + "_weighted.output",
                 rotation_blend + ".color1")
        link(fk + "." + blend_attr, rotation_blend + ".blender")
        link(summation + ".output3D", rotation_sum + ".input3D[0]")
        link(rotation_blend + ".output", rotation_sum + ".input3D[1]")
        link(rotation_sum + ".output3D", guide + ".translate")

        if not index:
            for axis in "XYZ":
                source = guide + ".translate" + axis
                destination = fk + "_group.translate" + axis
                existing = _source_of(destination)
                old_source = fk + "_group_decMat.outputTranslate" + axis
                if existing == source:
                    continue
                if existing and existing != old_source:
                    raise ValueError("{} is driven by {}, expected {}".format(
                        destination, existing, source))
                cmds.connectAttr(source, destination, force=True)
            continue
        orientation = fk + "_ikOrientationGuide"
        delta = guide + "_delta"
        axes = guide + "_axes"
        vector = guide + "_localVector"
        link(fk + "_ikOffset.rotate", orientation + ".rotate")
        link(fk + "_ikOffset.rotateOrder", orientation + ".rotateOrder")
        link(guide + ".translate", delta + ".input3D[0]")
        link(controls[index - 1] + "_ikGuide.translate", delta + ".input3D[1]")
        link(master + ".worldMatrix[0]", axes + ".matrixIn[0]")
        link(previous_orientation + ".worldInverseMatrix[0]", axes + ".matrixIn[1]")
        link(delta + ".output3D", vector + ".input1")
        link(axes + ".matrixSum", vector + ".matrix")
        group = fk + "_group"
        compound = group + ".translate"
        if _source_of(compound) == vector + ".output":
            cmds.disconnectAttr(vector + ".output", compound)
        for axis in "XYZ":
            source = vector + ".output" + axis
            destination = compound + axis
            existing = _source_of(destination)
            old_source = group + "_decMat.outputTranslate" + axis
            if existing == source:
                continue
            if existing and existing != old_source:
                raise ValueError("{} is driven by {}, expected {}".format(
                    destination, existing, source))
            cmds.connectAttr(source, destination, force=True)
        previous_orientation = orientation
    return controls


def verify_ik_controls(name):
    """Check the three boxes and their master against actual FK motion."""
    controls = _fk_controls(name)
    middle = (len(controls) - 1) // 2
    result = {}
    master = name + "_ik_master"

    for kind in ("base", "middle", "end"):
        group = name + "_ik_" + kind + "_group"
        if cmds.listRelatives(group, parent=True) != [master]:
            raise RuntimeError("{} must be parented under {}".format(group, master))
        cube = name + "_ik_" + kind
        if cmds.attributeQuery("rotationInfluence", node=cube, exists=True):
            raise RuntimeError("{} still has Rotation Influence".format(cube))
        if kind != "middle" and not cmds.objExists(cube + ".rotationAffectsPosition"):
            raise RuntimeError("Missing rotation-position attribute on {}".format(cube))
        if kind == "middle" and cmds.objExists(cube + ".rotationAffectsPosition"):
            raise RuntimeError("Middle cube must not drive FK positions by rotation")
    middle_cube = name + "_ik_middle"
    end_cube = name + "_ik_end"
    if not cmds.objExists(middle_cube + ".followEndTranslate"):
        raise RuntimeError("Missing middle-cube follow attribute")
    if cmds.objExists(middle_cube + ".aimAtEnd"):
        raise RuntimeError("Middle-cube aiming must be removed")
    if _source_of(middle_cube + "_group.rotate"):
        raise RuntimeError("Middle-cube group still has an aim driver")
    if _source_of(middle_cube + ".rotate"):
        raise RuntimeError("The middle cube's manual Rotate must remain free")
    for axis in "XYZ":
        destination = middle_cube + "_group.translate" + axis
        source = middle_cube + "_followEnd_sum.output3D" + axis.lower()
        if _source_of(destination) != source:
            raise RuntimeError("{} must be driven by {}".format(destination, source))
    for fk in controls:
        for channel in ("translate", "rotate"):
            driver = _source_of(fk + "." + channel)
            if driver:
                raise RuntimeError("FK control {}.{} is driven by {}".format(
                    fk, channel, driver))
    last = len(controls) - 1
    for index, fk in enumerate(controls):
        left, right, blend_attr, _ = _blend_pair(index, middle, last)
        guide = fk + "_ikGuide"
        if _source_of(guide + ".translate") != guide + "_rotationSum.output3D":
            raise RuntimeError("Missing rotation-position guide for {}".format(fk))
        plug = fk + "." + blend_attr
        if not cmds.objExists(plug):
            raise RuntimeError("Missing FK blend attribute {}".format(plug))
        for destination in (fk + "_ikGuide_blend.blender",
                            fk + "_ikRotation_blend.blender"):
            if _source_of(destination) != plug:
                raise RuntimeError("{} must be driven by {}".format(
                    destination, plug))
        rotation_blend = fk + "_ikRotation_blend"
        for kind, color in ((left, "color2"), (right, "color1")):
            destination = rotation_blend + "." + color
            source = name + "_ik_" + kind + ".rotate"
            if _source_of(destination) != source:
                raise RuntimeError("{} must be driven by {}".format(
                    destination, source))

    for axis in "XYZ":
        destination = controls[0] + "_group.translate" + axis
        source = controls[0] + "_ikGuide.translate" + axis
        if _source_of(destination) != source:
            raise RuntimeError("{} must be driven by {}, got {}".format(
                destination, source, _source_of(destination)))

    for fk in controls[1:]:
        vector = fk + "_ikGuide_localVector"
        for axis in "XYZ":
            destination = fk + "_group.translate" + axis
            source = vector + ".output" + axis
            if _source_of(destination) != source:
                raise RuntimeError("{} must be driven by {}, got {}".format(
                    destination, source, _source_of(destination)))

    def positions():
        return [cmds.xform(fk + "_group", query=True, worldSpace=True,
                           translation=True)
                for fk in controls]

    for kind, index in (("base", 0), ("middle", middle),
                        ("end", len(controls) - 1)):
        cube = name + "_ik_" + kind
        fk = controls[index]
        original_translate = cmds.getAttr(cube + ".translateY")
        original_rotate = cmds.getAttr(cube + ".rotateZ")
        try:
            cmds.setAttr(cube + ".translateY", original_translate + 1)
            translated = positions()
            cmds.setAttr(cube + ".translateY", original_translate)
            baseline = positions()
            axis_before = _world_x_axis(fk + "_ikOffset")
            cmds.setAttr(cube + ".rotateZ", original_rotate + 60)
            rotated = positions()
            axis_after = _world_x_axis(fk + "_ikOffset")
        finally:
            cmds.setAttr(cube + ".rotateZ", original_rotate)
            cmds.setAttr(cube + ".translateY", original_translate)
        movement = _distance(baseline[index], translated[index])
        rotation = _distance(axis_before, axis_after)
        pivot_shift = _distance(baseline[index], rotated[index])
        if kind == "middle":
            all_shifts = [_distance(before, after)
                          for before, after in zip(baseline, rotated)]
            if max(all_shifts) > 1e-4:
                raise RuntimeError("Middle-cube rotation moves FK positions: {}".format(
                    all_shifts))
        result[kind] = {"fk": fk, "translation": movement,
                        "rotation": rotation, "pivot_shift": pivot_shift}
        if movement < 0.1 or rotation < 0.1 or pivot_shift > 1e-4:
            raise RuntimeError("{} does not drive {} correctly: {}".format(
                cube, fk, result[kind]))

    original = cmds.getAttr(master + ".translateY")
    try:
        baseline = positions()
        cube_before = cmds.xform(name + "_ik_end", query=True,
                                 worldSpace=True, translation=True)
        cmds.setAttr(master + ".translateY", original + 1)
        translated = positions()
        cube_after = cmds.xform(name + "_ik_end", query=True,
                                worldSpace=True, translation=True)
    finally:
        cmds.setAttr(master + ".translateY", original)
    travel = [_distance(before, after)
              for before, after in zip(baseline, translated)]
    cube_travel = _distance(cube_before, cube_after)
    if min(travel) < 0.1 or cube_travel < 0.1:
        raise RuntimeError("Master control does not move the whole chain: "
                           "FK={} end cube={}".format(travel, cube_travel))
    result["master"] = {"fk_travel": travel, "end_cube_travel": cube_travel}

    original_weight = cmds.getAttr(middle_cube + ".followEndTranslate")
    original_end_y = cmds.getAttr(end_cube + ".translateY")
    try:
        follows = []
        for weight in (0, 1):
            cmds.setAttr(middle_cube + ".followEndTranslate", weight)
            before = cmds.getAttr(middle_cube + "_group.translateY")
            cmds.setAttr(end_cube + ".translateY", original_end_y + 1)
            after = cmds.getAttr(middle_cube + "_group.translateY")
            follows.append(after - before)
            cmds.setAttr(end_cube + ".translateY", original_end_y)
    finally:
        cmds.setAttr(end_cube + ".translateY", original_end_y)
        cmds.setAttr(middle_cube + ".followEndTranslate", original_weight)
    if abs(follows[0]) > 1e-5 or abs(follows[1] - 1) > 1e-5:
        raise RuntimeError("Middle cube follow is incorrect: {}".format(follows))
    result["middle_follow_end"] = follows
    return result


def repair_full_ikfk(name):
    """Finish both control networks on an already built Full IKFK chain."""
    root = name + "_mod"
    if not cmds.objExists(root) or not cmds.attributeQuery(
            "moduleType", node=root, exists=True):
        raise ValueError("Chain module {} was not found".format(name))
    if cmds.getAttr(root + ".moduleType") not in ("chainIk", "chainFullIKFK"):
        raise ValueError("{} is not a supported chain module".format(name))
    if not cmds.objExists(name + "_ik_master"):
        raise ValueError("{} has the previous two-box layout; rebuild the module".format(name))
    repair_position_links(name)
    repair_rotations(name)
    return verify_ik_controls(name)


def repair_selected_full_ikfk():
    """Repair the chain of a selected box or its master."""
    selected = cmds.ls(selection=True, type="transform") or []
    kinds = ("_ik_base", "_ik_middle", "_ik_end", "_ik_master")
    boxes = [node.split("|")[-1] for node in selected
             if node.split("|")[-1].endswith(kinds)]
    if len(boxes) != 1:
        raise ValueError("Select one IK box or the master control")
    return repair_full_ikfk(boxes[0].rsplit("_ik_", 1)[0])


def inspect_selected_full_ikfk():
    """Read the selected box and its FK target without touching the scene."""
    selected = cmds.ls(selection=True, type="transform") or []
    boxes = [node for node in selected
             if node.split("|")[-1].endswith(("_ik_base", "_ik_middle", "_ik_end"))]
    if len(boxes) != 1:
        raise ValueError("Select one IK box after moving it")
    cube = boxes[0].split("|")[-1]
    name, kind = cube.rsplit("_ik_", 1)
    controls = _fk_controls(name)
    index = (0 if kind == "base" else
             (len(controls) - 1) // 2 if kind == "middle" else len(controls) - 1)
    fk = controls[index]
    guide = fk + "_ikGuide"
    group = fk + "_group"
    result = {
        "script": __file__,
        "cube": cube,
        "cube_translate": cmds.getAttr(cube + ".translate")[0],
        "cube_rotate": cmds.getAttr(cube + ".rotate")[0],
        "cube_parent": cmds.listRelatives(cube, parent=True),
        "guide_translate": cmds.getAttr(guide + ".translate")[0],
        "guide_driver": _source_of(guide + ".translate"),
        "fk": fk,
        "fk_group_translate": cmds.getAttr(group + ".translate")[0],
        "fk_group_driver": _source_of(group + ".translate"),
        "fk_group_world": cmds.xform(group, query=True, worldSpace=True,
                                      translation=True),
        "fk_control_world": cmds.xform(fk, query=True, worldSpace=True,
                                        translation=True),
        "fk_control_parent": cmds.listRelatives(fk, parent=True),
        "rotation_driver": _rotation_source(fk),
        "fk_offset_rotate": cmds.getAttr(fk + "_ikOffset.rotate")[0],
        "posers_visible": cmds.getAttr(name + "_posers.visibility"),
        "controls_visible": cmds.getAttr(name + "_controls.visibility"),
    }
    if index:
        previous_guide = controls[index - 1] + "_ikGuide"
        delta = guide + "_delta"
        vector = guide + "_localVector"
        axes = guide + "_axes"
        result["previous_guide_translate"] = cmds.getAttr(
            previous_guide + ".translate")[0]
        result["delta_operation"] = cmds.getAttr(delta + ".operation")
        result["delta_input_current"] = cmds.getAttr(delta + ".input3D[0]")[0]
        result["delta_input_previous"] = cmds.getAttr(delta + ".input3D[1]")[0]
        result["delta_output"] = cmds.getAttr(delta + ".output3D")[0]
        result["vector_operation"] = cmds.getAttr(vector + ".operation")
        result["vector_input"] = cmds.getAttr(vector + ".input1")[0]
        result["vector_output"] = cmds.getAttr(vector + ".output")[0]
        result["vector_input_driver"] = _source_of(vector + ".input1")
        result["vector_matrix_driver"] = _source_of(vector + ".matrix")
        result["axes_output_translation"] = cmds.getAttr(
            axes + ".matrixSum")[12:15]
        result["vector_node_state"] = cmds.getAttr(vector + ".nodeState")
        result["fk_group_translate_after_trace"] = cmds.getAttr(
            group + ".translate")[0]
    return result


def add_rotations(name):
    """Build direct cube rotation links, replacing older influenced links."""
    return repair_rotations(name)


def repair_rotations(name):
    """Rebuild only this module's rotation nodes, preserving cubes and FK pose."""
    cubes = [name + "_ik_" + kind for kind in ("base", "middle", "end")]
    if not all(cmds.objExists(cube) for cube in cubes):
        raise ValueError("Three IK boxes are required for {}".format(name))
    controls = _fk_controls(name)
    base_rotations = {}
    for fk in controls:
        offset = fk + "_ikOffset"
        if not cmds.objExists(offset):
            raise ValueError("IK offset {} is missing".format(offset))
        if not cmds.objExists(fk + "_ikGuide"):
            raise ValueError("Position guide for {} is missing".format(fk))
        driver = _rotation_source(fk)
        if driver and not driver.startswith(fk + "_ikRotation_sum."):
            raise ValueError("FK group {} has a different rotation driver: {}".format(
                offset, driver))
        fk_driver = _source_of(fk + ".rotate")
        if fk_driver:
            raise ValueError("FK control {} has a different rotation driver: {}".format(
                fk, fk_driver))
        if cmds.objExists(fk + "_ikRotation_sum"):
            base_rotations[fk] = cmds.getAttr(fk + "_ikRotation_sum.input3D[0]")[0]
        else:
            base_rotations[fk] = cmds.getAttr(offset + ".rotate")[0]

    owned_nodes = [cube + "_ikRotation_influence" for cube in cubes]
    for fk in controls:
        owned_nodes.extend((fk + "_ikRotation_blend", fk + "_ikRotation_delta",
                            fk + "_ikRotation_sum"))
    cmds.undoInfo(openChunk=True, chunkName="Repair chainIk box rotations")
    try:
        for node in owned_nodes:
            if cmds.objExists(node):
                cmds.delete(node)
        for cube in cubes:
            attribute = cube + ".rotationInfluence"
            if cmds.objExists(attribute):
                cmds.setAttr(attribute, lock=False)
                cmds.deleteAttr(attribute)
        _attach_rotations(name, controls, base_rotations)
        for fk in controls:
            if _rotation_source(fk) != fk + "_ikRotation_sum.output3D":
                raise RuntimeError("Rotation link was not created for {}".format(fk))
    finally:
        cmds.undoInfo(closeChunk=True)
    return tuple(cubes)


def add_to_existing(name, box_color=None, box_scale=1.0,
                    master_color=22, align_master_with_fk=False):
    """Attach three IK boxes and their master to a completed chainIk module."""
    root = name + "_mod"
    if not cmds.objExists(root) or not cmds.attributeQuery("moduleType", node=root, exists=True):
        raise ValueError("chainIk module {!r} was not found".format(name))
    if cmds.getAttr(root + ".moduleType") not in ("chainIk", "chainFullIKFK"):
        raise ValueError("{} is not a supported chain module".format(name))
    if (cmds.objExists(name + "_ik_master") or cmds.objExists(name + "_ik_base")
            or cmds.objExists(name + "_ik_middle") or cmds.objExists(name + "_ik_end")):
        raise ValueError("IK controls already exist for {}".format(name))

    controls = []
    index = 1
    while cmds.objExists("{}_element_{}".format(name, index)):
        controls.append("{}_element_{}".format(name, index))
        index += 1
    if len(controls) < 4:
        raise ValueError("chainIk needs at least four FK controls")
    if not cmds.objExists(name + "_controls"):
        raise ValueError("Missing controls group for {}".format(name))
    for set_name in ("_nodesSet", "_moduleControlSet", "_controlSet"):
        if not cmds.objExists(name + set_name):
            raise ValueError("Missing module set {}".format(name + set_name))
    for ctrl in controls:
        if not cmds.objExists(ctrl + "_group"):
            raise ValueError("Missing FK group for {}".format(ctrl))
        if cmds.objExists(ctrl + "_ikOffset"):
            raise ValueError("IK offset already exists for {}".format(ctrl))

    middle = (len(controls) - 1) // 2
    last = len(controls) - 1
    selection = cmds.ls(selection=True) or []
    success = False
    cmds.undoInfo(openChunk=True, chunkName="Add chainIk box controls")
    try:
        master = _master_control(name, color=master_color,
                                 align_with_fk=align_master_with_fk)
        first_fk_group = controls[0] + "_group"
        cmds.parent(first_fk_group, master)
        base_ctrl, _ = _cube(name, "base", controls[0], master,
                             box_color if box_color is not None else 6,
                             size=3.0 * box_scale)
        mid_ctrl, _ = _cube(name, "middle", controls[middle], master,
                            box_color if box_color is not None else 13,
                            size=2.5 * box_scale)
        end_ctrl, _ = _cube(name, "end", controls[last], master,
                            box_color if box_color is not None else 17,
                            size=2.5 * box_scale)
        _middle_follows_end(name, mid_ctrl, end_ctrl)
        _cube_position_rotation_setup(name, master)
        root_reference = first_fk_group + "_decMat.outputTranslate"

        for index in range(len(controls)):
            fk = controls[index]
            fk_group = fk + "_group"
            offset = cmds.group(empty=True, name=fk + "_ikOffset", parent=fk_group)
            cmds.parent(fk, offset)  # preserve the existing world pose
            _register(offset, name)

            left, right, blend_attr, default = _blend_pair(index, middle, last)
            cmds.addAttr(fk, longName=blend_attr, attributeType="double",
                         minValue=0, maxValue=1, defaultValue=default,
                         keyable=True)
            _position_guide(name, fk, master, root_reference,
                            left, right, blend_attr)

        for axis in "XYZ":
            cmds.connectAttr(controls[0] + "_ikGuide.translate" + axis,
                             first_fk_group + ".translate" + axis, force=True)
        _compensated_fk_groups(name, controls)
        add_rotations(name)
        cmds.select(master, base_ctrl, mid_ctrl, end_ctrl)
        success = True
        return master, base_ctrl, mid_ctrl, end_ctrl
    finally:
        cmds.undoInfo(closeChunk=True)
        if not success:
            if selection:
                cmds.select(selection, replace=True)
            else:
                cmds.select(clear=True)


class _HeadlessMain(object):
    def rigPage_update(self):
        pass


def _import_template_without_editor_managers(path, module_name, original_import):
    """Maya's singleton editor managers in _template.ma cannot be renamed."""
    if os.path.basename(path) != "_template.ma":
        return original_import(path, module_name)

    with open(path, "rb") as source:
        data = source.read()
    for node_type in (b"shapeEditorManager", b"poseInterpolatorManager"):
        pattern = rb'createNode ' + node_type + rb' -n "[^"]+";\r?\n\s*rename -uid "[^"]+";\r?\n'
        data = re.sub(pattern, b"", data)

    descriptor, clean_path = tempfile.mkstemp(prefix="chainIk_template_", suffix=".ma")
    try:
        with os.fdopen(descriptor, "wb") as target:
            target.write(data)
        return original_import(clean_path, module_name)
    finally:
        if os.path.exists(clean_path):
            os.remove(clean_path)


def create(name="chainIkDemo", controls_count=5, joints_count=10, length=10.0):
    """Create a Rig Studio chainIk module, then attach the box controls."""
    if not re.match(r"^[A-Za-z_][A-Za-z_0-9]*$", name):
        raise ValueError("Use a Maya-compatible name without namespace or spaces")
    if cmds.objExists(name + "_mod"):
        raise ValueError("Module {} already exists".format(name))
    if controls_count < 4 or joints_count < 2:
        raise ValueError("Use at least 4 FK controls and 2 joints")
    if length <= 0:
        raise ValueError("length must be positive")
    if name.startswith("r_") and not cmds.objExists("l_" + name[2:] + "_mod"):
        raise ValueError("The original chainIk expects a matching l_ module for r_ names")

    from rigStudio3.rig import Rig

    main = _HeadlessMain()
    main.rig = Rig(main)
    if not main.rig.exists and not main.rig.create():
        raise RuntimeError("Could not create the Rig Studio rig")
    utils.create_default_sets()

    chain = ChainIk(name)
    chain.main = main
    chain.length = float(length)
    original_import = utils.importFile
    utils.importFile = lambda path, module_name="": _import_template_without_editor_managers(
        path, module_name, original_import
    )
    try:
        chain.create({
            "controlsCount": int(controls_count),
            "jointsCount": int(joints_count),
            "useDynamic": False,
        })
    finally:
        utils.importFile = original_import
    return add_to_existing(name)


def _world_x_axis(node):
    """World-space X direction of a transform, independent of Euler channels."""
    matrix = cmds.xform(node, query=True, worldSpace=True, matrix=True)
    return matrix[:3]


def _distance(first, second):
    return sum((second[i] - first[i]) ** 2 for i in range(3)) ** 0.5


def regenerate(name="chainIkDemo2", controls_count=5, joints_count=10, length=10.0):
    """Replace this one chainIk module and build its FK and IK controls anew."""
    if not re.match(r"^[A-Za-z_][A-Za-z_0-9]*$", name):
        raise ValueError("Use a Maya-compatible name without namespace or spaces")
    if not isinstance(controls_count, int) or not isinstance(joints_count, int):
        raise ValueError("Control and joint counts must be integers")
    if controls_count < 4 or joints_count < 2 or length <= 0:
        raise ValueError("Use at least 4 FK controls, 2 joints, and positive length")
    if name.startswith("r_") and not cmds.objExists("l_" + name[2:] + "_mod"):
        raise ValueError("The original chainIk expects a matching l_ module for r_ names")
    root = name + "_mod"
    if cmds.objExists(root):
        if not cmds.attributeQuery("moduleType", node=root, exists=True) \
                or cmds.getAttr(root + ".moduleType") != "chainIk":
            raise ValueError("{} is not a chainIk module".format(root))
        if cmds.referenceQuery(root, isNodeReferenced=True):
            raise ValueError("Cannot regenerate a referenced chainIk module")

        from rigStudio3.rig import Rig

        main = _HeadlessMain()
        main.rig = Rig(main)
        children = main.rig.getModuleChildren(name)
        if children:
            raise ValueError("Other modules depend on {}: {}".format(name, ", ".join(children)))

        skin_root = name + "_root_skinJoint"
        joints = []
        if cmds.objExists(skin_root):
            joints = [skin_root] + (cmds.listRelatives(skin_root, allDescendents=True,
                                                       type="joint") or [])
        for joint in joints:
            clusters = cmds.listConnections(joint, type="skinCluster") or []
            if clusters:
                raise ValueError("{} is bound to geometry; unbind it before regeneration".format(joint))

    cmds.undoInfo(openChunk=True, chunkName="Regenerate chainIk with IK boxes")
    try:
        if cmds.objExists(root):
            old = ChainIk(name)
            old.root = root
            old.delete()
        result = create(name, controls_count, joints_count, length)
    finally:
        cmds.undoInfo(closeChunk=True)

    # Finish after construction and its undo chunk. Maya must leave the
    # per-axis links connected, not merely create the helper nodes.
    repair_full_ikfk(name)
    for index in range(2, controls_count + 1):
        fk = "{}_element_{}".format(name, index)
        if _rotation_source(fk) != fk + "_ikRotation_sum.output3D":
            raise RuntimeError("Missing rotation link after regeneration: {}".format(fk))
        for channel in ("translate", "rotate"):
            if _source_of(fk + "." + channel):
                raise RuntimeError("FK {} is not free: {}".format(fk, channel))

    checks = []
    middle_index = (controls_count - 1) // 2 + 1
    for kind, fk_index in (("middle", middle_index), ("end", controls_count)):
        cube = name + "_ik_" + kind
        fk = "{}_element_{}".format(name, fk_index)
        original_angle = cmds.getAttr(cube + ".rotateZ")
        try:
            cmds.setAttr(cube + ".rotateZ", 0)
            before = _world_x_axis(fk)
            positions_before = [cmds.xform("{}_element_{}".format(name, i),
                                           query=True, worldSpace=True, translation=True)
                                for i in range(1, controls_count + 1)]
            cmds.setAttr(cube + ".rotateZ", 60)
            after = _world_x_axis(fk)
            group_angle = cmds.getAttr(fk + "_ikOffset.rotateZ")
            positions_after = [cmds.xform("{}_element_{}".format(name, i),
                                          query=True, worldSpace=True, translation=True)
                               for i in range(1, controls_count + 1)]
        finally:
            cmds.setAttr(cube + ".rotateZ", original_angle)
        change = _distance(before, after)
        position_change = max(_distance(first, second)
                              for first, second in zip(positions_before, positions_after))
        if change < 0.1 or abs(group_angle) < 0.01 or position_change > 1e-4:
            raise RuntimeError("{} rotation check failed: {} group Z={:.3f}, "
                               "orientation change={:.3f}, position change={:.6f}".format(
                                   cube, fk, group_angle, change, position_change))
        checks.append("{} cube -> {} group Z {:.2f} deg, max FK position change {:.6f}".format(
            kind, fk, group_angle, position_change))

    fk = name + "_element_2"
    child = name + "_element_3"
    cube = name + "_ik_middle"
    original_tx = cmds.getAttr(fk + ".translateX")
    original_rz = cmds.getAttr(fk + ".rotateZ")
    original_cube_rz = cmds.getAttr(cube + ".rotateZ")
    try:
        baseline = cmds.xform(child, query=True, worldSpace=True, translation=True)
        cmds.setAttr(fk + ".rotateZ", original_rz + 15)
        manual_rotate = cmds.xform(child, query=True, worldSpace=True, translation=True)
        cmds.setAttr(fk + ".rotateZ", original_rz)
        cmds.setAttr(fk + ".translateX", original_tx + 1)
        manual_translate = cmds.xform(child, query=True, worldSpace=True,
                                     translation=True)
        cmds.setAttr(fk + ".translateX", original_tx)
        cmds.setAttr(cube + ".rotateZ", original_cube_rz + 150)
        axis_matrix = cmds.xform(fk + "_ikOffset", query=True,
                                 worldSpace=True, matrix=True)
        visual_x_axis = axis_matrix[:3]
        before_translate = cmds.xform(fk, query=True, worldSpace=True,
                                      translation=True)
        cmds.setAttr(fk + ".translateX", original_tx + 1)
        after_translate = cmds.xform(fk, query=True, worldSpace=True,
                                     translation=True)
    finally:
        cmds.setAttr(cube + ".rotateZ", original_cube_rz)
        cmds.setAttr(fk + ".rotateZ", original_rz)
        cmds.setAttr(fk + ".translateX", original_tx)
    manual_rotation_travel = _distance(baseline, manual_rotate)
    manual_translation_travel = _distance(baseline, manual_translate)
    actual_axis = [after_translate[i] - before_translate[i] for i in range(3)]
    axis_error = _distance(actual_axis, visual_x_axis)
    if (manual_rotation_travel < 0.01 or manual_translation_travel < 0.01
            or axis_error > 1e-4):
        raise RuntimeError("Manual FK verification failed: child movement from FK "
                           "rotate={:.4f}, translate={:.4f}; local axis error={:.6f}".format(
                               manual_rotation_travel, manual_translation_travel,
                               axis_error))
    checks.append("manual FK translate follows the rotated local axis")
    print("Rotation verified: " + "; ".join(checks))
    return result


def ensure(name="chainIkDemo2"):
    """Add or upgrade the boxes on an existing named chain."""
    has_middle = cmds.objExists(name + "_ik_middle")
    has_end = cmds.objExists(name + "_ik_end")
    if has_middle != has_end:
        raise ValueError("Only one IK box exists for {}; inspect or undo the partial build".format(name))
    if has_middle:
        if not cmds.objExists(name + "_ik_master"):
            raise ValueError("{} has the previous layout; rebuild the module".format(name))
        return repair_full_ikfk(name)
    if cmds.objExists(name + "_mod"):
        return add_to_existing(name)
    existing = []
    for root in cmds.ls("*_mod", type="transform") or []:
        if cmds.attributeQuery("moduleType", node=root, exists=True) \
                and cmds.getAttr(root + ".moduleType") == "chainIk":
            existing.append(root[:-4])
    raise ValueError("No chainIk module named {!r}. Existing chains: {}. "
                     "Use create(name) only to make a new chain.".format(
                         name, ", ".join(existing) if existing else "none"))


def add_rotations_to_selected():
    """Upgrade the IK box selected in Maya, avoiding guessed module names."""
    selected = cmds.ls(selection=True, type="transform") or []
    boxes = [node for node in selected
             if node.endswith("_ik_middle") or node.endswith("_ik_end")]
    if len(boxes) != 1:
        raise ValueError("Select exactly one visible middle or end IK box")
    cube = boxes[0]
    name = cube.rsplit("_ik_", 1)[0]
    add_rotations(name)
    return name, cube


def probe_selected_rotation():
    """Temporarily rotate the selected IK box and report the live scene response."""
    selected = cmds.ls(selection=True, type="transform") or []
    boxes = [node for node in selected
             if node.endswith("_ik_middle") or node.endswith("_ik_end")]
    if len(boxes) != 1:
        raise ValueError("Select exactly one middle or end IK box first")
    cube = boxes[0]
    name, kind = cube.rsplit("_ik_", 1)
    controls = []
    index = 1
    while cmds.objExists("{}_element_{}".format(name, index)):
        controls.append("{}_element_{}".format(name, index))
        index += 1
    if len(controls) < 4:
        raise ValueError("FK controls for {} were not found".format(name))
    fk = controls[(len(controls) - 1) // 2 if kind == "middle" else -1]
    angle = cube + ".rotateZ"
    if not cmds.objExists(fk + "_ikGuide"):
        raise ValueError("Rotation setup is missing for {}; run add_rotations(name)".format(name))

    original_angle = cmds.getAttr(angle)
    result = {
        "script": __file__,
        "cube": cube,
        "fk": fk,
        "rotate_driver": _rotation_source(fk),
        "other_middle_boxes": cmds.ls("*_ik_middle", type="transform") or [],
    }
    try:
        cmds.setAttr(angle, 0)
        baseline = cmds.xform(fk, query=True, worldSpace=True, translation=True)
        baseline_axis = _world_x_axis(fk)
        cmds.setAttr(angle, 60)
        moved = cmds.xform(fk, query=True, worldSpace=True, translation=True)
        rotated_axis = _world_x_axis(fk)
        result["fk_group_rotate_z_at_60"] = round(
            cmds.getAttr(fk + "_ikOffset.rotateZ"), 4)
        result["fk_control_rotate_z_at_60"] = round(cmds.getAttr(fk + ".rotateZ"), 4)
        result["fk_position_change"] = [round(moved[i] - baseline[i], 4) for i in range(3)]
        result["fk_world_orientation_change"] = round(_distance(baseline_axis, rotated_axis), 4)
    finally:
        cmds.setAttr(angle, original_angle)
    print("CHAIN_IK_ROTATION_PROBE", result)
    return result
