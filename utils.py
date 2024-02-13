import maya.cmds as cmds
import pymel.core as pm
import os
import sys
import math
import importlib
import pickle as cPickle

#import rigStudio2.controller as controller
#import rigStudio2.additionalControl as additionalControl
#import rigStudio2.rigTools as rigTools

modulePath = os.path.normpath(os.path.dirname(__file__))
#moduleName = __name__.split('.')[0]

def pyToAttr(objAttr, data):
	"""
	Write (pickle) Python data to the given Maya obj.attr.  This data can
	later be read back (unpickled) via attrToPy().

	Arguments:
	objAttr : string : a valid object.attribute name in the scene.  If the
		object exists, but the attribute doesn't, the attribute will be added.
		The if the attribute already exists, it must be of type 'string', so
		the Python data can be written to it.
	data : some Python data :  Data that will be pickled to the attribute
		in question.
	"""
	obj, attr = objAttr.split('.')
	# Add the attr if it doesn't exist:
	if not cmds.objExists(objAttr):
		cmds.addAttr(obj, longName=attr, dataType='string')
	# Make sure it is the correct type before modifing:
	if cmds.getAttr(objAttr, type=True) != 'string':
		raise Exception("Object '%s' already has an attribute called '%s', but it isn't type 'string'"%(obj,attr))

	# Pickle the data and return the coresponding string value:
	#stringData = cPickle.dumps(data)
	stringData = cPickle.dumps(data, 0).decode()
	# Make sure attr is unlocked before edit:
	cmds.setAttr(objAttr, edit=True, lock=False)
	# Set attr to string value:
	cmds.setAttr(objAttr, stringData, type='string')
	# And lock it for safety:
	cmds.setAttr(objAttr, edit=True, lock=True)

def attrToPy(objAttr):
	"""
	Take previously stored (pickled) data on a Maya attribute (put there via
	pyToAttr() ) and read it back (unpickle) to valid Python values.

	Arguments:
	objAttr : string : A valid object.attribute name in the scene.  And of course,
		it must have already had valid Python data pickled to it.

	Return : some Python data :  The reconstituted, unpickled Python data.
	"""
	# Get the string representation of the pickled data.  Maya attrs return
	# unicode vals, and cPickle wants string, so we convert:
	stringAttrData = str(cmds.getAttr(objAttr))
	# Un-pickle the string data:
	#loadedData = cPickle.loads(stringAttrData)
	loadedData = cPickle.loads(stringAttrData.encode())

	return loadedData

def compileUI():
	from pysideuic import compileUi

	modules = ['head', 'neck', 'spine', 'arms', 'hands', 'legs', 'fingers', 'chain']
	for m in modules:
		pyfile = open(modulePath+'/ui/%s_widget.py' %m, 'w')
		compileUi(modulePath+"/ui/%s_widget.ui" %m, pyfile, False, 4,False)
		pyfile.close()

	pyfile = open(modulePath+'/ui/mainWindow.py', 'w')
	compileUi(modulePath+"/ui/mainWindow.ui", pyfile, False, 4,False)
	pyfile.close()

def incrementName(name):
	suffix = name.split('_')[-1]
	rootName = name[:-len(suffix)-1]
	if suffix.isdigit():
		name = rootName + '_' + str( int(suffix) + 1 )
	else:
		name += '_1'
	return name

def incrementNameIfExists(name):
	side = ""
	if name.split('_')[0] == "l" or name.split('_')[0] == "r":
		side = name.split('_')[0]

	suffix = name.split('_')[-1]
	if suffix.isdigit():
		rootName = name[:-len(suffix)-1]
	else:
		suffix = ""
		rootName = name	

	#print name, suffix, rootName
	while cmds.objExists(name):
		suffix = name.split('_')[-1]
		if suffix.isdigit():
			name = rootName + '_' + str( int(suffix) + 1 )
		else:
			name += '_1'

	return name

def fixShapeName(name):
	shapes = pm.listRelatives(name, s=1)
	#print 333, name
	if len(shapes) > 1:
		for i, s in enumerate(shapes):
			#print "renamed", s, " >>> ", name+"Shape"+str(i)
			if i == 0:
				pm.rename(s, name+"Shape")
			else:
				pm.rename(s, name+"Shape"+str(i))
	else:
		s = shapes[0]
		#print "renamed", s, " >>> ", name+"Shape"
		pm.rename(s, name+"Shape")
	return s

