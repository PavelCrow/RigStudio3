import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

import os, imp

from .import utils


fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])

def createMainPoser(name=""):
	if not name:
		name, ok = QtWidgets.QInputDialog.getText(None, "Add Poser", "Please enter poser name", QtWidgets.QLineEdit.Normal, "mainPoser")
		
		if ok:
			if cmds.objExists(name):
				QtWidgets.QMessageBox.information(None, "Warning", "This poser is exist.")
				return
	
			if " " in name or "-" in name  or name[0].isdigit():
				QtWidgets.QMessageBox.information(None, "Warning", "Wrong Name.")
				return
		else:
			return
	
	# import
	path = os.path.join(rootPath, "rigTools", 'mainPoser.ma')
	
	if name == 'mainPoser':
		utils.importFile(path)
		cmds.select("mainPoser")
	else:
		utils.importFile(path, name)
		if cmds.objExists("mainPoser"):
			cmds.parent(name+"_mainPoser", "mainPoser")
		cmds.select(name+"_mainPoser")
		
	return name+"_mainPoser"
		
def incrementPoserIfExists(name): #
	suff = name.split('_')[-1]
	if suff.isdigit():
		rootName = name[:-len(suff)-1]
	else:
		suff = ""
		rootName = name	

	while cmds.objExists(name+"_poser"):
		suff = name.split('_')[-1]
		if suff.isdigit():
			name = rootName + '_' + str( int(suff) + 1 )
		else:
			name += '_1'

	return name

def createPoser(name=""):
	if not name:
		name, ok = QtWidgets.QInputDialog.getText(None, "Add Poser", "Please enter poser name", QtWidgets.QLineEdit.Normal, "root")
		
		if not cmds.objExists("mainPoser"):
			cmds.warning("mainPoser is not exists")
			return
			
		if ok:
			if cmds.objExists(name+"_poser"):
				name = incrementPoserIfExists(name)

			if " " in name:
				name = name.replace(" ", "_")

			if "-" in name  or name[0].isdigit():
				QtWidgets.QMessageBox.information(None, "Warning", "Wrong Name.")
				return
		else:
			return
		
	# import
	path = os.path.join(rootPath, "rigTools", 'poser.ma')
	utils.importFile(path, name)
	
	if cmds.objExists("mainPoser"):
		cmds.parent(name+"_poser", "mainPoser")

		mult = cmds.createNode("multDoubleLinear", n=name+"_size_multDoubleLinear")
		cmds.connectAttr(name+"_poser.size", mult+".input1")
		cmds.connectAttr("mainPoser.globalSize", mult+".input2")
		cmds.connectAttr(mult+".output", name+"_makeNurbSphere.radius", f=1)

	cmds.delete(name+"_nodesSet", name+"_sceneConfigurationScriptNode")

	cmds.select(name+"_poser")
	
	return name+"_poser"

