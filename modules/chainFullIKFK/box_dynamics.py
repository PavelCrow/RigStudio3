"""Optional classic-particle goal dynamics for Chain Full IKFK box translation.

Each box has a hidden goal under its original parent group. Its editable
translation moves the goal, while one particle trails that goal. The particle
offset is applied to a separate parent transform, leaving the box's own
translation and rotation free for animation.
"""

import maya.cmds as cmds
import maya.api.OpenMaya as om

from ..chainIk import chainIk_ik_controls as legacy
from . import variable_boxes


def kinds(controls_count, boxes_count):
    if boxes_count == 3:
        return ("base", "middle", "end")
    return tuple(kind for kind, _ in
                 variable_boxes.layout(controls_count, boxes_count))


def add_to_existing(name, controls_count, boxes_count):
    """Add one goal-driven particle to each box without changing FK links."""
    master = name + "_ik_master"
    if not cmds.objExists(master):
        raise ValueError("IK master for {} was not found".format(name))
    dynamic_control = name + "_control"
    if not cmds.objExists(dynamic_control):
        raise ValueError("Dynamics control for {} was not found".format(name))
    if not cmds.objExists(dynamic_control + ".startFrame"):
        cmds.addAttr(dynamic_control, longName="startFrame",
                     niceName="Start Frame", attributeType="short",
                     defaultValue=1, keyable=True)
    system = name + "_system"
    built = []
    for kind in kinds(controls_count, boxes_count):
        cube = name + "_ik_" + kind
        group = cube + "_group"
        if not cmds.objExists(cube) or not cmds.objExists(group):
            raise ValueError("IK box {} was not found".format(cube))
        if cmds.objExists(cube + "_particle"):
            raise ValueError("IK box dynamics already exist for {}".format(cube))
        poser = cube + "_poser"
        if not cmds.objExists(poser):
            raise ValueError("IK poser {} was not found".format(poser))

        # Every particle lives in its box poser's rest frame. The master
        # follows the parent connector, so parent and master animation both
        # move the goals away from this frame and can produce dynamic lag.
        space = cmds.createNode("transform", name=cube + "_particleSpace",
                                parent=system)
        space_matrix = cmds.createNode("multMatrix",
                                        name=space + "_multMat")
        space_decompose = cmds.createNode("decomposeMatrix",
                                           name=space + "_decomposeMatrix")
        cmds.connectAttr(poser + ".worldMatrix[0]",
                         space_matrix + ".matrixIn[0]")
        cmds.connectAttr(system + ".worldInverseMatrix[0]",
                         space_matrix + ".matrixIn[1]")
        # Classic particle worldCentroid ignores an ancestor's
        # offsetParentMatrix. Ordinary transform channels work correctly.
        cmds.connectAttr(space_matrix + ".matrixSum",
                         space_decompose + ".inputMatrix")
        for source, destination in (("outputTranslate", "translate"),
                                    ("outputRotate", "rotate"),
                                    ("outputScale", "scale")):
            cmds.connectAttr(space_decompose + "." + source,
                             space + "." + destination)
        for node in (space, space_matrix, space_decompose):
            legacy._register(node, name)

        # The box remains an ordinary animator control. Only its new parent
        # receives the simulated displacement from the goal position.
        cmds.addAttr(cube, longName="dynamicWeight",
                     niceName="Dynamic Weight", attributeType="double",
                     minValue=0, maxValue=1, defaultValue=0, keyable=True)
        cmds.addAttr(cube, longName="goalWeight", niceName="Goal Strength",
                     attributeType="double", minValue=0, maxValue=1,
                     defaultValue=0.5, keyable=True)
        cmds.addAttr(cube, longName="conserve", niceName="Dynamic Conserve",
                     attributeType="double", minValue=0, maxValue=1,
                     defaultValue=0.8, keyable=True)

        offset = cmds.createNode("transform",
                                 name=cube + "_particleOffset", parent=group)
        cmds.parent(cube, offset, relative=True)
        legacy._register(offset, name)

        goal = cmds.spaceLocator(name=cube + "_goal")[0]
        cmds.parent(goal, group, relative=True)
        cmds.setAttr(goal + ".visibility", 0)
        legacy._register(goal, name)
        for shape in cmds.listRelatives(goal, shapes=True) or []:
            legacy._register(shape, name)
        cmds.connectAttr(cube + ".translate", goal + ".translate")

        position = cmds.xform(goal, query=True, worldSpace=True,
                              translation=True)
        space_inverse = om.MMatrix(cmds.getAttr(
            space + ".worldInverseMatrix[0]"))
        local_position = om.MPoint(*position) * space_inverse
        particle, shape = cmds.particle(position=[(
            local_position.x, local_position.y, local_position.z)],
                                        name=cube + "_particle")
        cmds.parent(particle, space, relative=True)
        cmds.goal(particle, goal=goal, weight=0.5,
                  useTransformAsGoal=True)
        cmds.setAttr(particle + ".visibility", 0)
        legacy._register(particle, name)
        legacy._register(shape, name)
        cmds.connectAttr(cube + ".goalWeight", shape + ".goalWeight[0]",
                         force=True)
        cmds.connectAttr(cube + ".conserve", shape + ".conserve",
                         force=True)
        cmds.connectAttr(dynamic_control + ".startFrame",
                         shape + ".startFrame", force=True)

        # A saved particle position belongs to the module's build location.
        # Reset it to the live goal when Maya initializes the start frame, so
        # moving the character before playback does not pull boxes back there.
        start_matrix = cmds.createNode("multMatrix",
                                       name=cube + "_particleStart_multMat")
        start_parts = cmds.createNode(
            "decomposeMatrix", name=cube + "_particleStart_decomposeMatrix")
        legacy._register(start_matrix, name)
        legacy._register(start_parts, name)
        cmds.connectAttr(goal + ".worldMatrix[0]",
                         start_matrix + ".matrixIn[0]")
        cmds.connectAttr(space + ".worldInverseMatrix[0]",
                         start_matrix + ".matrixIn[1]")
        cmds.connectAttr(start_matrix + ".matrixSum",
                         start_parts + ".inputMatrix")
        start_position = ", ".join(start_parts + ".outputTranslate" + axis
                                   for axis in "XYZ")
        cmds.dynExpression(shape,
                           string=shape + ".position = <<" +
                           start_position + ">>;",
                           creation=True)
        cmds.saveInitialState(particle)

        local = cmds.createNode("pointMatrixMult",
                                name=cube + "_particleToLocal")
        to_group = cmds.createNode("multMatrix",
                                   name=cube + "_particleToGroup_multMat")
        delta = cmds.createNode("plusMinusAverage",
                                name=cube + "_particleDelta")
        blend = cmds.createNode("blendColors", name=cube + "_particleBlend")
        start_gate = cmds.createNode("condition",
                                     name=cube + "_particleStartGate")
        # Maya's default color2 is blue; zero weight must mean no displacement.
        cmds.setAttr(blend + ".color2", 0, 0, 0, type="double3")
        # Keep the box at its goal through Start Frame, even if the animator
        # moves the character while that frame is already displayed.
        cmds.setAttr(start_gate + ".operation", 5)  # Less or Equal
        cmds.connectAttr("time1.outTime", start_gate + ".firstTerm")
        cmds.connectAttr(dynamic_control + ".startFrame",
                         start_gate + ".secondTerm")
        cmds.connectAttr(cube + ".dynamicWeight",
                         start_gate + ".colorIfFalseR")
        legacy._register(local, name)
        legacy._register(to_group, name)
        legacy._register(delta, name)
        legacy._register(blend, name)
        legacy._register(start_gate, name)
        for axis in "XYZ":
            cmds.connectAttr(shape + ".centroid" + axis,
                             local + ".inPoint" + axis)
        cmds.connectAttr(space + ".worldMatrix[0]",
                         to_group + ".matrixIn[0]")
        cmds.connectAttr(group + ".worldInverseMatrix[0]",
                         to_group + ".matrixIn[1]")
        cmds.connectAttr(to_group + ".matrixSum", local + ".inMatrix")
        cmds.setAttr(delta + ".operation", 2)
        cmds.connectAttr(local + ".output", delta + ".input3D[0]")
        cmds.connectAttr(goal + ".translate", delta + ".input3D[1]")
        cmds.connectAttr(delta + ".output3D", blend + ".color1")
        cmds.connectAttr(start_gate + ".outColorR", blend + ".blender")
        for axis, color_axis in zip("XYZ", "RGB"):
            cmds.connectAttr(blend + ".output" + color_axis,
                             offset + ".translate" + axis)

        # The pre-existing FK guides read cube.translate directly. Give them
        # the combined manual + simulated translation, while the particle
        # goal keeps reading only the animator's manual translation.
        effective = cmds.createNode("plusMinusAverage",
                                    name=cube + "_effectiveTranslate")
        legacy._register(effective, name)
        destinations = cmds.listConnections(
            cube + ".translate", source=False, destination=True,
            plugs=True) or []
        for destination in set(destinations):
            if destination.startswith(goal + ".translate"):
                continue
            source = legacy._source_of(destination)
            if source == cube + ".translate":
                replacement = effective + ".output3D"
            elif source in tuple(cube + ".translate" + axis for axis in "XYZ"):
                replacement = effective + ".output3D" + source[-1].lower()
            else:
                continue
            cmds.connectAttr(replacement, destination, force=True)
        cmds.connectAttr(cube + ".translate", effective + ".input3D[0]")
        cmds.connectAttr(offset + ".translate", effective + ".input3D[1]")
        built.append(cube)
    return built


