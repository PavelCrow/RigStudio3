import maya.cmds as cmds
from functools import partial

from ... import utils, module

version = int(cmds.about(v=True).split(" ")[0])


class Eyes(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.full = None
		self.win = None
		self.widget = None

	def addSkinJoints(self, m_name=None):
		super(self.__class__, self).addSkinJoints(m_name)

		# correct scale skin joints from eyes_l_ball and eyes_r_ball controls
		mult = cmds.createNode('multiplyDivide', n=self.name+"_l_scaleLocal_multiplyDivide")
		cmds.connectAttr(self.name+"_l_ball.s", mult+".input1")
		cmds.connectAttr(self.name+"_l_base_skinJoint_jointInvScale_multiplyDivide.output", mult+".input2")
		cmds.connectAttr(mult+".outputX", self.name+"_l_base_skinJoint.sx", f=1)
		cmds.connectAttr(mult+".outputY", self.name+"_l_base_skinJoint.sy", f=1)
		cmds.connectAttr(mult+".outputZ", self.name+"_l_base_skinJoint.sz", f=1)

		mult = cmds.createNode('multiplyDivide', n=self.name+"_r_scaleLocal_multiplyDivide")
		cmds.connectAttr(self.name+"_r_ball.s", mult+".input1")
		cmds.connectAttr(self.name+"_r_base_skinJoint_jointInvScale_multiplyDivide.output", mult+".input2")
		cmds.connectAttr(mult+".outputX", self.name+"_r_base_skinJoint.sx", f=1)
		cmds.connectAttr(mult+".outputY", self.name+"_r_base_skinJoint.sy", f=1)
		cmds.connectAttr(mult+".outputZ", self.name+"_r_base_skinJoint.sz", f=1)