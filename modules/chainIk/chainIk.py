import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import os
from functools import partial

from ...import utils, module, rigTools, controller, posers

rootPath = os.path.normpath(os.path.dirname(__file__))

# fileName = __name__.split('.')[0]
# rootPath = os.path.abspath(imp.find_module(fileName)[1])

class ChainIk(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1] # type is equal file name
		self.length = 10.0
		self.controlsCount = 5
		self.jointsCount = 10
		self.localControls = True
		self.useDynamic = False

	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))
		w.parentIsChain_btn.clicked.connect(self.rerootPosersToChain)
		w.parentIsMainPoser_btn.clicked.connect(self.rerootPosersToMainPoser)

	def create(self, options={}):
		self.root = self.name + "_mod"
		joints = []

		# import template rig
		template_path = rootPath.replace("chainIk", '_template.ma')
		utils.importFile(template_path, self.name)
		
		if options == {}:
			controlsCount = self.controlsCount
		else:
			controlsCount = options['controlsCount']
			self.controlsCount = controlsCount
			self.jointsCount = options['jointsCount']
			self.useDynamic = options['useDynamic']
		
		# create posers
		for i in range(1, controlsCount):
			poser = cmds.duplicate(self.name+'_root_poser', rr=1, n=self.name+'_element_'+str(i+1)+'_poser')[0]

			childs = pm.listRelatives(poser, allDescendents=1)
			for o in childs:
				if pm.objExists(o):
					pm.rename(o, o.replace("root", 'element_'+str(i+1)))

			mns = cmds.createNode("makeNurbSphere", name=poser+"_makeNurbSphere")
			mult = cmds.createNode("multDoubleLinear", name=poser+"_multDoubleLinear")
			cmds.connectAttr(self.name+"_mainPoser.globalSize", mult+".input1")
			cmds.connectAttr(poser+".size", mult+".input2")
			cmds.connectAttr(mult+".output", mns+".radius")
			cmds.connectAttr(mns+".outputSurface", poser+"NurbsShape.create")

			cmds.setAttr(poser+'.tx', self.length/controlsCount*float(i))	

			if i > 1:
				cmds.parent( poser, poser.replace(str(i+1)+"_poser", str(i)+"_poser") )

		cmds.parent( self.name+'_element_2_poser', self.name+'_root_poser' )
		
		# create control, groups and joint
		cu = controller.Control()
		for i in range(controlsCount):
			n = i+1
			
			ctrl = self.name+'_element_'+str(n)
			cu.create(ctrl, 'circle', colorId=18, offset=False, joint=False)
			utils.setUserAttr(ctrl, 'internalName', 'element_'+str(n))
			utils.setUserAttr(ctrl, 'type', "control")
			cmds.setAttr(ctrl+'.sx', 2)
			cmds.setAttr(ctrl+'.sy', 2)
			cmds.setAttr(ctrl+'.sz', 2)
			cmds.setAttr(ctrl+'.rz', -90)
			cmds.makeIdentity(ctrl, apply=1, r=1, s=1)
			utils.lockChannels(ctrl, ['s'])

			if self.localControls:
				ctrlLocal = self.name+'_local_element_'+str(n)
				cu.create(ctrlLocal, 'sphere', colorId=15, offset=False, joint=False)
				utils.setUserAttr(ctrlLocal, 'internalName', 'local_element_'+str(n))
				utils.setUserAttr(ctrlLocal, 'type', "control")
				utils.addModuleNameAttr(ctrlLocal, self.name)
				cmds.setAttr(ctrlLocal+'.sx', 1)
				cmds.setAttr(ctrlLocal+'.sy', 1)
				cmds.setAttr(ctrlLocal+'.sz', 1)
				cmds.makeIdentity(ctrlLocal, apply=1, r=1, s=1)
				utils.lockChannels(ctrlLocal, ['r', 's'])			
				cmds.parent(ctrlLocal, ctrl)
				utils.resetAttrs(ctrlLocal)
				cmds.sets(ctrlLocal, forceElement=self.name+'_moduleControlSet')
				cmds.sets(ctrlLocal, forceElement=self.name+'_nodesSet')
				
			cmds.sets(ctrl, forceElement=self.name+'_moduleControlSet')
			cmds.sets(ctrl, forceElement=self.name+'_nodesSet')
			cmds.group(ctrl, n=ctrl+"_group")
			jnt = cmds.joint(n=self.name+'_'+str(n)+'_outJoint')
			cmds.parent(jnt, ctrl)
			joints.append(jnt)

			# cmds.sets(jnt, e=1, forceElement=self.name+'_skinJointsSet')

			# parent
			mirror_mat = cmds.createNode('composeMatrix')
			if self.name.split("_")[0] == 'r':
				cmds.setAttr(mirror_mat+".inputScaleX", -1)			

			if i > 0:
				cmds.parent(ctrl+"_group", self.name + "_element_" + str(n-1))
				cmds.setAttr(ctrl+"_group.ty", self.length/controlsCount)
				cmds.parent(jnt, joints[i-1])
			else:
				cmds.parent(ctrl+"_group", self.name+"_controls")
				cmds.parent(jnt, self.name+"_outJoints")
				utils.connectByMatrix(self.name+'_element_1_group', [self.name+'_root_connector'] )

				decMat = pm.createNode('decomposeMatrix', n=ctrl+"_scale_decomposeMatrix")
				mult = pm.createNode('multDoubleLinear', n=ctrl+"_scale_multDoubleLinear")
				cond = pm.createNode('condition', n=ctrl+"_scale_condition")
				c = pm.PyNode(ctrl)

				c.worldMatrix[0] >> decMat.inputMatrix
				decMat.outputScaleZ >> mult.input1
				mult.input2.set(-1)
				mult.output >> cond.colorIfFalseR
				decMat.outputScaleZ >> cond.colorIfTrueR
				decMat.outputScaleZ >> cond.firstTerm
				cond.operation.set(2)

				pm.connectAttr(decMat.outputScaleX, self.name+"_outJoints.sx")
				pm.connectAttr(decMat.outputScaleY, self.name+"_outJoints.sy")
				pm.connectAttr(cond.outColorR, self.name+"_outJoints.sz")
				
			if self.localControls:
				utils.connectByMatrix(jnt, [mirror_mat, ctrlLocal, jnt], ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name, attrs=['t', 'r'] )
			else:
				utils.connectByMatrix(jnt, [mirror_mat, ctrl, jnt], ['outputMatrix', 'worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name, attrs=['t', 'r'] )			
				
			cmds.setAttr(jnt+".jointOrientX", 0)
			cmds.setAttr(jnt+".jointOrientY", 0)
			cmds.setAttr(jnt+".jointOrientZ", 0)			
			
			# add lines, connect posers
			if n > 1:
				if n == 2:
					p1 = self.name+'_root_poser'
					sec_tar = self.name+'_root_poserOrient'
				else:
					p1 = self.name+'_element_'+str(i)+'_poser'
					sec_tar = self.name+'_element_'+str(i)+'_poserOrient'

				utils.connectByMatrix(ctrl+"_group", [ctrl+"_poserOrient", sec_tar], 
				                      ['worldMatrix[0]', 'worldInverseMatrix[0]'])

				p2 = self.name+'_element_'+str(i+1)+'_poser'
				posers.connectPosers(p1, p2, name_m=self.name+"_")

				cmds.setAttr(p1+'.lineWidth', 2)
				cmds.setAttr(p2+'.lineWidth', 2)

				cmds.sets(self.name+'_element_'+str(i+1)+"_nodesSet", e=1, forceElement=self.name+"_nodesSet")
		
		cmds.delete(self.name+'_root_outJoint')
		cmds.rename(self.name+'_1_outJoint', self.name+'_root_outJoint')

		cmds.hide(self.name+'_input')

		cmds.sets(self.name+'_nodesSet', e=1, forceElement=self.name+'_sets')

		# add moduleType attr
		utils.setUserAttr(self.root, "moduleType", self.type)		

		cmds.sets(self.name+'_sets', e=1, forceElement='modules_sets' )
		cmds.select(self.name+'_moduleControlSet')
		if cmds.objExists(self.name+'_controlSet'):
			cmds.sets(e=1, add=self.name+'_controlSet' )
		else:
			cmds.sets(n=self.name+'_controlSet')
			cmds.sets(self.name+'_controlSet', e=1, forceElement='controlSet' )
		
		cmds.parent(self.root, 'modules')

		self.create2()
		self.addSkinJoints()
		
		# add init joints and locs
		init_gr = pm.duplicate(self.name+"_outJoints", n=self.name+"_initJoints")[0]
		pm.parent(init_gr, self.name+"_mainPoser")
		for o in pm.listRelatives(init_gr, allDescendents=1):
			if pm.objectType(o) == 'joint':
				pm.sets(self.name+"_skinJointsSet", e=1, rm=o)
				pm.rename(o, o.replace("outJoint", "initJoint"))
				l = pm.spaceLocator(n=o.replace("initJoint", "initLoc"))
				pm.hide(l)
				try:
					pm.parent(l, o)
				except: pass
				l.t.set(0,0,0)
				l.r.set(0,0,0)
				if not "root" in o:
					pm.connectAttr(self.name+"_length_mult.output", o+".tx")
			else:
				pm.delete(o)
				
		# make init spline ik
		pm.select(self.name+"_root_initJoint", self.name+"_%s_initJoint" %(self.jointsCount-1), self.name+'_initCrv')
		ikh = pm.ikHandle(sol='ikSplineSolver', ccv=0, pcv=0, ns=2, n=self.name+'_initIkHandle')[0]
		utils.addModuleNameAttr(ikh, self.name)
		pm.parent(ikh, self.name+"_posers")
		pm.hide(ikh)

		ikh.dTwistControlEnable.set(1)
		ikh.dWorldUpType.set(4)
		ikh.dTwistValueType.set(1)
		pm.connectAttr(self.name+'_root_poser.worldMatrix[0]', ikh.dWorldUpMatrix)
		pm.connectAttr(self.name+'_element_'+str(controlsCount)+'_poser.worldMatrix[0]', ikh.dWorldUpMatrixEnd)

		cmds.setAttr(self.name+"_outJoints.v", 1)

	def create2(self):
		name = self.name
		controlsCount = self.controlsCount
		
		# get values
		chainsCount = self.jointsCount
		generateGeo = False
		
		joints = []
		
		# create groups
		joints_gr = pm.PyNode(name+"_outJoints")
		system_gr = name+'_system'
		
		cmds.delete(name+'_root_outJoint')
		
		length = self.length
		length = length/controlsCount
		
		# get controls
		ctrls = []
		for i in range(controlsCount):
			ctrls.append( pm.PyNode( name+"_element_%s" %(i+1) ) )
		
		# create set
		cmds.select(clear=1)
		cmds.sets(n=self.name+'_skinJointsSet')
		cmds.sets(self.name+'_skinJointsSet', e=1, forceElement=self.name+'_sets' )				
		
		# create joints
		for i in range(chainsCount):
			# joint
			pm.select(clear=1)
			j = pm.joint(n=name+"_"+str(i)+"_outJoint")		
			utils.addModuleNameAttr(j, self.name)
			cmds.sets(j.name(), e=1, forceElement=self.name+'_skinJointsSet' )	
		
			if generateGeo:
				loc = pm.spaceLocator(n=name+"_"+str(i)+"_outLoc")
				pm.parent(loc, j)
				pm.hide(loc)
		
			joints.append(j)
		
			if i > 0:
				pm.parent(j, joints[i-1])
			else:
				pm.parent(j, joints_gr)
				pm.rename(j, name+"_root_outJoint")
		
		# create curve and locators
		points = [ (x*length,0,0) for x in range(controlsCount) ]
		crv = pm.curve(d=3, p=points, n=name+"_staticCrv")
		utils.addModuleNameAttr(crv.name(), self.name)	
		init_crv = pm.curve(d=3, p=points, n=name+"_initCrv")
		utils.addModuleNameAttr(init_crv.name(), self.name)	
		sCrv = crv.getShape()
		sInit_crv = init_crv.getShape()
		cvs = sCrv.getCVs()
		numCVs = sCrv.numCVs()
		init_crv.inheritsTransform.set(0)
		pm.hide(init_crv)
		
		add = pm.createNode('plusMinusAverage', n=name+'_twist_plusMinusAverage')
		utils.addModuleNameAttr(add, self.name)		
		
		for i in range(numCVs):
			# male locator
			loc = pm.spaceLocator(n=crv+"_element_"+str(i+1)+'_loc')
			loc.hide()
		
			# move locator to cv
			cv = cvs[i]
			loc.setTranslation((cv.x,cv.y,cv.z))
		
			
			if self.localControls:
				pm.parent(loc, name+"_local_element_%s" %(i+1))
			else:				
				pm.parent(loc, name+"_element_%s" %(i+1))
		
			# connect loc to cv
			pm.connectAttr(loc.worldPosition[0], sCrv.controlPoints[i])
			
			if i == 0:
				init_loc = pm.PyNode(self.name+"_root_initLocShape")
			else:
				init_loc = pm.PyNode(self.name+"_element_%s_initLocShape" %(i+1))
				
				# connect twist attribute
				pm.connectAttr(self.name+"_element_%s.rx" %(i+1), add.input1D[i-1])

			pm.connectAttr(init_loc.worldPosition[0], sInit_crv.controlPoints[i])
			
		
		# make spline ik
		pm.select(joints[0], joints[-1], crv)
		ikh = pm.ikHandle(sol='ikSplineSolver', ccv=0, pcv=0, ns=2, n=name+'_ikHandle')[0]
		utils.addModuleNameAttr(ikh, self.name)
		
		ikh.dTwistControlEnable.set(1)
		ikh.dWorldUpType.set(4)
		ikh.dTwistValueType.set(1)
		ctrls[0].worldMatrix[0] >> ikh.dWorldUpMatrix
		ctrls[-1].worldMatrix[0] >> ikh.dWorldUpMatrixEnd
		stretch_crv = crv
		
		# make dynamic control
		dynCtrl = pm.curve(d=1, p=[(0,0,0), (0,1.5,0), (1,1,0), (0,0.5,0)], k=(0, 1, 2, 3), n=name+'_control')
		utils.lockChannels(dynCtrl.name(), ['t', 'r', 's'])	
		utils.addModuleNameAttr(dynCtrl, self.name)
		utils.setUserAttr(dynCtrl.name(), 'internalName', 'control')
		utils.setUserAttr(dynCtrl.name(), 'type', "control")		
		cmds.sets(dynCtrl.name(), forceElement=self.name+'_moduleControlSet')
		cmds.sets(dynCtrl.name(), forceElement=self.name+'_controlSet')
		cmds.sets(dynCtrl.name(), forceElement=self.name+'_nodesSet')
		dynCtrl.addAttr('length', at='float', k=1, min=0, dv=1)	
		dynCtrl.addAttr('autoStretch', at='float', k=1, min=0, max=1, dv=1)
		dynCtrl.addAttr('roll', at='float', k=1)
		dynCtrl.addAttr('twist', at='float', k=1)
		dynCtrl.addAttr('stretchVolume', at='float', k=1, min=0, max=1)
		# add chain size attr
		if generateGeo:
			dynCtrl.addAttr('elementSize', at='float', k=1, min=0.001, dv=1)	
		
		
		dynCtrl.roll >> ikh.roll	
		dynCtrl.twist >> add.input1D[numCVs]
		add.output1D >> ikh.twist
		
		s = dynCtrl.getShape()
		s.overrideEnabled.set(1)
		s.overrideColor.set(20)
		pm.group(dynCtrl, n=dynCtrl+'_group')
		utils.addModuleNameAttr(dynCtrl+'_group', self.name)
		pm.parent(dynCtrl+'_group', ctrls[0]+"_group")
		
		pm.parent(crv, ikh, system_gr)
		pm.parent(init_crv, name+"_posers")
		
		# length
		initCrv_info = pm.createNode("curveInfo", n = name+'_initCurve_curveInfo')
		sInit_crv.worldSpace[0] >> initCrv_info.inputCurve
		
		# dynamic system
		if self.useDynamic:
			# add dynamic control attrs
			dynCtrl.addAttr('______________', at='enum', en="Dynamic:", k=1)
			dynCtrl.setAttr('______________', channelBox=1)
			dynCtrl.addAttr('dynamic', at='bool', k=1)
			dynCtrl.addAttr('startFrame', at='short', k=1, dv=1)
			dynCtrl.setAttr('startFrame', channelBox=1, l=0)
			dynCtrl.addAttr('dynamicWeight', at='float', k=1, min=0, max=1, dv=1)
			dynCtrl.addAttr('stiffness', at='float', k=1, min=0, max=1, dv=0.5)
			dynCtrl.addAttr('damp', at='float', k=1, min=0, dv=0.1)
	
			# create dynamic curve
			pm.select(crv)
			mel.eval('makeCurvesDynamic 2 { "1", "0", "1", "1", "0"}')
			foll = crv.worldMatrix[0].outputs()[0]
			hs = foll.outHair.outputs()[0]
			nucl = hs.currentState.outputs()[0]
			hs.active.set(0)
			
			cmds.rename(foll.name(), self.name+"_follicle")
			utils.addModuleNameAttr(foll.name(), self.name)			
			cmds.rename(hs.name(), self.name+"_hairSystem")
			utils.addModuleNameAttr(hs.name(), self.name)			
			cmds.rename(nucl.name(), self.name+"_nucleus")
			utils.addModuleNameAttr(nucl.name(), self.name)			
			cmds.rename(crv.name(), self.name+"_crv")
			utils.addModuleNameAttr(crv.name(), self.name)			

			# make connections
			dynCtrl.damp >> hs.drag
			dynCtrl.stiffness >> hs.stiffness
	
			cond_1 = pm.createNode('condition', n=name+'_1_cond')
			dynCtrl.dynamic >> cond_1.firstTerm
			cond_1.colorIfTrueR.set(1)
			cond_1.colorIfFalseR.set(3)
	
			cond_2 = pm.createNode('condition', n=name+'_1_cond')
			time = pm.PyNode('time1')
			time.outTime >> cond_2.firstTerm
			dynCtrl.startFrame >> cond_2.secondTerm
			dynCtrl.startFrame >> nucl.startFrame
			cond_1.outColorR >> cond_2.colorIfTrueR
			cond_2.operation.set(3)
			cond_2.outColorR >> hs.simulationMethod

			foll.pointLock.set(1)
			dyn_crv = foll.outCurve.outputs()[0]
			cmds.rename(dyn_crv.name(), self.name+"_dynamicCrv")
			utils.addModuleNameAttr(dyn_crv.name(), self.name)		
	
			# blendshape
			out_crv = crv.duplicate(crv, n=self.name+'_outCrv')[0]
			utils.addModuleNameAttr(out_crv.name(), self.name)	
			pm.select(crv, dyn_crv, out_crv)
			bs = pm.blendShape(n=name+"_bs")[0]
			rev = pm.createNode('reverse', n=name+'_rev')
			dynCtrl.dynamicWeight >> rev.inputX
			rev.outputX >> bs.attr(crv)
			dynCtrl.dynamicWeight >> bs.attr(dyn_crv)
			pm.connectAttr(self.name+"_outCrvShape.worldSpace[0]", ikh.inCurve, f=1)
	
			pm.parent(out_crv, system_gr)
			pm.parent(nucl, hs, foll.getParent(), system_gr)
			pm.parent(dyn_crv.getParent(), system_gr)

			cmds.setAttr(self.name+"_staticCrv_element_1_loc.ty", 0.001)
			
			stretch_crv = dyn_crv
		
		# make stretch
		crvInfo = pm.createNode('curveInfo', n=name+'_curveInfo')
		stretch_crv.worldSpace[0] >> crvInfo.inputCurve
		
		dec = pm.createNode('decomposeMatrix', n=name+'_decomposeMatrix')
		ctrls[0].worldMatrix[0] >> dec.inputMatrix
		dec.outputScale >> joints_gr.s		
		
		dec_p = pm.createNode('decomposeMatrix', n=name+'_mainPoser_decomposeMatrix')
		pm.connectAttr(name+"_mainPoser.worldMatrix[0]", dec_p.inputMatrix)
		
		blend = pm.createNode('blendColors', n=name+'_blendColors')
		dynCtrl.autoStretch >> blend.blender
		
		offsetCurve_mult = pm.createNode('multiplyDivide', n=name+'_offsetCurveMult')
		offsetCurve_mult.operation.set(2)
		crvInfo.arcLength >> offsetCurve_mult.input1X		
		initCrv_info.arcLength >> offsetCurve_mult.input2X
		
		initCurveScaled = pm.createNode('multiplyDivide', n=name+'_initCurveScaled')
		initCurveScaled.operation.set(2)
		initCrv_info.arcLength >> initCurveScaled.input1X
		pm.connectAttr(name+"_mainPoser_decomposeMatrix.outputScaleX", initCurveScaled.input2X)
		
		chainLength_mult = pm.createNode("multiplyDivide", n = name+'_chainLength')
		chainLength_mult.operation.set(2)		
		initCurveScaled.outputX >> chainLength_mult.input1X
		chainLength_mult.input2X.set(chainsCount-1)

		lenght_mult = pm.createNode("multDoubleLinear", n = name+'_length_mult')
		dynCtrl.length >> lenght_mult.input1
		chainLength_mult.outputX >> lenght_mult.input2
		lenght_mult.output >> blend.color2R

		currentScale_mult = pm.createNode("multiplyDivide", n = name+'_currentScale')
		currentScale_mult.operation.set(2)	
		pm.connectAttr(name+"_mainPoser_decomposeMatrix.outputScaleX", currentScale_mult.input1X)
		pm.connectAttr(name+"_decomposeMatrix.outputScaleX", currentScale_mult.input2X)
		
		offsetLenght_mult = pm.createNode("multDoubleLinear", n = name+'_offsetLenghtMult')
		offsetCurve_mult.outputX >> offsetLenght_mult.input1
		chainLength_mult.outputX >> offsetLenght_mult.input2
		
		stretch_mult = pm.createNode("multDoubleLinear", n = name+'_stretchMult')
		offsetLenght_mult.output >> stretch_mult.input1
		currentScale_mult.outputX >> stretch_mult.input2
		stretch_mult.output >> blend.color1R
		
		stretchVolume_mult = pm.createNode('multiplyDivide', n=name+'_stretchVolumeMult')
		stretchVolume_mult.operation.set(2)		
		stretchVolume_mult.input1X.set(crvInfo.arcLength.get())
		
		blend2 = pm.createNode('blendColors', n=name+'_blendColors2')
		dynCtrl.stretchVolume >> blend2.blender		
		crvInfo.arcLength >> blend2.color1R
		blend2.color2R.set(crvInfo.arcLength.get())
		blend2.outputR >> stretchVolume_mult.input2X	

		# add offset attribute
		for i in range(len(joints)):
			stretchVolume_mult.outputX >> joints[i].sy
			stretchVolume_mult.outputX >> joints[i].sz
			joints[i].segmentScaleCompensate.set(1)
			if i > 0:
				mult6 = pm.createNode('addDoubleLinear', n=joints[i]+'_offsetTransform')
				blend.outputR >> mult6.input1
				joints[i].addAttr("offset", k=1)
				joints[i].offset >> mult6.input2
				mult6.output >> joints[i].tx

			
		# geometry
		if generateGeo:
			geo_gr = pm.group(empty=1, n=name+'_geo')
			pm.parent(geo_gr, 'geo')
			element_src = pm.PyNode(self.MainWindow.element_lineEdit.text())
	
			for i in range(chainsCount):
				e = pm.duplicate(element_src, n=name+'_element_'+str(i))[0]	
	
				pm.parent(e, geo_gr)
				loc = name+"_element_"+str(i)+"_outLoc"
				utils.connectByMatrix(e.name(), [loc, e.name()], ['worldMatrix[0]', 'parentInverseMatrix[0]'])
	
				mult = pm.createNode('multiplyDivide')
				dynCtrl.elementSize >> mult.input1X
				dynCtrl.elementSize >> mult.input1Y
				dynCtrl.elementSize >> mult.input1Z
	
				pm.PyNode(name+'_element_0_decMat').outputScale >> mult.input2
	
				mult.outputX >> e.sx
				mult.outputY >> e.sy
				mult.outputZ >> e.sz	
	
				pm.hide(loc)
	
			pm.hide(name+'_joints')	
		
		first = utils.getControlNameFromInternal(self.name, 'element_1')
		cmds.orientConstraint(first, self.name+'_outJoints')

		cmds.hide(system_gr)

		self.connectOpposite()

	def updateOptionsPage(self, widget):
		childs = cmds.listRelatives(self.name+'_outJoints', allDescendents=1, type='joint' )
		jointsCount = len(childs)			
		
		groups = []
		for g in cmds.listRelatives(self.name+'_controls', allDescendents=1, type='transform' ):
			if g.split("_")[-1] == "group":
				groups.append(g)
		controlsCount = len(groups) - 1
		
		useDynamic = cmds.objExists(self.name+"_hairSystem")
		
		widget.controlsCount_spinBox.setValue(controlsCount)
		widget.jointsCount_spinBox.setValue(jointsCount)
		widget.useDynamic_checkBox.setChecked(cmds.objExists(self.name+"_hairSystem"))

	def getOptions(self):
		childs = cmds.listRelatives(self.name+'_outJoints', allDescendents=1, type='joint' )
		self.jointsCount = len(childs)			
		
		posers = []
		for p in cmds.listRelatives(self.name+'_posers', allDescendents=1):
			if p.split('_')[-1] == 'poser':
				posers.append(p)
		self.controlsCount = len(posers)		
		
		self.useDynamic = cmds.objExists(self.name+"_hairSystem")

		optionsData = {}
		optionsData['controlsCount'] = self.controlsCount
		optionsData['jointsCount'] = self.jointsCount
		optionsData['useDynamic'] = self.useDynamic

		return optionsData				

	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	

	def rebuildWithNewOptions(self, mainInstance, widget):
		controlsCount = widget.controlsCount_spinBox.value()
		jointsCount = widget.jointsCount_spinBox.value()
		useDynamic = widget.useDynamic_checkBox.isChecked()

		# create data variable
		options = {}
		options['controlsCount'] = controlsCount
		options['jointsCount'] = jointsCount
		options['useDynamic'] = useDynamic

		# get children
		children = {}
		for m_name in mainInstance.rig.getModuleChildren(self.name):
			m = mainInstance.rig.modules[m_name]
			children[m_name] = [m.parent, m, m.isSeamless()]
		

		joints = cmds.sets(self.name+'_skinJointsSet', q=1)
		ids = []
		for j in joints:
			id = j.split("_")[-2]
			if id.isdigit():
				ids.append(int(id))
		last_id = sorted(ids)[-1]
		
		if jointsCount <= last_id:
			new_target = self.name + "_" + str(jointsCount-1) + "_outJoint"
		else:
			new_target = None

		# rebuild current module
		mainInstance.rebuildModule(options, new_target=new_target)
		
		if useDynamic:
			dynCtrl = pm.PyNode(utils.getControlNameFromInternal(self.name, "control"))
			dynCtrl.dynamicWeight.unlock()
			dynCtrl.dynamicWeight.setKeyable(True)
			dynCtrl.stiffness.unlock()
			dynCtrl.stiffness.setKeyable(True)
			dynCtrl.damp.unlock()
			dynCtrl.damp.setKeyable(True)		
			dynCtrl.dynamic.unlock()
			dynCtrl.dynamic.setKeyable(True)
			dynCtrl.startFrame.unlock()

	def rerootPosersToMainPoser(self):
		sel = cmds.ls(sl=1)
	
		def par(name):
			posers = []
			possible_posers = cmds.listRelatives(name+"_mainPoser", ad=1)
			for p in possible_posers:
				if p.split("_")[-1] == "poser":
					posers.append(p)
	
			for p in posers:
				cur_parent = cmds.listRelatives(p, p=1)[0]
				if cur_parent != name+"_mainPoser":
					cmds.parent(p, name+"_mainPoser")
	
		par(self.name)
		par(utils.getOppositeObject(self.name))
	
		if len(sel) > 0:
			cmds.select(sel)

	def rerootPosersToChain(self):
		sel = cmds.ls(sl=1)
	
		def par(name):
			posers = []
			possible_posers = cmds.listRelatives(name+"_mainPoser", ad=1)
			for p in possible_posers:
				if p.split("_")[-1] == "poser":
					posers.append(p)
	
			for p in posers:
				if p == name+"_root_poser":
					continue
				num = int( p.split("_")[-2] ) 
				if num == 2:
					par = name + "_root_poser"
				else:
					par = name + "_element_" + str(num-1) + "_poser"
				try:
					cmds.parent(p, par)
				except: pass
	
		par(self.name)
		par(utils.getOppositeObject(self.name))			

		if len(sel) > 0:
			cmds.select(sel)		
			
	def connectOpposite(self):
		side = utils.getObjectSide(self.name)
		if side != 'r':# or not cmds.objExists(opp_name+'_mod'):
			return

		opp_name = utils.getOpposite(self.name)
		
		# connect right hairSystem to left
		if self.useDynamic:
			cmds.select(self.name+"_follicle")
			mel.eval("assignHairSystem %s_hairSystemShape" %opp_name )
		
			f = self.name+"_follicle"
			c = self.name+"_dynamicCrv"
			f_par = cmds.listRelatives(f, p=1)[0]
			c_par = cmds.listRelatives(c, p=1)[0]
		
			cmds.parent(f, self.name+"_system")
			cmds.parent(c, self.name+"_system")
			cmds.delete(f_par, c_par, self.name+"_nucleus", self.name+"_hairSystem")
		
		l_c = pm.PyNode(utils.getControlNameFromInternal(opp_name, 'control'))
		r_c = pm.PyNode(utils.getControlNameFromInternal(self.name, 'control'))

		r_c.length.unlock()
		r_c.autoStretch.unlock()
		r_c.roll.unlock()
		r_c.twist.unlock()
		try:
			r_c.dynamicWeight.unlock()
		except: pass
		
		l_c.length >> r_c.length
		l_c.autoStretch >> r_c.autoStretch
		
		mult_roll = pm.createNode('multDoubleLinear')
		utils.addModuleNameAttr(mult_roll, self.name)	
		mult_twist = pm.createNode('multDoubleLinear')
		utils.addModuleNameAttr(mult_twist, self.name)	
		mult_roll.input2.set(-1)
		mult_twist.input2.set(-1)
		l_c.roll >> mult_roll.input1
		l_c.twist >> mult_twist.input1	
		mult_roll.output >> r_c.roll
		mult_twist.output >> r_c.twist
		
		if self.useDynamic:
			l_c.dynamicWeight >> r_c.dynamicWeight

		pm.hide(r_c.getParent())

	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()
		
		root_j = self.name + "_root_joint"
		group_j = self.name + "_group_joint"
		
		# cmds.duplicate(root_j, n=group_j)
		# pm.delete(pm.listRelatives(group_j))
		# cmds.parent(root_j, group_j)
		# utils.removeTransformParentJoint(root_j)
		# cmds.setAttr(group_j+".drawStyle", 2)
		
		# utils.connectByMatrix(group_j, [self.name+"_outJoints", self.name+"_mainPoser", group_j], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'parentInverseMatrix[0]'], module_name=self.name )
		
		for i in range(1, self.jointsCount):
			cmds.setAttr(self.name+"_%s_joint.segmentScaleCompensate" %i, 1)
			cmds.connectAttr(self.name+"_%s_joint.offset" %i, self.name+"_%s_outJoint.offset" %i)

		for j in cmds.listRelatives(root_j, allDescendents=1):
			cmds.sets(j, e=1, forceElement=self.name+"_nodesSet")

		cmds.sets(root_j, e=1, forceElement=self.name+"_nodesSet")

	def bake(self):
		super(self.__class__, self).bake(forceDelete=[self.name+"_initCurve_curveInfo"])

