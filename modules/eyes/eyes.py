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