def fisShapeSelected():
	sel = cmds.ls(sl=1)
	if len(sel) == 0:
		cmds.warning("Select Nodes")
		return

	for n in sel:
		fixShapeName(n)

def fixControlsShapes():
	ctrls = getSetObjects('moduleControlSet')

	for c in ctrls:
		fixShapeName(c)

def nameUpper(name):
	return name[:1].capitalize() + name[1:]

def nameLower(name):
	return name[:1].lower() + name[1:]

def getShape(name):
	shape = cmds.listRelatives(name, s=1)[0]
	return shape

def resetAttrs(o, debug=False):
	for a in [".tx", ".ty", ".tz", ".rx", ".ry", ".rz"]:
		try:
			cmds.setAttr(o+a, 0)
		except: pass

	for a in [".sx", ".sy", ".sz"]:
		try:
			cmds.setAttr(o+a, 1)
		except: pass

	try:
		for a in [".shearXY", ".shearXZ", ".shearYZ"]:
			try:
				cmds.setAttr(o+a, 0)
			except: pass		
	except: pass		

def getModuleNameFromHierarhy(controlName):
	p = cmds.listRelatives(controlName, parent=1)[0]
	while p.split('_')[-1] != "mod":
		parents = cmds.listRelatives(p, parent=1) or []
		if len(parents) == 0:
			return None
		p = parents[0]

	return p[:-4]

def getModuleInstance(moduleName):
	m_type = cmds.getAttr(moduleName+"_mod.moduleType")
	m_typeCap = capitalizeName(m_type)

	if not os.path.isdir(os.path.join(modulePath, "modules", m_type)):
		cmds.warning("Module folder is not exist "+m_type)
		return False	

	# importlib.import_module('rigStudio3.modules.%s.%s' % (moduleType, moduleType))
	exec('from .modules.%s import %s' % (m_type, m_type)) 	# from .modules.moduleA import moduleA
	exec('importlib.reload(%s)' % (m_type))						# importlib.reload(moduleA)
	m = eval('%s.%s(moduleName)' % (m_type, m_typeCap))  	# m = modules.moduleA.moduleA.ModuleA(name)
	m.load()

	return m

def objectIsControl(ctrl):
	if cmds.attributeQuery('type', n=ctrl, exists=True ):
		if cmds.getAttr(ctrl+'.type') == 'control':
			return True
	return False

def objectIsAdditionalControl(ctrl):
	if cmds.attributeQuery('type', n=ctrl, exists=True ):
		if cmds.getAttr(ctrl+'.type') == 'additionalControl':
			return True
	return False

def getControlInstance(name):
	try:
		c = controller.Control()
		c.load(name)
		return c
	except: 
		return False

def getAdditionalControlInstance(name):
	c = additionalControl.AdditionalControl()
	c.load(name)

	return c

def getModuleFiles():
	moduleFilesList = os.listdir(os.path.join(modulePath, 'modules'))
	moduleFiles = []
	# if file is mb file, make menu item
	for m in moduleFilesList:
		if m == 'incrementalSave':
			continue		
		#if m.split(".")[-1] == "mb":
		if '.' not in m and m[0] != '_':
			moduleName = m.split(".")[0]
			moduleFiles.append(moduleName)

	return moduleFiles

def getModuleSections():
	sections = {}
	for m in getModuleFiles():
		with open(os.path.join(modulePath, 'modules', m, 'info.txt')) as f:
			lines = f.readlines()	
		sect = lines[2].rstrip().split('=')[1]

		if sect in sections:
			sectionList = sections[sect]
		else: 
			sectionList = []
		sectionList.append(m)
		sections[sect] = sectionList

	return sections

