"""Rig Studio module: an FK chain with configurable IK boxes and a master."""

import importlib
from functools import partial

import maya.cmds as cmds

from ... import module, utils
from ..chainIk.chainIk import ChainIk
from ..chainIk import chainIk_ik_controls
from . import variable_boxes


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
        self.localControls = True
        self.useDynamic = False

    def create(self, options=None):
        # Rig Studio may keep this module open while its helper is edited.
        # Rebuild must use the helper currently on disk in the same Maya session.
        importlib.reload(chainIk_ik_controls)
        importlib.reload(variable_boxes)
        options = options or {}
        controls_count = int(options.get("controlsCount", self.controlsCount))
        joints_count = int(options.get("jointsCount", self.jointsCount))
        boxes_count = int(options.get("ikBoxesCount", self.ikBoxesCount))
        if controls_count < 4:
            raise ValueError("Chain Full IKFK needs at least four FK controls")
        if joints_count < 3:
            raise ValueError("Chain Full IKFK needs at least three joints")
        if not 3 <= boxes_count <= controls_count:
            raise ValueError("IK Boxes Count must be between 3 and Controls Count")
        if cmds.objExists(self.name + "_mod"):
            raise ValueError("Module {} already exists".format(self.name))

        # The tested chain uses its procedural curve and no hair dynamics.
        build_options = {"controlsCount": controls_count,
                         "jointsCount": joints_count,
                         "useDynamic": False}
        original_import = utils.importFile
        utils.importFile = lambda path, module_name="": (
            chainIk_ik_controls._import_template_without_editor_managers(
                path, module_name, original_import))
        try:
            ChainIk.create(self, build_options)
        finally:
            utils.importFile = original_import

        self.ikBoxesCount = boxes_count
        cmds.addAttr(self.name + "_mod", longName="ikBoxesCount",
                     attributeType="long", minValue=3,
                     defaultValue=boxes_count)
        cmds.setAttr(self.name + "_mod.ikBoxesCount", boxes_count)
        utils.setUserAttr(self.name + "_mod", "fkWeightProfile", "linear")
        if boxes_count == 3:
            chainIk_ik_controls.add_to_existing(
                self.name, box_color=17, box_scale=0.5,
                master_color=4, align_master_with_fk=True)
        else:
            variable_boxes.add_to_existing(self.name, boxes_count)
        # Maya can drop helper connections while the construction undo chunk
        # closes. Reconnect and test the actual FK response after that chunk.
        if boxes_count == 3:
            chainIk_ik_controls.repair_full_ikfk(self.name)
        else:
            variable_boxes.repair_full_ikfk(self.name)
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

    def updateOptionsPage(self, widget):
        self.getOptions()
        widget.controlsCount_spinBox.setValue(self.controlsCount)
        widget.jointsCount_spinBox.setValue(self.jointsCount)
        widget.ikBoxesCount_spinBox.setMaximum(self.controlsCount)
        widget.ikBoxesCount_spinBox.setValue(self.ikBoxesCount)

    def getOptions(self):
        options = ChainIk.getOptions(self)
        plug = self.name + "_mod.ikBoxesCount"
        self.ikBoxesCount = (int(cmds.getAttr(plug))
                             if cmds.objExists(plug) else 3)
        options["ikBoxesCount"] = self.ikBoxesCount
        return options

    def getData(self):
        # ChainIk.getData uses dynamic super() and would recurse here.
        data = module.Module.getData(self)
        data["optionsData"] = self.getOptions()
        profile = self.name + "_mod.fkWeightProfile"
        data["fkWeightProfile"] = (cmds.getAttr(profile)
                                   if cmds.objExists(profile) else "legacy")
        return data

    def setData(self, data, sym=False, namingForce=False, load="all"):
        count_plug = self.name + "_mod.ikBoxesCount"
        if cmds.objExists(count_plug):
            self.ikBoxesCount = int(cmds.getAttr(count_plug))
        old_boxes = int(data.get("optionsData", {}).get("ikBoxesCount", 3))
        if old_boxes != self.ikBoxesCount:
            data = dict(data)
            data["controlsAttrData"] = {
                key: value for key, value in
                data.get("controlsAttrData", {}).items()
                if not (key.startswith("element_") and
                        (".ikBox" in key or ".ikBaseToMiddle" in key or
                         ".ikMiddleToEnd" in key))}
        module.Module.setData(self, data, sym=sym,
                              namingForce=namingForce, load=load)
        if load not in ("all", "controlVis"):
            return
        saved_attrs = data.get("controlsAttrData", {})
        old_count = int(data.get("optionsData", {}).get(
            "controlsCount", self.controlsCount))
        if old_count < 4:
            old_count = self.controlsCount
        old_middle = (old_count - 1) // 2
        old_last = old_count - 1
        middle = (self.controlsCount - 1) // 2
        last = self.controlsCount - 1
        for control in utils.getSetObjects(self.name + "_moduleControlSet"):
            internal = utils.getInternalNameFromControl(control)
            if internal.startswith("ik_middle"):
                attrs = ("followEndTranslate",)
            elif internal in ("ik_base", "ik_end"):
                attrs = ("rotationAffectsPosition",)
            elif internal.startswith("element_"):
                attrs = (("ikBaseToMiddle", "ikMiddleToEnd")
                         if self.ikBoxesCount == 3 else
                         tuple("ikBox{}To{}".format(index, index + 1)
                               for index in range(1, self.ikBoxesCount)))
            else:
                continue
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
            key = internal + "." + attr
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
        options = {"controlsCount": controls_count,
                   "jointsCount": joints_count,
                   "ikBoxesCount": boxes_count,
                   "useDynamic": False}

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
                for suffix in (("X", "Y", "Z") if channel != "shear"
                               else ("XY", "XZ", "YZ")):
                    destination = skin_joint + "." + channel + suffix
                    source = cmds.connectionInfo(destination,
                                                 sourceFromDestination=True)
                    if source:
                        cmds.disconnectAttr(source, destination)
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

    def connect(self, target, opposite=False, makeSeamless=False):
        module.Module.connect(self, target, opposite=opposite,
                              makeSeamless=makeSeamless)
        self._refresh_root_skin_parent()

    def disconnect(self):
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
