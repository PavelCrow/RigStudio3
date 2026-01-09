import maya.cmds as cmds
from functools import partial

from ... import utils, module


class Belt(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False 
		self.jointsCount = 12

	def connectSignals(self, mainInstance, widget): 
		widget.set_btn.clicked.connect(partial(self.rebuildJoints, widget=widget))

	def rebuildJoints(self, jointsCount=0, widget=None):
		if widget:
			jointsCount =  widget.jointsCount_spinBox.value()

		# Clear
		cmds.delete(cmds.listRelatives(self.name+"_root_outJoint"))
		if cmds.objExists(self.name+"_crv_*_mpath"):
			cmds.delete(self.name+"_crv_*_mpath")

		cmds.delete(self.name+"_root_skinJoint")

		# create joints
		step = 1/jointsCount
		for i in range(jointsCount):
			name = f"{self.name}_crv_{i}_"
			j = cmds.joint(n=name+"outJoint")
			cmds.parent(j, self.name+"_root_outJoint")
			mp = cmds.createNode("motionPath", n=name+"mPath")
			cmds.connectAttr(mp+".allCoordinates", j+".translate")
			cmds.connectAttr(mp+".rotate", j+".rotate")
			cmds.setAttr(mp+".fractionMode", 0)
			cmds.setAttr(mp+".worldUpType", 2)
			cmds.connectAttr(self.name+"_base.worldMatrix[0]", mp+".worldUpMatrix")
			cmds.setAttr(mp+".frontAxis", 0)
			cmds.setAttr(mp+".upAxis", 1)
			cmds.connectAttr(self.name+"_crvShape.worldSpace[0]", mp+".geometryPath")
			cmds.setAttr(mp+".uValue", step*i)

		self.addSkinJoints()


	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	
	
	def getOptions(self):
		optionsData = {}

		self.jointsCount = len(cmds.listRelatives("belt_root_outJoint"))

		optionsData['jointsCount'] = self.jointsCount	

		return optionsData
	
	
	def updateOptionsPage(self, widget): #
		self.getData()

		widget.jointsCount_spinBox.setValue(self.jointsCount)

	def setData(self, data, sym=False, namingForce=False, load="all"): 
		super(self.__class__, self).setData(data, sym, namingForce, load)

		if self.jointsCount != data['optionsData']["jointsCount"]:
			self.rebuildJoints(data['optionsData']["jointsCount"])