def setUserAttr(obj, attrName, value, type="string", lock=True, keyable=False, cb=False, enumList=""):
	#print obj, attrName
	# create attribute if not exists
	if not cmds.attributeQuery(attrName, n=obj, exists=True ):

		if type == "string":
			cmds.addAttr(obj, longName=attrName, dt=type, keyable=keyable)

		elif type == "bool":
			cmds.addAttr(obj, longName=attrName, at=type, keyable=keyable)

		elif type == "int":
			cmds.addAttr(obj, longName=attrName, at='short', keyable=keyable)

		elif type == "float":
			cmds.addAttr(obj, longName=attrName, at='float', keyable=keyable)

		elif type == "data":
			pyToAttr(obj+'.'+attrName, value)

		elif type == "enum":
			cmds.addAttr(obj, longName=attrName, at='enum', en=enumList, keyable=keyable)

	# set attribute value
	cmds.setAttr(obj+"."+attrName, e=1, l=0)

	if type == "string":
		cmds.setAttr(obj+"."+attrName, value, type="string")
	elif type == "bool":
		cmds.setAttr(obj+"."+attrName, value)
	elif type == "int":
		cmds.setAttr(obj+"."+attrName, value)
	elif type == "float":
		cmds.setAttr(obj+"."+attrName, value)
	elif type == "enum":
		cmds.setAttr(obj+"."+attrName, value)
	elif type == "data":
		pyToAttr(obj+'.'+attrName, value)		

	cmds.setAttr(obj+"."+attrName, e=1, l=lock, cb=cb )

def addModuleNameAttr(obj, moduleName):
	#print (33333, obj, moduleName)
	if not pm.attributeQuery("moduleName", node=obj, exists=1):
		pm.addAttr(obj, longName='moduleName', dt='string', keyable=False)
	else:
		pm.setAttr(obj+".moduleName", l=False)
	pm.setAttr(obj+".moduleName", moduleName, type='string')
	pm.setAttr(obj+".moduleName", l=True )	

def addModuleTypeAttr(obj, moduleType):
	if not pm.attributeQuery("moduleType", node=obj, exists=1):
		pm.addAttr(obj, longName='moduleType', dt='string', keyable=False)
	else:
		pm.setAttr(obj+".moduleType", l=False)
	pm.setAttr(obj+".moduleType", moduleType, type='string')
	pm.setAttr(obj+".moduleType", l=True )	

def getModuleTypeFromAttr(obj):
	path = cmds.listRelatives(obj, fullPath=1, parent=1)[0]
	moduleFolder = path.split("|")[4]
	moduleType = None

	if cmds.attributeQuery( 'moduleType', node=moduleFolder, exists=True ):
		moduleType = cmds.getAttr(moduleFolder+'.moduleType')

	return moduleType

def getModuleNameFromAttr(obj):
	if obj == None:
		return None	
	obj = obj.replace("joint", "outJoint")
	if obj == "" or not cmds.objExists(obj):
		return None

	moduleName = None

	if cmds.attributeQuery( 'moduleName', node=obj, exists=True ):
		moduleName = cmds.getAttr(obj+'.moduleName')

	return moduleName

def capitalizeName(name):
	return	name[0].capitalize() + name[1:]

def getObjectSide(moduleName):
	side = moduleName.split('_')[0]
	if side == "r":
		return "r"
	elif side == "l":
		return "l"
	else:
		return "c"

def flipSide(name):
	try:
		side = name.split('_')[0]
		if side == "r":
			return "l_"+name[2:]
		elif side == "l":
			return "r_"+name[2:]
		else:
			return name
	except: return name

def getConstraint(obj):
	childs = cmds.listRelatives(obj)
	for o in childs:
		if cmds.objectType(o) == 'orientConstraint':
			const = 'orientConstraint'
			return const, o
		elif cmds.objectType(o) == 'pointConstraint':
			const = 'pointConstraint'
			return const, o
		elif cmds.objectType(o) == 'parentConstraint':
			const = 'parentConstraint'               
			return const, o
	return None, None

def getSetObjects(set):
	objects = []
	#print "!!!", set#, type(cmds.sets(set, q=1))
	if not cmds.objExists(set):
		return []
	if cmds.objectType(set) != 'objectSet':
		return []

	childs = cmds.sets(set, q=1) or []

	for o in childs:
		#print o
		if cmds.objectType(o) == 'objectSet':
			innerObjects = getSetObjects(o)
			objects += innerObjects
		else:
			objects.append(o)
	return objects

def getSetsInSet(set):
	sets = []
	#print "----" 
	if not cmds.objExists(set):
		return []
	for o in cmds.sets(set, q=1):
		#print o
		if cmds.objectType(o) == 'objectSet':
			innerObjects = getSetsInSet(o)
			sets += innerObjects
			sets.append(o)
	return sets

