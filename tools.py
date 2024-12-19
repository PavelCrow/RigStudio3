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