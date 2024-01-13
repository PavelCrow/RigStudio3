import maya.cmds as cmds
import maya.mel as mel
import utils
import logging, traceback, os, imp

logger = logging.getLogger(__name__)
#logger.setLevel(logging.INFO)
logger.setLevel(logging.DEBUG)

class Template(object):
	def __init__(self):
		logger.debug(traceback.extract_stack()[-1][2])
		
		#self.type = type
		#self.name = name
		
		
	def load(self):
		logger.debug(traceback.extract_stack()[-1][2])
		
	def save(self, name):
		logger.debug(traceback.extract_stack()[-1][2])
		print name


	def delete(self):
		logger.debug(traceback.extract_stack()[-1][2])


