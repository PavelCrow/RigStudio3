import maya.cmds as cmds
import logging, traceback, sys

if sys.version[0] == "2":
	from ... import utils, module
else:
	import importlib
	import rigStudio2.utils as utils
	import rigStudio2.module as module	

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
#logger.setLevel(logging.DEBUG)

class Root(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()
		logger.debug(traceback.extract_stack()[-1][2])

		self.name = name
		self.type = __name__.split('.')[-1]
		#self.unic = False
		
		logger.debug(traceback.extract_stack()[-1][2] + " End")
		
	def create(self, options={}):
		super(self.__class__, self).create(options)	
		
		cmds.setAttr(self.name+"_root_joint.drawStyle", 2)