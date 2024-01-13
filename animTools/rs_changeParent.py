# Change switch attribute "parent" with store position
#
# select control with "parent" attribute and run in python:
# import pk_changeParent
# reload(pk_changeParent)
# pk_changeParent.run()
#
# Pavel Korolyov
# pavel.crow@gmail.com


import maya.cmds as cmds
import maya.mel as mel
import maya.OpenMaya as om
import math

def run(makeKeys=False):
	sel = cmds.ls(sl=True)
	
	if len(sel) == 0:
		print ("select control with parent attribute")
		return
	
	for o in sel:
		if not cmds.attributeQuery( 'parent', node=o, exists=True ):
			print ("control", o, "has not parent attribute")
			return		
		
		
		# Get transform
		#tr = cmds.xform( o, q=True, t=True, ws=True)
		#rt = cmds.xform( o, q=True, ro=True, ws=True)
		m = cmds.xform(o, q=1, matrix=1, ws=1)
		
		# get size of parent attribute enum
		list = mel.eval('attributeQuery -node %s -listEnum "parent"' %o)
		size = len(list[0].split(":"))
		
		# get current parent
		currParentId = cmds.getAttr(o+".parent")
		# next parent
		nextParentId = int(currParentId) + 1
		if nextParentId >= size:
			nextParentId = 0

		# set next parent
		cmds.setAttr(o+".parent", nextParentId)
		

		# Set Transform
		#cmds.move( tr[0], tr[1], tr[2], o, rotatePivotRelative=True)
		#cmds.rotate(rt[0], rt[1], rt[2], o, ws=True)	
		cmds.xform(o, matrix=m, ws=1)
		
		if makeKeys:
			cmds.setKeyframe(o+'.t')
			cmds.setKeyframe(o+'.r')
			cmds.setKeyframe(o+'.parent')