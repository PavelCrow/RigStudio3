"""Build and repair a Chain Full IKFK rig with two or more IK boxes.

The original three-box helper remains the path for existing modules. Other
box counts divide the FK chain into evenly spaced segments; every segment
has an editable linear blend on its FK controls.
"""

import maya.cmds as cmds

from ..chainIk import chainIk_ik_controls as legacy


def layout(controls_count, boxes_count):
    if not 2 <= boxes_count <= controls_count:
        raise ValueError("IK Control Count must be between 2 and FK Controls Count")
    last = controls_count - 1
    anchors = [(last * index * 2 + boxes_count - 1) //
               (2 * (boxes_count - 1)) for index in range(boxes_count)]
    kinds = (["base"] +
             ["middle_{}".format(index) for index in range(1, boxes_count - 1)] +
             ["end"])
    return list(zip(kinds, anchors))


def segment(index, anchors):
    for number in range(len(anchors) - 1):
        left_kind, left_index = anchors[number]
        right_kind, right_index = anchors[number + 1]
        if index < right_index or number == len(anchors) - 2:
            weight = float(index - left_index) / (right_index - left_index)
            attr = "ikBox{}To{}".format(number + 1, number + 2)
            return left_kind, right_kind, attr, weight
    raise AssertionError("No IK box segment for FK index {}".format(index))


def _anchors(name, controls):
    count_plug = name + "_mod.ikBoxesCount"
    if not cmds.objExists(count_plug):
        raise ValueError("{} has no IK Boxes Count; rebuild the module".format(name))
    return layout(len(controls), int(cmds.getAttr(count_plug)))


def _box(name, kind):
    return name + "_ik_" + kind


def _link(source, destination):
    if not cmds.objExists(source) or not cmds.objExists(destination):
        raise ValueError("Missing IK guide plug: {} -> {}".format(source, destination))
    existing = legacy._source_of(destination)
    if existing == source:
        return
    if existing:
        raise ValueError("{} is driven by {}, expected {}".format(
            destination, existing, source))
    cmds.connectAttr(source, destination)


def _attach_rotations(name, controls, anchors, base_rotations=None):
    previous_blend = None
    for index, fk in enumerate(controls):
        left, right, weight_attr, _ = segment(index, anchors)
        offset = fk + "_ikOffset"
        base = (base_rotations or {}).get(fk)
        if base is None:
            base = cmds.getAttr(offset + ".rotate")[0]
        blend = cmds.createNode("blendColors", name=fk + "_ikRotation_blend")
        delta = cmds.createNode("plusMinusAverage", name=fk + "_ikRotation_delta")
        summation = cmds.createNode("plusMinusAverage",
                                    name=fk + "_ikRotation_sum")
        for node in (blend, delta, summation):
            legacy._register(node, name)
        cmds.connectAttr(_box(name, left) + ".rotate", blend + ".color2")
        cmds.connectAttr(_box(name, right) + ".rotate", blend + ".color1")
        cmds.connectAttr(fk + "." + weight_attr, blend + ".blender")
        cmds.setAttr(delta + ".operation", 2)
        cmds.connectAttr(blend + ".output", delta + ".input3D[0]")
        if previous_blend:
            cmds.connectAttr(previous_blend, delta + ".input3D[1]")
        cmds.setAttr(summation + ".input3D[0]", *base, type="double3")
        cmds.connectAttr(delta + ".output3D", summation + ".input3D[1]")
        cmds.connectAttr(summation + ".output3D", offset + ".rotate",
                         force=True)
        previous_blend = blend + ".output"


def add_to_existing(name, boxes_count):
    """Attach a master and a configurable number of IK boxes to a chain."""
    if boxes_count == 3:
        raise ValueError("Use the standard three-box builder for this count")
    controls = legacy._fk_controls(name)
    anchors = layout(len(controls), boxes_count)
    root = name + "_mod"
    if not cmds.objExists(root) or cmds.getAttr(root + ".moduleType") != "chainFullIKFK":
        raise ValueError("Chain Full IKFK module {} was not found".format(name))
    if cmds.objExists(name + "_ik_master"):
        raise ValueError("IK controls already exist for {}".format(name))
    for fk in controls:
        if not cmds.objExists(fk + "_group") or cmds.objExists(fk + "_ikOffset"):
            raise ValueError("FK control {} is missing or already has IK offsets".format(fk))
    selection = cmds.ls(selection=True) or []
    rest_positions = [cmds.xform(fk, query=True, worldSpace=True,
                                 translation=True) for fk in controls]
    success = False
    cmds.undoInfo(openChunk=True, chunkName="Add Chain Full IKFK boxes")
    try:
        master = legacy._master_control(name, color=4, align_with_fk=True)
        first_group = controls[0] + "_group"
        legacy._place_master_at_first_fk(name, master, controls[0])
        cmds.parent(first_group, master)
        cubes = []
        for kind, index in anchors:
            cube, _ = legacy._cube(name, kind, controls[index], master,
                                   17, size=1.5 if kind == "base" else 1.25)
            cubes.append(cube)
        for cube in cubes[1:-1]:
            legacy._middle_follows_end(name, cube, cubes[-1])
        legacy._cube_position_rotation_setup(name, master)
        root_reference = first_group + "_decMat.outputTranslate"
        for index, fk in enumerate(controls):
            fk_group = fk + "_group"
            offset = cmds.group(empty=True, name=fk + "_ikOffset",
                                parent=fk_group)
            cmds.parent(fk, offset)
            legacy._register(offset, name)
            left, right, attr, weight = segment(index, anchors)
            number = int(attr[5:attr.index("To")])
            cmds.addAttr(fk, longName=attr,
                         niceName="IK Box {} To {}".format(number, number + 1),
                         attributeType="double", minValue=0, maxValue=1,
                         defaultValue=weight, keyable=True)
            legacy._position_guide(name, fk, master, root_reference,
                                   left, right, attr)
        for axis in "XYZ":
            cmds.connectAttr(controls[0] + "_ikGuide.translate" + axis,
                             first_group + ".translate" + axis, force=True)
        legacy._compensated_fk_groups(name, controls)
        _attach_rotations(name, controls, anchors)
        legacy._preserve_fk_rest_positions(name, controls, rest_positions)
        cmds.select([master] + cubes, replace=True)
        success = True
        return [master] + cubes
    finally:
        cmds.undoInfo(closeChunk=True)
        if not success:
            if selection:
                cmds.select(selection, replace=True)
            else:
                cmds.select(clear=True)


