import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import os

from .import utils, main

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))
full = os.path.isfile(rootPath + "/full")

class Inbetweens(object):
	def __init__(self, win):
		self.win = win
		self.ibs = {}
		self.curIbName = ""
		self.curIb = {}

		self.connect()

		#self.updateList()
		self.win.ibs_options_frame.setEnabled(False)		

	def connect(self):
		self.win.ibtw_addWorld_btn.clicked.connect(partial(self.add, local=False))
		self.win.ibtw_addLocal_btn.clicked.connect(partial(self.add, local=True))
		self.win.ibtw_remove_btn.clicked.connect(self.remove)
		self.win.ibtw_childs_listWidget.itemSelectionChanged.connect(self.selectItem)
		self.win.ibtw_childs_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		
		self.win.ibtw_setParent_btn.clicked.connect(partial(self.setParent))
		self.win.ib_selecteOffsetLocator_btn.clicked.connect(self.selectOffsetLocator)
		self.win.ib_addYJoint_btn.clicked.connect(partial(self.addJoint, "y"))
		self.win.ib_addZJoint_btn.clicked.connect(partial(self.addJoint, "z"))

	def loadIbsData(self): #
		self.ibs = {}

		ibs = cmds.ls("*_ibtw_root")
		
		for root in ibs:
			ib_data = {}
			name = root.split("_ibtw_")[0]
			child_j = name + "_outJoint"
			if self.isLocal(name):
				parent_j = cmds.listRelatives(child_j, p=1)[0]
			else:
				parent_j = cmds.listRelatives(root, p=1)[0]
			
			ib_data['child_j'] = child_j
			ib_data['parent_j'] = parent_j
			ib_data['name'] = name

			self.ibs[name] = ib_data

		return self.ibs

	def doubleClckItem(self): #
		cmds.select(self.curIb['name']+"_ibtw_root" )

	def selectItem(self): #
		# get current twist
		try:
			self.curIbName = self.win.ibtw_childs_listWidget.currentItem().text()
			self.curIb = self.ibs[self.curIbName]
		except:
			self.curIbName = ''
			self.curIb = {}

		# update cur twist frame
		self.updateFrame()

	def updateList(self): #
		# update twists data
		self.loadIbsData()

		ib_names = []
		for t in self.ibs:
			ib_names.append(t)

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
			self.win.ibs_options_frame.setEnabled(True)
			self.win.parentJoint_lineEdit.setText(self.curIb['parent_j'])	
			self.win.childJoint_lineEdit.setText(self.curIb['child_j'])	
			
			if self.curIb['parent_j'] == cmds.listRelatives(self.curIb['child_j'], p=1)[0]:
				self.win.local_rbtn.setChecked(True)
				self.win.world_rbtn.setChecked(False)
			else:
				self.win.world_rbtn.setChecked(True)
				self.win.local_rbtn.setChecked(False)

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
		
		name = child_j.split("_joint")[0].split("_outJoint")[0] + "_ibtw"

		if cmds.objExists(name+"_root"):
			QtWidgets.QMessageBox.information(self.win, "Warning", "Inbetween in this joint already exists.")
			return

        # import with namespace
		if local:
			path = os.path.join(rootPath, 'modules', '_psdLocal.ma')
		else:
			path = os.path.join(rootPath, 'modules', '_psd.ma')
		print("Load inbetween file", path)
		cmds.file(path, pr=1, i=1, type="mayaAscii", namespace='_temp_', ra=True, mergeNamespacesOnClash=False,options="v=0;")

		# rename and add all twist nodes to module set
		set = cmds.sets(name=name+'NodesSet')
		nodes = cmds.ls('_temp_:*')
		moduleName = utils.getModuleName(child_j)
		for n in nodes:
			if cmds.objExists(n):
				cmds.sets(n, e=1, forceElement=set)
				cmds.rename(n, n.replace("_temp_:", name+"_"))
		utils.addToModuleSet(set, moduleName)
		cmds.namespace(removeNamespace='_temp_')

		# attach to hierarhy
		root = name+"_root"
		out_child_j = child_j.replace("joint", "outJoint")
		out_parent_j = parent_j.replace("joint", "outJoint")
		out_child_initLoc = out_child_j.replace("outJoint", "initLoc")
		out_parent_initLoc = out_parent_j.replace("outJoint", "initLoc")
		
		if local:
			cmds.parent(root, out_child_j)
			utils.resetAttrs(root)
			cmds.connectAttr(out_child_j+'.r', name+"_input_pairBlend.inRotate1", f=1)
			cmds.delete(name+"_joint_1")
		else:
			cmds.parent(root, out_parent_j)
			utils.resetAttrs(root)
			offset_loc = cmds.spaceLocator(n=name+"_ibtwOffsetLoc")[0]
			cmds.sets(offset_loc, e=1, forceElement=set)
			cmds.parent(offset_loc, out_parent_initLoc)
			utils.resetAttrs(offset_loc)

			utils.connectByMatrix(root, [offset_loc, out_parent_initLoc], ["worldMatrix[0]", "worldInverseMatrix[0]"], attrs=['t', 'r'], set=set)
			utils.connectByMatrix(name+"_target", [out_child_j, root], ["worldMatrix[0]", "worldInverseMatrix[0]"], attrs=['r'], set=set)
			cmds.connectAttr(name+"_target_decMat.outputTranslate", name+"_joints_group.t")

		cmds.ShowSelectedObjects()

		# connect opp joints
		def connectOppJoint(name, side):
			opp_name = utils.getOpposite(name)
			
			if local:
				mult = cmds.createNode('multiplyDivide', n="%s_%s_angle_multiplyDivide" %(name,side) )
				cmds.sets(mult, e=1, forceElement=set)
				cmds.setAttr(mult+".input2X", -1)
				cmds.setAttr(mult+".input2Y", -1)
				cmds.connectAttr("%s_outJoint_%s.angleMax" %(name,side), mult+".input1X")
				cmds.connectAttr("%s_outJoint_%s.angleMin" %(name,side), mult+".input1Y")
				cmds.connectAttr( mult+".outputX", "%s_outJoint_%s.angleMax" %(opp_name,side))
				cmds.connectAttr( mult+".outputY", "%s_outJoint_%s.angleMin" %(opp_name,side))
			else:
				cmds.setAttr(opp_name+"_aim.tx", -3)
				cmds.connectAttr("%s_outJoint_%s.angleMax" %(name,side), "%s_outJoint_%s.angleMax" %(opp_name,side))
				cmds.connectAttr("%s_outJoint_%s.angleMin" %(name,side), "%s_outJoint_%s.angleMin" %(opp_name,side))
			
			mult = cmds.createNode('multiplyDivide', n="%s_%s_slide_multiplyDivide" %(name,side) )
			cmds.sets(mult, e=1, forceElement=set)
			cmds.setAttr(mult+".input2X", -1)
			cmds.setAttr(mult+".input2Y", -1)
			cmds.connectAttr("%s_outJoint_%s.slideMax" %(name,side), mult+".input1X")
			cmds.connectAttr("%s_outJoint_%s.slideMin" %(name,side), mult+".input1Y")
			cmds.connectAttr( mult+".outputX", "%s_outJoint_%s.slideMax" %(opp_name,side))
			cmds.connectAttr( mult+".outputY", "%s_outJoint_%s.slideMin" %(opp_name,side))

			cmds.connectAttr("%s_outJoint_%s.posMax" %(name,side), "%s_outJoint_%s.posMax" %(opp_name,side))
			cmds.connectAttr("%s_outJoint_%s.posMin" %(name,side), "%s_outJoint_%s.posMin" %(opp_name,side))

		# opposite
		if utils.isSymmetrical(child_j) and utils.getObjectSide(child_j) == "l":
			cmds.select(utils.getOpposite(parent_j), utils.getOpposite(child_j))
			self.add(local=local)
			
			connectOppJoint(name, "y_1")
			connectOppJoint(name, "y_2")
			connectOppJoint(name, "z_1")
			connectOppJoint(name, "z_2")

			if not local:
				opp_name = utils.getOpposite(name)

				mult = cmds.createNode('multiplyDivide', n=opp_name+"_reverseOffset_multiplyDivide")
				cmds.sets(mult, e=1, forceElement=set)
				cmds.setAttr(mult+".input2X", -1)
				cmds.setAttr(mult+".input2Y", -1)
				
				cmds.connectAttr(name+"_ibtwOffsetLoc.r", mult+".input1")
				cmds.connectAttr(mult+".output", opp_name+"_ibtwOffsetLoc.r")

				cmds.setAttr(opp_name+"_root.sx", -1)

		self.updateList()

		# select item in list
		self.selectListItem(name.replace("_ibtw", ""))

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

	def setParent(self):
		name = self.curIbName
		sel = cmds.ls(sl=1)

		if len(sel) != 1:
			cmds.warning(' Select one joint as parent')
			return			

		parent = sel[0]
		child = self.curIb['child']
		
		self.remove(self.curIbName)
		
		data = {}
		data["child"] = child
		data["parent"] = parent

		self.add(data)
		
		self.selectListItem(self.curIbName)

		self.updateFrame()

		if len(sel) > 0:
			cmds.select(sel)
			
	def selectJoint(self, side):
		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")		
		
		cmds.select("%s__%s__ibJoint" %(name, side) )
			
	def switchJoint(self, side, w):
		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")		
		
		v = w.isChecked()
		
		cmds.setAttr("%s__%s__ibJoint.visibility" %(name, side), v)
			
	def isLocal(self, name): #
		return not cmds.objExists(name+"_ibtw_joints_group")
			
	def rotateWeight(self, side, w):
		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")		
		
		def run(name):
			gr = pm.PyNode("%s__%s__rotWeightGroup" %(name,side) )
			drv = pm.PyNode(name+"__ibDriver") 
			off_gr = pm.PyNode("%s__%s__rotWeightGroup" %(name,side))
			j = pm.PyNode("%s__%s__ibJoint" %(name,side))
			
			if not self.isLocal(name, side):
				pm.parent(off_gr, pm.PyNode(name+"__ibRoot") )
	
				pb = pm.createNode('pairBlend', n="%s__%s__ibPairBlend" %(name,side) )
				drv.r >> pb.inRotate1
				pb.weight.set(0.5)
				pb.rotInterpolation.set(1)
				pb.outRotate >> gr.r
				
				pm.addAttr(j, ln="rotationWeight", k=1, dv=0.5, minValue=0, maxValue=1)
				rev = pm.createNode( 'reverse', n="%s__%s__ibRotationWeightRev" %(name,side) )
				j.rotationWeight >> rev.inputX
				rev.outputX >> pb.weight
				
				if name.split("_")[0] == "r":
					pm.connectAttr("l"+j.name()[1:].replace("_r_", "_l_")+".rotationWeight", j.rotationWeight)
				
			else:
				pm.parent(off_gr, pm.PyNode(name+"__ibRotationOffsetGroup") )
				pb = pm.PyNode("%s__%s__ibPairBlend" %(name,side)) 
				pm.delete(pb)
				pm.disconnectAttr(drv.r, off_gr.r)
				off_gr.r.set(0,0,0)
				j.rotationWeight.delete()
				
		run(name)
		
		opp_name = ("r" + name[1:]).replace("__l_", "__r_")
		if cmds.objExists(opp_name+"__ibRoot"):
			run(opp_name)
			
			
		self.updateFrame()
		
	def selectOffsetLocator(self): #
		name = self.win.ibtw_childs_listWidget.currentItem().text()
		offset_loc = name + "_ibtw_ibtwOffsetLoc"
		v = cmds.getAttr(offset_loc+".v")
		cmds.select(offset_loc)

	def getData(self, name): #
		root = name+"_ibtw_root"

		if not cmds.objExists(root):
			return None

		data = {}
		data["name"] = name

		if self.isLocal(name):
			data["child_j"] = child_j = cmds.listRelatives(root, p=1)[0]
			data["parent_j"] = cmds.listRelatives(child_j, p=1)[0]
		else:
			mm = pm.PyNode(name+"_ibtw_multMat")
			data["child_j"], data["parent_j"] = mm.matrixIn.inputs()

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

		print("--------------------")
		print(data["name"])
		print(data["child_j"])
		print(data["parent_j"])
		print(data["jointsData"])

		return data
	
	def addJoint(self, side, name=None):
		if not name:
			name = self.curIbName
		j_name = utils.incrementNameIfExists(name+"_ibtw_outJoint_%s_1" %side)
		j = pm.duplicate(name+"_ibtw_outJoint_%s_1" %side, n=j_name)[0]
		j.driverAngle.unlock()
		local = self.isLocal(name)
		set = name + '_ibtwNodesSet'

		uc = pm.PyNode(name+"_ibtw_%s_unitConversion" %side)
		sr = pm.createNode("setRange", n=j_name+"_setRange")
		cond1 = pm.createNode("condition", n=j_name+"_pos_condition")
		cond2 = pm.createNode("condition", n=j_name+"_slide_condition")
		cond3 = pm.createNode("condition", n=j_name+"_angles_condition")
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
			
			mult = cmds.createNode('multiplyDivide', n=j_name+"_slide_multiplyDivide")
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
				mult = cmds.createNode('multiplyDivide', n=j_name+"_angle_multiplyDivide")
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