def verify(name, controls_count, boxes_count):
    """Check that box translations stay editable and offsets are driven."""
    for kind in kinds(controls_count, boxes_count):
        cube = name + "_ik_" + kind
        particle = cube + "_particle"
        space = cube + "_particleSpace"
        if (not cmds.objExists(space) or
                legacy._source_of(space + ".translate") !=
                space + "_decomposeMatrix.outputTranslate"):
            raise RuntimeError("IK particle space is not driven by its poser")
        if not cmds.objExists(particle):
            raise RuntimeError("Missing particle for {}".format(cube))
        if cmds.listRelatives(particle, parent=True) != [space]:
            raise RuntimeError("{} is outside the IK particle space".format(particle))
        shape = cmds.listRelatives(particle, shapes=True)[0]
        start_source = legacy._source_of(shape + ".startFrame")
        expected_start = name + "_control.startFrame"
        if start_source != expected_start:
            raise RuntimeError("{} is driven by {}, expected {}".format(
                shape + ".startFrame", start_source, expected_start))
        start_parts = cube + "_particleStart_decomposeMatrix"
        creation = cmds.dynExpression(shape, query=True, creation=True) or ""
        if start_parts + ".outputTranslateX" not in creation:
            raise RuntimeError("{} does not reset at Start Frame".format(
                particle))
        expected_gate = cube + "_particleStartGate.outColorR"
        if legacy._source_of(cube + "_particleBlend.blender") != expected_gate:
            raise RuntimeError("{} has no Start Frame gate".format(cube))
        if not cmds.isConnected(cube + ".translate",
                                cube + "_goal.translate"):
            raise RuntimeError("{} does not drive its particle goal".format(cube))
        effective = cube + "_effectiveTranslate"
        if not cmds.listConnections(effective + ".output3D",
                                    source=False, destination=True):
            raise RuntimeError("{} does not drive FK guides".format(effective))
        for axis, color_axis in zip("XYZ", "RGB"):
            cube_translate = cube + ".translate" + axis
            if legacy._source_of(cube_translate):
                raise RuntimeError("{} must stay editable".format(cube_translate))
            destination = cube + "_particleOffset.translate" + axis
            source = legacy._source_of(destination)
            expected = cube + "_particleBlend.output" + color_axis
            if source != expected:
                raise RuntimeError("{} is driven by {}, expected {}".format(
                    destination, source, expected))
    return True
