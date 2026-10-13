"""Rig Studio module: an FK chain with configurable IK boxes and a master."""

import importlib
import re
from functools import partial

import maya.cmds as cmds
import maya.api.OpenMaya as om

from ... import module, utils
from ..chainIk.chainIk import ChainIk
from ..chainIk import chainIk as chain_ik_module
from ..chainIk import chainIk_ik_controls
from . import variable_boxes
from . import box_dynamics


def _remove_rotation_position_graph(name, controls_count):
    """Keep box rotation on FK axes without rotating FK positions."""
    obsolete = []
    for index in range(1, controls_count + 1):
        guide = "{}_element_{}_ikGuide".format(name, index)
        summation = guide + "_sum"
        if not cmds.objExists(guide) or not cmds.objExists(summation):
            raise RuntimeError("Missing FK position guide for {}".format(guide))
        cmds.connectAttr(summation + ".output3D", guide + ".translate",
                         force=True)
        obsolete.extend((guide + "_rotationSum",
                         guide + "_rotationBlend"))
        for kind in ("base", "end"):
            prefix = guide + "_rotate_" + kind
            obsolete.extend(prefix + "_" + suffix for suffix in
                            ("vector", "rotated", "delta", "weighted"))
    for kind in ("base", "end"):
        cube = name + "_ik_" + kind
        obsolete.extend((cube + "_ikGuide_pivotMatrix",
                         cube + "_ikGuide_pivot",
                         cube + "_ikGuide_rotationMatrix"))
    existing = [node for node in obsolete if cmds.objExists(node)]
    if existing:
        cmds.delete(existing)
    for kind in ("base", "end"):
        cube = name + "_ik_" + kind
        if cmds.objExists(cube + ".rotationAffectsPosition"):
            cmds.deleteAttr(cube, attribute="rotationAffectsPosition")


def _blend_middle_follow(name, controls_count, boxes_count):
    """Blend each middle box's translation between the base and end boxes."""
    base = name + "_ik_base"
    end = name + "_ik_end"
    for kind in box_dynamics.kinds(controls_count, boxes_count):
        if kind in ("base", "end"):
            continue
        cube = name + "_ik_" + kind
        delta = cmds.createNode("plusMinusAverage",
                                name=cube + "_followBetween_delta")
        chainIk_ik_controls._register(delta, name)
        cmds.setAttr(delta + ".operation", 2)
        cmds.connectAttr(end + ".translate", delta + ".input3D[0]")
        cmds.connectAttr(base + ".translate", delta + ".input3D[1]")
        cmds.connectAttr(delta + ".output3D",
                         cube + "_followEnd_scale.input1", force=True)
        for suffix in ("_followEnd_sum", "_followEnd_effective"):
            cmds.connectAttr(base + ".translate",
                             cube + suffix + ".input3D[2]")


def _hide_control_visibility(name):
    for control in utils.getSetObjects(name + "_moduleControlSet"):
        plug = control + ".visibility"
        if cmds.objExists(plug):
            cmds.setAttr(plug, keyable=False, channelBox=False)


def _unify_fk_blend_attributes(name, controls_count, boxes_count):
    anchors = (variable_boxes.layout(controls_count, boxes_count)
               if boxes_count != 3 else None)
    middle = (controls_count - 1) // 2
    last = controls_count - 1
    for index in range(controls_count):
        fk = "{}_element_{}".format(name, index + 1)
        if anchors is None:
            old_attr = chainIk_ik_controls._blend_pair(
                index, middle, last)[2]
        else:
            old_attr = variable_boxes.segment(index, anchors)[2]
        cmds.renameAttr(fk + "." + old_attr, "ikControlBlend")
        cmds.addAttr(fk + ".ikControlBlend", edit=True,
                     niceName="IK Control Blend")


def _hide_box_scale(name, controls_count, boxes_count):
    for kind in box_dynamics.kinds(controls_count, boxes_count):
        cube = name + "_ik_" + kind
        for axis in "XYZ":
            plug = cube + ".scale" + axis
            if cmds.getAttr(plug, lock=True):
                cmds.setAttr(plug, lock=False)
            cmds.setAttr(plug, 1)
            cmds.setAttr(plug, keyable=False, channelBox=False, lock=True)


