import maya.cmds as cmds
import maya.mel as mel
import json
import os
import pymel.core as pm

from .import utils
	
rootPath = os.path.normpath(os.path.dirname(__file__))

class Control(object):
	def __init__(self):
		self.name = ""
		self.parent = ""
		self.deep = 0
		self.opposite = False
		self.colorId = 0
		self.visible = True

	def create(self, name, shape, colorId=18, offset=True, joint=True): #
		name = cmds.circle(n=name)[0]
		cmds.DeleteHistory()
		
		if shape == "circle":
			cmd = 'cmds.curve(name = "_ctrl_temp_", per = True, d= 3,p= [[0.78220172572844116, 4.7896041985043591e-17, -0.78220172572844004], [-1.2620422609855989e-16, 6.7735232159239798e-17, -1.1062002890368023], [-0.78220172572844016, 4.7896041985043647e-17, -0.78220172572844016], [-1.1062002890368023, 1.9539677860741656e-32, -3.2011531745708022e-16], [-0.7822017257284406, -4.7896041985043622e-17, 0.78220172572844016], [-3.3331973582254345e-16, -6.7735232159239823e-17, 1.1062002890368023], [0.78220172572844004, -4.7896041985043665e-17, 0.78220172572844038], [1.1062002890368023, -3.6469023143475602e-32, 5.9457618450434596e-16], [0.78220172572844116, 4.7896041985043591e-17, -0.78220172572844004], [-1.2620422609855989e-16, 6.7735232159239798e-17, -1.1062002890368023], [-0.78220172572844016, 4.7896041985043647e-17, -0.78220172572844016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])'
		elif shape == "square":
			cmd = 'cmds.curve(name = "_ctrl_temp_", d= 1,p= [[-1.0, 0.0, -1.0], [1.0, 0.0, -1.0], [1.0, 0.0, 1.0], [-1.0, 0.0, 1.0], [-1.0, 0.0, -1.0]])'
		elif shape == "sphere":
			cmd = 'cmds.curve(name = "_ctrl_temp_", d= 1,p= [[0.0, 1.002749026262481, 0.0], [0.0, 0.92641977038338208, 0.38373500561720547], [0.0, 0.70905085571338344, 0.70905085571338344], [0.0, 0.38373500561720547, 0.92641977038338208], [0.0, 0.0, 1.002749026262481], [0.0, -0.38373500561720547, 0.92641977038338208], [0.0, -0.70905085571338344, 0.70905085571338344], [0.0, -0.92641977038338208, 0.38373500561720547], [0.0, -1.002749026262481, 0.0], [0.0, -0.92641977038338208, -0.38373500561720547], [0.0, -0.70905085571338344, -0.70905085571338344], [0.0, -0.38373500561720547, -0.92641977038338208], [0.0, 0.0, -1.002749026262481], [0.0, 0.38373500561720547, -0.92641977038338208], [0.0, 0.70905085571338344, -0.70905085571338344], [0.0, 0.92641977038338208, -0.38373500561720547], [0.0, 1.002749026262481, 0.0], [0.38373500561720547, 0.92641977038338208, 0.0], [0.70905085571338344, 0.70905085571338344, 0.0], [0.92641977038338208, 0.38373500561720547, 0.0], [1.002749026262481, 0.0, 0.0], [0.92641977038338208, -0.38373500561720547, 0.0], [0.70905085571338344, -0.70905085571338344, 0.0], [0.38373500561720547, -0.92641977038338208, 0.0], [0.0, -1.002749026262481, 0.0], [-0.38373500561720547, -0.92641977038338208, 0.0], [-0.70905085571338344, -0.70905085571338344, 0.0], [-0.92641977038338208, -0.38373500561720547, 0.0], [-1.002749026262481, 0.0, 0.0], [-0.92641977038338208, 0.38373500561720547, 0.0], [-0.70905085571338344, 0.70905085571338344, 0.0], [-0.38373500561720547, 0.92641977038338208, 0.0], [0.0, 1.002749026262481, 0.0], [0.0, 0.92641977038338208, -0.38373500561720547], [0.0, 0.70905085571338344, -0.70905085571338344], [0.0, 0.38373500561720547, -0.92641977038338208], [0.0, 0.0, -1.002749026262481], [-0.38373500561720547, 0.0, -0.92641977038338208], [-0.70905085571338344, 0.0, -0.70905085571338344], [-0.92641977038338208, 0.0, -0.38373500561720547], [-1.002749026262481, 0.0, 0.0], [-0.92641977038338208, 0.0, 0.38373500561720547], [-0.70905085571338344, 0.0, 0.70905085571338344], [-0.38373500561720547, 0.0, 0.92641977038338208], [0.0, 0.0, 1.002749026262481], [0.38373500561720547, 0.0, 0.92641977038338208], [0.70905085571338344, 0.0, 0.70905085571338344], [0.92641977038338208, 0.0, 0.38373500561720547], [1.002749026262481, 0.0, 0.0], [0.92641977038338208, 0.0, -0.38373500561720547], [0.70905085571338344, 0.0, -0.70905085571338344], [0.38373500561720547, 0.0, -0.92641977038338208], [0.0, 0.0, -1.002749026262481]])'
		elif shape == "box":
			cmd = 'cmds.curve(name = "_ctrl_temp_", d= 1,p= [[-1.0, 1.0, 1.0], [-1.0, 1.0, -1.0], [1.0, 1.0, -1.0], [1.0, 1.0, 1.0], [-1.0, 1.0, 1.0], [-1.0, -1.0, 1.0], [-1.0, -1.0, -1.0], [-1.0, 1.0, -1.0], [-1.0, 1.0, 1.0], [-1.0, -1.0, 1.0], [1.0, -1.0, 1.0], [1.0, 1.0, 1.0], [1.0, 1.0, -1.0], [1.0, -1.0, -1.0], [1.0, -1.0, 1.0], [1.0, -1.0, -1.0], [-1.0, -1.0, -1.0]])'
		else: # circle
			cmd = 'cmds.curve(name = "_ctrl_temp_", per = True, d= 3,p= [[0.78220172572844116, 4.7896041985043591e-17, -0.78220172572844004], [-1.2620422609855989e-16, 6.7735232159239798e-17, -1.1062002890368023], [-0.78220172572844016, 4.7896041985043647e-17, -0.78220172572844016], [-1.1062002890368023, 1.9539677860741656e-32, -3.2011531745708022e-16], [-0.7822017257284406, -4.7896041985043622e-17, 0.78220172572844016], [-3.3331973582254345e-16, -6.7735232159239823e-17, 1.1062002890368023], [0.78220172572844004, -4.7896041985043665e-17, 0.78220172572844038], [1.1062002890368023, -3.6469023143475602e-32, 5.9457618450434596e-16], [0.78220172572844116, 4.7896041985043591e-17, -0.78220172572844004], [-1.2620422609855989e-16, 6.7735232159239798e-17, -1.1062002890368023], [-0.78220172572844016, 4.7896041985043647e-17, -0.78220172572844016]], k = [-2.0, -1.0, 0.0, 1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0, 10.0])'

		self.name = name

		self.setShape(cmd)

		utils.setUserAttr(name, 'internalName', name)
		utils.fixShapeName(name)

		# set tag as controller
		cmds.select(name)
		mel.eval("TagAsController")
		cmds.select(clear=1)
		
		if offset:
			cmds.select(name)
			cmds.group(n=name+'_group')
		
		if joint:
			cmds.select(name)
			cmds.joint(n=name+'_outJoint')

		self.setColor(colorId)



	def select(self):
		cmds.select(self.name)
	
	def load(self, name):
		self.name = name

		# get color id
		sh = cmds.listRelatives(self.name, s=1)[0]
		self.colorId = cmds.getAttr(sh+".overrideColor")
		self.getParent()
		self.opposite = self.isOpposite()
						
	def setShape(self, command):
		sel = cmds.ls(sl=1)
		ctrl = pm.PyNode(self.name)
		ctrl_shapes = pm.listRelatives(ctrl, s=1)
		
		# save input connections (visibility)
		vis_conns = []
		for s in ctrl_shapes:
			conns = cmds.listConnections(s.name(), plugs=1, connections=1, s=1, d=0) or []
			vis_conns.append(conns)
			
		# save output connections (transformGeometry)
		out_conns = []
		for s in ctrl_shapes:
			conns = cmds.listConnections(s.name(), plugs=1, connections=1, s=0, d=1) or []
			out_conns.append(conns)
		
		pm.delete(ctrl_shapes)		
				
		# add all new curves to list
		crvs = []
		c = ""
		
		if type(command).__name__ == "list":
			for com in command:
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
		
	def getParent(self): #
		self.parent = ""
		if utils.objectIsAdditionalControl(self.name):
			if cmds.objExists(self.name+"_group"):
				parents = cmds.listRelatives(self.name+"_group", parent=1)
				self.parent = parents[0]
				mod_name = utils.getModuleName(self.name)
				if self.parent == mod_name+"_controls":
					self.parent = cmds.connectionInfo(self.name+"_group_multMat.matrixIn[2]", sourceFromDestination=True).split(".")[0]
		return self.parent

	def rename(self, in_newName):
		sym = self.isSymmetry()
		
		def doRename(name, newName):
			allNodes = cmds.ls()
			for n in ['tuner', 'group', 'joint', "decMat", 'outJoint', 'addPoser', 'poser_cluster', 'poserOrient', "addPoser_catcher", "poser_clusterHandle", "poser_locShape",
			          'poser_axis_x', 'poser_axis_y', 'poser_axis_z', 'tuner_decMat', 'tuner_multMat', 'initLoc', 'controlInitLoc', 'group_decMat', 'group_multMat']:
				if cmds.objExists(name+'_'+n):
					cmds.rename(name+'_'+n, newName+'_'+n)
			cmds.rename(name, newName)
				
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
		for attr in attrList:
			attrVar = cmds.getAttr(self.name + "." + attr)
			attrData[(self.name + "." + attr)] = attrVar
		
		return attrData
	
	def getData(self):
		data = {}
		p = self.name+"_addPoser"

		data['name'] = self.name			
		data['poser'] = p
		data['parent'] = self.getParent()
		data['poserParent'] = cmds.listRelatives(p, p=1)[0]
		data['opposite'] = self.opposite
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

	def isOpposite(self):
		if utils.getObjectSide(self.name) == 'r':
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
	

