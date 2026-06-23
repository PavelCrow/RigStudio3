import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
import maya.OpenMayaAnim as oma
import json, os, tempfile
from functools import partial

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

import os

from .import utils

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


def ikFkSwitch():
	import rigStudio3.animTools.switchIkFk as switchIkFk 
	switchIkFk.switchIkFk()
	
def symmetry():
	import rigStudio3.animTools.switchIkFk as switchIkFk 
	switchIkFk.symmetry()

def mirror():
	import rigStudio3.animTools.switchIkFk as switchIkFk 
	switchIkFk.mirror()


def addControlGroup():
	sel = cmds.ls(sl=1)
	for o  in sel:
		gr = o + "_group"
		rootName = o + "_group"
		
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
		
		
def buildMocapSkeleton():
	if cmds.objExists("mocap_skeleton"):
		cmds.warning("Mocap Skeleton is exists")
		return

	# if full skeleton in not exists (for dummy rig)
	if not cmds.objExists("skeleton") or not cmds.listRelatives("skeleton"):

		data = {'head_root_mJoint': {'name': 'head_root_mJoint',
						'parent': 'neck_mJoint',
						'target': 'head'},
		'l_arm_middle_mJoint': {'name': 'l_arm_middle_mJoint',
								'parent': 'l_arm_root_mJoint',
								'target': 'l_arm_middle_outJoint'},
		'l_arm_root_mJoint': {'name': 'l_arm_root_mJoint',
							'parent': 'l_clav_root_mJoint',
							'target': 'l_arm_root_outJoint'},
		'l_clav_root_mJoint': {'name': 'l_clav_root_mJoint',
								'parent': 'spine_end_mJoint',
								'target': 'l_shoulder_skinJoint'},
		'l_fingers_root_mJoint': {'name': 'l_fingers_root_mJoint',
								'parent': 'l_arm_middle_mJoint',
								'target': 'l_hand_root_skinJoint'},
		'l_foot_root_mJoint': {'name': 'l_foot_root_mJoint',
								'parent': 'l_leg_middle_mJoint',
								'target': 'l_foot_root_skinJoint'},
		'l_foot_toeTip_mJoint': {'name': 'l_foot_toeTip_mJoint',
								'parent': 'l_foot_toe_mJoint',
								'target': 'l_foot_toeTip_outJoint'},
		'l_foot_toe_mJoint': {'name': 'l_foot_toe_mJoint',
							'parent': 'l_foot_root_mJoint',
							'target': 'l_foot_toe_skinJoint'},
		'l_indexFinger_1_mJoint': {'name': 'l_indexFinger_1_mJoint',
									'parent': 'l_index_root_mJoint',
									'target': 'l_hand_indexFinger_1_skinJoint'},
		'l_indexFinger_2_mJoint': {'name': 'l_indexFinger_2_mJoint',
									'parent': 'l_indexFinger_1_mJoint',
									'target': 'l_hand_indexFinger_2_skinJoint'},
		'l_indexFinger_3_mJoint': {'name': 'l_indexFinger_3_mJoint',
									'parent': 'l_indexFinger_2_mJoint',
									'target': 'l_hand_indexFinger_3_skinJoint'},
		'l_indexFinger_end_mJoint': {'name': 'l_indexFinger_end_mJoint',
									'parent': 'l_indexFinger_3_mJoint',
									'target': 'l_hand_indexFinger_end_outJoint'},
		'l_index_root_mJoint': {'name': 'l_index_root_mJoint',
								'parent': 'l_fingers_root_mJoint',
								'target': 'l_hand_index_root_skinJoint'},
		'l_leg_middle_mJoint': {'name': 'l_leg_middle_mJoint',
								'parent': 'l_leg_root_mJoint',
								'target': 'l_leg_middle_outJoint'},
		'l_leg_root_mJoint': {'name': 'l_leg_root_mJoint',
							'parent': 'spine_root_mJoint',
							'target': 'l_leg_root_outJoint'},
		'l_middleFinger_1_mJoint': {'name': 'l_middleFinger_1_mJoint',
									'parent': 'l_middle_root_mJoint',
									'target': 'l_hand_middleFinger_1_skinJoint'},
		'l_middleFinger_2_mJoint': {'name': 'l_middleFinger_2_mJoint',
									'parent': 'l_middleFinger_1_mJoint',
									'target': 'l_hand_middleFinger_2_skinJoint'},
		'l_middleFinger_3_mJoint': {'name': 'l_middleFinger_3_mJoint',
									'parent': 'l_middleFinger_2_mJoint',
									'target': 'l_hand_middleFinger_3_skinJoint'},
		'l_middleFinger_end_mJoint': {'name': 'l_middleFinger_end_mJoint',
									'parent': 'l_middleFinger_3_mJoint',
									'target': 'l_hand_middleFinger_end_outJoint'},
		'l_middle_root_mJoint': {'name': 'l_middle_root_mJoint',
								'parent': 'l_fingers_root_mJoint',
								'target': 'l_hand_middle_root_skinJoint'},
		'l_pinkyFinger_1_mJoint': {'name': 'l_pinkyFinger_1_mJoint',
									'parent': 'l_pinky_root_mJoint',
									'target': 'l_hand_pinkyFinger_1_skinJoint'},
		'l_pinkyFinger_2_mJoint': {'name': 'l_pinkyFinger_2_mJoint',
									'parent': 'l_pinkyFinger_1_mJoint',
									'target': 'l_hand_pinkyFinger_2_skinJoint'},
		'l_pinkyFinger_3_mJoint': {'name': 'l_pinkyFinger_3_mJoint',
									'parent': 'l_pinkyFinger_2_mJoint',
									'target': 'l_hand_pinkyFinger_3_skinJoint'},
		'l_pinkyFinger_end_mJoint': {'name': 'l_pinkyFinger_end_mJoint',
									'parent': 'l_pinkyFinger_3_mJoint',
									'target': 'l_hand_pinkyFinger_end_outJoint'},
		'l_pinky_root_mJoint': {'name': 'l_pinky_root_mJoint',
								'parent': 'l_fingers_root_mJoint',
								'target': 'l_hand_pinky_root_skinJoint'},
		'l_ringFinger_1_mJoint': {'name': 'l_ringFinger_1_mJoint',
								'parent': 'l_ring_root_mJoint',
								'target': 'l_hand_ringFinger_1_skinJoint'},
		'l_ringFinger_2_mJoint': {'name': 'l_ringFinger_2_mJoint',
								'parent': 'l_ringFinger_1_mJoint',
								'target': 'l_hand_ringFinger_2_skinJoint'},
		'l_ringFinger_3_mJoint': {'name': 'l_ringFinger_3_mJoint',
								'parent': 'l_ringFinger_2_mJoint',
								'target': 'l_hand_ringFinger_3_skinJoint'},
		'l_ringFinger_end_mJoint': {'name': 'l_ringFinger_end_mJoint',
									'parent': 'l_ringFinger_3_mJoint',
									'target': 'l_hand_ringFinger_end_outJoint'},
		'l_ring_root_mJoint': {'name': 'l_ring_root_mJoint',
								'parent': 'l_fingers_root_mJoint',
								'target': 'l_hand_ring_root_skinJoint'},
		'l_thumbFinger_1_mJoint': {'name': 'l_thumbFinger_1_mJoint',
									'parent': 'l_fingers_root_mJoint',
									'target': 'l_hand_thumbFinger_1_skinJoint'},
		'l_thumbFinger_2_mJoint': {'name': 'l_thumbFinger_2_mJoint',
									'parent': 'l_thumbFinger_1_mJoint',
									'target': 'l_hand_thumbFinger_2_skinJoint'},
		'l_thumbFinger_3_mJoint': {'name': 'l_thumbFinger_3_mJoint',
									'parent': 'l_thumbFinger_2_mJoint',
									'target': 'l_hand_thumbFinger_3_skinJoint'},
		'l_thumbFinger_end_mJoint': {'name': 'l_thumbFinger_end_mJoint',
									'parent': 'l_thumbFinger_3_mJoint',
									'target': 'l_hand_thumbFinger_end_outJoint'},
		'neck_mJoint': {'name': 'neck_mJoint',
						'parent': 'spine_end_mJoint',
						'target': 'neck'},
		'r_arm_middle_mJoint': {'name': 'r_arm_middle_mJoint',
								'parent': 'r_arm_root_mJoint',
								'target': 'r_arm_middle_outJoint'},
		'r_arm_root_mJoint': {'name': 'r_arm_root_mJoint',
							'parent': 'r_clav_root_mJoint',
							'target': 'r_arm_root_outJoint'},
		'r_clav_root_mJoint': {'name': 'r_clav_root_mJoint',
								'parent': 'spine_end_mJoint',
								'target': 'r_shoulder_skinJoint'},
		'r_fingers_root_mJoint': {'name': 'r_fingers_root_mJoint',
								'parent': 'r_arm_middle_mJoint',
								'target': 'r_hand_root_skinJoint'},
		'r_foot_root_mJoint': {'name': 'r_foot_root_mJoint',
								'parent': 'r_leg_middle_mJoint',
								'target': 'r_foot_root_skinJoint'},
		'r_foot_toeTip_mJoint': {'name': 'r_foot_toeTip_mJoint',
								'parent': 'r_foot_toe_mJoint',
								'target': 'r_foot_toeTip_outJoint'},
		'r_foot_toe_mJoint': {'name': 'r_foot_toe_mJoint',
							'parent': 'r_foot_root_mJoint',
							'target': 'r_foot_toe_skinJoint'},
		'r_indexFinger_1_mJoint': {'name': 'r_indexFinger_1_mJoint',
									'parent': 'r_index_root_mJoint',
									'target': 'r_hand_indexFinger_1_skinJoint'},
		'r_indexFinger_2_mJoint': {'name': 'r_indexFinger_2_mJoint',
									'parent': 'r_indexFinger_1_mJoint',
									'target': 'r_hand_indexFinger_2_skinJoint'},
		'r_indexFinger_3_mJoint': {'name': 'r_indexFinger_3_mJoint',
									'parent': 'r_indexFinger_2_mJoint',
									'target': 'r_hand_indexFinger_3_skinJoint'},
		'r_indexFinger_end_mJoint': {'name': 'r_indexFinger_end_mJoint',
									'parent': 'r_indexFinger_3_mJoint',
									'target': 'r_hand_indexFinger_end_outJoint'},
		'r_index_root_mJoint': {'name': 'r_index_root_mJoint',
								'parent': 'r_fingers_root_mJoint',
								'target': 'r_hand_index_root_skinJoint'},
		'r_leg_middle_mJoint': {'name': 'r_leg_middle_mJoint',
								'parent': 'r_leg_root_mJoint',
								'target': 'r_leg_middle_outJoint'},
		'r_leg_root_mJoint': {'name': 'r_leg_root_mJoint',
							'parent': 'spine_root_mJoint',
							'target': 'r_leg_root_outJoint'},
		'r_middleFinger_1_mJoint': {'name': 'r_middleFinger_1_mJoint',
									'parent': 'r_middle_root_mJoint',
									'target': 'r_hand_middleFinger_1_skinJoint'},
		'r_middleFinger_2_mJoint': {'name': 'r_middleFinger_2_mJoint',
									'parent': 'r_middleFinger_1_mJoint',
									'target': 'r_hand_middleFinger_2_skinJoint'},
		'r_middleFinger_3_mJoint': {'name': 'r_middleFinger_3_mJoint',
									'parent': 'r_middleFinger_2_mJoint',
									'target': 'r_hand_middleFinger_3_skinJoint'},
		'r_middleFinger_end_mJoint': {'name': 'r_middleFinger_end_mJoint',
									'parent': 'r_middleFinger_3_mJoint',
									'target': 'r_hand_middleFinger_end_outJoint'},
		'r_middle_root_mJoint': {'name': 'r_middle_root_mJoint',
								'parent': 'r_fingers_root_mJoint',
								'target': 'r_hand_middle_root_skinJoint'},
		'r_pinkyFinger_1_mJoint': {'name': 'r_pinkyFinger_1_mJoint',
									'parent': 'r_pinky_root_mJoint',
									'target': 'r_hand_pinkyFinger_1_skinJoint'},
		'r_pinkyFinger_2_mJoint': {'name': 'r_pinkyFinger_2_mJoint',
									'parent': 'r_pinkyFinger_1_mJoint',
									'target': 'r_hand_pinkyFinger_2_skinJoint'},
		'r_pinkyFinger_3_mJoint': {'name': 'r_pinkyFinger_3_mJoint',
									'parent': 'r_pinkyFinger_2_mJoint',
									'target': 'r_hand_pinkyFinger_3_skinJoint'},
		'r_pinkyFinger_end_mJoint': {'name': 'r_pinkyFinger_end_mJoint',
									'parent': 'r_pinkyFinger_3_mJoint',
									'target': 'r_hand_pinkyFinger_end_outJoint'},
		'r_pinky_root_mJoint': {'name': 'r_pinky_root_mJoint',
								'parent': 'r_fingers_root_mJoint',
								'target': 'r_hand_pinky_root_skinJoint'},
		'r_ringFinger_1_mJoint': {'name': 'r_ringFinger_1_mJoint',
								'parent': 'r_ring_root_mJoint',
								'target': 'r_hand_ringFinger_1_skinJoint'},
		'r_ringFinger_2_mJoint': {'name': 'r_ringFinger_2_mJoint',
								'parent': 'r_ringFinger_1_mJoint',
								'target': 'r_hand_ringFinger_2_skinJoint'},
		'r_ringFinger_3_mJoint': {'name': 'r_ringFinger_3_mJoint',
								'parent': 'r_ringFinger_2_mJoint',
								'target': 'r_hand_ringFinger_3_skinJoint'},
		'r_ringFinger_end_mJoint': {'name': 'r_ringFinger_end_mJoint',
									'parent': 'r_ringFinger_3_mJoint',
									'target': 'r_hand_ringFinger_end_outJoint'},
		'r_ring_root_mJoint': {'name': 'r_ring_root_mJoint',
								'parent': 'r_fingers_root_mJoint',
								'target': 'r_hand_ring_root_skinJoint'},
		'r_thumbFinger_1_mJoint': {'name': 'r_thumbFinger_1_mJoint',
									'parent': 'r_fingers_root_mJoint',
									'target': 'r_hand_thumbFinger_1_skinJoint'},
		'r_thumbFinger_2_mJoint': {'name': 'r_thumbFinger_2_mJoint',
									'parent': 'r_thumbFinger_1_mJoint',
									'target': 'r_hand_thumbFinger_2_skinJoint'},
		'r_thumbFinger_3_mJoint': {'name': 'r_thumbFinger_3_mJoint',
									'parent': 'r_thumbFinger_2_mJoint',
									'target': 'r_hand_thumbFinger_3_skinJoint'},
		'r_thumbFinger_end_mJoint': {'name': 'r_thumbFinger_end_mJoint',
									'parent': 'r_thumbFinger_3_mJoint',
									'target': 'r_hand_thumbFinger_end_outJoint'},
		'spine_1_mJoint': {'name': 'spine_1_mJoint',
							'parent': 'spine_root_mJoint',
							'target': 'spine_local_2'},
		'spine_2_mJoint': {'name': 'spine_2_mJoint',
							'parent': 'spine_1_mJoint',
							'target': 'spine_local_3'},
		'spine_3_mJoint': {'name': 'spine_3_mJoint',
							'parent': 'spine_2_mJoint',
							'target': 'spine_local_4'},
		'spine_end_mJoint': {'name': 'spine_end_mJoint',
							'parent': 'spine_3_mJoint',
							'target': 'spine_end_skinJoint'},
		'spine_root_mJoint': {'name': 'spine_root_mJoint',
							'parent': 'mocap_skeleton',
							'target': 'spine_root_skinJoint'}
							}

		cmds.group(n="mocap_skeleton", empty=1)

		# create joints
		for j in data:
			cmds.joint(n=j)
			cmds.select(clear=1)

		for j in data:    
			j_data = data[j]
			cmds.parent(j, j_data["parent"])
			cmds.parentConstraint(j_data["target"], j, mo=0)

		for j in cmds.listRelatives("spine_root_mJoint", allDescendents=1):
			if not cmds.objectType(j) == "joint":
				cmds.delete(j)

	# for rigs from templates
	else:
		skel = cmds.duplicate("skeleton", n="mocap_skeleton")[0]
		cmds.parent(skel, w=1)

		for j in cmds.listRelatives(skel, allDescendents=1, fullPath=1):
			# delete if not joint and has not childs
			if not cmds.objectType(j) == "joint" and not cmds.listRelatives(j):
				cmds.delete(j)
				continue

			j = cmds.rename(j, j.split("|")[-1].replace("skinJoint", "mJoint"))
			cmds.setAttr(j+".segmentScaleCompensate", 0)
			cmds.setAttr(j+".drawStyle", 0)
			cmds.setAttr(j+".preferredAngle", 0,0,0)

			orig_j = j.replace("mJoint", "skinJoint")
			t = cmds.getAttr(orig_j+".t")[0]
			cmds.setAttr(j+".t", t[0], t[1], t[2])
			r = cmds.getAttr(orig_j+".r")[0]
			cmds.setAttr(j+".r", r[0], r[1], r[2])
			cmds.setAttr(j+".s", 1, 1, 1)
			
		cmds.showHidden(skel)
		root_j = cmds.listRelatives(skel)
		spine_root_j = cmds.listRelatives(root_j)
		cmds.parent(spine_root_j, skel)
		cmds.delete(root_j)
		
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
	
