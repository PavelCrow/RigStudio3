import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
import os
import imp

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
	path = rootPath + '//rigTools//' + 'mainPoser.ma'		
	
	if name == 'mainPoser':
		utils.importFile(path)
		cmds.select("mainPoser")
	else:
		utils.importFile(path, name)
		if cmds.objExists("mainPoser"):
			cmds.parent(name+"_mainPoser", "mainPoser")
		cmds.select(name+"_mainPoser")
		
	return name+"_mainPoser"
		
def createPoser(name=""):
	if not name:
		name, ok = QtWidgets.QInputDialog.getText(None, "Add Poser", "Please enter poser name", QtWidgets.QLineEdit.Normal, "root")
	
		if not cmds.objExists("mainPoser"):
			cmds.warning("mainPoser is not exists")
			return
			
		if ok:
			if cmds.objExists(name+"_poser"):
				QtWidgets.QMessageBox.information(None, "Warning", "This poser is exist.")
				return
	
			if " " in name or "-" in name  or name[0].isdigit():
				QtWidgets.QMessageBox.information(None, "Warning", "Wrong Name.")
				return
		else:
			return
		
	# import
	path = rootPath + '//rigTools//' + 'poser.ma'		
	utils.importFile(path, name)
	
	if cmds.objExists("red_rsMat"):
		cmds.delete(name+"_red_rsMat")
		cmds.select(name+"_poser_axis_x")
		cmds.hyperShade(assign= "red_rsMat")
		cmds.delete(name+"_green_rsMat")
		cmds.select(name+"_poser_axis_y")
		cmds.hyperShade(assign= "green_rsMat")
		cmds.delete(name+"_blue_rsMat")
		cmds.select(name+"_poser_axis_z")
		cmds.hyperShade(assign= "blue_rsMat")
	else:
		cmds.rename(name+"_red_rsMat", "red_rsMat")
		cmds.rename(name+"_green_rsMat", "green_rsMat")
		cmds.rename(name+"_blue_rsMat", "blue_rsMat")
	
	if cmds.objExists("mainPoser"):
		cmds.parent(name+"_poser", "mainPoser")
	cmds.select(name+"_poser")
	
	return name+"_poser"

def connectPosers(src=None, tgt=None, name_m=""):
	if not src:
		sel = cmds.ls(sl=1)
		if len(sel) != 2:
			cmds.warning("Select source and target nodes")
			return
			
		src, tgt = sel	

	if not cmds.objExists(name_m+"lines_group"):
		cmds.group(empty=True, n=name_m+"lines_group")
		cmds.parent(name_m+"lines_group", name_m+"mainPoser")
			
	# import
	path = rootPath + '//rigTools//' + 'line.ma'		
	utils.importFile(path, tgt.split("_poser")[0])
	
	
	line = tgt.replace("poser","line")
	cmds.parent(line, name_m+"lines_group")
	
	cmds.parent(line+"_start_cluster_group", src)
	cmds.parent(line+"_end_cluster_group", tgt)
	utils.resetAttrs(line + "_start_cluster_group")
	utils.resetAttrs(line + "_end_cluster_group")
	
	utils.setUserAttr(src, "lineWidth", 1, type="float", lock=False, keyable=False, cb=True)
	utils.setUserAttr(tgt, "lineWidth", 1, type="float", lock=False, keyable=False, cb=True)
	
	cmds.connectAttr(src+".lineWidth", line+"_start_cluster.sx")
	cmds.connectAttr(src+".lineWidth", line+"_start_cluster.sy")
	cmds.connectAttr(src+".lineWidth", line+"_start_cluster.sz")
	cmds.connectAttr(tgt+".lineWidth", line+"_end_cluster.sx")
	cmds.connectAttr(tgt+".lineWidth", line+"_end_cluster.sy")
	cmds.connectAttr(tgt+".lineWidth", line+"_end_cluster.sz")
	
	if cmds.objExists("black_rsMat"):
		cmds.delete(line+"_rsMat")
		cmds.select(line)
		cmds.hyperShade(assign="black_rsMat")
	else:
		cmds.rename(line+"_rsMat", "black_rsMat")	
		
	try:
		cmds.select(sel)
	except: pass
		
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
		
		mult1 = pm.createNode("multDoubleLinear", n=p.name()+"_sizeMult")
		mult2 = pm.createNode("multDoubleLinear", n=p.name()+"_scaleCorrect")
		
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