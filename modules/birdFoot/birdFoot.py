import maya.cmds as cmds
import pymel.core as pm

from ... import utils, module

class BirdFoot(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False

	def connect(self, target, opposite=False):
		targetModuleName = utils.getModuleName(target)
		target_mod_type = cmds.getAttr(targetModuleName+'_mod.moduleType')

		if target_mod_type in ['limb', 'limbQuadrupped', 'limbQuadruppedExtra', 'limbCurved', 'limbQuadruppedExtraMiddle', 'limbQuadrupped2', "limbCurvedQuadrupped"]:
			target = targetModuleName+"_end_poser"
		
		cmds.disconnectAttr(self.name+'_ik_connector_decMat.outputRotate', self.name+'_ik_connector.rotate')
		utils.resetAttrs(self.name+'_ik_connector')

		if target_mod_type in ['limbQuadrupped', 'limbQuadruppedExtra']:
			cmds.setAttr(self.name+'_ik_connector.rx', 90)
			if opposite:
				cmds.setAttr(self.name+'_ik_connector.ry', 180)
		
		super(self.__class__, self).connect(target, opposite)

		if target_mod_type in ['limb', 'limbQuadrupped', 'limbQuadruppedExtra', 'limbCurved', 'limbQuadruppedExtraMiddle', 'limbQuadrupped2', "limbCurvedQuadrupped"]:
			# connect ikfk attribute
			cmds.connectAttr(utils.getControlNameFromInternal(targetModuleName, 'control')+'.ikFk', self.root+'.ikFk')

			# remove unused connections
			cmds.delete(self.name+"_root_connector_multMat")
			utils.resetAttrs(self.name+'_root_connector', matrix=True)

			# connect fk
			utils.connectByMatrix(self.name+'_fk_connector', [self.name+'_root_poserOrient', targetModuleName+'_end_initLoc', targetModuleName+'_fk_out', self.name+'_fk_connector'], 
						          ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'parentInverseMatrix[0]'], self.name )

			# connect ik 
			utils.connectByMatrix(targetModuleName+'_ik_connector', [self.name+'_ik_out', targetModuleName+'_ik_connector'], 
						['worldMatrix[0]', 'parentInverseMatrix[0]'], targetModuleName )

			utils.connectByMatrix(self.name+'_ikRev_connector', [targetModuleName+'_ikRev_out', self.name+'_ikRev_connector'], 
						          ['worldMatrix[0]', 'parentInverseMatrix[0]'], self.name )


			utils.connectByMatrix(self.name+'_root_connector', [targetModuleName+'_ik_out', self.name+'_root_connector'], 
						          ['worldMatrix[0]', 'parentInverseMatrix[0]'], self.name, attrs=['t', 'r'] )

			cmds.connectAttr(targetModuleName+'_root_connector.s', self.name+'_root_connector.s')

			# make seamless only for not symmetry module or for symmetry but after creating opposite module
			if not self.opposite and not self.symmetrical:
				self.makeSeamless(True)

			# fk opposite fix
			if target_mod_type in ['limb']:
				if self.opposite:
					cmds.disconnectAttr(targetModuleName+"_mirror_condition.outColorR", targetModuleName+"_end_initLoc.scaleZ")
					cmds.setAttr(targetModuleName+"_end_initLoc.sz", 1)

			ik_end = utils.getControlNameFromInternal(targetModuleName, "ik_end")
			cmds.setAttr(ik_end+"Shape.v", False)
					
		# if target_mod_type in ['limbCurved']:
		# 	con = cmds.listRelatives(targetModuleName+'_twistDown_end_connector', type="parentConstraint")
		# 	cmds.delete(con)
		# 	con = cmds.parentConstraint(self.name+"_root_outJoint", targetModuleName+'_twistDown_end_connector', mo=0)[0]
		# 	cmds.connectAttr(targetModuleName+"_mirror_condition.outColorG", con+".target[0].targetOffsetRotateY")
		# 	cmds.connectAttr(targetModuleName+"_reverse_condition.outColorR", con+".target[0].targetOffsetRotateX")
					
		# if target_mod_type in ['limbCurvedQuadrupped']:
		# 	con = cmds.listRelatives(targetModuleName+'_twistDown_end_connector', type="parentConstraint")
		# 	cmds.delete(con)
		# 	con = cmds.parentConstraint(self.name+"_root_outJoint", targetModuleName+'_twistDown_end_connector', mo=0)[0]
		# 	cmds.connectAttr(targetModuleName+"_mirror_condition.outColorG", con+".target[0].targetOffsetRotateZ")

	def disconnect(self):
		inputNode = ""
		
		if cmds.objExists(self.name+'_ikRev_connector_multMat'):
			inputNode = cmds.connectionInfo(self.name+'_ikRev_connector_multMat.matrixIn[0]', sourceFromDestination=1).split('.')[0]
			inputModuleName = utils.getModuleName(inputNode)
		
		super(self.__class__, self).disconnect()		
		
		cmds.connectAttr(self.name+'_ik_connector_decMat.outputRotate', self.name+'_ik_connector.rotate')
		
		if not cmds.objExists(inputNode):
			return
		
		if utils.getModuleTypeFromAttr(inputNode) in ['limb', 'limbQuadrupped', 'limbQuadruppedExtra', 'limbCurved', 'limbQuadruppedExtraMiddle', 'limbQuadrupped2', "limbCurvedQuadrupped"]:
			cmds.disconnectAttr(utils.getControlNameFromInternal(inputModuleName, 'control')+'.ikFk', self.root+'.ikFk')

			cmds.delete(utils.getInputNode(self.name+'_fk_connector', 'tx'))
			utils.resetAttrs(self.name+'_fk_connector')

			cmds.delete(utils.getInputNode(inputModuleName+'_ik_connector', 'tx'))
			utils.resetAttrs(inputModuleName+'_ik_connector')

			cmds.delete(utils.getInputNode(self.name+'_ikRev_connector', 'tx'))
			utils.resetAttrs(self.name+'_ikRev_connector')

			utils.resetAttrs(self.name+"_root_connector")
			
			cmds.disconnectAttr(inputModuleName+'_root_connector.s', self.name+'_root_connector.s')
			
			ik_end = utils.getControlNameFromInternal(inputModuleName, "ik_end")
			cmds.setAttr(ik_end+"Shape.v", True)
				
	def getParent(self):
		connectionNode_name = self.name+'_root_connector_multMat'
		#print connectionNode_name
		if cmds.objExists(connectionNode_name):
			try:
				parent_joint = pm.PyNode(connectionNode_name).matrixIn[2].inputs()[0]
				return parent_joint
			except: 
				input_node = pm.PyNode(connectionNode_name).matrixIn[0].inputs()[0]
				if '_ik_out' in input_node.name():
					return input_node.name().split('_ik_out')[0] + "_end_outJoint"
				else:
					return None
		else:
			return None
		
	def bake(self):
		
		super(self.__class__, self).bake(addObjects=[self.name+"_fk_connector", self.name+"_ikRev_connector"])