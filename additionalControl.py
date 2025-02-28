import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial

from .import utils, controller, posers, rigTools

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance


def oneStepUndo(func):
	def wrapper(*args, **kwargs):
		cmds.undoInfo(openChunk=True)
		func(*args, **kwargs)
		cmds.undoInfo(closeChunk=True)
	return wrapper


class AdditionalControl(controller.Control):
	def __init__(self, name="", parent="", shape="", data={}):
		if name != "":
			self.name = name
			self.parent = parent.replace("outJoint", "skinJoint")
			self.poserParent = ""
			self.colorId = 18
			self.symmetrical = False
			self.opposite = False			
			self.create(shape)
		elif data != {}:
			self.name = data['name']
			self.parent = data['parent'].replace("outJoint", "skinJoint")
			self.poserParent = data['poserParent']
			self.colorId = data['colorId']		
			self.symmetrical = False
			self.opposite = data['opposite']	
			self.create(shape)

	def create(self, shape='circle'): #
		par_moduleName = utils.getModuleName(self.parent)

		# create control
		super(self.__class__, self).create(self.name, shape, self.colorId, offset=True, joint=True)
		utils.setUserAttr(self.name, 'type', 'additionalControl')

		# add ctr joint
		j = cmds.duplicate(self.name+'_outJoint', n=self.name+'_skinJoint')[0]
		cmds.setAttr(j+".segmentScaleCompensate", 0)	

		if not cmds.getAttr("main.jointsVis"):
			cmds.setAttr(self.name+'_outJoint.drawStyle', 2)
		
		# add outJoint to set
		cmds.sets(self.name+'_outJoint', e=1, forceElement=par_moduleName+'_skinJointsSet')
		
		# joint size
		jointsSize = cmds.getAttr('main.jointsSize')
		cmds.setAttr(j+".radius", jointsSize)

		cmds.connectAttr(self.name+".sx", self.name+'_skinJoint.sx', f=1)			
		cmds.connectAttr(self.name+".sy", self.name+'_skinJoint.sy', f=1)			
		cmds.connectAttr(self.name+".sz", self.name+'_skinJoint.sz', f=1)			

		# add addPoser
		posers.createAddPoser(self.name, par_moduleName)
		poser = self.name+"_addPoser"
		t = cmds.xform(self.parent, q=1, t=1, ws=1)
		cmds.xform(poser, t=t, ws=1)
		
		# lock visibility attribute
		utils.lockChannels(self.name, channels=[])
		
		self.setParent(self.parent)
		
		cmds.select(poser)

	def load(self, name): 
		self.name = name

		# get color id
		sh = cmds.listRelatives(self.name, s=1)[0]
		self.colorId = cmds.getAttr(sh+".overrideColor")

		self.getParent()
		self.symmetrical = self.isSymmetry()
		self.opposite = self.isOpposite()
		self.deep = 0

	def setParent(self, target):
		# print(3333, "SETPARENT", self.name, target)
		# variables
		if not utils.objectIsControl(target) and not utils.objectIsAdditionalControl(target) and target.split("_")[-1] != "skinJoint" and target.split("_")[-1] != "outJoint":
			cmds.warning("Select one control or joint")
			return

		name = self.name
		old_moduleName = utils.getModuleName(name)
		par_moduleName = utils.getModuleName(target)
		isControl = cmds.objExists(target+".type") and cmds.getAttr(target+".type") == "control"
		closestJoint = False
		parentIsJoint = cmds.objectType(target) == "joint"

		if parentIsJoint:
			target_j = target
			# if joint is simple, set target as control
			par_ = cmds.listRelatives(target_j.replace("skinJoint", "outJoint"), p=1)[0]
			if utils.objectIsAdditionalControl(par_) or utils.objectIsControl(par_):
				target = par_
				parentIsJoint = False
		else:
			target_j = target + '_skinJoint'
			if not cmds.objExists(target_j):
				target_j = utils.getClosestJoint(par_moduleName, target)
				closestJoint = True
		
		parent_out_j = target_j.replace("skinJoint", "outJoint")
		parent_j = target_j.replace("outJoint", "skinJoint")
		poser = name+"_addPoser"
		group = name+'_group'
		joint =  name+'_skinJoint'
		
		parent_initLoc = target_j.replace("skinJoint", "initLoc").replace("outJoint", "initLoc")
		if closestJoint:
			n = utils.getInternalNameFromControl(target)
			parent_initLoc = par_moduleName + "_" + n + "_initLoc"
		
		pars_ = cmds.listRelatives(group, p=1)
		if pars_ and pars_[0] == target:
			cmds.warning("Control already have this parent")
			return
		
		self.parent = target

		# parent control group
		if parentIsJoint:
			cmds.parent(group, parent_out_j)
		else:
			cmds.parent(group, target)
		
		
		# parent poser
		if cmds.objectType(target) == "joint":
			tar = target.split("_skinJoint")[0].split("_outJoint")[0]
		else:
			tar = target
		
		if cmds.objExists(tar+"_addPoser"):
			par_p = tar+"_addPoser"
		elif cmds.objExists(tar+"_poser"):
			par_p = tar+"_poser"
		elif cmds.objExists(tar+"_initLoc"):
			par_p = tar+"_initLoc"
			cmds.showHidden(par_p)
			cmds.hide(par_p+"Shape")
		elif isControl:
			n = utils.getInternalNameFromControl(tar)
			par_p = par_moduleName+"_"+n+"_initLoc"
			cmds.showHidden(par_p)
			cmds.hide(par_p+"Shape")
		else:
			par_p = par_moduleName + "_root_mainPoser"

		if cmds.listRelatives(poser, p=1)[0] != par_p:
			cmds.parent(poser, par_p)
			
		# create connection line
		crv = name+"_connectionCrv"
		if not cmds.objExists(crv):
			cmds.curve(n=crv, d=1, p=[(0,0,0), (0,0,0)])
			cmds.sets(crv, e=1, forceElement=par_moduleName+'_nodesSet')
			cmds.connectAttr(poser.replace("addPoser", "initLocShape")+".worldPosition[0]", crv+".controlPoints[1]", f=1)
		par_initLocShape = par_p.replace("addPoser", "initLocShape").replace("poser", "initLocShape")
		cmds.connectAttr(par_initLocShape+".worldPosition[0]", crv+".controlPoints[0]", f=1)
					
		try: cmds.parent(crv, par_p)
		except: pass
		cmds.setAttr(crv+".inheritsTransform", 0)
		utils.resetAttrs(crv)
		cmds.setAttr(crv+".overrideEnabled", 1)
		cmds.setAttr(crv+".overrideDisplayType", 2)
				
		# add joint to sceleton
		if cmds.listRelatives(joint, p=1)[0] != target_j:
			cmds.parent(joint, parent_j)
			utils.removeTransformParentJoint(joint)
			utils.resetJointOrient(joint)

		
		# delete old connection nodes
		if cmds.objExists(name+"_group_multMat"):
			cmds.delete(name+"_group_multMat")
		if cmds.objExists(joint+"_multMat"):
			cmds.delete(joint+"_multMat")

		# control group connection
		utils.connectByMatrix(group, [poser, parent_initLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'])

		# connect joint by local matrixes if parent is addControl
		if utils.objectIsAdditionalControl(self.parent):
			# local connect joint from control and control group
			if self.opposite and utils.objectIsOpposite(self.parent):
				compMat = cmds.createNode('composeMatrix', n=name+'_composeMatrix')
				cmds.setAttr(compMat+".inputScaleZ", -1)
				utils.connectByMatrix(joint, [name, group, compMat], ['matrix', 'matrix', 'outputMatrix'], par_moduleName)
			else:
				utils.connectByMatrix(joint, [name, group], ['matrix', 'matrix'], par_moduleName)
			
			mult_t = cmds.createNode('multiplyDivide', n=name+'_correctTranslateMult')
			cmds.connectAttr(joint+"_decMat.outputTranslate", mult_t+'.input1')			

			dMat = cmds.createNode('decomposeMatrix', n=name+"_correctTranslateDecMat")
			cmds.connectAttr(target+"_addPoser.worldMatrix[0]", dMat+'.inputMatrix')
			cmds.connectAttr(dMat+".outputScaleX", mult_t+'.input2X')
			cmds.connectAttr(dMat+".outputScaleX", mult_t+'.input2Y')
			cmds.connectAttr(dMat+".outputScaleX", mult_t+'.input2Z')
			
			cmds.connectAttr(mult_t+".outputX", joint+'.tx', f=1)
			cmds.connectAttr(mult_t+".outputY", joint+'.ty', f=1)
			cmds.connectAttr(mult_t+".outputZ", joint+'.tz', f=1)

		# connect joint by world matrixes
		else:
			utils.connectByMatrix(joint, [self.name, joint], ['worldMatrix[0]', 'parentInverseMatrix[0]'], par_moduleName)

		cmds.connectAttr(self.name+".sx", joint+'.sx', f=1)			
		cmds.connectAttr(self.name+".sy", joint+'.sy', f=1)			
		cmds.connectAttr(self.name+".sz", joint+'.sz', f=1)	

		# update sets
		def addToModuleSet(control_name, moduleName):
			cmds.sets(control_name, e=1, forceElement=moduleName+'_controlSet' )
			cmds.sets(control_name, e=1, forceElement=moduleName+'_moduleControlSet' )
			if cmds.objExists(old_moduleName+'_controlSet'):
				cmds.sets(control_name, e=1, remove=old_moduleName+'_controlSet' )
				cmds.sets(control_name, e=1, remove=old_moduleName+'_moduleControlSet' )		
			for n in ["", "_group", "_outJoint", "_addPoser", "_initLoc", "_group_decMat", "_group_multMat", "_makeNurbSphere", "_initLocShape", "_skinJoint", "_addPoserShape", "_skinJoint_multMat", "Shape"]:
				cmds.sets(control_name+n, e=1, forceElement=moduleName+'_nodesSet')
				if cmds.objExists(old_moduleName+'_controlSet'):
					cmds.sets(control_name+n, e=1, rm=old_moduleName+'_nodesSet')

		if par_moduleName != old_moduleName:
			addToModuleSet(name, par_moduleName)

			# add all children controls to new module set
			children = self.getChildren()
			for ch in children:
				addToModuleSet(ch, par_moduleName)

	# def fixJointsParents(self):
	# 	for c in self.addControls:
	# 		#print c.name, c.parent
	# 		try:
	# 			self.addControls_setParent(control=c, target=c.parent)
	# 		except: pass

	def delete(self): #
		group = cmds.listRelatives(self.name, p=1)[0]
		cmds.delete(group, group+"_decMat", group+"_multMat", self.name + '_skinJoint', self.name+'_addPoser', self.name+'_connectionCrv')
		if self.opposite:
			# add posers can be connected by matrix or stright connections
			if cmds.objExists(self.name+"_addPoser_decMat"):
				cmds.delete(self.name+"_addPoser_decMat", self.name+"_addPoser_multMat")
			
			if cmds.objExists(self.name+'_composeMatrix'):
				cmds.delete(self.name+'_composeMatrix')
	
	def getChildren(self):
		nodes = cmds.listRelatives(self.name)
		children = []
		for n in nodes:
			if n.split('_')[-1] == 'group':
				name = n.split("_group")[0]
				if utils.objectIsAdditionalControl(name):
					children.append(name)
		return children
	
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
 