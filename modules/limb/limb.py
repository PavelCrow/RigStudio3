import maya.cmds as cmds
import logging, traceback, math, sys
from functools import partial

from ... import utils, module

class Limb(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.widget = None

	def connect(self, target, opposite=False):
		super(self.__class__, self).connect(target, opposite)

	def delete(self):
		cmds.delete(self.name+'_rootEnd_vectorNormalized')
		cmds.delete(self.name+'_cosAngle_bewtweenVectors')
		cmds.delete(self.name+'_middleOut_vectorNormalized')

		super(self.__class__, self).delete()
			
	def connectSignals(self, main, w):
		module = main.curModule
		opp_module = main.rig.getMirroredModule(module)
		# w.swapEndOrient_btn.clicked.connect(partial(self.swapEndPose, main, opp_module))
		# w.addMiddleTwistOffsetControl_btn.clicked.connect(self.addMiddleTwistOffsetControl)
		w.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)

	def updateOptionsPage(self, w):
		w.aimDistance_spinBox.setValue(cmds.getAttr(self.name+"_mod.aim_offset"))
		self.widget = w
		
	def setMirrored(self):
		# fix joint positions (Update)
		oppModuleName = utils.getOppositeObject(self.name)
		cmds.setAttr(oppModuleName+'_ik_hand.tx', 0)
		super(self.__class__, self).setMirrored()

	def swapEndPose(self, main, opp_module):
		l_fk_ctrl = utils.getControlNameFromInternal(self.name, 'fk_end')
		l_ik_ctrl = utils.getControlNameFromInternal(self.name, 'ik_end')
		l_ik_loc = self.name + "_end_pose_loc"
		if opp_module:
			r_fk_ctrl = utils.getControlNameFromInternal(opp_module.name, 'fk_end')
			r_ik_ctrl = utils.getControlNameFromInternal(opp_module.name, 'ik_end')			

		childs = main.rig.getModuleChildren(self.name)
		if len(childs) == 0:
			cmds.warning("Selected module have not child module")
			return
		
		child_name = childs[0]
		child_poser = child_name + '_mainPoser'
		
		rot_local = cmds.xform(l_ik_ctrl, q=1, ro=1)
		
		offset_gr = l_ik_ctrl+"_offset_group"
		offset_fk_gr = l_fk_ctrl+"_offset_group"

		if (-0.01 < rot_local[0] < 0.01 and -0.01 < rot_local[1] < 0.01 and -0.01 < rot_local[2] < 0.01) and not cmds.objExists(offset_gr):
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

			if self.widget.keepZeroAttributes_checkBox.isChecked():
				cmds.group(empty=1, n=offset_gr)
				cmds.group(empty=1, n=offset_fk_gr)
				cmds.parent(offset_gr, l_ik_ctrl)
				cmds.parent(offset_fk_gr, l_fk_ctrl)
				utils.resetAttrs(offset_gr)
				utils.resetAttrs(offset_fk_gr)
				cmds.parent(offset_gr, cmds.listRelatives(l_ik_ctrl, p=1)[0])
				cmds.parent(offset_fk_gr, cmds.listRelatives(l_fk_ctrl, p=1)[0])
				cmds.parent(l_ik_ctrl, offset_gr)
				cmds.parent(l_fk_ctrl, offset_fk_gr)

				if opp_module:
					offset_gr = r_ik_ctrl+"_offset_group"
					cmds.group(empty=1, n=offset_gr)
					cmds.parent(offset_gr, r_ik_ctrl)
					utils.resetAttrs(offset_gr)
					cmds.parent(offset_gr, cmds.listRelatives(r_ik_ctrl, p=1)[0])
					cmds.parent(r_ik_ctrl, offset_gr)

					offset_gr = r_fk_ctrl+"_offset_group"
					cmds.group(empty=1, n=offset_gr)
					cmds.parent(offset_gr, r_fk_ctrl)
					utils.resetAttrs(offset_gr)
					cmds.parent(offset_gr, cmds.listRelatives(r_fk_ctrl, p=1)[0])
					cmds.parent(r_fk_ctrl, offset_gr)

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

			if cmds.objExists(offset_gr):
				cmds.parent(l_ik_ctrl, cmds.listRelatives(offset_gr, p=1)[0])
				utils.resetAttrs(l_ik_ctrl)
				cmds.delete(offset_gr)
				cmds.parent(l_fk_ctrl, cmds.listRelatives(offset_fk_gr, p=1)[0])
				utils.resetAttrs(l_fk_ctrl)
				cmds.delete(offset_fk_gr)

				offset_gr = r_ik_ctrl+"_offset_group"
				if cmds.objExists(offset_gr):
					cmds.parent(r_ik_ctrl, cmds.listRelatives(offset_gr, p=1)[0])
					utils.resetAttrs(r_ik_ctrl)
					cmds.delete(offset_gr)

				offset_gr = r_fk_ctrl+"_offset_group"
				if cmds.objExists(offset_gr):
					cmds.parent(r_fk_ctrl, cmds.listRelatives(offset_gr, p=1)[0])
					utils.resetAttrs(r_fk_ctrl)
					cmds.delete(offset_gr)

	def addMiddleTwistOffsetControl(self):
		if self.name.split("_")[0] == 'r':
			return

		opp_name = utils.getOppositeObject(self.name)

		tw_joints = []
		for o in cmds.listRelatives('twists') or []:
			tw_joints.append(o.split("_mod")[0])		

		# root connections
		if cmds.objExists(self.name+'_root_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_root_twist_0_joint', allDescendents=1) + [self.name+'_root_twist_0_joint']
			if not cmds.isConnected(self.name+'_root_volume_outJoint.s', tw_js[0]+'.s'):
				
				if self.name+"_root" in tw_joints:
					
					# connect twist to control
					c = self.name+"_middleOffset"
					c_ins = utils.getControlInstance(c)
		
					if cmds.listRelatives(self.name+"_root_end_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_root_end_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_root_end_connectorLoc", utils.getOppositeObject(c))
					
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_root_volume_outJoint.s', j+'.s', f=1)			
					
					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_root_twist_0_joint')
						tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
						for j in tw_js:
							cmds.connectAttr(utils.getOppositeObject(self.name+'_root_volume_outJoint.s'), j+'.s', f=1)					
							
						cmds.showHidden(utils.getOppositeObject(self.name+'_middleOffset'))
							
					cmds.showHidden(self.name+'_middleOffset')

		# middle connections			
		if cmds.objExists(self.name+'_middle_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_middle_twist_0_joint', allDescendents=1) + [self.name+'_middle_twist_0_joint']
			if not cmds.isConnected(self.name+'_middle_volume_outJoint.s', tw_js[0]+'.s'):					
				
				if self.name+"_middle" in tw_joints:
					
					# connect twist to control
					c = self.name+"_middleOffset"
					c_ins = utils.getControlInstance(c)					
					
					if cmds.listRelatives(self.name+"_middle_root_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_middle_root_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_middle_root_connectorLoc", utils.getOppositeObject(c))
		
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_middle_volume_outJoint.s', j+'.s', f=1)		

					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_middle_twist_0_joint')	
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

	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	
	
	def getOptions(self):
		optionsData = {}
		optionsData['aimDistance'] = cmds.getAttr(self.name+"_mod.aim_offset")
		return optionsData
	
	def setOptions(self, optionsData):
		self.update_aim_distance(optionsData['aimDistance'])
	
	def twistOverride(self, t_name, data):
		# make elbow offset movable
		if t_name == self.name+"_root":
			cmds.parent(t_name+'_end_connectorLoc', self.name+'_middleOffset')
			cmds.aimConstraint(self.name+"_middleOffset", t_name+"_root_connectorLoc", mo=0, aimVector=(1,0,0), upVector=(0,1,0), worldUpType="objectrotation", worldUpVector=(0,1,0), worldUpObject=t_name+"_outJoint")
			
			# joints = cmds.listRelatives(self.name+"_root_joints")
			# for j in joints:
			# 	cmds.connectAttr(self.name+"_root_volume_outJoint.s", j+".s", f=1)

		elif t_name == self.name+"_middle":
			cmds.parent(t_name+'_rootUpLoc', self.name+'_middleOffset')
			cmds.pointConstraint(t_name+'_rootUpLoc', t_name+'_root_connectorLoc', mo=0)
			cmds.aimConstraint(t_name+'_end_connectorLoc', t_name+"_root_connectorLoc", mo=0, aimVector=(1,0,0), upVector=(0,1,0), worldUpType="objectrotation", worldUpVector=(0,1,0), worldUpObject=t_name+"_outJoint")

			# joints = cmds.listRelatives(self.name+"_middle_joints")
			# for j in joints:
			# 	cmds.connectAttr(self.name+"_middle_volume_outJoint.s", j+".s", f=1)

		if cmds.objExists(self.name+"_root_root_connector") and cmds.objExists(self.name+"_middle_root_connector"):
			cmds.setAttr(self.name+"_middleOffsetShape.v", 1)

		cmds.setAttr(self.name+"_control.stretchVolume", lock=1, keyable=0, channelBox=0)





	def ibtwOverride(self, name):
		if name == self.name + "_middle_twist_0" :
			cmds.connectAttr(self.name+"_middleOffset.worldMatrix[0]", self.name+"_middle_twist_0_ibtw_joints_group_multMat.matrixIn[0]", f=1)