def bakeDummyRig():
	import maya.cmds as cmds

	if not cmds.objExists("skeleton") or cmds.listRelatives("skeleton"):
		cmds.warning('This rig is not "Dummy Rig". Skeleton is not empty')
		return

	def getSetObjects(set):
		objects = []
		if not cmds.objExists(set):
			return []
		if cmds.objectType(set) != 'objectSet':
			return []

		childs = cmds.sets(set, q=1) or []

		for o in childs:
			if cmds.objectType(o) == 'objectSet':
				innerObjects = getSetObjects(o)
				objects += innerObjects
			else:
				objects.append(o)
		return objects

	# off softIk
	for c in getSetObjects("controlSet"):
		if cmds.objExists(c+".softIk"):
			cmds.setAttr(c+".softIk", 0)
		
	# unparent joints
	joints = cmds.sets("body_skinJoints_set", q=1)
	for j in joints:
		conns_in = cmds.listConnections(j, plugs=1, connections=1, s=1, d=0) or []
		sources_in = conns_in[1::2]
		targets_in = conns_in[::2]
		for i, s in enumerate(sources_in):
			cmds.setAttr(targets_in[i], lock=0)
			cmds.disconnectAttr(sources_in[i], j+'.'+targets_in[i].split('.')[1])
		cmds.parent(j, w=1)

	# delete unused
	cmds.delete("rig")

	for j in joints:
		cmds.setAttr(j+".v", 1)
		childs = pm.listRelatives(j)
		if childs:
			pm.delete(childs)

	def attr_from_connection (attr, source=False, destination=False, targetName=None):
		if destination:
			if pm.connectionInfo( attr, isSource=True):
				outputs = pm.connectionInfo( attr, destinationFromSource=True)
				if len(outputs) == 0:
					return None
				elif len(outputs) == 1:
					out_attr = pm.PyNode(outputs[0])
					return out_attr
				else:
					pm.warning("Found multiple attributes")
					print (outputs)
					if targetName:
						for out in outputs:
							if targetName in out:
								out_attr = pm.PyNode(out)
								return out_attr
					return None
		elif source:
			pass
		else:
			pm.warning("Set source or destination flag")

	# delete parent joints
	for j in joints:
		if cmds.listRelatives(j, p=1):
			tr = cmds.listRelatives(j, p=1)[0]
			m = cmds.xform(j, m=1, q=1, ws=1)
			cmds.setAttr(tr+".s", 1,1,1)
			cmds.setAttr(tr+".shearXY", 0)
			cmds.setAttr(tr+".shearXZ", 0)
			cmds.setAttr(tr+".shearYZ", 0)
			cmds.parent(j, w=1)
			cmds.xform(j, m=m, ws=1)
			cmds.delete(tr)
			

	# reset scale
	for j in joints:
		cmds.setAttr(j+".s", 1,1,1)
		cmds.setAttr(j+".radius", 1)
		if "hand" in j or "psd" in j or "ibw" in j:
			cmds.setAttr(j+".radius", 0.2)
		if "hand_root" in j:
			cmds.setAttr(j+".radius", 1)
		

	# rebind skin
	geos = []
	for sh in pm.ls(geometry=1):
		p = pm.listRelatives(sh, p=1)[0]
		if not p in geos:
			geos.append(p)
		
	for geo in geos:
		sh = geo.getShape()
		if not len(sh.inMesh.inputs()) :
			pm.warning("Miss scincluster")
		sc = sh.inMesh.inputs()[0]

		# enter rebind mode
		for j in sc.matrix.inputs():
			scAttr = attr_from_connection(j.worldMatrix[0], destination=True, targetName=sc.name())
			id = scAttr.name().split("[")[-1][:-1]
			j.worldInverseMatrix[0] >> sc.bindPreMatrix[id]

		# exit rebind mode
		for j in sc.matrix.inputs():
			scAttr = attr_from_connection(j.worldMatrix[0], destination=True, targetName=sc.name())
			id = scAttr.name().split("[")[-1][:-1]
			m = j.worldInverseMatrix[0].get()
			pm.disconnectAttr(j.worldInverseMatrix[0], sc.bindPreMatrix[id])
			sc.bindPreMatrix[id].set(m)



	# build hierarhy
	for j in joints:
		side = j.split("_")[0]
		
		if "foot_toe_outJoint_ry" in j:
			root_j = side+"_foot_toe_skinJoint"
			cmds.parent(j, root_j)
		
		if "foot_psd" in j:
			root_j = side+"_foot_root_skinJoint"
			cmds.parent(j, root_j)
		
		if "knee_psd" in j:
			root_j = side+"_knee_skinJoint"
			cmds.parent(j, root_j)
		
		if "hip_psd" in j:
			root_j = side+"_upleg_twist_0_skinJoint"
			cmds.parent(j, root_j)
		
		if "shoulder_rz" in j:
			root_j = side+"_shoulder_skinJoint"
			cmds.parent(j, root_j)
		
		if "head_psd" in j:
			root_j = "head_skinJoint"
			cmds.parent(j, root_j)
		
		if "neck_psd" in j:
			root_j = "neck_twist_0_jnt_skinJoint"
			cmds.parent(j, root_j)
		
		if "elbow_psd_joint" in j:
			root_j = side+"_elbow_psd_skinJoint"
			cmds.setAttr(root_j+".radius", 1)
			cmds.parent(j, root_j)
		
		if "shoulder_psd" in j:
			root_j = side+"_forearm_twist_0_skinJoint"
			cmds.parent(j, root_j)
					
		if "wrist_psd" in j:
			root_j = side+"_hand_root_skinJoint"
			cmds.parent(j, root_j)
					
		if "ibw" in j:
			if "Finger" in j:
				name = j.split("Finger")[0] + "Finger"
				suff = j.split("Finger")[-1]
				id = suff.split("_")[1]
				root_j = name + "_" + id + "_skinJoint"
				cmds.setAttr(root_j+".radius", 0.5)
				cmds.parent(j, root_j)

	for side in ["l", "r"]:
		for part in ["index", "middle", "ring", "pinky"]:
			cmds.parent(side+"_hand_%s_root_skinJoint" %part, side+"_hand_root_skinJoint")

	for i in range(1,4):
		for side in ["l", "r"]:
			for part in ["index", "middle", "thumb", "ring", "pinky"]:
				if i==1:
					if part == "thumb":
						cmds.parent(side+"_hand_%sFinger_%s_skinJoint" %(part,i), side+"_hand_root_skinJoint")
					else:
						cmds.parent(side+"_hand_%sFinger_%s_skinJoint" %(part,i), side+"_hand_%s_root_skinJoint" %part)
				else:
					cmds.parent(side+"_hand_%sFinger_%s_skinJoint" %(part,i), side+"_hand_%sFinger_%s_skinJoint" %(part,i-1))

	for j in joints:
		if "twist" in j:
			i = int(j.split("twist")[-1].split("_")[1])
			if i > 0:
				cmds.parent(j, j.replace(str(i), str(i-1)))

	for i in range(2,9):
		cmds.parent("spine_%s_skinJoint" %i, "spine_%s_skinJoint" %(i-1))
		
	cmds.parent("spine_1_skinJoint", "spine_root_skinJoint")
	cmds.parent("l_upleg_twist_0_skinJoint", "spine_root_skinJoint")
	cmds.parent("r_upleg_twist_0_skinJoint", "spine_root_skinJoint")
	cmds.parent("spine_end_skinJoint", "spine_8_skinJoint")
	cmds.parent("spine_end_skinJoint1", "l_shoulder_skinJoint", "r_shoulder_skinJoint", "neck_twist_0_jnt_skinJoint", "spine_end_skinJoint")
	cmds.parent("l_forearm_twist_0_skinJoint", "l_shoulder_skinJoint")
	cmds.parent("r_forearm_twist_0_skinJoint", "r_shoulder_skinJoint")
	cmds.parent("l_foot_toe_skinJoint", "l_foot_root_skinJoint")
	cmds.parent("r_foot_toe_skinJoint", "r_foot_root_skinJoint")
	cmds.parent("l_foot_root_skinJoint", "l_leg_twist_4_skinJoint")
	cmds.parent("r_foot_root_skinJoint", "r_leg_twist_4_skinJoint")
	cmds.parent("l_leg_twist_0_skinJoint", "l_knee_skinJoint")
	cmds.parent("r_leg_twist_0_skinJoint", "r_knee_skinJoint")
	cmds.parent("l_knee_skinJoint", "l_upleg_twist_4_skinJoint")
	cmds.parent("r_knee_skinJoint", "r_upleg_twist_4_skinJoint")
	cmds.parent("l_hand_root_skinJoint", "l_arm_twist_4_skinJoint")
	cmds.parent("r_hand_root_skinJoint", "r_arm_twist_4_skinJoint")
	cmds.parent("l_arm_twist_0_skinJoint", "l_elbow_psd_skinJoint")
	cmds.parent("r_arm_twist_0_skinJoint", "r_elbow_psd_skinJoint")
	cmds.parent("l_elbow_psd_skinJoint", "l_forearm_twist_4_skinJoint")
	cmds.parent("r_elbow_psd_skinJoint", "r_forearm_twist_4_skinJoint")
	cmds.parent("head_skinJoint", "neck_twist_4_jnt_skinJoint")

	cmds.setAttr("spine_end_skinJoint1.radius", 0.1)

	cmds.group(empty=1, n="skeleton")
	cmds.parent("spine_root_skinJoint", "skeleton")
	
	if cmds.objExists("main"):
		cmds.parent("skeleton", "main")