def _create_ik_box_posers(name, controls_count, boxes_count):
    """Give every box an editable rest frame outside the FK poser hierarchy."""
    anchors = ([('base', 0), ('middle', (controls_count - 1) // 2),
                ('end', controls_count - 1)]
               if boxes_count == 3 else
               variable_boxes.layout(controls_count, boxes_count))
    for kind, index in anchors:
        poser = "{}_ik_{}_poser".format(name, kind)
        fk_poser = (name + "_root_poser" if index == 0 else
                    "{}_element_{}_poser".format(name, index + 1))
        position = cmds.xform(fk_poser, query=True, worldSpace=True,
                              translation=True)
        poser = cmds.spaceLocator(name=poser)[0]
        cmds.parent(poser, name + "_mainPoser", relative=True)
        cmds.xform(poser, worldSpace=True,
                   matrix=[1, 0, 0, 0, 0, 1, 0, 0,
                           0, 0, 1, 0, *position, 1])
        cmds.addAttr(poser, longName="size", attributeType="double",
                     minValue=0, defaultValue=0.8, keyable=True)
        cmds.setAttr(poser + ".visibility", keyable=False,
                     channelBox=False)
        cmds.setAttr(poser + ".overrideEnabled", True)
        cmds.setAttr(poser + ".overrideColor", 17)
        for axis in "XYZ":
            cmds.setAttr(poser + ".scale" + axis, keyable=False,
                         channelBox=False, lock=True)
        size = cmds.createNode("multDoubleLinear",
                               name=poser + "_size_multDoubleLinear")
        chainIk_ik_controls._register(poser, name)
        chainIk_ik_controls._register(size, name)
        cmds.connectAttr(poser + ".size", size + ".input1")
        cmds.connectAttr(name + "_mainPoser.globalSize",
                         size + ".input2")
        for shape in cmds.listRelatives(poser, shapes=True) or []:
            chainIk_ik_controls._register(shape, name)
            for axis in "XYZ":
                cmds.connectAttr(size + ".output",
                                 shape + ".localScale" + axis)


def _follow_end_ik_poser_to_fk_poser(name, controls_count):
    """Carry the end IK rest position with the last FK poser."""
    ik_poser = name + "_ik_end_poser"
    fk_poser = "{}_element_{}_poser".format(name, controls_count)
    parent = cmds.listRelatives(ik_poser, parent=True, fullPath=True)[0]

    def make(node_type, suffix):
        node = cmds.createNode(node_type, name=ik_poser + suffix)
        chainIk_ik_controls._register(node, name)
        return node

    relative = make("multMatrix", "_fkRelative")
    position = make("decomposeMatrix", "_fkPosition")
    delta = make("plusMinusAverage", "_fkMove")
    offset = make("composeMatrix", "_fkOffset")
    cmds.connectAttr(fk_poser + ".worldMatrix[0]",
                     relative + ".matrixIn[0]")
    cmds.connectAttr(parent + ".worldInverseMatrix[0]",
                     relative + ".matrixIn[1]")
    cmds.connectAttr(relative + ".matrixSum", position + ".inputMatrix")
    rest = cmds.getAttr(position + ".outputTranslate")[0]
    cmds.setAttr(delta + ".operation", 2)
    cmds.connectAttr(position + ".outputTranslate",
                     delta + ".input3D[0]")
    cmds.setAttr(delta + ".input3D[1]", *rest, type="double3")
    cmds.connectAttr(delta + ".output3D", offset + ".inputTranslate")
    cmds.connectAttr(offset + ".outputMatrix",
                     ik_poser + ".offsetParentMatrix")


def _follow_ik_controls_to_posers(name, controls_count, boxes_count):
    """Move box rest frames with posers while keeping animator channels free."""
    root_poser = name + "_root_poser"
    master = name + "_ik_master"
    master_group = master + "_group"
    rest_node = name + "_element_1_ikMasterRest_multMat"
    master_rest_offset = (
        om.MMatrix(cmds.getAttr(master + ".worldMatrix[0]"))
        * om.MMatrix(cmds.getAttr(root_poser + ".worldInverseMatrix[0]")))
    identity = list(om.MMatrix())
    # The master and its group carry no rest transform in their channels.
    # Their former world placement lives in the poser-follow matrix instead.
    cmds.setAttr(rest_node + ".matrixIn[2]", *identity, type="matrix")
    for node in (master, master_group):
        cmds.setAttr(node + ".translate", 0, 0, 0, type="double3")
        cmds.setAttr(node + ".rotate", 0, 0, 0, type="double3")
    master_follow = cmds.createNode("multMatrix",
                                    name=master_group + "_poserFollow")
    chainIk_ik_controls._register(master_follow, name)
    cmds.setAttr(master_follow + ".matrixIn[0]",
                 *list(master_rest_offset), type="matrix")
    cmds.connectAttr(root_poser + ".worldMatrix[0]",
                     master_follow + ".matrixIn[1]")
    # parentInverseMatrix on this transform includes its own offsetParentMatrix,
    # which would feed the result back into itself after this connection.
    parent = cmds.listRelatives(master_group, parent=True, fullPath=True)[0]
    cmds.connectAttr(parent + ".worldInverseMatrix[0]",
                     master_follow + ".matrixIn[2]")
    cmds.connectAttr(master_follow + ".matrixSum",
                     master_group + ".offsetParentMatrix", force=True)

    anchors = ([('base', 0), ('middle', (controls_count - 1) // 2),
                ('end', controls_count - 1)]
               if boxes_count == 3 else
               variable_boxes.layout(controls_count, boxes_count))
    root_inverse = om.MMatrix(cmds.getAttr(
        root_poser + ".worldInverseMatrix[0]"))
    for kind, _ in anchors:
        cube = name + "_ik_" + kind
        poser = cube + "_poser"
        relative = (om.MMatrix(cmds.getAttr(poser + ".worldMatrix[0]"))
                    * root_inverse)
        frame = cmds.group(empty=True, name=cube + "_poserFrame",
                           parent=master)
        group = cube + "_group"
        cmds.parent(group, frame, relative=True)
        # Store the cube's rest placement in the driven frame so the group
        # itself reads zero in the channel box.
        rest_local = om.MMatrix(cmds.getAttr(group + ".matrix"))
        middle_sum = cube + "_followEnd_sum"
        if cmds.objExists(middle_sum):
            cmds.setAttr(middle_sum + ".input3D[0]", 0, 0, 0,
                         type="double3")
        else:
            cmds.setAttr(group + ".translate", 0, 0, 0, type="double3")
        chainIk_ik_controls._register(frame, name)
        follow = cmds.createNode("multMatrix", name=frame + "_multMat")
        chainIk_ik_controls._register(follow, name)
        cmds.setAttr(follow + ".matrixIn[0]",
                     *list(rest_local * relative.inverse()), type="matrix")
        cmds.connectAttr(poser + ".worldMatrix[0]",
                         follow + ".matrixIn[1]")
        cmds.connectAttr(root_poser + ".worldInverseMatrix[0]",
                         follow + ".matrixIn[2]")
        cmds.connectAttr(follow + ".matrixSum",
                         frame + ".offsetParentMatrix")


def _align_ik_box_translation_axes(name, controls_count, boxes_count):
    """Make each box's local move reach FK guides in the same world direction."""
    master = name + "_ik_master"
    root_poser = name + "_root_poser"
    master_offset = cmds.getAttr(
        master + "_group_poserFollow.matrixIn[0]")
    anchors = ([('base', 0), ('middle', (controls_count - 1) // 2),
                ('end', controls_count - 1)]
               if boxes_count == 3 else
               variable_boxes.layout(controls_count, boxes_count))
    sources = {}
    for kind, _ in anchors:
        cube = name + "_ik_" + kind
        parent = cmds.listRelatives(cube, parent=True, fullPath=True)[0]
        matrix = cmds.createNode("multMatrix", name=cube + "_masterAxes")
        vector = cmds.createNode("vectorProduct", name=cube + "_masterMove")
        for node in (matrix, vector):
            chainIk_ik_controls._register(node, name)
        cmds.connectAttr(parent + ".worldMatrix[0]",
                         matrix + ".matrixIn[0]")
        cmds.connectAttr(master + ".worldInverseMatrix[0]",
                         matrix + ".matrixIn[1]")
        cmds.setAttr(vector + ".operation", 3)
        source = (cube + "_effectiveTranslate.output3D"
                  if cmds.objExists(cube + "_effectiveTranslate") else
                  cube + ".translate")
        cmds.connectAttr(source, vector + ".input1")
        cmds.connectAttr(matrix + ".matrixSum", vector + ".matrix")
        sources[kind] = vector + ".output"

    for kind, _ in anchors[1:-1]:
        cube = name + "_ik_" + kind
        delta = cube + "_followBetween_delta"
        cmds.connectAttr(sources['end'], delta + ".input3D[0]", force=True)
        cmds.connectAttr(sources['base'], delta + ".input3D[1]", force=True)
        cmds.connectAttr(sources['base'],
                         cube + "_followEnd_sum.input3D[2]", force=True)
        cmds.connectAttr(sources['base'],
                         cube + "_followEnd_effective.input3D[2]",
                         force=True)
        cmds.connectAttr(sources[kind],
                         cube + "_followEnd_effective.input3D[0]",
                         force=True)
        # The middle group sits under a poser frame, so its follow vector
        # must return from master space to that frame's local axes.
        frame = cube + "_poserFrame"
        matrix = cmds.createNode("multMatrix", name=cube + "_followLocalAxes")
        vector = cmds.createNode("vectorProduct", name=cube + "_followLocal")
        for node in (matrix, vector):
            chainIk_ik_controls._register(node, name)
        cmds.connectAttr(master + ".worldMatrix[0]",
                         matrix + ".matrixIn[0]")
        cmds.connectAttr(frame + ".worldInverseMatrix[0]",
                         matrix + ".matrixIn[1]")
        cmds.setAttr(vector + ".operation", 3)
        cmds.connectAttr(cube + "_followEnd_sum.output3D", vector + ".input1")
        cmds.connectAttr(matrix + ".matrixSum", vector + ".matrix")
        for axis in "XYZ":
            cmds.connectAttr(vector + ".output" + axis,
                             cube + "_group.translate" + axis, force=True)
        sources[kind] = cube + "_followEnd_effective.output3D"

    for index in range(controls_count):
        fk = "{}_element_{}".format(name, index + 1)
        if boxes_count == 3:
            left, right, _, _ = chainIk_ik_controls._blend_pair(
                index, (controls_count - 1) // 2, controls_count - 1)
        else:
            left, right, _, _ = variable_boxes.segment(index, anchors)
        blend = fk + "_ikGuide_blend"
        cmds.connectAttr(sources[left], blend + ".color2", force=True)
        cmds.connectAttr(sources[right], blend + ".color1", force=True)
        if not index:
            continue
        axes = fk + "_ikGuide_axes"
        old_source = cmds.connectionInfo(
            axes + ".matrixIn[0]", sourceFromDestination=True)
        if old_source:
            cmds.disconnectAttr(old_source, axes + ".matrixIn[0]")
        cmds.setAttr(axes + ".matrixIn[0]", *master_offset,
                     type="matrix")
        cmds.connectAttr(root_poser + ".worldMatrix[0]",
                         axes + ".matrixIn[1]", force=True)
        previous_poser = (root_poser if index == 1 else
                          "{}_element_{}_poser".format(name, index))
        cmds.connectAttr(previous_poser + ".worldInverseMatrix[0]",
                         axes + ".matrixIn[2]")


def _follow_fk_translations_to_posers(name, controls_count):
    """Drive FK guide positions directly from the current FK poser layout."""
    root_poser = name + "_root_poser"
    master = name + "_ik_master"
    master_offset = om.MMatrix(cmds.getAttr(
        master + "_group_poserFollow.matrixIn[0]"))
    for index in range(2, controls_count + 1):
        fk = "{}_element_{}".format(name, index)
        poser = fk + "_poser"
        relative = cmds.createNode("multMatrix",
                                   name=fk + "_poserRelative")
        current = cmds.createNode("decomposeMatrix",
                                  name=fk + "_poserRelativePosition")
        for node in (relative, current):
            chainIk_ik_controls._register(node, name)
        cmds.connectAttr(poser + ".worldMatrix[0]",
                         relative + ".matrixIn[0]")
        cmds.connectAttr(root_poser + ".worldInverseMatrix[0]",
                         relative + ".matrixIn[1]")
        cmds.setAttr(relative + ".matrixIn[2]",
                     *list(master_offset.inverse()), type="matrix")
        cmds.connectAttr(relative + ".matrixSum",
                         current + ".inputMatrix")
        guide = fk + "_ikGuide_sum"
        # The guide was built with a sampled FK rest vector in input[0].
        # Replace it with the live poser position instead of adding a delta
        # against another sampled value in input[3].
        cmds.setAttr(guide + ".input3D[0]", 0, 0, 0,
                     type="double3")
        cmds.setAttr(guide + ".input3D[3]", 0, 0, 0,
                     type="double3")
        cmds.connectAttr(current + ".outputTranslate",
                         guide + ".input3D[0]", force=True)


def _align_ik_box_rotation_axes(name, controls_count, boxes_count):
    """Blend box rotations in world axes, then solve each FK's local offset."""
    anchors = ([('base', 0), ('middle', (controls_count - 1) // 2),
                ('end', controls_count - 1)]
               if boxes_count == 3 else
               variable_boxes.layout(controls_count, boxes_count))

    def create(kind, suffix):
        node = cmds.createNode(kind, name=name + suffix)
        chainIk_ik_controls._register(node, name)
        return node

    world_rotations = {}
    for kind, _ in anchors:
        cube = name + "_ik_" + kind
        parent = cmds.listRelatives(cube, parent=True, fullPath=True)[0]
        local = create("composeMatrix", "_ik_" + kind + "_rotateMatrix")
        world = create("multMatrix", "_ik_" + kind + "_worldRotation")
        picked = create("pickMatrix", "_ik_" + kind + "_worldRotationOnly")
        cmds.connectAttr(cube + ".rotate", local + ".inputRotate")
        cmds.connectAttr(cube + ".rotateOrder", local + ".inputRotateOrder")
        cmds.connectAttr(parent + ".worldInverseMatrix[0]",
                         world + ".matrixIn[0]")
        cmds.connectAttr(local + ".outputMatrix", world + ".matrixIn[1]")
        cmds.connectAttr(parent + ".worldMatrix[0]",
                         world + ".matrixIn[2]")
        cmds.connectAttr(world + ".matrixSum", picked + ".inputMatrix")
        for attr in ("useTranslate", "useScale", "useShear"):
            cmds.setAttr(picked + "." + attr, False)
        world_rotations[kind] = picked + ".outputMatrix"

    previous_fk = None
    previous_proxy = None
    for index in range(controls_count):
        fk = "{}_element_{}".format(name, index + 1)
        group = fk + "_group"
        offset = fk + "_ikOffset"
        if boxes_count == 3:
            left, right, _, _ = chainIk_ik_controls._blend_pair(
                index, (controls_count - 1) // 2, controls_count - 1)
        else:
            left, right, _, _ = variable_boxes.segment(index, anchors)

        rest = create("composeMatrix", "_element_" + str(index + 1)
                      + "_restOffsetMatrix")
        relative = create("multMatrix", "_element_" + str(index + 1)
                          + "_poseRelativeMatrix")
        proxy = create("multMatrix", "_element_" + str(index + 1)
                       + "_poseRotationMatrix")
        blend = create("blendMatrix", "_element_" + str(index + 1)
                       + "_boxRotationMatrix")
        desired = create("multMatrix", "_element_" + str(index + 1)
                         + "_desiredRotationMatrix")
        pose_dec = create("decomposeMatrix", "_element_" + str(index + 1)
                          + "_poseMatrixComponents")
        rotation_dec = create("decomposeMatrix", "_element_" + str(index + 1)
                              + "_desiredRotationComponents")
        target = create("composeMatrix", "_element_" + str(index + 1)
                        + "_desiredWorldMatrix")
        local = create("multMatrix", "_element_" + str(index + 1)
                       + "_localOffsetMatrix")
        decomposed = create("decomposeMatrix", "_element_" + str(index + 1)
                            + "_localOffset")

        base = cmds.getAttr(fk + "_ikRotation_sum.input3D[0]")[0]
        cmds.setAttr(rest + ".inputTranslate",
                     *cmds.getAttr(offset + ".translate")[0],
                     type="double3")
        cmds.setAttr(rest + ".inputRotate", *base, type="double3")
        cmds.connectAttr(offset + ".rotateOrder",
                         rest + ".inputRotateOrder")
        if previous_fk:
            cmds.connectAttr(group + ".matrix",
                             relative + ".matrixIn[0]")
            cmds.connectAttr(group + ".offsetParentMatrix",
                             relative + ".matrixIn[1]")
        else:
            cmds.connectAttr(group + ".worldMatrix[0]",
                             relative + ".matrixIn[0]")
        cmds.connectAttr(fk + ".matrix", proxy + ".matrixIn[0]")
        cmds.connectAttr(rest + ".outputMatrix", proxy + ".matrixIn[1]")
        cmds.connectAttr(relative + ".matrixSum", proxy + ".matrixIn[2]")
        if previous_proxy:
            cmds.connectAttr(previous_proxy + ".matrixSum",
                             proxy + ".matrixIn[3]")
        cmds.connectAttr(world_rotations[left], blend + ".inputMatrix")
        cmds.connectAttr(world_rotations[right],
                         blend + ".target[0].targetMatrix")
        cmds.connectAttr(fk + ".ikControlBlend",
                         blend + ".target[0].weight")
        cmds.connectAttr(proxy + ".matrixSum", desired + ".matrixIn[0]")
        cmds.connectAttr(blend + ".outputMatrix", desired + ".matrixIn[1]")
        cmds.connectAttr(proxy + ".matrixSum", pose_dec + ".inputMatrix")
        cmds.connectAttr(desired + ".matrixSum",
                         rotation_dec + ".inputMatrix")
        cmds.connectAttr(pose_dec + ".outputTranslate",
                         target + ".inputTranslate")
        cmds.connectAttr(rotation_dec + ".outputRotate",
                         target + ".inputRotate")
        cmds.connectAttr(pose_dec + ".outputScale",
                         target + ".inputScale")
        cmds.connectAttr(pose_dec + ".outputShear",
                         target + ".inputShear")
        cmds.connectAttr(fk + ".inverseMatrix", local + ".matrixIn[0]")
        cmds.connectAttr(target + ".outputMatrix", local + ".matrixIn[1]")
        cmds.connectAttr(group + ".worldInverseMatrix[0]",
                         local + ".matrixIn[2]")
        cmds.connectAttr(local + ".matrixSum",
                         decomposed + ".inputMatrix")
        cmds.connectAttr(offset + ".rotateOrder",
                         decomposed + ".inputRotateOrder")
        cmds.connectAttr(decomposed + ".outputTranslate",
                         offset + ".translate", force=True)
        cmds.connectAttr(decomposed + ".outputRotate", offset + ".rotate",
                         force=True)
        previous_fk = fk
        previous_proxy = proxy


def _orient_ik_boxes_from_posers(name, controls_count, boxes_count):
    """Use each IK poser's world orientation for its box's rest axes."""
    for kind in box_dynamics.kinds(controls_count, boxes_count):
        cube = name + "_ik_" + kind
        group = cube + "_group"
        frame = cmds.listRelatives(group, parent=True, fullPath=True)[0]
        source = cmds.createNode("decomposeMatrix",
                                 name=group + "_parentWorldParts")
        poser_rotation = cmds.createNode("decomposeMatrix",
                                         name=group + "_poserWorldParts")
        aligned = cmds.createNode("composeMatrix",
                                  name=group + "_worldFrame")
        relative = cmds.createNode("multMatrix",
                                   name=group + "_worldFrameLocal")
        inverse = cmds.createNode("inverseMatrix",
                                  name=group + "_worldFrameInverse")
        for node in (source, poser_rotation, aligned, relative, inverse):
            chainIk_ik_controls._register(node, name)
        cmds.connectAttr(frame + ".worldMatrix[0]",
                         source + ".inputMatrix")
        cmds.connectAttr(cube + "_poser.worldMatrix[0]",
                         poser_rotation + ".inputMatrix")
        cmds.connectAttr(source + ".outputTranslate",
                         aligned + ".inputTranslate")
        cmds.connectAttr(poser_rotation + ".outputRotate",
                         aligned + ".inputRotate")
        cmds.connectAttr(source + ".outputScale",
                         aligned + ".inputScale")
        cmds.connectAttr(aligned + ".outputMatrix",
                         relative + ".matrixIn[0]")
        cmds.connectAttr(frame + ".worldInverseMatrix[0]",
                         relative + ".matrixIn[1]")
        cmds.connectAttr(relative + ".matrixSum",
                         group + ".offsetParentMatrix", force=True)
        cmds.connectAttr(aligned + ".outputMatrix",
                         inverse + ".inputMatrix")
        follow_axes = cube + "_followLocalAxes"
        if cmds.objExists(follow_axes):
            cmds.connectAttr(inverse + ".outputMatrix",
                             follow_axes + ".matrixIn[1]", force=True)


def _add_end_world_space(name, controls_count, boxes_count):
    """Keep the end IK box in world space while its master moves."""
    cube = name + "_ik_end"
    group = cube + "_group"
    parent = cmds.listRelatives(group, parent=True, fullPath=True)[0]
    source = cmds.connectionInfo(group + ".offsetParentMatrix",
                                 sourceFromDestination=True)
    if not source:
        raise RuntimeError("The end IK box has no poser frame")
    cmds.addAttr(cube, longName="world", niceName="World",
                 attributeType="double", minValue=0.0, maxValue=1.0,
                 defaultValue=0.0, keyable=True)

    def make(node_type, suffix):
        node = cmds.createNode(node_type, name=cube + suffix)
        chainIk_ik_controls._register(node, name)
        return node

    # Anchor the world space to the IK poser. A fixed build-time world matrix
    # becomes stale when the poser is restored or edited after construction.
    poser = cube + "_poser"
    rest = (om.MMatrix(cmds.getAttr(group + ".matrix")).inverse()
            * om.MMatrix(cmds.getAttr(group + ".worldMatrix[0]"))
            * om.MMatrix(cmds.getAttr(poser + ".worldInverseMatrix[0]")))
    fixed = make("multMatrix", "_worldFixed")
    cmds.setAttr(fixed + ".matrixIn[0]", *list(rest), type="matrix")
    cmds.connectAttr(poser + ".worldMatrix[0]",
                     fixed + ".matrixIn[1]")
    cmds.connectAttr(parent + ".worldInverseMatrix[0]",
                     fixed + ".matrixIn[2]")
    space = make("blendMatrix", "_worldSpace")
    cmds.connectAttr(source, space + ".inputMatrix")
    cmds.connectAttr(fixed + ".matrixSum",
                     space + ".target[0].targetMatrix")
    cmds.connectAttr(cube + ".world", space + ".target[0].weight")
    cmds.connectAttr(space + ".outputMatrix",
                     group + ".offsetParentMatrix", force=True)

    # FK guides read box translations in master space. Add the change in
    # the box group's world position so World also moves the FK chain.
    baseline = make("multMatrix", "_worldBaseline")
    baseline_parts = make("decomposeMatrix", "_worldBaselineParts")
    actual_parts = make("decomposeMatrix", "_worldActualParts")
    delta = make("plusMinusAverage", "_worldDelta")
    local = make("vectorProduct", "_worldLocalDelta")
    combined = make("plusMinusAverage", "_worldMasterMove")
    cmds.connectAttr(group + ".matrix", baseline + ".matrixIn[0]")
    cmds.connectAttr(group + "_worldFrame.outputMatrix",
                     baseline + ".matrixIn[1]")
    cmds.connectAttr(baseline + ".matrixSum",
                     baseline_parts + ".inputMatrix")
    cmds.connectAttr(group + ".worldMatrix[0]",
                     actual_parts + ".inputMatrix")
    cmds.setAttr(delta + ".operation", 2)
    cmds.connectAttr(actual_parts + ".outputTranslate",
                     delta + ".input3D[0]")
    cmds.connectAttr(baseline_parts + ".outputTranslate",
                     delta + ".input3D[1]")
    cmds.setAttr(local + ".operation", 3)
    cmds.connectAttr(delta + ".output3D", local + ".input1")
    cmds.connectAttr(name + "_ik_master.worldInverseMatrix[0]",
                     local + ".matrix")
    cmds.connectAttr(cube + "_masterMove.output", combined + ".input3D[0]")
    cmds.connectAttr(local + ".output", combined + ".input3D[1]")

    for kind in box_dynamics.kinds(controls_count, boxes_count):
        if kind not in ("base", "end"):
            cmds.connectAttr(combined + ".output3D",
                             name + "_ik_" + kind +
                             "_followBetween_delta.input3D[0]", force=True)
    anchors = (None if boxes_count == 3 else
               variable_boxes.layout(controls_count, boxes_count))
    for index in range(controls_count):
        if anchors is None:
            left, right, _, _ = chainIk_ik_controls._blend_pair(
                index, (controls_count - 1) // 2, controls_count - 1)
        else:
            left, right, _, _ = variable_boxes.segment(index, anchors)
        blend = "{}_element_{}_ikGuide_blend".format(name, index + 1)
        if left == "end":
            cmds.connectAttr(combined + ".output3D",
                             blend + ".color2", force=True)
        if right == "end":
            cmds.connectAttr(combined + ".output3D",
                             blend + ".color1", force=True)


def _follow_end_pivot_to_fk_poser(name, controls_count):
    """Place the end box's pivot at the last FK poser in its rest frame."""
    cube = name + "_ik_end"
    fk_poser = "{}_element_{}_poser".format(name, controls_count)
    ik_poser = cube + "_poser"
    relative = cmds.createNode("multMatrix", name=cube + "_fkPivotRelative")
    position = cmds.createNode("decomposeMatrix",
                               name=cube + "_fkPivotPosition")
    for node in (relative, position):
        chainIk_ik_controls._register(node, name)
    cmds.connectAttr(fk_poser + ".worldMatrix[0]",
                     relative + ".matrixIn[0]")
    cmds.connectAttr(ik_poser + ".worldInverseMatrix[0]",
                     relative + ".matrixIn[1]")
    cmds.connectAttr(relative + ".matrixSum", position + ".inputMatrix")
    for pivot in ("rotatePivot", "scalePivot"):
        cmds.connectAttr(position + ".outputTranslate",
                         cube + "." + pivot, force=True)


class ChainFullIKFK(ChainIk):
    """Use ChainIk's rig, with the box-control graph built into the module."""

    def __init__(self, name):
        # ChainIk uses super(self.__class__, self), which recurses in a subclass.
        module.Module.__init__(self)
        self.name = name
        self.type = "chainFullIKFK"
        self.length = 10.0
        self.controlsCount = 5
        self.jointsCount = 10
        self.ikBoxesCount = 3
        self.useBoxDynamics = False
        self.localControls = True
        self.useDynamic = False

    def rename(self, new_name):
        # ChainIk gives some IK and hair nodes a moduleName attribute but
        # omits them from the set used by Module.rename. Include every owned
        # node so Make Symmetry retains their expected l_* names.
        for node in cmds.ls(self.name + "_*") or []:
            if (cmds.objExists(node + ".moduleName") and
                    cmds.getAttr(node + ".moduleName") == self.name):
                utils.addToModuleSet(node, self.name)
        module.Module.rename(self, new_name)

    def create2(self):
        # ChainIk.create2 makes both spline curves cubic. Three FK controls
        # provide only three CVs, so use quadratic curves for this case only.
        if self.controlsCount != 3:
            return ChainIk.create2(self)
        original_curve = chain_ik_module.pm.curve
        curve_names = (self.name + "_staticCrv", self.name + "_initCrv")

        def create_curve(*args, **kwargs):
            if kwargs.get("n") in curve_names and kwargs.get("d") == 3:
                kwargs["d"] = 2
            return original_curve(*args, **kwargs)

        chain_ik_module.pm.curve = create_curve
        try:
            return ChainIk.create2(self)
        finally:
            chain_ik_module.pm.curve = original_curve

    def create(self, options=None):
        # Rig Studio may keep this module open while its helper is edited.
        # Rebuild must use the helper currently on disk in the same Maya session.
        importlib.reload(chainIk_ik_controls)
        importlib.reload(variable_boxes)
        importlib.reload(box_dynamics)
        options = options or {}
        controls_count = int(options.get("controlsCount", self.controlsCount))
        joints_count = int(options.get("jointsCount", self.jointsCount))
        boxes_count = int(options.get("ikBoxesCount", self.ikBoxesCount))
        use_dynamic = bool(options.get("useDynamic", self.useDynamic))
        use_box_dynamics = bool(options.get("useBoxDynamics", self.useBoxDynamics))
        if controls_count < 3:
            raise ValueError("Chain Full IKFK needs at least three FK controls")
        if joints_count < 3:
            raise ValueError("Chain Full IKFK needs at least three joints")
        if not 2 <= boxes_count <= controls_count:
            raise ValueError("IK Control Count must be between 2 and FK Controls Count")
        if cmds.objExists(self.name + "_mod"):
            raise ValueError("Module {} already exists".format(self.name))

        # ChainIk builds the original hair-system dynamics when requested.
        build_options = {"controlsCount": controls_count,
                         "jointsCount": joints_count,
                         "useDynamic": use_dynamic}
        original_import = utils.importFile
        utils.importFile = lambda path, module_name="": (
            chainIk_ik_controls._import_template_without_editor_managers(
                path, module_name, original_import))
        try:
            ChainIk.create(self, build_options)
        finally:
            utils.importFile = original_import

        saved_posers = options.get("_restorePosersBeforeIK") or {}
        fk_posers = {key: value for key, value in saved_posers.items()
                     if not key.startswith("MODNAME_ik_")}
        ik_posers = {key: value for key, value in saved_posers.items()
                     if key.startswith("MODNAME_ik_")}
        if fk_posers:
            module.Module.setData(
                self, {"posersAttrsData": fk_posers}, load="posers")
        fk_controls = ["{}_element_{}".format(self.name, index)
                       for index in range(1, controls_count + 1)]
        fk_rest_positions = [cmds.xform(control, query=True, worldSpace=True,
                                        translation=True)
                             for control in fk_controls]

        self.ikBoxesCount = boxes_count
        _create_ik_box_posers(self.name, controls_count, boxes_count)
        cmds.addAttr(self.name + "_mod", longName="ikBoxesCount",
                     attributeType="long", minValue=2,
                     defaultValue=boxes_count)
        cmds.setAttr(self.name + "_mod.ikBoxesCount", boxes_count)
        utils.setUserAttr(self.name + "_mod", "fkWeightProfile", "linear")
        if boxes_count == 3:
            chainIk_ik_controls.add_to_existing(
                self.name, box_color=17, box_scale=0.5,
                master_color=4, align_master_with_fk=True)
        else:
            variable_boxes.add_to_existing(self.name, boxes_count)
        # Maya can drop helper connections when the construction undo chunk
        # closes. The legacy verifier runs before this module removes its
        # rotation-position graph, so repair links without that check here.
        if boxes_count == 3:
            chainIk_ik_controls.repair_full_ikfk(self.name, verify=False)
        else:
            variable_boxes.repair_full_ikfk(self.name)
        _follow_ik_controls_to_posers(self.name, controls_count, boxes_count)
        _blend_middle_follow(self.name, controls_count, boxes_count)
        _remove_rotation_position_graph(self.name, controls_count)
        chainIk_ik_controls._preserve_fk_rest_positions(
            self.name, fk_controls, fk_rest_positions)
        _unify_fk_blend_attributes(self.name, controls_count, boxes_count)
        if ik_posers:
            module.Module.setData(
                self, {"posersAttrsData": ik_posers}, load="posers")
        _follow_end_ik_poser_to_fk_poser(self.name, controls_count)
        if use_box_dynamics:
            box_dynamics.add_to_existing(self.name, controls_count, boxes_count)
            box_dynamics.verify(self.name, controls_count, boxes_count)
        _align_ik_box_translation_axes(self.name, controls_count,
                                       boxes_count)
        chainIk_ik_controls._preserve_fk_rest_positions(
            self.name, fk_controls, fk_rest_positions)
        _follow_fk_translations_to_posers(self.name, controls_count)
        _align_ik_box_rotation_axes(self.name, controls_count, boxes_count)
        _orient_ik_boxes_from_posers(self.name, controls_count, boxes_count)
        _add_end_world_space(self.name, controls_count, boxes_count)
        cmds.addAttr(self.name + "_mod", longName="worldControl",
                     attributeType="message")
        if options.get("worldControl"):
            self.setWorldControl(options["worldControl"])
        _follow_end_pivot_to_fk_poser(self.name, controls_count)
        self.useBoxDynamics = use_box_dynamics
        _hide_box_scale(self.name, controls_count, boxes_count)
        _hide_control_visibility(self.name)
        self.joints = self.getJoints()
        return self

    def connectSignals(self, mainInstance, widget):
        widget.controlsCount_spinBox.valueChanged.connect(
            widget.ikBoxesCount_spinBox.setMaximum)
        widget.ikBoxesCount_spinBox.setMaximum(
            widget.controlsCount_spinBox.value())
        widget.rebuild_btn.clicked.connect(
            partial(self.rebuildWithNewOptions, mainInstance, widget))
        widget.parentIsChain_btn.clicked.connect(self.rerootPosersToChain)
        widget.parentIsMainPoser_btn.clicked.connect(self.rerootPosersToMainPoser)
        widget.setWorldControl_btn.clicked.connect(
            partial(self.setWorldControlFromSelection, widget))

    def updateOptionsPage(self, widget):
        self.getOptions()
        widget.controlsCount_spinBox.setValue(self.controlsCount)
        widget.jointsCount_spinBox.setValue(self.jointsCount)
        widget.ikBoxesCount_spinBox.setMaximum(self.controlsCount)
        widget.ikBoxesCount_spinBox.setValue(self.ikBoxesCount)
        widget.useDynamic_checkBox.setChecked(self.useDynamic)
        widget.useBoxDynamics_checkBox.setChecked(self.useBoxDynamics)
        self.updateWorldControlField(widget)

    def getWorldControl(self):
        plug = self.name + "_mod.worldControl"
        if not cmds.objExists(plug):
            return None
        sources = cmds.listConnections(plug, source=True,
                                       destination=False) or []
        return cmds.ls(sources[0], long=True)[0] if sources else None

    def setWorldControl(self, control=None):
        """Make World follow a selected control relative to its current pose."""
        cube = self.name + "_ik_end"
        fixed_input = cube + "_worldFixed.matrixIn[1]"
        plug = self.name + "_mod.worldControl"
        if not cmds.objExists(fixed_input):
            return
        if not cmds.objExists(plug):
            cmds.addAttr(self.name + "_mod", longName="worldControl",
                         attributeType="message")
        if control:
            matches = cmds.ls(control, long=True) or []
            if len(matches) != 1 or cmds.nodeType(matches[0]) != "transform":
                cmds.warning("World Control must be one transform control")
                return
            control = matches[0]
            if control.split("|")[-1].startswith(self.name + "_"):
                cmds.warning("World Control cannot belong to this neck module")
                return
        if control == self.getWorldControl():
            return

        # Capture the selected control's current frame. At assignment the
        # World target stays at the IK poser; later control motion moves it.
        frame = cube + "_worldControlFrame"
        rest_inverse = (om.MMatrix(cmds.getAttr(control + ".worldInverseMatrix[0]"))
                        if control else None)
        poser_source = cube + "_poser.worldMatrix[0]"
        if cmds.connectionInfo(fixed_input, sourceFromDestination=True) != poser_source:
            cmds.connectAttr(poser_source, fixed_input, force=True)
        if cmds.objExists(frame):
            cmds.delete(frame)
        source = cmds.connectionInfo(plug, sourceFromDestination=True)
        if source:
            cmds.disconnectAttr(source, plug)
        if control:
            frame = cmds.createNode("multMatrix", name=frame)
            chainIk_ik_controls._register(frame, self.name)
            cmds.connectAttr(cube + "_poser.worldMatrix[0]",
                             frame + ".matrixIn[0]")
            cmds.setAttr(frame + ".matrixIn[1]", *list(rest_inverse),
                         type="matrix")
            cmds.connectAttr(control + ".worldMatrix[0]",
                             frame + ".matrixIn[2]")
            cmds.connectAttr(frame + ".matrixSum", fixed_input, force=True)
            cmds.connectAttr(control + ".message", plug)

    def setWorldControlFromSelection(self, widget, *_):
        selection = cmds.ls(selection=True, long=True) or []
        if not selection:
            self.setWorldControl()
        elif len(selection) == 1:
            self.setWorldControl(selection[0])
        else:
            cmds.warning("Select only one control for World Control")
            return
        self.updateWorldControlField(widget)

    def updateWorldControlField(self, widget):
        control = self.getWorldControl()
        widget.worldControl_lineEdit.setText(
            control.split("|")[-1] if control else "")
        widget.worldControl_lineEdit.setToolTip(control or "")

    def setOptions(self, options):
        if "worldControl" in options:
            self.setWorldControl(options["worldControl"])

    def getOptions(self):
        options = ChainIk.getOptions(self)
        # A mirrored chain shares the left hair system; its own hairSystem
        # node is removed by ChainIk.connectOpposite, but its output curve
        # remains the reliable indication that FK dynamics was built.
        system_nodes = cmds.listRelatives(
            self.name + "_system", allDescendents=True,
            type="transform") or []
        self.useDynamic = (cmds.objExists(self.name + "_hairSystem") or
                           cmds.objExists(self.name + "_outCrv") or
                           any(node.endswith("_outCrv")
                               for node in system_nodes))
        options["useDynamic"] = self.useDynamic
        # ChainIk counts every *_poser descendant, including our IK guides.
        fk_pattern = re.compile(re.escape(self.name) + r"_element_\d+_poser$")
        fk_posers = cmds.listRelatives(self.name + "_posers",
                                      allDescendents=True,
                                      type="transform") or []
        self.controlsCount = int(cmds.objExists(self.name + "_root_poser"))
        self.controlsCount += sum(bool(fk_pattern.fullmatch(poser))
                                  for poser in fk_posers)
        options["controlsCount"] = self.controlsCount
        plug = self.name + "_mod.ikBoxesCount"
        self.ikBoxesCount = (int(cmds.getAttr(plug))
                             if cmds.objExists(plug) else 3)
        options["ikBoxesCount"] = self.ikBoxesCount
        self.useBoxDynamics = cmds.objExists(self.name + "_ik_base_particle")
        options["useBoxDynamics"] = self.useBoxDynamics
        options["worldControl"] = self.getWorldControl()
        return options

    def rerootPosersToChain(self):
        """Chain FK posers only; IK box posers remain independent."""
        selection = cmds.ls(selection=True) or []
        names = [self.name]
        if self.symmetrical:
            names.append(utils.getOpposite(self.name))
        for name in names:
            if not cmds.objExists(name + "_mod"):
                continue
            index = 2
            while cmds.objExists("{}_element_{}_poser".format(name, index)):
                poser = "{}_element_{}_poser".format(name, index)
                parent = (name + "_root_poser" if index == 2 else
                          "{}_element_{}_poser".format(name, index - 1))
                if cmds.listRelatives(poser, parent=True)[0] != parent:
                    cmds.parent(poser, parent)
                index += 1
        if selection:
            cmds.select(selection)

    def getData(self):
        # ChainIk.getData uses dynamic super() and would recurse here.
        data = module.Module.getData(self)
        data["optionsData"] = self.getOptions()
        profile = self.name + "_mod.fkWeightProfile"
        data["fkWeightProfile"] = (cmds.getAttr(profile)
                                   if cmds.objExists(profile) else "legacy")
        return data

    def setData(self, data, sym=False, namingForce=False, load="all"):
        self.getOptions()
        old_boxes = int(data.get("optionsData", {}).get("ikBoxesCount", 3))
        original_attrs = data.get("controlsAttrData", {})
        box_kinds = box_dynamics.kinds(self.controlsCount, self.ikBoxesCount)
        attrs_to_load = dict(original_attrs)
        for key, value in original_attrs.items():
            if not key.startswith("element_") or "." not in key:
                continue
            control, attr = key.split(".", 1)
            if (attr in ("ikBaseToMiddle", "ikMiddleToEnd") or
                    (attr.startswith("ikBox") and "To" in attr)):
                attrs_to_load.setdefault(control + ".ikControlBlend", value)
                attrs_to_load.pop(key, None)
        for kind in box_kinds:
            for axis in "XYZ":
                old_target = "ik_{}.targetTranslate{}".format(kind, axis)
                if old_target in original_attrs:
                    attrs_to_load["ik_{}.translate{}".format(kind, axis)] = (
                        original_attrs[old_target])
                attrs_to_load.pop(old_target, None)
        if old_boxes != self.ikBoxesCount:
            attrs_to_load = {
                key: value for key, value in attrs_to_load.items()
                if not (key.startswith("element_") and
                        key.endswith(".ikControlBlend"))}
        if attrs_to_load != original_attrs:
            data = dict(data)
            data["controlsAttrData"] = attrs_to_load
        module.Module.setData(self, data, sym=sym,
                              namingForce=namingForce, load=load)
        _hide_box_scale(self.name, self.controlsCount, self.ikBoxesCount)
        _hide_control_visibility(self.name)
        if load not in ("all", "controlVis"):
            return
        saved_attrs = data.get("controlsAttrData", {})
        old_count = int(data.get("optionsData", {}).get(
            "controlsCount", self.controlsCount))
        if old_count < 3:
            old_count = self.controlsCount
        old_middle = (old_count - 1) // 2
        old_last = old_count - 1
        middle = (self.controlsCount - 1) // 2
        last = self.controlsCount - 1
        for control in utils.getSetObjects(self.name + "_moduleControlSet"):
            internal = utils.getInternalNameFromControl(control)
            if internal.startswith("ik_middle"):
                attrs = ("followEndTranslate",)
            elif internal == "ik_end":
                attrs = ("world",)
            elif internal == "ik_base":
                attrs = ()
            elif internal.startswith("element_"):
                attrs = ("ikControlBlend",)
            elif internal == "control" and (self.useDynamic or self.useBoxDynamics):
                attrs = (("______________", "dynamic", "startFrame",
                          "dynamicWeight", "stiffness", "damp")
                         if self.useDynamic else ("startFrame",))
            else:
                continue
            if (self.useBoxDynamics and internal.startswith("ik_")
                    and internal[3:] in box_kinds):
                attrs += ("dynamicWeight", "goalWeight", "conserve",
                          "translateX", "translateY", "translateZ")
            for attr in attrs:
                plug = control + "." + attr
                if cmds.objExists(plug) and internal + "." + attr not in saved_attrs:
                    cmds.setAttr(plug, lock=False, keyable=True)
            if not internal.startswith("element_") or self.ikBoxesCount != 3:
                continue
            index_text = internal.rsplit("_", 1)[1]
            if not index_text.isdigit():
                continue
            index = int(index_text) - 1
            if index > last or index > old_last:
                continue
            _, _, attr, linear = chainIk_ik_controls._blend_pair(
                index, middle, last)
            key = internal + ".ikControlBlend"
            if key not in saved_attrs:
                continue
            if index <= old_middle and attr == "ikBaseToMiddle":
                distance = float(index) / old_middle
                previous = 2 * distance - distance ** 2
            elif index > old_middle and attr == "ikMiddleToEnd":
                distance = float(index - old_middle) / (old_last - old_middle)
                previous = distance ** 2
            else:
                continue
            if (data.get("fkWeightProfile") != "linear"
                    and abs(float(saved_attrs[key]) - previous) < 1e-6):
                cmds.setAttr(control + "." + attr, linear)
    def rebuildWithNewOptions(self, mainInstance, widget):
        controls_count = widget.controlsCount_spinBox.value()
        joints_count = widget.jointsCount_spinBox.value()
        boxes_count = widget.ikBoxesCount_spinBox.value()
        use_dynamic = widget.useDynamic_checkBox.isChecked()
        use_box_dynamics = widget.useBoxDynamics_checkBox.isChecked()
        options = {"controlsCount": controls_count,
                   "jointsCount": joints_count,
                   "ikBoxesCount": boxes_count,
                   "useDynamic": use_dynamic,
                   "useBoxDynamics": use_box_dynamics,
                   "worldControl": self.getWorldControl()}

        joints = cmds.sets(self.name + "_skinJointsSet", query=True) or []
        ids = [int(j.split("_")[-2]) for j in joints
               if j.split("_")[-2].isdigit()]
        new_target = None
        if ids and joints_count <= max(ids):
            new_target = "{}_{}_outJoint".format(self.name, joints_count - 1)
        mainInstance.rebuildModule(options, new_target=new_target)

    def addSkinJoints(self):
        # Preserve ChainIk's joint connections without its subclass-unsafe super().
        module.Module.addSkinJoints(self)
        root_joint = self.name + "_root_skinJoint"
        for index in range(1, self.jointsCount):
            skin_joint = "{}_{}_skinJoint".format(self.name, index)
            out_joint = "{}_{}_outJoint".format(self.name, index)
            cmds.connectAttr(skin_joint + ".offset", out_joint + ".offset")

        # The inherited scalar T/R/S links lose the parent's scale on child
        # skin joints, especially when the master has nonuniform scale. Drive
        # each skin joint by its output joint's full world matrix instead.
        joint_pairs = [(self.name + "_root_outJoint", root_joint)]
        joint_pairs.extend(("{}_{}_outJoint".format(self.name, index),
                            "{}_{}_skinJoint".format(self.name, index))
                           for index in range(1, self.jointsCount))
        for out_joint, skin_joint in joint_pairs:
            for channel in ("translate", "rotate", "scale", "shear"):
                parent_plug = skin_joint + "." + channel
                suffixes = (("X", "Y", "Z") if channel != "shear"
                            else ("XY", "XZ", "YZ"))
                # A child may report its parent's compound connection. Maya
                # requires disconnectAttr to receive that exact parent plug.
                for plug in [parent_plug] + [parent_plug + suffix
                                               for suffix in suffixes]:
                    exact = cmds.connectionInfo(plug,
                                                getExactDestination=True)
                    if exact:
                        source = cmds.connectionInfo(
                            exact, sourceFromDestination=True)
                        cmds.disconnectAttr(source, exact)
            cmds.setAttr(skin_joint + ".translate", 0, 0, 0, type="double3")
            cmds.setAttr(skin_joint + ".rotate", 0, 0, 0, type="double3")
            cmds.setAttr(skin_joint + ".scale", 1, 1, 1, type="double3")
            cmds.setAttr(skin_joint + ".shear", 0, 0, 0, type="double3")
            cmds.setAttr(skin_joint + ".segmentScaleCompensate", 0)
            parent = cmds.listRelatives(skin_joint, parent=True)[0]
            matrix = cmds.createNode("multMatrix",
                                     name=skin_joint + "_fullIKFKMatrix")
            utils.addModuleNameAttr(matrix, self.name)
            utils.addToModuleSet(matrix, self.name)
            cmds.connectAttr(out_joint + ".worldMatrix[0]",
                             matrix + ".matrixIn[0]")
            cmds.connectAttr(parent + ".worldInverseMatrix[0]",
                             matrix + ".matrixIn[1]")
            cmds.connectAttr(matrix + ".matrixSum",
                             skin_joint + ".offsetParentMatrix")
        for joint in cmds.listRelatives(root_joint, allDescendents=True) or []:
            cmds.sets(joint, edit=True, forceElement=self.name + "_nodesSet")
            cmds.setAttr(joint + ".drawStyle", 0)
        cmds.setAttr(root_joint + ".drawStyle", 0)
        cmds.sets(root_joint, edit=True, forceElement=self.name + "_nodesSet")

    def _refresh_root_skin_parent(self, module_name=None):
        root_joint = (module_name or self.name) + "_root_skinJoint"
        matrix_input = root_joint + "_fullIKFKMatrix.matrixIn[1]"
        if not cmds.objExists(matrix_input):
            return
        parent = cmds.listRelatives(root_joint, parent=True)[0]
        source = parent + ".worldInverseMatrix[0]"
        if cmds.connectionInfo(matrix_input, sourceFromDestination=True) != source:
            cmds.connectAttr(source, matrix_input, force=True)
        # Module.connect reparents the root skin joint while preserving its
        # former world pose. Those local channels would add a second offset
        # on top of the full matrix driving offsetParentMatrix.
        cmds.setAttr(root_joint + ".translate", 0, 0, 0, type="double3")
        cmds.setAttr(root_joint + ".rotate", 0, 0, 0, type="double3")
        cmds.setAttr(root_joint + ".scale", 1, 1, 1, type="double3")
        cmds.setAttr(root_joint + ".shear", 0, 0, 0, type="double3")

    def _follow_connected_parent(self, connected):
        """Move the master with the parent while particles keep their rest frames."""
        driver = (self.name + "_root_connector.worldMatrix[0]" if connected
                  else self.name + "_root_poser.worldMatrix[0]")
        master_input = (self.name +
                        "_ik_master_group_poserFollow.matrixIn[1]")
        if cmds.objExists(master_input):
            cmds.connectAttr(driver, master_input, force=True)

    def connect(self, target, opposite=False, makeSeamless=False):
        module.Module.connect(self, target, opposite=opposite,
                              makeSeamless=makeSeamless)
        self._follow_connected_parent(True)
        self._refresh_root_skin_parent()

    def disconnect(self):
        if self.parent:
            self._follow_connected_parent(False)
        module.Module.disconnect(self)
        self._refresh_root_skin_parent()

    def makeSeamless(self, state):
        module.Module.makeSeamless(self, state)
        self._refresh_root_skin_parent()
        if self.symmetrical:
            self._refresh_root_skin_parent(utils.getOpposite(self.name))
        if self.parent:
            parent_name = utils.getModuleName(self.parent)
            parent_module = self.main.rig.modules.get(parent_name)
            if (parent_module and parent_module.type == "chainFullIKFK"
                    and hasattr(parent_module, "_refresh_root_skin_parent")):
                parent_module._refresh_root_skin_parent()
                if parent_module.symmetrical:
                    parent_module._refresh_root_skin_parent(
                        utils.getOpposite(parent_name))

    def bake(self):
        module.Module.bake(
            self, forceDelete=[self.name + "_initCurve_curveInfo"])

    def delete(self):
        curve_info = self.name + "_initCurve_curveInfo"
        if cmds.objExists(curve_info):
            cmds.delete(curve_info)
        module.Module.delete(self)
