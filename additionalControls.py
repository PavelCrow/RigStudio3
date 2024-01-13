import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
import utils, main, controller
from functools import partial
import logging, traceback, os, imp, math, types
reload(utils)

from Qt import QtWidgets, QtGui, QtCore, QtUiTools
try: from shiboken import wrapInstance
except: from shiboken2 import wrapInstance

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.setLevel(logging.DEBUG)

rootDebug = ""
fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])

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


class AdditionalControls(object):
	def __init__(self):
		debugStart(traceback.extract_stack()[-1][2])
		print '!!!!'
		debugEnd(traceback.extract_stack()[-1][2])


	def create_control(self, name="temp", parent="", shape='circle', colorId=18, data={}):
		debugStart(traceback.extract_stack()[-1][2])

		# create control
		self.curAddControl = controller.Control()
		self.curAddControl.create(name, shape, colorId, True, True, True)
		utils.setUserAttr(name, 'type', 'additionalControl')

		# add modulename attr
		par_moduleName = utils.getModuleNameFromAttr(parent)
		for o in cmds.listRelatives(self.curAddControl.root, allDescendents=1):
			utils.addModuleNameAttr(o, par_moduleName)
		utils.addModuleNameAttr(self.curAddControl.root, par_moduleName)

		# add GSJ joint
		j = cmds.duplicate(name+'_outJoint', n=name+'_joint')[0]
		cmds.hide(name+'_outJoint')

		src_mod_name = utils.getModuleNameFromAttr(parent)
		#src_mod = utils.getModuleInstance(src_mod_name)
		cmds.parent(j, src_mod_name+"_root_joint")

		utils.connectByMatrix(j, [name, j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], src_mod_name)

		# parent
		cmds.parent(name+'_tuner', parent)
		utils.resetAttrs(name+'_tuner')

		cmds.select(name+'_tuner')
		
		return
		# update variables
		self.addControlsNames.append(name)
		self.addControls.append(self.curAddControl)
		self.curAddControlName = name

		self.addControls_updateTree()		
		cmds.select(self.curAddControl.root)

		debugEnd(traceback.extract_stack()[-1][2])	

	def connect(self):
		debugStart(traceback.extract_stack()[-1][2])
		print 222
		self.win.addControlSetParent_btn.clicked.connect(self.addControls_setParent)
		self.win.renameAddControl_btn.clicked.connect(self.addControls_renameControl)
		self.win.addControlSymmetry_btn.clicked.connect(self.makeSymmetry)
		self.win.addFlipOpposite_btn.clicked.connect(self.flipOpposite)
		self.win.addControlDelete_btn.clicked.connect(self.addControls_deleteControl)
	
		self.win.addControls_treeWidget.currentItemChanged.connect(self.addControls_updatePage)
		self.win.addControls_treeWidget.itemDoubleClicked.connect(self.addControls_selectRoot)

		self.win.selectMoveGroup_btn.clicked.connect(self.addControls_selectRoot)

		debugEnd(traceback.extract_stack()[-1][2])

	def addControls_updateTree(self):
		debugStart(traceback.extract_stack()[-1][2])

		# update controls data
		self.getAddControls()
		
		tempName = self.curAddControlName

		# clear old data
		self.win.addControls_treeWidget.clear()

		if self.addControlsNames == []: return

		# fill modules list widget
		for name in self.addControlsNames:
			
			for m in self.addControls:
				if m.name == name:
					deep = m.deep	
					break
			#print name, deep
			if m.parent == "":
				item = QtWidgets.QTreeWidgetItem([name])
				self.win.addControls_treeWidget.addTopLevelItem(item)
				
			elif int(m.deep) == 0:
				parents = self.win.addControls_treeWidget.findItems(m.parent, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0) or []
				if len(parents) > 0:
					parent_item = parents[0]	
				else:	
					parent_item = QtWidgets.QTreeWidgetItem([m.parent])
					self.win.addControls_treeWidget.addTopLevelItem(parent_item)
					parent_item.setForeground(0,QtGui.QBrush(QtGui.QColor("#6C6B6B")))
					
				item = QtWidgets.QTreeWidgetItem([name])
				parent_item.addChild(item)

			else:
				parents = self.win.addControls_treeWidget.findItems(m.parent, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0) or []
				if len(parents) > 0:
					parent = parents[0]
					item = QtWidgets.QTreeWidgetItem([name])
					parent.addChild(item)
					
			if m.isMirrored():
				item.setForeground(0,QtGui.QBrush(QtGui.QColor("#6C6B6B")))


		# if current module is exist, get this item and select it, or disable module page
		self.curAddControlName = tempName
		try:
			oldCurItem = self.win.addControls_treeWidget.findItems(self.curAddControlName,QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
			self.win.addControls_treeWidget.setCurrentItem(oldCurItem)
		except: pass #self.win.module_frame.setEnabled(False)

		self.win.addControls_treeWidget.expandAll()

		debugEnd(traceback.extract_stack()[-1][2])		

	def addControls_selectRoot(self):
		debugStart(traceback.extract_stack()[-1][2])
		
		if self.curAddControl != None:
			cmds.select(self.curAddControl.root)

		debugEnd(traceback.extract_stack()[-1][2])		

	def addControls_updatePage(self, nameOrItem):
		debugStart(traceback.extract_stack()[-1][2])

		if type(nameOrItem) is types.NoneType:
			return

		# name
		if type(nameOrItem) is QtWidgets.QTreeWidgetItem:
			self.curAddControlName = nameOrItem.text(0)
		else:
			self.curAddControlName = nameOrItem		
		
		self.curAddControl = self.getAddCtrlInstance(self.curAddControlName)

		# update attrs
		if self.curAddControl == None or self.curAddControl.isMirrored():
			self.win.curAddControlFrame.setEnabled(False)
		else:
			self.win.curAddControlFrame.setEnabled(True)
			self.win.addControlName_lineEdit.setText(self.curAddControl.name)
			self.win.addControlParent_lineEdit.setText(self.curAddControl.parent)

		#if cmds.objExists(self.curAddControlName):
			#cmds.select(self.curAddControlName)
		debugEnd(traceback.extract_stack()[-1][2])		

	def makeSymmetry(self, control=""):
		if control == "":
			control = self.curAddControl
		
		# get parent symmetry add control
		opp_par = utils.getOppositeObject(control.parent)
		if control.parent == opp_par:
			commonParent = True
		else:
			commonParent = False
			
		# rename if needed
		if not control.name.split('_')[0] == 'l':
			newName = 'l_' + control.name
			while cmds.objExists(newName):
				newName = utils.incrementName(newName)
			control.rename(newName)
		
		# get cur addControl data 
		data = control.getData()
		source_root = data['root']

		# set opp data
		data['name'] = utils.getOppositeObject(data['name'])
		data['root'] = utils.getOppositeObject(data['root'])
		data['parent'] = utils.getOppositeObject(data['parent'])
		#print data['name'], data['root'], data['parent']
		
		# add opp add control
		self.create_control(data=data)		
		
		# set shape
		self.curAddControl.replaceShape(data['shape'])
		
		# connect tuner attributes
		if commonParent:
			comp = cmds.createNode('composeMatrix', n=self.curAddControl.root+'_compMat')
			cmds.setAttr(comp+'.inputScaleX', -1)
			utils.connectByMatrix(self.curAddControl.root, [source_root, source_root, comp], ['worldMatrix[0]', 'parentInverseMatrix[0]', 'outputMatrix'])
		else:
			cmds.connectAttr(source_root+'.tx', self.curAddControl.root+'.tx')
			cmds.connectAttr(source_root+'.ty', self.curAddControl.root+'.ty')
			cmds.connectAttr(source_root+'.tz', self.curAddControl.root+'.tz')
			cmds.connectAttr(source_root+'.rx', self.curAddControl.root+'.rx')
			cmds.connectAttr(source_root+'.ry', self.curAddControl.root+'.ry')
			cmds.connectAttr(source_root+'.rz', self.curAddControl.root+'.rz')
			cmds.connectAttr(source_root+'.sx', self.curAddControl.root+'.sx')
			cmds.connectAttr(source_root+'.sy', self.curAddControl.root+'.sy')
			cmds.connectAttr(source_root+'.sz', self.curAddControl.root+'.sz')
		
		# connect shapes
		curveShapes = cmds.listRelatives(self.curAddControl.name, children = True, path=True, type = 'nurbsCurve')
		for c in curveShapes:
			opp_c = utils.getOppositeObject(c)
			cmds.connectAttr(opp_c+".worldSpace[0]", c+".create")

		self.addControls_updateTree()					
		
		# select left control in addControls tree
		newCurItem = self.win.addControls_treeWidget.findItems(utils.getOppositeObject(self.curAddControl.name),QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
		self.win.addControls_treeWidget.setCurrentItem(newCurItem)			
		
		cmds.select(source_root)
		
	def flipOpposite(self, control=""):
		print 111
		if control == "":
			control = self.curAddControl
			
		opp_par = utils.getOppositeObject(control)
		
		print control
		print opp_par
		
	def addControls_setParent(self, control="", target="", resetPos=False):
		debugStart(traceback.extract_stack()[-1][2])
		
		if target == "":
			sel = cmds.ls(sl=True)
			try:
				target = sel[0]	
			except:
				target = ""
						
		if control == "":
			control = self.curAddControl
		
		#print "!", control.name, control.root, target
		parents = cmds.listRelatives(control.root, parent=1) or []
		#print control.name, control.root, parents
		if target == "":
			if cmds.objExists('addControls'):
				cmds.parent(control.root, 'addControls')
			else:
				return
		elif len(parents) > 0:
			p = parents[0]
			#print "!!!!", p, target
			if p != target:
				cmds.parent(control.root, target)
		else:
			cmds.parent(control.root, target)
			
		control.parent = target
		
		# add joint to sceleton		
		controlName = control.root		
		par_moduleName = utils.getModuleNameFromAttr(target)		
		
		def getClosestSkinJoint(src_object):
			src_mod = utils.getModuleNameFromAttr(src_object)
			
			allJoints = cmds.ls('*_GSJ')
			closest_distance = 10000000
			closest_joint = ""
			#print "------------- ", src_object
			for jnt in allJoints:
				if utils.getModuleNameFromAttr(jnt) == par_moduleName and jnt != controlName+'_GSJ':
					pos1 = cmds.xform(src_object, query=True, translation=True, worldSpace=True)
					pos2 = cmds.xform(jnt, query=True, translation=True, worldSpace=True)
					distance = math.sqrt( math.pow((pos1[0]-pos2[0]),2) + math.pow((pos1[1]-pos2[1]),2) + math.pow((pos1[2]-pos2[2]),2))				
					#print src_object, pos1, jnt, pos2, distance
					if distance < closest_distance:
						closest_distance = distance
						closest_joint = jnt
			return closest_joint
		
		if self.win.addControlJoint_checkBox.isChecked():
			j = control.name+'_GSJ'
			
			if target == "":
				cmds.parent(control.name+'_GSJ', 'skeleton')
			else:
				src_mod_name = utils.getModuleNameFromAttr(target)
				#src_mod = utils.getModuleInstance(src_mod_name)
				src_jnt = getClosestSkinJoint(target)
				#print "AA", j, src_jnt
				
				cur_par = cmds.listRelatives(j, p=1)[0]
				#print "AA", j, cur_par, src_jnt
				if src_jnt != cur_par:
					cmds.parent(j, src_jnt)
				
			
			# remove transform gr
			p = cmds.listRelatives(j, parent=1)[0]
			if 'transform' in p:
				utils.resetAttrs(p)
				cmds.parent(j, src_jnt)
				#print "PARENT ", j, src_jnt
				cmds.delete(p)				
				
				
		if resetPos:
			utils.resetAttrs(control.root)

		self.addControls_updateTree()
		self.addControls_updatePage(self.curAddControlName)

		#if len(sel) > 0:
			#cmds.select(sel)
		#else:
			#cmds.select(clear=1)
		cmds.select(control.root)

		debugEnd(traceback.extract_stack()[-1][2])		

	def fixJointsParents(self):
		
		for c in self.addControls:
			#print c.name, c.parent
			try:
				self.addControls_setParent(control=c, target=c.parent)
			except: pass

	def addControls_renameControl(self, newName="", moduleName=""):
		debugStart(traceback.extract_stack()[-1][2])

		if newName == "":
			newName, ok = QtWidgets.QInputDialog().getText(self.win, 'Rename Add Control', 'Enter control name:', QtWidgets.QLineEdit.Normal, self.curAddControlName)

		# remove spaces
		if ok and newName != "":
			newName = newName.replace(" ", "_")
			renameMirror = True
		else:
			return
		
		# add left side prefix
		if self.curAddControl.isSymmetry():
			if newName.split('_')[0] != 'l':
				newName = 'l_' + newName

		# rename
		self.curAddControl.rename(newName)
		self.addControls_updateTree()

		# select in tree
		try:
			newCurItem = self.win.addControls_treeWidget.findItems(newName,QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
			self.win.addControls_treeWidget.setCurrentItem(newCurItem)				
		except: pass

		debugEnd(traceback.extract_stack()[-1][2])		

	def addControls_deleteControl(self):
		debugStart(traceback.extract_stack()[-1][2])

		cmds.delete(self.curAddControl.root)
		
		if cmds.objExists(self.curAddControl.name+'_GSJ'):
			cmds.delete(self.curAddControl.name+'_GSJ')

		opp_obj = utils.getOppositeObject(self.curAddControl.root)
		if cmds.objExists(opp_obj):
			cmds.delete(opp_obj)
			if cmds.objExists(utils.getOppositeObject(self.curAddControl.name+'_GSJ')):
				cmds.delete(utils.getOppositeObject(self.curAddControl.name+'_GSJ'))			

		self.addControls_updateTree()

		debugEnd(traceback.extract_stack()[-1][2])		

	def getAddControls(self):
		self.addControlsNames = []
		self.addControls = []
		nodes = cmds.ls(type='transform')
		
		for n in nodes:
			if cmds.attributeQuery( 'type', node=n, exists=True ):
				if cmds.getAttr(n+'.type') == 'additionalControl':
					self.addControlsNames.append(n)
					c = utils.getControlInstance(n)
					self.addControls.append(c)						
			
		# get list deeps and names for sorting
		m_list = []
		for m in self.addControls:
			m.getParent()

		for m in self.addControls:
			deep = 0
			parent = m.parent
			#print m.name, parent
			
			if cmds.objExists(parent+'.type') and cmds.getAttr(parent+'.type') == 'additionalControl' and parent != "":
				#print 'parent is add ctrl'
				for m_2 in self.addControls:
					if parent == m_2.name:
						par_m = m_2
						break
				parent = par_m.parent
				deep += 1
			
			m.deep = deep
			m_list.append([deep, m.name])	
	
		# save sorted list
		self.addControlsNames = []
		for deep, name in sorted(m_list):
			self.addControlsNames.append(name)
				
	def getAddCtrlInstance(self, name):
		for m in self.addControls:
			if m.name == name:
				return m	
		return None
	
	def switchChannel(self, ch):
		sel = cmds.ls(sl=1)
		if len(sel) == 0:
			return
		obj = sel[0]
		
		attrList = cmds.listAttr(obj, keyable=True)
		hidden = ch+'X' in attrList
		
		cmds.setAttr(obj+'.'+ch+'X', keyable=not hidden)
		cmds.setAttr(obj+'.'+ch+'Y', keyable=not hidden)
		cmds.setAttr(obj+'.'+ch+'Z', keyable=not hidden)
		cmds.setAttr(obj+'.'+ch+'X', lock=hidden)
		cmds.setAttr(obj+'.'+ch+'Y', lock=hidden)
		cmds.setAttr(obj+'.'+ch+'Z', lock=hidden)
		
		cmds.setAttr(obj+'.v', lock=1)
		cmds.setAttr(obj+'.v', keyable=0)