def connectPosers(src=None, tgt=None, name_m=""):
	# called from a module build with an explicit pair, or from the
	# moduleBuilder button with whatever is selected
	sel = cmds.ls(sl=1)

	if src and tgt:
		posers = [src, tgt]
	else:
		posers = sel

	if not posers:
		return

	lines_group = name_m + "lines_group"
	if not cmds.objExists(lines_group):
		cmds.group(empty=True, n=lines_group)
		cmds.parent(lines_group, name_m+"posers", relative=True)

	# the curve points are driven by the world positions of the posers, so the
	# group must not put the transform of its parent on top of that. done on
	# every call, not only on creation, so groups made by older versions are
	# corrected too - the local values are reset because cmds.parent had
	# compensated them against the parent
	utils.resetAttrs(lines_group)
	cmds.setAttr(lines_group + ".inheritsTransform", 0)

	for p in posers:
		if p.split("_")[-1] != "poser":
			cmds.warning("Select only posers")
			return

	locs = []
	for p in posers:
		l = p.replace("poser", "poserOrient")
		locs.append(l)
		
	pos=[]
	for l in locs:
		l_pos = cmds.getAttr(l+".worldPosition")[0]
		pos.append(l_pos)
		
	c = cmds.curve(d=1, p=pos)
	c = cmds.rename(c, name_m+"posers_curve_#")
	for i,l in enumerate(locs):
		cmds.connectAttr(f"{l}.worldPosition[0]", f"{c}.controlPoints[{i}]")

	# one sweep node per module. looking it up by type took whatever
	# sweepMeshCreator happened to be first in the scene, so the lines of every
	# module ended up in the node of the module built first
	smcName = name_m + "lines_sweepMeshCreator"
	cS = cmds.listRelatives(c)[0]

	if cmds.objExists(smcName):
		smc = smcName
		size = cmds.getAttr(f"{smc}.inCurveArray", size=True)
		cmds.connectAttr(f"{cS}.worldSpace", f"{smc}.inCurveArray[{size}]")
	else:
		before = cmds.ls(type="sweepMeshCreator")
		cmds.select(c)
		cmds.sweepMeshFromCurve()
		# the new node is found by comparing the lists, not by the selection -
		# the command leaves the sweep mesh selected, not the node itself
		created = [n for n in cmds.ls(type="sweepMeshCreator") if n not in before]
		if not created:
			cmds.warning("posers|connectPosers - cannot create the sweep node")
			return

		smc = cmds.rename(created[0], smcName)

		if name_m:
			utils.addToModuleSet(smc, name_m[:-1])

			# thickness of the lines of the module: lineSize * globalSize, the
			# same globalSize that scales the poser spheres, so the lines follow
			# them. made here explicitly - it used to work only because every
			# module shared one sweep node and that node happened to be
			# connected by hand
			lineSize = name_m + "mainPoser.lineSize"
			globalSize = name_m + "mainPoser.globalSize"

			if not cmds.objExists(lineSize):
				cmds.warning("posers|connectPosers - cannot find " + lineSize)
			elif not cmds.objExists(globalSize):
				cmds.warning("posers|connectPosers - cannot find " + globalSize)
				cmds.connectAttr(lineSize, f"{smc}.scaleProfileX", f=1)
			else:
				mult = utils.createNode("multDoubleLinear", n=name_m + "lines_size_multDoubleLinear")
				utils.addToModuleSet(mult, name_m[:-1])
				cmds.connectAttr(lineSize, f"{mult}.input1")
				cmds.connectAttr(globalSize, f"{mult}.input2")
				cmds.connectAttr(f"{mult}.output", f"{smc}.scaleProfileX", f=1)

		# the command has already put the curve into inCurveArray[0] and made
		# its own mesh for it. the mesh is dropped, the one built below is used
		size = 0
		for ms in cmds.listConnections(f"{smc}.outMeshArray[0]", source=False, destination=True, shapes=True) or []:
			cmds.disconnectAttr(f"{smc}.outMeshArray[0]", f"{ms}.inMesh")
			tr = cmds.listRelatives(ms, parent=1) or []
			cmds.delete(tr[0] if tr else ms)

	mesh, poly = cmds.polyCube(n=c+"_sweepMesh")
	meshS = cmds.listRelatives(mesh)[0]
	cmds.DeleteHistory()
	cmds.connectAttr(f"{smc}.outMeshArray[{size}]", f"{meshS}.inMesh")

	connections = cmds.listConnections(f"{meshS}.instObjGroups[0]", source=False, destination=True, plugs=True) or []
	if connections:
		cmds.disconnectAttr(f"{meshS}.instObjGroups[0]", connections[0])
	cmds.setAttr(f"{meshS}.overrideEnabled", 1)
	cmds.setAttr(f"{meshS}.overrideDisplayType", 2)
	cmds.parent(c, mesh, lines_group)
	cmds.hide(c)

	if src and tgt:
		utils.restoreSelection(sel)
	else:
		cmds.select(posers)


	# # import
	# path = rootPath + '//rigTools//' + 'line.ma'		
	# utils.importFile(path, tgt.split("_poser")[0])
	
	
	# line = tgt.replace("poser","line")
	# cmds.parent(line, name_m+"lines_group")
	
	# cmds.parent(line+"_start_cluster_group", src)
	# cmds.parent(line+"_end_cluster_group", tgt)
	# utils.resetAttrs(line + "_start_cluster_group")
	# utils.resetAttrs(line + "_end_cluster_group")
	
	# utils.setUserAttr(src, "lineWidth", 1, type="float", lock=False, keyable=False, cb=True)
	# utils.setUserAttr(tgt, "lineWidth", 1, type="float", lock=False, keyable=False, cb=True)
	
	# cmds.connectAttr(src+".lineWidth", line+"_start_cluster.sx")
	# cmds.connectAttr(src+".lineWidth", line+"_start_cluster.sy")
	# cmds.connectAttr(src+".lineWidth", line+"_start_cluster.sz")
	# cmds.connectAttr(tgt+".lineWidth", line+"_end_cluster.sx")
	# cmds.connectAttr(tgt+".lineWidth", line+"_end_cluster.sy")
	# cmds.connectAttr(tgt+".lineWidth", line+"_end_cluster.sz")
	
	# if cmds.objExists("black_rsMat"):
	# 	cmds.delete(line+"_rsMat")
	# 	cmds.select(line)
	# 	cmds.hyperShade(assign="black_rsMat")
	# else:
	# 	cmds.rename(line+"_rsMat", "black_rsMat")	
		
	# try:
	# 	cmds.select(sel)
	# except: pass
		
