import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import os, imp
from functools import partial

from ... import utils, module, main, controller, rigTools, posers

version = int(cmds.about(v=True).split(" ")[0])
if version >= 2020:
	from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
else:
	from rigStudio2.Qt import QtWidgets, QtGui, QtCore, QtUiTools

rootDebug = ""
fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])

class Chain(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1] # type is equal file name
		self.length = 3.0
		self.controlsCount = 3

	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))
		w.parentIsChain_btn.clicked.connect(self.rerootPosersToChain)
		w.parentIsMainPoser_btn.clicked.connect(self.rerootPosersToMainPoser)

	def create(self, options={}):
		self.root = self.name + "_mod"
		joints = []

		# import template rig
		template_path = rootPath + '//modules//_template.ma'
		utils.importFile(template_path, self.name)
		cmds.delete(self.name+'_root_outJoint')

		cmds.sets(n=self.name+'_skinJointsSet')
		cmds.sets(self.name+'_skinJointsSet', e=1, forceElement=self.name+'_sets' )		
		
		if options == {}:
			controlsCount = self.controlsCount
		else:
			controlsCount = options['controlsCount']
		
		# create posers
		cmds.setAttr(self.name+"_root_poser.size", 0.5)
		for i in range(1, controlsCount):
			poser = cmds.duplicate(self.name+'_root_poser', rr=1, n=self.name+'_element_'+str(i+1)+'_poser')[0]
			cmds.setAttr(poser+".size", 0.5)
			
			childs = pm.listRelatives(poser, allDescendents=1)
			for o in childs:
				if pm.objExists(o):
					pm.rename(o, o.replace("root", 'element_'+str(i+1)))
			
			mns = cmds.createNode("makeNurbSphere", name=poser+"_makeNurbSphere")
			mult = cmds.createNode("multDoubleLinear", name=poser+"_multDoubleLinear")
			cmds.connectAttr(self.name+"_mainPoser.globalSize", mult+".input1")
			cmds.connectAttr(poser+".size", mult+".input2")
			cmds.connectAttr(mult+".output", mns+".radius")
			cmds.connectAttr(mns+".outputSurface", poser+"Shape.create")
			cmds.setAttr(poser+'.tx', self.length/controlsCount*float(i)*4)	

			if i > 1:
				cmds.parent( poser, poser.replace(str(i+1)+"_poser", str(i)+"_poser") )
			else:
				cmds.duplicate(self.name+"_root_initLoc", n=self.name+"_element_1_initLoc")
				
		cmds.parent( self.name+'_element_2_poser', self.name+'_root_poser' )

		cmds.setAttr(self.name+"_mainPoser.globalSize", 0.5)

		# create control, groups and joint
		cu = controller.Control()
		for i in range(controlsCount):
			n = i+1
			
			ctrl = self.name+'_element_'+str(n)
			cu.create(ctrl, 'circle', colorId=18, offset=False, joint=False)
			utils.setUserAttr(ctrl, 'internalName', 'element_'+str(n))
			utils.setUserAttr(ctrl, 'type', "control")
			cmds.setAttr(ctrl+'.sx', 2)
			cmds.setAttr(ctrl+'.sy', 2)
			cmds.setAttr(ctrl+'.sz', 2)
			cmds.setAttr(ctrl+'.rz', -90)
			cmds.makeIdentity(ctrl, apply=1, r=1, s=1)
			utils.lockChannels(ctrl, [])

			cmds.sets(ctrl, forceElement=self.name+'_moduleControlSet')
			cmds.sets(ctrl, forceElement=self.name+'_nodesSet')
			cmds.group(ctrl, n=ctrl+"_offset")
			cmds.group(ctrl+"_offset", n=ctrl+"_group")
			jnt = cmds.joint(n=self.name+'_element_'+str(n)+'_outJoint')
			cmds.parent(jnt, ctrl)
			joints.append(jnt)
			
			cmds.sets(jnt, e=1, forceElement=self.name+'_skinJointsSet')
			cmds.sets(jnt, e=1, forceElement=self.name+'_nodesSet')

			# add mudule attrs
			# utils.addModuleNameAttr(ctrl, self.name)
			# utils.addModuleNameAttr(ctrl+"_offset", self.name)
			# utils.addModuleNameAttr(ctrl+"_group", self.name)
			# utils.addModuleNameAttr(jnt, self.name)
			
			# create and orient controlInitLoc to control
			if i == 0:
				controlInitLoc = cmds.duplicate(self.name+'_root_initLoc', n=ctrl+'_initLoc')[0]
			else:
				controlInitLoc = cmds.duplicate(ctrl+'_initLoc', n=ctrl+'_initLoc')[0]
			con = cmds.orientConstraint(ctrl, controlInitLoc, mo=0)
			cmds.delete(con)			

			# parent
			if i > 0:
				cmds.parent(ctrl+"_group", self.name + "_element_" + str(n-1))
				cmds.setAttr(ctrl+"_group.ty", self.length/controlsCount)
				cmds.parent(jnt, joints[i-1])
				mirror_mat = cmds.createNode('composeMatrix')
				
				if self.name.split("_")[0] == 'r':
					cmds.setAttr(mirror_mat+".inputScaleX", -1)
				utils.connectByMatrix(jnt, [mirror_mat, ctrl, jnt], ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name, attrs=['t', 'r'] )
			else:
				cmds.parent(ctrl+"_group", self.name+"_controls")
				cmds.parent(jnt, self.name+"_outJoints")
				utils.connectByMatrix(self.name+'_element_1_group', [self.name+'_root_connector'] )
				mirror_mat = cmds.createNode('composeMatrix')
				if self.name.split("_")[0] == 'r':
					cmds.setAttr(mirror_mat+".inputScaleX", -1)
				utils.connectByMatrix(jnt, [mirror_mat, ctrl, jnt], ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name, attrs=['t', 'r'] )
				
				decMat = pm.createNode('decomposeMatrix', n=ctrl+"_scale_decomposeMatrix")
				mult = pm.createNode('multDoubleLinear', n=ctrl+"_scale_multDoubleLinear")
				cond = pm.createNode('condition', n=ctrl+"_scale_condition")
				c = pm.PyNode(ctrl)
				
				c.worldMatrix[0] >> decMat.inputMatrix
				decMat.outputScaleZ >> mult.input1
				mult.input2.set(-1)
				mult.output >> cond.colorIfFalseR
				decMat.outputScaleZ >> cond.colorIfTrueR
				decMat.outputScaleZ >> cond.firstTerm
				cond.operation.set(2)
				
				pm.connectAttr(decMat.outputScaleX, self.name+"_outJoints.sx")
				pm.connectAttr(decMat.outputScaleY, self.name+"_outJoints.sy")
				pm.connectAttr(cond.outColorR, self.name+"_outJoints.sz")

			cmds.setAttr(jnt+".jointOrientX", 0)
			cmds.setAttr(jnt+".jointOrientY", 0)
			cmds.setAttr(jnt+".jointOrientZ", 0)			
			cmds.setAttr(jnt+".segmentScaleCompensate", 0)		
			cmds.setAttr(jnt+".drawStyle", 2)		
    
			# add lines, connect posers
			if n > 1:
				if n == 2:
					p1 = self.name+'_root_poser'
					sec_tar = self.name+'_root_poserOrient'
				else:
					p1 = self.name+'_element_'+str(i)+'_poser'
					sec_tar = self.name+'_element_'+str(i)+'_poserOrient'
					
				utils.connectByMatrix(ctrl+"_group", [ctrl+"_poserOrient", sec_tar], 
								      ['worldMatrix[0]', 'worldInverseMatrix[0]'])
				
				p2 = self.name+'_element_'+str(i+1)+'_poser'
				# rigTools.posers.connectPosers(p1, p2, name_m=self.name+"_")
				posers.connectPosers(p1, p2, name_m=self.name+"_")

				cmds.setAttr(p1+'.lineWidth', 2)
				cmds.setAttr(p2+'.lineWidth', 2)

				cmds.sets(self.name+'_element_'+str(i+1)+"_nodesSet", e=1, forceElement=self.name+"_nodesSet")
		
		cmds.rename(self.name+'_element_1_outJoint', self.name+'_root_outJoint')
				
		cmds.sets(self.name+'_nodesSet', e=1, forceElement=self.name+'_sets')

		# add init locs
		for i in range(2, controlsCount+1):
			p = self.name+'_element_'+str(i)+'_poser'
			l = cmds.spaceLocator(n=self.name+'_element_'+str(i)+'_skinJoint_initLoc')[0]
			
			utils.addModuleNameAttr(l, self.name)			
			cmds.parent(l, p)
			utils.resetAttrs(l)
			cmds.hide(l)
			
			cmds.connectAttr(self.name+"_mirror_condition.outColorR", self.name+'_element_'+str(i)+"_initLoc.sx")
		
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
			
		# posers materials
		# cmds.delete(self.name+"_red_rsMat")
		# cmds.delete(self.name+"_green_rsMat")
		# cmds.delete(self.name+"_blue_rsMat")
		# cmds.delete(self.name+"_black_rsMat")
		# for o in cmds.listRelatives(self.name+"_posers", allDescendents=1, type='transform'):
		# 	if "_axis_x" in o:
		# 		cmds.sets(o, e=1, forceElement='red_rsSG')
		# 	elif "_axis_y" in o:
		# 		cmds.sets(o, e=1, forceElement='green_rsSG')
		# 	elif "_axis_z" in o:
		# 		cmds.sets(o, e=1, forceElement='blue_rsSG')
				
		# for o in cmds.listRelatives(self.name+"_lines_group"):
		# 	cmds.sets(o, e=1, forceElement='black_rsSG')
		
		# for o in cmds.listRelatives(self.name+"_posers", allDescendents=1):
		# 	utils.addModuleNameAttr(o, self.name)			
		# 

		# lines attr
		cmds.setAttr(self.name+"_mainPoser.lineSize", 1.5)
		for i in range(controlsCount):
			if i == 0:
				poser = self.name+'_root_poser'
			else:
				poser = self.name+'_element_'+str(i+1)+'_poser'
			cmds.connectAttr(self.name+'_mainPoser.lineSize', poser+'.lineWidth')
			cmds.setAttr(poser+'.lineWidth', k=0, cb=0)

		cmds.parent(self.root, 'modules')	

	def updateOptionsPage(self, widget):
		self.getOptions()
		
		#pixmap = QtGui.QPixmap(rootPath+'//modules//chain//helpScreen_1.png')
		#widget.image_label.setPixmap(pixmap)		

		widget.jointsCount_spinBox.setValue(self.controlsCount)
		
	def getOptions(self):
		posers = []
		for p in cmds.listRelatives(self.name+'_posers', allDescendents=1):
			if p.split('_')[-1] == 'poser':
				posers.append(p)
		self.controlsCount = len(posers)		

		optionsData = {}
		optionsData['controlsCount'] = self.controlsCount
		
		return optionsData				

	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	
		
	def rebuildWithNewOptions(self, mainInstance, widget):
		controlsCount = widget.jointsCount_spinBox.value()

		# create data variable
		options = {}
		options['controlsCount'] = controlsCount

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
		par(utils.getOpposite(self.name))
				
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
				if num == 2:
					par = name + "_root_poser"
				else:
					par = name + "_element_" + str(num-1) + "_poser"

				try:
					cmds.parent(p, par)
				except: pass
			
		par(self.name)

		if self.symmetrical:
			par(utils.getOpposite(self.name))		
			
		if len(sel) > 0:
			cmds.select(sel)		
								
	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()

		root_j = self.name + "_root_skinJoint"

		childs = cmds.listRelatives(root_j)
		if len(childs) > 0:
			sec_j = childs[0]
			if cmds.objectType(sec_j) == "joint":
				cmds.setAttr(sec_j+".segmentScaleCompensate", 0)

		for j in cmds.listRelatives(root_j, allDescendents=1):
			cmds.sets(j, e=1, forceElement=self.name+"_nodesSet")

		cmds.sets(root_j, e=1, forceElement=self.name+"_nodesSet")				