def changePrefix(oldName, oldPrefix, newPrefix):

	if oldPrefix in oldName:
		parts = oldName.split(oldPrefix+'_')

		if parts[0] == "":
			newName = newPrefix+oldName[len(oldPrefix):]
			return newName

	return oldName

def copyConnections(input=True, output=True):
	sel = pm.ls(sl=1)
	if len(sel) != 2:
		cmds.warning("Select source and target nodes")
		return

	src, tgt = sel

	conns_in = cmds.listConnections(src.name(), plugs=1, connections=1, s=1, d=0) or []
	sources_in = conns_in[1::2]
	targets_in = conns_in[::2]

	conns_out = cmds.listConnections(src.name(), plugs=1, connections=1, s=0, d=1) or []
	sources_out = conns_out[::2]
	targets_out = conns_out[1::2]

	#return
	if input:
		for i, s in enumerate(sources_in):
			print (sources_in[i], targets_in[i])
			try:
				pm.connectAttr(sources_in[i], tgt+'.'+targets_in[i].split('.')[1], f=1)
			except: print ("Miss connection", tgt+'.'+targets_in[i].split('.')[1])

	if output:
		for i, s in enumerate(sources_out):    
			print (sources_out[i], targets_out[i])
			try:
				pm.connectAttr(tgt+'.'+sources_out[i].split('.')[1], targets_out[i], f=1)
			except: print ("Miss connection", tgt+'.'+sources_out[i].split('.')[1])

def selectNoInControlSet():
	sel = cmds.ls(sl=1)
	if len(sel) == 0:
		cmds.warning("Select controls")
		return

	ctrls_select = []
	all_ctrls = getSetObjects('moduleControlSet')
	for c in sel:
		if c not in all_ctrls:
			ctrls_select.append(c)

	if len(ctrls_select) > 0:
		cmds.select(ctrls_select)
	else:
		printInfo("no controls not included in controlSet")
		cmds.select(clear=1)

def selectControlsWithoutInternalNames():
	ctrls = getSetObjects('moduleControlSet')
	ctrls_select = []
	for c in ctrls:
		if not cmds.objExists(c+'.internalName'):
			ctrls_select.append(c)

	if len(ctrls_select) > 0:
		cmds.select(ctrls_select)
	printInfo("no controls without internal name")

def addInternalNamesToSelected():
	#ctrls = getSetObjects('moduleControlSet')
	sel = cmds.ls(sl=1)

	if len(sel) == 0:
		cmds.warning("Select controls")
	#print sel, c in sel
	for c in sel:
		#if c in sel:
		setUserAttr(c, "internalName", c)
		print ("Set internal name -", c)

def addSpaceGroup():
	c = cmds.ls(sl=1)[0]

	if cmds.objExists(c+'_space'):
		cmds.warning('control already have scape group') 
		return

	if cmds.objExists(c+'_offset'):
		cmds.group(c+'_offset', n=c+'_space')
	else:
		cmds.group(n=c+'_space')

	cmds.xform(os=1, piv=(0,0,0))
	cmds.select(c)

def addOffsetGroup():
	c = cmds.ls(sl=1)[0]

	if cmds.objExists(c+'_offset'):
		cmds.warning('control already have offset group') 
		return

	cmds.group(n=c+'_offset')
	cmds.select(c)

def setMirrorAttrControl():
	ctrls = cmds.ls(sl=1)

	for c in ctrls:
		setUserAttr(c, "mirrorShape", 1, "bool")

def getControlNameFromInternal(module_name, internalControlName):
	ctrls = getSetObjects(module_name+'_moduleControlSet')
	#print "!!!!!!!!!!!!!!",  module_name, ctrls
	for c in ctrls:
		int_name = cmds.getAttr(c+".internalName")
		#print "-----", c, int_name, internalControlName, int_name == internalControlName
		if int_name == internalControlName:
			#print "RETURN", internalControlName, "->>>", c
			return c
	#cmds.warning('Cannot find control with internal name '+internalControlName+' in moduleControlSet')
	return ""

def getInternalNameFromControl(controlName):
	#print 22222222, controlName+".internalName"
	if cmds.objExists(controlName + ".internalName"):
		return cmds.getAttr(controlName + ".internalName")
	else:
		return ""
	

