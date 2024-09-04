import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial

from .import utils, main, controller, posers, rigTools

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

class AdditionalControl(controller.Control):
	def __init__(self, name="", parent="", shape="", data={}):
		if name != "":
			self.name = name
			self.parent = parent.replace("outJoint", "joint")
			self.poserParent = ""
			self.colorId = 18
			self.symmetrical = False
			self.opposite = False			
			self.create(shape)
		elif data != {}:
			self.name = data['name']
			self.parent = data['parent'].replace("outJoint", "joint")
			self.poserParent = data['poserParent']
			self.colorId = data['colorId']		
			self.symmetrical = False
			self.opposite = False	
			self.create(shape)

	def create(self, shape='circle'): #
		par_moduleName = utils.getModuleName(self.parent)
		# parentIsJoint = cmds.objectType(self.parent) == "joint"
		
		# if parentIsJoint:
		# 	parent_j = self.parent
		# else:
		# 	parent_j = self.parent + '_joint'
		
		# create control
		super(self.__class__, self).create(self.name, shape, self.colorId, offset=True, joint=True)
		utils.setUserAttr(self.name, 'type', 'additionalControl')
		
		# add nodes to set
		# for o in cmds.listRelatives(self.name+"_group", allDescendents=1):
		# 	utils.addToModuleSet(o, par_moduleName)
		# utils.addToModuleSet(self.name+"_group", par_moduleName)
		
		# add ctr joint
		j = cmds.duplicate(self.name+'_outJoint', n=self.name+'_joint')[0]
		cmds.setAttr(j+".segmentScaleCompensate", 0)	

		if not cmds.getAttr("main.jointsVis"):
			cmds.setAttr(self.name+'_outJoint.drawStyle', 2)
		
		# add outJoint to set
		cmds.sets(self.name+'_outJoint', e=1, forceElement=par_moduleName+'_skinJointsSet')

		# parent joint to sceleton
		# if cmds.objExists(parent_j):
		# 	cmds.parent(j, parent_j)
		# else:
		# 	cmds.parent(j, par_moduleName+"_root_joint")

		# utils.removeTransformParentJoint(j)
		# utils.resetJointOrient(j)
		
		# joint size
		jointsSize = cmds.getAttr('main.jointsSize')
		cmds.setAttr(j+".radius", jointsSize)

		# parent control
		gr = self.name+'_group'
		# if parentIsJoint:
		# 	# cmds.parent(gr, par_moduleName+"_controls")
		# 	cmds.parent(gr, parent_j.replace("joint", "outJoint"))
		# else:
		# 	cmds.parent(gr, self.parent)

		# connect joint by local matrixes if parent is addControl
		# if utils.objectIsAdditionalControl(self.parent):
		# 	# local connect joint from control and control group
		# 	utils.connectByMatrix(j, [self.name, self.name+"_group"], ['matrix', 'matrix'], par_moduleName)
			
		# 	mult_t = cmds.createNode('multiplyDivide', n=self.name+'_correctTranslateMult')
		# 	utils.addToModuleSet(mult_t, par_moduleName)
		# 	cmds.connectAttr(self.name+"_joint_decMat.outputTranslate", mult_t+'.input1')			

		# 	dMat = cmds.createNode('decomposeMatrix', n=self.name+"_correctTranslateDecMat")
		# 	utils.addToModuleSet(dMat, par_moduleName)
		# 	cmds.connectAttr(self.parent+"_addPoser.worldMatrix[0]", dMat+'.inputMatrix')
		# 	cmds.connectAttr(dMat+".outputScale", mult_t+'.input2')
			
		# 	if utils.objectIsOpposite(par_moduleName+"_mod"):
		# 		comp = cmds.createNode('composeMatrix', n=self.name+'_rotate_compMat')
		# 		utils.addToModuleSet(comp, par_moduleName)
		# 		cmds.setAttr(comp+'.inputScaleZ', -1)
		# 		utils.connectByMatrix(self.name+'_joint', [self.name, self.name+'_group', comp], ['matrix', 'matrix', 'outputMatrix'], par_moduleName, attrs=['r'])
		# 	elif utils.objectIsOpposite(j):
		# 		cmds.disconnectAttr(j+'_decMat.outputRotateX', self.name+'_joint.rx')
		# 		cmds.disconnectAttr(j+'_decMat.outputRotateY', self.name+'_joint.ry')
		# 		cmds.disconnectAttr(j+'_decMat.outputRotateZ', self.name+'_joint.rz')
		# 		cmds.orientConstraint(self.name, self.name+'_joint')
			
		# 	cmds.connectAttr(mult_t+".outputX", self.name+'_joint.tx', f=1)
		# 	cmds.connectAttr(mult_t+".outputY", self.name+'_joint.ty', f=1)
		# 	cmds.connectAttr(mult_t+".outputZ", self.name+'_joint.tz', f=1)		
		# 	if utils.objectIsOpposite(j):
		# 		cmds.delete(mult_t)
		# 		cmds.pointConstraint(self.name, self.name+'_joint')				
		# # connect joint by world matrixes
		# else:
		# 	utils.connectByMatrix(j, [self.name, j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], par_moduleName)

		cmds.connectAttr(self.name+".sx", self.name+'_joint.sx', f=1)			
		cmds.connectAttr(self.name+".sy", self.name+'_joint.sy', f=1)			
		cmds.connectAttr(self.name+".sz", self.name+'_joint.sz', f=1)			

		# add addPoser
		posers.createAddPoser(self.name, par_moduleName)
		poser = self.name+"_addPoser"
		t = cmds.xform(self.parent, q=1, t=1, ws=1)
		cmds.xform(poser, t=t, ws=1)
		
		# mirrored = utils.getModuleInstance(par_moduleName).opposite

		# connect control group
		# parent is joint
		# if parentIsJoint: 
		# 	parent_out_j = parent_j.replace("joint", "outJoint")
		# 	if not cmds.objExists(parent_out_j):	
		# 		parent_out_j = parent_j.replace("joint", "outJoint")
		# 	parent_initLoc = parent_j.replace("joint", "initLoc")
		# 	utils.connectByMatrix(gr, [poser, parent_initLoc, parent_out_j, par_moduleName+"_root_poser"], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'worldInverseMatrix[0]'])
		# # parent is control
		# else: 
		# 	parent_initLoc = self.parent+"_initLoc"
		# 	utils.connectByMatrix(gr, [poser, parent_initLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'])
		# 	# parent is addControl
		# 	if utils.objectIsAdditionalControl(self.parent): 
		# 		parent_p = self.parent+"_addPoser"
		# 		cmds.parent(poser, parent_p)
		# 		cmds.setAttr(poser+'.t', 0,0,0)
		# 		cmds.setAttr(poser+'.r', 0,0,0)
		# 		cmds.setAttr(poser+'.sx', 1)

		
		# lock visibility attribute
		utils.lockChannels(self.name, channels=[])
		
		# add to set
		# for o in cmds.listRelatives(poser, allDescendents=1):
		# 	utils.addToModuleSet(o, par_moduleName)
		
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
		# variables
		name = self.name
		old_moduleName = utils.getModuleName(name)
		par_moduleName = utils.getModuleName(target)
		closestJoint = False
		
		parentIsJoint = cmds.objectType(target) == "joint"
		if parentIsJoint:
			target_j = target
			
			# if joint is simple, set target as control
			par_ = cmds.listRelatives(target_j.replace("joint", "outJoint"), p=1)[0]
			if utils.objectIsAdditionalControl(par_) or utils.objectIsControl(par_):
				target = par_
				parentIsJoint = False
		else:
			target_j = target + '_joint'
			if not cmds.objExists(target_j):
				target_j = utils.getClosestJoint(par_moduleName, target)
				closestJoint = True
		
		parent_out_j = target_j.replace("joint", "outJoint")
		parent_j = target_j.replace("outJoint", "joint")
		poser = name+"_addPoser"
		group = name+'_group'
		joint =  name+'_joint'
		
		parent_initLoc = target_j.replace("joint", "initLoc").replace("outJoint", "initLoc")
		if closestJoint:
			parent_initLoc = target + "_initLoc"

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
			tar = target.split("_joint")[0].split("_outJoint")[0]
		else:
			tar = target
		if cmds.objExists(tar+"_addPoser"):
			par_p = tar+"_addPoser"
		elif cmds.objExists(tar+"_poser"):
			par_p = tar+"_poser"
		elif cmds.objExists(tar+"_initLoc"):
			par_p = tar+"_initLoc"
		else:
			par_p = par_moduleName + "_root_mainPoser"



		if cmds.listRelatives(name + "_addPoser", p=1)[0] != par_p:
			cmds.parent(name + "_addPoser", par_p)
				
		# add joint to sceleton
		if cmds.listRelatives(joint, p=1)[0] != target_j:
			cmds.parent(joint, parent_j)
			utils.removeTransformParentJoint(joint)
			utils.resetJointOrient(joint)

		# control group connection
		if cmds.objExists(name+"_group_multMat"):
			cmds.delete(name+"_group_multMat")
		utils.connectByMatrix(group, [poser, parent_initLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'])

		# connect joint by local matrixes if parent is addControl
		if utils.objectIsAdditionalControl(self.parent):
			# local connect joint from control and control group
			utils.connectByMatrix(joint, [name, group], ['matrix', 'matrix'], par_moduleName)
			
			mult_t = cmds.createNode('multiplyDivide', n=name+'_correctTranslateMult')
			cmds.connectAttr(joint+"_decMat.outputTranslate", mult_t+'.input1')			

			dMat = cmds.createNode('decomposeMatrix', n=name+"_correctTranslateDecMat")
			cmds.connectAttr(target+"_addPoser.worldMatrix[0]", dMat+'.inputMatrix')
			cmds.connectAttr(dMat+".outputScale", mult_t+'.input2')
			
			# if utils.objectIsOpposite(par_moduleName+"_mod"):
			# 	comp = cmds.createNode('composeMatrix', n=name+'_rotate_compMat')
			# 	utils.addToModuleSet(comp, par_moduleName)
			# 	cmds.setAttr(comp+'.inputScaleZ', -1)
			# 	utils.connectByMatrix(self.name+'_joint', [self.name, self.name+'_group', comp], ['matrix', 'matrix', 'outputMatrix'], par_moduleName, attrs=['r'])
			# elif utils.objectIsOpposite(j):
			# 	cmds.disconnectAttr(j+'_decMat.outputRotateX', self.name+'_joint.rx')
			# 	cmds.disconnectAttr(j+'_decMat.outputRotateY', self.name+'_joint.ry')
			# 	cmds.disconnectAttr(j+'_decMat.outputRotateZ', self.name+'_joint.rz')
			# 	cmds.orientConstraint(self.name, self.name+'_joint')
			
			cmds.connectAttr(mult_t+".outputX", joint+'.tx', f=1)
			cmds.connectAttr(mult_t+".outputY", joint+'.ty', f=1)
			cmds.connectAttr(mult_t+".outputZ", joint+'.tz', f=1)
			# if utils.objectIsOpposite(joint):
			# 	cmds.delete(mult_t)
			# 	cmds.pointConstraint(self.name, joint)		
		# connect joint by world matrixes
		else:
			utils.connectByMatrix(joint, [self.name, joint], ['worldMatrix[0]', 'parentInverseMatrix[0]'], par_moduleName)

		cmds.connectAttr(self.name+".sx", joint+'.sx', f=1)			
		cmds.connectAttr(self.name+".sy", joint+'.sy', f=1)			
		cmds.connectAttr(self.name+".sz", joint+'.sz', f=1)	

		# parent is addControl
		# if utils.objectIsAdditionalControl(self.parent): 
		# 	parent_p = self.parent+"_addPoser"
		# 	cmds.parent(poser, parent_p)
		# 	cmds.setAttr(poser+'.t', 0,0,0)
		# 	cmds.setAttr(poser+'.r', 0,0,0)
		# 	cmds.setAttr(poser+'.sx', 1)

		# ctrlInitLoc = "%s_%s_controlInitLoc" %(par_moduleName, utils.getInternalNameFromControl(self.parent))
		# if not cmds.objExists(ctrlInitLoc):
		# 	ctrlInitLoc = "%s_%s_initLoc" %(par_moduleName, utils.getInternalNameFromControl(self.parent))
		# if not cmds.objExists(ctrlInitLoc):
		# 	ctrlInitLoc = utils.getInternalNameFromControl(self.parent) + "_initLoc"
		# print(333, par_moduleName, utils.getInternalNameFromControl(self.parent))
		# print(444, ctrlInitLoc)
		# m = utils.getModuleInstance(par_moduleName)
		# cmds.connectAttr(ctrlInitLoc+".worldInverseMatrix[0]", self.name+"_group_multMat.matrixIn[1]", f=1)
		
		# update sets
		def addToModuleSet(control_name, moduleName):
			cmds.sets(control_name, e=1, forceElement=moduleName+'_controlSet' )
			cmds.sets(control_name, e=1, forceElement=moduleName+'_moduleControlSet' )
			if cmds.objExists(old_moduleName+'_controlSet'):
				cmds.sets(control_name, e=1, remove=old_moduleName+'_controlSet' )
				cmds.sets(control_name, e=1, remove=old_moduleName+'_moduleControlSet' )		
			for n in ["", "_group", "_outJoint", "_addPoser", "_initLoc", "_group_decMat", "_group_multMat", "_makeNurbSphere", "_initLocShape", "_joint", "_addPoserShape", "_joint_multMat", "Shape"]:
				cmds.sets(control_name+n, e=1, forceElement=moduleName+'_nodesSet')
				if cmds.objExists(old_moduleName+'_controlSet'):
					cmds.sets(control_name+n, e=1, rm=old_moduleName+'_nodesSet')

		if par_moduleName != old_moduleName:
			addToModuleSet(name, par_moduleName)

			# add all children controls to new module set
			children = self.getChildren()
			for ch in children:
				addToModuleSet(ch, par_moduleName)

	def fixJointsParents(self):
		for c in self.addControls:
			#print c.name, c.parent
			try:
				self.addControls_setParent(control=c, target=c.parent)
			except: pass

	def delete(self): #
		group = cmds.listRelatives(self.name, p=1)[0]
		cmds.delete(group, group+"_decMat", group+"_multMat", self.name + '_joint', self.name+'_addPoser')
		if self.opposite:
			# add posers can be connected by matrix or stright connections
			if cmds.objExists(self.name+"_addPoser_decMat"):
				cmds.delete(self.name+"_addPoser_decMat", self.name+"_addPoser_multMat")
	
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
 