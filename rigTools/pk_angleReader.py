import pymel.core as pm

def run():
	# get three input joints
	sel = pm.selected()
	
	if len(sel) != 3: 
		pm.warning("Select three joints from parent to last child")
		return
	
	j1 = sel[0]
	j2 = sel[1]
	j3 = sel[2]
	
	# set name from joint
	name = j2+'_btw'
	
	# create structure
	gr = pm.group(n=name+'_group', empty=1)
	pm.pointConstraint(j2, gr, mo=0)
	
	l1 = pm.spaceLocator(n=name+'_loc_1')
	pm.parent(l1, j1)
	l1.t.set(0,0,0)
	l1.r.set(0,0,0)
	l1.s.set(1,1,1)
	l2 = pm.spaceLocator(n=name+'_loc_2')
	pm.parent(l2, j2)
	l2.t.set(0,0,0)
	l2.r.set(0,0,0)
	l2.s.set(1,1,1)
	
	pm.parent(gr, l1)
	gr.r.set(0,0,0)
	gr.s.set(1,1,1)
	
	con = pm.aimConstraint(j2, l1, aimVector=(1,0,0), upVector=(0,0,1), worldUpType="object", worldUpObject=j3)
	pm.delete(con)
	con = pm.aimConstraint(j3, l2, aimVector=(1,0,0), upVector=(0,0,1), worldUpType="object", worldUpObject=j1)
	pm.delete(con)
	
	rot_gr = pm.group(n=name+'_half_rotation', empty=1)
	pm.parent(rot_gr, gr)
	rot_gr.t.set(0,0,0)
	rot_gr.r.set(0,0,0)
	rot_gr.s.set(1,1,1)
	con = pm.orientConstraint(l1, l2, rot_gr, mo=0)
	con.interpType.set(2)
	
	j = pm.joint(n=name+'_joint')
	j.t.set(0,0,0)
	j.r.set(0,0,0)
	j.s.set(1,1,1)
	
	# create control
	
	min_crv = pm.curve(d=1, p=[(0,0,0), (0,0,1)], n=name+'_min_crv')
	max_crv = pm.curve(d=1, p=[(0,0,0), (0,0,1)], n=name+'_max_crv')
	min_circle = pm.circle(nr=(0,1,0), n=name+'_minCircle')
	max_circle = pm.circle(nr=(0,1,0), n=name+'_maxCircle')
	
	cl_min_s = pm.cluster(min_crv, n=name+'_min_scl_cls')
	pm.mel.eval('move 0 0 0 %s.scalePivot %s.rotatePivot ;' %(cl_min_s[1], cl_min_s[1]))
	cl_min_s[0].relative.set(1)
	
	cl_min_r = pm.cluster(min_crv, min_circle[0], max_circle[0], n=name+'_min_rot_cls')
	pm.mel.eval('move 0 0 0 %s.scalePivot %s.rotatePivot ;' %(cl_min_r[1], cl_min_r[1]))
	cl_min_r[0].relative.set(1)
	
	cl_max = pm.cluster(max_crv, n=name+'_max_cls')
	pm.mel.eval('move 0 0 0 %s.scalePivot %s.rotatePivot ;' %(cl_max[1], cl_max[1]))
	cl_max[0].relative.set(1)
	
	cl_circles = pm.cluster(min_circle[0], max_circle[0], n=name+'_circles_cls')
	pm.mel.eval('move 0 0 0 %s.scalePivot %s.rotatePivot ;' %(cl_min_r[1], cl_min_r[1]))
	cl_circles[0].relative.set(1)
	cl_circles[1].ry.set(180)
	
	ctrl = pm.group(n=name+'_angleReader_control', empty=1)
	
	ctrl.t.lock()
	ctrl.tx.setKeyable(0)
	ctrl.ty.setKeyable(0)
	ctrl.tz.setKeyable(0)
	ctrl.s.lock()
	ctrl.sx.setKeyable(0)
	ctrl.sy.setKeyable(0)
	ctrl.sz.setKeyable(0)
	ctrl.v.lock()
	ctrl.v.setKeyable(0)
	ctrl.rx.setKeyable(0)
	ctrl.rz.setKeyable(0)
	ctrl.rx.lock()
	ctrl.rz.lock()
	
	# add attributes to control
	
	pm.addAttr(ctrl, ln="range", at='double', min=0, max=180)
	ctrl.range.setKeyable(1)
	pm.addAttr(ctrl, ln="min", at='double', min=0)
	ctrl.min.setKeyable(1)
	pm.addAttr(ctrl, ln="max", at='double', min=0)
	ctrl.max.setKeyable(1)
	pm.addAttr(ctrl, ln="jointInverse", at='bool')
	ctrl.jointInverse.setKeyable(1)
	pm.addAttr(ctrl, ln="jointOffset", at='double')
	ctrl.jointOffset.setKeyable(1)
	pm.addAttr(ctrl, ln="outNormailize", at='float', min=0, max=1)
	ctrl.outNormailize.showInChannelBox(1)
	pm.addAttr(ctrl, ln="outNormailizeInverse", at='bool')
	ctrl.outNormailizeInverse.setKeyable(1)	
	
	# make connections
	
	mult = pm.createNode('multDoubleLinear')
	mult.input2.set(-1)
	ctrl.range >> mult.input1
	mult.output >> cl_min_r[1].ry
	
	ctrl.range >> cl_max[1].ry
	
	ctrl.max >> cl_max[1].sx
	ctrl.max >> cl_max[1].sy
	ctrl.max >> cl_max[1].sz
	
	ctrl.max >> cl_min_s[1].sx
	ctrl.max >> cl_min_s[1].sy
	ctrl.max >> cl_min_s[1].sz
	
	ctrl.max >> max_circle[1].radius
	ctrl.min >> min_circle[1].radius
	
	mult2 = pm.createNode('multDoubleLinear')
	mult2.input2.set(2)
	ctrl.range >> mult2.input1
	mult2.output >> max_circle[1].sweep
	mult2.output >> min_circle[1].sweep
	
	pm.parent(cl_min_s[1], cl_min_r[1], cl_max[1], cl_circles[1], min_crv, min_circle[0], max_crv, max_circle[0], ctrl)
	pm.hide(cl_min_s, cl_min_r, cl_max, cl_circles, min_crv, min_circle, max_crv, max_circle)
	
	ctrl.min.set(0.2)
	ctrl.max.set(1)
	ctrl.range.set(30)
	
	pm.parent(min_crv.getShape(), ctrl, r=1, s=1)
	pm.parent(max_crv.getShape(), ctrl, r=1, s=1)
	pm.parent(min_circle[0].getShape(), ctrl, r=1, s=1)
	pm.parent(max_circle[0].getShape(), ctrl, r=1, s=1)
	
	pm.parent(ctrl, gr)
	
	remap = pm.createNode('remapValue')
	rot_gr.ry >> remap.inputValue
	
	add = pm.createNode('addDoubleLinear')
	ctrl.ry >> add.input1
	ctrl.range >> add.input2
	add.output >> remap.inputMax
	
	mult = pm.createNode('multDoubleLinear')
	mult.input2.set(-1)
	add2 = pm.createNode('addDoubleLinear')
	ctrl.range >> mult.input1
	mult.output >> add2.input1
	ctrl.ry >> add2.input2
	add2.output >> remap.inputMin
	
	ctrl.min >> remap.value[0].value_FloatValue
	ctrl.max >> remap.value[1].value_FloatValue
	
	remap.outValue >> j.tz
	
	for s in ctrl.getShapes():
		s.overrideEnabled.set(1)
		s.overrideColor.set(13)
	
	
	ctrl.jointOffset >> con.offsetY
	
	cond = pm.createNode('condition')
	ctrl.jointInverse >> cond.firstTerm
	ctrl.min >> cond.colorIfTrueR
	ctrl.max >> cond.colorIfTrueG
	ctrl.min >> cond.colorIfFalseG
	ctrl.max >> cond.colorIfFalseR
	cond.outColorR >> remap.value[0].value_FloatValue
	cond.outColorG >> remap.value[1].value_FloatValue
	
	
	remap = pm.createNode('remapValue')
	rot_gr.ry >> remap.inputValue
	add.output >> remap.inputMax
	add2.output >> remap.inputMin
	
	rev = pm.createNode('reverse')
	cond = pm.createNode('condition')
	ctrl.outNormailizeInverse >> cond.firstTerm
	remap.outValue >> cond.colorIfTrueR
	remap.outValue >> rev.inputX
	rev.outputX >> cond.colorIfFalseR
	cond.outColorR >> ctrl.outNormailize

	# hide locators shapes
	pm.hide(l1.getShape(), l2)