def orientPosers():
	sel = cmds.ls(sl=1)
	if len(sel) != 2:
		cmds.warning("Select source and target nodes")
		return
	
	src, tgt = sel
	
	con = cmds.aimConstraint(tgt, src+"Orient", aimVector=(1,0,0), upVector=(0,1,0), worldUpType="none")[0]
	
	utils.setUserAttr(src, "twist", 0, type="float", lock=False, keyable=True, cb=True)
	cmds.connectAttr(src+".twist", con+".offsetX")
	
	cmds.setAttr(src+".rx", e=1, l=True, keyable=0, cb=0 )
	cmds.setAttr(src+".ry", e=1, l=True, keyable=0, cb=0 )
	cmds.setAttr(src+".rz", e=1, l=True, keyable=0, cb=0 )
	
def createAddPoser(name, moduleName): #
	p = name+"_addPoser"
	cmds.duplicate(moduleName+"_root_poser", n=p)[0]
	for o in cmds.listRelatives(p, fullPath=True, type=["transform", "joint"]):
		cmds.delete(o)
	
	cmds.setAttr(p+'.tx', l=False, k=1)
	cmds.setAttr(p+'.ry', l=False, k=1)
	cmds.setAttr(p+'.sz', l=False, k=1)
	cmds.setAttr(p+'.rx', l=False, k=1)
	cmds.setAttr(p+'.ry', l=False, k=1)
	cmds.setAttr(p+'.rz', l=False, k=1)
	cmds.setAttr(p+'.sx', l=False, k=1)
	cmds.setAttr(p+'.sz', l=False)
	cmds.setAttr(p+'.sy', l=False)
	cmds.connectAttr(p+'.sx', p+'.sy')
	cmds.connectAttr(p+'.sx', p+'.sz')
	cmds.setAttr(p+'.sz', l=True)
	cmds.setAttr(p+'.sy', l=True)
	cmds.setAttr(p+'Shape.overrideColor', 15)
	
	mns = cmds.createNode("makeNurbSphere", n=name+"_makeNurbSphere")
	cmds.connectAttr(p+'.size', mns+".radius")
	cmds.connectAttr(mns+".outputSurface", name+"_addPoserShape.create")
	cmds.setAttr(p+'.size', 0.3)

	# create initLoc
	l = cmds.spaceLocator(n=name+"_initLoc")[0]
	cmds.parent(l, p)
	cmds.setAttr(l+'.t', 0,0,0)
	cmds.setAttr(l+'.r', 0,0,0)
	cmds.setAttr(l+'.s', 1,1,1)
	cmds.hide(l)

	utils.addToModuleSet(p, moduleName)
	
def reconnectSize():
	sel = pm.ls(sl=1)
	
	for p in sel:
		if p.name().split("_")[-1] != "poser":
			cmds.warning("Selected object is not poser")
			continue
		
		line_clusters = []
		for n in p.lineWidth.outputs():
			if n not in line_clusters:
				if n.name().split("_")[-1] == "cluster":
					line_clusters.append(n)
		
		mult1 = utils.createNode("multDoubleLinear", n=p.name()+"_sizeMult", pymel=True)
		mult2 = utils.createNode("multDoubleLinear", n=p.name()+"_scaleCorrect", pymel=True)
		
		p.lineWidth >> mult1.input1
		p.size >> mult1.input2
		mult1.output >> mult2.input1
		mult2.input2.set(0.35)
		
		p.lineWidth.setMax(10)
		
		for cl in line_clusters:
			mult2.output >> cl.sx
			mult2.output >> cl.sy
			mult2.output >> cl.sz
			
def addCatcher():
	pass

def renamePoser():
	sel = cmds.ls(sl=1)
	
	if not sel:
		cmds.warning("Select poser to rename")
		return
			
	poser = sel[0]

	if "poser" not in poser:
		cmds.warning("Select poser to rename")
		return


	name, ok = QtWidgets.QInputDialog.getText(None, "Rename Poser", "Please enter new poser name", QtWidgets.QLineEdit.Normal, poser.split("_poser")[0])

	if name and ok:
		if cmds.objExists(name+"_poser"):
			name = incrementPoserIfExists(name)

		if " " in name:
			name = name.replace(" ", "_")

		if "-" in name  or name[0].isdigit():
			QtWidgets.QMessageBox.information(None, "Warning", "Wrong Name.")
			return

	for o in ["initLoc", "poser", "poserOrient", "makeNurbSphere", "size_multDoubleLinear"]:
		old_name = poser.split("_poser")[0]+"_"+o
		new_name = name+"_"+o
		if cmds.objExists(old_name):
			cmds.rename(old_name, new_name)

def duplicatePoser():
	sel = cmds.ls(sl=1)
	
	if not sel:
		cmds.warning("Select poser to duplicate")
		return
			
	poser = sel[0]

	if "poser" not in poser:
		cmds.warning("Select poser to duplicate")
		return
	
	new_poser_name = poser.split("_poser")[0]
	
	new_poser_name = incrementPoserIfExists(new_poser_name)
	
	new_poser = createPoser(new_poser_name)

	con = cmds.pointConstraint(poser, new_poser, mo=0)
	cmds.delete(con)

	cmds.setAttr(new_poser+".size", cmds.getAttr(poser+".size"))
	cmds.select(new_poser)