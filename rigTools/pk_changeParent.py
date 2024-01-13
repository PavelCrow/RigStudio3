import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import math

def start():
	sel = cmds.ls(sl=True)
	
	if len(sel) == 0:
		print "select control with parent attribute"
		return
	
	sel = sel[0]
	
	if not cmds.attributeQuery( 'parent', node=sel, exists=True ):
		print "select control with parent attribute"
		return		
	
	
	# Get transform
	tr = cmds.xform( sel, q=True, t=True, ws=True)
	rt = cmds.xform( sel, q=True, ro=True, ws=True)
	
	# get size of parent attribute enum
	list = mel.eval('attributeQuery -node %s -listEnum "parent"' %sel)
	size = len(list[0].split(":"))
	
	# get current parent
	currParentId = cmds.getAttr(sel+".parent")
	# next parent
	nextParentId = int(currParentId) + 1
	if nextParentId >= size:
		nextParentId = 0

	# set next parent
	cmds.setAttr(sel+".parent", nextParentId)
	

	# Set Transform
	cmds.move( tr[0], tr[1], tr[2], sel, rotatePivotRelative=True)
	cmds.rotate(rt[0], rt[1], rt[2], sel, ws=True)	