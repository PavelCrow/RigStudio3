import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
from functools import partial

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

import os

from .import utils, main

rootPath = os.path.normpath(os.path.dirname(__file__))
templatesPath = rootPath+"/map/templates"

ns = ""

def makeTestAnimation(win):
	ctrls = cmds.ls(sl=True) or []
	if len(ctrls) == 0:
		cmds.warning("Select one control")
		return
	
	if not cmds.objExists("animHelper_multiplyDivide"):
		template_path = rootPath + '//rigTools//animHelper.ma'
		utils.importFile(template_path, "")			
	
	for ctrl in ctrls:
		if ":" in ctrl:
			ctrlWithoutNS = ctrl.split(":")[1]
		else:
			ctrlWithoutNS = ctrl
		cmds.cutKey(ctrl)
		try:
			outX = ns+"animHelperX_output_"+ctrlWithoutNS
			x = cmds.duplicate(ns+"animHelperX_output", name=outX)
			cmds.connectAttr(ns+"animHelper_multiplyDivide.outputX", outX+".input")
			cmds.connectAttr(outX+".output", ctrl+".rx")
		except: pass

		try:
			outY = ns+"animHelperY_output_"+ctrlWithoutNS
			cmds.duplicate(ns+"animHelperY_output", name=outY)
			cmds.connectAttr(ns+"animHelper_multiplyDivide.outputY", outY+".input")
			cmds.connectAttr(outY+".output", ctrl+".ry")
		except: pass
		try:
			outZ = ns+"animHelperZ_output_"+ctrlWithoutNS
			cmds.duplicate(ns+"animHelperZ_output", name=outZ)
			cmds.connectAttr(ns+"animHelper_multiplyDivide.outputZ", outZ+".input")				
			cmds.connectAttr(outZ+".output", ctrl+".rz")		
		except: pass

	mult = win.mult_doubleSpinBox.value()
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1X", mult)
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1Y", mult)		
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1Z", mult)	

	cmds.playbackOptions(min=0, max=144)
		
def multAnim_spinBoxChange(win, v):
	#print v
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1X", v)
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1Y", v)
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1Z", v)
	
	win.mult_horizontalSlider.setValue(v)

def multAnim_sliderChange(win, v):
	#print v, win
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1X", v)
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1Y", v)
	cmds.setAttr(ns+"animHelper_multiplyDivide.input1Z", v)

	win.mult_doubleSpinBox.setValue(v)

def clearTestAnimation():
	xList = cmds.listConnections( ns+'animHelper_multiplyDivide.outputX', d=True)
	xList.remove(ns+"animHelperX_output")
	yList = cmds.listConnections( ns+'animHelper_multiplyDivide.outputY', d=True)
	yList.remove(ns+"animHelperY_output")
	zList = cmds.listConnections( ns+'animHelper_multiplyDivide.outputZ', d=True)
	zList.remove(ns+"animHelperZ_output")
	crvs = xList + yList + zList
	#print crvs
	for crv in crvs:
		try:
			ctrl = cmds.listConnections( crv+'.output', d=True)[0]
			#print ctrl
		except: pass
		#print crv
		cmds.delete(crv)


		try:
			cmds.setAttr(ctrl+".rx", 0)
		except: pass
		try:
			cmds.setAttr(ctrl+".ry", 0)
		except: pass
		try:
			cmds.setAttr(ctrl+".rz", 0)				
		except: pass
	
	
	
# Parent Switcher

def ps_setObject(win):
	sel = cmds.ls(sl=True) or []
	if len(sel) == 0:
		cmds.warning("Select one control")
		return
	
	obj = sel[0]
	
	win.parentSwitcher_lineEdit.setText(obj)
	
	win.frame_28.setEnabled(True)
	win.label_7.setEnabled(True)
	win.parentSwitcher_attribute_lineEdit.setEnabled(True)
	
def ps_addTarget(win):
	# get selections
	sels = cmds.ls(sl=True, transforms=True)
	if len(sels) == 0:
		cmds.warning("Select target")
		return

	for t in sels:
		exists = win.parentSwitcher_tableWidget.findItems(t, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive) or []
		if len(exists) > 0:
			continue
		
		if t == win.parentSwitcher_lineEdit.text():
			continue
				
		# create item
		item = QtWidgets.QTableWidgetItem(t)
		# set item not editable
		item.setFlags(QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled)			

		# add item to table
		count = win.parentSwitcher_tableWidget.rowCount()
		win.parentSwitcher_tableWidget.insertRow(count)
		win.parentSwitcher_tableWidget.setItem(count, 0, item)

		# add nice name
		name = t
		item = QtWidgets.QTableWidgetItem(name)
		win.parentSwitcher_tableWidget.setItem(count, 1, item)
		