def repair_position_links(name, controls, anchors):
    """Restore DG links which Maya may drop when construction undo closes."""
    master = name + "_ik_master"
    first = controls[0]
    previous_orientation = first + "_ikOrientationGuide"
    end = _box(name, "end")
    for kind, _ in anchors[1:-1]:
        cube = _box(name, kind)
        scale = cube + "_followEnd_scale"
        summation = cube + "_followEnd_sum"
        effective = cube + "_followEnd_effective"
        _link(end + ".translate", scale + ".input1")
        for axis in "XYZ":
            _link(cube + ".followEndTranslate", scale + ".input2" + axis)
        _link(scale + ".output", summation + ".input3D[1]")
        _link(cube + ".translate", effective + ".input3D[0]")
        _link(scale + ".output", effective + ".input3D[1]")
        for axis in "XYZ":
            _link(summation + ".output3D" + axis.lower(),
                  cube + "_group.translate" + axis)

    for kind in ("base", "end"):
        cube = _box(name, kind)
        relative = cube + "_ikGuide_pivotMatrix"
        pivot = cube + "_ikGuide_pivot"
        rotation = cube + "_ikGuide_rotationMatrix"
        _link(cube + ".worldMatrix[0]", relative + ".matrixIn[0]")
        _link(master + ".worldInverseMatrix[0]", relative + ".matrixIn[1]")
        _link(relative + ".matrixSum", pivot + ".inputMatrix")
        _link(cube + ".rotate", rotation + ".inputRotate")
        _link(cube + ".rotateOrder", rotation + ".inputRotateOrder")

    for index, fk in enumerate(controls):
        guide = fk + "_ikGuide"
        summation = guide + "_sum"
        left, right, attr, _ = segment(index, anchors)
        blend = guide + "_blend"
        _link(first + "_group_decMat.outputTranslate",
              summation + ".input3D[4]")
        _link(legacy._position_source(name, left), blend + ".color2")
        _link(legacy._position_source(name, right), blend + ".color1")
        _link(fk + "." + attr, blend + ".blender")
        _link(blend + ".output", summation + ".input3D[1]")
        for kind in (left, right):
            if kind not in ("base", "end"):
                continue
            cube = _box(name, kind)
            prefix = guide + "_rotate_" + kind
            vector = prefix + "_vector"
            rotated = prefix + "_rotated"
            delta = prefix + "_delta"
            gain = prefix + "_weighted"
            _link(summation + ".output3D", vector + ".input3D[0]")
            _link(cube + "_ikGuide_pivot.outputTranslate",
                  vector + ".input3D[1]")
            _link(vector + ".output3D", rotated + ".input1")
            _link(cube + "_ikGuide_rotationMatrix.outputMatrix",
                  rotated + ".matrix")
            _link(rotated + ".output", delta + ".input3D[0]")
            _link(vector + ".output3D", delta + ".input3D[1]")
            _link(delta + ".output3D", gain + ".input1")
            for axis in "XYZ":
                _link(cube + ".rotationAffectsPosition",
                      gain + ".input2" + axis)
        rotation_blend = guide + "_rotationBlend"
        rotation_sum = guide + "_rotationSum"
        if left in ("base", "end"):
            _link(guide + "_rotate_" + left + "_weighted.output",
                  rotation_blend + ".color2")
        if right in ("base", "end"):
            _link(guide + "_rotate_" + right + "_weighted.output",
                  rotation_blend + ".color1")
        _link(fk + "." + attr, rotation_blend + ".blender")
        _link(summation + ".output3D", rotation_sum + ".input3D[0]")
        _link(rotation_blend + ".output", rotation_sum + ".input3D[1]")
        _link(rotation_sum + ".output3D", guide + ".translate")
        if not index:
            for axis in "XYZ":
                destination = fk + "_group.translate" + axis
                source = guide + ".translate" + axis
                existing = legacy._source_of(destination)
                old = fk + "_group_decMat.outputTranslate" + axis
                if existing != source:
                    if existing and existing != old:
                        raise ValueError("{} is driven by {}".format(destination, existing))
                    cmds.connectAttr(source, destination, force=True)
            continue
        orientation = fk + "_ikOrientationGuide"
        delta = guide + "_delta"
        axes = guide + "_axes"
        vector = guide + "_localVector"
        _link(fk + "_ikOffset.rotate", orientation + ".rotate")
        _link(fk + "_ikOffset.rotateOrder", orientation + ".rotateOrder")
        _link(guide + ".translate", delta + ".input3D[0]")
        _link(controls[index - 1] + "_ikGuide.translate",
              delta + ".input3D[1]")
        _link(master + ".worldMatrix[0]", axes + ".matrixIn[0]")
        _link(previous_orientation + ".worldInverseMatrix[0]",
              axes + ".matrixIn[1]")
        _link(delta + ".output3D", vector + ".input1")
        _link(axes + ".matrixSum", vector + ".matrix")
        group = fk + "_group"
        compound = group + ".translate"
        if legacy._source_of(compound) == vector + ".output":
            cmds.disconnectAttr(vector + ".output", compound)
        for axis in "XYZ":
            destination = compound + axis
            source = vector + ".output" + axis
            existing = legacy._source_of(destination)
            old = group + "_decMat.outputTranslate" + axis
            if existing != source:
                if existing and existing != old:
                    raise ValueError("{} is driven by {}".format(destination, existing))
                cmds.connectAttr(source, destination, force=True)
        previous_orientation = orientation


