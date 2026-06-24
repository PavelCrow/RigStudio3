import maya.cmds as cmds
from functools import partial

from ... import utils, module
	
class Spine(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()
		
		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
		self.jointsCount = 5

	def connect(self, target, opposite=False, makeSeamless=False):
		super(self.__class__, self).connect(target, opposite=False, makeSeamless=False)		

		# reroot end skin joint after connect
		# last_id = len(cmds.listRelatives(self.name+"_surf_joints"))
		
		# cmds.parent(self.name+"_end_skinJoint", self.name+"_local_%s_skinJoint" %last_id)
		# utils.removeTransformParentJoint(self.name+"_end_skinJoint")

		# cmds.setAttr(self.name+"_end_skinJoint.jointOrient", 0,0,0)
	
	def connectSignals(self, mainInstance, w): #
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))
	
	def updateOptionsPage(self, widget): #
		self.jointsCount = self.getOptions()['jointsCount']
		
		widget.jointsCount_spinBox.setValue(self.jointsCount)

	def getOptions(self): #
		self.jointsCount = len(cmds.listRelatives(self.name+'_surf_joints'))

		optionsData = {}
		optionsData['jointsCount'] = self.jointsCount

		return optionsData	

	def getData(self): #
		data = super(self.__class__, self).getData()
		
		self.jointsCount = self.getOptions()['jointsCount']
		data['jointsCount'] = self.jointsCount	

		return data	

	def setData(self, data, sym=False, namingForce=False, load="all"): #
		super(self.__class__, self).setData(data, sym, namingForce, load)
		# print (234, data["jointsCount"], self.jointsCount)
		# try:
		if self.jointsCount != data["jointsCount"]:
			self.rebuildJoints(data["jointsCount"])
		# except: print ("NO DATA")

	def rebuildWithNewOptions(self, mainInstance, widget): #
		self.rebuildJoints(widget.jointsCount_spinBox.value())
	
	def rebuildJoints(self, count):
		name = self.name

		cmds.parent(name+'_end_outJoint', name+'_root_outJoint')
		cmds.parent(name+'_end_skinJoint', name+'_root_skinJoint')
		utils.removeTransformParentJoint(name+'_end_skinJoint')

		cmds.delete(name+'_local_1_skinJoint')
		cmds.delete(name+'_local_1_outJoint')
		for f in cmds.listRelatives(name+'_surf_joints'):
			cmds.delete(f)
		for f in cmds.listRelatives(name+'_joints_initLocs'):
			cmds.delete(f)

		for i in range(count):
			pos = (1/(count+1)*(i+1))
			j = cmds.joint(n=name+'_surf_%s_joint' %(i+1))
			utils.addModuleNameAttr(j, name)
			cmds.parent(j, name+"_surf_joints")
			utils.resetAttrs(j)
			utils.resetJointOrient(j)
			oj = cmds.joint(n=name+'_local_%s_outJoint' %(i+1))
			utils.addModuleNameAttr(oj, name)
			if i == 0: pj = f"{name}_root_outJoint"
			else: pj = f"{name}_local_{i}_outJoint"
			cmds.parent(oj, pj)
			utils.resetJointOrient(oj)
			l = cmds.spaceLocator(n=f"{name}_local_{i+1}_initLoc")[0]
			cmds.parent(l, name+'_joints_initLocs')
			cmds.setAttr(j+".segmentScaleCompensate", 0)


			cmds.addAttr(oj, ln="pos", at="double", min=0, max=1, dv=0, k=1 )
			cmds.setAttr(oj+".pos", pos)
			cmds.setAttr(oj+'.drawStyle', 2)

			cmds.connectAttr(oj+".pos", f"{name}_uvPin.coordinate[{i}].coordinateU")
			cmds.connectAttr(oj+".pos", f"{name}_init_uvPin.coordinate[{i}].coordinateU")
			cmds.setAttr(f"{name}_uvPin.coordinate[{i}].coordinateV", 0.5)
			cmds.setAttr(f"{name}_init_uvPin.coordinate[{i}].coordinateV", 0.5)

			cmds.connectAttr(f"{name}_uvPin.outputMatrix[{i}]", f"{j}.offsetParentMatrix")
			cmds.connectAttr(f"{name}_init_uvPin.outputMatrix[{i}]", f"{l}.offsetParentMatrix")
			utils.connectByMatrix(oj, [j, pj], ['worldMatrix[0]', 'worldInverseMatrix[0]'], attrs=['t', 'r'], module_name=name)
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", oj+".sy")
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", oj+".sz")
			
		cmds.select(name+'_root_skinJoint')
		r = cmds.getAttr(name+'_end_skinJoint.radius')
		for i in range(count):
			j = cmds.joint(n=name+'_local_%s_skinJoint' %(i+1))
			utils.addModuleNameAttr(j, name)
			utils.connectByMatrix(j, [name+f'_local_{i+1}_outJoint', j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], attrs=['t', 'r', 's', 'shr'], module_name=name)
			cmds.setAttr(j+".segmentScaleCompensate", 0)
			cmds.setAttr(j+".radius", r)
			cmds.setAttr(j+'.drawStyle', 0)
			cmds.select(j)

		cmds.parent(name+'_end_outJoint', oj)
		cmds.setAttr(name+'_end_outJoint.drawStyle', 0)
		cmds.parent(name+'_end_skinJoint', j)
		utils.removeTransformParentJoint(name+'_end_skinJoint')
		utils.resetJointOrient(name+'_end_skinJoint')
	
	def delete(self):
		# cmds.delete(self.name+"_multiplyDivide1846")
		super(self.__class__, self).delete()
	
	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()
		
		joints = cmds.sets(self.name+'_skinJointsSet', q=1)
		
		for oj in joints:		
			sj = oj.replace("outJoint", "skinJoint")
			cmds.setAttr(sj.replace("outJoint", "skinJoint")+".segmentScaleCompensate", 0)
			utils.connectByMatrix(sj, [oj, sj], ['worldMatrix[0]', 'parentInverseMatrix[0]'], attrs=['t', 'r', 's', 'shr'], module_name=self.name)

		cmds.setAttr(self.name+"_root_skinJoint.segmentScaleCompensate", 0)

	def bake(self):
		super(self.__class__, self).bake(forceDelete=[self.name+"_decomposeMatrix91",self.name+"_decomposeMatrix92",self.name+"_decomposeMatrix93"])