def reskin():

	def attr_from_connection (attr, source=False, destination=False, targetName=None):
		if destination:
			if pm.connectionInfo( attr, isSource=True):
				outputs = pm.connectionInfo( attr, destinationFromSource=True)
				if len(outputs) == 0:
					return None
				elif len(outputs) == 1:
					out_attr = pm.PyNode(outputs[0])
					return out_attr
				else:
					pm.warning("Found multiple attributes")
					print (outputs)
					if targetName:
						for out in outputs:
							if targetName in out:
								out_attr = pm.PyNode(out)
								return out_attr
					return None
		elif source:
			pass
		else:
			pm.warning("Set source or destination flag")    
		
	def resetSkin(sc):
		# enter rebind mode
		for j in sc.matrix.inputs():
			scAttr = attr_from_connection(j.worldMatrix[0], destination=True, targetName=sc.name())
			id = scAttr.name().split("[")[-1][:-1]
			j.worldInverseMatrix[0] >> sc.bindPreMatrix[id]

		# exit rebind mode
		for j in sc.matrix.inputs():
			scAttr = attr_from_connection(j.worldMatrix[0], destination=True, targetName=sc.name())
			id = scAttr.name().split("[")[-1][:-1]
			m = j.worldInverseMatrix[0].get()
			pm.disconnectAttr(j.worldInverseMatrix[0], sc.bindPreMatrix[id])
			sc.bindPreMatrix[id].set(m)

	def run():        
		sel = pm.ls(sl=1)        
				
		if not len(sel) :
			cmds.warning("Select geometry or skincluster")
			return
			
		if len(sel) == 1:
			geo = sel[0]
			
			if pm.objectType(geo) == "transform":
				sh = geo.getShape()

				# get skincluster
				sc = sh.inMesh.inputs()[0]
				if pm.objectType(sc) != "skinCluster":
					cmds.warning("Cannot get skincluster, select skincluster in channelbox")
					return
			else:
				cmds.warning("Select geometry with skincluster or skincluster")
				return

		elif len(sel) == 2:
			if pm.objectType(sel[0]) == "skinCluster":
				sc = sel[0]
			else:
				cmds.warning("Cannot get scincluster")
				return
				
		resetSkin(sc)
		
	run()    

