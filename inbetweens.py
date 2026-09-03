import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import math
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
		self.win.ibtw_addLocalMll_btn.clicked.connect(self.addMllFromSelection)
		self.win.ibtw_remove_btn.clicked.connect(self.remove)
		self.win.ibtw_childs_listWidget.itemSelectionChanged.connect(self.selectItem)
		self.win.ibtw_childs_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		
		self.win.ib_selectOffsetLocator_btn.clicked.connect(self.selectOffsetLocator)
		self.win.ib_addYJoint_btn.clicked.connect(partial(self.addJoint, "y"))
		self.win.ib_addZJoint_btn.clicked.connect(partial(self.addJoint, "z"))
		self.win.ib_removeJoint_btn.clicked.connect(self.removeJoint)

	def doubleClckItem(self): #
		name = self.curIb['name']
		cmds.select(name+"_ibtw_solver" if self.isMll(name) else name+"_ibtw_root")

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
		ib_names = []
		for root in cmds.ls("*_ibtw_root") or []:
			ib_names.append(root.split("_ibtw_")[0])
		# the plugin variant has no root transform, it is found by its solver
		for solver in cmds.ls("*_ibtw_solver") or []:
			name = solver.split("_ibtw_")[0]
			if name not in ib_names:
				ib_names.append(name)

		ib_names = sorted(ib_names)
		
		self.win.ibtw_childs_listWidget.clear()
		for n in ib_names:
			item = QtWidgets.QListWidgetItem(n)
			self.win.ibtw_childs_listWidget.addItem(item)

			if n.split('_')[0] == 'r':
				item.setForeground(QtGui.QBrush(QtGui.QColor("#6C6B6B")))		

	def updateFrameVisibility(self, is_mll): #
		"""The plugin variant has no offset locators, no world mode and nothing
		to pick by hand - the two add buttons and the remove one are all it uses.
		"""
		widgets = ("label_36", "local_rbtn", "world_rbtn", "ib_switch_btn",
				   "label_35", "label_41", "parentJoint_lineEdit", "childJoint_lineEdit",
				   "ibtw_setParent_btn", "ibtw_setChild_btn",
				   "ib_selectOffsetLocator_btn")
		for w in widgets:
			getattr(self.win, w).setVisible(not is_mll)

	def updateFrame(self): #
		self.updateFrameVisibility(bool(self.curIbName) and self.isMll(self.curIbName))

		if self.curIbName == '':
			self.win.ibs_options_frame.setEnabled(False)
			self.win.parentJoint_lineEdit.setText("")		
		else:
			if not cmds.objExists(self.curIbName+"_ibtw_root") and not self.isMll(self.curIbName):
				return
			
			is_symmetrical = utils.isSymmetrical(self.curIbName+"_ibtw_root")

			# data = self.getData(self.curIbName)
			self.win.ibs_options_frame.setEnabled(True)
			self.win.parentJoint_lineEdit.setText(self.curIb['parent_j'])	
			self.win.childJoint_lineEdit.setText(self.curIb['child_j'])	
			
			if self.isLocal(self.curIbName) or self.isMll(self.curIbName):
				self.win.local_rbtn.setChecked(True)
				self.win.world_rbtn.setChecked(False)
			else:
				self.win.world_rbtn.setChecked(True)
				self.win.local_rbtn.setChecked(False)
		
		# set check state for offsetLocs button
		offset_locs = self.getOffsetLocators(self.curIbName)
		if offset_locs:
			self.win.ib_selectOffsetLocator_btn.setChecked(cmds.getAttr(offset_locs[0]+".v"))

		if self.curIbName.split('_')[0] == 'r':
			self.win.ibs_options_frame.setEnabled(False)

	def selectListItem(self, name): #
		try:
			item = self.win.ibtw_childs_listWidget.findItems(name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
			self.win.ibtw_childs_listWidget.setCurrentItem(item)		
		except: pass

	def add(self, data={}, local=False, newModuleName=None): #
		if data and data.get("mode") == "mll":
			return self.addMll(data=data)

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
		
		# remove the placeholder joints of the template - the real ones are built
		# by addJoint(). in _psd.ma they sit inside *_offsetRotate groups, in
		# _psdLocal.ma they are bare children of the root, and they also carry
		# the old attribute names (slideMin/slideMax) and the old naming
		for j_side in ("y", "z"):
			for j_id in (1, 2):
				base = "%s_ibtw_outJoint_%s_%s" %(name, j_side, j_id)
				for o in (base+"_offsetRotate", base):
					if cmds.objExists(o):
						cmds.delete(o)
						break

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
					if "offsetT" in data:
						cmds.setAttr(name+"_ibtw_offsetLoc.t", *data["offsetT"][0], type="double3")
					if "offsetS" in data:
						cmds.setAttr(name+"_ibtw_offsetLoc.s", *data["offsetS"][0], type="double3")
				else:
					cmds.setAttr(name+"_ibtw_parent_offsetLoc.rx", data["parentOffset"][0][0])
					cmds.setAttr(name+"_ibtw_parent_offsetLoc.ry", data["parentOffset"][0][1])
					cmds.setAttr(name+"_ibtw_parent_offsetLoc.rz", data["parentOffset"][0][2])
					cmds.setAttr(name+"_ibtw_child_offsetLoc.rx", data["childOffset"][0][0])
					cmds.setAttr(name+"_ibtw_child_offsetLoc.ry", data["childOffset"][0][1])
					cmds.setAttr(name+"_ibtw_child_offsetLoc.rz", data["childOffset"][0][2])
					if "parentOffsetT" in data:
						cmds.setAttr(name+"_ibtw_parent_offsetLoc.t", *data["parentOffsetT"][0], type="double3")
						cmds.setAttr(name+"_ibtw_child_offsetLoc.t", *data["childOffsetT"][0], type="double3")
					if "parentOffsetS" in data:
						cmds.setAttr(name+"_ibtw_parent_offsetLoc.s", *data["parentOffsetS"][0], type="double3")
						cmds.setAttr(name+"_ibtw_child_offsetLoc.s", *data["childOffsetS"][0], type="double3")

					if "parentOffsetR" in data:
						if utils.getObjectSide(root) == "l":
							opp_name = utils.getOpposite(name)
							cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.rx", data["parentOffsetR"][0][0])
							cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.ry", data["parentOffsetR"][0][1])
							cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.rz", data["parentOffsetR"][0][2])
							cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.rx", data["childOffsetR"][0][0])
							cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.ry", data["childOffsetR"][0][1])
							cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.rz", data["childOffsetR"][0][2])
							if "parentOffsetTR" in data:
								cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.t", *data["parentOffsetTR"][0], type="double3")
								cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.t", *data["childOffsetTR"][0], type="double3")
							if "parentOffsetSR" in data:
								cmds.setAttr(opp_name+"_ibtw_parent_offsetLoc.s", *data["parentOffsetSR"][0], type="double3")
								cmds.setAttr(opp_name+"_ibtw_child_offsetLoc.s", *data["childOffsetSR"][0], type="double3")

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
		if cmds.objExists(name+'_ibtwNodesSet'):
			nodes = cmds.sets(name+'_ibtwNodesSet', q=1) or []
			for n in nodes:
				if cmds.objExists(n):
					cmds.delete(n)

		opp_name = utils.getOpposite(name)

		# the plugin variant has no root transform: looking for the root alone
		# left the whole right side in the scene, and the next build then found
		# its solver in place and quietly skipped the mirror
		if name != opp_name and (cmds.objExists(opp_name+'_ibtw_root')
								 or cmds.objExists(opp_name+'_ibtw_solver')):
			self.remove(opp_name)

		self.updateList()
			
	def isLocal(self, name): #
		return not self.isMll(name) and not cmds.objExists(name+"_ibtw_joints_group")

	def isMll(self, name): #
		"""The variant built on the pk_ibtw node of pk_correctives.mll."""
		return cmds.objExists(name+"_ibtw_solver")
		
	def getOffsetLocators(self, name): #
		"""Shapes of the offset locators of the inbetween - they differ per mode."""
		if not name or not cmds.objExists(name+"_ibtw_root"):
			return []

		if self.isLocal(name):
			locs = [name+"_ibtw_offsetLocShape"]
		else:
			locs = [name+"_ibtw_parent_offsetLocShape", name+"_ibtw_child_offsetLocShape"]

		return [l for l in locs if cmds.objExists(l)]

	def selectOffsetLocator(self): #
		if not self.win.ibtw_childs_listWidget.currentItem():
			return

		name = self.win.ibtw_childs_listWidget.currentItem().text()
		offset_locs = self.getOffsetLocators(name)
		if not offset_locs:
			return

		v = not cmds.getAttr(offset_locs[0]+".v")

		cmds.select(offset_locs)

		for l in offset_locs:
			cmds.setAttr(l+".v", v)
			opp = utils.getOpposite(l)
			if cmds.objExists(opp):
				cmds.setAttr(opp+".v", v)
				cmds.select(opp, add=1)

	def getData(self, name): #
		if self.isMll(name):
			return self.getDataMll(name)

		root = name+"_ibtw_root"

		if not cmds.objExists(root):
			return None

		local = self.isLocal(name)

		# the offset locators and the mirror groups belong to the world scheme,
		# the local one has neither - these checks used to run for both and made
		# getData return None for every local inbetween
		if not local:
			if not cmds.objExists(name+"_ibtw_child_offsetLoc"):
				print("Missed offsetLoc", name+"_ibtw_child_offsetLoc")
				return None

			if utils.isSymmetrical(root) and utils.getObjectSide(root) == "r":
				if not cmds.objExists(name+"_ibtw_child_offsetLoc_mirrorGroup"):
					return

		data = {}
		data["name"] = name
		data["local"] = local
		if self.isLocal(name):
			data["child_j"] = child_j = cmds.listRelatives(root, p=1)[0]
			data["parent_j"] = cmds.listRelatives(child_j, p=1)[0]
			
			data["offset"] = cmds.getAttr(name+"_ibtw_offsetLoc.r")
			data["offsetT"] = cmds.getAttr(name+"_ibtw_offsetLoc.t")
			data["offsetS"] = cmds.getAttr(name+"_ibtw_offsetLoc.s")
		else:
			if utils.isSymmetrical(root) and utils.getObjectSide(root) == "r":
				data["child_j"] = cmds.listRelatives(name+"_ibtw_child_offsetLoc_mirrorGroup", p=1)[0]
				data["parent_j"] = cmds.listRelatives(name+"_ibtw_parent_offsetLoc_mirrorGroup", p=1)[0]
			else:
				data["child_j"] = cmds.listRelatives(name+"_ibtw_child_offsetLoc", p=1)[0]
				data["parent_j"] = cmds.listRelatives(name+"_ibtw_parent_offsetLoc", p=1)[0]

			data["parentOffset"] = cmds.getAttr(name+"_ibtw_parent_offsetLoc.r")
			data["childOffset"] = cmds.getAttr(name+"_ibtw_child_offsetLoc.r")
			data["parentOffsetT"] = cmds.getAttr(name+"_ibtw_parent_offsetLoc.t")
			data["childOffsetT"] = cmds.getAttr(name+"_ibtw_child_offsetLoc.t")
			data["parentOffsetS"] = cmds.getAttr(name+"_ibtw_parent_offsetLoc.s")
			data["childOffsetS"] = cmds.getAttr(name+"_ibtw_child_offsetLoc.s")

			if utils.isSymmetrical(root):
				if utils.getObjectSide(root) == "l":
					opp_name = utils.getOpposite(name)
					if cmds.objExists(opp_name+"_ibtw_root"):
						data["parentOffsetR"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc.r")
						data["childOffsetR"] = cmds.getAttr(opp_name+"_ibtw_child_offsetLoc.r")
						data["parentOffsetTR"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc.t")
						data["childOffsetTR"] = cmds.getAttr(opp_name+"_ibtw_child_offsetLoc.t")
						data["parentOffsetSR"] = cmds.getAttr(opp_name+"_ibtw_parent_offsetLoc.s")
						data["childOffsetSR"] = cmds.getAttr(opp_name+"_ibtw_child_offsetLoc.s")
				# if local:
				# 	pass


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
				# saved for both modes now: every joint is built by addJoint(),
				# which always adds the attribute
				if cmds.objExists(j+".reverse"):
					jData["reverse"] = cmds.getAttr(j+".reverse")
				else:
					jData["reverse"] = False
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

		if self.isMll(name):
			return self.addJointMll(side, name, data)
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
			j.reverse.set(data.get('reverse', False))

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

			# in the world scheme the root hangs under the parent joint, in the
			# local one under the child - the skin side follows the same joint
			src_j = data["child_j"] if local else data["parent_j"]
			par_s_j = src_j.replace("outJoint", "skinJoint").replace("twJoint", "skinJoint")

			root_s_j = cmds.joint(n=root_s_j)
			cmds.setAttr(root_s_j+".segmentScaleCompensate", 0)
			cmds.sets(root_s_j, e=1, forceElement=set)
			pm.parent(root_s_j, par_s_j)
			utils.removeTransformParentJoint(root_s_j)
			utils.resetAttrs(root_s_j, jointOrient=True)

			if local:
				# both sit under the same joint, so the local channels are copied
				# straight across - no matrix multiply, no decompose
				cmds.connectAttr(name+"_ibtw_root.t", root_s_j+".t")
				cmds.connectAttr(name+"_ibtw_root.r", root_s_j+".r")
			else:
				mod_name = utils.getModuleName(src_j)
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

	# ---------------------------------------------------------------- pk_correctives

	def loadCorrectivesPlugin(self): #
		"""Load pk_correctives.mll built for the running Maya version."""
		if "pk_correctives" not in (cmds.pluginInfo(q=1, listPlugins=1) or []):
			mayaVersion = cmds.about(v=True).split(" ")[0]
			path = os.path.join(rootPath, "plugins", "plug-ins", mayaVersion, "pk_correctives.mll")

			if not os.path.isfile(path):
				cmds.warning("pk_correctives.mll is not built for Maya %s - %s" %(mayaVersion, path))
				return False

			cmds.loadPlugin(path)
			if "pk_correctives" not in (cmds.pluginInfo(q=1, listPlugins=1) or []):
				return False

		# the plugin says it is loaded, but that is not enough: unloading it
		# while pk_ibtw nodes were in the scene leaves the type registered as an
		# empty stub, and loading the plugin again does not replace it. createNode
		# then gives a node without a single attribute instead of failing.
		try:
			healthy = cmds.attributeQuery("driverRotate", type="pk_ibtw", exists=True)
		except RuntimeError:
			# the stub is not always a queryable type either
			healthy = False

		if not healthy:
			cmds.warning(" pk_ibtw is registered without its attributes - restart Maya. "
						 "The plugin was unloaded while its nodes were still in the scene.")
			return False

		return True

	def jointSuffix(self, joint): #
		"""Suffix of the driver joint - the correctives get the same one."""
		for suffix in ("skinJoint", "outJoint", "twJoint"):
			if joint.endswith("_" + suffix):
				return suffix
		return ""

	def mllJointName(self, name, side, n, suffix): #
		j = "%s_ibtw_%s_%s" %(name, side, n)
		return j + "_" + suffix if suffix else j

	def getMllDriver(self, name): #
		drivers = cmds.listConnections(name+"_ibtw_solver.driverRotate", source=1, destination=0) or []
		return drivers[0] if drivers else ""

	def addMllFromSelection(self): #
		self.addMll()

	def addMll(self, data=None, mirrored=False): #
		"""Inbetween on the pk_ibtw node: the correctives go straight into the
		selected joint, one solver node, no groups and no template scene."""
		if not self.loadCorrectivesPlugin():
			return

		if data:
			driver_j = data["child_j"]
		else:
			sel = cmds.ls(sl=1) or []
			if len(sel) != 1:
				cmds.warning(" Select one joint")
				return
			driver_j = sel[0]

		if not cmds.objExists(driver_j):
			cmds.warning(" Cannot find the joint " + str(driver_j))
			return
		if cmds.objectType(driver_j) != "joint":
			cmds.warning(" Selected object is not a joint")
			return

		suffix = self.jointSuffix(driver_j)
		name = driver_j[:-len(suffix)-1] if suffix else driver_j

		if cmds.objExists(name+"_ibtw_solver") or cmds.objExists(name+"_ibtw_root"):
			QtWidgets.QMessageBox.information(self.win, "Warning", "Inbetween in this joint already exists.")
			return

		nodes_set = name + "_ibtwNodesSet"
		if not cmds.objExists(nodes_set):
			# empty: without it the set takes the current selection, that is the
			# driver joint, and remove() would delete it together with the correctives
			cmds.sets(n=nodes_set, empty=True)
		utils.addToModuleSet(nodes_set, utils.getModuleName(driver_j))

		solver = cmds.createNode("pk_ibtw", n=name+"_ibtw_solver")
		cmds.sets(solver, e=1, forceElement=nodes_set)
		cmds.connectAttr(driver_j+".rotate", solver+".driverRotate")
		cmds.connectAttr(driver_j+".rotateOrder", solver+".driverRotateOrder")

		if data:
			cmds.setAttr(solver+".scale", data.get("scale", 1.0))
			offset = data.get("offset", [(0.0, 0.0, 0.0)])[0]
			cmds.setAttr(solver+".offsetRotate", offset[0], offset[1], offset[2], type="double3")

			for j_data in data["jointsData"]:
				self.addJointMll(j_data["side"], name, j_data, mirrored=mirrored)
		else:
			# the driver is the full bend now, positive towards its own axis,
			# so 60 here is what -30 used to be on the halved euler channel
			defaults = (("y", 60, 1, 5), ("y", -60, -1, -5),
						("z", 60, 1, 5), ("z", -60, -1, -5))
			for side, angleMax, posMin, posMax in defaults:
				self.addJointMll(side, name, {"angleMin": 0, "angleMax": angleMax,
											  "posMin": posMin, "posMax": posMax,
											  "swingMin": 0, "swingMax": 0,
											  "bind": 0.5, "reverse": False},
								 mirrored=mirrored)

		# opposite
		if utils.isSymmetrical(driver_j) and utils.getObjectSide(driver_j) == "l":
			opp_j = utils.getOpposite(driver_j)
			opp_name = utils.getOpposite(name)

			# both skips used to be silent, and the missing right side looked
			# like nothing had happened at all
			if not cmds.objExists(opp_j):
				cmds.warning(" The opposite joint %s does not exist, the right side is not built" %opp_j)
			elif cmds.objExists(opp_name+"_ibtw_solver"):
				cmds.warning(" %s_ibtw_solver already exists, the right side is left as it is" %opp_name)
			else:
				if data:
					opp_data = dict(data)
					opp_data["child_j"] = opp_j
					opp_data["mode"] = "mll"
					self.addMll(data=opp_data, mirrored=True)
				else:
					cmds.select(opp_j)
					self.addMll(mirrored=True)

				if cmds.objExists(opp_name+"_ibtw_solver"):
					self.connectMllMirror(name)
				else:
					cmds.warning(" The right side %s_ibtw_solver was not built" %opp_name)

		self.updateList()
		self.selectListItem(name)

		# the solver is left selected: scale and offsetRotate are on it, so they
		# can be dialled in right away without hunting for the node
		cmds.select(solver)

	def getMirrorAxis(self, joint, opp_joint): #
		"""How the local frame of the opposite joint sits against the mirror.

		Returns the sign of every local axis of `opp_joint` against the mirror
		image of the same axis of `joint`, plus the dot products it read them
		from. The right side of a rig is not always built the same way, so this
		is measured off the two joints instead of assumed: on a side mirrored by
		a negative scale it comes out (1, 1, 1), and where an axis was flipped
		by hand that axis comes out -1.
		"""
		m = cmds.xform(joint, q=1, ws=1, matrix=1)
		opp_m = cmds.xform(opp_joint, q=1, ws=1, matrix=1)

		signs, dots = [], []
		for i in range(3):
			a = m[i*4:i*4+3]
			b = opp_m[i*4:i*4+3]

			a_len = math.sqrt(sum([v*v for v in a]))
			b_len = math.sqrt(sum([v*v for v in b]))
			if not a_len or not b_len:
				signs.append(1.0)
				dots.append(0.0)
				continue

			# the mirror is the YZ plane of the world, so it flips world X
			d = (-a[0]*b[0] + a[1]*b[1] + a[2]*b[2]) / (a_len * b_len)
			dots.append(d)
			signs.append(-1.0 if d < 0 else 1.0)

		return signs, dots

	def connectMllMirror(self, name): #
		"""Drive the right side from the left.

		One connection per joint, compound to compound: the whole element of the
		array goes across at once. What has to change sign is stated once, in
		mirrorAxis of the opposite solver - the multiplyDivide per channel the
		other variants need is not built at all.
		"""
		opp_name = utils.getOpposite(name)
		solver = name + "_ibtw_solver"
		opp_solver = opp_name + "_ibtw_solver"

		if not cmds.objExists(opp_solver):
			return

		driver_j = self.getMllDriver(name)
		opp_driver_j = self.getMllDriver(opp_name)
		if driver_j and opp_driver_j:
			signs, dots = self.getMirrorAxis(driver_j, opp_driver_j)
			cmds.setAttr(opp_solver+".mirrorAxis", signs[0], signs[1], signs[2], type="double3")

			# an axis of the two sides that is neither the mirror of the other
			# nor its opposite cannot be told apart by a sign at all
			weak = [i for i in range(3) if abs(dots[i]) < 0.9]
			if weak:
				cmds.warning(" %s: axes %s of %s and %s are not mirrors of each other "
							 "(%s), check mirrorAxis by hand"
							 %(opp_solver, "".join(["xyz"[i] for i in weak]),
							   driver_j, opp_driver_j,
							   ", ".join(["%.2f" %d for d in dots])))

		cmds.connectAttr(solver+".offsetRotate", opp_solver+".offsetRotate")
		cmds.connectAttr(solver+".scale", opp_solver+".scale")

		for i in cmds.getAttr(solver+".joint", multiIndices=True) or []:
			element = "%s.joint[%s]" %(solver, i)
			opp_element = "%s.joint[%s]" %(opp_solver, i)
			if not cmds.listConnections(opp_element, source=1, destination=0):
				cmds.connectAttr(element, opp_element)

	def addJointMll(self, side, name=None, data=None, mirrored=False): #
		if not name:
			name = self.curIbName

		solver = name + "_ibtw_solver"
		if not cmds.objExists(solver):
			cmds.warning("Missed " + solver)
			return

		driver_j = self.getMllDriver(name)
		if not driver_j:
			cmds.warning("Missed the driver joint of " + solver)
			return

		suffix = self.jointSuffix(driver_j)

		n = 1
		while cmds.objExists(self.mllJointName(name, side, n, suffix)):
			n += 1
		j_name = self.mllJointName(name, side, n, suffix)

		indices = cmds.getAttr(solver+".joint", multiIndices=True) or []
		index = max(indices) + 1 if indices else 0

		cmds.select(driver_j)
		j = cmds.joint(n=j_name)
		cmds.setAttr(j+".segmentScaleCompensate", 0)
		utils.resetAttrs(j, jointOrient=True)
		cmds.sets(j, e=1, forceElement=name+"_ibtwNodesSet")

		cmds.addAttr(j, ln="driverAngle", at="doubleAngle", k=1)

		element = "%s.joint[%s]" %(solver, index)
		# always set, on the mirrored side too: this is what makes the element of
		# the array exist, and without it multiIndices stays empty and every
		# joint of that side ends up reading out[0]
		cmds.setAttr(element+".axis", 0 if side == "y" else 1)

		# on the mirrored side the whole element of the array comes from the
		# left solver, so the joint carries no parameters of its own
		if not mirrored:
			# the angles are doubleAngle, so they plug into the node without a
			# unitConversion in between and still read as degrees in the channel box
			cmds.addAttr(j, ln="angleMin", at="doubleAngle", k=1, dv=0)
			cmds.addAttr(j, ln="angleMax", at="doubleAngle", k=1, dv=45)
			cmds.addAttr(j, ln="posMin", at="double", k=1, dv=1)
			cmds.addAttr(j, ln="posMax", at="double", k=1, dv=5)
			# the joint swings around the origin of the driver instead of sliding
			# along the bone, so it keeps its distance
			cmds.addAttr(j, ln="swingMin", at="doubleAngle", k=1)
			cmds.addAttr(j, ln="swingMax", at="doubleAngle", k=1)
			# 0 - keeps the frame of the parent, 1 - follows the bone
			cmds.addAttr(j, ln="bind", at="double", k=1, dv=0.5, min=0, max=1)
			cmds.addAttr(j, ln="reverse", at="bool", k=1)

			if data:
				for attr in ("angleMin", "angleMax", "posMin", "posMax"):
					cmds.setAttr(j+"."+attr, data[attr])
				cmds.setAttr(j+".swingMin", data.get("swingMin", 0))
				cmds.setAttr(j+".swingMax", data.get("swingMax", 0))
				cmds.setAttr(j+".bind", data.get("bind", 0.5))
				cmds.setAttr(j+".reverse", data.get("reverse", False))

			for attr in ("angleMin", "angleMax", "posMin", "posMax", "swingMin", "swingMax", "bind", "reverse"):
				cmds.connectAttr(j+"."+attr, element+"."+attr)

		cmds.connectAttr("%s.out[%s].outTranslate" %(solver, index), j+".translate")
		# the rotation is per joint now, bind is not shared
		cmds.connectAttr("%s.out[%s].outRotate" %(solver, index), j+".rotate")
		cmds.connectAttr("%s.out[%s].outDriverAngle" %(solver, index), j+".driverAngle")
		cmds.setAttr(j+".driverAngle", lock=1)

		return j

	def removeJoint(self, *args): #
		"""Delete the selected corrective joints, both sides at once."""
		sel = cmds.ls(sl=1, type="joint") or []
		if not sel:
			cmds.warning(" Select the corrective joints to remove")
			return

		for j in sel:
			if cmds.objExists(j):
				self.removeJointMll(j)

		if self.curIbName:
			self.curIb = self.getData(self.curIbName)

	def removeJointMll(self, joint): #
		"""One corrective joint with its element of the solver array.

		The solver and the index come from the connection of the joint itself,
		not from its name, and the pair is always removed from the driving side.
		"""
		if utils.isSymmetrical(joint) and utils.getObjectSide(joint) == "r":
			joint = utils.getOpposite(joint)

		joints = [joint]
		opp_j = utils.getOpposite(joint)
		if opp_j != joint and cmds.objExists(opp_j):
			joints.append(opp_j)

		for j in joints:
			plug = cmds.connectionInfo(j+".translate", sourceFromDestination=True)
			if not plug or ".out[" not in plug:
				cmds.warning(" %s is not a corrective joint of a pk_ibtw solver" %j)
				continue

			solver = plug.split(".")[0]
			index = plug.split(".out[")[1].split("]")[0]

			# the joint goes first: driverAngle is locked, and deleting the node
			# takes its connections down without touching the lock
			cmds.delete(j)

			# b=True breaks what is connected to the element as well - on the
			# mirrored side that is the element of the left solver
			cmds.removeMultiInstance("%s.joint[%s]" %(solver, index), b=True)
			cmds.removeMultiInstance("%s.out[%s]" %(solver, index), b=True)

	def getDataMll(self, name): #
		solver = name + "_ibtw_solver"
		if not cmds.objExists(solver):
			return None

		driver_j = self.getMllDriver(name)
		if not driver_j:
			cmds.warning("Missed the driver joint of " + solver)
			return None

		parents = cmds.listRelatives(driver_j, p=1) or []

		data = {}
		data["name"] = name
		data["mode"] = "mll"
		data["local"] = True
		data["child_j"] = driver_j
		data["parent_j"] = parents[0] if parents else ""
		data["scale"] = cmds.getAttr(solver+".scale")
		data["offset"] = cmds.getAttr(solver+".offsetRotate")

		jointsData = []
		for i in cmds.getAttr(solver+".joint", multiIndices=True) or []:
			element = "%s.joint[%s]" %(solver, i)

			jData = {}
			# read off the solver, not off the joint: on the mirrored side the
			# joints carry no parameters at all
			joints = cmds.listConnections(element+".angleMin", source=1, destination=0) or []
			jData["name"] = joints[0] if joints else ""
			jData["side"] = "y" if cmds.getAttr(element+".axis") == 0 else "z"
			for attr in ("angleMin", "angleMax", "posMin", "posMax", "swingMin", "swingMax", "bind", "reverse"):
				jData[attr] = cmds.getAttr(element+"."+attr)
			jointsData.append(jData)

		data["jointsData"] = jointsData

		return data

	def getIbtwsData(self, moduleNames=[]):
		ibtwsData = []
		roots = (cmds.ls("*_ibtw_root") or []) + (cmds.ls("*_ibtw_solver") or [])

		for root in roots:
			if utils.getObjectSide(root) == "r" and cmds.objExists(utils.getOpposite(root)):
				continue
			if root.endswith("_ibtw_solver"):
				# a DG node has no DAG path, the module is taken from the driver
				drivers = cmds.listConnections(root+".driverRotate", source=1, destination=0) or []
				m_name = utils.getModuleName(drivers[0]) if drivers else None
			else:
				m_name = utils.getModuleName(root)

			if moduleNames and m_name not in moduleNames: # if start of the ibts name == module name
				continue

			ibtw = root.split("_ibtw_")[0]
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