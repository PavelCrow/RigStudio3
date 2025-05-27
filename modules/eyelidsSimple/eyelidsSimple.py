import maya.cmds as cmds

from ... import utils, module


class EyelidsSimple(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
	def connect(self, target):
		targetModuleName = utils.getModuleName(target)
		if targetModuleName in ['eyes']:
			target = targetModuleName+"_root_skinJoint"

		super(self.__class__, self).connect(target)
		
		if targetModuleName in ['eyes']:
			cmds.setAttr(self.name+'_mainPoser.t', 0,0,0)
			cmds.setAttr(self.name+'_mainPoser.sx', 1)
			cmds.setAttr(self.name+'_mainPoser.size', 0.1)
			cmds.setAttr(self.name+'_root_poser.size', 0.1)
			
			comp = cmds.createNode("composeMatrix", n=self.name+"_moveCorrectMatrix")
			cmds.setAttr(comp+".inputScaleX", -1)
			comp2 = cmds.createNode("composeMatrix", n=self.name+"_rotateCorrectMatrix")
			cmds.setAttr(comp2+".inputScaleX", -1)
			
			utils.connectByMatrix(self.name+'_l_eye_move_connector', [self.name+"_end_poser", targetModuleName+"_end_poser", targetModuleName+'_l_base_skinJoint', self.name+'_l_eye_move_connector'], 
				                  ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'parentInverseMatrix[0]'], self.name, attrs=['t', 'r'] )
			utils.connectByMatrix(self.name+'_r_eye_move_connector', [self.name+"_end_poser", comp, targetModuleName+"_r_ball_controlInitLoc", comp, targetModuleName+'_r_base_skinJoint', self.name+'_r_eye_move_connector'], 
				                  ['worldMatrix[0]', 'outputMatrix', 'worldInverseMatrix[0]', 'outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], self.name, attrs=['t', 'r'] )
			
			eye_ctrl = utils.getControlNameFromInternal(targetModuleName, 'control')
			
			utils.setUserAttr(eye_ctrl, 'autoLids', 0.5, type="float")
			cmds.addAttr(eye_ctrl+'.autoLids', e=1, min=0, max=1)
			cmds.setAttr(eye_ctrl+".autoLids", e=1, l=0, k=1)
			
			cmds.connectAttr(eye_ctrl+".autoLids", self.root+'.autoLids')
			cmds.connectAttr(targetModuleName+"_l_outJoint.rx", self.name+'_l_eye_rotate_connector.rx')
			cmds.connectAttr(targetModuleName+"_l_outJoint.ry", self.name+'_l_eye_rotate_connector.ry')
			cmds.connectAttr(targetModuleName+"_l_outJoint.rz", self.name+'_l_eye_rotate_connector.rz')
			
			utils.connectByMatrix(self.name+'_r_eye_rotate_connector', [comp2, targetModuleName+"_r_outJoint", self.name+'_r_eye_rotate_connector'], 
				                  ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], self.name, attrs=['r'] )			

			cmds.connectAttr(targetModuleName+"_l_ball.s", self.name+'_l_t_eyeLid_outJoint.s', f=1)
			cmds.connectAttr(targetModuleName+"_l_ball.s", self.name+'_l_b_eyeLid_outJoint.s', f=1)
			cmds.connectAttr(targetModuleName+"_r_ball.s", self.name+'_r_t_eyeLid_outJoint.s', f=1)
			cmds.connectAttr(targetModuleName+"_r_ball.s", self.name+'_r_b_eyeLid_outJoint.s', f=1)

			cmds.connectAttr(targetModuleName+'_end_poser.tx', self.name+'_end_poser.tx')
			# cmds.connectAttr(targetModuleName+'_end_poser.s', self.name+'_end_poser.s')
			
			# cmds.disconnectAttr(self.name+"_root_connector_decMat.outputScaleX", self.name+'_root_connector.sx')	
			# cmds.disconnectAttr(self.name+"_root_connector_decMat.outputScaleY", self.name+'_root_connector.sy')	
			# cmds.disconnectAttr(self.name+"_root_connector_decMat.outputScaleZ", self.name+'_root_connector.sz')	
					
	def disconnect(self):
		inputNode = cmds.connectionInfo(self.name+'_root_connector_multMat.matrixIn[1]', sourceFromDestination=1).split('.')[0]
		inputModuleName = utils.getModuleName(inputNode)		

		super(self.__class__, self).disconnect()		
		
		eye_ctrl = utils.getControlNameFromInternal(inputModuleName, 'control')
		cmds.setAttr(eye_ctrl+".autoLids", e=1, l=0)
		cmds.deleteAttr(eye_ctrl+'.autoLids')
		
		cmds.disconnectAttr(inputModuleName+"_l_outJoint.rx", self.name+'_l_eye_rotate_connector.rx')
		cmds.disconnectAttr(inputModuleName+"_l_outJoint.ry", self.name+'_l_eye_rotate_connector.ry')
		cmds.disconnectAttr(inputModuleName+"_l_outJoint.rz", self.name+'_l_eye_rotate_connector.rz')

		cmds.delete(self.name+"_r_eye_rotate_connector_decMat")
		cmds.delete(self.name+"_r_eye_rotate_connector_multMat")
		
		cmds.setAttr(self.name+'_l_eye_rotate_connector.r', 0,0,0)
		cmds.setAttr(self.name+'_r_eye_rotate_connector.r', 0,0,0)
		
		cmds.delete(self.name+'_l_eye_move_connector_decMat')
		cmds.delete(self.name+'_r_eye_move_connector_decMat')
		
		cmds.setAttr(self.name+'_mainPoser.size', 1)
		cmds.setAttr(self.name+'_root_poser.size', 1)		

		cmds.connectAttr(self.name+"_l_t_eyeLid.s", self.name+'_l_t_eyeLid_outJoint.s', f=1)
		cmds.connectAttr(self.name+"_l_b_eyeLid.s", self.name+'_l_b_eyeLid_outJoint.s', f=1)
		cmds.connectAttr(self.name+"_r_t_eyeLid.s", self.name+'_r_t_eyeLid_outJoint.s', f=1)
		cmds.connectAttr(self.name+"_r_b_eyeLid.s", self.name+'_r_b_eyeLid_outJoint.s', f=1)

		cmds.disconnectAttr(inputModuleName+'_end_poser.tx', self.name+'_end_poser.tx')
		cmds.disconnectAttr(inputModuleName+'_end_poser.s', self.name+'_end_poser.s')