def selectSkinJoints():
	pm.mel.eval("""
	global proc string[] selectSkinJoints ( )
	{
	string $list[] = stringArrayCatenate(`ls -sl -geometry`, `ls -sl -et transform`);
	string $objectName = $list[0];

	if (size($list) < 1) error "No selected object.";
	if (size($list) > 1) error "More than one object selected.";

	$list = `ls -sl -type skinCluster`;

	if (size($list) < 1)
	{
		$list = `listHistory -pdo 1 $objectName`;
		$list = `ls -type skinCluster $list`;
	}

	string $skinClusterName = $list[0];

	if (size($list) < 1) error "No skinCluster deformer for selected object.";
	if (size($list) > 1) error "More than one skinCluster deformer for selected object. Select skinCluster node in Channel Box.";
		
	string $history[] = `listHistory $objectName`;
	string $clustersName[] = `ls -type skinCluster $history`;
	string $skinClusterSetName[] = `listConnections -type objectSet $skinClusterName`;
	
	int $flag;
	for ($clusterMember in $clustersName)
		if ($clusterMember == $skinClusterName) $flag++;
	if ($flag == 0) error ("`" + $skinClusterName + "` is not deformer for `" + $objectName + "`.");
	
	$list = `listHistory -levels 1 $skinClusterName`;
	$list = `ls -type transform $list`;
	$list = `stringArrayRemoveDuplicates($list)`;

	string $jointName[] = $list;

	if (size($list) < 1) error "No joint connected with skinCluster.";

	select -r $jointName;

	return $jointName;
	}
	selectSkinJoints;
	""")

