"""Optional classic-particle goal dynamics for Chain Full IKFK box translation.

Each box has a hidden goal under its original parent group. Its editable
translation moves the goal, while one particle trails that goal. The particle
offset is applied to a separate parent transform, leaving the box's own
translation and rotation free for animation.
"""

import maya.cmds as cmds

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
    built = []
    for kind in kinds(controls_count, boxes_count):
        cube = name + "_ik_" + kind
        group = cube + "_group"
        if not cmds.objExists(cube) or not cmds.objExists(group):
            raise ValueError("IK box {} was not found".format(cube))
        if cmds.objExists(cube + "_particle"):
            raise ValueError("IK box dynamics already exist for {}".format(cube))

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
        particle, shape = cmds.particle(position=[position],
                                        name=cube + "_particle")
        cmds.parent(particle, name + "_system", absolute=True)
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
        cmds.saveInitialState(particle)

        local = cmds.createNode("pointMatrixMult",
                                name=cube + "_particleToLocal")
        delta = cmds.createNode("plusMinusAverage",
                                name=cube + "_particleDelta")
        blend = cmds.createNode("blendColors", name=cube + "_particleBlend")
        legacy._register(local, name)
        legacy._register(delta, name)
        legacy._register(blend, name)
        for axis in "XYZ":
            cmds.connectAttr(shape + ".worldCentroid" + axis,
                             local + ".inPoint" + axis)
        cmds.connectAttr(group + ".worldInverseMatrix[0]",
                         local + ".inMatrix")
        cmds.setAttr(delta + ".operation", 2)
        cmds.connectAttr(local + ".output", delta + ".input3D[0]")
        cmds.connectAttr(goal + ".translate", delta + ".input3D[1]")
        cmds.connectAttr(delta + ".output3D", blend + ".color1")
        cmds.connectAttr(cube + ".dynamicWeight", blend + ".blender")
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
        if not cmds.objExists(particle):
            raise RuntimeError("Missing particle for {}".format(cube))
        shape = cmds.listRelatives(particle, shapes=True)[0]
        start_source = legacy._source_of(shape + ".startFrame")
        expected_start = name + "_control.startFrame"
        if start_source != expected_start:
            raise RuntimeError("{} is driven by {}, expected {}".format(
                shape + ".startFrame", start_source, expected_start))
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