def ps_removeTarget(win):
	row = win.parentSwitcher_tableWidget.currentRow()
	win.parentSwitcher_tableWidget.removeRow(row)	
	
	if row > 0:
		win.parentSwitcher_tableWidget.selectRow(row-1)
	elif row == 0:
		win.parentSwitcher_tableWidget.selectRow(0)
	
def ps_moveTarget(win, direction):
	# swap rows
	currRow = win.parentSwitcher_tableWidget.currentRow()
	count = win.parentSwitcher_tableWidget.rowCount()
	
	if count == 0:
		return

	# stop on edges of list
	if direction == "up" and currRow == 0:
		return
	if direction == "down" and currRow == count-1:
		return

	if direction == "up":
		targetRow = currRow - 1
	elif direction == "down":
		targetRow = currRow + 1

	if not  win.parentSwitcher_tableWidget.item(currRow, 0):
		return
	
	objTop = win.parentSwitcher_tableWidget.item(currRow, 0).text()
	nameTop = win.parentSwitcher_tableWidget.item(currRow, 1).text()

	objTop_t = win.parentSwitcher_tableWidget.item(targetRow, 0).text()
	nameTop_t = win.parentSwitcher_tableWidget.item(targetRow, 1).text()		

	win.parentSwitcher_tableWidget.item(currRow, 0).setText(objTop_t)
	win.parentSwitcher_tableWidget.item(currRow, 1).setText(nameTop_t)

	win.parentSwitcher_tableWidget.item(targetRow, 0).setText(objTop)
	win.parentSwitcher_tableWidget.item(targetRow, 1).setText(nameTop)

	# change selection
	win.parentSwitcher_tableWidget.selectRow(targetRow)
	
def ps_delete(win):
	obj = win.parentSwitcher_lineEdit.text()
	
	gr = obj+"_parentSwitcher_group"
	if cmds.objExists(gr):
		par = cmds.listRelatives(gr, p=1)[0]
		cmds.parent(obj, par)
		cmds.delete(gr)
		
	count = win.parentSwitcher_tableWidget.rowCount()
	for i in range(count):
		t = win.parentSwitcher_tableWidget.item(i, 0).text()	
		t_obj = t + "__" + obj + "__parentSwitcherTarget"
		if cmds.objExists(t_obj):
			cmds.delete(t_obj)
		
	attrName = win.parentSwitcher_attribute_lineEdit.text()
	if cmds.objExists(obj+"."+attrName):
		cmds.deleteAttr(obj, attribute=attrName)
		
def ps_createUpdate(win):
	obj = win.parentSwitcher_lineEdit.text()
	
	gr = obj+"_parentSwitcher_group"
	if cmds.objExists(gr):
		ps_delete(win)
		return
	
	count = win.parentSwitcher_tableWidget.rowCount()
	if count == 0:
		return	
	
	cmds.select(obj)
	mel.eval("Group()")
	sel = cmds.ls(sl=1)[0]
	cmds.rename(sel, gr)
	
	targets = []
	niceNames = []
	for i in range(count):
		t_name = win.parentSwitcher_tableWidget.item(i, 0).text()
		nice_name = win.parentSwitcher_tableWidget.item(i, 1).text()
		t = t_name + "__" + obj + "__parentSwitcherTarget"
		cmds.spaceLocator(n=t)
		cmds.parent(t, obj)
		utils.resetAttrs(t)
		cmds.parent(t, t_name)
		targets.append(t)
		niceNames.append(nice_name)
		cmds.hide(t)
		
	const = cmds.parentConstraint(targets, gr, mo=1)[0]
	
	attrName = win.parentSwitcher_attribute_lineEdit.text()
	cmds.addAttr(obj, longName=attrName, attributeType='enum', keyable=1, enumName=':'.join(niceNames) )
	
	# set driven keys
	for k in range (len(niceNames)):
		# first set attr on control
		cmds.setAttr("%s.%s" %(obj, attrName), k)
		# then foreach constraint attr
		for i in range (len(niceNames)):
			# set 1 or 0
			if i == k:
				cmds.setAttr("%s.%sW%i" %(const, targets[i], i), 1)
			else:
				cmds.setAttr("%s.%sW%i" %(const, targets[i], i), 0)
			# and set key
			cmds.setDrivenKeyframe("%s.%sW%i" %(const, targets[i], i), currentDriver="%s.%s" %(obj, attrName))	
			
			
