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

	def connect(self, target):
		super(self.__class__, self).connect(target)
		
		# create offset rotate root for quadrupped spine (posers is strighten in horizontal)
		if cmds.getAttr(self.name + "_end_poser.tz") > cmds.getAttr(self.name + "_end_poser.ty"):
			l = cmds.duplicate(self.name+"_root_initLoc", n=self.name+"_root_poserOrient_offset")[0]
			utils.resetAttrs(l)
			
			cmds.connectAttr(l+".worldMatrix[0]", self.name+"_root_connector_multMat.matrixIn[0]", f=1)
	
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))
	
	def updateOptionsPage(self, widget):
		self.jointsCount = self.getOptions()['jointsCount']
		
		widget.jointsCount_spinBox.setValue(self.jointsCount)

	def getOptions(self):
		jointsCount = 0
		for j in cmds.listRelatives(self.name+'_outJoints', allDescendents=1, type='joint' ):
			if not "squash" in j:
				jointsCount += 1
		
		self.jointsCount = jointsCount - 3

		optionsData = {}
		optionsData['jointsCount'] = self.jointsCount

		return optionsData	

	def getData(self):
		data = super(self.__class__, self).getData()
		
		self.jointsCount = self.getOptions()['jointsCount']
		data['jointsCount'] = self.jointsCount	

		return data	

	def setData(self, data, sym=False, namingForce=False):
		super(self.__class__, self).setData(data, sym, namingForce)
		
		try:
			if self.jointsCount != data["jointsCount"]:
				self.rebuildJoints(data["jointsCount"])
		except: print ("NO DATA")

	def rebuildWithNewOptions(self, mainInstance, widget):
		self.rebuildJoints(widget.jointsCount_spinBox.value())
	
	def rebuildJoints(self, count):
		name = self.name
		
		cmds.parent(name+'_local_end_joint', name+'_root_joint')
		utils.removeTransformParentJoint(name+'_local_end_joint')
		cmds.delete(name+'_local_1_joint')
		cmds.parent(name+'_local_end_outJoint', name+'_root_outJoint')
		utils.removeTransformParentJoint(name+'_local_end_outJoint')
		cmds.delete(name+'_local_1_outJoint')
		
		# joints
		for f in cmds.listRelatives(name+'_bendJoints'):
			cmds.delete(f)
	
		bend_joints = []
		follicles = []
		for i in range(count):
			f = cmds.createNode("follicle")
			fT = cmds.listRelatives(f, p=1)[0]
			fT = cmds.rename(fT, name+'_local_%s_follicle' %(i+1))
			f = fT + "Shape"
			utils.addModuleNameAttr(fT, name)
			cmds.connectAttr(f+".outTranslate", fT+".t")
			cmds.connectAttr(f+".outRotate", fT+".r")
			follicles.append(f)
	
			cmds.connectAttr(name+"_bend_surfShape.worldSpace[0]", f+".inputSurface")
			cmds.setAttr( f+".parameterV", 0.5 )
	
			mp = cmds.createNode("motionPath")
			cmds.connectAttr(name+"_bend_crvShape.worldSpace[0]", mp+".geometryPath")
			cmds.setAttr( mp+".fractionMode", 1 )
			cmds.setAttr( mp+".uValue", (i+1)*1.0/(count+1) )
	
			near = cmds.createNode("nearestPointOnCurve")
			cmds.connectAttr(name+"_bend_crvShape.worldSpace[0]", near+".inputCurve")
			cmds.connectAttr(mp+".allCoordinates", near+".inPosition")
			u = cmds.getAttr( near+".parameter")
			cmds.setAttr( f+".parameterU", u )
			cmds.delete(near)
	
			cmds.select(fT)
			j = cmds.joint(n=name+'_bend_%s_joint' %(i+1))
			bend_joints.append(j)
			utils.addModuleNameAttr(j, name)
	
			cmds.parent(fT, name+"_bendJoints")
	
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", j+".sy")
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", j+".sz")
		
		for i in range(count-1):
			con = cmds.aimConstraint(bend_joints[i+1], bend_joints[i] , mo=0, n=bend_joints[i]+"_aimConstraint")[0]
			utils.addModuleNameAttr(con, name)
			cmds.setAttr(con+'.worldUpType', 2)
			cmds.setAttr(con+'.worldUpVectorY', -1)
			cmds.connectAttr(follicles[i]+".worldMatrix[0]", con+".worldUpMatrix")
		con = cmds.aimConstraint(name+"_chest_out", bend_joints[count-1], n=bend_joints[count-1]+"_aimConstraint")[0]
		utils.addModuleNameAttr(con, name)
		cmds.setAttr(con+'.worldUpType', 2)
		cmds.setAttr(con+'.worldUpVectorY', -1)
		cmds.connectAttr(follicles[count-1]+".worldMatrix[0]", con+".worldUpMatrix")
		
		
		# init locs
		for f in cmds.listRelatives(name+'_localJoints'):
			cmds.delete(f)
	
		locs = []
		follicles = []
		for i in range(count):
			f = cmds.createNode("follicle")
			fT = cmds.listRelatives(f, p=1)[0]
			fT = cmds.rename(fT, name+'_local_%s_foll' %(i+1))
			f = fT + "Shape"
			utils.addModuleNameAttr(fT, name)
			cmds.connectAttr(f+".outTranslate", fT+".t")
			cmds.connectAttr(f+".outRotate", fT+".r")
			follicles.append(f)
			
			cmds.connectAttr(name+"_root_poser_decMat.outputScaleX", fT+".scaleX")
			cmds.connectAttr(name+"_root_poser_decMat.outputScaleY", fT+".scaleY")
			cmds.connectAttr(name+"_root_poser_decMat.outputScaleZ", fT+".scaleZ")			
	
			cmds.connectAttr(name+"_init_surf.worldSpace[0]", f+".inputSurface")
			cmds.setAttr( f+".parameterV", 0.5 )
			
			mp = cmds.createNode("motionPath")
			cmds.connectAttr(name+"_bend_crvShape.worldSpace[0]", mp+".geometryPath")
			cmds.setAttr( mp+".fractionMode", 1 )
			cmds.setAttr( mp+".uValue", (i+1)*1.0/(count+1) )
			
			near = cmds.createNode("nearestPointOnCurve")
			cmds.connectAttr(name+"_bend_crvShape.worldSpace[0]", near+".inputCurve")
			cmds.connectAttr(mp+".allCoordinates", near+".inPosition")
			u = cmds.getAttr( near+".parameter")
			cmds.setAttr( f+".parameterU", u )
			cmds.delete(near)
			
			l = cmds.spaceLocator(n=name+'_local_%s_initLoc' %(i+1))[0]
			locs.append(l)
			utils.addModuleNameAttr(l, name)
			cmds.parent(l, fT)
			utils.resetAttrs(l)
			
			cmds.parent(fT, name+"_localJoints")
		
		for i in range(count-1):
			con = cmds.aimConstraint(locs[i+1], locs[i] , mo=0, n=locs[i]+"_aimConstraint")[0]
			utils.addModuleNameAttr(con, name)
			cmds.setAttr(con+'.worldUpType', 2)
			cmds.setAttr(con+'.worldUpVectorY', -1)
			cmds.connectAttr(follicles[i]+".worldMatrix[0]", con+".worldUpMatrix")
		con = cmds.aimConstraint(name+"_end_poser", locs[count-1], n=locs[count-1]+"_aimConstraint")[0]
		utils.addModuleNameAttr(con, name)
		cmds.setAttr(con+'.worldUpType', 2)
		cmds.setAttr(con+'.worldUpVectorY', -1)
		cmds.connectAttr(follicles[count-1]+".worldMatrix[0]", con+".worldUpMatrix")
	
	
	
		out_joints = []
		cmds.select(name+'_root_outJoint')
		for i in range(count):
			j_out = cmds.joint(n=name+'_local_%s_outJoint' %(i+1))
			utils.addModuleNameAttr(j_out, name)
			out_joints.append(j_out)
	
		for i in range(count):
			utils.connectByMatrix(out_joints[i], [bend_joints[i], out_joints[i]], ['worldMatrix[0]', 'parentInverseMatrix[0]'], name, attrs=['t', 'r'])
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", out_joints[i]+".scaleY")
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", out_joints[i]+".scaleZ")		
	
		skin_joints = []
		cmds.select(name+'_root_joint')
		for i in range(count):
			j = cmds.joint(n=name+'_local_%s_joint' %(i+1))
			utils.addModuleNameAttr(j, name)
			skin_joints.append(j)
	
		for i in range(count):
			utils.connectByMatrix(skin_joints[i], [bend_joints[i], skin_joints[i]], ['worldMatrix[0]', 'parentInverseMatrix[0]'], name)
			cmds.disconnectAttr(name+"_local_%s_joint_decMat.outputScaleX" %(i+1), skin_joints[i]+".scaleX")
			cmds.disconnectAttr(name+"_local_%s_joint_decMat.outputScaleY" %(i+1), skin_joints[i]+".scaleY")
			cmds.disconnectAttr(name+"_local_%s_joint_decMat.outputScaleZ" %(i+1), skin_joints[i]+".scaleZ")
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", skin_joints[i]+".scaleY")
			cmds.connectAttr(name+"_squash_blendTwoAttr.output", skin_joints[i]+".scaleZ")
	
		cmds.parent(name+'_local_end_joint', skin_joints[count-1])
		utils.removeTransformParentJoint(name+'_local_end_joint')
	
		cmds.parent(name+'_local_end_outJoint', out_joints[count-1])
		utils.removeTransformParentJoint(name+'_local_end_outJoint')
	
	def delete(self):
		cmds.delete(self.name+"_multiplyDivide1846")
		super(self.__class__, self).delete()
	
	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()
		
		allJoints = cmds.listRelatives(self.name+"_root_outJoint", allDescendents=1)
		for o in allJoints:		
			if o.split("_")[-1] == 'outJoint':
				cmds.setAttr(o.replace("outJoint", "joint")+".segmentScaleCompensate", 1)

	def bake(self):
		super(self.__class__, self).bake(forceDelete=[self.name+"_decomposeMatrix91",self.name+"_decomposeMatrix92",self.name+"_decomposeMatrix93"])