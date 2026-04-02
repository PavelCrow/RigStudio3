import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
from functools import partial
import maya.OpenMayaUI as OpenMayaUI
import os

from ... import utils, module
from rigStudio3.ui.groupLabel import GroupLabel

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
	from PySide2 import QtWidgets, QtGui, QtUiTools, QtCore
	from shiboken2 import wrapInstance	
else:
	from PySide6 import QtWidgets, QtGui, QtUiTools, QtCore
	from shiboken6 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))


def get_maya_window():
    ptr = OpenMayaUI.MQtUtil.mainWindow()
    if ptr is not None:
        return wrapInstance(int(ptr), QtWidgets.QWidget)
	

def load_ui_widget(uifilename, parent=get_maya_window()):
    loader = QtUiTools.QUiLoader()
    uifile = QtCore.QFile(uifilename)

    uifile.open(QtCore.QFile.ReadOnly)
    ui = loader.load(uifile, parent)
    uifile.close()

    return ui


class Mouth(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.jointsCount = 0
		self.widget = None
		self.topEdges = ''
		self.bottomEdges = ''	

	def connectSignals(self, mainInstance, w): #
		self.mainInstance = mainInstance
		self.widget = w
		w.setJointsCount_btn.clicked.connect(partial(self.regenerate_joints, mainInstance, w))

		w.setTopEdges_btn.clicked.connect(partial(self.setEdges, w, "top"))
		w.setBottomEdges_btn.clicked.connect(partial(self.setEdges, w, "bottom"))
		w.manual_btn.clicked.connect(partial(self.manual_auto_toggle, w, "manual"))
		w.auto_btn.clicked.connect(partial(self.manual_auto_toggle, w, "auto"))
		w.rebuild_btn.clicked.connect(self.joint_from_edges)
		w.setControls_btn.clicked.connect(partial(self.generate_controls, w))

		w.stackedWidget.setCurrentIndex(1)

		GroupLabel(self.widget.manual_label, self.widget.frame_3, self.widget.verticalLayout_6)

		g = GroupLabel(self.widget.secondaryControls_label, self.widget.secondaryControls_groupFrame, self.widget.verticalLayout_9)
		# g.mousePressEvent(1)		

		GroupLabel(self.widget.posers_label, self.widget.posers_groupFrame, self.widget.verticalLayout_10)

	def updateOptionsPage(self, widget):
		module_folder_path = os.path.dirname(__file__)
		pixmap = QtGui.QPixmap(os.path.join(module_folder_path, 'helpImage.png'))
		widget.image_label.setPixmap(pixmap)
		pixmap2 = QtGui.QPixmap(os.path.join(module_folder_path, 'helpImage2.png'))
		widget.image_label_2.setPixmap(pixmap2)
		pixmap3 = QtGui.QPixmap(os.path.join(module_folder_path, 'helpImage3.png'))
		widget.image_label_3.setPixmap(pixmap3)
	
		options = self.getOptions()
		self.jointsCount = options['jointsCount']
		self.controlsCount = options['controlsCount']
		
		widget.jointsCount_spinBox.setValue(self.jointsCount)
		widget.controlsCount_spinBox.setValue(self.controlsCount)

		widget.topEdges_lineEdit.setText(self.topEdges)
		widget.bottomEdges_lineEdit.setText(self.bottomEdges)

	def getOptions(self): #
		self.jointsCount = int ( ( len(cmds.listRelatives(self.name+'_lipsExtra_controls')) - 2 ) / 4 )
		self.controlsCount = int ( len(cmds.listRelatives(self.name+'_sec_controls_group')) / 4 )
		print(1111, self.controlsCount)

		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
			self.topEdges = optionsData['topEdges']
			self.bottomEdges = optionsData['bottomEdges']				
		else:
			optionsData = {}
			optionsData['topEdges'] = ''
			optionsData['bottomEdges'] = ''			

		optionsData['jointsCount'] = self.jointsCount
		optionsData['controlsCount'] = self.controlsCount

		posData = []
		for i in range(1, self.jointsCount+1):
			pos = cmds.getAttr(self.name+"_l_t_lip_%s_outJoint.pos" %(i))
			posData.append(pos)

		optionsData['posData'] = posData

		return optionsData	
	
	def setOptions(self, optionsData):
		
		if 'topEdges' in optionsData:
			self.topEdges = optionsData['topEdges']
		else:
			self.topEdges = ""
			
		if 'bottomEdges' in optionsData:
			self.bottomEdges = optionsData['bottomEdges']
		else:
			self.bottomEdges = ""

		utils.pyToAttr(self.root+'.options', optionsData)

	def joint_from_edges(self):

		def get_u_values(points):
			mel.eval(f'select -r {points}')
			init_crv = cmds.polyToCurve(degree=1,ch=0,n="crv_name")[0]
			mel.eval('rebuildCurve -ch 1 -rpo 1 -rt 0 -end 1 -kr 0 -kcp 1 -kep 1 -kt 0 -s 4 -d 3 -tol 0.01 "crv_name";')

			mel.eval(f'select -r {points}')
			mel.eval('ConvertSelectionToVertices')
			vtx_list = cmds.ls(sl=1, flatten=True)

			vtx_pos = [(vtx, cmds.pointPosition(vtx, world=True)) for vtx in vtx_list]

			# Сортируем по X
			sorted_coords = [pos for vtx, pos in sorted(vtx_pos, key=lambda x: x[1][0])]
			
			info_node = f'{self.name}_nearestPointOnCurve'

			u_values = []
			for vtx_pos in sorted_coords:
				cmds.setAttr(f"{info_node}.inPosition", *vtx_pos)
				# Получаем U параметр (нормализованный 0-1)
				u_value = cmds.getAttr(f"{info_node}.result.parameter") 
				u_values.append(u_value)

			# Удаляем nodes
			cmds.delete(init_crv)			
			
			return u_values[1:-1]

		t_u_values = get_u_values(self.topEdges)
		# b_u_values = get_u_values(self.bottomEdges)

		cmds.select(clear=1)
		joints_count = len(t_u_values)

		self.regenerate_joints(count=joints_count)

		for i, v in enumerate(t_u_values):
			cmds.setAttr(self.name+f"_l_t_lip_{i+1}_outJoint.pos", v)
			print(111, self.name+f"_l_t_lip_{i+1}_outJoint.pos", v)

	def regenerate_joints(self, mainInstance=None, widget=None, count=None):
		if not count:
			count = widget.jointsCount_spinBox.value()

		m_name = self.name

		def connectByMatrix(obj, targets, inputs=[]): 
			dMat = cmds.createNode('decomposeMatrix', n=obj+"_decMat")
			cmds.sets(dMat, e=1, forceElement=m_name+'_nodesSet')
			mMat = cmds.createNode('multMatrix', n=obj+"_multMat")
			cmds.sets(mMat, e=1, forceElement=m_name+'_nodesSet')

			cmds.connectAttr(dMat+".outputTranslateX", obj+'.translateX', f=1)			
			cmds.connectAttr(dMat+".outputTranslateY", obj+'.translateY', f=1)			
			cmds.connectAttr(dMat+".outputTranslateZ", obj+'.translateZ', f=1)
			cmds.connectAttr(dMat+".outputRotateX", obj+'.rotateX', f=1)			
			cmds.connectAttr(dMat+".outputRotateY", obj+'.rotateY', f=1)			
			cmds.connectAttr(dMat+".outputRotateZ", obj+'.rotateZ', f=1)

			cmds.connectAttr(mMat+".matrixSum", dMat+'.inputMatrix')

			for i in range(len(targets)):
				cmds.connectAttr(targets[i]+"."+inputs[i], mMat+'.matrixIn[%s]' %(str(i)) )
			
		# delete old 
		count_cur = int( ( len(cmds.listRelatives(m_name+'_lipsExtra_controls')) - 2 ) / 4 )
		# cmds.delete(m_name+"_root_skinJoint")
		for i in range(1, count_cur+1):
			for n in ["l_t", "r_t", "l_b", "r_b"]:
				name = m_name+"_%s_lip_%s_" %(n,i)
				cmds.delete(name+"outJoint")
				cmds.delete(name+"detail_group")
				
		bf = pm.PyNode(m_name+"_detail_bifrostGraphShape")

		pm.delete(bf.out_bot_lip_rotate.outputs())
		pm.delete(bf.out_top_lip_rotate.outputs())

		conns_out = cmds.listConnections(bf.out_top_pos.name(), plugs=1, connections=1, s=0, d=1) or []
		pm.disconnectAttr(conns_out[0], conns_out[1])
		conns_out = cmds.listConnections(bf.out_bot_pos.name(), plugs=1, connections=1, s=0, d=1) or []
		pm.disconnectAttr(conns_out[0], conns_out[1])

		conns_out = cmds.listConnections(bf.out_top_lip_rotate.name(), plugs=1, connections=1, s=0, d=1) or []
		node = pm.PyNode(conns_out[1].split(".")[0]).outputs()[0]
		pm.disconnectAttr(conns_out[0], node.rotate)
		conns_out = cmds.listConnections(bf.out_bot_lip_rotate.name(), plugs=1, connections=1, s=0, d=1) or []
		node = pm.PyNode(conns_out[1].split(".")[0]).outputs()[0]
		pm.disconnectAttr(conns_out[0], node.rotate)

		length = cmds.getAttr(f"{bf}.pos", size=True) or 0
		for i in range(length):
			cmds.removeMultiInstance(f"{bf}.pos[{i}]")		

		# create new
		bf.left_joints_count.set(count)

		for side in ["l_t", "r_t", "l_b", "r_b"]:
			for i in range(1, count+1):
				gr = pm.duplicate(m_name+"_c_t_lip_detail_group", n=f"{m_name}_{side}_lip_{i}_detail_group")[0]
				c = pm.listRelatives(gr)[0]
				c.rename(f"{m_name}_{side}_lip_{i}_detail")
				j = pm.joint(n=f"{m_name}_{side}_lip_{i}_outJoint")
				j.segmentScaleCompensate.set(0)
				pm.parent(j, m_name+"_mouth_outJoint")
				utils.removeTransformParentJoint(j.name())
				connectByMatrix(j, [c, gr], ["matrix", "matrix"])
				c.s >> j.s
				if "l" in side:
					n = count+i
				elif "r" in side:
					n = i-1
				
				if "t" in side:
					pm.connectAttr(bf.out_top_pos[n], gr.translate)
					pm.connectAttr(bf.out_top_lip_rotate[n], gr.r)
				if "b" in side:
					pm.connectAttr(bf.out_bot_pos[n], gr.translate)
					pm.connectAttr(bf.out_bot_lip_rotate[n], gr.r)
					
				pm.connectAttr('mouth_mainPoser_decomposeMatrix.outputScale', gr.s)
				
				if "r" in side:
					m = utils.createNode("multDoubleLinear", pymel=True)
					pm.connectAttr('mouth_mainPoser_decomposeMatrix.outputScaleX', m.input1)
					m.input2.set(-1)
					m.output >> gr.sx
				
				if side == "l_t":
					pm.addAttr(j, ln="pos", at='double', min=0.5, max=1, k=1)
					j.pos >> bf.pos[i-1]
					j.pos.set(0.5/(count+1)*i+0.5)
				
		gr = pm.PyNode(m_name+"_c_t_lip_detail_group")
		pm.connectAttr(bf.out_top_pos[count], gr.translate, f=1)
		pm.connectAttr(bf.out_top_lip_rotate[count], gr.r, f=1)
		gr = pm.PyNode(m_name+"_c_b_lip_detail_group")
		pm.connectAttr(bf.out_bot_pos[count], gr.translate, f=1)
		pm.connectAttr(bf.out_bot_lip_rotate[count], gr.r, f=1)



		# self.addSkinJoints()
		

		if self.widget:
			self.updateOptionsPage(self.widget)

	def slider_update(self, widget, id, v):
		value = round(v * 0.0001, 4)
		eval("widget.lineEdit.setText(str(%s))" %value)

		cmds.setAttr(self.name+"_l_t_lip_%s_skinJoint.pos" %id, value)

	def sliderValue_update(self, widget):
		v = float( eval("widget.lineEdit.text()") ) * 10000
		eval("widget.slider.setValue(%s)" %v)

	def getData(self): #
		data = super(self.__class__, self).getData()
		data['optionsData'] = self.getOptions()
		return data	

	def setData(self, data, sym=False, namingForce=False, load="all"): #
		super(self.__class__, self).setData(data, sym, namingForce, load)

		count_cur = int ( ( len(cmds.listRelatives(self.name+'_lipsExtra_controls')) - 2 ) / 4 )

		optionsData = data["optionsData"]

		if count_cur != optionsData["jointsCount"]:
			self.regenerate_joints(count=optionsData["jointsCount"])

		for i, pos in enumerate(optionsData["posData"]):
			cmds.setAttr(self.name+"_l_t_lip_%s_skinJoint.pos" %(i+1), pos)

		if self.widget:
			self.updateOptionsPage(self.widget)

	def setEdges(self, widget, side):
		edges = cmds.ls(sl=1)

		edges_string = ""
		for e in edges:
			edges_string += e
			edges_string += " "
	
		options = self.getOptions()
		options[side+'Edges'] = edges_string
		self.setOptions(options)	

		w_lineEdit = eval("widget.%sEdges_lineEdit" %side)
		w_lineEdit.setText(edges_string)			
	
	def manual_auto_toggle(self, w, type):
		if type == "manual":
			w.stackedWidget.setCurrentIndex(0)
		else:
			w.stackedWidget.setCurrentIndex(1)

	def generate_controls(self, widget):

		count = widget.controlsCount_spinBox.value()
		m_name = self.name

		def resetAttrs(o):
			cmds.setAttr(o+".t", 0,0,0)
			cmds.setAttr(o+".r", 0,0,0)
			cmds.setAttr(o+".s", 1,1,1)

		count_cur = int( len( cmds.listRelatives(m_name+'_sec_controls_group') ) / 4 )

		# delete control groups
		for o in cmds.listRelatives(m_name+'_sec_controls_group'):
			if "_1_" in o: continue
			cmds.delete(o)

		# delete posers
		for i in range(2, count_cur+1):
			print(i)
			cmds.delete(f"{m_name}_lip_{i}_poser")

		# disconnect init curve
		conns_in = cmds.listConnections(m_name+"_init_curveShape", plugs=1, connections=1, s=1, d=0) or []
		sources_in = conns_in[1::2]
		targets_in = conns_in[::2]

		for i,s in enumerate(sources_in):
			cmds.disconnectAttr(s, targets_in[i])

		for s in sources_in:
			o = s.split(".")[0]
			if "_1_" in o:
				continue
			if "corner" in o:
				continue
			if cmds.objectType(o) != "multiplyDivide":
				continue
			cmds.delete(o)


		# delete targets
		for gr in ["l_mouthCorner", "r_mouthCorner", "t_lip", "t_lip_group", "b_lip", "b_lip_group", "jaw", "lips"]:
			for o in cmds.listRelatives(f"{m_name}_{gr}"):
				if "_1_" not in o and "target" in o:
					cmds.delete(o)
			

		# create posers
		con = cmds.pointConstraint(m_name+'_lip_corner_poser', m_name+'_c_lip_poser', m_name+f'_lip_1_poser', mo=0)[0]
		step = 1 / (count + 1)
		w_1 = step
		w_2 = 1 - w_1
		cmds.setAttr(f"{con}.mouth_lip_corner_poserW0", w_1)
		cmds.setAttr(f"{con}.mouth_c_lip_poserW1", w_2)
		cmds.delete(con)

		for i in range(2, count+1):
			poser = cmds.duplicate(m_name+'_lip_1_poser', rr=1, n=f"{m_name}_lip_{i}_poser")[0]

			childs = cmds.listRelatives(poser, allDescendents=1, type="transform")
			for o in childs:
				if cmds.objExists(o):
					cmds.rename(f"{poser}|{o}", o.replace("1", str(i) ) )

			mns = cmds.createNode("makeNurbSphere", name=poser+"_makeNurbSphere")
			mult = cmds.createNode("multDoubleLinear", name=poser+"_multDoubleLinear")
			cmds.connectAttr(m_name+"_mainPoser.globalSize", mult+".input1")
			cmds.connectAttr(poser+".size", mult+".input2")
			cmds.connectAttr(mult+".output", mns+".radius")
			cmds.connectAttr(mns+".outputSurface", poser+"Shape.create")

			con = cmds.pointConstraint(m_name+'_lip_corner_poser', m_name+'_lip_1_poser', m_name+f'_lip_{i}_poser', mo=0)[0]
			step = 1 / count
			w_1 = (i-1) * step
			w_2 = 1 - w_1
			cmds.setAttr(f"{con}.mouth_lip_corner_poserW0", w_1)
			cmds.setAttr(f"{con}.mouth_lip_1_poserW1", w_2)
			cmds.delete(con)


		# rebuild init curve
		mel.eval(f'rebuildCurve -ch 1 -rpo 1 -rt 0 -end 1 -kr 0 -kcp 0 -kep 1 -kt 0 -s {count*2} -d 3 -tol 0.01 "{m_name}_init_curve";')

		curve_points_count = count*2+3
		center_id = int((curve_points_count-1)/2)
		cmds.connectAttr(f"{m_name}_lip_corner_init_mirror_multiplyDivide.output", f"{m_name}_init_curveShape.controlPoints[0]")
		cmds.connectAttr(f"{m_name}_lip_corner_poserOrientShape.worldPosition", f"{m_name}_init_curveShape.controlPoints[{curve_points_count-1}]")
		cmds.connectAttr(f"{m_name}_c_lip_poserOrientShape.worldPosition", f"{m_name}_init_curveShape.controlPoints[{center_id}]")

		for i in range(1, count+1):
			if i != 1:
				mult = cmds.createNode("multiplyDivide", name=f"{m_name}_lip_{i}_init_mirror_multiplyDivide")
				cmds.connectAttr(f"{m_name}_lip_{i}_pivotShape.worldPosition", f"{mult}.input1")
				cmds.setAttr(f"{mult}.input2X", -1)

			cmds.connectAttr(f"{m_name}_lip_{i}_init_mirror_multiplyDivide.output", f"{m_name}_init_curveShape.controlPoints[{center_id-i}]")
			cmds.connectAttr(f"{m_name}_lip_{i}_pivotShape.worldPosition", f"{m_name}_init_curveShape.controlPoints[{center_id+i}]")
			

		# disconnect bifrost attributes
		conns_in = cmds.listConnections(f"{m_name}_detail_bifrostGraphShape.t_crv_control_points", plugs=1, connections=1, s=1, d=0) or []
		sources_in = conns_in[1::2]
		targets_in = conns_in[::2]

		for i,s in enumerate(sources_in):
			cmds.disconnectAttr(s, targets_in[i])
			
		length = cmds.getAttr(f"{m_name}_detail_bifrostGraphShape.t_crv_control_points", size=True) or 0
		for i in range(length):
			cmds.removeMultiInstance(f"{m_name}_detail_bifrostGraphShape.t_crv_control_points[{i}]")

		cmds.connectAttr(f"{m_name}_r_lip_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.t_crv_control_points[0]")
		cmds.connectAttr(f"{m_name}_c_t_lip_loc.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.t_crv_control_points[{center_id}]")
		cmds.connectAttr(f"{m_name}_l_lip_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.t_crv_control_points[{curve_points_count-1}]")

		conns_in = cmds.listConnections(f"{m_name}_detail_bifrostGraphShape.b_crv_control_points", plugs=1, connections=1, s=1, d=0) or []
		sources_in = conns_in[1::2]
		targets_in = conns_in[::2]

		for n,s in enumerate(sources_in):
			cmds.disconnectAttr(s, targets_in[n])
			
		length = cmds.getAttr(f"{m_name}_detail_bifrostGraphShape.b_crv_control_points", size=True) or 0
		for n in range(length):
			cmds.removeMultiInstance(f"{m_name}_detail_bifrostGraphShape.b_crv_control_points[{n}]")

		cmds.connectAttr(f"{m_name}_r_lip_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.b_crv_control_points[0]")
		cmds.connectAttr(f"{m_name}_c_b_lip_loc.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.b_crv_control_points[{center_id}]")
		cmds.connectAttr(f"{m_name}_l_lip_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.b_crv_control_points[{curve_points_count-1}]")

		cmds.connectAttr(f"{m_name}_l_t_lip_1_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.t_crv_control_points[{center_id+1}]")
		cmds.connectAttr(f"{m_name}_l_b_lip_1_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.b_crv_control_points[{center_id+1}]")
		cmds.connectAttr(f"{m_name}_r_t_lip_1_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.t_crv_control_points[{center_id-1}]")
		cmds.connectAttr(f"{m_name}_r_b_lip_1_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.b_crv_control_points[{center_id-1}]")

		# Connect first lips controls attributes
		cmds.setAttr(f"{m_name}_l_t_lip_1.t_lip_influence", cmds.getAttr(f"{m_name}_l_t_lip_1_reverse.outputX"))
		cmds.setAttr(f"{m_name}_l_b_lip_1.b_lip_influence", cmds.getAttr(f"{m_name}_l_t_lip_1_reverse.outputX"))
		cmds.setAttr(f"{m_name}_l_t_lip_1.corner_influence", cmds.getAttr(f"{m_name}_l_t_lip_1_multiplyDivide.outputX"))

		# create control group
		for i in range(2, count+1):

			for side in ["l_t", "l_b", "r_t", "r_b"]:
					
				gr = cmds.duplicate(f"{m_name}_{side}_lip_1_group", n=f"{m_name}_{side}_lip_{i}_group")[0]
				c = cmds.listRelatives(gr, type="transform")[0]
				c = cmds.rename(gr+"|"+c, f"{m_name}_{side}_lip_{i}")
				l = cmds.listRelatives(c, type="transform")[0]
				l = cmds.rename(c+"|"+l, f"{m_name}_{side}_lip_{i}_loc")
				cmds.hide(l)

				# create targets
				for drv in ["corner", "lip", "jaw", "mouth"]:
					drv = "lip"
				lip_l = cmds.spaceLocator(n=f"{c}_lip_target")[0]
				lip_init_l = cmds.spaceLocator(n=f"{c}_lip_init_target")[0]
				cmds.parent(lip_l, f"{m_name}_{side[-1]}_lip")
				resetAttrs(lip_l)
				cmds.parent(lip_init_l, f"{m_name}_{side[-1]}_lip_group")
				resetAttrs(lip_init_l)
				cmds.hide(lip_l, lip_init_l)

				mp = cmds.createNode("motionPath", n=f"{m_name}_{c}_init_mpath")
				cmds.setAttr(f"{mp}.frontAxis", 0)
				cmds.setAttr(f"{mp}.upAxis", 1)
				npc = cmds.createNode("nearestPointOnCurve", n=f"{m_name}_{c}_nearestPointOnCurve")
				cm = cmds.createNode("composeMatrix", n=f"{m_name}_{c}_composeMatrix")
				mm = cmds.createNode("multMatrix", n=f"{lip_l}_multMatrix")
				cmds.connectAttr(f"{m_name}_init_curve_rebuildCurve.outputCurve", f"{mp}.geometryPath")
				cmds.connectAttr(f"{m_name}_init_curve_rebuildCurve.outputCurve", f"{npc}.inputCurve")
				cmds.connectAttr(f"{m_name}_lip_{i}_pivotShape.worldPosition[0]", f"{npc}.inPosition")
				cmds.connectAttr(f"{npc}.parameter", f"{mp}.uValue")
				cmds.connectAttr(f"{mp}.allCoordinates", f"{cm}.inputTranslate")
				cmds.connectAttr(f"{mp}.rotate", f"{cm}.inputRotate")
				cmds.connectAttr(f"{m_name}_mouth_poser_decomposeMatrix.outputScale", f"{cm}.inputScale")
				cmds.connectAttr(f"{cm}.outputMatrix", f"{mm}.matrixIn[0]")
				cmds.connectAttr(f"{m_name}_{side[-1]}_mouth_poser.worldInverseMatrix[0]", f"{mm}.matrixIn[1]")
				if side[0] == "r":
					cmds.connectAttr(f"{m_name}_reverse_composeMatrix.outputMatrix", f"{mm}.matrixIn[2]")
				cmds.connectAttr(f"{mm}.matrixSum", f"{lip_l}.offsetParentMatrix")
				cmds.connectAttr(f"{mm}.matrixSum", f"{lip_init_l}.offsetParentMatrix")

				bm = cmds.createNode("blendMatrix", n=f"{c}_lip_blendMatrix")
				mm2 = cmds.createNode("multMatrix", n=f"{c}_lip_multMatrix")
				cmds.connectAttr(f"{c.replace('_r_', '_l_')}.{side[-1]}_lip_influence", f"{bm}.envelope")
				cmds.connectAttr(f"{lip_l}.worldMatrix[0]", f"{mm2}.matrixIn[0]")
				cmds.connectAttr(f"{lip_init_l}.worldInverseMatrix[0]", f"{mm2}.matrixIn[1]")
				cmds.connectAttr(f"{mm2}.matrixSum", f"{bm}.target[0].targetMatrix")


				mouth_l = cmds.spaceLocator(n=f"{c}_mouth_target")[0]
				if side[-1] == "t":
					cmds.parent(mouth_l, f"{m_name}_lips")
				elif side[-1] == "b":
					cmds.parent(mouth_l, f"{m_name}_jaw")
				resetAttrs(mouth_l)
				mm3 = cmds.createNode("multMatrix", n=f"{mouth_l}_multMatrix")
				cmds.connectAttr(f"{cm}.outputMatrix", f"{mm3}.matrixIn[0]")
				if side[-1] == "t":
					cmds.connectAttr(f"{m_name}_lips_poser.worldInverseMatrix[0]", f"{mm3}.matrixIn[1]")
				elif side[-1] == "b":
					cmds.connectAttr(f"{m_name}_jaw_poserOrient.worldInverseMatrix[0]", f"{mm3}.matrixIn[1]")
				if side[0] == "r":
					cmds.connectAttr(f"{m_name}_reverse_composeMatrix.outputMatrix", f"{mm3}.matrixIn[2]")
				cmds.connectAttr(f"{mm3}.matrixSum", f"{mouth_l}.offsetParentMatrix")
				cmds.hide(mouth_l)

				corner_l = cmds.spaceLocator(n=f"{c}_corner_target")[0]
				cmds.parent(corner_l, f"{m_name}_{side[0]}_mouthCorner")
				resetAttrs(corner_l)
				mm4 = cmds.createNode("multMatrix", n=f"{corner_l}_multMatrix")
				cmds.connectAttr(f"{cm}.outputMatrix", f"{mm4}.matrixIn[0]")
				cmds.connectAttr(f"{m_name}_corner_init_blendMatrix.outputMatrix", f"{mm4}.matrixIn[1]")
				cmds.connectAttr(f"{mm4}.matrixSum", f"{corner_l}.offsetParentMatrix")

				bm2 = cmds.createNode("blendMatrix", n=f"{c}_corner_blendMatrix")
				cmds.connectAttr(f"{m_name}_l_t_lip_{i}.corner_influence", f"{bm2}.envelope")
				cmds.connectAttr(f"{mouth_l}.worldMatrix[0]", f"{bm2}.inputMatrix")
				cmds.connectAttr(f"{corner_l}.worldMatrix[0]", f"{bm2}.target[1].targetMatrix")

				mm5 = cmds.createNode("multMatrix", n=f"{c}_multMatrix")
				cmds.connectAttr(f"{bm}.outputMatrix", f"{mm5}.matrixIn[0]")
				cmds.connectAttr(f"{bm2}.outputMatrix", f"{mm5}.matrixIn[1]")
				cmds.connectAttr(f"{m_name}_sec_controls_group.worldInverseMatrix[0]", f"{mm5}.matrixIn[2]")

				cmds.connectAttr(f"{mm5}.matrixSum", f"{c}_group.offsetParentMatrix")
				cmds.hide(corner_l)

				# connect control attributes
				if side == "l_t": 
					add = cmds.createNode("addDoubleLinear", n=f"{c}_corner_influence_addDoubleLinear")
					mult = cmds.createNode("multiplyDivide", n=f"{c}_corner_influence_multiplyDivide")
					rev = cmds.createNode("reverse", n=f"{c}_lip_influence_reverse")
					cmds.connectAttr(f"{npc}.parameter", f"{add}.input1")
					cmds.setAttr(f"{add}.input2", -0.5)
					cmds.connectAttr(f"{add}.output", f"{mult}.input1X")
					cmds.setAttr(f"{mult}.operation", 2)
					cmds.setAttr(f"{mult}.input2X", 0.5)
					cmds.connectAttr(f"{mult}.outputX", f"{rev}.inputX")
					cmds.setAttr(f"{c}.corner_influence", cmds.getAttr(f"{mult}.outputX"))
					cmds.setAttr(f"{c}.t_lip_influence", cmds.getAttr(f"{rev}.outputX"))
					
					# connect last poser to corner aimconstraint
					if i == count:
						cmds.connectAttr(f"{m_name}_lip_{i}_poser.worldMatrix[0]", f"{m_name}_lip_corner_poser_aimConstraint.worldUpMatrix")

				if side == "l_b": 
					cmds.setAttr(f"{c}.b_lip_influence", cmds.getAttr(f"{rev}.outputX"))

				# connect bifrost attributes
				if side[0] == "l":
					id = center_id+i
				else:
					id = center_id-i
					
				cmds.connectAttr(f"{c}_locShape.worldPosition[0]", f"{m_name}_detail_bifrostGraphShape.{side[-1]}_crv_control_points[{id}]")
