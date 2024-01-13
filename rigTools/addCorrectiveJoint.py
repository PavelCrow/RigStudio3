# Create Angle Reader if not exists
axis = "X"
sel = cmds.ls(sl=1)
if len(sel) != 1:
    cmds.warning("Select one joint")
    #return
j = sel[0]
name = j.split("_joint")[0]
if not cmds.objExists(j+".angle"+axis):
    cmds.addAttr(j, longName="angle"+axis, keyable=1)
    dMat = cmds.createNode('decomposeMatrix', n="%s_decomposeMatrix" %j)
    quat = cmds.createNode('quatToAxisAngle', n="%s_%s_quatToAxisAngle" %(j,axis))
    cmds.connectAttr(j+".matrix", dMat+".inputMatrix")
    cmds.connectAttr(dMat+".outputQuat"+axis, quat+".inputQuat"+axis)
    cmds.connectAttr(dMat+".outputQuatW", quat+".inputQuatW")
    mult = cmds.createNode('multDoubleLinear', n="%s_%s_multDoubleLinear" %(j,axis))
    cmds.connectAttr(quat+".outputAngle", mult+".input1")
    cmds.connectAttr(quat+".outputAxis"+axis, mult+".input2")
    cmds.connectAttr(mult+".output", j+".angle"+axis)


# create rotate joint if not exists
id = 1
while cmds.objExists("%s_%s_%s_corrective_joint" %(j,axis,id)):
    id += 1
       
j_rot = "%s_%s_rotateJoint" %(name,axis)
if not cmds.objExists(j_rot):
    cmds.select(clear=1)
    cmds.joint(n=j_rot)
    par = cmds.listRelatives(j, p=1)[0]
    cmds.parent(j_rot, par)
    
    mult1 = cmds.createNode('multDoubleLinear', n="%s_%s_halfAngle_multDoubleLinear" %(j,axis))
    cmds.connectAttr("%s_%s_multDoubleLinear.output" %(j,axis), mult1+".input1")
    cmds.setAttr(mult1+".input2", 0.5)
    
    cmds.connectAttr(j+".t", j_rot+".t")
    cmds.connectAttr(mult1+".output", j_rot+".rotate"+axis)

# Add corrective joint
mult2 = cmds.createNode('multDoubleLinear', n="%s_%s_%s_multDoubleLinear" %(j,axis,id))
cmds.connectAttr("%s_%s_halfAngle_multDoubleLinear.output" %(j,axis), mult2+".input1")

j_out = cmds.joint(n="%s_%s_%s_corrective_joint" %(name,axis,id) )
cmds.addAttr(j_out, longName="mult", keyable=1)
cmds.addAttr(j_out, longName="min", keyable=1)
cmds.addAttr(j_out, longName="max", keyable=1)
cmds.addAttr(j_out, longName="offset", keyable=1)
cmds.parent(j_out, j_rot)
cmds.setAttr(j_out+".t", 0,0,0)

mult_s = cmds.createNode('multDoubleLinear', n="%s_%s_%s_multScale_multDoubleLinear" %(j,axis,id))
cmds.setAttr(mult_s+".input2", 0.01)
cmds.connectAttr(j_out+".mult", mult_s+".input1")
cmds.connectAttr(mult_s+".output", mult2+".input2")

add = cmds.createNode('addDoubleLinear', n="%s_%s_%s_offset_addDoubleLinear" %(j,axis,id))
cmds.connectAttr(mult2+".output", add+".input1")

mult_off = cmds.createNode('multDoubleLinear', n="%s_%s_%s_multOffset_multDoubleLinear" %(j,axis,id))
cmds.setAttr(mult_off+".input2", 0.1)
cmds.connectAttr(j_out+".offset", mult_off+".input1")
cmds.connectAttr(mult_off+".output", add+".input2")

clamp = cmds.createNode('clamp', n="%s_%s_%s_clamp" %(j,axis,id))
cmds.connectAttr(add+".output", clamp+".inputR")
cmds.connectAttr(j_out+".min", clamp+".minR")
cmds.connectAttr(j_out+".max", clamp+".maxR")
cmds.connectAttr(clamp+".outputR", j_out+".ty")

cmds.setAttr(j_out+".mult", 1)
cmds.setAttr(j_out+".min", -1)
cmds.setAttr(j_out+".max", 1)

cmds.select(j_out)