def getControlVis(controlName):
	shape = getShape(controlName)
	return cmds.getAttr(shape + ".v")

def getControlColor(controlName):
	return cmds.getAttr(getShape(controlName) + '.overrideColor')

def renameControl(oldCtrlName, newCtrlName):
	#print (122, oldCtrlName, newCtrlName)
	cmds.rename(oldCtrlName, newCtrlName)
	
	parent = cmds.listRelatives(newCtrlName, parent=1)[0]
	while oldCtrlName in parent:
		new_name = parent.replace(oldCtrlName, newCtrlName)
		cmds.rename(parent, new_name)
		parent = cmds.listRelatives(new_name, parent=1)[0]
		if parent.split('_')[-1] == 'controls':
			return

def getTemplatedNameFromReal(mod_name, control_name):
	#print (122, mod_name, control_name)
	if mod_name in control_name:
		if control_name[:len(mod_name)] == mod_name:
			name = "MODNAME" + control_name[len(mod_name):]
			return name

	return control_name

def getRealNameFromTemplated(mod_name, control_name):
	if "MODNAME" in control_name:
		name = mod_name + control_name.split("MODNAME")[1]
		return name
	else:
		return control_name

def getOppositeObject(obj):
	side = obj.split('_')[0]
	if side == "r":
		return "l" + obj[1:]
	elif side == "l":
		return "r" + obj[1:]
	else:
		return obj	

def delete(o):
	if cmds.objExists(o):
		cmds.delete(o)	

def getInputNode(obj, attr):
	if cmds.connectionInfo( obj+"."+attr, isDestination=True):
		inputAttr = cmds.connectionInfo( obj+"."+attr, sourceFromDestination=True)	
		inputNode = inputAttr.split('.')[0]

		return inputNode

	return None

def getLastName(name):
	i = 1
	initName = name
	while cmds.objExists(name):
		name = incrementName(name)
		#name = initName + '_' + str(i)
		#i += 1

	return name		

def moduleIsHaveScene(name):

	scene_path = modulePath + '//modules//' + name + '//' + name + '.ma'		

	#print scene_path, os.path.isfile(scene_path) 
	isHaveScene = os.path.isfile(scene_path) 

	return isHaveScene

def selectSkinJoints():
	all_joints = cmds.listRelatives('skeleton', allDescendents=1, type='joint')

	joints = []
	for j in all_joints:
		if not '_end' in j:
			joints.append(j)

	cmds.select(joints)	

def removeTransformParentJoint(jnt):
	tr = cmds.listRelatives(jnt, p=1)[0]
	if 'transform' in tr:
		tr_par = cmds.listRelatives(tr, p=1)[0]
		resetAttrs(tr, debug=1)
		cmds.parent(jnt, tr_par)
		cmds.delete(tr)


# Tools
def connectByMatrix(obj, targets, inputs=[], moduleName="", attrs=['t', 'r', 's']):
	tgt = targets[0]

	dMat = cmds.createNode('decomposeMatrix', n=obj+"_decMat")
	if 't' in attrs:
		if not cmds.getAttr(obj+'.translateX', lock=1):
			cmds.connectAttr(dMat+".outputTranslateX", obj+'.translateX', f=1)			
		if not cmds.getAttr(obj+'.translateY', lock=1):
			cmds.connectAttr(dMat+".outputTranslateY", obj+'.translateY', f=1)			
		if not cmds.getAttr(obj+'.translateZ', lock=1):
			cmds.connectAttr(dMat+".outputTranslateZ", obj+'.translateZ', f=1)
	if 'r' in attrs:
		if not cmds.getAttr(obj+'.rotateX', lock=1):
			cmds.connectAttr(dMat+".outputRotateX", obj+'.rotateX', f=1)			
		if not cmds.getAttr(obj+'.rotateY', lock=1):	
			cmds.connectAttr(dMat+".outputRotateY", obj+'.rotateY', f=1)			
		if not cmds.getAttr(obj+'.rotateZ', lock=1):
			cmds.connectAttr(dMat+".outputRotateZ", obj+'.rotateZ', f=1)
	if 's' in attrs:
		if not cmds.getAttr(obj+'.scaleX', lock=1):
			cmds.connectAttr(dMat+".outputScaleX", obj+'.scaleX', f=1)			
		if not cmds.getAttr(obj+'.scaleY', lock=1):
			cmds.connectAttr(dMat+".outputScaleY", obj+'.scaleY', f=1)			
		if not cmds.getAttr(obj+'.scaleZ', lock=1):
			cmds.connectAttr(dMat+".outputScaleZ", obj+'.scaleZ', f=1)		

	if moduleName != "":
		addModuleNameAttr(dMat, moduleName)

	if len(targets) > 1:
		mMat = cmds.createNode('multMatrix', n=obj+"_multMat")
		cmds.connectAttr(mMat+".matrixSum", dMat+'.inputMatrix')

		if moduleName != "":
			addModuleNameAttr(mMat, moduleName)

		for i in range(len(targets)):
			cmds.connectAttr(targets[i]+"."+inputs[i], mMat+'.matrixIn[%s]' %(str(i)) )

		return mMat

	else:
		cmds.connectAttr(targets[0]+".worldMatrix[0]", dMat+'.inputMatrix')	

