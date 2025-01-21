import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import os

from .import utils, main

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))
full = os.path.isfile(rootPath + "/full")

class Inbetweens(object):
	def __init__(self, win): #
		self.win = win
		self.curIbName = ""
		self.curIb = {}

		self.connect()

		self.win.ibs_options_frame.setEnabled(False)		

	def connect(self): #
		self.win.ibtw_addWorld_btn.clicked.connect(partial(self.add, local=False))
		self.win.ibtw_addLocal_btn.clicked.connect(partial(self.add, local=True))
		self.win.ibtw_remove_btn.clicked.connect(self.remove)
		self.win.ibtw_childs_listWidget.itemSelectionChanged.connect(self.selectItem)
		self.win.ibtw_childs_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		
		self.win.ib_selectOffsetLocator_btn.clicked.connect(self.selectOffsetLocator)
		self.win.ib_addYJoint_btn.clicked.connect(partial(self.addJoint, "y"))
		self.win.ib_addZJoint_btn.clicked.connect(partial(self.addJoint, "z"))
		self.win.ib_flippedX_checkBox.clicked.connect(partial(self.setFlipped, dir="x"))
		self.win.ib_flippedY_checkBox.clicked.connect(partial(self.setFlipped, dir="y"))
		self.win.ib_flippedZ_checkBox.clicked.connect(partial(self.setFlipped, dir="z"))

	def doubleClckItem(self): #
		cmds.select(self.curIb['name']+"_ibtw_root" )

	def selectItem(self): #
		# get current twist
		try:
			self.curIbName = self.win.ibtw_childs_listWidget.currentItem().text()
			self.curIb = self.getData(self.curIbName)
		except:
			self.curIbName = ''
			self.curIb = {}

		# update cur twist frame
		self.updateFrame()

	def updateList(self): #
		# update twists data
		ibs = cmds.ls("*_ibtw_root")
		ib_names = []
		for root in ibs:
			name = root.split("_ibtw_")[0]
			ib_names.append(name)

		ib_names = sorted(ib_names)

		self.win.ibtw_childs_listWidget.clear()
		for n in ib_names:
			item = QtWidgets.QListWidgetItem(n)
			self.win.ibtw_childs_listWidget.addItem(item)

			if n.split('_')[0] == 'r':
				item.setForeground(QtGui.QBrush(QtGui.QColor("#6C6B6B")))		

	def updateFrame(self): #
		if self.curIbName == '':
			self.win.ibs_options_frame.setEnabled(False)
			self.win.parentJoint_lineEdit.setText("")		
		else:
			if not cmds.objExists(self.curIbName+"_ibtw_root"):
				return
			
			is_symmetrical = utils.isSymmetrical(self.curIbName+"_ibtw_root")

			# data = self.getData(self.curIbName)
			self.win.ibs_options_frame.setEnabled(True)
			self.win.parentJoint_lineEdit.setText(self.curIb['parent_j'])	
			self.win.childJoint_lineEdit.setText(self.curIb['child_j'])	
			
			if self.isLocal(self.curIbName):
				self.win.local_rbtn.setChecked(True)
				self.win.world_rbtn.setChecked(False)
				self.win.ib_flippedX_checkBox.setVisible(False)
				self.win.ib_flippedX_checkBox.setEnabled(False)
				self.win.ib_flippedY_checkBox.setVisible(False)
				self.win.ib_flippedY_checkBox.setEnabled(False)
				self.win.ib_flippedZ_checkBox.setVisible(False)
				self.win.ib_flippedZ_checkBox.setEnabled(False)
			else:
				self.win.world_rbtn.setChecked(True)
				self.win.local_rbtn.setChecked(False)
				
				self.win.ib_flippedX_checkBox.setVisible(True)
				self.win.ib_flippedX_checkBox.setChecked(self.curIb['flippedX'])
				self.win.ib_flippedY_checkBox.setVisible(True)
				self.win.ib_flippedY_checkBox.setChecked(self.curIb['flippedY'])
				self.win.ib_flippedZ_checkBox.setVisible(True)
				self.win.ib_flippedZ_checkBox.setChecked(self.curIb['flippedZ'])

				self.win.ib_flippedX_checkBox.setEnabled(is_symmetrical)
				self.win.ib_flippedY_checkBox.setEnabled(is_symmetrical)
				self.win.ib_flippedZ_checkBox.setEnabled(is_symmetrical)

		if self.curIbName.split('_')[0] == 'r':
			self.win.ibs_options_frame.setEnabled(False)

	def selectListItem(self, name): #
		try:
			item = self.win.ibtw_childs_listWidget.findItems(name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
			self.win.ibtw_childs_listWidget.setCurrentItem(item)		
		except: pass

	def add(self, data={}, local=False, newModuleName=None): #
		if not data:
			sel = cmds.ls(sl=1) 
			if not sel:
				cmds.warning(' Select one child joint under parent, or parent joint and child joint')
				return			
			
			if cmds.objectType(sel[0]) != "joint" and cmds.objectType(sel[0]) != "outJoint":
				cmds.warning(' Selected object is not a joint or outJoint')
				return			
			if len(sel) == 1:
				child_j = sel[0]
				parent_j = cmds.listRelatives(child_j, p=1)[0]
				if cmds.objectType(parent_j) != "joint" and cmds.objectType(parent_j) != "outJoint":
					cmds.warning(' Selected object is not a joint or outJoint')
					return	
			elif len(sel) == 2:
				parent_j, child_j = sel
			else:
				cmds.warning(' Select one child joint under parent, or parent joint and child joint')
				return
		else:
			child_j = data["child_j"]
			parent_j = data["parent_j"]
			local = data["local"]
		
		name = child_j.split("_skinJoint")[0].split("_outJoint")[0].split("_twJoint")[0]

		if cmds.objExists(name+"_ibtw_root"):
			QtWidgets.QMessageBox.information(self.win, "Warning", "Inbetween in this joint already exists.")
			return

        # import with namespace
		if local:
			path = os.path.join(rootPath, 'modules', '_psdLocal.ma')
		else:
			path = os.path.join(rootPath, 'modules', '_psd.ma')
		# print("Load inbetween file", path)
		cmds.file(path, pr=1, i=1, type="mayaAscii", namespace='_temp_', ra=True, mergeNamespacesOnClash=False,options="v=0;")

		# rename and add all twist nodes to module set
		set = cmds.sets(name=name+'_ibtwNodesSet')
		nodes = cmds.ls('_temp_:*')
		moduleName = utils.getModuleName(child_j)
		for n in nodes:
			if cmds.objExists(n):
				cmds.sets(n, e=1, forceElement=set)
				cmds.rename(n, n.replace("_temp_:", name+"_ibtw_"))
		utils.addToModuleSet(set, moduleName)
		cmds.namespace(removeNamespace='_temp_')

		# attach to hierarhy
		root = name+"_ibtw_root"
		out_child_j = child_j.replace("skinJoint", "outJoint")
		out_parent_j = parent_j.replace("skinJoint", "outJoint")
		out_parent_initLoc = out_parent_j.replace("outJoint", "initLoc")
		
		if local:
			cmds.parent(root, out_child_j)
			utils.resetAttrs(root)
			cmds.connectAttr(out_child_j+'.r', name+"_ibtw_input_pairBlend.inRotate1", f=1)
			cmds.delete(name+"_ibtw_joint_1")
		else:
			cmds.parent(root, out_parent_j)
			utils.resetAttrs(root)

			parent_offset_loc = cmds.spaceLocator(n=name+"_ibtw_parent_offsetLoc")[0]
			cmds.sets(parent_offset_loc, e=1, forceElement=set)
			cmds.parent(parent_offset_loc, out_parent_j)
			utils.resetAttrs(parent_offset_loc)

			child_offset_loc = cmds.spaceLocator(n=name+"_ibtw_child_offsetLoc")[0]
			cmds.sets(child_offset_loc, e=1, forceElement=set)
			cmds.parent(child_offset_loc, out_child_j)
			utils.resetAttrs(child_offset_loc)
			
			utils.connectByMatrix(name+"_ibtw_target", [child_offset_loc, parent_offset_loc], ["worldMatrix[0]", "worldInverseMatrix[0]"], attrs=['r'], set=set, module_name=moduleName)
			utils.connectByMatrix(name+"_ibtw_joints_group", [child_offset_loc, parent_offset_loc], ["worldMatrix[0]", "worldInverseMatrix[0]"], attrs=['t'], set=set, module_name=moduleName)

			cmds.connectAttr(parent_offset_loc+".t", root+".t")
			cmds.connectAttr(parent_offset_loc+".r", root+".r")

			cmds.hide(parent_offset_loc, child_offset_loc)
		
		# remove init joints
		cmds.delete(name+"_ibtw_outJoint_y_1")
		cmds.delete(name+"_ibtw_outJoint_y_2")
		cmds.delete(name+"_ibtw_outJoint_z_1")
		cmds.delete(name+"_ibtw_outJoint_z_2")

		# connect opp joints
		def connectOppJoint(name, side):
			opp_name = utils.getOpposite(name)
			
			if local:
				mult = cmds.createNode('multiplyDivide', n="%s_ibtw_%s_angle_multiplyDivide" %(name,side) )
				cmds.sets(mult, e=1, forceElement=set)
				cmds.setAttr(mult+".input2X", -1)
				cmds.setAttr(mult+".input2Y", -1)
				cmds.connectAttr("%s_ibtw_outJoint_%s.angleMax" %(name,side), mult+".input1X")
				cmds.connectAttr("%s_ibtw_outJoint_%s.angleMin" %(name,side), mult+".input1Y")
				cmds.connectAttr( mult+".outputX", "%s_ibtw_outJoint_%s.angleMax" %(opp_name,side))
				cmds.connectAttr( mult+".outputY", "%s_ibtw_outJoint_%s.angleMin" %(opp_name,side))
			else:
				cmds.setAttr(opp_name+"_ibtw_aim.tx", -3)
				cmds.connectAttr("%s_ibtw_outJoint_%s.angleMax" %(name,side), "%s_ibtw_outJoint_%s.angleMax" %(opp_name,side))
				cmds.connectAttr("%s_ibtw_outJoint_%s.angleMin" %(name,side), "%s_ibtw_outJoint_%s.angleMin" %(opp_name,side))
			
			mult = cmds.createNode('multiplyDivide', n="%s_ibtw_%s_slide_multiplyDivide" %(name,side) )
			cmds.sets(mult, e=1, forceElement=set)
			cmds.setAttr(mult+".input2X", -1)
			cmds.setAttr(mult+".input2Y", -1)
			cmds.connectAttr("%s_ibtw_outJoint_%s.slideMax" %(name,side), mult+".input1X")
			cmds.connectAttr("%s_ibtw_outJoint_%s.slideMin" %(name,side), mult+".input1Y")
			cmds.connectAttr( mult+".outputX", "%s_ibtw_outJoint_%s.slideMax" %(opp_name,side))
			cmds.connectAttr( mult+".outputY", "%s_ibtw_outJoint_%s.slideMin" %(opp_name,side))

			cmds.connectAttr("%s_ibtw_outJoint_%s.posMax" %(name,side), "%s_ibtw_outJoint_%s.posMax" %(opp_name,side))
			cmds.connectAttr("%s_ibtw_outJoint_%s.posMin" %(name,side), "%s_ibtw_outJoint_%s.posMin" %(opp_name,side))

		# opposite
		if utils.isSymmetrical(child_j) and utils.getObjectSide(child_j) == "l":
			if data:
				opp_data = data.copy()
				opp_data['child_j'] = utils.getOpposite(child_j)
				opp_data['parent_j'] = utils.getOpposite(parent_j)
				self.add(data=opp_data, local=local)
			else:
				cmds.select(utils.getOpposite(parent_j), utils.getOpposite(child_j))
				self.add(local=local)

			opp_name = utils.getOpposite(name)

			if local:
				mult = cmds.createNode('multiplyDivide', n=opp_name+"_ibtw_reverseParentOffset_multiplyDivide")
				cmds.sets(mult, e=1, forceElement=set)
				cmds.connectAttr(name+"_ibtw_offsetLoc.r", mult+".input1")
				cmds.connectAttr(mult+".output", opp_name+"_ibtw_offsetLoc.r")

				cmds.setAttr(mult+".input2Y", -1)
				cmds.setAttr(mult+".input2Z", -1)
			else:
				opp_offsetLoc = opp_name+"_ibtw_parent_offsetLoc"
				opp_root = utils.getOpposite(root)
				gr = cmds.group(empty=1, name=opp_offsetLoc+"_mirrorGroup")
				cmds.sets(gr, e=1, forceElement=set)
				cmds.parent(gr, utils.getOpposite(out_parent_j))
				utils.resetAttrs(gr)
				cmds.parent(opp_offsetLoc, gr)
				utils.resetAttrs(opp_offsetLoc)
				# cmds.setAttr(gr+".sx", -1)
				cmds.connectAttr(name+"_ibtw_parent_offsetLoc.r", opp_offsetLoc+".r")
				cmds.parent(opp_root, gr)
				utils.resetAttrs(opp_root)

				opp_offsetLoc = opp_name+"_ibtw_child_offsetLoc"
				gr = cmds.group(empty=1, name=opp_offsetLoc+"_mirrorGroup")
				cmds.sets(gr, e=1, forceElement=set)
				cmds.parent(gr, utils.getOpposite(out_child_j))
				utils.resetAttrs(gr)
				cmds.parent(opp_offsetLoc, gr)
				utils.resetAttrs(opp_offsetLoc)
				cmds.setAttr(gr+".sx", -1)
				cmds.connectAttr(name+"_ibtw_child_offsetLoc.r", opp_offsetLoc+".r")
				
				cmds.connectAttr(name+"_ibtw_target_y.t", opp_name+"_ibtw_target_y.t")
				cmds.connectAttr(name+"_ibtw_target_z.t", opp_name+"_ibtw_target_z.t")


		# add joints
		if (utils.isSymmetrical(child_j) and utils.getObjectSide(child_j) == "l") or not utils.isSymmetrical(child_j):
			if not data:
				jointsData = {}
				if local:
					jointsData['angleMin'] = 0
					jointsData['angleMax'] = -30
					jointsData['posMin'] = 1
					jointsData['posMax'] = 5
					jointsData['slideMin'] = 0
					jointsData['slideMax'] = 0
					self.addJoint("y", name, jointsData)

					jointsData['angleMax'] = 30
					jointsData['posMin'] = -1
					jointsData['posMax'] = -5
					self.addJoint("y", name, jointsData)

					jointsData['angleMax'] = 30
					jointsData['posMin'] = 1
					jointsData['posMax'] = 5
					self.addJoint("z", name, jointsData)

					jointsData['angleMax'] = -30
					jointsData['posMin'] = -1
					jointsData['posMax'] = -5
					self.addJoint("z", name, jointsData)
				else:
					jointsData['angleMin'] = 90
					jointsData['angleMax'] = 45
					jointsData['posMin'] = 1
					jointsData['posMax'] = 5
					jointsData['slideMin'] = 0
					jointsData['slideMax'] = 0
					self.addJoint("y", name, jointsData)

					jointsData['angleMax'] = 135
					jointsData['posMin'] = -1
					jointsData['posMax'] = -5
					self.addJoint("y", name, jointsData)

					jointsData['angleMax'] = 45
					jointsData['posMin'] = 1
					jointsData['posMax'] = 5
					self.addJoint("z", name, jointsData)

					jointsData['angleMax'] = 135
					jointsData['posMin'] = -1
					jointsData['posMax'] = -5
					self.addJoint("z", name, jointsData)
			else:
				jointsData = data["jointsData"]
				for j_data in jointsData:
					side = j_data["name"].split("_")[-2]
					self.addJoint(side, name, j_data)
			
				if data["local"]:
					cmds.setAttr(name+"_ibtw_offsetLoc.rx", data["offset"][0][0])
					cmds.setAttr(name+"_ibtw_offsetLoc.ry", data["offset"][0][1])
					cmds.setAttr(name+"_ibtw_offsetLoc.rz", data["offset"][0][2])
				else:
					cmds.setAttr(name+"_ibtw_parent_offsetLoc.rx", data["parentOffset"][0][0])
					cmds.setAttr(name+"_ibtw_parent_offsetLoc.ry", data["parentOffset"][0][1])
					cmds.setAttr(name+"_ibtw_parent_offsetLoc.rz", data["parentOffset"][0][2])
					cmds.setAttr(name+"_ibtw_child_offsetLoc.rx", data["childOffset"][0][0])
					cmds.setAttr(name+"_ibtw_child_offsetLoc.ry", data["childOffset"][0][1])
					cmds.setAttr(name+"_ibtw_child_offsetLoc.rz", data["childOffset"][0][2])
					cmds.setAttr(name+"_ibtw_target_y.tx", data["targetYPos"][0][0])
					cmds.setAttr(name+"_ibtw_target_y.ty", data["targetYPos"][0][1])
					cmds.setAttr(name+"_ibtw_target_y.tz", data["targetYPos"][0][2])
					cmds.setAttr(name+"_ibtw_target_z.tx", data["targetZPos"][0][0])
					cmds.setAttr(name+"_ibtw_target_z.ty", data["targetZPos"][0][1])
					cmds.setAttr(name+"_ibtw_target_z.tz", data["targetZPos"][0][2])
			
				if data["flippedX"]:
					self.setFlipped(name, state=True, dir="x")
				if data["flippedY"]:
					self.setFlipped(name, state=True, dir="y")
				if data["flippedZ"]:
					self.setFlipped(name, state=True, dir="z")

		# module override
		mod = utils.getModuleInstance(moduleName)
		mod.ibtwOverride(name)
		
		cmds.select(root)
		cmds.ShowSelectedObjects()
		cmds.hide(name+"_ibtw_rootShape")

		self.updateList()

		# select item in list
		self.selectListItem(name)

		cmds.select(clear=1)

	def remove(self, name=""): #
		if self.win.ibtw_childs_listWidget.count() == 0:
			return
		
		if name == "" or name == False:
			if name == None:
				return
			if not self.win.ibtw_childs_listWidget.currentItem():
				return
			name = self.win.ibtw_childs_listWidget.currentItem().text()
			
		# delete all twist nodes
		nodes = cmds.sets(name+'_ibtwNodesSet', q=1)
		for n in nodes:
			if cmds.objExists(n):
				cmds.delete(n)

		opp_name = utils.getOpposite(name)
		if name != opp_name and cmds.objExists(opp_name+'_ibtw_root'):
			self.remove(opp_name)

		self.updateList()
			
	def isLocal(self, name): #
		return not cmds.objExists(name+"_ibtw_joints_group")
		
	def selectOffsetLocator(self): #
		name = self.win.ibtw_childs_listWidget.currentItem().text()
		offset_locs = [name+"_ibtw_offsetLoc", name+"_ibtw_parent_offsetLoc", name+"_ibtw_child_offsetLoc", name+"_ibtw_target_y", name+"_ibtw_target_z", name+"_ibtw_aim"]

		if self.isLocal(name):
			v = not cmds.getAttr(name+"_ibtw_offsetLoc.v")
		else:
			v = not cmds.getAttr(name+"_ibtw_target_y.v")

		if v:
			cmds.select(clear=1)

		for l in offset_locs:
			if cmds.objExists(l):
				cmds.setAttr(l+".v", v)
				if v:
					cmds.select(l, add=1)

	def getData(self, name): #
		root = name+"_ibtw_root"

		if not cmds.objExists(root):
			return None

		data = {}
		data["name"] = name
		data["flippedX"] = False
		data["flippedY"] = False
		data["flippedZ"] = False
		data["local"] = self.isLocal(name)

		if self.isLocal(name):
			data["child_j"] = child_j = cmds.listRelatives(root, p=1)[0]
			data["parent_j"] = cmds.listRelatives(child_j, p=1)[0]
			
			data["offset"] = cmds.getAttr(name+"_ibtw_offsetLoc.r")
		else:
			data["child_j"] = cmds.listRelatives(name+"_ibtw_child_offsetLoc", p=1)[0]
			data["parent_j"] = cmds.listRelatives(name+"_ibtw_parent_offsetLoc", p=1)[0]

			data["parentOffset"] = cmds.getAttr(name+"_ibtw_parent_offsetLoc.r")
			data["childOffset"] = cmds.getAttr(name+"_ibtw_child_offsetLoc.r")

			if cmds.objExists(name+"_ibtw_target_y") and cmds.objExists(name+"_ibtw_target_z"):
				data["targetYPos"] = cmds.getAttr(name+"_ibtw_target_y.t")
				data["targetZPos"] = cmds.getAttr(name+"_ibtw_target_z.t")
			else:
				print("Missed", name+"_ibtw_target_y", name+"_ibtw_target_z")

			if utils.isSymmetrical(root):
				opp_name = utils.getOpposite(name)
				data["flippedX"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc_mirrorGroup.sx") == -1
				data["flippedY"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc_mirrorGroup.sy") == -1
				data["flippedZ"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc_mirrorGroup.sz") == -1

		jointsData = []
		joints = cmds.ls(name+"*_ibtw_outJoint_*")
		for j in joints:
			jData = {}
			jData["name"] = j
			jData["angleMin"] = cmds.getAttr(j+".angleMin")
			jData["angleMax"] = cmds.getAttr(j+".angleMax")
			jData["posMin"] = cmds.getAttr(j+".posMin")
			jData["posMax"] = cmds.getAttr(j+".posMax")
			jData["slideMin"] = cmds.getAttr(j+".slideMin")
			jData["slideMax"] = cmds.getAttr(j+".slideMax")
			jointsData.append(jData)

		data["jointsData"] = jointsData



		# print("--------------------")
		# print(data["name"])
		# print(data["child_j"])
		# print(data["parent_j"])
		# print(data["jointsData"])

		return data
	
	def addJoint(self, side, name=None, data=None): #
		if not name:
			name = self.curIbName
		j_name = utils.incrementNameIfExists(name+"_ibtw_outJoint_%s_1" %side)
		local = self.isLocal(name)

		if local:
			cmds.select(name+"_ibtw_root")
		else:
			cmds.select(name+"_ibtw_joints_group")
		j = pm.joint(n=j_name)
		pm.addAttr(j, ln="driverAngle", at="double", k=1)
		pm.addAttr(j, ln="angleMin", at="double", k=1, dv=0)
		pm.addAttr(j, ln="angleMax", at="double", k=1, dv=45)
		pm.addAttr(j, ln="posMin", at="double", k=1, dv=1)
		pm.addAttr(j, ln="posMax", at="double", k=1, dv=5)
		pm.addAttr(j, ln="slideMin", at="double", k=1)
		pm.addAttr(j, ln="slideMax", at="double", k=1)

		if data:
			j.angleMin.set(data['angleMin'])
			j.angleMax.set(data['angleMax'])
			j.posMin.set(data['posMin'])
			j.posMax.set(data['posMax'])
			j.slideMin.set(data['slideMin'])
			j.slideMax.set(data['slideMax'])

		# if side == "y":
		# 	j.angleMax.set(j.angleMax.get()*-1)

		
		set = name + '_ibtwNodesSet'

		uc = pm.PyNode(name+"_ibtw_%s_unitConversion" %side)
		sr = pm.createNode("setRange", n=j_name.replace("outJoint", "setRange"))
		cond1 = pm.createNode("condition", n=j_name.replace("outJoint", "pos_condition"))
		cond2 = pm.createNode("condition", n=j_name.replace("outJoint", "slide_condition"))
		cond3 = pm.createNode("condition", n=j_name.replace("outJoint", "angles_condition"))
		cmds.sets(cond1.name(), e=1, forceElement=set)
		cmds.sets(cond2.name(), e=1, forceElement=set)
		cmds.sets(cond3.name(), e=1, forceElement=set)
		cmds.sets(sr.name(), e=1, forceElement=set)
		cond1.operation.set(3)
		cond2.operation.set(3)
		cond3.operation.set(2)

		uc.output >> j.driverAngle
		uc.output >> sr.valueX
		uc.output >> sr.valueY

		j.posMin >> cond1.colorIfFalseR
		j.posMax >> cond1.colorIfFalseG
		j.posMax >> cond1.colorIfTrueR
		j.posMin >> cond1.colorIfTrueG
		j.angleMax >> cond1.firstTerm
		j.angleMin >> cond1.secondTerm

		j.slideMin >> cond2.colorIfFalseR
		j.slideMax >> cond2.colorIfFalseG
		j.slideMax >> cond2.colorIfTrueR
		j.slideMin >> cond2.colorIfTrueG
		j.angleMax >> cond2.firstTerm
		j.angleMin >> cond2.secondTerm

		j.angleMin >> cond3.colorIfFalseR
		j.angleMax >> cond3.colorIfFalseG
		j.angleMax >> cond3.colorIfTrueR
		j.angleMin >> cond3.colorIfTrueG
		j.angleMax >> cond3.firstTerm
		j.angleMin >> cond3.secondTerm

		cond1.outColorR >> sr.maxY
		cond1.outColorG >> sr.minY
		
		cond2.outColorR >> sr.maxX
		cond2.outColorG >> sr.minX

		cond3.outColorR >> sr.oldMaxX
		cond3.outColorR >> sr.oldMaxY
		cond3.outColorG >> sr.oldMinX
		cond3.outColorG >> sr.oldMinY

		sr.outValueX >> j.translateX
		if side == "y":
			sr.outValueY >> j.translateY
		else:
			sr.outValueY >> j.translateZ

		# add opposite
		if utils.isSymmetrical(name+"_ibtw_root") and utils.getObjectSide(name+"_ibtw_root") == "l":
			opp_name = utils.getOpposite(name)
			set = opp_name + '_ibtwNodesSet'

			self.addJoint(side, opp_name)

			opp_j_name = utils.getOpposite(j_name)
			
			mult = cmds.createNode('multiplyDivide', n=j_name.replace("outJoint", "slide_multiplyDivide"))
			cmds.sets(mult, e=1, forceElement=set)
			cmds.setAttr(mult+".input2X", -1)
			cmds.setAttr(mult+".input2Y", -1)
			cmds.connectAttr(j_name+".slideMax", mult+".input1X")
			cmds.connectAttr(j_name+".slideMin", mult+".input1Y")
			cmds.connectAttr( mult+".outputX", opp_j_name+".slideMax")
			cmds.connectAttr( mult+".outputY", opp_j_name+".slideMin")

			cmds.connectAttr(j_name+".posMax", opp_j_name+".posMax")
			cmds.connectAttr(j_name+".posMin", opp_j_name+".posMin")

			if local:
				mult = cmds.createNode('multiplyDivide', n=j_name.replace("outJoint", "angle_multiplyDivide"))
				cmds.sets(mult, e=1, forceElement=set)
				cmds.setAttr(mult+".input2X", -1)
				cmds.setAttr(mult+".input2Y", -1)
				cmds.connectAttr(j_name+".angleMax", mult+".input1X")
				cmds.connectAttr(j_name+".angleMin", mult+".input1Y")
				cmds.connectAttr( mult+".outputX", opp_j_name+".angleMax")
				cmds.connectAttr( mult+".outputY", opp_j_name+".angleMin")
			else:
				cmds.connectAttr(j_name+".angleMax", opp_j_name+".angleMax")
				cmds.connectAttr(j_name+".angleMin", opp_j_name+".angleMin")

		pm.select(j)

	def selectFirstJoints(self, side):
		name = self.curIbName
		opp_name = utils.getOpposite(name)
		cmds.select(name+"_ibtw_outJoint_%s_1" %side, opp_name+"_ibtw_outJoint_%s_1" %side)

	def setFlipped(self, name=None, dir="x", state=None, solo=True):
		
		if not state:
			if dir == "x":
				state = self.win.ib_flippedX_checkBox.isChecked()
			elif dir == "y":
				state = self.win.ib_flippedY_checkBox.isChecked()
			elif dir == "z":
				state = self.win.ib_flippedZ_checkBox.isChecked()
		
		if state:
			v = -1
		else:
			v = 1

		if not name:
			name = self.curIbName
			
		opp_name = utils.getOpposite(name)
		if dir == "x":
			cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc_mirrorGroup.sx", v)
			self.curIb["flippedX"] = state
		elif dir == "y":
			cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc_mirrorGroup.sy", v)
			self.curIb["flippedZ"] = state
		elif dir == "z":
			cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc_mirrorGroup.sz", v)
			self.curIb["flippedZ"] = state
			
		if state and solo:
			if dir == "x":
				self.win.ib_flippedY_checkBox.setChecked(False)
				self.win.ib_flippedZ_checkBox.setChecked(False)
				self.setFlipped(name, dir="y", state=None, solo=False)
				self.setFlipped(name, dir="z", state=None, solo=False)
			elif dir == "y":
				self.win.ib_flippedX_checkBox.setChecked(False)
				self.win.ib_flippedZ_checkBox.setChecked(False)
				self.setFlipped(name, dir="x", state=None, solo=False)
				self.setFlipped(name, dir="z", state=None, solo=False)
			elif dir == "z":
				self.win.ib_flippedX_checkBox.setChecked(False)
				self.win.ib_flippedY_checkBox.setChecked(False)
				self.setFlipped(name, dir="x", state=None, solo=False)
				self.setFlipped(name, dir="y", state=None, solo=False)
