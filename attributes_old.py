import maya.cmds as cmds
import pymel.core as pm
import utils, main
from functools import partial
import logging, traceback

version = int(cmds.about(v=True).split(" ")[0])
if version >= 2020:
	from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
else:
	from Qt import QtWidgets, QtGui, QtCore, QtUiTools
try:
	from shiboken import wrapInstance
except:
	from shiboken2 import wrapInstance

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.setLevel(logging.DEBUG)

rootDebug = ""

def debugStart(func, name="", noEnd=False):
	if not main.configData['debug']: return
	global rootDebug
	rootDebug = rootDebug + ' -> ' + func
	logger.debug(rootDebug + ' ' + name + ' -> ')	

	if noEnd:
		rootDebug = rootDebug.split(' -> ' + func)[0]	

def debugEnd(func, name=""):
	if not main.configData['debug']: return
	global rootDebug
	logger.debug(rootDebug + ' ' + name + " -| ")
	rootDebug = rootDebug.split(' -> ' + func)[0]	

class Attributes(object):
	def __init__(self, win):
		debugStart(traceback.extract_stack()[-1][2])

		self.win = win
		self.connect()
		
		debugEnd(traceback.extract_stack()[-1][2])

	def connect(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.win.attributes_keyable_tx_btn.clicked.connect(partial(self.setAttribute, 'translate', 'X'))
		self.win.attributes_keyable_ty_btn.clicked.connect(partial(self.setAttribute, 'translate', 'Y'))
		self.win.attributes_keyable_tz_btn.clicked.connect(partial(self.setAttribute, 'translate', 'Z'))
		self.win.attributes_keyable_rx_btn.clicked.connect(partial(self.setAttribute, 'rotate', 'X'))
		self.win.attributes_keyable_ry_btn.clicked.connect(partial(self.setAttribute, 'rotate', 'Y'))
		self.win.attributes_keyable_rz_btn.clicked.connect(partial(self.setAttribute, 'rotate', 'Z'))
		self.win.attributes_keyable_sx_btn.clicked.connect(partial(self.setAttribute, 'scale', 'X'))
		self.win.attributes_keyable_sy_btn.clicked.connect(partial(self.setAttribute, 'scale', 'Y'))
		self.win.attributes_keyable_sz_btn.clicked.connect(partial(self.setAttribute, 'scale', 'Z'))
		
		self.win.attributes_keyable_t_btn.clicked.connect(partial(self.setAttributes, 'translate'))
		self.win.attributes_keyable_r_btn.clicked.connect(partial(self.setAttributes, 'rotate'))
		self.win.attributes_keyable_s_btn.clicked.connect(partial(self.setAttributes, 'scale'))
		self.win.attributes_keyable_v_btn.clicked.connect(partial(self.setAttribute, 'visibility'))
		
		self.win.attributes_keyable_all_btn.clicked.connect(self.setAllAttributes)

	def getVisibleAttrs(self, o):
		attrList = []
		attrListKeyable = cmds.listAttr( o, keyable=True )
		if type(attrListKeyable) != list :
			attrListKeyable = []
		attrListNonkeyable = cmds.listAttr( o, channelBox = True )
		if type(attrListNonkeyable) != list :
			attrListNonkeyable = []
		attrList = attrListKeyable + attrListNonkeyable
		return attrList
		
	def setAttribute(self, attr, axis="", v="none"):
		
		objects = cmds.ls(sl=True)
		if len(objects) == 0:
			cmds.warning("Nothing selected")
			return
		
		if v == "none":
			attrListKeyable = self.getVisibleAttrs(objects[0])
			v = attr+axis in attrListKeyable
			
		for o in objects:
			cmds.setAttr(o+"."+attr+axis, keyable=not v, lock=v)
		
	def setAttributes(self, attr, v="none"):
		objects = cmds.ls(sl=True)
		if len(objects) == 0:
			cmds.warning("Nothing selected")
			return
		
		if v == "none":
			attrListKeyable = self.getVisibleAttrs(objects[0])
			v = attr+"X" in attrListKeyable
		
		self.setAttribute(attr=attr, axis="X", v=v)
		self.setAttribute(attr=attr, axis="Y", v=v)
		self.setAttribute(attr=attr, axis="Z", v=v)
		
	def setAllAttributes(self):
		objects = cmds.ls(sl=True)
		if len(objects) == 0:
			cmds.warning("Nothing selected")
			return		

		attrListKeyable = self.getVisibleAttrs(objects[0])
		v = "translateX" in attrListKeyable
		
		self.setAttributes(attr="translate", v=v)
		self.setAttributes(attr="rotate", v=v)
		self.setAttributes(attr="scale", v=v)
		self.setAttribute(attr="visibility", v=v)
		
			