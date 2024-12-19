import maya.cmds as cmds

from ...import utils, module


class Root(module.Module):
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]


	def create(self, options={}):
		super(self.__class__, self).create(options)	
		
		cmds.setAttr(self.name+"_root_skinJoint.drawStyle", 2)