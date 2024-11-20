import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import os, imp
from functools import partial

from ... import utils, module, controller, posers

version = int(cmds.about(v=True).split(" ")[0])
if version >= 2020:
	from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
else:
	from rigStudio2.Qt import QtWidgets, QtGui, QtCore, QtUiTools


rootDebug = ""
fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])#.split(fileName)[0]


class Tree(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1] # type is equal file name
		self.length = 3.0
		self.chainsCount = 1
		self.elementsCount = 3
	
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))
		w.parentIsChain_btn.clicked.connect(self.rerootPosersToChain)
		w.parentIsMainPoser_btn.clicked.connect(self.rerootPosersToMainPoser)
        

	def create(self, options={}):
		self.root = self.name + "_mod"

		# import template rig
		template_path = rootPath + '//modules//_template.ma'
		utils.importFile(template_path, self.name)
		
		if options == {}:
			chainsCount = self.chainsCount
			elementsCount = self.elementsCount
		else:
			chainsCount = options['chainsCount']
			elementsCount = options['elementsCount']
		
		# create posers
		poser_path = rootPath + '//rigTools//poser.ma'
		for n in range(1, chainsCount+1):
			for i in range(0, elementsCount):
				utils.importFile(poser_path, "%s_chain_%s_element_%s" %(self.name, n, i+1))				

				poser = "%s_chain_%s_element_%s_poser" %(self.name, n, i+1)

				utils.addModuleNameAttr(poser, self.name)

				cmds.setAttr(poser+'.tx', self.length/elementsCount*float(i)*4)	

				mns = poser.replace("poser","makeNurbSphere1")
				mult = cmds.createNode("multDoubleLinear", name=poser.replace("poser", "multDoubleLinear"))
				cmds.connectAttr(self.name+"_mainPoser.globalSize", mult+".input1")
				cmds.connectAttr(poser+".size", mult+".input2")
				cmds.connectAttr(mult+".output", mns+".radius", f=1)
				cmds.sets(mult, forceElement=self.name+'_nodesSet')

				if i > 0:
					cmds.parent( poser, poser.replace(str(i+1)+"_poser", str(i)+"_poser") )
				
			cmds.parent( "%s_chain_%s_element_1_poser" %(self.name, n), self.name+'_root_poser' )
			cmds.setAttr("%s_chain_%s_element_1_poser.tx" %(self.name, n), self.length/elementsCount*4)
			
			cmds.setAttr("%s_chain_%s_element_1_poser.tz" %(self.name, n), n-1)
				
		if not cmds.objExists(self.name+'_skinJointsSet'):
			cmds.select(clear=1)
			cmds.sets(n=self.name+'_skinJointsSet')
		
		cmds.setAttr(self.name+"_mainPoser.globalSize", 0.5)

		# create control, groups and joint
		cu = controller.Control()
		
		ctrl = "%s_root" %(self.name)
		cu.create(ctrl, 'circle', colorId=18, offset=False, joint=False)
		utils.setUserAttr(ctrl, 'internalName', 'root')
		utils.setUserAttr(ctrl, 'type', "control")
		utils.setUserAttr(ctrl, 'moduleName', self.name)
		cmds.setAttr(ctrl+'.sx', 2)
		cmds.setAttr(ctrl+'.sy', 2)
		cmds.setAttr(ctrl+'.sz', 2)
		cmds.setAttr(ctrl+'.rz', -90)
		cmds.makeIdentity(ctrl, apply=1, r=1, s=1)
		utils.lockChannels(ctrl, [])		
		cmds.group(ctrl, n=ctrl+"_offset")
		cmds.group(ctrl+"_offset", n=ctrl+"_group")
		cmds.parent(ctrl+"_group", self.name+"_controls")

		cmds.sets(ctrl, forceElement=self.name+'_moduleControlSet')
		
		mirror_mat = cmds.createNode('composeMatrix')
		cmds.sets(mirror_mat, forceElement=self.name+'_nodesSet')

		if self.name.split("_")[0] == 'r':
			cmds.setAttr(mirror_mat+".inputScaleX", -1)
		utils.connectByMatrix(self.name+"_root_outJoint", [mirror_mat, ctrl, self.name+"_root_outJoint"], ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name, attrs=['t', 'r'] )			

		for n in range(1, chainsCount+1):
			joints = []
			for i in range(elementsCount):
				ctrl = "%s_chain_%s_element_%s" %(self.name, n, i+1)
				cu.create(ctrl, 'circle', colorId=18, offset=False, joint=False)
				utils.setUserAttr(ctrl, 'internalName', "chain_%s_element_%s" %(n, i+1))
				utils.setUserAttr(ctrl, 'type', "control")
				cmds.setAttr(ctrl+'.sx', 2)
				cmds.setAttr(ctrl+'.sy', 2)
				cmds.setAttr(ctrl+'.sz', 2)
				cmds.setAttr(ctrl+'.rz', -90)
				cmds.makeIdentity(ctrl, apply=1, r=1, s=1)
				utils.lockChannels(ctrl, [])
	
				cmds.sets(ctrl, forceElement=self.name+'_moduleControlSet')
				cmds.group(ctrl, n=ctrl+"_offset")
				cmds.group(ctrl+"_offset", n=ctrl+"_group")
				jnt = cmds.joint(n=ctrl+'_outJoint')
				cmds.parent(jnt, ctrl)
				joints.append(jnt)
				
				cmds.sets(jnt, e=1, forceElement=self.name+'_skinJointsSet')
				
				# add mudule attrs
				utils.addModuleNameAttr(ctrl, self.name)
				utils.addModuleNameAttr(ctrl+"_offset", self.name)
				utils.addModuleNameAttr(ctrl+"_group", self.name)
				utils.addModuleNameAttr(jnt, self.name)
	
				mirror_mat = cmds.createNode('composeMatrix')
				cmds.sets(mirror_mat, forceElement=self.name+'_nodesSet')
				if self.name.split("_")[0] == 'r':
					cmds.setAttr(mirror_mat+".inputScaleX", -1)
				utils.connectByMatrix(jnt, [mirror_mat, ctrl, jnt], ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name, attrs=['t', 'r'] )			
				
				# parent
				if i > 0:
					cmds.parent(ctrl+"_group", "%s_chain_%s_element_%s" %(self.name, n, i) )
					cmds.parent(jnt, joints[i-1])
				else:
					cmds.parent(ctrl+"_group", self.name+"_root")
					cmds.parent(jnt, self.name+"_root_outJoint")
	
				cmds.setAttr(jnt+".jointOrientX", 0)
				cmds.setAttr(jnt+".jointOrientY", 0)
				cmds.setAttr(jnt+".jointOrientZ", 0)
				
				# create and orient controlInitLoc to control
				controlInitLoc = cmds.duplicate(ctrl+'_initLoc', n=ctrl+'_controlInitLoc')[0]
				con = cmds.orientConstraint(ctrl, controlInitLoc, mo=0)
				cmds.delete(con)				
				
				# add lines, connect posers
				if i == 0:
					p1 = self.name+'_root_poser'
					sec_tar = self.name+'_root_poserOrient'
				else:
					p1 = "%s_chain_%s_element_%s_poser" %(self.name, n, i)
					sec_tar = p1+'Orient'
					
				utils.connectByMatrix(ctrl+"_group", [ctrl+"_poserOrient", sec_tar], ['worldMatrix[0]', 'worldInverseMatrix[0]'])
				
				p2 = "%s_chain_%s_element_%s_poser" %(self.name, n, i+1)
				posers.connectPosers(p1, p2, name_m=self.name+"_")
		
		# create and orient root controlInitLoc to root control
		controlInitLoc = cmds.duplicate(self.name+'_root_initLoc', n=self.name+'_root_controlInitLoc')[0]
		con = cmds.orientConstraint(self.name+'_root', controlInitLoc, mo=0)
		cmds.delete(con)			
		
		# connect controls group
		utils.connectByMatrix(self.name+"_controls", [self.name+"_root_connector"])
		
		# connect outJoints group
		utils.connectByMatrix(self.name+"_outJoints", [self.name+"_root"])
		decMat = pm.PyNode(self.name+"_outJoints_decMat")
		mult = pm.createNode('multDoubleLinear', n=self.name+"_multDoubleLinear")
		cond = pm.createNode('condition', n=ctrl+"_scale_condition")
		cmds.sets(mult.name(), forceElement=self.name+'_nodesSet')
		cmds.sets(cond.name(), forceElement=self.name+'_nodesSet')
		cmds.sets(decMat.name(), forceElement=self.name+'_nodesSet')
		decMat.outputScaleZ >> mult.input1
		mult.input2.set(-1)
		mult.output >> cond.colorIfFalseR
		decMat.outputScaleZ >> cond.colorIfTrueR
		decMat.outputScaleZ >> cond.firstTerm
		cond.operation.set(2)		
		pm.connectAttr(cond.outColorR, self.name+"_outJoints.sz", f=1)
				
		# add init locs
		for n in range(1, chainsCount+1):
			for i in range(1, elementsCount+1):
				p = "%s_chain_%s_element_%s_poser" %(self.name, n, i)
				l = cmds.spaceLocator(n="%s_chain_%s_element_%s_joint_initLoc" %(self.name, n, i))[0]
				
				utils.addModuleNameAttr(l, self.name)			
				cmds.parent(l, p)
				utils.resetAttrs(l)
				cmds.hide(l)
				
				cmds.connectAttr(self.name+"_mirror_condition.outColorR", "%s_chain_%s_element_%s_initLoc.sx" %(self.name, n, i))
		
	
		cmds.hide(self.name+'_input')

		# add moduleType attr
		utils.setUserAttr(self.root, "moduleType", self.type)		

		self.addSkinJoints()
		cmds.sets(self.name+'_sets', e=1, forceElement='modules_sets' )
		cmds.sets(self.name+'_skinJointsSet', e=1, forceElement=self.name+'_sets' )
		cmds.select(self.name+'_moduleControlSet')
		if cmds.objExists(self.name+'_controlSet'):
			cmds.sets(e=1, add=self.name+'_controlSet' )
		else:
			cmds.sets(n=self.name+'_controlSet')
			cmds.sets(self.name+'_controlSet', e=1, forceElement='controlSet' )

		cmds.sets(self.name+'_nodesSet', e=1, forceElement=self.name+'_sets')
		
	def updateOptionsPage(self, widget):
		self.getOptions()
		widget.chainsCount_spinBox.setValue(self.chainsCount)
		widget.jointsCount_spinBox.setValue(self.elementsCount)
		
	def getOptions(self):
		self.rerootPosersToChain()
		
		childs = cmds.listRelatives(self.name+'_outJoints', allDescendents=1, type='joint' )
		self.jointsCount = len(childs)			
		
		posers = []
		for p in cmds.listRelatives(self.name+'_root_poser'):
			if p.split('_')[-1] == 'poser':
				posers.append(p)
		self.chainsCount = len(posers)
		
		posers = []
		for p in cmds.listRelatives(self.name+'_chain_1_element_1_poser', allDescendents=1):
			if p.split('_')[-1] == 'poser':
				posers.append(p)
		self.elementsCount = len(posers) + 1

		optionsData = {}
		optionsData['chainsCount'] = self.chainsCount
		optionsData['elementsCount'] = self.elementsCount
		
		return optionsData				

	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	
		
	def rebuildWithNewOptions(self, mainInstance, widget):
		chainsCount = widget.chainsCount_spinBox.value()
		elementsCount = widget.jointsCount_spinBox.value()
		# create data variable
		options = {}
		options['chainsCount'] = chainsCount
		options['elementsCount'] = elementsCount
		# rebuild current module
		mainInstance.rebuildModule(options)
		
	def rerootPosersToMainPoser(self):
		sel = cmds.ls(sl=1)

		def par(name):
			posers = []
			possible_posers = cmds.listRelatives(name+"_mainPoser", ad=1)
			for p in possible_posers:
				if p.split("_")[-1] == "poser":
					posers.append(p)

			for p in posers:
				cur_parent = cmds.listRelatives(p, p=1)[0]
				if cur_parent != name+"_mainPoser":
					cmds.parent(p, name+"_mainPoser")

		par(self.name)
		par(utils.getOppositeObject(self.name))

		if len(sel) > 0:
			cmds.select(sel)

	def rerootPosersToChain(self):
		sel = cmds.ls(sl=1)

		def par(name):
			posers = []
			possible_posers = cmds.listRelatives(name+"_mainPoser", ad=1)
			for p in possible_posers:
				if p.split("_")[-1] == "poser":
					posers.append(p)

			for p in posers:
				if p == name+"_root_poser":
					continue
				num = int( p.split("_")[-2] ) 
				root_name = p.split(str(num)+"_poser")[0]
				if num == 1:
					par = name + "_root_poser"
				else:
					par = root_name + str(num-1) + "_poser"
				
				if cmds.listRelatives(p, p=1)[0] != par:
					cmds.parent(p, par)

		par(self.name)
		try:
			par(utils.getOppositeObject(self.name))			
		except: pass

		if len(sel) > 0:
			cmds.select(sel)		
	
	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()
		childs = cmds.listRelatives(self.name+"_root_joint")
		
		for j in childs:
			cmds.setAttr(j+".segmentScaleCompensate", 0)