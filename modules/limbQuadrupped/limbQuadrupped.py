import maya.cmds as cmds
import pymel.core as pm

from ... import utils, module

class LimbQuadrupped(module.Module) :
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
		w.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)
		w.matchFkToIK.clicked.connect(self.matchFkToIK)

	def updateOptionsPage(self, w):
		w.aimDistance_spinBox.setValue(cmds.getAttr(self.name+"_mod.aim_offset"))
		self.widget = w
	
	def getOptions(self):
		optionsData = {}
		optionsData['aimDistance'] = cmds.getAttr(self.name+"_mod.aim_offset")
		return optionsData

	def setOptions(self, optionsData):
		self.update_aim_distance(optionsData['aimDistance'])

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

	def twistOverride(self, t_name, data):
		# make elbow offset movable
		if t_name == self.name+"_root":
			cmds.parent(t_name+'_end_connectorLoc', self.name+'_kneeOffset')
			cmds.aimConstraint(self.name+"_kneeOffset", t_name+"_root_connectorLoc", mo=0, aimVector=(1,0,0), upVector=(0,1,0), worldUpType="objectrotation", worldUpVector=(0,1,0), worldUpObject=t_name+"_outJoint")

		elif t_name == self.name+"_knee":
			cmds.parent(t_name+'_rootUpLoc', self.name+'_kneeOffset')
			cmds.parent(t_name+'_root_connectorLoc', self.name+'_kneeOffset')
			cmds.aimConstraint(self.name+"_ankleOffset", t_name+"_root_connectorLoc", mo=0, aimVector=(1,0,0), upVector=(0,1,0), worldUpType="objectrotation", worldUpVector=(0,1,0), worldUpObject=t_name+"_outJoint")
			cmds.parent(t_name+'_end_connectorLoc', self.name+'_ankleOffset')
		elif t_name == self.name+"_ankle":
			cmds.parent(t_name+'_rootUpLoc', self.name+'_ankleOffset')
			cmds.parent(t_name+'_root_connectorLoc', self.name+'_ankleOffset')
			cmds.aimConstraint(t_name+"_end_connectorLoc", t_name+"_root_connectorLoc", mo=0, aimVector=(1,0,0), upVector=(0,1,0), worldUpType="objectrotation", worldUpVector=(0,1,0), worldUpObject=t_name+"_outJoint")

		if not self.opposite:
			cmds.setAttr(t_name+'_rootUpLoc.r', data["rootOffset"][0], data["rootOffset"][1], data["rootOffset"][2])
			cmds.setAttr(t_name+'_end_connectorLoc.r', data["endOffset"][0], data["endOffset"][1], data["endOffset"][2])

	def ibtwOverride(self, name):
		if name == self.name + "_knee_twist_0" :
			cmds.connectAttr(self.name+"_kneeOffset.worldMatrix[0]", self.name+"_knee_twist_0_ibtw_joints_group_multMat.matrixIn[0]", f=1)
		elif name == self.name + "_ankle_twist_0" :
			cmds.connectAttr(self.name+"_ankleOffset.worldMatrix[0]", self.name+"_ankle_twist_0_ibtw_joints_group_multMat.matrixIn[0]", f=1)

		# cmds.connectAttr(self.name+"_control.stretchVolume", name+"_twist.stretchVolume")
		# cmds.setAttr(name+"_twist.stretchVolume", k=0, channelBox=0)

		cmds.setAttr(self.name+"_control.stretchVolume", lock=1, keyable=0, channelBox=0)

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

	def matchFkToIK(self):
		cmds.undoInfo(openChunk=True)

		# switch ik
		c = utils.getControlNameFromInternal(self.name, "control")
		cmds.select(c)
		cmds.setAttr(c+".ikFk", 1)
		import rigStudio3.animTools.switchIkFk
		rigStudio3.animTools.switchIkFk.switchIkFk()

		if self.symmetrical:
			c_opp = utils.getOpposite(c)
			cmds.setAttr(c_opp+".ikFk", 1)
			cmds.select(c_opp)
			rigStudio3.animTools.switchIkFk.switchIkFk()

		# get foot module name
		outputs = cmds.connectionInfo( c + ".ikFk", destinationFromSource=True)
		foot_m_name = None
		for attr in outputs:
			if attr.split('.')[-1] == 'ikFk':
				in_node = attr.split('.')[0]	
				foot_m_name = utils.getModuleName(in_node).split("_mod")[0]
				break
		
		# get controls list
		leg_fk_controls = leg_fk_controls = ["fk_a", "fk_b", "fk_c"]
		foot_fk_controls = ["fk_heel", "fk_toe"]
		
		# matching
		def matching(m_name, controls):
			for c_int in controls:
				c = pm.PyNode(utils.getControlNameFromInternal(m_name, c_int))
				p = c.getParent()
				inputs = []
				inputs += p.t.inputs()
				inputs += p.tx.inputs()
				inputs += p.ty.inputs()
				inputs += p.tz.inputs()
				inputs += p.r.inputs()
				inputs += p.rx.inputs()
				inputs += p.ry.inputs()
				inputs += p.rz.inputs()
				if inputs:
					gr = pm.group(empty=True, n=c+"_offset")
					pm.parent(gr,c)
					gr.t.set(0,0,0)
					gr.r.set(0,0,0)
					gr.s.set(1,1,1)
					pm.parent(gr,p)
					pm.parent(c,gr)
				else:
					top_p = p.getParent()
					pm.parent(c,top_p)
					pm.parent(p,c)
					p.t.set(0,0,0)
					p.r.set(0,0,0)
					p.s.set(1,1,1)
					pm.parent(p,top_p)
					pm.parent(c,p)

		matching(self.name, leg_fk_controls)
		if foot_m_name: matching(foot_m_name, foot_fk_controls)

		if self.symmetrical:
			matching(utils.getOpposite(self.name), leg_fk_controls)
			if foot_m_name: matching(utils.getOpposite(foot_m_name), foot_fk_controls)

		cmds.undoInfo(closeChunk=True)