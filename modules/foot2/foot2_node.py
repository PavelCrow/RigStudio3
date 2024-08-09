import maya.cmds as cmds
from rigStudio2.map import nodeItem

class Foot_NodeItem(nodeItem.ModuleItem):
	def __init__(self, parent, name, create=False):
		super(self.__class__, self).__init__(parent, name, create)

		self.type = __name__.split('.')[-1]

		self.lastInit()
