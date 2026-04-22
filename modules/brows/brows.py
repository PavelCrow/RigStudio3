import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
from functools import partial

from ... import utils, module


class Brows(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
		self.jointsCount = 0
		self.widget = None
		self.edges = ''

	def connectSignals(self, mainInstance, w): #
		self.mainInstance = mainInstance
		self.widget = w

		w.regenerateManual_btn.clicked.connect(self.regenerate_joints)
		w.slide_checkBox.clicked.connect(partial(self.setSlideJoints, w))
		w.generateControls_btn.clicked.connect(self.regenerate_controls)

	def updateOptionsPage(self, widget):
		options = self.getOptions()
		self.jointsCount = options['jointsCount']
		self.jointsSlide = options['jointsSlide']
		self.innerCount = options['innerCount']
		self.outerCount = options['outerCount']
		
		widget.jointsCount_spinBox.setValue(self.jointsCount)
		widget.slide_checkBox.setChecked(self.jointsSlide)
		widget.inControlsCount_spinBox.setValue(self.innerCount)
		widget.outControlsCount_spinBox.setValue(self.outerCount)

	def getOptions(self): #
		m_name = self.name

		self.jointsCount = int( (len(cmds.listRelatives(f"{m_name}_root_outJoint")) -1) / 2 )
		self.jointsSlide = cmds.getAttr(f"{self.name}_mainPoser.jointsSlide")

		# get controls count
		all_children = cmds.listRelatives(f"{m_name}_l_brow", type="transform") or []
		inner_children = []
		outer_children = []
		for child in all_children:
			if "inner" in child:
				inner_children.append(child)
			elif "outer" in child:
				outer_children.append(child)
		self.innerCount = len(inner_children)
		self.outerCount = len(outer_children)


		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
		else:
			optionsData = {}

		optionsData['jointsCount'] = self.jointsCount
		optionsData['jointsSlide'] = self.jointsSlide
		optionsData['innerCount'] = self.innerCount
		optionsData['outerCount'] = self.outerCount

		posData = []
		for i in range(self.jointsCount):
			pos = cmds.getAttr(f"{m_name}_l_{i}_outJoint.pos")
			posData.append(pos)

		optionsData['posData'] = posData

		return optionsData	
	
	def setOptions(self, optionsData):

		utils.pyToAttr(self.root+'.options', optionsData)	

	def getData(self): #
		data = super(self.__class__, self).getData()
		data['optionsData'] = self.getOptions()
		return data	

	def setData(self, data, sym=False, namingForce=False, load="all"): #
		super(self.__class__, self).setData(data, sym, namingForce, load)

		count_cur = int( (len(cmds.listRelatives(f"{self.name}_root_outJoint")) -1) / 2 )

		optionsData = data["optionsData"]

		if count_cur != optionsData["innerCount"]:
			self.regenerate_controls(inner_count=optionsData["innerCount"], outer_count=optionsData["outerCount"])

		if count_cur != optionsData["jointsCount"]:
			self.regenerate_joints(count=optionsData["jointsCount"])

		for i, pos in enumerate(optionsData["posData"]):
			cmds.setAttr(f"{self.name}_l_{i}_outJoint.pos", pos)

		if self.widget:
			self.updateOptionsPage(self.widget)

	def setEdges(self, widget):
		edges = cmds.ls(sl=1)
		
		if len(edges) != 1 or "vtx" not in edges[0]:
			cmds.warning("Select geometry vertexes")
			return

		edges_string = ""
		for e in edges:
			edges_string += e
			edges_string += " "
	
		options = self.getOptions()
		options['edges'] = edges_string
		self.setOptions(options)	

		widget.edges_lineEdit.setText(edges_string)	

	def regenerate_joints(self, count=None):
		if not count:
			count = self.widget.jointsCount_spinBox.value()

		m_name = self.name

		# Delete old joints
		for j in cmds.listRelatives(f"{m_name}_root_outJoint"):
			if "_c_" in j: continue
			cmds.delete(j)
			
		# create new
		for side in ["l", "r"]:
			crvS = pm.PyNode(f"{m_name}_{side}_curveShape")
			
			for i in range(count):
				j = pm.joint(n=f"{m_name}_{side}_{i}_outJoint")
				j.segmentScaleCompensate.set(0)
				pm.parent(j, m_name+"_root_outJoint")
				utils.removeTransformParentJoint(j.name())

				mp = pm.createNode("motionPath", n=j.replace("outJoint", "motionPath"))
				mp.worldUpVector.set(0,0,1)
				crvS.worldSpace[0] >> mp.geometryPath
			
				pm.addAttr(j, ln="pos", at='double', min=0, max=1, k=1)
				j.pos >> mp.uValue
				j.pos.set(1/(count-1)*i)
				mp.allCoordinates >> j.t
				mp.rotate >> j.r

				pm.connectAttr(f"{m_name}_mainPoser.jointsSlide", mp.fractionMode)

				if side == "r":
					pm.connectAttr(j.replace("_r_", "_l_")+".pos", j.pos)

		if self.widget:
			self.updateOptionsPage(self.widget)

		# self.addSkinJoints()

	def setSlideJoints(self, widget=None, on=None):
		if widget:
			on = widget.slide_checkBox.isChecked()

		cmds.setAttr(f"{self.name}_mainPoser.jointsSlide", on)

		options = self.getOptions()
		options['jointsSlide'] = on
		self.setOptions(options)	

	def regenerate_controls(self, inner_count=None, outer_count=None):
		m_name = self.name

		if not inner_count:
			inner_count = self.widget.inControlsCount_spinBox.value()
			outer_count = self.widget.outControlsCount_spinBox.value()
		
		# Delete old 
		all_children = cmds.listRelatives(f"{m_name}_l_brow", type="transform") or []
		inner_children = []
		outer_children = []
		for child in all_children:
			if "inner" in child:
				inner_children.append(child)
			elif "outer" in child:
				outer_children.append(child)
		old_inner_count = len(inner_children)
		old_outer_count = len(outer_children)

		part = "inner"
		for part in ["inner", "outer"]:
				
			if part == "inner": count = old_inner_count
			if part == "outer": count = old_outer_count
				
			for i in range(1, count+1):
				cmds.delete(f"{m_name}_{part}_{i}_poser")
				for side in ["l", "r"]:
					cmds.delete(f"{m_name}_{side}_brow_{part}_{i}_group")
					cmds.delete(f"{m_name}_{side}_brow_mid_{part}_{i}_target")
					if part == "inner":
						cmds.delete(f"{m_name}_{side}_brow_in_{part}_{i}_target")
					else:
						cmds.delete(f"{m_name}_{side}_brow_out_{part}_{i}_target")

			# disconnect init curve
			def disconnect_curve(curveShape):
				conns_in = cmds.listConnections(curveShape, plugs=1, connections=1, s=1, d=0) or []
				sources_in = conns_in[1::2]
				targets_in = conns_in[::2]

				for i, s in enumerate(sources_in):
					cmds.disconnectAttr(s, targets_in[i])
				
			disconnect_curve(m_name+"_posers_curveShape")
			disconnect_curve(m_name+"_l_curveShape")
			disconnect_curve(m_name+"_r_curveShape")
				
			if part == "inner": count = inner_count
			if part == "outer": count = outer_count
			
			for i in range(1, count+1):
				# create poser
				poser = cmds.duplicate(m_name+'_middle_poser', rr=1, n=f"{m_name}_{part}_{i}_poser")[0]
				childs = cmds.listRelatives(poser, allDescendents=1, type="transform")
				for o in childs:
					if cmds.objExists(o):
						cmds.rename(f"{poser}|{o}", o.replace("middle", f"{part}_{i}") )

				mns = cmds.createNode("makeNurbSphere", name=poser+"_makeNurbSphere")
				mult = utils.createNode("multDoubleLinear", name=poser+"_multDoubleLinear")
				cmds.connectAttr(m_name+"_mainPoser.globalSize", mult+".input1")
				cmds.connectAttr(poser+".size", mult+".input2")
				cmds.connectAttr(mult+".output", mns+".radius")
				cmds.connectAttr(mns+".outputSurface", poser+"Shape.create")

				if part == "inner":
					con = cmds.pointConstraint(m_name+'_middle_poser', m_name+'_in_poser', m_name+f'_{part}_{i}_poser', mo=0)[0]
				else:
					con = cmds.pointConstraint(m_name+'_middle_poser', m_name+'_out_poser', m_name+f'_{part}_{i}_poser', mo=0)[0]
				step = 1 / (count + 1)
				w_1 = i * step
				w_2 = 1 - w_1
				cmds.setAttr(f"{con}.{m_name}_middle_poserW0", w_1)
				if part == "inner":
					cmds.setAttr(f"{con}.{m_name}_in_poserW1", w_2)
				else:
					cmds.setAttr(f"{con}.{m_name}_out_poserW1", w_2)
				cmds.delete(con)
				side = "r"
				for side in ["l", "r"]:
					# create control
					c = f"{m_name}_{side}_brow_{part}_{i}"
					gr = cmds.duplicate(m_name+'_c_brow_group', rr=1, n=f"{c}_group")[0]
					childs = cmds.listRelatives(gr, allDescendents=1, type="transform")
					cmds.rename(f"{gr}|{childs[0]}", c)
					utils.setUserAttr(c, "internalName", f"{side}_brow_{part}_{i}")

					l = cmds.spaceLocator(n=f"{c}_loc")[0]
					cmds.parent(l, c)
					utils.resetAttrs(l)
					cmds.parent(gr, f"{m_name}_{side}_brow")
					utils.resetAttrs(gr)
					cmds.deleteAttr(f'{c}.auto')
					cmds.setAttr(f'{c}.sx', k=False)
					cmds.setAttr(f'{c}.sy', k=False)
					cmds.setAttr(f'{c}.sz', k=False)
					cmds.addAttr(c, ln="middleFollow", at="double", min=0, max=1, dv=w_1)

					# create targets
					mid_t = cmds.spaceLocator(n=f"{m_name}_{side}_brow_mid_{part}_{i}_target")[0]
					cmds.parent(mid_t, f"{m_name}_{side}_brow_mid")
					utils.resetAttrs(mid_t)
					if part == "inner":
						out_t = cmds.spaceLocator(n=f"{m_name}_{side}_brow_in_{part}_{i}_target")[0]
						cmds.parent(out_t, f"{m_name}_{side}_brow_in")
					else:
						out_t = cmds.spaceLocator(n=f"{m_name}_{side}_brow_out_{part}_{i}_target")[0]
						cmds.parent(out_t, f"{m_name}_{side}_brow_out")
					utils.resetAttrs(out_t)
					cmds.hide(mid_t, out_t, l)

					if side == "l":
						mm = cmds.createNode("multMatrix", name=mid_t+"_multMatrix")
						cmds.connectAttr(poser+".worldMatrix[0]", mm+".matrixIn[0]")
						cmds.connectAttr(f"{m_name}_middle_poser.worldInverseMatrix[0]", mm+".matrixIn[1]")
						cmds.connectAttr(mm+".matrixSum", mid_t+".offsetParentMatrix")

						mm = cmds.createNode("multMatrix", name=out_t+"_multMatrix")
						cmds.connectAttr(poser+".worldMatrix[0]", mm+".matrixIn[0]")
						if part == "inner":
							cmds.connectAttr(f"{m_name}_in_poser.worldInverseMatrix[0]", mm+".matrixIn[1]")
						else:
							cmds.connectAttr(f"{m_name}_out_poser.worldInverseMatrix[0]", mm+".matrixIn[1]")
						cmds.connectAttr(mm+".matrixSum", out_t+".offsetParentMatrix")

					else:
						cmds.connectAttr(f"{m_name}_l_brow_mid_{part}_{i}_target_multMatrix.matrixSum", mid_t+".offsetParentMatrix")
						if part == "inner":
							cmds.connectAttr(f"{m_name}_l_brow_in_{part}_{i}_target_multMatrix.matrixSum", out_t+".offsetParentMatrix")
						else:
							cmds.connectAttr(f"{m_name}_l_brow_out_{part}_{i}_target_multMatrix.matrixSum", out_t+".offsetParentMatrix")

					mm = cmds.createNode("multMatrix", name=gr.replace("group", "multMatrix"))
					pm = cmds.createNode("pickMatrix", name=gr.replace("group", "pickMatrix"))
					bm = cmds.createNode("blendMatrix", name=gr.replace("group", "blendMatrix"))
					cmds.connectAttr(out_t+".worldMatrix[0]", bm+".inputMatrix")
					cmds.connectAttr(mid_t+".worldMatrix[0]", bm+".target[0].targetMatrix")
					cmds.connectAttr(c+".middleFollow", bm+".envelope")
					cmds.connectAttr(bm+".outputMatrix", pm+".inputMatrix")
					cmds.connectAttr(pm+".outputMatrix", mm+".matrixIn[0]")
					cmds.connectAttr(f"{m_name}_{side}_brow.worldInverseMatrix[0]", mm+".matrixIn[1]")
					cmds.connectAttr(mm+".matrixSum", gr+".offsetParentMatrix")
							
			
		# rebuild init curve
		mel.eval(f'rebuildCurve -ch 1 -rpo 1 -rt 0 -end 1 -kr 0 -kcp 0 -kep 1 -kt 0 -s {inner_count+outer_count+2} -d 1 -tol 0.01 "{m_name}_posers_curve";')
		curve_points_count = inner_count+outer_count+3
		cmds.connectAttr(f"{m_name}_in_poserOrientShape.worldPosition", f"{m_name}_posers_curveShape.controlPoints[0]")
		for i in range(1, inner_count+1):
			cmds.connectAttr(f"{m_name}_inner_{i}_poserOrientShape.worldPosition", f"{m_name}_posers_curveShape.controlPoints[{i}]")
		center_id = i + 1
		cmds.connectAttr(f"{m_name}_middle_poserOrientShape.worldPosition", f"{m_name}_posers_curveShape.controlPoints[{center_id}]")
		for i in range(1, outer_count+1):
			n = center_id + (outer_count - i + 1)
			cmds.connectAttr(f"{m_name}_outer_{i}_poserOrientShape.worldPosition", f"{m_name}_posers_curveShape.controlPoints[{n}]")
		cmds.connectAttr(f"{m_name}_out_poserOrientShape.worldPosition", f"{m_name}_posers_curveShape.controlPoints[{curve_points_count-1}]")


		for side in ["l", "r"]:
			mel.eval(f'rebuildCurve -ch 1 -rpo 1 -rt 0 -end 1 -kr 0 -kcp 0 -kep 1 -kt 0 -s {inner_count+outer_count} -d 3 -tol 0.01 "{m_name}_{side}_curveShape";')
			cmds.connectAttr(f"{m_name}_{side}_brow_in_locShape.worldPosition", f"{m_name}_{side}_curveShape.controlPoints[0]")
			for i in range(1, inner_count+1):
				cmds.connectAttr(f"{m_name}_{side}_brow_inner_{i}_locShape.worldPosition", f"{m_name}_{side}_curveShape.controlPoints[{i}]")
			cmds.connectAttr(f"{m_name}_{side}_brow_mid_locShape.worldPosition", f"{m_name}_{side}_curveShape.controlPoints[{center_id}]")
			for i in range(1, outer_count+1):
				n = center_id + (outer_count - i + 1)
				cmds.connectAttr(f"{m_name}_{side}_brow_outer_{i}_locShape.worldPosition", f"{m_name}_{side}_curveShape.controlPoints[{n}]")
			cmds.connectAttr(f"{m_name}_{side}_brow_out_locShape.worldPosition", f"{m_name}_{side}_curveShape.controlPoints[{curve_points_count-1}]")

		for i in range(1, inner_count+1):
			cmds.connectAttr(f"{m_name}_l_brow_inner_{i}.middleFollow", f"{m_name}_r_brow_inner_{i}.middleFollow")
		for i in range(1, outer_count+1):
			cmds.connectAttr(f"{m_name}_l_brow_outer_{i}.middleFollow", f"{m_name}_r_brow_outer_{i}.middleFollow")