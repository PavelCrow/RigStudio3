import maya.cmds as cmds
from functools import partial

from ... import utils, module

class LimbSimple(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False

	def delete(self):
		cmds.delete(self.name+'_rootEnd_vectorNormalized')
		cmds.delete(self.name+'_cosAngle_bewtweenVectors')
		cmds.delete(self.name+'_middleOut_vectorNormalized')

		super(self.__class__, self).delete()
			
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		opp_module = mainInstance.rig.getMirroredModule(module)
		w.swapEndOrient_btn.clicked.connect(partial(self.swapEndPose, mainInstance, opp_module))
		w.addMiddleTwistOffsetControl_btn.clicked.connect(self.addMiddleTwistOffsetControl)

	def setMirrored(self):
		# fix joint positions (Update)
		oppModuleName = utils.getOppositeObject(self.name)
		cmds.setAttr(oppModuleName+'_ik_hand.tx', 0)
		super(self.__class__, self).setMirrored()

	def swapEndPose(self, mainInstance, opp_module):
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
		child_poser = child_name + '_mainPoser'
		
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

	def bake(self):
		super(self.__class__, self).bake(addObjects=[self.name+"_ik_connector"])