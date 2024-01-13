import maya.cmds as cmds


def run(t=True, r=True, s=True, useMultMat=False, useParentInverse=False):
	
	def disconnect(target, attr):
		if cmds.connectionInfo(target + '.' + attr, isDestination=True) :
			sourceAttr = cmds.connectionInfo(target + '.' + attr, sourceFromDestination=True)
			cmds.disconnectAttr( sourceAttr, target + '.' + attr)		
	
	sel = cmds.ls(sl=True)
	
	if not useMultMat:
		if len(sel) != 2:
			print "Select source and target objects"
			return
	else:
		if useParentInverse:
			if len(sel) != 2:
				print "Select source and target objects"	
				return
		else:
			if len(sel) != 3:
				print "Select source, inverse and target objects"
				return
	
	src = sel[0]
	if len(sel) == 3:
		refObj = sel[1]
	target = sel[-1]
	
	# make connections --------------------------------------------
	decMat = cmds.createNode("decomposeMatrix", n=target+"_decMat")
	
	if not useMultMat:
		cmds.connectAttr( src+".worldMatrix[0]", decMat+".inputMatrix")
	else:
		multMat = cmds.createNode("multMatrix", n=target+"_multMat")
		cmds.connectAttr( src+".worldMatrix[0]", multMat+".matrixIn[0]")
		if useParentInverse:
			cmds.connectAttr( target+".parentInverseMatrix[0]", multMat+".matrixIn[1]")
		else:
			cmds.connectAttr( refObj+".worldInverseMatrix[0]", multMat+".matrixIn[1]")
		cmds.connectAttr( multMat+".matrixSum", decMat+".inputMatrix")
		
		
	if t:
		disconnect(target, 't')
		cmds.connectAttr(decMat+".outputTranslate", target+".translate")
	if r:
		disconnect(target, 'r')
		cmds.connectAttr(decMat+".outputRotate", target+".rotate")
	if s:
		disconnect(target, 's')
		cmds.connectAttr(decMat+".outputScale", target+".scale")