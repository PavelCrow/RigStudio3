import maya.cmds as cmds
from functools import partial

from ... import utils, module

class EyesGeometry(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.useGeometry = False
		self.full = None
		self.win = None
		self.widget = None
		
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.useGeometry_checkBox.clicked.connect(partial(self.useGeometryToggle, w))
		self.full = mainInstance.full
		self.win = mainInstance.win
		self.widget = w
		
		if not self.full and cmds.objExists(self.name+"_geo_group")	:
			cmds.delete(self.name+"_geo_group")		
		
	def getOptions(self):
		if cmds.objExists(self.name+"_geo_group"):
			self.useGeometry = cmds.getAttr(self.name+"_geo_group.visibility")
		else:
			self.useGeometry = False
		
		
		optionsData = {}
		optionsData['useGeometry'] = self.useGeometry	
		
		return optionsData	
	
	def getData(self):
		data = super(self.__class__, self).getData()

		data['useGeometry'] = self.useGeometry

		return data		
	
	def setData(self, data, sym=False, namingForce=False, load="all"):
		super(self.__class__, self).setData(data, sym, namingForce, load)

		self.useGeometryToggle(set=True, v=data['useGeometry'])

	def useGeometryToggle(self, w=None, set=False, v=False):
		if not set:
			sel = cmds.ls(sl=1)
			v = not cmds.getAttr(self.name+"_geo_group.visibility")
		
		if not v:
			p = cmds.listRelatives(self.name+"_geo_group", p=1)[0]
			if p != self.name+"_output":
				cmds.parent(self.name+"_geo_group", self.name+"_output")
			cmds.hide(self.name+"_geo_group")		
		else:
			p = cmds.listRelatives(self.name+"_geo_group", p=1)[0]
			if p == self.name+"_output":
				cmds.parent(self.name+"_geo_group", "geo")
			cmds.showHidden(self.name+"_geo_group")
		
		if not set:
			cmds.select(sel)
		
		if w:
			self.updateOptionsPage(w)

	def updateOptionsPage(self, widget):
		self.useGeometry = self.getOptions()['useGeometry']

		widget.useGeometry_checkBox.setChecked(self.useGeometry)
