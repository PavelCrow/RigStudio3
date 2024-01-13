# Select joints and mesh last
import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm

def run(createBindOrigin=False):
	print (createBindOrigin)
	# get variables
	sel = pm.selected()
	if len(sel) < 2 : 
		return
	joints = sel[:-1]
	mesh = sel[-1]
	meshS = mesh.getShape()
	if meshS.type() != 'mesh':
		return
	
	# create skin if needed
	sc = mesh.inMesh.inputs()[0]
	if sc.type() != 'skinCluster':
		pm.skinCluster()
		sc = mesh.inMesh.inputs()[0]
	else:	
		# add joints to skincluster
		pm.mel.eval('skinClusterInfluence 1 " -dr 4 -lw true -wt 0";')
	
	# get input number
	scInputs = sc.matrix.elements()
	for j in joints:
		if j.type() != 'joint':
			continue
		# get input number
		for i in scInputs:
			if sc.attr(i).inputs()[0] == j:
				n = i[:-1].split('[')[-1]
				break
	
		# create bind origin transform
		xf = j.getParent().getParent()
		if createBindOrigin:
			bo = pm.group(empty=1, n=j+'_bindOrigin')
			pm.parent(bo, j.getParent().getParent())
			bo.t.set(0,0,0)
			bo.r.set(0,0,0)
			bo.s.set(1,1,1)
			# connect parent group as bind prematrix
			bo.worldInverseMatrix[0] >> sc.bindPreMatrix[n]
		else:
			xf.worldInverseMatrix[0] >> sc.bindPreMatrix[n]