def copySkin():
	src, tgt = pm.ls(sl=1)
	pm.select(src)
	selectSkinJoints()
	pm.select(tgt, add=1)
	pm.skinCluster(toSelectedBones=1, maximumInfluences=5)
	pm.select(src, tgt)
	pm.copySkinWeights(noMirror=1, surfaceAssociation='closestPoint', influenceAssociation='closestJoint')

def selectAllJoints():
	root = cmds.listRelatives("rig", p=1)[0]
	singleHierarhy = cmds.getAttr(root+".singleHierarhy")

	if singleHierarhy:
		cmds.select(cmds.listRelatives("skeleton", allDescendents=1))
	else:
		joints = []
		for mod in cmds.listRelatives("modules"):
			joints += cmds.listRelatives(mod.replace("mod", "outJoints"), allDescendents=1, type="joint")

		for tw_name in cmds.listRelatives("twists"):
			joints += cmds.listRelatives(tw_name.replace("mod", "joints"), allDescendents=1, type="joint")

		cmds.select(joints)

def displayAffected():
	is_affected_displayed = cmds.displayPref(query=True, displayAffected=True)
	cmds.displayPref(displayAffected = not is_affected_displayed)

	if not is_affected_displayed:
		print("displayAffected is enable" )
	else:
		print("displayAffected is disable" )