# Curve Tools
def pointOnCurveLocators():
	sels = pm.ls(sl=True)
	if len(sels) != 1:
		cmds.warning("Select one curve")
		return
	
	crv = sels[0]
	crvS = crv.getShape()

	if pm.objectType(crvS) != "nurbsCurve":
		cmds.warning("Select one curve")
		return
	
	result = cmds.promptDialog(
	    title='Count', message='Enter locators count:',
	    button=['OK', 'Cancel'], defaultButton='OK', cancelButton='Cancel', dismissString='Cancel',
	    text = "1",	style='text')

	if result == 'OK':
		count = int(cmds.promptDialog(query=True, text=True))
	else:
		return
	
	for i in range(count):	
		l = pm.spaceLocator(n=crv+"_"+str(i))
		ci = pm.createNode("pointOnCurveInfo", n=crv+"_"+str(i)+"_pointOnCurveInfo")
		crvS.worldSpace >> ci.inputCurve
		ci.position >> l.translate
		ci.turnOnPercentage.set(True)
		if count > 1:
			ci.parameter.set(float(i)/float(count-1))
		
		
		
def addRotateOrder():
	sel = cmds.ls(sl=True)
	if len(sel) == 0:
		cmds.warning("Select control")
		return
	
	for c in sel:
		utils.setUserAttr(c, "_rotateOrder", 0, type="enum", enumList="xyz:yzx:zxy:xzy:yxz:zyx:", lock=False, keyable=False, cb=True)
		cmds.connectAttr(c+"._rotateOrder", c+".rotateOrder")
		
		
def addWorldSpaceAttr():
	sel = cmds.ls(sl=True)
	if len(sel) == 0:
		cmds.warning("Select control")
		return
	
	for c in sel:
		utils.setUserAttr(c, "worldSpace", 1, type="bool", lock=False, keyable=False, cb=False)
		
		
def addMirrorLoc():
	sel = cmds.ls(sl=True)
	if len(sel) != 2:
		cmds.warning("Select the root and the pelvis controls")
		return
	
	root, pelvis = sel
	
	l = cmds.spaceLocator(n="mirror_loc")[0]
	cmds.setAttr(l+".rotateOrder", 1)
	cmds.parent(l, root)
	cmds.setAttr(l+".t", 0,0,0)
	cmds.setAttr(l+".r", 0,0,0)
	cmds.setAttr(l+".s", 1,1,1)
	cmds.hide(l)
	cmds.pointConstraint(pelvis, l, mo=0, skip="y")
	cmds.orientConstraint(pelvis, l, mo=0, skip=["x", "z"])


def addMirrorAxisAttr():
	sel = cmds.ls(sl=True)
	if len(sel) == 0:
		cmds.warning("Select control")
		return
	
	for c in sel:
		utils.setUserAttr(c, "mirrorAxis", 0, type="enum", enumList="none:x:y:z:", lock=False, keyable=False, cb=False)


def addControlGroup():
	sel = cmds.ls(sl=1)
	for o  in sel:
		gr = o + "_sdkGroup"
		rootName = o + "_sdkGroup"
		
		#print name, suffix, rootName
		while cmds.objExists(gr):
			suffix = gr.split('_')[-1]
			if suffix.isdigit():
				gr = rootName + '_' + str( int(suffix) + 1 )
			else:
				gr += '_1'
		
		cmds.select(o)
		cmds.group(n=gr)
		cmds.xform(os=1, piv=(0,0,0))

	if sel:
		cmds.select(sel)
		
		
def smf_baseRigPostScript():
	if not cmds.objExists("world"):
		cmds.rename('main', 'char')
		cmds.rename('root', 'main')
		cmds.circle(n='world', nr=(0,1,0), r=2.8)
		cmds.setAttr("worldShape.overrideEnabled", 1)
		cmds.setAttr("worldShape.overrideColor", 15)
		cmds.parent('world', 'root_group')
		cmds.setAttr('world.s', 1,1,1)
		cmds.select('world')
		cmds.DeleteHistory()
		cmds.parent('main', 'world')
		cmds.sets('world', edit=1, forceElement='body_controlSet');
	else:
		cmds.warning ("rig smf update is already done")
		
		
def connectByMultMatrix():
	# Connect by matrix
	# All from worldMatrix, last from worldInverseMatrix
	sel = pm.selected()
	t = sel[-1]
	mm = pm.createNode("multMatrix", n=t+"_multMatrix")
	for i in range(len(sel)-2):
		sel[i].worldMatrix >> mm.matrixIn[i]
	sel[-2].worldInverseMatrix >> mm.matrixIn[len(sel)-2]
	mm.matrixSum >> t.offsetParentMatrix
	
def connectByBlendMatrix():
	# connect by blendMatrix
	s1, s2, t = pm.selected()
	bm = pm.createNode("blendMatrix")
	s1.worldMatrix[0] >> bm.inputMatrix
	s2.worldMatrix[0] >> bm.target[0].targetMatrix
	bm.outputMatrix >> t.offsetParentMatrix
	
