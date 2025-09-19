import maya.cmds as cmds
import logging, traceback, sys
from functools import partial
import pymel.core as pm

from ... import utils, module

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
#logger.setLevel(logging.DEBUG)

class LimbCurved(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()
		logger.debug(traceback.extract_stack()[-1][2])

		self.name = name 
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.widget = None

	def connect(self, target, opposite=False):
		super(self.__class__, self).connect(target, opposite)
		return
		ext = target.split("_")[-1]
		outJoint = target[:-len(ext)] + "outJoint"		
		#cmds.connectAttr( outJoint+'.worldMatrix', self.name+"_ikHandle1.dWorldUpMatrix", f=1)
		par = cmds.group(n=self.name+'_startEulerGroup', empty=1)
		utils.addModuleNameAttr(par, self.name)
		cmds.parent(par, self.name+'_root_outJoint')
		utils.resetAttrs(par)
		cmds.parent(par, outJoint)
		cmds.parent(self.name+"_startEulerLoc", par)
		con = cmds.pointConstraint(self.name+"_startEulerLoc", self.name+"_root_joint", mo=0)
		cmds.delete(con)

	def disconnect(self):
		super(self.__class__, self).disconnect()
		#cmds.connectAttr( self.name+'_a_finalJoint.matrix', self.name+"_ikHandle1.dWorldUpMatrix", f=1)
		try:
			
			cmds.parent(self.name+"_startEulerLoc", self.name+"_a_finalJoint")
			utils.resetAttrs(self.name+"_startEulerLoc")
			cmds.delete(self.name+'_startEulerGroup')
		except:
			pass

	def delete(self):
		cmds.delete(self.name+'_rootEnd_vectorNormalized')
		cmds.delete(self.name+'_cosAngle_bewtweenVectors')
		cmds.delete(self.name+'_middleOut_vectorNormalized')

		super(self.__class__, self).delete()
			
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		opp_module = mainInstance.rig.getMirroredModule(module)
		w.swapEndOrient_btn.clicked.connect(partial(self.swapEndPose, mainInstance, opp_module))
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions,w, opp_module))
		w.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)
		w.startOffset_spinBox.valueChanged.connect(self.startOffset)
		w.endOffset_spinBox.valueChanged.connect(self.endOffset)

	def updateOptionsPage(self, w):
		optionsData = self.getOptions()
		w.aimDistance_spinBox.setValue(optionsData['aimDistance'])
		#w.startOffset_spinBox.setValue(optionsData['startOffsetX'])
		#w.endOffset_spinBox.setValue(optionsData['endOffsetX'])
		w.startJointsCount_spinBox.setValue(optionsData['upperJointsCount'])
		w.endJointsCount_spinBox.setValue(optionsData['lowerJointsCount'])
		self.widget = w
		
	def setMirrored(self):
		# fix joint positions (Update)
		oppModuleName = utils.getOppositeObject(self.name)
		cmds.setAttr(oppModuleName+'_ik_hand.tx', 0)
		super(self.__class__, self).setMirrored()

	def swapEndPose(self, mainInstance, opp_module):
		logger.debug(traceback.extract_stack()[-1][2])
		
		l_fk_ctrl = utils.getControlNameFromInternal(self.name, 'fk_end')
		l_ik_ctrl = utils.getControlNameFromInternal(self.name, 'ik_end')
		l_ik_loc = self.name + "_end_pose_loc"
		if opp_module:
			r_fk_ctrl = utils.getControlNameFromInternal(opp_module.name, 'fk_end')
			r_ik_ctrl = utils.getControlNameFromInternal(opp_module.name, 'ik_end')			
			r_ik_loc = utils.getOppositeObject(l_ik_loc)

		childs = mainInstance.rig.getModuleChildren(self.name)
		if len(childs) == 0:
			cmds.warning("Selected module have not child module")
			return
		
		child_name = childs[0]
		child_poser = child_name + '_root_poser'
		
		rot_local = cmds.xform(l_ik_ctrl, q=1, ro=1)
		
		if -0.01 < rot_local[0] < 0.01 and -0.01 < rot_local[1] < 0.01 and -0.01 < rot_local[2] < 0.01:
			r = cmds.xform(child_poser, q=1, ro=1, ws=1)
			cmds.xform(child_poser, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(l_ik_ctrl, ro=r, ws=1)
			cmds.xform(l_fk_ctrl, ro=r, ws=1)
			cmds.xform(l_ik_ctrl, ro=r, ws=1)
			
			
			if opp_module:
				cmds.setAttr(r_fk_ctrl+'.rx', r[0])
				cmds.setAttr(r_fk_ctrl+'.ry', r[1])
				cmds.setAttr(r_fk_ctrl+'.rz', r[2])
				cmds.setAttr(r_ik_ctrl+'.rx', r[0])
				cmds.setAttr(r_ik_ctrl+'.ry', -r[1])
				cmds.setAttr(r_ik_ctrl+'.rz', -r[2])
		else:
			r = cmds.xform(l_ik_ctrl, q=1, ro=1, ws=1)
			cmds.xform(l_ik_ctrl, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(l_fk_ctrl, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(l_ik_ctrl, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(child_poser, ro=r, ws=1)

			if opp_module:
				cmds.setAttr(r_fk_ctrl+'.rx', 0)
				cmds.setAttr(r_fk_ctrl+'.ry', 0)
				cmds.setAttr(r_fk_ctrl+'.rz', 0)
				cmds.setAttr(r_ik_ctrl+'.rx', 0)
				cmds.setAttr(r_ik_ctrl+'.ry', 0)
				cmds.setAttr(r_ik_ctrl+'.rz', 0)

	def addMiddleTwistOffsetControl(self):

		if self.name.split("_")[0] == 'r':
			return
		
		opp_name = utils.getOppositeObject(self.name)
		
		tw_joints = []
		for o in cmds.listRelatives('twists') or []:
			tw_joints.append(o.split("_mod")[0])
		
		if self.name+"_root" in tw_joints and self.name+"_middle" in tw_joints:
			c = self.name+"_middleOffset"
			c_ins = utils.getControlInstance(c)

			if cmds.listRelatives(self.name+"_root_end_connectorLoc", p=1)[0] != c:
				cmds.parent(self.name+"_root_end_connectorLoc", c)
				if self.symmetrical:
					cmds.parent(opp_name+"_root_end_connectorLoc", utils.getOppositeObject(c))
			
			if cmds.listRelatives(self.name+"_middle_root_connectorLoc", p=1)[0] != c:
				cmds.parent(self.name+"_middle_root_connectorLoc", c)
				if self.symmetrical:
					cmds.parent(opp_name+"_middle_root_connectorLoc", utils.getOppositeObject(c))
		
		# connect volume joints		
		if cmds.objExists(self.name+'_root_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_root_twist_0_joint', allDescendents=1) + [self.name+'_root_twist_0_joint']
			for j in tw_js:
				cmds.connectAttr(self.name+'_root_volume_outJoint.s', j+'.s', f=1)
		if cmds.objExists(self.name+'_middle_twist_0_joint'):
			tw_js = cmds.listRelatives(self.name+'_middle_twist_0_joint', allDescendents=1) + [self.name+'_middle_twist_0_joint']
			for j in tw_js:
				cmds.connectAttr(self.name+'_middle_volume_outJoint.s', j+'.s', f=1)
				
		j_root = utils.getOppositeObject(self.name+'_root_twist_0_joint')
		if cmds.objExists(j_root):
			tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
			for j in tw_js:
				cmds.connectAttr(utils.getOppositeObject(self.name+'_root_volume_outJoint.s'), j+'.s', f=1)
		j_root = utils.getOppositeObject(self.name+'_middle_twist_0_joint')		
		if cmds.objExists(j_root):
			tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
			for j in tw_js:
				cmds.connectAttr(utils.getOppositeObject(self.name+'_middle_volume_outJoint.s'), j+'.s', f=1)

	def update_aim_distance(self, v=None):
		def setValue(v):
			cmds.setAttr(self.name+"_mod.aim_offset", v)
			if self.symmetrical:
				opp_mod = utils.getOpposite(self.name+"_mod")
				cmds.setAttr(opp_mod+".aim_offset", v)

		if v:
			setValue(v)
		else:
			try: # fix error "C++ object already deleted"
				if not self.widget:
					return
				if not v:
					v = self.widget.aimDistance_spinBox.value()
					setValue(v)
			except:
				pass


	def bake(self):
		super(self.__class__, self).bake(addObjects=[self.name+"_ik_connector"])
		
	def childConnect(self, child_name=None):
		return
		if not child_name:
			sel = cmds.ls(sl=1)
			if len(sel) != 1:
				cmds.warning("Select one cild joint")
				return
			child_name = utils.getModuleNameFromAttr(sel[0])
			
		l = "%s__%s__endEulerLoc" %(self.name, child_name)

		if cmds.listRelatives(child_name+'_root_joint', p=1)[0] == self.name+'_middle_outJoint':
			cmds.connectAttr(child_name+'_root_joint.matrix', l+"_decMat.inputMatrix")

		cmds.setAttr(self.name+"_ikHandle2.dWorldUpVectorEndY", -1)
		
	def startOffset(self):
		if not self.widget:
			return
		cmds.setAttr(self.name+"_startEulerLoc_aimConstraint.offsetX", self.widget.startOffset_spinBox.value())
		
	def endOffset(self):
		if not self.widget:
			return
		cmds.setAttr(self.name+"_endEulerLoc.rx", self.widget.endOffset_spinBox.value())

	
	def getOptions(self):
		optionsData = {}
		optionsData['aimDistance'] = cmds.getAttr(self.name+'_mod.aim_offset')
		optionsData['upperJointsCount'] = 0
		optionsData['lowerJointsCount'] = 0
		
		return optionsData				

	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	
	
	def setOptions(self, optionsData):
		self.update_aim_distance(optionsData['aimDistance'])

		
	def connectOpposite(self):
		return
		side = utils.getObjectSide(self.name)
		
		if side == 'r':# or not cmds.objExists(opp_name+'_mod'):
			mirror_moduleName = utils.getOppositeObject(self.name)
			if cmds.objExists(mirror_moduleName+'_mod'):

				#cmds.connectAttr(mirror_moduleName+'_mod.aim_offset', self.name+'_mod.aim_offset')
				#m = cmds.createNode("multDoubleLinear")
				#cmds.connectAttr(mirror_moduleName+'_startEulerLoc_aimConstraint.offsetX', m+'.input1')
				#cmds.setAttr(m+'.input2', -1)
				#cmds.connectAttr(m+'.output', self.name+'_startEulerLoc_aimConstraint.offsetX')
				#cmds.connectAttr(mirror_moduleName+'_endEulerLoc.r', self.name+'_endEulerLoc.r')
				
				# connect joints
				for i in range(5):
					cmds.connectAttr(mirror_moduleName+"_twistUp_%s_skinJoint.curvePosition" %i, self.name+"_twistUp_%s_skinJoint.curvePosition" %i)
					cmds.connectAttr(mirror_moduleName+"_twistDown_%s_skinJoint.curvePosition" %i, self.name+"_twistDown_%s_skinJoint.curvePosition" %i)
					
				cmds.connectAttr(mirror_moduleName+"_twistKnee_skinJoint.radiusWeight", self.name+"_twistKnee_skinJoint.radiusWeight")
				
				for ibtw in ["Knee"]:
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.angleMin" %ibtw, self.name+"_twist%s_y_1_skinJoint.angleMin" %ibtw)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.angleMax" %ibtw, self.name+"_twist%s_y_1_skinJoint.angleMax" %ibtw)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.slideMin" %ibtw, self.name+"_twist%s_y_1_skinJoint.slideMin" %ibtw)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.slideMax" %ibtw, self.name+"_twist%s_y_1_skinJoint.slideMax" %ibtw)
					m1 = cmds.createNode("multiplyDivide", n=self.name+"_slideMirror_%s_1_multiplyDivide" %ibtw)
					cmds.setAttr(m1+".input2X", -1)
					cmds.setAttr(m1+".input2Y", -1)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.posMin" %ibtw, m1+".input1X")
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.posMax" %ibtw, m1+".input1Y")
					cmds.connectAttr(m1+".outputX", self.name+"_twist%s_y_1_skinJoint.posMin"%ibtw)
					cmds.connectAttr(m1+".outputY", self.name+"_twist%s_y_1_skinJoint.posMax"%ibtw)
					
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.angleMin" %ibtw, self.name+"_twist%s_y_2_skinJoint.angleMin" %ibtw)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.angleMax" %ibtw, self.name+"_twist%s_y_2_skinJoint.angleMax" %ibtw)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.slideMin" %ibtw, self.name+"_twist%s_y_2_skinJoint.slideMin" %ibtw)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.slideMax" %ibtw, self.name+"_twist%s_y_2_skinJoint.slideMax" %ibtw)
					m1 = cmds.createNode("multiplyDivide", n=self.name+"_slideMirror_%s_2_multiplyDivide" %ibtw)
					cmds.setAttr(m1+".input2X", -1)
					cmds.setAttr(m1+".input2Y", -1)
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.posMin" %ibtw, m1+".input1X")
					cmds.connectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.posMax" %ibtw, m1+".input1Y")
					cmds.connectAttr(m1+".outputX", self.name+"_twist%s_y_2_skinJoint.posMin"%ibtw)
					cmds.connectAttr(m1+".outputY", self.name+"_twist%s_y_2_skinJoint.posMax"%ibtw)					

		
		super(self.__class__, self).connectOpposite()
		
	# def disconnect(self):
		
	# 	side = utils.getObjectSide(self.name)
		
	# 	if side == 'r':# or not cmds.objExists(opp_name+'_mod'):
	# 		mirror_moduleName = utils.getOppositeObject(self.name)
	# 		if cmds.objExists(mirror_moduleName+'_mod'):
				
	# 			# disconnect joints
	# 			for i in range(5):
	# 				cmds.disconnectAttr(mirror_moduleName+"_twistUp_%s_skinJoint.curvePosition" %i, self.name+"_twistUp_%s_skinJoint.curvePosition" %i)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twistDown_%s_skinJoint.curvePosition" %i, self.name+"_twistDown_%s_skinJoint.curvePosition" %i)
					
	# 			cmds.disconnectAttr(mirror_moduleName+"_twistKnee_skinJoint.radiusWeight", self.name+"_twistKnee_skinJoint.radiusWeight")
				
	# 			for ibtw in ["Knee"]:
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.angleMin" %ibtw, self.name+"_twist%s_y_1_skinJoint.angleMin" %ibtw)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.angleMax" %ibtw, self.name+"_twist%s_y_1_skinJoint.angleMax" %ibtw)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.slideMin" %ibtw, self.name+"_twist%s_y_1_skinJoint.slideMin" %ibtw)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_1_skinJoint.slideMax" %ibtw, self.name+"_twist%s_y_1_skinJoint.slideMax" %ibtw)
	# 				cmds.delete(self.name+"_slideMirror_%s_1_multiplyDivide" %ibtw)
					
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.angleMin" %ibtw, self.name+"_twist%s_y_2_skinJoint.angleMin" %ibtw)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.angleMax" %ibtw, self.name+"_twist%s_y_2_skinJoint.angleMax" %ibtw)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.slideMin" %ibtw, self.name+"_twist%s_y_2_skinJoint.slideMin" %ibtw)
	# 				cmds.disconnectAttr(mirror_moduleName+"_twist%s_y_2_skinJoint.slideMax" %ibtw, self.name+"_twist%s_y_2_skinJoint.slideMax" %ibtw)
	# 				cmds.delete(self.name+"_slideMirror_%s_2_multiplyDivide" %ibtw)
					
	# 	super(self.__class__, self).disconnect()
		
	# 	print ("DISCONNECT")
		
	def rebuildWithNewOptions(self, widget, opp_module=None):
		#side = utils.getObjectSide(self.name)
		
		def rebuildJoints(m_name):
		
			upper_joints_count = widget.startJointsCount_spinBox.value()
			lower_joints_count = widget.endJointsCount_spinBox.value()
			
			for side in ['upper', 'lower']:
			
				if side == 'upper': joints_count = upper_joints_count 
				elif side == 'lower': joints_count = lower_joints_count 
				old_joints_count = len(pm.listRelatives(m_name+'_%s_twist_1_outJoint' %side, type='joint', allDescendents=1))
			
				pm.delete(m_name+'_%s_twist_1_outJoint' %side)
			
				pm.select(clear=1)
				for i in range(1, joints_count+1):
					pm.joint(n=m_name+'_%s_twist_%s_outJoint' %(side,i))
				pm.parent(m_name+'_%s_twist_1_outJoint' %side, m_name+'_root_outJoint')
			
				pm.select(m_name+'_%s_twist_1_outJoint' %side, m_name+'_%s_twist_%s_outJoint' %(side,joints_count), m_name+'_%s_curve' %side)
				pm.ikHandle(sol='ikSplineSolver', ccv=0, n=m_name+'_%s_ikHandle' %side)
			
				pm.parent(m_name+'_%s_curve' %side, m_name+'_%s_ikHandle' %side, m_name+'_system')
			
				for i in range(2, joints_count+1):
					pm.connectAttr(m_name+'_%s_lenght_multDoubleLinear.output' %side, m_name+'_%s_twist_%s_outJoint.tx' %(side,i))
			
				pm.setAttr(m_name+'_%s_lenght_multiplyDivide.input2X' %side, joints_count-1)
				pm.setAttr(m_name+'_%s_ikHandle.dTwistControlEnable' %side, 1)
				pm.setAttr(m_name+'_%s_ikHandle.dWorldUpType' %side, 4)
			
				if side == 'upper':
					pm.connectAttr(m_name+'_startEulerLoc.worldMatrix[0]', m_name+'_%s_ikHandle.dWorldUpMatrix' %side)
					pm.connectAttr(m_name+'_b_finalJoint.worldMatrix[0]', m_name+'_%s_ikHandle.dWorldUpMatrixEnd' %side)
				else:
					pm.connectAttr(m_name+'_b_finalJoint.worldMatrix[0]', m_name+'_%s_ikHandle.dWorldUpMatrix' %side)
					pm.connectAttr(m_name+'_endEulerLoc_out.worldMatrix[0]', m_name+'_%s_ikHandle.dWorldUpMatrixEnd' %side)		
				
		rebuildJoints(self.name)
		
		
		if opp_module:
			rebuildJoints(opp_module.name)
			
		pm.delete(self.name+'_root_joint')
		self.addSkinJoints()
		pm.delete(opp_module.name+'_root_joint')
		self.addSkinJoints(opp_module.name)
