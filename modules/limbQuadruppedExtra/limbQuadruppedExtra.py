import maya.cmds as cmds
import traceback

from ... import utils, module

class LimbQuadruppedExtra(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
	def connect_(self, target):
		if utils.getModuleTypeFromAttr(target) == 'spineIkFk':
			targetModuleName = utils.getModuleNameFromAttr(target)
			if target == utils.getControlNameFromInternal(targetModuleName, 'hips') or target == utils.getControlNameFromInternal(targetModuleName, 'fk_hips') or target == utils.getControlNameFromInternal(targetModuleName, 'pelvis') :
				target = targetModuleName+"_root_skinJoint_out"		
		super(self.__class__, self).connect(target)

	def connectSignals(self, mainInstance, w):
		w.connectAnkle_btn.clicked.connect(self.connect_ankle_to_posers)

	def connect_ankle_to_posers(self):
		
		connect = cmds.isConnected(self.name+'_init_ankle_unitConversion.output', self.name+'_ik_ankle.rx')
		opp_name = utils.getOppositeObject(self.name)
		
		if not connect:
			cmds.connectAttr(self.name+"_init_ankle_unitConversion.output", self.name+"_ik_ankle.rx")
			if utils.objectIsOpposite(opp_name+"_mod") and cmds.objExists(opp_name+"_mod"):
				cmds.connectAttr(opp_name+"_init_ankle_unitConversion.output", opp_name+"_ik_ankle.rx")
		else:
			cmds.disconnectAttr(self.name+"_init_ankle_unitConversion.output", self.name+"_ik_ankle.rx")
			if utils.objectIsOpposite(opp_name+"_mod") and cmds.objExists(opp_name+"_mod"):
				cmds.disconnectAttr(opp_name+"_init_ankle_unitConversion.output", opp_name+"_ik_ankle.rx")			
			
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
					c = self.name+"_kneeOffset"
	
					if cmds.listRelatives(self.name+"_root_end_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_root_end_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_root_end_connectorLoc", utils.getOppositeObject(c))
							
							# orient fix for mirrored side end connector
							p = cmds.listRelatives(opp_name+"_root_end_connectorLoc", p=1)[0]
							cmds.parent(opp_name+"_root_end_connectorLoc", opp_name+"_root_root_connector")
							cmds.setAttr(opp_name+"_root_end_connectorLoc.r", 0,0,0)		
							cmds.parent(opp_name+"_root_end_connectorLoc", p)										
	
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_root_volume_outJoint.s', j+'.s', f=1)			
	
					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_root_twist_0_joint')
						tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
						for j in tw_js:
							cmds.connectAttr(utils.getOppositeObject(self.name+'_root_volume_outJoint.s'), j+'.s', f=1)					
	
						cmds.showHidden(utils.getOppositeObject(self.name+'_kneeOffset'))
	
					cmds.showHidden(self.name+'_kneeOffset')
	
		# knee connections			
		if cmds.objExists(self.name+'_knee_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_knee_twist_0_joint', allDescendents=1) + [self.name+'_knee_twist_0_joint']
			if not cmds.isConnected(self.name+'_knee_volume_outJoint.s', tw_js[0]+'.s'):					
	
				if self.name+"_knee" in tw_joints:
	
					# connect twist to control
					c = self.name+"_kneeOffset"
	
					if cmds.listRelatives(self.name+"_knee_root_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_knee_root_connectorLoc", c)
						
						if self.symmetrical:
							cmds.parent(opp_name+"_knee_root_connectorLoc", utils.getOppositeObject(c))
	
					c = self.name+"_ankleOffset"
					if cmds.listRelatives(self.name+"_knee_end_connectorLoc", p=1)[0] != c:
						
						cmds.parent(self.name+"_knee_end_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_knee_end_connectorLoc", utils.getOppositeObject(c))
							
							# orient fix for mirrored side end connector
							p = cmds.listRelatives(opp_name+"_knee_end_connectorLoc", p=1)[0]
							cmds.parent(opp_name+"_knee_end_connectorLoc", opp_name+"_knee_root_connector")
							cmds.setAttr(opp_name+"_knee_end_connectorLoc.r", 0,0,0)		
							cmds.parent(opp_name+"_knee_end_connectorLoc", p)								
	
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_knee_volume_outJoint.s', j+'.s', f=1)		
	
					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_knee_twist_0_joint')	
						tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
						for j in tw_js:
							cmds.connectAttr(utils.getOppositeObject(self.name+'_knee_volume_outJoint.s'), j+'.s', f=1)
	
						cmds.showHidden(utils.getOppositeObject(self.name+'_ankleOffset'))
	
					cmds.showHidden(self.name+'_ankleOffset')
	
		# ankle connections			
		if cmds.objExists(self.name+'_ankle_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_ankle_twist_0_joint', allDescendents=1) + [self.name+'_ankle_twist_0_joint']
			if not cmds.isConnected(self.name+'_ankle_volume_outJoint.s', tw_js[0]+'.s'):					
	
				if self.name+"_ankle" in tw_joints:
	
					# connect twist to control
					c = self.name+"_ankleOffset"
	
					if cmds.listRelatives(self.name+"_ankle_root_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_ankle_root_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_ankle_root_connectorLoc", utils.getOppositeObject(c))
							
							# orient fix for mirrored side end connector
							p = cmds.listRelatives(opp_name+"_ankle_end_connectorLoc", p=1)[0]
							cmds.parent(opp_name+"_ankle_end_connectorLoc", opp_name+"_ankle_root_connector")
							cmds.setAttr(opp_name+"_ankle_end_connectorLoc.r", 0,0,0)		
							cmds.parent(opp_name+"_ankle_end_connectorLoc", p)										
	
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_ankle_volume_outJoint.s', j+'.s', f=1)		
	
					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_ankle_twist_0_joint')	
						tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
						for j in tw_js:
							cmds.connectAttr(utils.getOppositeObject(self.name+'_ankle_volume_outJoint.s'), j+'.s', f=1)