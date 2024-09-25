# add fingers to wing module

import maya.cmds as cmds
import pymel.core as pm

name = 'feather'
chainLengh = 10
feathersCount = 10

cmds.delete('detail_group', 'feathers_geo_group')
cmds.delete(cmds.listRelatives('root_outJoint'))

pm.group(empty=1, n="feathers_geo_group")
pm.group(empty=1, n="detail_group")
pm.parent("detail_group", "controls")
pm.setAttr("detail_group.t", 0,0,0)
pm.setAttr("detail_group.r", 0,0,0)
pm.setAttr("detail_group.inheritsTransform", 0)
pm.setAttr("count_multiplyDivide.input1X", feathersCount-1)

for f in range(feathersCount):
	step = 1.0/(feathersCount-1)*f
	joints = []

	gr = pm.group(empty=1, n="%s_%s_group" %(name, f))
	for i in range(chainLengh):
		pm.select(clear=1)
		j = pm.joint(n=name+"_%s_"%f+str(i)+"_outJoint")

		joints.append(j)
		cmds.sets(j.name(), e=1, forceElement='outJointsSet')

		if i > 0:
			print j, joints[i-1]
			pm.parent(j, joints[i-1])
			j.tx.set(2)

	pm.parent(joints[0], gr)

	points = [ (x*2,0,0) for x in range(4) ]
	crv = pm.curve(d=3, p=points, n=name+"_%s_crv" %f)
	sCrv = crv.getShape()
	cvs = sCrv.getCVs()
	pm.parent(crv, gr)

	for i in range(4):
		# male locator
		loc = pm.spaceLocator(n=crv+"_"+str(i+1)+'_loc')
		loc.hide()
		pm.parent(loc, gr)

		# move locator to cv
		cv = cvs[i]
		loc.setTranslation((cv.x,cv.y,cv.z))

		pcu = pm.createNode('pointOnCurveInfo', n=name+'_%s_%s_pointOnCurveInfo' %(i+1, f))
		pm.connectAttr('curve_%sShape.worldSpace[0]' %(i), pcu.inputCurve)
		pcu.position >> loc.t
		pcu.parameter.set(step)

		# connect loc to cv
		pm.connectAttr(loc.worldPosition[0], sCrv.controlPoints[i])

	if f > 0:
		con = pm.aimConstraint('feather_'+str(f-1)+"_crv_"+str(i+1)+'_loc', loc)
		pm.setAttr(con+'.worldUpType', 1)
		pm.setAttr(con+'.aimVector', 1,0,0)
		pm.setAttr(con+'.upVector', 0,0,1)
		pm.connectAttr('feather_'+str(f)+'_crv_1_loc.worldMatrix', con.worldUpMatrix)
	if f == 1: 
		con = pm.aimConstraint(loc, "feather_0_crv_"+str(i+1)+'_loc')
		pm.setAttr(con+'.worldUpType', 1)
		pm.setAttr(con+'.aimVector', -1,0,0)
		pm.setAttr(con+'.upVector', 0,0,1)
		pm.connectAttr('feather_'+str(f)+'_crv_1_loc.worldMatrix', con.worldUpMatrix)

	# make spline ik
	pm.select(joints[0], joints[-1], crv)
	ikh = pm.ikHandle(sol='ikSplineSolver', ccv=0, pcv=0, ns=2, n=name+'_%s_ikHandle' %f)[0]
	ikh.dTwistControlEnable.set(1)
	ikh.dWorldUpType.set(3)
	loc.worldMatrix[0] >> ikh.dWorldUpMatrix
	pm.parent(ikh, gr)
	ikh.hide()

	# set chain length
	ci = pm.createNode('curveInfo', n=name+'_%s_curveInfo' %f)
	sCrv.worldSpace[0] >> ci.inputCurve
	md = pm.createNode('multiplyDivide', n=name+'_%s_multiplyDivide' %f)
	ci.arcLength >> md.input1X
	md.operation.set(2)
	md.input2X.set(chainLengh+1)
	sc = ci.arcLength.get() / (chainLengh-1)
	pm.delete(md, ci)

	for j in joints:
		if i > 0:
			j.tx.set(sc)

	pm.parent(joints[0], "root_outJoint")
	pm.parent(gr, "detail_group")

	# geo
	geo = pm.duplicate('feather_geo', n='feather_geo_'+str(f))[0]
	pm.parent(geo, 'feather_%s_2_outJoint' %f)
	geo.t.set(0,0,0)
	geo.r.set(0,266,0)
	geo.s.set(sc*2, sc*2, sc*2)

	pm.parent(geo, 'feathers_geo_group')
	pm.skinCluster('feather_%s_2_outJoint' %f, geo,toSelectedBones=False)




for f in range(1, feathersCount-1):
	step = 1.0/(feathersCount-1)*f

	pc1 = pm.createNode('pointOnCurveInfo', n=name+'_%s_base_sample_pointOnCurveInfo' %f)
	pm.connectAttr('base_sample_crvShape.worldSpace[0]', pc1.inputCurve)
	pc1.parameter.set(step)
	pm.connectAttr(pc1.positionX, 'feather_1_%s_pointOnCurveInfo.parameter' %f)

	pc2 = pm.createNode('pointOnCurveInfo', n=name+'_%s_tip_sample_pointOnCurveInfo' %f)
	pm.connectAttr('tip_sample_crvShape.worldSpace[0]', pc2.inputCurve)
	pc2.parameter.set(step)
	pm.connectAttr(pc2.positionX, 'feather_4_%s_pointOnCurveInfo.parameter' %f)
	
	diff = pm.createNode('plusMinusAverage', n=name+'_%s_sample_plusMinusAverage' %f)
	pc2.positionX >> diff.input1D[0]
	pc1.positionX >> diff.input1D[1]
	diff.operation.set(2)
	
	mult = pm.createNode('multiplyDivide', n=name+'_%s_sample_multiplyDivide' %f)
	diff.output1D >> mult.input1X
	mult.input2X.set(3)
	mult.operation.set(2)
	
	add1 = pm.createNode('addDoubleLinear', n=name+'_%s_sample_1_addDoubleLinear' %f)
	pc1.positionX >> add1.input1
	mult.outputX >> add1.input2
	pm.connectAttr(add1.output, 'feather_2_%s_pointOnCurveInfo.parameter' %f)
	
	add2 = pm.createNode('addDoubleLinear', n=name+'_%s_sample_2_addDoubleLinear' %f)
	add1.output >> add2.input1
	mult.outputX >> add2.input2
	pm.connectAttr(add2.output, 'feather_3_%s_pointOnCurveInfo.parameter' %f)