def addBindSkinJoint(checkBox):
	rigTools.addSecondBindSkinJoint.run(checkBox.isChecked())

def scaleFromRoot():
	pass

def formatName(string):
	newName = ""
	for n in string:
		if n.isupper() or n.isdigit():
			n = ' ' + n
		if n == '_': n = " "
		newName += n
	newName = newName[0].upper()+newName[1:]
	return newName

def lockChannels(ctrlName, channels=['s']):

	ctrl = pm.PyNode(ctrlName)

	if 't' in channels:
		ctrl.tx.setKeyable(0)
		ctrl.ty.setKeyable(0)
		ctrl.tz.setKeyable(0)
		ctrl.t.lock()
	if 'r' in channels:
		ctrl.rx.setKeyable(0)
		ctrl.ry.setKeyable(0)
		ctrl.rz.setKeyable(0)
		ctrl.r.lock()
	if 's' in channels:
		ctrl.sx.setKeyable(0)
		ctrl.sy.setKeyable(0)
		ctrl.sz.setKeyable(0)
		ctrl.s.lock()

	ctrl.v.setKeyable(0)
	ctrl.v.lock()

def printInfo(message):
	sys.stdout.write(message + '\n') 

def groupExists(group):
	if cmds.objExists(group):
		cmds.warning(group+" group is exists")
		return True
	else:
		return False

def importFile(path, name=""):
	# import
	fr = cmds.currentUnit( query=True, time=True )
	ext = path.split(".")[-1]
	if ext == "ma":
		type_name = "mayaAscii"
	elif ext == "mb": 
		type_name = "mayaBinary"
	else:
		cmds.warning("Wrong file")
		return
	try:
		cmds.file(path, pr=1, i=1, type=type_name, importFrameRate=True, namespace='_temp_', ra=True, mergeNamespacesOnClash=False,options="v=0;")
	except:
		cmds.file(path, pr=1, i=1, type=type_name, namespace='_temp_', ra=True, mergeNamespacesOnClash=False,options="v=0;")
	cmds.currentUnit( time=fr )		

	# remove namespace
	nodes = cmds.ls('_temp_:*')
	set_name = name+"_nodesSet"
	cmds.sets(n=set_name)
	cmds.sets(set_name, e=1, forceElement='controlSet' )
	for n in nodes:
		if cmds.objExists(n):
			#print (n, name)
			# addModuleNameAttr(n, name)
			if cmds.objectType(n) != 'objectSet':
				cmds.sets(n, e=1, forceElement=set_name)
			if name == "":
				cmds.rename(n, n.replace("_temp_:", name))
			else:
				cmds.rename(n, n.replace("_temp_:", name+"_"))
		else:
			pass
	cmds.namespace(removeNamespace='_temp_')	

def getVisibleAttrs(obj):
	attrList = []
	attrListKeyable = cmds.listAttr( obj, keyable=True )
	if type(attrListKeyable) != list :
		attrListKeyable = []
	attrListNonkeyable = cmds.listAttr( obj, channelBox = True )
	if type(attrListNonkeyable) != list :
		attrListNonkeyable = []
	attrList = attrListKeyable + attrListNonkeyable

	if "translate" in attrList: attrList.remove("translate")
	if "rotate" in attrList: attrList.remove("rotate")
	if "scale" in attrList: attrList.remove("scale")

	return attrList

