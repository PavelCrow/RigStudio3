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
		parentIsJoint = cmds.objectType(self.parent) == "joint"
		
		if parentIsJoint:
			parent_j = self.parent
		else:
			parent_j = self.parent + '_joint'
		
		# create control
		super(self.__class__, self).create(self.name, shape, self.colorId, offset=True, joint=True)
		utils.setUserAttr(self.name, 'type', 'additionalControl')
		
		# add nodes to set
		for o in cmds.listRelatives(self.name+"_group", allDescendents=1):
			utils.addToModuleSet(o, par_moduleName)
		utils.addToModuleSet(self.name+"_group", par_moduleName)
		
		# add ctr joint
		j = cmds.duplicate(self.name+'_outJoint', n=self.name+'_joint')[0]
		cmds.hide(self.name+'_outJoint')
		cmds.setAttr(j+".segmentScaleCompensate", 0)	
		
		# parent joint to sceleton
		if cmds.objExists(parent_j):
			cmds.parent(j, parent_j)
		else:
			cmds.parent(j, par_moduleName+"_root_joint")

		utils.removeTransformParentJoint(j)
		utils.resetJointOrient(j)
		
		# joint size
		jointsSize = cmds.getAttr('main.jointsSize')
		cmds.setAttr(j+".radius", jointsSize)

		# parent control
		gr = self.name+'_group'
		if parentIsJoint:
			cmds.parent(gr, par_moduleName+"_controls")
		else:
			cmds.parent(gr, self.parent)

		# connect joint by local matrixes if parent is addControl
		if utils.objectIsAdditionalControl(self.parent):
			# local connect joint from control and control group
			utils.connectByMatrix(j, [self.name, self.name+"_group"], ['matrix', 'matrix'], par_moduleName)
			
			mult_t = cmds.createNode('multiplyDivide', n=self.name+'_correctTranslateMult')
			utils.addToModuleSet(mult_t, par_moduleName)
			cmds.connectAttr(self.name+"_joint_decMat.outputTranslate", mult_t+'.input1')			

			dMat = cmds.createNode('decomposeMatrix', n=self.name+"_correctTranslateDecMat")
			utils.addToModuleSet(dMat, par_moduleName)
			cmds.connectAttr(self.parent+"_addPoser.worldMatrix[0]", dMat+'.inputMatrix')
			cmds.connectAttr(dMat+".outputScale", mult_t+'.input2')
			
			if utils.objectIsOpposite(par_moduleName+"_mod"):
				comp = cmds.createNode('composeMatrix', n=self.name+'_rotate_compMat')
				utils.addToModuleSet(comp, par_moduleName)
				cmds.setAttr(comp+'.inputScaleZ', -1)
				utils.connectByMatrix(self.name+'_joint', [self.name, self.name+'_group', comp], ['matrix', 'matrix', 'outputMatrix'], par_moduleName, attrs=['r'])
			elif utils.objectIsOpposite(j):
				cmds.disconnectAttr(j+'_decMat.outputRotateX', self.name+'_joint.rx')
				cmds.disconnectAttr(j+'_decMat.outputRotateY', self.name+'_joint.ry')
				cmds.disconnectAttr(j+'_decMat.outputRotateZ', self.name+'_joint.rz')
				cmds.orientConstraint(self.name, self.name+'_joint')
			
			cmds.connectAttr(mult_t+".outputX", self.name+'_joint.tx', f=1)
			cmds.connectAttr(mult_t+".outputY", self.name+'_joint.ty', f=1)
			cmds.connectAttr(mult_t+".outputZ", self.name+'_joint.tz', f=1)		
			if utils.objectIsOpposite(j):
				cmds.delete(mult_t)
				cmds.pointConstraint(self.name, self.name+'_joint')				
		# connect joint by world matrixes
		else:
			utils.connectByMatrix(j, [self.name, j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], par_moduleName)

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
		if parentIsJoint: 
			parent_out_j = parent_j.replace("joint", "outJoint")
			if not cmds.objExists(parent_out_j):	
				parent_out_j = parent_j.replace("joint", "outJoint")
			parent_initLoc = parent_j.replace("joint", "initLoc")
			utils.connectByMatrix(gr, [poser, parent_initLoc, parent_out_j, par_moduleName+"_root_poser"], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'worldInverseMatrix[0]'], par_moduleName)
		# parent is control
		else: 
			parent_initLoc = self.parent+"_initLoc"
			utils.connectByMatrix(gr, [poser, parent_initLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'], par_moduleName)
			# parent is addControl
			if utils.objectIsAdditionalControl(self.parent): 
				parent_p = self.parent+"_addPoser"
				cmds.parent(poser, parent_p)
				cmds.setAttr(poser+'.t', 0,0,0)
				cmds.setAttr(poser+'.r', 0,0,0)
				cmds.setAttr(poser+'.sx', 1)

		
		# lock visibility attribute
		utils.lockChannels(self.name, channels=[])
		
		# add to set
		for o in cmds.listRelatives(poser, allDescendents=1):
			utils.addToModuleSet(o, par_moduleName)
		

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
		old_moduleName = utils.getModuleName(self.name)
		
		par = cmds.listRelatives(self.name+"_group", p=1)[0]
		if par == target:
			cmds.warning("Control already have this parent")
			return
		
		cmds.parent(self.name+"_group", target)
		self.parent = target
		
		# add modulename attr
		par_moduleName = utils.getModuleName(self.parent)
		for o in cmds.listRelatives(self.name+"_group", allDescendents=1):
			utils.addModuleNameAttr(o, par_moduleName)
		utils.addModuleNameAttr(self.name+"_group", par_moduleName)		
		
		def remove_transform_group(j, p):
			# remove transform gr
			cur_p = cmds.listRelatives(j, parent=1)[0]
			if 'transform' in cur_p:
				utils.resetAttrs(cur_p)
				cmds.parent(j, p)
				cmds.delete(cur_p)	
				
		# add joint to sceleton
		target_j = target + '_joint'
		if not cmds.objExists(target_j):
			target_j = utils.getClosestJoint(par_moduleName, target)
		cmds.parent(self.name+'_joint', target_j)
		remove_transform_group(self.name+'_joint', target_j)

		# update connection
		ctrlInitLoc = "%s_%s_controlInitLoc" %(par_moduleName, utils.getInternalNameFromControl(self.parent))
		if not cmds.objExists(ctrlInitLoc):
			ctrlInitLoc = "%s_%s_initLoc" %(par_moduleName, utils.getInternalNameFromControl(self.parent))
		if not cmds.objExists(ctrlInitLoc):
			ctrlInitLoc = utils.getInternalNameFromControl(self.parent) + "_initLoc"
		m = utils.getModuleInstance(par_moduleName)
		if not cmds.objExists(ctrlInitLoc):
			ctrlInitLoc = m.getClosestInitLoc(self.parent)
		cmds.connectAttr(ctrlInitLoc+".worldInverseMatrix[0]", self.name+"_group_multMat.matrixIn[1]", f=1)
		#utils.connectByMatrix(gr, [p, ctrlInitLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'], src_mod_name)
		
		# update sets
		if par_moduleName != old_moduleName:
			cmds.sets(self.name, e=1, forceElement=par_moduleName+'_controlSet' )
			cmds.sets(self.name, e=1, forceElement=par_moduleName+'_moduleControlSet' )		
			cmds.sets(self.name, e=1, remove=old_moduleName+'_controlSet' )
			cmds.sets(self.name, e=1, remove=old_moduleName+'_moduleControlSet' )		
		
		#cmds.select(self.root)

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
 