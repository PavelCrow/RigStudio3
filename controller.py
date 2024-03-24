import maya.cmds as cmds
import json
import os
import pymel.core as pm

from .import utils
	
rootPath = os.path.normpath(os.path.dirname(__file__))

class Control(object):
	def __init__(self):
		self.name = ""
		#self.root = ""
		self.parent = ""
		self.deep = 0
		self.mirrored = False
		self.colorId = 0
		self.visible = True

	def create(self, name, ctrl_type, colorId=18, tuner=True, offset=True, joint=True):
		#print 1111, name
		#name = utils.incrementNameIfExists(name)
		
		#exec(self.curvesCommand_list[ctrl_type])
		pm.mel.eval("source pk_makeControls")
		if ctrl_type == 'circle':
			command = "pk_makeCircle(\"%s\", \"y\")" %name
			pm.mel.eval(command)
		elif ctrl_type == 'square':
			
			with open(rootPath + '/controlShapes.cmds', mode='r') as f:
				controlShapes_data = json.load(f)		
				command = controlShapes_data['square']
				eval(command)
				
		elif ctrl_type == 'box':
			command = "pk_makeCube(\"%s\")" %name
			pm.mel.eval(command)
		elif ctrl_type == 'sphere':
			command = "pk_makeSphere(\"%s\")" %name
			pm.mel.eval(command)

		else:
			command = "pk_makeCircle(\"%s\", \"y\")" %name
			pm.mel.eval(command)
		
		pm.mel.eval('makeIdentity -apply true -t 0 -r 0 -s 1 -n 0;')				

		ctrl = cmds.ls(sl=1)[0]
		ctrl = cmds.rename(ctrl, name)
		utils.setUserAttr(ctrl, 'internalName', name)
		utils.fixShapeName(name)

		self.name = name
		
		if tuner:
			cmds.select(ctrl)
			tuner_loc = cmds.spaceLocator(n=name+'_tuner')
			cmds.parent(ctrl, tuner_loc)
		
		if offset:
			cmds.select(ctrl)
			offset_grp = cmds.group(n=name+'_group')
			cmds.select(ctrl)
		
		if joint:
			j = cmds.joint(n=name+'_outJoint')
			
		# get root
		#self.getRoot()
		
		#cmds.select(self.root)
		self.setColor(colorId)
		
		
	
	def select(self):
		cmds.select(self.name)
	
	def load(self, name):
		self.name = name
		#self.root = name
		
		# get color id
		sh = cmds.listRelatives(self.name, s=1)[0]
		self.colorId = cmds.getAttr(sh+".overrideColor")
		#self.getRoot()
		self.getParent()
		self.mirrored = self.isMirrored()
		
	#def getRoot(self):
		
		#self.root = self.name
		
		#parents = cmds.listRelatives(self.name, parent=1) or []
		#if len(parents) > 0:
			#par = parents[0]
			#if par == self.name + '_group':
				#self.root = par
		
		#parents = cmds.listRelatives(self.root, parent=1) or []
		#if len(parents) > 0:
			#par = parents[0]
			#if par == self.name + '_tuner':
				#self.root = par		
						
	def replaceShape(self, command):
		#print len(command), command
		sel = cmds.ls(sl=1)
		
		ctrl = pm.PyNode(self.name)
		ctrl_shapes = pm.listRelatives(ctrl, s=1)
		
		# save input connections (visibility)
		vis_conns = []
		for s in ctrl_shapes:
			conns = cmds.listConnections(s.name(), plugs=1, connections=1, s=1, d=0) or []
			#if len(conns) > 0 and cmds.objectType(conns[1]) == 'transformGeometry':
				#return
			vis_conns.append(conns)
			
		# save output connections (transformGeometry)
		out_conns = []
		for s in ctrl_shapes:
			conns = cmds.listConnections(s.name(), plugs=1, connections=1, s=0, d=1) or []
			#if len(conns) > 0 and cmds.objectType(conns[1]) == 'transformGeometry':
				#return
			out_conns.append(conns)
		
		pm.delete(ctrl_shapes)		
				
		# add all new curves to list
		crvs = []
		c = ""
		
		if type(command).__name__ == "list":
			for com in command:
				#print com
				exec(com)
				c = cmds.ls(sl=1)[0]
				crvs.append(c)
		else:
			exec(command)
			c = cmds.ls(sl=1)[0]
			crvs.append(c)				
		
		# parent all shapes to control
		for c in crvs:
			s = cmds.listRelatives(c, s=1)[0]
			cmds.parent(s, ctrl.name(), r=1, s=1)
			cmds.delete(c)
					
		# rename shapes    
		shs = cmds.listRelatives(ctrl.name(), s=1)
		for i, s in enumerate(shs):
			if i == 0:
				cmds.rename(s, ctrl.name()+'Shape')
			else:
				cmds.rename(s, ctrl.name()+'Shape'+str(i))
		
		# restore color
		self.setColor(self.colorId)
		
		# restore visibility connections
		for con in vis_conns:
			if len(con) > 0:
				try:
					pm.setAttr(con[0], l=0)
					pm.connectAttr(con[1], con[0])	
				except: pass #print "Miss Shape ", con[0], con[1] 				

				
		# restore out connections
		for con in out_conns:
			if len(con) > 0:
				try:
					pm.setAttr(con[1], l=0)
					pm.connectAttr(con[0], con[1])	
				except: pass #print "Miss Shape ", con[0], con[1] 
		
		if len(sel) > 0:
			cmds.select(sel)
		
	def setColor(self, colorId, ctrl=""):
		if type(colorId) == list:
			colorId = colorId[0]		
		
		shapes = cmds.listRelatives(self.name, s=1)
		for sh in shapes:
			cmds.setAttr(sh+".overrideEnabled", 1)
			cmds.setAttr(sh+".overrideColor", colorId)
			if colorId == 0:
				cmds.setAttr(sh+".overrideEnabled", 0)
				
		self.colorId = colorId

	#def getColor(self, ctrl=""): # unused
		#logger.debug(traceback.extract_stack()[-1][2])
		
		#sh = cmds.listRelatives(ctrl, s=1)[0]
		#if cmds.getAttr(sh+".overrideEnabled"):
			
		#cmds.setAttr(sh+".overrideColor", colorId)
		#if colorId == 0:
			#cmds.setAttr(sh+".overrideEnabled", 0)
		
		#cmds.select(clear=1)

	def toggleVisible(self, manual=False, value=False):
		shapes = cmds.listRelatives(self.name, s=1)
		
		if manual:
			vis = not value
		else:
			vis = cmds.getAttr(shapes[0]+'.v')
		for s in shapes:
			try:
				if vis:
					cmds.setAttr(s+'.v', 0)
				else:
					cmds.setAttr(s+'.v', 1)
			except:
				pass
		
	def getParent(self):
		self.parent = ""
		
		if cmds.objExists(self.name+"_group"):
			parents = cmds.listRelatives(self.name+"_group", parent=1)
			self.parent = parents[0]
			
		#if len(parents) == 0: # twists control have not parent

		
		return self.parent

	def rename(self, in_newName):
		sym = self.isSymmetry()
		
		def doRename(name, newName):
			allNodes = cmds.ls()
			for n in ['tuner', 'group', 'joint', "decMat", 'outJoint', 'addPoser', 'poser_cluster', 'poserOrient', "addPoser_catcher", "poser_clusterHandle", "poser_locShape",
			          'poser_axis_x', 'poser_axis_y', 'poser_axis_z', 'tuner_decMat', 'tuner_multMat', 'initLoc', 'controlInitLoc', 'group_decMat', 'group_multMat']:
				#print name+'_'+n, cmds.objExists(name+'_'+n)
				if cmds.objExists(name+'_'+n):
					cmds.rename(name+'_'+n, newName+'_'+n)
			cmds.rename(name, newName)
				
		#print self.name, in_newName
		doRename(self.name, in_newName)
		
		if sym:
			doRename(utils.getOpposite(self.name), utils.getOpposite(in_newName))
			
		self.name = in_newName
		utils.setUserAttr(in_newName, 'internalName', in_newName)
		
	def getColor(self):
		shapes = cmds.listRelatives(self.name, s=1)
		if cmds.getAttr(shapes[0]+".overrideEnabled"):
			color = cmds.getAttr(shapes[0]+'.overrideColor')
		else:
			color = 0
		return color		
			
	def getChildren(self):
		nodes = cmds.listRelatives(self.name)
		children = []
		for n in nodes:
			if n.split('_')[-1] == 'connector':
				children.append(n.split('_connector')[0])
		
		return children

	def controlShapeToCommand(self, useInternalName=False):
		name = self.name
		
		if useInternalName:
			name = cmds.getAttr(name + ".internalName")
		
		pyCmds = utils.curveShapeToCommand(name)

		return pyCmds
	
	def getAttrData(self):
		cmds.select(self.name)
		attrData = {}
		attrList = []
		attrListKeyable = cmds.listAttr( keyable=True )
		if type(attrListKeyable) != list :
			attrListKeyable = []
		attrListNonkeyable = cmds.listAttr( channelBox = True )
		if type(attrListNonkeyable) != list :
			attrListNonkeyable = []
		attrList = attrListKeyable + attrListNonkeyable
		#print attrListKeyable
		for attr in attrList:
			attrVar = cmds.getAttr(self.name + "." + attr)
			attrData[(self.name + "." + attr)] = attrVar
		
		return attrData
	
	def getData(self):
		data = {}
		p = self.name+"_addPoser"

		data['name'] = self.name			
		#data['root'] = self.root
		data['poser'] = p
		data['parent'] = self.getParent()
		data['poserParent'] = cmds.listRelatives(p, p=1)[0]
		data['mirrored'] = self.mirrored
		data['deep'] = self.deep
		data['pos'] = cmds.xform(p, q=1, m=1, ws=1)
		data['colorId'] = self.getColor()
		data['shape'] = self.controlShapeToCommand()	
		
		attrs_data = {}
		for attr in utils.getVisibleAttrs(p):
			value = cmds.getAttr(p + "." + attr)
			attrs_data[attr] = value
		data["poserAttrsData"] = attrs_data			
		
		return data

	def isSymmetry(self):
		if self.name.split('_')[0] == 'l':
			if cmds.objExists(utils.getOpposite(self.name)):
				return True
		return False

	def isMirrored(self):
		if self.name.split('_')[0] == 'r':
			if cmds.objExists(utils.getOpposite(self.name)):
				return True
		return False
	
	def delete(self):
		if cmds.objExists(self.name+"_group"):
			cmds.delete(self.name+"_group")

		if cmds.objExists(self.name+'_joint'):
			cmds.delete(self.name+'_joint')

	def isVisible(self):
		shapes = cmds.listRelatives(self.name, s=1)
		vis = cmds.getAttr(shapes[0]+'.v')
		
		return vis