def locsToCurve():
	locs = pm.selected()
	pos=[]
	for l in locs:
		pos.append(l.worldPosition[0].get())
	c = pm.curve(d=1, p=pos)
	for i,l in enumerate(locs):
		l.worldPosition[0] >> c.controlPoints[i]

def skinSave():

	def strip_namespace(name):
		"""Убирает неймспейс из имени ноды."""
		return name.split(":")[-1]


	def get_skin_cluster(mesh):
		"""Находит skinCluster на меше."""
		history = cmds.listHistory(mesh, pruneDagObjects=True)
		if not history:
			return None
		skin_clusters = cmds.ls(history, type="skinCluster")
		return skin_clusters[0] if skin_clusters else None


	def export_skin_weights():
		selection = cmds.ls(selection=True, long=True)
		if not selection:
			cmds.warning("Ничего не выделено. Выделите меш с скином.")
			return

		mesh = selection[0]

		# Получаем шейп если выделена трансформ-нода
		shapes = cmds.listRelatives(mesh, shapes=True, fullPath=True)
		mesh_shape = shapes[0] if shapes else mesh

		skin_cluster = get_skin_cluster(mesh_shape)
		if not skin_cluster:
			cmds.warning("На выделенном меше не найден skinCluster.")
			return

		# Список костей скина
		influences = cmds.skinCluster(skin_cluster, query=True, influence=True)
		if not influences:
			cmds.warning("skinCluster не содержит костей.")
			return

		# Параметры skinCluster
		max_influences = cmds.skinCluster(skin_cluster, query=True, maximumInfluences=True)
		vertex_count = cmds.polyEvaluate(mesh_shape, vertex=True)

		print("Экспорт скина: {} вертексов, {} костей...".format(vertex_count, len(influences)))

		# Получаем MObject skinCluster
		sel = om.MSelectionList()
		sel.add(skin_cluster)
		skin_obj = om.MObject()
		sel.getDependNode(0, skin_obj)
		skin_fn = oma.MFnSkinCluster(skin_obj)

		# Получаем MDagPath меша
		sel2 = om.MSelectionList()
		sel2.add(mesh_shape)
		mesh_dag = om.MDagPath()
		sel2.getDagPath(0, mesh_dag)

		# Создаём компонент со всеми вертексами
		comp_fn = om.MFnSingleIndexedComponent()
		vtx_component = comp_fn.create(om.MFn.kMeshVertComponent)
		comp_fn.setCompleteData(vertex_count)

		# Читаем все веса одним вызовом — точно и быстро
		weights = om.MDoubleArray()
		inf_count_util = om.MScriptUtil()
		inf_count_ptr = inf_count_util.asUintPtr()
		skin_fn.getWeights(mesh_dag, vtx_component, weights, inf_count_ptr)
		inf_count = om.MScriptUtil.getUint(inf_count_ptr)

		# Упаковываем: weights[vtx_id * inf_count + inf_idx]
		# Заодно собираем множество костей у которых есть хоть один ненулевой вес
		weights_data = {}
		active_bones = set()
		for vtx_id in range(vertex_count):
			vtx_weights = {}
			for inf_idx, inf in enumerate(influences):
				w = weights[vtx_id * inf_count + inf_idx]
				if w > 0.0:
					bone_name = strip_namespace(inf)
					vtx_weights[bone_name] = w
					active_bones.add(bone_name)
			weights_data[vtx_id] = vtx_weights

		# Только кости с реальными весами, порядок как в оригинале
		active_influences = [strip_namespace(inf) for inf in influences
							if strip_namespace(inf) in active_bones]

		skipped = len(influences) - len(active_influences)
		if skipped:
			print("Пропущено костей с нулевыми весами: {}".format(skipped))

		# Имя меша без неймспейса
		mesh_short = strip_namespace(cmds.ls(mesh, shortNames=True)[0])

		export_data = {
			"mesh_name": mesh_short,
			"vertex_count": vertex_count,
			"max_influences": max_influences,
			"influences": active_influences,
			"weights": weights_data
		}

		# Сохраняем в temp-папку Windows
		temp_dir = tempfile.gettempdir()
		file_path = os.path.join(temp_dir, "skin_weights_export.json")

		with open(file_path, "w") as f:
			json.dump(export_data, f, indent=2)

		print("=" * 50)
		print("Скин успешно экспортирован!")
		print("Файл: {}".format(file_path))
		print("Костей: {}".format(len(export_data["influences"])))
		print("Max Influences: {}".format(max_influences))
		print("Вертексов: {}".format(vertex_count))
		print("=" * 50)

		return file_path


	# Запуск
	export_skin_weights()

