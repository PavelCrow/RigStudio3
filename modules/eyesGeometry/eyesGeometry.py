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
		self.deformShape = False
		self.full = None
		self.win = None
		self.widget = None
		
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.useGeometry_checkBox.clicked.connect(partial(self.useGeometryToggle, w))
		w.deformShape_checkBox.clicked.connect(self.deformToggle)
		self.full = mainInstance.full
		self.win = mainInstance.win
		self.widget = w
		
		if not self.full and cmds.objExists(self.name+"_geo_group")	:
			cmds.delete(self.name+"_geo_group")		
		
	def getOptions(self):
		if cmds.objExists(self.name+"_geo_group"):
			self.useGeometry = cmds.getAttr(self.name+"_geo_group.visibility")
			self.deformShape = cmds.getAttr(self.name+"_deform_posers_group.visibility")
		else:
			self.useGeometry = False
			self.deformShape = False
		
		
		optionsData = {}
		optionsData['useGeometry'] = self.useGeometry	
		optionsData['deformShape'] = self.deformShape	
		
		return optionsData	
	
	def getData(self):
		data = super(self.__class__, self).getData()

		data['useGeometry'] = self.useGeometry
		data['deformShape'] = self.deformShape

		return data		
	
	def setData(self, data, sym=False, namingForce=False):
		super(self.__class__, self).setData(data, sym, namingForce)

		if self.useGeometry:
			self.useGeometryToggle()

	def useGeometryToggle(self, w=None):
		sel = cmds.ls(sl=1)
		v = cmds.getAttr(self.name+"_geo_group.visibility")
		
		if v:
			try:
				cmds.parent(self.name+"_geo_group", self.name+"_output")
			except: pass
			cmds.hide(self.name+"_geo_group")		
			cmds.setAttr(self.name+"_deform_posers_group.visibility", False)
		else:
			try:
				cmds.parent(self.name+"_geo_group", "geo")
			except: pass
			cmds.showHidden(self.name+"_geo_group")
			
		cmds.select(sel)
		
		if w:
			self.updateOptionsPage(w)

	def deformToggle(self):
		v = cmds.getAttr(self.name+"_deform_posers_group.visibility")
		
		cmds.setAttr(self.name+"_deform_posers_group.visibility", not v)


	def updateOptionsPage(self, widget):
		self.useGeometry = self.getOptions()['useGeometry']
		self.deformShape = self.getOptions()['deformShape']

		widget.useGeometry_checkBox.setChecked(self.useGeometry)

		widget.deformShape_checkBox.setEnabled(self.useGeometry)
		widget.deformShape_checkBox.setChecked(self.deformShape)
