import maya.cmds as cmds
import logging, traceback, sys

from ... import utils, module

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
#logger.setLevel(logging.DEBUG)

class Squash(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()
		logger.debug(traceback.extract_stack()[-1][2])

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
			
	def connectSignals(self, mainInstance, w):
		w.assign_btn.clicked.connect(self.assign)
		
	def assign(self):
		sel = cmds.ls(sl=1)

		for o in sel:
			deformerSet = cmds.listConnections( self.name+"_squash1", type="objectSet" )
			cmds.sets( o, add=deformerSet[0] )
			deformerSet = cmds.listConnections( self.name+"_bend1", type="objectSet" )
			cmds.sets( o, add=deformerSet[0] )