def repair_rotations(name, controls, anchors):
    base_rotations = {}
    for fk in controls:
        offset = fk + "_ikOffset"
        driver = legacy._rotation_source(fk)
        if driver and driver != fk + "_ikRotation_sum.output3D":
            raise ValueError("{} has a different rotation driver: {}".format(offset, driver))
        if legacy._source_of(fk + ".rotate"):
            raise ValueError("FK control {} has a rotation driver".format(fk))
        summation = fk + "_ikRotation_sum"
        base_rotations[fk] = (cmds.getAttr(summation + ".input3D[0]")[0]
                              if cmds.objExists(summation) else
                              cmds.getAttr(offset + ".rotate")[0])
    cmds.undoInfo(openChunk=True, chunkName="Repair Chain Full IKFK rotations")
    try:
        for fk in controls:
            for suffix in ("_ikRotation_blend", "_ikRotation_delta",
                           "_ikRotation_sum"):
                node = fk + suffix
                if cmds.objExists(node):
                    cmds.delete(node)
        _attach_rotations(name, controls, anchors, base_rotations)
    finally:
        cmds.undoInfo(closeChunk=True)


def verify(name, controls, anchors):
    """Check every box's FK translation and rotation response."""
    master = name + "_ik_master"
    result = {}
    def positions():
        return [cmds.xform(fk + "_group", query=True, worldSpace=True,
                           translation=True) for fk in controls]

    for kind, index in anchors:
        cube = _box(name, kind)
        if cmds.listRelatives(cube + "_group", parent=True) != [master]:
            raise RuntimeError("{} is not under the IK master".format(cube))
        fk = controls[index]
        translation = cmds.getAttr(cube + ".translateY")
        rotation = cmds.getAttr(cube + ".rotateZ")
        try:
            before = positions()
            axis_before = legacy._world_x_axis(fk + "_ikOffset")
            cmds.setAttr(cube + ".translateY", translation + 1)
            after_move = positions()
            cmds.setAttr(cube + ".translateY", translation)
            cmds.setAttr(cube + ".rotateZ", rotation + 60)
            after_rotate = positions()
            axis_after = legacy._world_x_axis(fk + "_ikOffset")
        finally:
            cmds.setAttr(cube + ".rotateZ", rotation)
            cmds.setAttr(cube + ".translateY", translation)
        movement = legacy._distance(before[index], after_move[index])
        turn = legacy._distance(axis_before, axis_after)
        pivot_shift = legacy._distance(before[index], after_rotate[index])
        if movement < 0.1 or turn < 0.1 or pivot_shift > 1e-4:
            raise RuntimeError("{} does not drive {} correctly: move={}, "
                               "turn={}, pivot shift={}".format(
                                   cube, fk, movement, turn, pivot_shift))
        result[kind] = {"fk": fk, "translation": movement,
                        "rotation": turn}
    for kind, _ in anchors[1:-1]:
        cube = _box(name, kind)
        if not cmds.objExists(cube + ".followEndTranslate"):
            raise RuntimeError("{} has no Follow End Translate".format(cube))
    return result


def repair_full_ikfk(name):
    controls = legacy._fk_controls(name)
    anchors = _anchors(name, controls)
    repair_position_links(name, controls, anchors)
    repair_rotations(name, controls, anchors)
    return verify(name, controls, anchors)
