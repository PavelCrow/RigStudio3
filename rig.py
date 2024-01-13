import maya.cmds as cmds
import maya.mel as mel
import logging, traceback, os, imp, math, sys

if sys.version[0] == "2":
	import main, utils
else:
	import importlib
	import rigStudio2.main as main
	import rigStudio2.utils as utils
	
	importlib.reload(main)
	importlib.reload(utils)
	

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.setLevel(logging.DEBUG)

rootDebug = ""

def debugStart(func, noEnd=False):
	if not main.configData['debug']: return
	global rootDebug
	rootDebug = rootDebug + ' -> ' + func
	logger.debug(rootDebug + ' -> ')	
	
	if noEnd:
		rootDebug = rootDebug.split(' -> ' + func)[0]	

def debugEnd(func):
	if not main.configData['debug']: return
	global rootDebug
	logger.debug(rootDebug + " -| ")
	rootDebug = rootDebug.split(' -> ' + func)[0]	

class Rig(object):
	def __init__(self, name='character'):
		debugStart(traceback.extract_stack()[-1][2])
		
		self.name = name
		self.moduleNames = []
		self.modules = {}
		#self.addControls = []
		self.exists = False
		self.root_group = 'main'
		
		self.load()
		
		debugEnd(traceback.extract_stack()[-1][2])
				
	def load(self):
		debugStart(traceback.extract_stack()[-1][2])
		
		if cmds.objExists('modules') and cmds.objExists('rig'):
			self.exists = True
			self.root_group = cmds.listRelatives( 'rig', parent=1 )[0]
		else:
			return
			
		# get rig name
		allNodes = cmds.ls()
		for n in allNodes:
			if cmds.objExists(n+".nodeType"):
				if cmds.getAttr(n+".nodeType") == 'rs_rig':
					self.name = cmds.getAttr(n+".name")
					break
				
		# load modules
		modules_folders = cmds.listRelatives('modules') or []

		for f in modules_folders:
			if cmds.attributeQuery( 'moduleType', node=f, exists=True ):
				moduleName = f[:-4]
				if not cmds.objExists(moduleName+"_posers"):
					continue
				m = utils.getModuleInstance(moduleName)
				if not m:
					continue
				self.modules[moduleName] = m
		
		# get ordered ModuleNames
		self.updateModuleNames()
			
		debugEnd(traceback.extract_stack()[-1][2])
				
	def create(self):
		debugStart(traceback.extract_stack()[-1][2])

		# create main group
		root = cmds.group(empty=True, n="main")

		# add attributes
		utils.setUserAttr(root, 'nodeType', 'rs_rig')
		utils.setUserAttr(root, 'name', self.name)
		utils.setUserAttr(root, 'rs_version', 2, type="float", lock=0)
		utils.setUserAttr(root, 'posersSize', 1, type="float", lock=0)
		utils.setUserAttr(root, 'jointsSize', 1, type="float", lock=0)
		utils.setUserAttr(root, 'posersAxises', 0, type="bool", lock=1)
		utils.setUserAttr(root, 'jointsAxises', 0, type="bool", lock=1)

		# create groups
		cmds.group(empty=True, n="geo", p=root)
		rig = cmds.group(empty=True, n="rig", p=root)
		cmds.group(empty=True, n="modules", p=rig)
		cmds.group(empty=True, n="skeleton", p=rig)
		#cmds.group(empty=True, n="addControls", p=rig)
		cmds.group(empty=True, n="twists", p=rig)
		cmds.select(clear=True)
		
		cmds.setAttr("skeleton.overrideEnabled", 1)
		cmds.setAttr("skeleton.overrideColor", 29)
		cmds.setAttr("skeleton.template", True)
		
		cmds.sets(n='controlSet')
		cmds.sets(n='sets')
		cmds.sets('controlSet', e=1, forceElement='sets' )
		cmds.sets(n='skinJointsSet')
		cmds.sets('skinJointsSet', e=1, forceElement='sets' )
		cmds.sets(n='modules_sets')
		cmds.sets('modules_sets', e=1, forceElement='sets' )
		
		self.exists = True


		def createShader(name, color):
			shader = cmds.shadingNode("surfaceShader",asUtility=True, n=name+"_rsMat")
			shading_group = cmds.sets(renderable=True,noSurfaceShader=True,empty=True, n=name+"_rsSG")
			cmds.connectAttr('%s.outColor' %shader ,'%s.surfaceShader' %shading_group)
			cmds.setAttr('%s.outColor' %shader, color[0],color[1],color[2], type="double3" )

		if not cmds.objExists("red_rsMat"):
			createShader("red", [1,0,0])
			createShader("green", [0,1,0])
			createShader("blue", [0,0,1])
			createShader("black", [0,0,0])
		
		debugEnd(traceback.extract_stack()[-1][2])

	def delete(self):
		debugStart(traceback.extract_stack()[-1][2])

		for m_name in self.modules:
			m = self.modules[m_name]
			m.delete()

		cmds.delete("main")

		allNodes = cmds.ls()
		for n in allNodes:
			if cmds.objExists(n+".moduleName"):
				cmds.delete(n)
		
		if cmds.objExists('sets'):
			cmds.delete('sets')
			
		self.exists = False
		self.moduleNames = []
		self.modules = {}		
		
		cmds.delete("red_rsMat")
		cmds.delete("green_rsMat")
		cmds.delete("black_rsMat")
		cmds.delete("blue_rsMat")
		cmds.delete("red_rsSG")
		cmds.delete("green_rsSG")
		cmds.delete("black_rsSG")
		cmds.delete("blue_rsSG")
		
		debugEnd(traceback.extract_stack()[-1][2])
		
	def rename(self, newName):
		debugStart(traceback.extract_stack()[-1][2])
		
		self.name = newName
		utils.setUserAttr("main", "name", newName)
		
		debugEnd(traceback.extract_stack()[-1][2])
		
	def updateModuleNames(self):
		debugStart(traceback.extract_stack()[-1][2])

		# get list deeps and names for sorting
		m_list = []
		for m_name in self.modules:
			m = self.modules[m_name]
			#print ("MODNAME", m.name, m.parent)
			deep = 0
			parent = m.parent
			
			while parent != "" and parent != None :
				if parent.split("_")[-1] == "joint": parent = parent.replace("joint", "outJoint")
				#print (22222, m.name, parent, utils.getModuleNameFromAttr(parent))
				parModName = utils.getModuleNameFromAttr(parent) or ""
				#print (1111, parent, parModName)
				if not parModName:
					cmds.warning("Cannot find the parent")
				
				try:
					par_mod = self.modules[parModName]
					parent = par_mod.parent
					deep += 1
				except:
					parent = None
			
			m_list.append([deep, m_name])		
			#if parent:
				#print (555, parent, parModName)
		
		# save sorted list
		self.moduleNames = []
		for deep, name in sorted(m_list):
			self.moduleNames.append(name)
		
		debugEnd(traceback.extract_stack()[-1][2])

	def isTemplate(self, type):
		debugStart(traceback.extract_stack()[-1][2], True)

		if type == 'jointsT':
			obj = 'skeleton'
			if cmds.objExists(obj):
				v = cmds.getAttr(obj + '.template')
				return	v

		elif type == 'geoT':
			obj = 'geo'
			if cmds.getAttr("geo.overrideEnabled")	and cmds.getAttr("geo.overrideDisplayType") == 1	:
				v = True		
			else:
				v = False
			return	v

		return None

	def isReference(self, type):
		debugStart(traceback.extract_stack()[-1][2], True)

		if type == 'geoR':
			obj = 'geo'
			if cmds.getAttr("geo.overrideEnabled")	and cmds.getAttr("geo.overrideDisplayType")	== 2:
				v = True
			else:
				v = False
			return	v

		return None
	
	def getControls(self):
		debugStart(traceback.extract_stack()[-1][2], True)
		
		ctrls = utils.getSetObjects("controlSet")

		return ctrls
	
	def savePos(self, setDefaultValues=False):
		debugStart(traceback.extract_stack()[-1][2])

		controls = self.getControls()
	
		sel = cmds.ls(sl=True)
	
		attrData = {} 
	
		for ctrl in controls:
			cmds.select (ctrl)
			attrList = []
			attrListKeyable = cmds.listAttr( keyable=True )
			if type(attrListKeyable) != list :
				attrListKeyable = []
			attrListNonkeyable = cmds.listAttr( channelBox = True )
			if type(attrListNonkeyable) != list :
				attrListNonkeyable = []
			attrList = attrListKeyable + attrListNonkeyable
			for attr in attrList:
				attrVar = cmds.getAttr(ctrl + "." + attr)
				attrData[(ctrl + "." + attr)] = attrVar
	
				# Set default value for custom attr's
				if setDefaultValues:
					try:
						#print ctrl + "." + attr
						cmds.addAttr( (ctrl + "." + attr), e=True, dv=attrVar)
					except:
						pass
	
		# Save data to node
		objAttr = "main.pose"
		utils.pyToAttr(objAttr, attrData)
	
		if len(sel) > 0:
			cmds.select(sel)
		else:
			cmds.select(clear=1)
		cmds.select(objAttr)
		debugEnd(traceback.extract_stack()[-1][2])
	
	def loadPos(self):
		debugStart(traceback.extract_stack()[-1][2])
	
		controls = self.getControls()
	
		# on creating main
		if not cmds.attributeQuery( 'pose', node="main", exists=True ):
			return
	
		objAttr = "main.pose"
	
		# Get data
		attrData = {}
		attrData = utils.attrToPy(objAttr)
	
		# Set control attributes
		#for attr in attrData:
			#cmds.setAttr( char + attr, attrData[attr] )
	
		# Reset selected objects
		for ctrl in controls:
			for attr in attrData:
	
				if (ctrl == attr.split(".")[0] ):
					#print attr, attrData[attr]
					try:
						cmds.setAttr( attr, attrData[attr] )
					except: print ("miss attr - ", attr)
					
		debugEnd(traceback.extract_stack()[-1][2])
	
	def resetPos(self):
		debugStart(traceback.extract_stack()[-1][2])
	
		sel = cmds.ls(sl=True)
	
		controls = self.getControls()
	
		for ctrl in controls:
			cmds.select (ctrl)
			attrList = []
			attrListKeyable = cmds.listAttr( keyable=True )
			if type(attrListKeyable) != list :
				attrListKeyable = []
			attrListNonkeyable = cmds.listAttr( channelBox = True )
			if type(attrListNonkeyable) != list :
				attrListNonkeyable = []
			attrList = attrListKeyable + attrListNonkeyable
			#print attrList
			for attr in attrList:
				try:
					value = cmds.attributeQuery( attr, node=ctrl, listDefault=True )[0]
					cmds.setAttr(ctrl + "." + attr, value)
				except: pass
					#print "miss attr", attr, " with value =", value
	
		if len(sel) > 0:
			cmds.select(sel)
		else:
			cmds.select(clear=1)
			
		debugEnd(traceback.extract_stack()[-1][2])
	
	def getSkinJoints(self):
		debugStart(traceback.extract_stack()[-1][2], True)
		
		all_joints = []
		for m in self.moduleNames:
			if cmds.objExists(m+"_skinJoints"):
				joints = cmds.listRelatives(m+"_skinJoints", allDescendents=1, type='joint')
				if type(joints).__name__ != "NoneType":
					all_joints += joints
		'''
		def get_childs(module):
			childs = []
			for m in self.modules:
				if m != module:
					parent_module = utils.getModuleNameFromAttr(m.parent)
					if parent_module == module.name:
						#print m.name, m.parent
						childs.append(m)
			return childs
		
		def getDistance(obj_1, obj_2):
			pos1 = cmds.xform(obj_1, query=True, translation=True, worldSpace=True)
			pos2 = cmds.xform(obj_2, query=True, translation=True, worldSpace=True)
			distance = math.sqrt( math.pow((pos1[0]-pos2[0]),2) + math.pow((pos1[1]-pos2[1]),2) + math.pow((pos1[2]-pos2[2]),2))			
			return distance
		
		notSkinnedEndJoints = []
		notSkinnedEndSkinJoints = []
		for m in self.modules:
			root = m.name+'_skinJoints'
			if not cmds.objExists(root):
				continue
			joints = cmds.listRelatives(m.name+'_skinJoints', allDescendents=1, type='joint')
			#end_joint = cmds.listRelatives(m.name+'_skinJoints', allDescendents=1, type='joint')[0]
			#print end_joint 
			#continue
			for j in joints:
				childs = get_childs(m)
				#print '------'
				if len(childs) > 0:
					for child in childs:
						start_joint = cmds.listRelatives(child.name + '_skinJoints_grp')[0]
						dist = getDistance(start_joint, j)
						#if m.name == 'spine' : 
							#print start_joint, dist						
						if dist < 0.01:
							#if m.name == 'spine' : 
								#print "!!!!"
							notSkinnedEndJoints.append(j)
							#print m.name, 'endJoint is not skined'
							#break
							#print m.name, child.name, end_joint, start_joint, dist
				#else:
					#print m.name, 'endJoint is not skined also'
					#notSkinnedEndJoints.append(end_joint)
		#print notSkinnedEndJoints
		for j in notSkinnedEndJoints:
			#if cmds.objectType(j) == 'joint':
			sj = j.replace('skinJoint', 'GSJ')
			#print sj
			if cmds.objExists(sj):
				notSkinnedEndSkinJoints.append(sj)
		#cmds.select(notSkinnedEndSkinJoints)
		
		skinJoints = []
		for j in all_joints:
			if j not in notSkinnedEndSkinJoints:
				sj = j.replace('skinJoint', 'GSJ')
				skinJoints.append(sj)
				#print j
		for j in skinJoints:
			print j
		#print skinJoints
		return skinJoints'''
		
		return all_joints
	
	#def selectSkinJoints(self):
		#joints = self.getSkinJoints()
		#cmds.select(clear=1)
		#for j in joints:
			#cmds.select(j, add=1)

	def getMirroredModule(self, module):
		debugStart(traceback.extract_stack()[-1][2], True)
		
		moduleName = module.name
		side = moduleName.split("_")[0]

		if side == 'l': 
			for m_name in self.modules:
				m = self.modules[m_name]
				if m_name == "r" + module.name[1:]:
					return m

		elif side == 'r': 
			for m_name in self.modules:
				m = self.modules[m_name]
				if m_name == "l" + module.name[1:]:
					return m

		return False

	def getModuleChildren(self, name):
		children = []
		for m_name in self.modules:
			m = self.modules[m_name]
			mPar_name = utils.getModuleNameFromAttr(m.parent)
			if mPar_name == name:
				children.append(m.name)
		#print children
		return children