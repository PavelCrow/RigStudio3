import maya.cmds as cmds
import pymel.core as pm
from functools import partial

from ... import utils, module, controller

class Wing(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
		self.fingersCount = 20
		self.jointsCount = 8
		
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))		
	
	def updateOptionsPage(self, widget):
		self.fingersCount = self.getOptions()['fingersCount']
		widget.fingersCount_spinBox.setValue(self.fingersCount)	

		self.jointsCount = self.getOptions()['jointsCount']
		widget.jointsCount_spinBox.setValue(self.jointsCount)	

	def getOptions(self):
		jointsCount = 0
		for j in cmds.listRelatives(self.name+'_feather_0_0_joint', allDescendents=1, type='joint' ):
			jointsCount += 1
		self.jointsCount = jointsCount + 1

		fingersCount = 0
		for j in cmds.listRelatives(self.name+'_root_outJoint', allDescendents=0 ) or []:
			fingersCount += 1
		self.fingersCount = fingersCount

		optionsData = {}
		optionsData['jointsCount'] = self.jointsCount
		optionsData['fingersCount'] = self.fingersCount

		return optionsData
	
	def getData(self):
		data = super(self.__class__, self).getData()

		self.fingersCount = self.getOptions()['fingersCount']
		self.jointsCount = self.getOptions()['jointsCount']
		data['fingersCount'] = self.fingersCount	
		data['jointsCount'] = self.jointsCount	

		return data	

	def setData(self, data, sym=False, namingForce=False):
		super(self.__class__, self).setData(data, sym, namingForce)

		if self.jointsCount != data["jointsCount"] or self.fingersCount != data["fingersCount"]:
			self.generateFingers(data["fingersCount"], data["jointsCount"])
			self.addSkinJoints()
	
	def rebuildWithNewOptions(self, mainInstance, widget):
		self.generateFingers(widget.fingersCount_spinBox.value(), widget.jointsCount_spinBox.value())
		self.addSkinJoints()

		opp_mod = utils.getOpposite(self.name+"_mod")
		if cmds.objExists(opp_mod) and opp_mod != self.name+"_mod":
			opp_m = utils.getModuleInstance(utils.getOpposite(self.name))
			opp_m.generateFingers(widget.fingersCount_spinBox.value(), widget.jointsCount_spinBox.value())
			opp_m.addSkinJoints()
		
	def generateFingers(self, feathersCount, chainLengh):
		name = self.name
		detail_group = name+'_detail_group'
		
		cmds.delete(detail_group)
		cmds.delete(cmds.listRelatives(name+'_root_outJoint'))
		trash_nodes = cmds.ls(name+"_feather_*_pointOnCurveInfo")
		cmds.delete(trash_nodes)
		cmds.delete(name+"_root_joint")
		
		pm.group(empty=1, n=detail_group)
		pm.parent(detail_group, name+"_controls")
		utils.resetAttrs(detail_group)
		pm.setAttr(detail_group+".inheritsTransform", 0)
		cmds.connectAttr(name+"_control.addControls", detail_group+".visibility")
		
		for f in range(feathersCount):
			step = 1.0/(feathersCount-1)*f
			joints = []
			
			gr = pm.group(empty=1, n="%s_%s_group" %(name, f))
			cmds.sets(gr.name(), e=1, forceElement=name+'_nodesSet')

			for i in range(chainLengh):
				pm.select(clear=1)
				j = pm.joint(n=name+"_feather_%s_"%f+str(i)+"_outJoint")
				if not cmds.getAttr("main.jointsVis"):
					cmds.setAttr(j+".drawStyle", 2)
		
				joints.append(j)
				cmds.sets(j.name(), e=1, forceElement=name+'_skinJointsSet')
				cmds.sets(j.name(), e=1, forceElement=name+'_nodesSet')
		
				if i > 0:
					pm.parent(j, joints[i-1])
					j.tx.set(1)
			
			pm.parent(joints[0], gr)
		
			points = [ (x*2,0,0) for x in range(4) ]
			crv = pm.curve(d=3, p=points, n=name+"_feather_%s_crv" %f)
			cmds.sets(crv.name(), e=1, forceElement=name+'_nodesSet')
			sCrv = crv.getShape()
			cvs = sCrv.getCVs()
			pm.parent(crv, gr)
			pm.hide(crv)
			
			for i in range(4):
				# male locator
				loc = pm.spaceLocator(n=crv+"_"+str(i+1)+'_loc')
				cmds.sets(loc.name(), e=1, forceElement=name+'_nodesSet')
				loc.hide()
				pm.parent(loc, gr)
		
				# move locator to cv
				cv = cvs[i]
				loc.setTranslation((cv.x,cv.y,cv.z))
		
				pcu = pm.createNode('pointOnCurveInfo', n=name+'_feather_%s_%s_pointOnCurveInfo' %(i+1, f))
				cmds.sets(pcu.name(), e=1, forceElement=name+'_nodesSet')
				pm.connectAttr(name+'_curve_%sShape.worldSpace[0]' %(i), pcu.inputCurve)
				pcu.position >> loc.t
				pcu.parameter.set(step)
		
				# connect loc to cv
				pm.connectAttr(loc.worldPosition[0], sCrv.controlPoints[i])
			
			if f > 0:
				con = pm.aimConstraint(name+'_feather_'+str(f-1)+'_crv_1_loc', name+'_feather_'+str(f)+'_crv_1_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', 1,0,0)
				pm.setAttr(con+'.upVector', 0,0,1)
				pm.connectAttr(name+'_feather_'+str(f)+'_crv_2_loc.worldMatrix', con.worldUpMatrix)
		
				con = pm.aimConstraint(name+'_feather_'+str(f)+'_crv_1_loc', name+'_feather_'+str(f)+'_crv_4_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', 0,0,-1)
				pm.setAttr(con+'.upVector', 1,0,0)
				pm.connectAttr(name+'_feather_'+str(f-1)+'_crv_4_loc.worldMatrix', con.worldUpMatrix)
			if f == 1: 
				con = pm.aimConstraint(name+'_feather_1_crv_1_loc', name+'_feather_0_crv_1_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', -1,0,0)
				pm.setAttr(con+'.upVector', 0,0,1)
				pm.connectAttr(name+'_feather_0_crv_4_loc.worldMatrix', con.worldUpMatrix)
		
				con = pm.aimConstraint(name+'_feather_1_crv_4_loc', name+'_feather_0_crv_4_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', -1,0,0)
				pm.setAttr(con+'.upVector', 0,0,-1)
				pm.connectAttr(name+'_feather_0_crv_2_loc.worldMatrix', con.worldUpMatrix)

			
			# make spline ik
			pm.select(joints[0], joints[-1], crv)
			ikh = pm.ikHandle(sol='ikSplineSolver', ccv=0, pcv=0, ns=2, n=name+'_%s_ikHandle' %f)[0]
			cmds.sets(ikh.name(), e=1, forceElement=name+'_nodesSet')
			ikh.dTwistControlEnable.set(1)
			ikh.dWorldUpType.set(4)
			pm.connectAttr(name+'_feather_'+str(f)+'_crv_1_loc.worldMatrix[0]', ikh.dWorldUpMatrix)
			pm.connectAttr(name+'_feather_'+str(f)+'_crv_4_loc.worldMatrix[0]', ikh.dWorldUpMatrixEnd)
			pm.parent(ikh, gr)
			ikh.hide()
		
			l = pm.spaceLocator(n=name+'_feather_'+str(f)+'_twistReader_loc')
			cmds.sets(l.name(), e=1, forceElement=name+'_nodesSet')
			pm.parent(l, name+'_feather_'+str(f)+'_crv_1_loc')
			l.t.set(0,0,0)
			pm.orientConstraint(name+'_feather_'+str(f)+'_crv_4_loc', l, mo=0)
			l.rotateOrder.set(1)
		
			l.rz >> ikh.twist
		
			if f > 0 and f < feathersCount:
				step = 1.0/(feathersCount-1)*f
		
				for n in range(1, 5):
					pc1 = pm.createNode('pointOnCurveInfo', n=name+'_%s_%s_sample_pointOnCurveInfo' %(n, f))
					cmds.sets(pc1.name(), e=1, forceElement=name+'_nodesSet')
					pm.connectAttr(name+'_sample_%s_crvShape.worldSpace[0]' %n, pc1.inputCurve)
					pc1.parameter.set(step)
					pm.connectAttr(pc1.positionX, name+'_feather_%s_%s_pointOnCurveInfo.parameter' %(n, f))

			pm.parent(joints[0], name+"_root_outJoint")
			utils.removeTransformParentJoint(joints[0].name())
			pm.parent(gr, name+"_detail_group")

			
			# add feather controls
			for n in range(1, 5):
				c = controller.Control()
				c.create(name+"_feather_%s_%s" %(n, f), shape="circle", joint=False)
				cmds.select(c.name+"Shape.cv[0:7]")
				cmds.scale(0.2, 0.2, 0.2, ocp=1)
				cmds.rotate(90, 0, 0, os=1, fo=1)
				utils.lockChannels(c.name)

				l = cmds.spaceLocator(n=c.name+'_loc')
				cmds.parent(l,c.name)
				c_gr = c.name+"_group"
				if n==1:
					cmds.parent(c_gr, name+'_feather_'+str(f)+'_twistReader_loc')
					utils.resetAttrs(c_gr)
					cmds.showHidden(name+'_feather_'+str(f)+'_twistReader_loc', crv+"_1_loc")
					cmds.hide(name+'_feather_'+str(f)+'_twistReader_locShape', crv+"_1_locShape")
				else:
					cmds.parent(c_gr, name+"_feather_%s_%s" %(n-1, f))
					utils.resetAttrs(c_gr)
				if n==4:
					pm.connectAttr(l[0]+'.worldMatrix[0]', ikh.dWorldUpMatrixEnd, f=1)

				# connect curve shape
				cmds.connectAttr(l[0]+".worldPosition[0]", sCrv.name()+".controlPoints[%s]" %(n-1), f=1)
				cmds.hide(l)

			# connect controls groups
			gr_1 = name+"_feather_1_%s_group" %(f)
			gr_2 = name+"_feather_2_%s_group" %(f)
			gr_3 = name+"_feather_3_%s_group" %(f)
			gr_4 = name+"_feather_4_%s_group" %(f)
			mm1 = cmds.createNode("multMatrix", n=gr_2+"_multMatrix")
			mm2 = cmds.createNode("multMatrix", n=gr_2+"_multMatrix_2")
			dm = cmds.createNode("decomposeMatrix", n=gr_2+"_decomposeMatrix")
			im = cmds.createNode("inverseMatrix", n=gr_2+"_inverseMatrix")

			# connect gr_2
			cmds.connectAttr(name+"_feather_%s_crv_2_loc.matrix" %(f), mm1+".matrixIn[0]")
			cmds.connectAttr(name+'_feather_%s_twistReader_loc.matrix' %(f), mm2+".matrixIn[0]")
			cmds.connectAttr(name+"_feather_%s_crv_1_loc.matrix" %(f), mm2+".matrixIn[1]")
			cmds.connectAttr(mm2+".matrixSum", im+".inputMatrix")
			cmds.connectAttr(im+".outputMatrix", mm1+".matrixIn[1]")
			cmds.connectAttr(mm1+".matrixSum", dm+".inputMatrix")
			cmds.connectAttr(dm+".outputTranslate", gr_2+".translate")

			# connect gr_3
			mm1 = cmds.createNode("multMatrix", n=gr_3+"_multMatrix")
			mm2 = cmds.createNode("multMatrix", n=gr_3+"_multMatrix_2")
			dm = cmds.createNode("decomposeMatrix", n=gr_3+"_decomposeMatrix")
			im = cmds.createNode("inverseMatrix", n=gr_3+"_inverseMatrix")

			cmds.connectAttr(gr_2+".matrix", mm1+".matrixIn[0]")
			cmds.connectAttr(gr_2+"_multMatrix_2.matrixSum", mm1+".matrixIn[1]")
			cmds.connectAttr(mm1+".matrixSum", im+".inputMatrix")
			cmds.connectAttr(name+"_feather_%s_crv_3_loc.matrix" %(f), mm2+".matrixIn[0]")
			cmds.connectAttr(im+".outputMatrix", mm2+".matrixIn[1]")
			cmds.connectAttr(mm2+".matrixSum", dm+".inputMatrix")
			cmds.connectAttr(dm+".outputTranslate", gr_3+".translate")

			# connect gr_4
			mm1 = cmds.createNode("multMatrix", n=gr_4+"_multMatrix")
			mm2 = cmds.createNode("multMatrix", n=gr_4+"_multMatrix_2")
			dm = cmds.createNode("decomposeMatrix", n=gr_4+"_decomposeMatrix")
			im = cmds.createNode("inverseMatrix", n=gr_4+"_inverseMatrix")

			cmds.connectAttr(gr_3+".matrix", mm1+".matrixIn[0]")
			cmds.connectAttr(gr_3+"_multMatrix.matrixSum", mm1+".matrixIn[1]")
			cmds.connectAttr(mm1+".matrixSum", im+".inputMatrix")
			cmds.connectAttr(name+"_feather_%s_crv_4_loc.matrix" %(f), mm2+".matrixIn[0]")
			cmds.connectAttr(im+".outputMatrix", mm2+".matrixIn[1]")
			cmds.connectAttr(mm2+".matrixSum", dm+".inputMatrix")
			cmds.connectAttr(dm+".outputTranslate", gr_4+".translate")




		for f in range(feathersCount):
			# set chain length
			crv = pm.PyNode(name+"_feather_%s_crv" %f)
			sCrv = crv.getShape()
			ci = pm.createNode('curveInfo', n=name+'_%s_curveInfo' %f)
			sCrv.worldSpace[0] >> ci.inputCurve
			md = pm.createNode('multiplyDivide', n=name+'_%s_multiplyDivide' %f)
			ci.arcLength >> md.input1X
			md.operation.set(2)
			md.input2X.set(chainLengh-1)
			sc = ci.arcLength.get() / (chainLengh-1)
		
			for j in pm.listRelatives(name+"_feather_"+str(f)+"_0_outJoint", allDescendents=1, type='joint'):
				if i > 0:
					j.tx.set(sc)
		
			pm.delete(md, ci)
		
		# length
		for i in range(feathersCount):
			root_ci = cmds.createNode("pointOnCurveInfo", n=name+"_feather_1_%s_init_pointOnCurveInfo" %i)
			if i > 0:
				cmds.connectAttr(name+"_1_%s_sample_pointOnCurveInfo.positionX" %i, root_ci+".parameter")
			cmds.connectAttr(name+"_root_init_curveShape.worldSpace[0]", root_ci+".inputCurve")

			tip_ci = cmds.createNode("pointOnCurveInfo", n=name+"_feather_4_%s_init_pointOnCurveInfo" %i)
			if i > 0:
				cmds.connectAttr(name+"_4_%s_sample_pointOnCurveInfo.positionX" %i, tip_ci+".parameter")
			cmds.connectAttr(name+"_tip_init_curveShape.worldSpace[0]", tip_ci+".inputCurve")

			dist = cmds.createNode("distanceBetween", n=name+"_feather_%s_init_distanceBetween" %i)
			cmds.connectAttr(root_ci+".position", dist+".point1")
			cmds.connectAttr(tip_ci+".position", dist+".point2")

			ci = cmds.createNode("curveInfo", n=name+"_feather_%s_curveInfo" %i)
			cmds.connectAttr(name+"_feather_%s_crvShape.worldSpace[0]" %i, ci+".inputCurve")

			mult1 = cmds.createNode("multiplyDivide", n=name+"_feather_%s_multiplyDivide" %i)
			cmds.setAttr(mult1+".operation", 2)
			cmds.connectAttr(ci+".arcLength", mult1+".input1X")
			cmds.connectAttr(name+"_root_connector_decomposeMatrix.outputScaleX", mult1+".input2X")

			mult2 = cmds.createNode("multiplyDivide", n=name+"_feather_%s_multiplyDivide_2" %i)
			cmds.setAttr(mult2+".operation", 2)
			# cmds.connectAttr(dist+".distance", mult2+".input1X")
			# cmds.connectAttr(dist+".distance", mult2+".input2X")
			cmds.connectAttr(mult1+".outputX", mult2+".input1Y")
			cmds.setAttr(mult2+".input2Y", chainLengh-1)

			for n in range(chainLengh-1):
				# cmds.connectAttr(mult2+".outputX", name+"_feather_%s_%s_outJoint.scaleX" %(i,n))
				cmds.connectAttr(mult2+".outputY", name+"_feather_%s_%s_outJoint.translateX" %(i,n+1))
		
	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()
		if self.parent:
			cmds.parent(self.name+"_root_joint", self.parent.replace("outJoint", "joint"))

	def connect(self, target, opposite=False, makeSeamless=False):
		super(self.__class__, self).connect(target, opposite, makeSeamless)
		
		# # Connect inbetween attrs
		if opposite:
			oppModuleName = utils.getOpposite(self.name)
			for i in range(1, 5):
				for n in range(1, 5):
					cmds.connectAttr(oppModuleName+"_mod.inbetween_%s_%s" %(i, n), self.name+"_mod.inbetween_%s_%s" %(i, n), f=1)
		