def objectIsSymmetrical(obj):
	if obj.split("_")[0] == "l":
		if cmds.objExists("r"+obj[1:]):
			return True
	elif obj.split("_")[0] == "r":
		if cmds.objExists("l"+obj[1:]):
			return True
	return False

def objectIsOpposite(obj):
	if obj.split("_")[0] == "r":
		if cmds.objExists("l"+obj[1:]):
			return True
	return False

def getRealNameFromDataName(obj_name, module_name):
	#print 1, obj_name, module_name
	if "MODNAME" in obj_name:
		real_name = obj_name.replace("MODNAME", module_name)
		return real_name 
	else:
		old_mod_name = obj_name.split("_")[0]
		return obj_name.replace(old_mod_name, module_name)

def getClosestJoint(mod_name, src_object):
	pos1 = cmds.xform(src_object, query=True, translation=True, worldSpace=True)
	closest_distance = 10000000
	closest = ""
	for j in cmds.listRelatives("skeleton", allDescendents=1):
		if j.split("_")[-1] == 'joint':

			#print j, getModuleNameFromAttr(j)
			if getModuleNameFromAttr(j) == mod_name:
				pos2 = cmds.xform(j, query=True, translation=True, worldSpace=True)
				distance = math.sqrt( math.pow((pos1[0]-pos2[0]),2) + math.pow((pos1[1]-pos2[1]),2) + math.pow((pos1[2]-pos2[2]),2))				
				#if src_object == 'l_leg_upper_pin': print 33333333, j, pos2, distance
				if distance < closest_distance:
					closest_distance = distance
					closest = j
				#if src_object == 'l_leg_upper_pin': print 444, j, distance, closest_distance

	#if src_object == 'l_leg_upper_pin': print 555, closest
	#if src_object == 'l_leg_upper_pin': print 555, pos1
	return closest		

def isClose(obj1, obj2, delta=0.01):
	pos1 = cmds.xform(obj1, query=True, translation=True, worldSpace=True)
	pos2 = cmds.xform(obj2, query=True, translation=True, worldSpace=True)
	distance = math.sqrt( math.pow((pos1[0]-pos2[0]),2) + math.pow((pos1[1]-pos2[1]),2) + math.pow((pos1[2]-pos2[2]),2))				

	if distance < delta:
		return True

	return False	

def savePos(): 
	#allControls = cmds.ls(selection=True)

	#if len(allControls) == 0:
		#cmds.warning("Select controls")
		#return

	allControls = getSetObjects('controlSet')

	# add default attribute to controls
	for ctrl in allControls:
		for attr in getVisibleAttrs(ctrl):
			# get attr value
			value = cmds.getAttr(ctrl + "." + attr)
			# add default value for custom attr's # if locked, continue
			if not cmds.attributeQuery('default_'+attr, node=ctrl, exists=True):
				cmds.addAttr( ctrl, longName='default_'+attr, dataType='string', keyable=False)
			# set default value to default attr
			cmds.setAttr( ctrl+".default_"+attr, str(value), type="string")			

def loadPos():
	## Get selected objects
	#selectedObjs = cmds.ls(sl=True)
	#if len(selectedObjs) == 0:
		#cmds.warning("Select controls")
		#return

	selectedObjs = getSetObjects('controlSet')

	old_controls = []

	for ctrl in selectedObjs:
		attrs = getVisibleAttrs(ctrl)

		# if default attr is exists
		for attr in attrs:
			if not cmds.attributeQuery('default_'+attr, node=ctrl, exists=True):
				old_controls.append(ctrl)
				break

		if ctrl in old_controls:
			continue

		for attr in attrs:
			#print ctrl, attr
			# get saved value
			value = cmds.getAttr(ctrl + ".default_" + attr)

			# convert attr type
			if value == "None":
				continue
			elif value == "True":
				value = True
			elif value == "False":
				value = False
			else:
				value = float(value)

			# If not locked, set value
			if not cmds.getAttr(ctrl+"."+attr, lock=1):
				try:
					cmds.setAttr( ctrl+'.'+attr, value )
				except:
					cmds.warning ("attribute %s is connected" %(ctrl+'.'+attr))

