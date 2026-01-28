import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import logging, traceback, os, imp, sys
from functools import partial

from ... import utils, module

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui
    from shiboken6 import wrapInstance
	
logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
# logger.setLevel(logging.DEBUG)

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])#.split(fileName)[0]

mel_scripts_path = rootPath + '/rigTools'

class Eyelids2(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()
		logger.debug(traceback.extract_stack()[-1][2])

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.topEdges = ''
		self.bottomEdges = ''		

	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.setTopEdges_btn.clicked.connect(partial(self.setEdges, w, "top"))
		w.setBottomEdges_btn.clicked.connect(partial(self.setEdges, w, "bottom"))
		w.conect_btn.clicked.connect(self.connectRig)
		
	def setEdges(self, widget, side):
		edges = cmds.ls(sl=1)

		edges_string = ""
		for e in edges:
			edges_string += e
			edges_string += " "
	
		options = self.getOptions()
		options[side+'Edges'] = edges_string
		self.setOptions(options)	

		w_lineEdit = eval("widget.%sEdges_lineEdit" %side)
		w_lineEdit.setText(edges_string)
	
	def connectRig(self):
		self.updateCurves()
		self.generateJoints()
		
		self.addSkinJoints()
		
	def create(self, options={}):
		super(self.__class__, self).create(options)
		
		if options != {}:
			self.setOptions(options)
			self.connectRig()
		
		
	def connect(self, target):
		targetModuleName = utils.getModuleNameFromAttr(target)
		if targetModuleName in ['eyes']:
			target = targetModuleName+"_root_joint"

		super(self.__class__, self).connect(target)

		if targetModuleName in ['eyes']:
			cmds.setAttr(self.name+'_mainPoser.t', 0,0,0)
			cmds.setAttr(self.name+'_mainPoser.size', 0)
			cmds.setAttr(self.name+'_root_poser.size', 0)

			utils.connectByMatrix(self.name+'_l_eye_connector', [targetModuleName+'_l_base_joint', self.name+'_l_eye_connector'], 
							['worldMatrix[0]', 'parentInverseMatrix[0]'], self.name, attrs=['t', 'r'] )
			utils.connectByMatrix(self.name+'_r_eye_connector', [targetModuleName+'_r_base_joint', self.name+'_r_eye_connector'], 
							['worldMatrix[0]', 'parentInverseMatrix[0]'], self.name, attrs=['t', 'r']  )
			
			cmds.setAttr(self.name+'_mainPoser.t', 0,0,0)
			cmds.setAttr(self.name+'_mainPoser.sx', 1)
			cmds.setAttr(self.name+'_l_eye_poser.tx', cmds.getAttr(targetModuleName+'_end_poser.tx'))
			return
			eye_ctrl = utils.getControlNameFromInternal(targetModuleName, 'control')
			
			utils.setUserAttr(eye_ctrl, 'autoLids', 0.5, type="float")
			cmds.addAttr(eye_ctrl+'.autoLids', e=1, min=0, max=1)
			cmds.setAttr(eye_ctrl+".autoLids", e=1, l=0, k=1)
			
			#cmds.connectAttr(eye_ctrl+".autoLids", self.root+'.autoLids')
			cmds.connectAttr(targetModuleName+"_l_eye_joint.rx", self.name+'_l_eye_rotate_connector.rx')
			cmds.connectAttr(targetModuleName+"_l_eye_joint.ry", self.name+'_l_eye_rotate_connector.ry')
			cmds.connectAttr(targetModuleName+"_l_eye_joint.rz", self.name+'_l_eye_rotate_connector.rz')

			cmds.connectAttr(targetModuleName+"_r_eye_joint.rx", self.name+'_r_eye_rotate_connector.rx')		
			cmds.connectAttr(targetModuleName+"_r_eye_joint.ry", self.name+'_r_eye_rotate_connector.ry')		
			cmds.connectAttr(targetModuleName+"_r_eye_joint.rz", self.name+'_r_eye_rotate_connector.rz')

	def disconnect(self):
		inputNode = cmds.connectionInfo(self.name+'_root_connector_multMat.matrixIn[1]', sourceFromDestination=1).split('.')[0]
		inputModuleName = utils.getModuleNameFromAttr(inputNode)		

		super(self.__class__, self).disconnect()		
		return
		eye_ctrl = utils.getControlNameFromInternal(inputModuleName, 'control')
		cmds.setAttr(eye_ctrl+".autoLids", e=1, l=0)
		cmds.deleteAttr(eye_ctrl+'.autoLids')

		#cmds.disconnectAttr(inputModuleName+"_l_eye_joint.rx", self.name+'_l_eye_rotate_connector.rx')
		#cmds.disconnectAttr(inputModuleName+"_l_eye_joint.ry", self.name+'_l_eye_rotate_connector.ry')
		#cmds.disconnectAttr(inputModuleName+"_l_eye_joint.rz", self.name+'_l_eye_rotate_connector.rz')

		#try:
			#cmds.delete(self.name+'_reverseRotatorY')
			#cmds.disconnectAttr(inputModuleName+"_r_eye_joint.rx", self.name+'_r_eye_rotate_connector.rx')		
			#cmds.disconnectAttr(inputModuleName+"_r_eye_joint.ry", self.name+'_r_eye_rotate_connector.ry')		
			#cmds.disconnectAttr(inputModuleName+"_r_eye_joint.rz", self.name+'_r_eye_rotate_connector.rz')	
		#except : pass

		#cmds.setAttr(self.name+'_l_eye_rotate_connector.r', 0,0,0)

		cmds.delete(self.name+'_l_eye_connector_decMat')
		cmds.delete(self.name+'_r_eye_connector_decMat')

		cmds.setAttr(self.name+'_mainPoser.size', 1)
		cmds.setAttr(self.name+'_root_poser.size', 1)		

	def updateOptionsPage(self, widget):

		pixmap = QtGui.QPixmap(rootPath+'/modules/eyelids2/helpImage.png')
		widget.image_label.setPixmap(pixmap)
	
		data = self.getOptions()

		widget.topEdges_lineEdit.setText(self.topEdges)
		widget.bottomEdges_lineEdit.setText(self.bottomEdges)

	def getOptions(self):

		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
		else:
			optionsData = {}

		if optionsData == {}:
			optionsData['topEdges'] = ''
			optionsData['bottomEdges'] = ''

		else:
			self.topEdges = optionsData['topEdges']
			self.bottomEdges = optionsData['bottomEdges']		
		
		return optionsData		

	def setOptions(self, optionsData):
		
		if 'topEdges' in optionsData:
			self.topEdges = optionsData['topEdges']
		else:
			self.topEdges = ""
			
		if 'bottomEdges' in optionsData:
			self.bottomEdges = optionsData['bottomEdges']
		else:
			self.bottomEdges = ""

		utils.pyToAttr(self.root+'.options', optionsData)
		
		

	def updateCurves(self):
		#dynamic variables
		t_lidEdge = self.topEdges
		b_lidEdge = self.bottomEdges
		
		#createCurve
		for dir in ['t', 'b']:
			edges = eval(dir+'_lidEdge')
			mel.eval('select %s' %edges)
			crv_name = 'l_%s_lid_init_curve_new' %dir
			init_crv = pm.polyToCurve(degree=1,ch=0,n=crv_name)[0]
			points = pm.ls(init_crv+'.cv[:]',fl=1)
			if pm.xform(points[-1],q=1,t=1,ws=1)[0]<pm.xform(points[0],q=1,t=1,ws=1)[0]:
				pm.reverseCurve(init_crv,ch=0)
			pm.parent(init_crv, self.name+'_mainPoser')
			pm.connectAttr(init_crv+"Shape.worldSpace", self.name+'_l_%s_lid_init_curveShape.create' %dir)

			pm.connectAttr(self.name+"_l_%s_lid_low_first_curveShape.worldSpace" %dir, self.name+'_l_%s_lid_low_sec_curveBaseWireShape.create' %dir)
			cmds.refresh()
			pm.disconnectAttr(self.name+"_l_%s_lid_low_first_curveShape.worldSpace" %dir, self.name+'_l_%s_lid_low_sec_curveBaseWireShape.create' %dir)
			cmds.refresh()
			cmds.delete(crv_name)		
			
			for side in ['l', 'r']:
				name = self.name+"_%s_%s_lid" %(side, dir)
				cmds.delete(name+"_wire")
				cmds.wire(name+"_high_curve", w=name+"_low_sec_curve", dds=(0,50), n=name+"_wire")

	def generateJoints(self):

		# delete old system
		for dir in["t", "b"]:
			for side in["l", "r"]:
				pm.delete(pm.listRelatives(self.name+'_%s_%s_lids_joints_outGroup' %(side,dir)))
				pm.delete(pm.listRelatives(self.name+'_%s_aimLocs_group' %side))
				pm.delete(pm.listRelatives(self.name+'_%s_targetLocs_group' %side))
				
		pm.delete(self.name+'_root_skinJoint')
				
		# create set
		if not cmds.objExists(self.name+'_skinJointsSet'):
			cmds.select(clear=1)
			cmds.sets(n=self.name+'_skinJointsSet')
			cmds.sets(self.name+'_skinJointsSet', e=1, forceElement=self.name+'_sets' )	
			
		# generate joints
		for dir in["t", "b"]:
			for side in["l", "r"]:
				crvS = pm.PyNode(self.name+"_%s_%s_lid_init_curveShape" %(side,dir))
				crvFinalS = pm.PyNode(self.name+"_%s_%s_lid_high_curveShape" %(side,dir))
				points = cmds.ls(crvS+'.cv[:]',fl=1)
				
				for i, p in enumerate(points):
					i,p
					# create init locs
					aim_l = pm.spaceLocator(n=self.name+"_%s_%s_lip_aimLoc_%s" %(side,dir,i))
					l = pm.spaceLocator(n=self.name+"_%s_%s_lip_targetLoc_%s" %(side,dir,i))
					pm.parent(aim_l, self.name+'_%s_aimLocs_group' %side)
					aim_l.t.set(0,0,0)
					pm.hide(aim_l, l)
		
					pos = cmds.xform(p,q=1,t=1,ws=1)
					pm.parent(l, self.name+'_%s_targetLocs_group' %side)
		
					con = pm.aimConstraint(l, aim_l, mo=0, aimVector=(0,0,1))
		
					# connect init locs
					pointCurve = pm.createNode('pointOnCurveInfo',n=self.name+'_%s_%s_lid_init_%s_pointOnCurveInfo' %(side,dir,i))
					cmds.setAttr(pointCurve+'.parameter',i)
					pm.connectAttr(crvS+'.worldSpace',pointCurve+'.inputCurve')
					pointCurve.position >> l.t
		
					# create joints and group
					root_j = pm.joint(n=self.name+'_%s_%s_lid_%s_outRootJoint' %(side,dir,i))
					root_j.drawStyle.set(2)
					j = pm.joint(n=self.name+'_%s_%s_lid_%s_outJoint' %(side,dir,i))
					cmds.sets(j.name(), e=1, forceElement=self.name+'_skinJointsSet')
					utils.addModuleNameAttr(j, self.name)
					utils.addModuleNameAttr(root_j, self.name)

					gr = pm.group(root_j, n=self.name+'_%s_%s_lid_%s_joint_outGroup' %(side,dir,i))
					pm.parent(gr, self.name+'_%s_%s_lids_joints_outGroup' %(side,dir))
					gr.t.set(0,0,0)
					aim_l.r >> gr.r
					utils.addModuleNameAttr(gr, self.name)
		
					# connect joint group and target joint
					#comp = pm.createNode('composeMatrix', n='%s_%s_lid_%s_composeMatrix' %(side,dir,i))
					#crvS.controlPoints[i] >> comp.inputTranslate
					mult = pm.createNode('multMatrix', n=self.name+'_%s_%s_lid_%s_multMatrix' %(side,dir,i))
					#comp.outputMatrix >> mult.matrixIn[0]
					l.worldMatrix[0] >> mult.matrixIn[0]
					aim_l.worldInverseMatrix[0] >> mult.matrixIn[1]
					dec = pm.createNode('decomposeMatrix', n=self.name+'_%s_%s_lid_%s_decomposeMatrix' %(side,dir,i))
					mult.matrixSum >> dec.inputMatrix
					dec.outputTranslate >> j.translate
		
					# connect rotate joint
					pCrv = pm.createNode('pointOnCurveInfo',n=self.name+'_%s_%s_lid_%s_rotate_pointOnCurveInfo' %(side,dir,i))
					pCrv.parameter.set(i)
					crvFinalS.worldSpace >> pCrv.inputCurve
					plus = pm.createNode('plusMinusAverage',n=self.name+'_%s_%s_lid_%s_plusMinusAverage' %(side,dir,i))
					plus.operation.set(2)
					pCrv.position >> plus.input3D[0]
					l.worldPosition >> plus.input3D[1]
					mult = pm.createNode('multiplyDivide',n=self.name+'_%s_%s_lid_%s_rotate_multiplyDivide' %(side,dir,i))
					plus.output3D >> mult.input1
					pm.connectAttr(self.name+'_mainPoser.scaleRotate', mult.input2X)
					pm.connectAttr(self.name+'_mainPoser.scaleRotate', mult.input2Y)
					mult2 = pm.createNode('multDoubleLinear',n=self.name+'_%s_%s_lid_%s_rotate_multDoubleLinear' %(side,dir,i))
					mult.outputX >> root_j.ry
					mult.outputY >> mult2.input1
					mult2.input2.set(-1)
					mult2.output >> root_j.rx