def skinLoad()	:
	"""
	IMPORT SKIN WEIGHTS
	Загружает данные скина из temp-файла и создаёт skinCluster на выделенной геометрии.
	Кости ищутся в сцене без учёта неймспейса.
	Веса записываются напрямую через MFnSkinCluster API.

	Использование: выделить чистый меш, запустить скрипт.
	"""

	def strip_namespace(name):
		"""Убирает неймспейс из имени ноды."""
		return name.split(":")[-1]


	def build_bone_map():
		"""
		Строит словарь {имя_без_неймспейса: полное_имя} для всех костей в сцене.
		Если несколько костей имеют одинаковое базовое имя — берётся первая.
		"""
		all_joints = cmds.ls(type="joint", long=False) or []
		bone_map = {}
		for joint in all_joints:
			base_name = strip_namespace(joint)
			if base_name not in bone_map:
				bone_map[base_name] = joint
		return bone_map


	def import_skin_weights():
		selection = cmds.ls(selection=True, long=True)
		if not selection:
			cmds.warning("Ничего не выделено. Выделите чистый меш.")
			return

		mesh = selection[0]

		# Получаем шейп
		shapes = cmds.listRelatives(mesh, shapes=True, fullPath=True) or []
		mesh_shape = mesh
		print(111, mesh, shapes)
		for s in shapes:
			if not cmds.getAttr("{}.intermediateObject".format(s)):
				mesh_shape = s
				break

		# Путь к файлу
		temp_dir = tempfile.gettempdir()
		file_path = os.path.join(temp_dir, "skin_weights_export.json")

		if not os.path.exists(file_path):
			cmds.warning("Файл не найден: {}".format(file_path))
			return

		with open(file_path, "r") as f:
			data = json.load(f)

		influences_needed = data["influences"]      # Имена без неймспейсов
		weights_data      = data["weights"]
		vertex_count_file = data["vertex_count"]
		max_influences    = data.get("max_influences", 8)

		# Проверяем количество вертексов
		skip_weights = False
		vertex_count_mesh = cmds.polyEvaluate(mesh_shape, vertex=True)
		if vertex_count_mesh != vertex_count_file:
			cmds.warning(
				"Количество вертексов не совпадает! "
				"В файле: {}, на меше: {}.".format(vertex_count_file, vertex_count_mesh)
			)
			skip_weights = True

		# Строим карту костей сцены (без неймспейса -> полное имя)
		bone_map = build_bone_map()

		# Разбиваем на найденные / не найденные
		resolved_influences = []
		missing_bones       = []
		for bone_name in influences_needed:
			if bone_name in bone_map:
				resolved_influences.append(bone_map[bone_name])
			else:
				missing_bones.append(bone_name)

		if missing_bones:
			print("ВНИМАНИЕ — не найдены кости в сцене ({} шт.):".format(len(missing_bones)))
			for b in missing_bones:
				print("  - {}".format(b))

		if not resolved_influences:
			cmds.warning("Не удалось найти ни одной кости. Скин не создан.")
			return

		print("Найдено костей: {} из {}".format(len(resolved_influences), len(influences_needed)))

		# Создаём skinCluster с отключённой нормализацией на время записи весов
		skin_cluster_name = cmds.skinCluster(
			resolved_influences + [mesh],
			toSelectedBones=True,
			bindMethod=0,           # Closest distance
			skinMethod=0,           # Classic linear
			normalizeWeights=0,     # Отключаем — запишем веса вручную
			maximumInfluences=max_influences,
			name="imported_skinCluster"
		)[0]

		print("Создан skinCluster: {} (Max Influences: {})".format(skin_cluster_name, max_influences))

		# --- Пишем веса через MFnSkinCluster API ---

		# MObject skinCluster
		sel = om.MSelectionList()
		sel.add(skin_cluster_name)
		skin_obj = om.MObject()
		sel.getDependNode(0, skin_obj)
		skin_fn = oma.MFnSkinCluster(skin_obj)

		# MDagPath меша
		sel2 = om.MSelectionList()
		sel2.add(mesh_shape)
		mesh_dag = om.MDagPath()
		sel2.getDagPath(0, mesh_dag)

		# Индексы influence внутри skinCluster (порядок может отличаться от resolved_influences)
		inf_dags = om.MDagPathArray()
		skin_fn.influenceObjects(inf_dags)
		inf_count = inf_dags.length()

		# Строим карту: базовое_имя -> индекс внутри skinCluster
		sc_inf_index = {}
		for i in range(inf_count):
			base = strip_namespace(inf_dags[i].partialPathName())
			sc_inf_index[base] = i

		# Пропускаем копирование весов если топология не совпадает
		if skip_weights:
			cmds.warning("Скин создан, но веса не скопированы — количество вертексов не совпадает.")
			return

		# Сбрасываем все начальные веса которые Maya назначила при bind-е
		# Создаём компонент со всеми вертексами
		all_comp_fn = om.MFnSingleIndexedComponent()
		all_vtx_comp = all_comp_fn.create(om.MFn.kMeshVertComponent)
		all_comp_fn.setCompleteData(vertex_count_file)

		# Все индексы инфлаенсов
		all_inf_indices = om.MIntArray()
		for i in range(inf_count):
			all_inf_indices.append(i)

		# Нулевые веса для всех
		zero_weights = om.MDoubleArray(vertex_count_file * inf_count, 0.0)
		skin_fn.setWeights(mesh_dag, all_vtx_comp, all_inf_indices, zero_weights, False)

		print("Применение весов...")

		for vtx_id in range(vertex_count_file):
			vtx_weights_raw = weights_data.get(str(vtx_id), {})

			if not vtx_weights_raw:
				continue

			# Компонент одного вертекса
			comp_fn = om.MFnSingleIndexedComponent()
			vtx_comp = comp_fn.create(om.MFn.kMeshVertComponent)
			comp_fn.addElement(vtx_id)

			# Собираем индексы и веса только найденных костей
			inf_indices = om.MIntArray()
			inf_weights = om.MDoubleArray()

			for bone_name, w in vtx_weights_raw.items():
				if bone_name in sc_inf_index:
					inf_indices.append(sc_inf_index[bone_name])
					inf_weights.append(w)

			if inf_indices.length() == 0:
				continue

			skin_fn.setWeights(mesh_dag, vtx_comp, inf_indices, inf_weights, False)

		# Включаем нормализацию обратно
		# Нормализация остаётся выключенной — не трогаем веса после записи

		print("=" * 50)
		print("Скин успешно применён!")
		print("Меш: {}".format(cmds.ls(mesh, shortNames=True)[0]))
		print("skinCluster: {}".format(skin_cluster_name))
		print("Костей применено: {}".format(len(resolved_influences)))
		if missing_bones:
			print("Не найдено костей: {}".format(len(missing_bones)))
		print("=" * 50)


	# Запуск
	import_skin_weights()

def fixControlInternalName():
	#ctrls = getSetObjects('moduleControlSet')
	sel = cmds.ls(sl=1)

	if len(sel) == 0:
		cmds.warning("Select controls")
	#print sel, c in sel

	m_name = utils.getModuleName(sel[0])

	for c in sel:
		if c.split("_")[0] == m_name:
			utils.setUserAttr(c, "internalName", c[len(m_name)+1:])
		else:
			utils.setUserAttr(c, "internalName", c)
		print ("Set internal name -", c)