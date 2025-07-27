import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import os

from .import utils

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

	def doubleClckItem(self): #
		cmds.select(self.curIb['name']+"_ibtw_root" )

	def selectItem(self): #
		# get current twist
		if self.win.ibtw_childs_listWidget.currentItem():
			self.curIbName = self.win.ibtw_childs_listWidget.currentItem().text()
			self.curIb = self.getData(self.curIbName)
		# except:
			# self.curIbName = ''
			# self.curIb = {}

		# update cur twist frame
		if self.curIb:
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
			else:
				self.win.world_rbtn.setChecked(True)
				self.win.local_rbtn.setChecked(False)
		
		# set check state for offsetLocs button
		self.win.ib_selectOffsetLocator_btn.setChecked(cmds.getAttr(self.curIbName+"_ibtw_parent_offsetLocShape.v"))

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
			
			if sel[0].split("_")[-1] != "skinJoint":
				cmds.warning(' Selected object is not a skinJoint')
				return			
			if len(sel) == 1:
				child_j = sel[0]
				parent_j = cmds.listRelatives(child_j, p=1)[0]
				if parent_j.split("_")[-1] != "skinJoint":
					cmds.warning(' Parent of the selected joint is not a skinJoint')
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
		self.curIb = self.getData(name)
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
		moduleName = utils.getModuleName(child_j)
		set = cmds.sets(name=name+'_ibtwNodesSet')

		nodes = cmds.ls('_temp_:*')
		for n in nodes:
			if cmds.objExists(n):
				cmds.sets(n, e=1, forceElement=set)
				cmds.rename(n, n.replace("_temp_:", name+"_ibtw_"))
		utils.addToModuleSet(set, moduleName)
		cmds.namespace(removeNamespace='_temp_')

		# attach to hierarhy
		root = name+"_ibtw_root"
		if "_twist_" in child_j:
			out_child_j = child_j.replace("skinJoint", "twJoint")
		else:
			out_child_j = child_j.replace("skinJoint", "outJoint")
		if "_twist_" in parent_j:
			out_parent_j = parent_j.replace("skinJoint", "twJoint")
		else:
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

			parent_offset_loc = cmds.duplicate(name+"_ibtw_root", n=name+"_ibtw_parent_offsetLoc")[0]
			for o in pm.listRelatives(parent_offset_loc):
				if cmds.objectType(o.name()) != "nurbsCurve":
					pm.delete(o)
				else:
					o.v.set(0)
			cmds.sets(parent_offset_loc, e=1, forceElement=set)
			utils.resetAttrs(parent_offset_loc)
			
			child_offset_loc = cmds.duplicate(name+"_ibtw_input", n=name+"_ibtw_child_offsetLoc")[0]
			cmds.hide(name+"_ibtw_inputShape")
			for o in pm.listRelatives(child_offset_loc):
				if cmds.objectType(o.name()) != "nurbsCurve":
					pm.delete(o)
				else:
					o.v.set(0)
			cmds.sets(child_offset_loc, e=1, forceElement=set)
			cmds.parent(child_offset_loc, out_child_j)
			utils.resetAttrs(child_offset_loc)
			
			utils.connectByMatrix(name+"_ibtw_input", [child_offset_loc, parent_offset_loc], ["worldMatrix[0]", "worldInverseMatrix[0]"], attrs=['r'], set=set, module_name=moduleName)
			utils.connectByMatrix(name+"_ibtw_joints_group", [child_offset_loc, parent_offset_loc], ["worldMatrix[0]", "worldInverseMatrix[0]"], attrs=['t'], set=set, module_name=moduleName)

			cmds.connectAttr(parent_offset_loc+".t", root+".t")
			cmds.connectAttr(parent_offset_loc+".r", root+".r")

			cmds.hide(parent_offset_loc, child_offset_loc)
		
		# remove init joints (for world ibtw)
		if cmds.objExists(name+"_ibtw_outJoint_y_1_offsetRotate"):
			cmds.delete(name+"_ibtw_outJoint_y_1_offsetRotate")
			cmds.delete(name+"_ibtw_outJoint_y_2_offsetRotate")
			cmds.delete(name+"_ibtw_outJoint_z_1_offsetRotate")
			cmds.delete(name+"_ibtw_outJoint_z_2_offsetRotate")

		# opposite
		if utils.isSymmetrical(child_j) and utils.getObjectSide(child_j) == "l":
			opp_name = utils.getOpposite(name)
			opp_set = opp_name+'_ibtwNodesSet'

			if data:
				opp_data = data.copy()
				opp_data['child_j'] = utils.getOpposite(child_j)
				opp_data['parent_j'] = utils.getOpposite(parent_j)
				self.add(data=opp_data, local=local)
			else:
				cmds.select(utils.getOpposite(parent_j), utils.getOpposite(child_j))
				self.add(local=local)

			if local:
				mult = cmds.createNode('multiplyDivide', n=opp_name+"_ibtw_reverseParentOffset_multiplyDivide")
				cmds.sets(mult, e=1, forceElement=opp_set)
				cmds.connectAttr(name+"_ibtw_offsetLoc.r", mult+".input1")
				cmds.connectAttr(mult+".output", opp_name+"_ibtw_offsetLoc.r")

				cmds.setAttr(mult+".input2Y", -1)
				cmds.setAttr(mult+".input2Z", -1)
			else:
				opp_offsetLoc = opp_name+"_ibtw_parent_offsetLoc"
				opp_root = utils.getOpposite(root)
				gr = cmds.group(empty=1, name=opp_offsetLoc+"_mirrorGroup")
				cmds.sets(gr, e=1, forceElement=opp_set)
				cmds.parent(gr, utils.getOpposite(out_parent_j))
				utils.resetAttrs(gr)
				cmds.parent(opp_offsetLoc, gr)
				utils.resetAttrs(opp_offsetLoc)
				cmds.parent(opp_root, gr)
				utils.resetAttrs(opp_root)
				cmds.setAttr(gr+".sx", -1)

				opp_offsetLoc = opp_name+"_ibtw_child_offsetLoc"
				gr = cmds.group(empty=1, name=opp_offsetLoc+"_mirrorGroup")
				cmds.sets(gr, e=1, forceElement=opp_set)
				cmds.parent(gr, utils.getOpposite(out_child_j))
				utils.resetAttrs(gr)
				cmds.parent(opp_offsetLoc, gr)
				utils.resetAttrs(opp_offsetLoc)
				cmds.setAttr(gr+".sx", -1)


		# add joints
		if (utils.isSymmetrical(child_j) and utils.getObjectSide(child_j) == "l") or not utils.isSymmetrical(child_j):
			if not data:
				jointsData = {}
				if local:
					jointsData['angleMin'] = 0
					jointsData['angleMax'] = -30
					jointsData['posMin'] = 1
					jointsData['posMax'] = 5
					jointsData['offsetMin'] = 0
					jointsData['offsetMax'] = 0
					jointsData['reverse'] = False
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
					jointsData['offsetMin'] = 0
					jointsData['offsetMax'] = 0
					jointsData['reverse'] = False
					self.addJoint("y", name, jointsData)

					jointsData['angleMax'] = 135
					jointsData['reverse'] = True
					self.addJoint("y", name, jointsData)

					jointsData['angleMax'] = 45
					jointsData['reverse'] = False
					self.addJoint("z", name, jointsData)

					jointsData['angleMax'] = 135
					jointsData['reverse'] = True
					self.addJoint("z", name, jointsData)
			else:
				jointsData = data["jointsData"]
				for j_data in jointsData:
					side = j_data["name"].split("_")[-3]
					if not side in ["y", "z"]:
						cmds.warning("Old data format in template")
						return
					self.addJoint(side=side, name=name, data=j_data)
			
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

					if "parentOffsetR" in data:
						if utils.getObjectSide(root) == "l":
							opp_name = utils.getOpposite(name)
							cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.rx", data["parentOffsetR"][0][0])
							cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.ry", data["parentOffsetR"][0][1])
							cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.rz", data["parentOffsetR"][0][2])
							cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.rx", data["childOffsetR"][0][0])
							cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.ry", data["childOffsetR"][0][1])
							cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.rz", data["childOffsetR"][0][2])

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
		offset_locs = [name+"_ibtw_parent_offsetLocShape", name+"_ibtw_child_offsetLocShape"]

		if self.isLocal(name):
			v = not cmds.getAttr(name+"_ibtw_offsetLoc.v")
		else:
			v = not cmds.getAttr(name+"_ibtw_parent_offsetLocShape.v")

		cmds.select(offset_locs)
		
		for l in offset_locs:
			if cmds.objExists(l):
				cmds.setAttr(l+".v", v)
			if cmds.objExists(utils.getOpposite(l)):
				cmds.setAttr(utils.getOpposite(l)+".v", v)
				cmds.select(utils.getOpposite(l), add=1)

	def getData(self, name): #
		root = name+"_ibtw_root"

		if not cmds.objExists(root):
			return None
		
		if utils.isSymmetrical(root) and utils.getObjectSide(root) == "r":
			if not cmds.objExists(name+"_ibtw_child_offsetLoc_mirrorGroup"):
				return
			
		local = self.isLocal(name)

		data = {}
		data["name"] = name
		data["local"] = local
		
		if self.isLocal(name):
			data["child_j"] = child_j = cmds.listRelatives(root, p=1)[0]
			data["parent_j"] = cmds.listRelatives(child_j, p=1)[0]
			
			data["offset"] = cmds.getAttr(name+"_ibtw_offsetLoc.r")
		else:
			if utils.isSymmetrical(root) and utils.getObjectSide(root) == "r":
				data["child_j"] = cmds.listRelatives(name+"_ibtw_child_offsetLoc_mirrorGroup", p=1)[0]
				data["parent_j"] = cmds.listRelatives(name+"_ibtw_parent_offsetLoc_mirrorGroup", p=1)[0]
			else:
				data["child_j"] = cmds.listRelatives(name+"_ibtw_child_offsetLoc", p=1)[0]
				data["parent_j"] = cmds.listRelatives(name+"_ibtw_parent_offsetLoc", p=1)[0]

			data["parentOffset"] = cmds.getAttr(name+"_ibtw_parent_offsetLoc.r")
			data["childOffset"] = cmds.getAttr(name+"_ibtw_child_offsetLoc.r")

			if utils.isSymmetrical(root):
				if utils.getObjectSide(root) == "l":
					opp_name = utils.getOpposite(name)
				else:
					opp_name = name
				if local:
					pass
				else:
					data["parentOffsetR"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc.r")
					data["childOffsetR"] = cmds.getAttr(opp_name+"_ibtw_child_offsetLoc.r")

		jointsData = []
		if local:
			joints_gr = cmds.listRelatives(name+"*_ibtw_root")
		else:
			joints_gr = cmds.listRelatives(name+"*_ibtw_joints_group")
		
		if joints_gr:
			for j_gr in joints_gr:
				if not cmds.listRelatives(j_gr):
					continue
				j = cmds.listRelatives(j_gr)[0] 
				if cmds.objectType(j) != "joint":
					continue
				jData = {}
				jData["name"] = j
				jData["angleMin"] = cmds.getAttr(j+".angleMin")
				jData["angleMax"] = cmds.getAttr(j+".angleMax")
				jData["posMin"] = cmds.getAttr(j+".posMin")
				jData["posMax"] = cmds.getAttr(j+".posMax")
				jData["offsetMin"] = cmds.getAttr(j+".offsetMin")
				jData["offsetMax"] = cmds.getAttr(j+".offsetMax")
				if not local:
					jData["reverse"] = cmds.getAttr(j+".reverse")
				jointsData.append(jData)

		data["jointsData"] = jointsData



		# print("--------------------")
		# print(data["name"])
		# print(data["child_j"])
		# print(data["parent_j"])
		# print(data["jointsData"])

		return data
	
	def addJoint(self, side, name=None, data=None): #
		# print(13, side, name)
		if not name:
			name = self.curIbName
		j_name = utils.incrementNameIfExistsWithSuffix(f"{name}_ibtw_{side}_1_outJoint")
		local = self.isLocal(name)

		if local:
			cmds.select(name+"_ibtw_root")
		else:
			cmds.select(name+"_ibtw_joints_group")
		j = pm.joint(n=j_name)
		j_gr = pm.group(j, n=j_name+"_offsetRotate")
		pm.addAttr(j, ln="driverAngle", at="double", k=1)
		pm.addAttr(j, ln="angleMin", at="double", k=1, dv=0)
		pm.addAttr(j, ln="angleMax", at="double", k=1, dv=45)
		pm.addAttr(j, ln="posMin", at="double", k=1, dv=1)
		pm.addAttr(j, ln="posMax", at="double", k=1, dv=5)
		pm.addAttr(j, ln="offsetMin", at="double", k=1)
		pm.addAttr(j, ln="offsetMax", at="double", k=1)
		pm.addAttr(j, ln="reverse", at="bool", k=1)

		if data:
			j.angleMin.set(data['angleMin'])
			j.angleMax.set(data['angleMax'])
			j.posMin.set(data['posMin'])
			j.posMax.set(data['posMax'])
			j.offsetMin.set(data['offsetMin'])
			j.offsetMax.set(data['offsetMax'])
			j.reverse.set(data['reverse'])

		set = name + '_ibtwNodesSet'
		uc = pm.PyNode(name+"_ibtw_%s_unitConversion" %side)
		
		sr = pm.createNode("setRange", n=j_name.replace("outJoint", "setRange"))
		cond1 = pm.createNode("condition", n=j_name.replace("outJoint", "pos_condition"))
		cond2 = pm.createNode("condition", n=j_name.replace("outJoint", "slide_condition"))
		cond3 = pm.createNode("condition", n=j_name.replace("outJoint", "angles_condition"))
		mult = pm.createNode("multiplyDivide", n=j_name.replace("outJoint", "pos_multiplyDivide"))
		rev = pm.createNode("setRange", n=j_name.replace("outJoint", "reverse_setRange"))
		rev.minX.set(1)
		rev.maxX.set(-1)
		rev.oldMinX.set(0)
		rev.oldMaxX.set(1)
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

		j.posMax >> mult.input1X
		j.posMin >> mult.input1Y
		j.reverse >> rev.valueX
		rev.outValueX >> mult.input2X
		rev.outValueX >> mult.input2Y

		mult.outputY >> cond1.colorIfFalseR
		mult.outputX >> cond1.colorIfFalseG
		mult.outputX >> cond1.colorIfTrueR
		mult.outputY >> cond1.colorIfTrueG

		j.angleMax >> cond1.firstTerm
		j.angleMin >> cond1.secondTerm

		j.offsetMin >> cond2.colorIfFalseR
		j.offsetMax >> cond2.colorIfFalseG
		j.offsetMax >> cond2.colorIfTrueR
		j.offsetMin >> cond2.colorIfTrueG
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


		# add root skinJoint
		root_s_j = name+"_ibtw_root_skinJoint"
		if not cmds.objExists(root_s_j):
			data = self.getData(name)
			par_s_j = data["parent_j"].replace("outJoint", "skinJoint").replace("twJoint", "skinJoint")

			root_s_j = cmds.joint(n=root_s_j)
			cmds.sets(root_s_j, e=1, forceElement=set)
			pm.parent(root_s_j, par_s_j)
			utils.resetAttrs(root_s_j, jointOrient=True)

			mod_name = utils.getModuleName(data["parent_j"])
			utils.connectByMatrix(root_s_j, [name+"_ibtw_joints_group", root_s_j], ["worldMatrix[0]", "parentInverseMatrix[0]"], module_name=mod_name)

		# add skinJoint
		s_j = pm.duplicate(j, n=j.replace("outJoint", "skinJoint"))[0]
		cmds.sets(s_j.name(), e=1, forceElement=set)
		
		# hide outJoint
		j.drawStyle.set(2)

		pm.parent(s_j, root_s_j)
		utils.removeTransformParentJoint(s_j.name())
		utils.resetAttrs(s_j, jointOrient=True)

		j.t >> s_j.t
		j.r >> s_j.r
		
		if utils.getObjectSide(name+"_ibtw_root") == "l" or utils.getObjectSide(name+"_ibtw_root") == "c":
			s_j.angleMin >> j.angleMin
			s_j.angleMax >> j.angleMax
			s_j.posMin >> j.posMin
			s_j.posMax >> j.posMax
			s_j.offsetMin >> j.offsetMin
			s_j.offsetMax >> j.offsetMax
			s_j.reverse >> j.reverse
			j.driverAngle >> s_j.driverAngle
			j.driverAngle.lock()
			pm.setAttr(j.driverAngle, lock=1)
		elif utils.objectIsOpposite(name+"_ibtw_root"):
			pm.deleteAttr(s_j, attribute="angleMin")
			pm.deleteAttr(s_j, attribute="angleMax")
			pm.deleteAttr(s_j, attribute="posMin")
			pm.deleteAttr(s_j, attribute="posMax")
			pm.deleteAttr(s_j, attribute="offsetMin")
			pm.deleteAttr(s_j, attribute="offsetMax")
			pm.deleteAttr(s_j, attribute="reverse")


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
			cmds.connectAttr(j_name+".offsetMax", mult+".input1X")
			cmds.connectAttr(j_name+".offsetMin", mult+".input1Y")
			cmds.connectAttr( mult+".outputX", opp_j_name+".offsetMax")
			cmds.connectAttr( mult+".outputY", opp_j_name+".offsetMin")
			cmds.connectAttr(j_name+".posMax", opp_j_name+".posMax")
			cmds.connectAttr(j_name+".posMin", opp_j_name+".posMin")
			cmds.connectAttr(j_name+".reverse", opp_j_name+".reverse")

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

		pm.select(s_j)

	def selectFirstJoints(self, side):
		name = self.curIbName
		opp_name = utils.getOpposite(name)
		cmds.select(name+"_ibtw_outJoint_%s_1" %side, opp_name+"_ibtw_outJoint_%s_1" %side)

	def getIbtwsData(self, moduleNames=[]):
		ibtwsData = []
		roots = cmds.ls("*_ibtw_root")

		for root in roots:
			if utils.getObjectSide(root) == "r" and cmds.objExists(utils.getOpposite(root)):
				continue
			m_name = utils.getModuleName(root)
			if moduleNames and m_name not in moduleNames: # if start of the ibts name == module name
				continue

			ibtw = root.split("_ibtw_root")[0]
			ibtwData = self.getData(ibtw)
			ibtwsData.append(ibtwData)
		
		return ibtwsData	
	
	def renameData(self, data, names_dict):
			
		def rename_module_in_data(tw_data, value, old_name, new_name):
			if value.split("_")[0] in ["l", "r"]:
				m_name = value.split("_")[0] + "_" + value.split("_")[1]
				if len(value.split("_")) >= 3:
					if value.split("_")[2].isdigit():
						m_name = m_name + "_" + value.split("_")[2]
			else:
				m_name = value.split("_")[0]
				if len(value.split("_")) >= 2:
					if value.split("_")[1].isdigit():
						m_name = m_name + "_" + value.split("_")[1]
		
			if m_name == old_name:
				value = new_name + value[len(old_name):]
				tw_data[attr] = value
				# print("REN", old_name, new_name, value)

		for old_name in names_dict:
			new_name = names_dict[old_name]
			if old_name == new_name:
				continue

			for attr in ["child_j", "parent_j", "name"]:
				for tw_data in data:
					value = tw_data[attr]
					rename_module_in_data(tw_data, value, old_name, new_name)

		return data	