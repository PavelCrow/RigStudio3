import maya.cmds as cmds
import pymel.core as pm
from functools import partial

from ... import utils, module


class SkirtML(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False

		self.skirt = None
		self.skirtShape = None
		self.body = None
		self.bodyShape = None
		self.setupDone = False
		self.cloth = self.name + "_cloth"
		self.lecCtrlL = None
		self.lecCtrlR = None

	def connectSignals(self, mainInstance, w):
		self.mainInstance = mainInstance
		self.widget = w
		w.setGeometry_btn.clicked.connect(self.setGeometry)
		w.setLowGeometry_btn.clicked.connect(self.setLowGeometry)
		w.setBodyGeometry_btn.clicked.connect(self.setBodyGeometry)
		w.setLeftHipControl_btn.clicked.connect(self.setLeftHipControlControl)
		w.setRightHipControl_btn.clicked.connect(self.setRightHipControlControl)
		w.setLeftHipJoint_btn.clicked.connect(self.setLeftHipJoint)
		w.setRightHipJoint_btn.clicked.connect(self.setRightHipJoint)
		w.setup_btn.clicked.connect(self.setup)
		w.detach_btn.clicked.connect(self.detach)
		w.paintStaticMask_btn.clicked.connect(self.paintStaticMask)
		w.toggleCloth_btn.clicked.connect(self.toggleCloth)
		w.cache_btn.clicked.connect(self.cache)
		w.deleteCache_btn.clicked.connect(self.deleteCache)
		w.addDeformer_btn.clicked.connect(self.addDeformer)

	def setGeometry(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select skirt geometry")
			return
		
		tp = cmds.objectType(sel[0])
		
		if len(sel) != 1  :
			cmds.warning("Select one polygon object")
			return
		
		self.widget.geometry_lineEdit.setText(sel[0])

		skirt_s = cmds.listRelatives(sel[0], s=1)

	def setLowGeometry(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select lowpoly skirt geometry")
			return
		
		if len(sel) != 1  :
			cmds.warning("Select one polygon object")
			return
				
		skirt = sel[0]
		self.skirt = skirt
		if cmds.objectType(skirt) == "mesh":
			self.skirtShape = skirt
		elif cmds.objectType(skirt) == "transform":
			shapes = cmds.listRelatives(skirt, s=1, ni=1)
			if len(shapes) > 1:
				cmds.warning("Shapes of the skirt more then one")
				return
			self.skirtShape = cmds.listRelatives(skirt, s=1, ni=1)[0]
		
		if cmds.objectType(self.skirtShape) != "mesh":
			cmds.warning("Cannot find the shape")
			return
		

		
		self.skirt = cmds.listRelatives(self.skirtShape, p=1)[0]
		self.widget.lowGeometry_lineEdit.setText(self.skirt)
		self.widget.lowGeometry_lineEdit.setEnabled(True)

		self.setupDone = True

	def setBodyGeometry(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select body geometry")
			return
		
		if len(sel) != 1  :
			cmds.warning("Select one polygon object")
			return
			
		body = sel[0]
		
		if cmds.objectType(body) == "mesh":
			self.body = cmds.listRelatives(body, p=1)[0]
			self.bodyShape = body
		elif cmds.objectType(body) == "transform":
			shapes = cmds.listRelatives(body, s=1, ni=1)
			if len(shapes) > 1:
				cmds.warning("Shapes of the body more then one, select the needed shape")
				return
			self.body = body
			self.bodyShape = shapes[0]
		else:
			cmds.warning("Select polygon object")
			return

		self.widget.bodyGeometry_lineEdit.setText(self.body)
		self.widget.bodyGeometry_lineEdit.setEnabled(True)

	def setLeftHipControlControl(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select left hip fk control")
			return

		if len(sel) != 1:
			cmds.warning("Select only one control")
			return
		
		self.widget.leftHipControl_lineEdit.setText(sel[0])

		self.lecCtrlL = sel[0]

	def setRightHipControlControl(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select right hip fk control")
			return

		if len(sel) != 1:
			cmds.warning("Select only one control")
			return
		
		self.widget.rightHipControl_lineEdit.setText(sel[0])

		self.lecCtrlR = sel[0]

	def setLeftHipJoint(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select left leg joint")
			return

		if len(sel) != 1:
			cmds.warning("Select only one joint")
			return
		
		self.widget.leftHipJoint_lineEdit.setText(sel[0])

	def setLeftHipJoint(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select left hip joint")
			return

		if len(sel) != 1:
			cmds.warning("Select only one joint")
			return
		
		self.widget.leftHipJoint_lineEdit.setText(sel[0])

	def setRightHipJoint(self):
		sel = cmds.ls(sl=1)

		if not sel:
			cmds.warning("Select right hip joint")
			return

		if len(sel) != 1:
			cmds.warning("Select only one joint")
			return
		
		self.widget.rightHipJoint_lineEdit.setText(sel[0])

	def setup(self):
		if not self.skirtShape or not cmds.objExists(self.skirtShape):
			cmds.warning("Missed low geometry")
			return
		
		if not self.body:
			cmds.warning("Missed body geometry")
			return
		
		if not self.lecCtrlL or not self.lecCtrlR:
			cmds.warning("Missed legs controls")
			return

		self.detach()
		
		skirt = cmds.listRelatives(self.skirtShape, p=1)[0]
		skirt_cloth = cmds.duplicate(skirt, n=self.name+"_cloth_mesh")[0]
		cmds.connectAttr(self.skirtShape+".outMesh", self.name+"_nClothShape.inputMesh", f=1)
		cmds.connectAttr(self.name+"_clothShape.outMesh", skirt_cloth+".inMesh")
		cmds.hide(skirt, skirt_cloth)
		cmds.showHidden(self.cloth, self.name+"_system", self.name+"_poly_geo")

		cmds.connectAttr(self.bodyShape+".outMesh", self.name+"_nRigidShape.inputMesh", f=1)

		con = cmds.pointConstraint(self.lecCtrlL, self.name+"_l_twist_loc", mo=0)
		cmds.delete(con)
		con = cmds.pointConstraint(self.lecCtrlR, self.name+"_r_twist_loc", mo=0)
		cmds.delete(con)
		cmds.aimConstraint(self.name+"_l_aim", self.lecCtrlL, mo=1, worldUpType="none")
		cmds.aimConstraint(self.name+"_r_aim", self.lecCtrlR, mo=1, worldUpType="none")

		cmds.playbackOptions(min=0, max=4800)
		cmds.select(self.cloth)

	def detach(self):
		if not self.skirtShape or not cmds.objExists(self.skirtShape):
			cmds.warning("Missed low geometry")
			return

		cloth_shape = pm.PyNode(self.name+"_clothShape")
		out_shapes = cloth_shape.outMesh.outputs()
		skirt = cmds.listRelatives(self.skirtShape, p=1)[0]
		cmds.showHidden(skirt)
		cmds.hide(self.name+"_system")
		
		if out_shapes:
			cmds.connectAttr(self.name+"_init_mesh.outMesh", self.name+"_nClothShape.inputMesh", f=1)
			cmds.connectAttr(self.name+"_colliderShape.outMesh", self.name+"_nRigidShape.inputMesh", f=1)
			pm.delete(out_shapes)

			l_c = utils.getInputNode(self.lecCtrlL, "rx")
			cmds.delete(l_c)
			r_c = utils.getInputNode(self.lecCtrlR, "rx")
			cmds.delete(r_c)

	def paintStaticMask(self):
		cmds.select(self.name+"_cloth")

		pm.mel.eval('setNClothMapType("inputAttract","",1); artAttrNClothToolScript 3 inputAttract;')

	def getOptions(self):
		nCloth = pm.PyNode(self.name+"_nClothShape")
		coll = pm.PyNode(self.name+"_nRigidShape")
		input = nCloth.inputMesh.inputs()[0]
		if input.name() == self.name+"_init_mesh":
			return
		else:
			self.skirt = nCloth.inputMesh.inputs()[0].name()
			self.skirtShape = cmds.listRelatives(self.skirt, s=1)[0]
			self.setupDone = True

			self.body = coll.inputMesh.inputs()[0].name()
			self.bodyShape = cmds.listRelatives(self.body, s=1, ni=1)[0]

			con = utils.getOutputNode(self.name+"_l_aim", "t")
			self.lecCtrlL = utils.getOutputNode(con, "constraintRotateX")
			con = utils.getOutputNode(self.name+"_r_aim", "t")
			self.lecCtrlR = utils.getOutputNode(con, "constraintRotateX")
	

	def updateOptionsPage(self, w):
		self.getOptions()
	
		self.widget.lowGeometry_lineEdit.setText(self.skirt)
		self.widget.lowGeometry_lineEdit.setEnabled(self.setupDone)
		self.widget.bodyGeometry_lineEdit.setText(self.body)
		self.widget.leftHipControl_lineEdit.setText(self.lecCtrlL)
		self.widget.rightHipControl_lineEdit.setText(self.lecCtrlR)
		
	def toggleCloth(self):
		if not cmds.objExists(self.cloth):
			cmds.warning("Cannot find cloth")
			return
		
		if not cmds.objExists(self.skirt):
			cmds.warning("Cannot find skirt")
			return
		
		if not self.setupDone:
			cmds.warning("Setup is not done")
			return
		
		input = pm.PyNode(self.name+"_nClothShape").inputMesh.inputs()[0]
		
		on = not cmds.getAttr(self.skirt+".v")
		cmds.setAttr(self.skirt+".v", on)
		cmds.setAttr(self.name+"_system.v", not on)

	def cache(self):
		cmds.select(self.cloth)
		pm.mel.eval('doCreateGeometryCache 6 { "2", "1", "10", "OneFile", "1", "","0","","0", "add", "0", "1", "1","0","1","mcx","0" } ;')
		cmds.setAttr(self.name+"_dynamic_control.dynamic", 0)

	def deleteCache(self):
		cmds.select(self.cloth)
		pm.mel.eval('deleteCacheFile 3 { "delete", "", "geometry" } ;')
		cmds.setAttr(self.name+"_dynamic_control.dynamic", 1)

	def addDeformer(self):
		cmds.setAttr(self.name+"_system.v", 0)
		cmds.showHidden(self.skirt)
		cmds.select(self.cloth)

		pm.mel.eval("MLDeformer")
		ccol, mld = cmds.ls(sl=1)
		
		cmds.connectAttr(self.cloth+"Shape.outMesh", mld+".targetGeometry[0]", f=1)

		cmds.connectAttr(self.name+"_l_angleReader.rotateX", ccol+".inputList[0].input[0]")
		cmds.connectAttr(self.name+"_l_angleReader.rotateY", ccol+".inputList[1].input[0]")
		cmds.connectAttr(self.name+"_r_angleReader.rotateX", ccol+".inputList[2].input[0]")
		cmds.connectAttr(self.name+"_r_angleReader.rotateY", ccol+".inputList[3].input[0]")
		