import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import logging, traceback, os, imp, math, json, sys

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
try:
	from shiboken import wrapInstance
except:
	from shiboken2 import wrapInstance

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

class HumanIk(object):
	def __init__(self, main):
		debugStart(traceback.extract_stack()[-1][2])
		self.main = main
		self.win = main.humanIkWin

		self.connect()
		
		moduleNames = [""]
		for m in main.rig.moduleNames:
			if m.split("_")[0] != "r":
				moduleNames.append(m)
		moduleNames = sorted(moduleNames)
				
		self.win.head_comboBox.addItems(moduleNames)
		self.win.neck_comboBox.addItems(moduleNames)
		self.win.spine_comboBox.addItems(moduleNames)
		self.win.clav_comboBox.addItems(moduleNames)
		self.win.arm_comboBox.addItems(moduleNames)
		self.win.hand_comboBox.addItems(moduleNames)
		self.win.leg_comboBox.addItems(moduleNames)
		self.win.foot_comboBox.addItems(moduleNames)
		
		
		for i, n in enumerate(moduleNames):
			if "head" in n.lower():
				self.win.head_comboBox.setCurrentIndex(i)
			elif "neck" in n.lower():
				self.win.neck_comboBox.setCurrentIndex(i)
			elif "spine" in n.lower():
				self.win.spine_comboBox.setCurrentIndex(i)
			elif "clavicle" in n.lower() or "shoulder" in n.lower():
				self.win.clav_comboBox.setCurrentIndex(i)
			elif "arm" in n.lower():
				self.win.arm_comboBox.setCurrentIndex(i)
			elif "hand" in n.lower():
				self.win.hand_comboBox.setCurrentIndex(i)
			elif "leg" in n.lower():
				self.win.leg_comboBox.setCurrentIndex(i)
			elif "foot" in n.lower():
				self.win.foot_comboBox.setCurrentIndex(i)
		
		
		debugEnd(traceback.extract_stack()[-1][2])

	def connect(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.win.apply_btn.clicked.connect(self.createDefinition)


		debugEnd(traceback.extract_stack()[-1][2])

	def createJointsDefinition(self):
		
		def getRootJoint(m_name, int_name):
			c_name = utils.getRealNameFromDataName(int_name, m_name)
			if cmds.objExists(c_name):
				j_name = c_name + "_" + int_name + "_joint"
			else:
				j_name = m_name + "_" + int_name + "_joint"

			if cmds.objExists(j_name):
				return j_name
			else:
				return False
			
		# head
		j = getRootJoint(self.win.head_comboBox.currentText(), "root")
		if j:
			mel.eval('setCharacterObject("%s","Character1",15,0);' %j)
		
		# neck
		j = getRootJoint(self.win.neck_comboBox.currentText(), "root")
		if j:
			mel.eval('setCharacterObject("%s","Character1",20,0);' %j)
		
		# spine
		j = getRootJoint(self.win.spine_comboBox.currentText(), "root")
		if j:
			mel.eval('setCharacterObject("%s","Character1",1,0);' %j)
		j = getRootJoint(self.win.spine_comboBox.currentText(), "local_1")
		if j:
			mel.eval('setCharacterObject("%s","Character1",8,0);' %j)
		j = getRootJoint(self.win.spine_comboBox.currentText(), "local_2")
		if j:
			mel.eval('setCharacterObject("%s","Character1",23,0);' %j)
		j = getRootJoint(self.win.spine_comboBox.currentText(), "local_3")
		if j:
			mel.eval('setCharacterObject("%s","Character1",24,0);' %j)
		j = getRootJoint(self.win.spine_comboBox.currentText(), "local_4")
		if j:
			mel.eval('setCharacterObject("%s","Character1",25,0);' %j)
		j = getRootJoint(self.win.spine_comboBox.currentText(), "local_5")
		if j:
			mel.eval('setCharacterObject("%s","Character1",26,0);' %j)
		j = getRootJoint(self.win.spine_comboBox.currentText(), "end")
		if j:
			mel.eval('setCharacterObject("%s","Character1",27,0);' %j)
		
		# shoulders
		l_j = getRootJoint(self.win.clav_comboBox.currentText(), "root")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",18,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",19,0);' %r_j)
		
		# arms
		l_j = getRootJoint(self.win.arm_comboBox.currentText(), "root")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",9,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",12,0);' %r_j)
		
		# elbow
		l_j = getRootJoint(self.win.arm_comboBox.currentText(), "middle")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",10,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",13,0);' %r_j)
		
		# hand
		l_j = getRootJoint(self.win.hand_comboBox.currentText(), "root")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",11,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",14,0);' %r_j)
			
		# leg
		l_j = getRootJoint(self.win.leg_comboBox.currentText(), "root")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",2,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",5,0);' %r_j)
		
		# knee
		l_j = getRootJoint(self.win.leg_comboBox.currentText(), "middle")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",3,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",6,0);' %r_j)
		
		# foot
		l_j = getRootJoint(self.win.foot_comboBox.currentText(), "root")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",4,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",7,0);' %r_j)
		
		# toe
		l_j = getRootJoint(self.win.foot_comboBox.currentText(), "toe")
		if l_j:
			r_j = utils.getOppositeObject(l_j)
			mel.eval('setCharacterObject("%s","Character1",16,0);' %l_j)
			mel.eval('setCharacterObject("%s","Character1",17,0);' %r_j)
		
	def createControlDefinition(self):
			
		# head
		c = utils.getControlNameFromInternal(self.win.head_comboBox.currentText(), "root")
		if cmds.objExists(c):
			cmds.select(c)
			mel.eval('hikCustomRigAssignEffector 15')	
			
		# spine
		c = utils.getControlNameFromInternal(self.win.spine_comboBox.currentText(), "pelvis")
		
		if cmds.objExists(c):
			cmds.select(c)
			mel.eval('hikCustomRigAssignEffector 1')	
		c = utils.getControlNameFromInternal(self.win.spine_comboBox.currentText(), "stomach")
		if cmds.objExists(c):
			cmds.select(c)
			mel.eval('hikCustomRigAssignEffector 8')	
		c = utils.getControlNameFromInternal(self.win.spine_comboBox.currentText(), "chest")
		if cmds.objExists(c):
			cmds.select(c)
			mel.eval('hikCustomRigAssignEffector 1000')	
		
		# neck
		c = utils.getControlNameFromInternal(self.win.neck_comboBox.currentText(), "root")
		if cmds.objExists(c):
			cmds.select(c)
			mel.eval('hikCustomRigAssignEffector 20')		
		
		# clavicle
		l_c = utils.getControlNameFromInternal(self.win.clav_comboBox.currentText(), "root")
		r_c = utils.getOppositeObject(l_c)
		if cmds.objExists(l_c):
			cmds.select(l_c)
			mel.eval('hikCustomRigAssignEffector 18')		
			cmds.select(r_c)
			mel.eval('hikCustomRigAssignEffector 19')		
		
		# arm_fk
		l_c = utils.getControlNameFromInternal(self.win.arm_comboBox.currentText(), "fk_a")
		r_c = utils.getOppositeObject(l_c)
		if cmds.objExists(l_c):
			cmds.select(l_c)
			mel.eval('hikCustomRigAssignEffector 9')		
			cmds.select(r_c)
			mel.eval('hikCustomRigAssignEffector 12')		
		l_c = utils.getControlNameFromInternal(self.win.arm_comboBox.currentText(), "fk_b")
		r_c = utils.getOppositeObject(l_c)
		if cmds.objExists(l_c):
			cmds.setAttr(l_c+".rx", l=False, k=True)
			cmds.setAttr(l_c+".rz", l=False, k=True)
			cmds.setAttr(r_c+".rx", l=False, k=True)
			cmds.setAttr(r_c+".rz", l=False, k=True)
			cmds.select(l_c)
			mel.eval('hikCustomRigAssignEffector 10')		
			cmds.select(r_c)
			mel.eval('hikCustomRigAssignEffector 13')		
		l_c = utils.getControlNameFromInternal(self.win.arm_comboBox.currentText(), "fk_end")
		r_c = utils.getOppositeObject(l_c)
		if cmds.objExists(l_c):
			cmds.select(l_c)
			mel.eval('hikCustomRigAssignEffector 11')		
			cmds.select(r_c)
			mel.eval('hikCustomRigAssignEffector 14')		
		
		# knee_ik
		l_c = utils.getControlNameFromInternal(self.win.leg_comboBox.currentText(), "ik_aim")
		r_c = utils.getOppositeObject(l_c)
		if cmds.objExists(l_c):
			cmds.select(l_c)
			mel.eval('hikCustomRigAssignEffector 3')		
			cmds.select(r_c)
			mel.eval('hikCustomRigAssignEffector 6')	
			
		# foot_ik
		l_c = utils.getControlNameFromInternal(self.win.foot_comboBox.currentText(), "foot")
		r_c = utils.getOppositeObject(l_c)
		if cmds.objExists(l_c):
			cmds.select(l_c)
			mel.eval('hikCustomRigAssignEffector 4')		
			cmds.select(r_c)
			mel.eval('hikCustomRigAssignEffector 7')		


	def createDefinition(self):
		mel.eval("HIKCharacterControlsTool")
		
		char_nodes = cmds.ls(type="HIKCharacterNode")
		if len(char_nodes) == 0:
			mel.eval("hikCreateDefinition")
		
		char_nodes = cmds.ls(type="HIKCharacterNode")
		char_node = char_nodes[0]
		
		self.createJointsDefinition()
		
		rig_nodes = cmds.ls(type="CustomRigRetargeterNode")
		if len(rig_nodes) == 0:
			mel.eval('hikCreateCustomRig( hikGetCurrentCharacter() )')
		
		self.createControlDefinition()
		
		
