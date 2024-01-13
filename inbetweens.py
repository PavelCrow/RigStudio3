import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import logging, traceback, os, imp, math, sys

if sys.version[0] == "2":
	import utils, main
else:
	import importlib
	import rigStudio2.main as main
	import rigStudio2.utils as utils

version = int(cmds.about(v=True).split(" ")[0])
if version >= 2020:
	from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
else:
	from Qt import QtWidgets, QtGui, QtCore, QtUiTools
try: from shiboken import wrapInstance
except: from shiboken2 import wrapInstance

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.setLevel(logging.DEBUG)

rootDebug = ""
fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])
full = os.path.isfile(rootPath+"/full")

def debugStart(func, name="", noEnd=False):
	if not main.configData['debug']: return
	global rootDebug
	rootDebug = rootDebug + ' -> ' + func
	logger.debug(rootDebug + ' ' + name + ' -> ')	

	if noEnd:
		rootDebug = rootDebug.split(' -> ' + func)[0]	

def debugEnd(func, name=""):
	if not main.configData['debug']: return
	global rootDebug
	logger.debug(rootDebug + ' ' + name + " -| ")
	rootDebug = rootDebug.split(' -> ' + func)[0]	


class Inbetweens(object):
	def __init__(self, win):
		debugStart(traceback.extract_stack()[-1][2])
		self.win = win
		self.ibs = {}
		self.curIbName = ""
		self.curIb = {}

		self.connect()

		#self.updateList()
		self.win.ibs_options_frame.setEnabled(False)		

		debugEnd(traceback.extract_stack()[-1][2])

	def connect(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.win.ibtw_add_btn.clicked.connect(self.add)
		self.win.ibtw_remove_btn.clicked.connect(self.remove)

		self.win.ibtw_childs_listWidget.itemSelectionChanged.connect(self.selectItem)
		self.win.ibtw_childs_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		

		self.win.ibtw_setParent_btn.clicked.connect(partial(self.setParent))
		self.win.ibtw_resetParent_btn.clicked.connect(self.resetParent)
		
		self.win.ib_selectRoot_btn.clicked.connect(self.ib_selectRoot)
		self.win.ib_selectOffsetLocators_btn.clicked.connect(self.ib_selectOffsetLocators)
		self.win.ib_selectOffsetLocatorsR_btn.clicked.connect(partial(self.ib_selectOffsetLocators, "r"))
		self.win.ib_selectOffsetLocatorsL_btn.clicked.connect(partial(self.ib_selectOffsetLocators, "l"))
		
		self.win.ib_switchOffsetLocators_btn.clicked.connect(self.switchOffsetLocators)
		
		self.win.ibSelectFrontJoint_btn.clicked.connect(partial(self.selectJoint, "front"))
		self.win.ibSelectBackJoint_btn.clicked.connect(partial(self.selectJoint, "back"))
		self.win.ibSelectLeftJoint_btn.clicked.connect(partial(self.selectJoint, "left"))
		self.win.ibSelectRightJoint_btn.clicked.connect(partial(self.selectJoint, "right"))
		
		self.win.ib_front_checkBox.clicked.connect(partial(self.switchJoint, "front", self.win.ib_front_checkBox))
		self.win.ib_back_checkBox.clicked.connect(partial(self.switchJoint, "back", self.win.ib_back_checkBox))
		self.win.ib_left_checkBox.clicked.connect(partial(self.switchJoint, "left", self.win.ib_left_checkBox))
		self.win.ib_right_checkBox.clicked.connect(partial(self.switchJoint, "right", self.win.ib_right_checkBox))
		
		self.win.ibRotWeight_front_btn.clicked.connect(partial(self.rotateWeight, "front", self.win.ibRotWeight_front_btn))
		self.win.ibRotWeight_back_btn.clicked.connect(partial(self.rotateWeight, "back", self.win.ibRotWeight_back_btn))
		self.win.ibRotWeight_left_btn.clicked.connect(partial(self.rotateWeight, "left", self.win.ibRotWeight_left_btn))
		self.win.ibRotWeight_right_btn.clicked.connect(partial(self.rotateWeight, "right", self.win.ibRotWeight_left_btn))

		debugEnd(traceback.extract_stack()[-1][2])

	def loadIbsData(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.ibs = {}

		ibs = cmds.ls("*_ibRoot")
		
		for ib in ibs:
			ib_data = {}
			ib_name = ib.split("__ibRoot")[0]
			ib_child = ib.split("__")[0]
			ib_parent = ib.split("__")[1]

			ib_data['child'] = ib_child
			ib_data['parent'] = ib_parent

			self.ibs[ib_name] = ib_data
			
		return self.ibs

	@staticmethod	
	def getIbData(ibRoot, module_name=""):
		debugStart(traceback.extract_stack()[-1][2])
		
		ibName = ibRoot.split("__ibRoot")[0]
		
		data = {}
		if module_name == "":
			template_name = ibName
		else:
			first_name, sec_name = ibName.split("__")
			first_template_name = utils.getTemplatedNameFromReal(module_name, first_name)
			sec_template_name = utils.getTemplatedNameFromReal(module_name, sec_name)
			
			template_name = first_template_name + "__" + sec_template_name
			
		data['name'] = template_name		
		
		child = ibName.split("__")[0]
		data['child'] = utils.getTemplatedNameFromReal(module_name, child)
		parent = ibName.split("__")[1]
		data['parent'] = utils.getTemplatedNameFromReal(module_name, parent)
			
		return data

	def doubleClckItem(self):
		debugStart(traceback.extract_stack()[-1][2])

		cmds.select(self.curIb['child'])

		debugEnd(traceback.extract_stack()[-1][2])		

	def selectItem(self):
		debugStart(traceback.extract_stack()[-1][2])

		# get current twist 
		try:
			self.curIbName = self.win.ibtw_childs_listWidget.currentItem().text().replace(" - ", "__")
			self.curIb = self.ibs[self.curIbName]
		except:
			self.curIbName = ''
			self.curIb = {}

		# update cur twist frame
		self.updateFrame()

		debugEnd(traceback.extract_stack()[-1][2])		

	def updateList(self):
		debugStart(traceback.extract_stack()[-1][2])

		# update twists data
		self.loadIbsData()

		ib_names = []
		for t in self.ibs:
			ib_names.append(t)

		ib_names = sorted(ib_names)

		self.win.ibtw_childs_listWidget.clear()
		for n in ib_names:
			item = QtWidgets.QListWidgetItem(n.replace("__", " - "))
			self.win.ibtw_childs_listWidget.addItem(item)

			if n.split('_')[0] == 'r':
				item.setForeground(QtGui.QBrush(QtGui.QColor("#6C6B6B")))		

		debugEnd(traceback.extract_stack()[-1][2])	

	def updateFrame(self):
		debugStart(traceback.extract_stack()[-1][2])
		#print "UPDATE FRAME", self.curIbName
		if self.curIbName == '':
			self.win.ibs_options_frame.setEnabled(False)
			self.win.parentJoint_lineEdit.setText("")		
		else:
			if not cmds.objExists(self.curIbName+"__ibRoot"):
				return
			self.win.ibs_options_frame.setEnabled(True)
			#print "Set to True"
			self.win.parentJoint_lineEdit.setText(self.curIb['parent'])	
			
			if self.curIb['parent'] == cmds.listRelatives(self.curIb['child'], p=1)[0]:
				self.win.local_rbtn.setChecked(True)
				self.win.world_rbtn.setChecked(False)
			else:
				self.win.world_rbtn.setChecked(True)
				self.win.local_rbtn.setChecked(False)

		if self.curIbName.split('_')[0] == 'r':
			#print "Set to False"
			self.win.ibs_options_frame.setEnabled(False)
			
		if not cmds.objExists(self.curIbName+"__ibRoot"):
				return
			
		if not self.isLocal(self.curIbName, "front"):
			self.win.ibRotWeight_front_btn.setText("Add Local Weight")
		else:
			self.win.ibRotWeight_front_btn.setText("Remove Local Weight")
			
		if not self.isLocal(self.curIbName, "back"):
			self.win.ibRotWeight_back_btn.setText("Add Local Weight")
		else:
			self.win.ibRotWeight_back_btn.setText("Remove Local Weight")
			
		if not self.isLocal(self.curIbName, "left"):
			self.win.ibRotWeight_left_btn.setText("Add Local Weight")
		else:
			self.win.ibRotWeight_left_btn.setText("Remove Local Weight")
			
		if not self.isLocal(self.curIbName, "right"):
			self.win.ibRotWeight_right_btn.setText("Add Local Weight")
		else:
			self.win.ibRotWeight_right_btn.setText("Remove Local Weight")
			

		debugEnd(traceback.extract_stack()[-1][2])		

	def selectListItem(self, name):
		try:
			item = self.win.ibtw_childs_listWidget.findItems(name.replace("__", (" - ")), QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
			self.win.ibtw_childs_listWidget.setCurrentItem(item)		
		except: pass

	def add(self, data={}):
		debugStart(traceback.extract_stack()[-1][2])

		if not full:
			QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
			return		

		if not data:
			sel = cmds.ls(sl=1)
			
			if cmds.objectType(sel[0]) != "joint":
				cmds.warning(' Selected object is not a joint')
				return			
			if len(sel) == 1:
				child_j = sel[0]
				parent_j = cmds.listRelatives(child_j, p=1)[0]
			elif len(sel) == 2:
				parent_j, child_j = sel
			else:
				cmds.warning(' Select one child joint under parent, or parent joint and child joint')
				return
		else:
			child_j = data["child"]
			parent_j = data["parent"]
		
		name = child_j+"__"+parent_j
		
		if name in self.ibs:
			cmds.warning("Inbetween joints already exists")
			return


		root = pm.group(n=name+"__ibRoot", empty=1 )
		drv = pm.spaceLocator(n=name+"__ibDriver" )
		a_reader = pm.spaceLocator(n=name+"__ibAngleReader" )
		gr = pm.group(n=name+"__ibRotationGroup", empty=1)
		globalOffset_gr = pm.group(n=name+"__ibRotationOffsetGroup", empty=1)
		pm.parent(globalOffset_gr, gr)
		pm.parent(drv, a_reader, gr, root)
		a_reader.hide()
		
		cmds.select(clear=1)
		
		def addJoint(j_name, side, aMin, aMax, pMin, pMax, inAttrName, outAttrName):
			j = pm.joint(n="%s__%s__ibJoint" %(name,side) )
			off_gr = pm.group(n="%s__%s__offsetGroup" %(name,side) )
			rotWeight_gr = pm.group(n="%s__%s__rotWeightGroup" %(name,side) )
			pm.parent(rotWeight_gr, globalOffset_gr)
		
			j.addAttr("angleMin", k=1)
			j.addAttr("angleMax", k=1)
			j.addAttr("posMin", k=1)
			j.addAttr("posMax", k=1)
			j.angleMin.set(aMin)
			j.angleMax.set(aMax)
			j.posMin.set(pMin)
			j.posMax.set(pMax)	
			j.addAttr("rotationOffset", k=1)
		
			sr = pm.createNode( "setRange", n="%s__%s__ibSetRange" %(name,side) )
			a_reader.attr(inAttrName) >> sr.valueX
			sr.outValueX >> j.attr(outAttrName)
		
			j.posMin >> sr.minX
			j.posMax >> sr.maxX
		
			sr_mult_min = pm.createNode('multDoubleLinear', n="%s__%s__ibMinSrMult" %(name,side) )
			sr_mult_max = pm.createNode('multDoubleLinear', n="%s__%s__ibMaxSrMult" %(name,side) )
		
			j.angleMax >> sr_mult_max.input1
			sr_mult_max.input2.set(0.5)
			sr_mult_max.output >> sr.oldMaxX
		
			j.angleMin >> sr_mult_min.input1
			sr_mult_min.input2.set(0.5)
			sr_mult_min.output >> sr.oldMinX
			
			j.rotationOffset >> off_gr.attr(inAttrName)
			
			# current values
			j.addAttr("currentAngle", k=1)
			j.addAttr("currentPos", k=1)

			curAngle_mult = pm.createNode('multDoubleLinear', n="%s__%s__ibCurAngleMult" %(name,side) )
			curAngle_mult.input2.set(2)
			a_reader.attr(inAttrName) >> curAngle_mult.input1
			curAngle_mult.output >> j.currentAngle
			j.currentAngle.setLocked(1)
			
			sr.outValueX >> j.currentPos
			j.currentPos.setLocked(1)
			
			j.radius.set(cmds.getAttr(child_j+".radius"))
		
			pm.select(clear=1)
		
		addJoint(name, "front", 0, 90, 0.2, 2, "rz", "ty")
		addJoint(name, "right", -90, 0, 2, 0.2, "ry", "tz")
		addJoint(name, "back", -90, 0, -2, -0.2, "rz", "ty")
		addJoint(name, "left", 0, 90, -0.2, -2, "ry", "tz")
		
		pb = pm.createNode('pairBlend', n=name+"__ibPairBlend")
		drv.r >> pb.inRotate1
		pb.weight.set(0.5)
		pb.rotInterpolation.set(1)
		pb.outRotate >> gr.r
		
		ar_pb = pm.createNode('pairBlend', n=name+"__ibARPairBlend")
		drv.r >> ar_pb.inRotate1
		ar_pb.weight.set(0.5)
		ar_pb.rotInterpolation.set(1)
		ar_pb.outRotate >> a_reader.r
	
		p = cmds.listRelatives(child_j, p=1)[0]
		pm.parent(root, p)
		root.r.set(0,0,0)
		pm.connectAttr(child_j+".t", root.t)
		
		ch_l = pm.spaceLocator(n=name+"__ibChild")
		pm.parent(ch_l, drv)
		ch_l.t.set(0,0,0)
		ch_l.r.set(0,0,0)
		pm.parent(ch_l, child_j)
		pm.orientConstraint(ch_l, drv, mo=1)
		
		pm.addAttr(root, ln="rotationWeight", k=1, dv=0.5, minValue=0, maxValue=1)
		rev = pm.createNode('reverse', n="%s__ibRotationWeightRev" %name)
		root.rotationWeight >> rev.inputX
		rev.outputX >> pb.weight
		
		drv.hide()

		if parent_j != p:
			par_l = pm.spaceLocator(n=name+"__ibParent")
			pm.parent(par_l, drv)
			par_l.t.set(0,0,0)
			par_l.r.set(0,0,0)
			pm.parent(par_l, parent_j)
			pm.orientConstraint(par_l, root, mo=1)

		if child_j.split('_')[0] == 'l' and cmds.objExists(utils.getOppositeObject(child_j)):
			opp_name = ("r" + name[1:]).replace("__l_", "__r_")
			if not cmds.objExists(opp_name+"__ibRoot"):
				opp_data = {}
				opp_data["child"] = utils.getOppositeObject(child_j)
				opp_data["parent"] = utils.getOppositeObject(parent_j)
				
				self.add(opp_data)
				
				r_root = pm.PyNode(opp_data["child"]+"__"+opp_data["parent"]+"__ibRoot")
				root.rotationWeight >> r_root.rotationWeight

				# connect joints
				def connectOppJoint(name, side):
					mult1 = pm.createNode('multDoubleLinear', n="%s__%s__ibAngleMaxRevMult" %(name,side) )
					mult1.input2.set(-1)
					pm.connectAttr("%s__%s__ibJoint.angleMax" %(name,side), mult1.input1)
					pm.connectAttr(mult1.output, "%s__%s__ibJoint.angleMin" %(opp_name,side))
					
					mult2 = pm.createNode('multDoubleLinear', n="%s__%s__ibAngleMinRevMult" %(name,side) )
					mult2.input2.set(-1)
					pm.connectAttr("%s__%s__ibJoint.angleMin" %(name,side), mult2.input1)
					pm.connectAttr(mult2.output, "%s__%s__ibJoint.angleMax" %(opp_name,side))
					
					pm.connectAttr("%s__%s__ibJoint.posMax" %(name,side), "%s__%s__ibJoint.posMin" %(opp_name,side))
					pm.connectAttr("%s__%s__ibJoint.posMin" %(name,side), "%s__%s__ibJoint.posMax" %(opp_name,side))
										
					mult3 = pm.createNode('multDoubleLinear', n="%s__%s__ibRotationOffsetRevMult" %(name,side) )
					mult3.input2.set(-1)
					pm.connectAttr("%s__%s__ibJoint.rotationOffset" %(name,side), mult3.input1)
					pm.connectAttr(mult3.output, "%s__%s__ibJoint.rotationOffset" %(opp_name,side))					
					
				connectOppJoint(name, "front")
				connectOppJoint(name, "back")
				connectOppJoint(name, "left")
				connectOppJoint(name, "right")

		cmds.setAttr(name+"__ibChild.v", False)
		
		self.updateList()		

		if not data:
			pm.select(root)
		
		# select item in list
		self.selectListItem(name)

		debugEnd(traceback.extract_stack()[-1][2])		

	def remove(self, name=""):
		debugStart(traceback.extract_stack()[-1][2])

		if self.win.ibtw_childs_listWidget.count() == 0:
			return
		
		if name == "" or name == False:
			if name == None:
				return
			if not self.win.ibtw_childs_listWidget.currentItem():
				return
			item_name = self.win.ibtw_childs_listWidget.currentItem().text()
			name = item_name.replace(" - ", "__")
		else:
			item_name = name.replace("__", " - ")
			
		item = self.win.ibtw_childs_listWidget.findItems(item_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
		self.win.ibtw_childs_listWidget.removeItemWidget(item)		

		opp_name = ("r" + name[1:]).replace("__l_", "__r_")
		if name != opp_name and cmds.objExists(opp_name+'__ibRoot'):
			cmds.delete(opp_name + '__ibRoot')
			cmds.delete(opp_name + '__ibChild')
			if cmds.objExists(opp_name + '__ibParent'):
				cmds.delete(opp_name + '__ibParent')			

		cmds.delete(name + '__ibRoot')
		cmds.delete(name + '__ibChild')
		if cmds.objExists(name + '__ibParent'):
			cmds.delete(name + '__ibParent')

		self.curIbName = ''

		self.updateList()

		debugEnd(traceback.extract_stack()[-1][2])		

	def setParent(self):
		debugStart(traceback.extract_stack()[-1][2])
		
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
			
		debugEnd(traceback.extract_stack()[-1][2])	

	def resetParent(self):
		debugStart(traceback.extract_stack()[-1][2])
		
		name = self.curIbName
		sel = cmds.ls(sl=1)

		child = self.curIb['child']
		
		self.remove(self.curIbName)
		
		data = {}
		data["child"] = child
		data["parent"] = cmds.listRelatives(child, p=1)[0]
		self.add(data)
		
		self.selectListItem(self.curIbName)

		self.updateFrame()

		if len(sel) > 0:
			cmds.select(sel)
			
		debugEnd(traceback.extract_stack()[-1][2])	

	def ib_selectRoot(self):
		debugStart(traceback.extract_stack()[-1][2])

		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")

		cmds.select(name + '__ibRoot')

	def ib_selectOffsetLocators(self, side=""):
		debugStart(traceback.extract_stack()[-1][2])

		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")

		cmds.select(clear=1)
		
		if side != "l":
			opp_name = ("r" + name[1:]).replace("__l_", "__r_")
			if cmds.objExists(opp_name + '__ibChild'):
				cmds.select(opp_name + '__ibChild', opp_name + '__ibRoot')
		
		if side != "r":
			cmds.select(name + '__ibChild', name + '__ibRoot', add=1)
			
	def selectJoint(self, side):
		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")		
		
		cmds.select("%s__%s__ibJoint" %(name, side) )
			
	def switchJoint(self, side, w):
		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")		
		
		v = w.isChecked()
		
		cmds.setAttr("%s__%s__ibJoint.visibility" %(name, side), v)
			
	def isLocal(self, name, side):
		gr = pm.PyNode("%s__%s__rotWeightGroup" %(name,side) )
		root = gr.getParent()	
		if root.name() == "%s__ibRotationOffsetGroup" %name:
			return False
		else:
			return True
			
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
		
	def switchOffsetLocators(self):
		item_name = self.win.ibtw_childs_listWidget.currentItem().text()
		name = item_name.replace(" - ", "__")
		
		v = cmds.getAttr(name+"__ibChild.v")
		cmds.setAttr(name+"__ibChild.v", not v)
		
		opp = utils.getOppositeObject(name+"__ibChild").replace("_l_", "_r_")
		#print cmds.objExists(opp), opp
		if cmds.objExists(opp):
			cmds.setAttr(opp+".v", not v)