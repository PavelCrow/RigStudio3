import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial

from .import utils, main, controller, rigTools

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

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
			self.parent = parent
			self.poserParent = ""
			self.colorId = 18
			self.symmetrical = False
			self.mirrored = False			
			self.create(shape)
		elif data != {}:
			self.name = data['name']
			self.parent = data['parent']
			self.poserParent = data['poserParent']
			self.colorId = data['colorId']		
			self.symmetrical = False
			self.mirrored = False	
			self.create(shape)

	def create(self, shape='circle'):
		#self.name = utils.incrementNameIfExists(self.name)
		
		# create control
		super(self.__class__, self).create(self.name, shape, self.colorId, False, True, True)
		
		#self.create(self.name, shape, self.colorId, True, True, True)
		utils.setUserAttr(self.name, 'type', 'additionalControl')
		
		# add modulename attr
		par_moduleName = utils.getModuleNameFromAttr(self.parent)
		
		#print 111, self.parent, self.name+"_group"
		for o in cmds.listRelatives(self.name+"_group", allDescendents=1):
			
			utils.addModuleNameAttr(o, par_moduleName)
		utils.addModuleNameAttr(self.name+"_group", par_moduleName)
		
		# add joint
		j = cmds.duplicate(self.name+'_outJoint', n=self.name+'_joint')[0]
		cmds.hide(self.name+'_outJoint')
		cmds.setAttr(j+".segmentScaleCompensate", 0)	
		
		# add joint to sceleton
		src_mod_name = utils.getModuleNameFromAttr(self.parent)
					
		parent_j = self.parent + '_joint'
		
		
		if self.parent.split('_')[-1] == 'pin':
			con = pm.PyNode(self.parent).tx.inputs()[0]
			parent_j = con.target[0].targetParentMatrix.inputs()[0].replace("outJoint", "joint")
		
		if not cmds.objExists(parent_j):
			parent_j = '%s_%s_joint' %(utils.getModuleNameFromAttr(self.name), utils.getInternalNameFromControl(self.parent))
			#if self.name == 'l_legUpperAdd_3': print 222, parent_j, cmds.objExists(parent_j)
			if not cmds.objExists(parent_j):
				#if self.name == 'l_legUpperAdd_3': print 333, parent_j, utils.getClosestJoint(par_moduleName, self.parent)
				parent_j = utils.getClosestJoint(par_moduleName, self.parent)
		cmds.parent(j, parent_j)

		utils.removeTransformParentJoint(j)
		utils.resetJointOrient(j)
		
		# joint size
		jointsSize = cmds.getAttr('main.jointsSize')
		cmds.setAttr(j+".radius", jointsSize)

		# connect by local matrixes
		


		
		if utils.objectIsAdditionalControl(self.parent):
			#comp = cmds.createNode('composeMatrix', n=self.name+'_compMat')
			#cmds.setAttr(comp+'.inputScaleX', -1)			
			utils.connectByMatrix(j, [self.name, self.name+"_group"], ['matrix', 'matrix'], src_mod_name)
			
			mult_t = cmds.createNode('multiplyDivide', n=self.name+'_correctTranslateMult')
			utils.addModuleNameAttr(mult_t, par_moduleName)
			cmds.connectAttr(self.name+"_joint_decMat.outputTranslate", mult_t+'.input1')			

			dMat = cmds.createNode('decomposeMatrix', n=self.name+"_correctTranslateDecMat")
			utils.addModuleNameAttr(dMat, par_moduleName)
			cmds.connectAttr(self.parent+"_addPoser.worldMatrix[0]", dMat+'.inputMatrix')
			cmds.connectAttr(dMat+".outputScale", mult_t+'.input2')
			
			if utils.objectIsOpposite(par_moduleName+"_mod"):
				comp = cmds.createNode('composeMatrix', n=self.name+'_rotate_compMat')
				cmds.setAttr(comp+'.inputScaleZ', -1)
				utils.connectByMatrix(self.name+'_joint', [self.name, self.name+'_group', comp], ['matrix', 'matrix', 'outputMatrix'], par_moduleName, attrs=['r'])
			elif utils.objectIsOpposite(j):
				#comp = cmds.createNode('composeMatrix', n=self.name+'_rotate_compMat')
				#cmds.setAttr(comp+'.inputScaleZ', -1)
				#utils.connectByMatrix(self.name+'_joint', [self.name, comp, self.name+'_group'], ['matrix', 'outputMatrix', 'matrix'], par_moduleName, attrs=['r'])
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

		else:
			utils.connectByMatrix(j, [self.name, j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], src_mod_name)

		cmds.connectAttr(self.name+".sx", self.name+'_joint.sx', f=1)			
		cmds.connectAttr(self.name+".sy", self.name+'_joint.sy', f=1)			
		cmds.connectAttr(self.name+".sz", self.name+'_joint.sz', f=1)			

				
		gr = self.name+'_group'
		p = self.name+"_addPoser"
		
		# parent
		cmds.parent(gr, self.parent)
		
		# add addPoser and initLoc
		#rigTools.posers.createAddPoser(self.name, par_moduleName)
		rigTools.posers.generateAddPoser(self.name, par_moduleName)
		
		p_obj = pm.PyNode(p)
		p_obj.sx.setKeyable(1)
		p_obj.sy.setKeyable(1)
		p_obj.sz.setKeyable(1)
		p_obj.sx.unlock()
		p_obj.sy.unlock()
		p_obj.sz.unlock()
		
		#utils.addModuleNameAttr(p_obj, src_mod_name)
		mirrored = utils.getModuleInstance(par_moduleName).opposite

		l = cmds.spaceLocator(n=self.name+"_initLoc")[0]
		cmds.hide(l)
		cmds.parent(l, p)
		utils.resetAttrs(l)
		
		cmds.duplicate(l, n=self.name+"_controlInitLoc")
		con = cmds.parentConstraint(self.parent, p, mo=0)
		cmds.delete(con)
		
		if self.poserParent:
			#par = utils.getRealNameFromDataName(self.poserParent, src_mod_name)
			par = self.poserParent
			#print 00000, self.name, self.poserParent, par
			cur_par = cmds.listRelatives(p, p=1)[0]
			if cur_par != par:
				cmds.parent(p, par)
		
		ctrlInitLoc = "%s_%s_controlInitLoc" %(par_moduleName, utils.getInternalNameFromControl(self.parent))
		#if not cmds.objExists(ctrlInitLoc):
			#cmds.warning("Control is not prepared for adding additional control. Need to create controlInitLoc in source module")
		if not cmds.objExists(ctrlInitLoc):
			ctrlInitLoc = "%s_%s_initLoc" %(par_moduleName, utils.getInternalNameFromControl(self.parent))
			
		if cmds.getAttr(self.parent+".type") == 'additionalControl':
			ctrlInitLoc = self.parent + "_controlInitLoc"
		#print 1111, self.parent, ctrlInitLoc
		
		#if not cmds.objExists(ctrlInitLoc):
			#ctrlInitLoc = utils.getInternalNameFromControl(self.parent) + "_initLoc"
		#m = utils.getModuleInstance(par_moduleName)
		#if not cmds.objExists(ctrlInitLoc):
			#ctrlInitLoc = m.getClosestInitLoc(self.parent)	
			
		#print self.name, self.parent, par_moduleName, ctrlInitLoc
		#if mirrored and cmds.getAttr(self.parent+".type") == 'control':
				#comp = cmds.createNode('composeMatrix', n=self.name+'_compMat')
				#cmds.setAttr(comp+'.inputScaleX', -1)
				#utils.connectByMatrix(gr, [p, ctrlInitLoc, comp], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'outputMatrix'], src_mod_name)
		#else:
		
		utils.connectByMatrix(gr, [p, ctrlInitLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'], src_mod_name)
		
		# lock visibility attribute
		utils.lockChannels(self.name, channels=[])
		
		
		
		
		# set module name attrs
		for o in cmds.listRelatives(p_obj.name(), allDescendents=1):
			#print 111, self.parent, o, par_moduleName
			utils.addModuleNameAttr(o, par_moduleName)
		utils.addModuleNameAttr(p_obj.name(), par_moduleName)		
		
		cmds.setAttr(p+'.axises', 0)
		cmds.select(p)

	def load(self, name):
		self.name = name

		# get color id
		sh = cmds.listRelatives(self.name, s=1)[0]
		self.colorId = cmds.getAttr(sh+".overrideColor")

		#self.getRoot()
		self.getParent()
		self.symmetrical = self.isSymmetry()
		self.mirrored = self.isMirrored()
		self.deep = 0

	def setParent(self, target):
		old_moduleName = utils.getModuleNameFromAttr(self.name)
		
		par = cmds.listRelatives(self.name+"_group", p=1)[0]
		if par == target:
			cmds.warning("Control already have this parent")
			return
		
		cmds.parent(self.name+"_group", target)
		self.parent = target
		
		# add modulename attr
		par_moduleName = utils.getModuleNameFromAttr(self.parent)
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

	def delete(self):
		group = self.name+'_group'
		joint = self.name + '_joint'
		poser = self.name+'_addPoser'
		
		try: 
			cmds.delete(group)
			cmds.delete(joint)
		except: pass
		try: 
			cmds.delete(poser)
		except: pass
	
	def getChildrenConrollers(self):
		nodes = cmds.listRelatives(self.name)
		children = []
		for n in nodes:
			if n.split('_')[-1] == 'tuner':
				children.append(n.split('_tuner')[0])	
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