def resetJointOrient(j):
	cmds.setAttr(j+".jointOrientX", 0)
	cmds.setAttr(j+".jointOrientY", 0)
	cmds.setAttr(j+".jointOrientZ", 0)

def parentIfNeeded(child, parent):
	parents = cmds.listRelatives(child, p=1) or []
	if len(parents) == 1:
		current_par = parents[0]
	else:
		current_par = None
	if parent != current_par:
		cmds.parent(child, parent)	

def strightConnect(s, t):
	cmds.connectAttr(s+".tx", t+'.tx')
	cmds.connectAttr(s+".ty", t+'.ty')
	cmds.connectAttr(s+".tz", t+'.tz')
	cmds.connectAttr(s+".rx", t+'.rx')
	cmds.connectAttr(s+".ry", t+'.ry')
	cmds.connectAttr(s+".rz", t+'.rz')
	cmds.connectAttr(s+".sx", t+'.sx')
	cmds.connectAttr(s+".sy", t+'.sy')
	cmds.connectAttr(s+".sz", t+'.sz')	

def readInfo(name):
	path = modulePath + '/modules/' + name

	#with open(path+'/info.txt') as file :
	with open(os.path.join(path, "info.txt")) as file :
		for line in file:
			if line.split("=")[0] == "description":
				text = line.split("=")[1]
				#print text.split("/")[0]
				#line = "DescriptionAAA" + "\r\n"
				return text
			#elif line.split("=")[0] == "section":
				##secName = line.split("=")[1]
				#sec_name = self.win.comboBox.currentText()
				#line = "section="+ sec_name # + "\r\n"
				pass

def matchTransform(s, t, scale=1):
	con1 = cmds.parentConstraint(s, t, mo=0)
	con2 = cmds.scaleConstraint(s, t, mo=0)
	cmds.delete(con1, con2)

def create_space_group(ctrl=None, sources=[], names=[]):
	# get input data
	if not ctrl or not sources:
		sel = cmds.ls(sl=1)

		if len(sel) < 2:
			cmds.warning("Select sources and target object")
			return

		ctrl = sel[-1]
		sources = sel[:-1]

	s_locs = []
	for s in sources:
		s_name = s.split(":")[-1]
		l = cmds.spaceLocator(n='%s__%s__loc' %(s_name, ctrl))[0]
		cmds.parent(l, ctrl)
		resetAttrs(l)
		cmds.parent(l, s)
		cmds.hide(l)
		s_locs.append(l)

	# create space group
	space_gr = cmds.group(empty=True, n=ctrl+"_spaceGroup")
	cmds.parent(space_gr,ctrl)
	resetAttrs(space_gr)
	try:
		parent = cmds.listRelatives(ctrl, parent=True)[0]
		cmds.parent(space_gr, parent)
	except:
		cmds.parent(space_gr, world=True)
	cmds.parent(ctrl,space_gr)

	# create contraint
	const = cmds.parentConstraint(s_locs, space_gr, mo=0)[0]

	# add attribute
	sources_string = ""
	if names == []:
		names = sources
	for o in names:
		sources_string += o
		sources_string += ":"

	cmds.addAttr(ctrl, longName='parent', at='enum', en=sources_string, k=1)

	# set draven keys
	for k in range (len(s_locs)):
		# first set attr on control
		cmds.setAttr("%s.parent" %ctrl, k)
		# then foreach constraint attr
		for i in range (len(s_locs)):
			# set 1 or 0
			if i == k:
				cmds.setAttr("%s.%sW%i" %(const, s_locs[i], i), 1)
			else:
				cmds.setAttr("%s.%sW%i" %(const, s_locs[i], i), 0)
			# and set key
			cmds.setDrivenKeyframe("%s.%sW%i" %(const, s_locs[i], i), currentDriver="%s.parent" %ctrl)	

	cmds.select(ctrl)
	cmds.setAttr(ctrl+'.parent', 0)	

def create_default_sets():
	cmds.sets(n='controlSet')
	cmds.sets(n='sets')
	cmds.sets('controlSet', e=1, forceElement='sets')
	cmds.sets(n='skinJointsSet')
	cmds.sets('skinJointsSet', e=1, forceElement='sets')
	cmds.sets(n='modules_sets')
	cmds.sets('modules_sets', e=1, forceElement='sets')