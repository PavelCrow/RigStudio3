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

		w.stackedWidget.setCurrentIndex(0)

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
		# for i in range(1, self.jointsCount+1):
		# 	pos = cmds.getAttr(self.name+"_l_t_lip_%s_outJoint.pos" %(i))
		# 	posData.append(pos)

		optionsData['posData'] = posData

		return optionsData	
	
	def setOptions(self, optionsData):
		# old templates may store optionsData as a bool (no options dict yet)
		if not isinstance(optionsData, dict):
			optionsData = {}

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
		mouth = f"{m_name}_mouth_outJoint"

		def discAttr(attr):
			conns_in = cmds.listConnections(attr, plugs=1, connections=1, s=1, d=0) or []
			sources_in = conns_in[1::2]
			targets_in = conns_in[::2]

			for i,s in enumerate(sources_in):
				cmds.disconnectAttr(s, targets_in[i])

			length = cmds.getAttr(attr, size=True) or 0
			try:
				for i in range(length):
					cmds.removeMultiInstance(f"{attr}[{i}]")
			except: pass

		center_id = count

		bf = pm.PyNode(m_name+"_zip_bifrostGraphShape")

		# delete old
		for f in (f"{m_name}_l_*_lip_local_*", f"{m_name}_r_*_lip_local_*", f"{m_name}_*_lip_*_outJoint"):
			if cmds.objExists(f):
				cmds.delete(f)
		
		# disconnect attributes
		for part in ["t", "b"]:
			discAttr(f"{m_name}_{part}_uvPin.coordinate")    
			discAttr(f"{m_name}_c_{part}_lip_local_group.offsetParentMatrix")    
			discAttr(f"{bf.name()}.{part}_matrix") 
			discAttr(f"{m_name}_c_{part}_lip_outJoint_multMat.matrixIn[2]") 

		discAttr(f"{bf.name()}.parameter") 

		# create
		for part in ["t", "b"]:
			uvPin = pm.PyNode(f"{m_name}_{part}_uvPin")
				
			for i in range(1, count+1):
				pos = 0.5 + 0.5 / (count+1) * i
				for side in ["l", "r"]:
					gr = pm.duplicate(f"{m_name}_c_{part}_lip_local_group", n=f"{m_name}_{side}_{part}_lip_local_{i}_group")[0]
					c = gr.getChildren()[0]
					pm.rename(c, f"{m_name}_{side}_{part}_lip_local_{i}")
					utils.setUserAttr(c.name(), "internalName", f"{side}_{part}_lip_local_{i}")
						
			cmds.connectAttr(f"{m_name}_c_t_lip_local.pos", f"{uvPin}.coordinate[{center_id}].coordinateV")
					
			for side in ["l", "r"]:
				for i in range(1, count+1):
					c = f"{m_name}_{side}_{part}_lip_local_{i}"
					pos = 0.5 + 0.5 / (count+1) * i
					if side == "l": 
						n = center_id+i
					else: 
						n = center_id-i
						
					if side == "l" and part == "t": 
						cmds.setAttr(f"{c}.pos", pos)
						cmds.connectAttr(f"{c}.pos", f"{m_name}_t_uvPin.coordinate[{n}].coordinateV")
						cmds.connectAttr(f"{c}.pos", f"{m_name}_b_uvPin.coordinate[{n}].coordinateV")
						
					if side == "r":
						rev = cmds.createNode("reverse", n=f"{c}_reverse")
						cmds.connectAttr(f"{m_name}_l_t_lip_local_{i}.pos", f"{rev}.inputX")
						cmds.connectAttr(f"{rev}.outputX", f"{uvPin}.coordinate[{n}].coordinateV")
					
					cmds.setAttr(f"{uvPin}.coordinate[{n}].coordinateU", 0.5)
						
					cmds.connectAttr(f"{uvPin}.outputMatrix[{n}]", f"{bf}.{part}_matrix[{n}]")
					cmds.connectAttr(f"{bf}.out_{part}_matrix[{n}]", f"{c}_group.offsetParentMatrix")
					
			cmds.connectAttr(f"{bf}.out_{part}_matrix[{center_id}]", f"{m_name}_c_{part}_lip_local_group.offsetParentMatrix")
			cmds.connectAttr(f"{uvPin}.outputMatrix[{center_id}]", f"{bf}.{part}_matrix[{center_id}]")
			cmds.setAttr(f"{uvPin}.coordinate[{center_id}].coordinateU", 0.5)
			
			for i in range(1, count+1):
				for side in ["l", "r"]:    
					if side == "l": 
						n = center_id+i
					else: 
						n = center_id-i            
					cmds.select(clear=1)
					c = f"{m_name}_{side}_{part}_lip_local_{i}"
					gr = f"{c}_group"
					j = cmds.joint(n=f"{m_name}_{side}_{part}_lip_{i}_outJoint")
					cmds.parent(j, mouth )
					utils.removeTransformParentJoint(j)
					bf_attr = f"out_{part}_matrix[{n}]"
					
					utils.connectByMatrix(j, [c, gr, bf, mouth], ["matrix", "matrix", bf_attr, "worldInverseMatrix[0]"])       
					
		pm.connectAttr(bf.out_t_matrix[center_id], f"{m_name}_c_t_lip_outJoint_multMat.matrixIn[2]")
		pm.connectAttr(bf.out_b_matrix[center_id], f"{m_name}_c_b_lip_outJoint_multMat.matrixIn[2]")

		# connect parameters
		for i in range(1, count+1):
			c = f"{m_name}_l_t_lip_local_{i}"
			rev = cmds.createNode("reverse", n=f"{c}_pos_reverse")
			cmds.connectAttr(f"{c}.pos", f"{rev}.inputX")
			cmds.connectAttr(f"{rev}.outputX", f"{bf.name()}.parameter[{center_id-i}]")
			cmds.connectAttr(f"{c}.pos", f"{bf.name()}.parameter[{center_id+i}]")

		cmds.connectAttr(f"{m_name}_c_t_lip_local.pos", f"{bf.name()}.parameter[{center_id}]")

		# cmds.delete(self.name+"_root_skinJoint")

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

		# for i, pos in enumerate(optionsData["posData"]):
		# 	cmds.setAttr(self.name+"_l_t_lip_%s_skinJoint.pos" %(i+1), pos)

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
			if "_1_" not in o:
				cmds.delete(o)

		# delete posers
		for i in range(2, count_cur+1):
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

		# delete other nodes
		for i in range(2, count_cur+1):
			cmds.delete(f"{m_name}_l_lip_{i}_*")
			cmds.delete(f"{m_name}_r_lip_{i}_*")
			
			
		# disconnect bifrost attributes
		bf = f"{m_name}_sec_controls_bifrostGraphShape"
		attrs = ["t_follow_jaw", "b_follow_jaw", "t_lip_influence", "b_lip_influence", 
		"corner_h_influence", "corner_v_influence", "l_flat_rotateY", "r_flat_rotateY",
		"l_rotate", "r_rotate", "l_translate", "r_translate", "parameter", "init_pos"]

		for a in attrs:
			conns_in = cmds.listConnections(f"{bf}.{a}", plugs=1, connections=1, s=1, d=0) or []
			sources_in = conns_in[1::2]
			targets_in = conns_in[::2]

			for i,s in enumerate(sources_in):
				cmds.disconnectAttr(s, targets_in[i])
			
			length = cmds.getAttr(f"{bf}.{a}", size=True) or 0
			for i in range(length):
				cmds.removeMultiInstance(f"{bf}.{a}[{i}]")
			
		for a in ["out_l_t_lips", "out_l_b_lips", "out_r_t_lips", "out_r_b_lips"]:
			conns_in = cmds.listConnections(f"{bf}.{a}", plugs=1, connections=1, s=0, d=1) or []
			sources_in = conns_in[1::2]
			targets_in = conns_in[::2]

			for i,s in enumerate(sources_in):
				cmds.disconnectAttr(targets_in[i], s)
				
			
		for a in cmds.ls(f"{m_name}_*_lip_*_mpath.rotate") + cmds.ls(f"{m_name}_*_lip_*_mpath.rotateY"):
			uc = pm.PyNode(a).outputs()
			pm.delete(uc)


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
			mult = utils.createNode("multDoubleLinear", name=poser+"_multDoubleLinear")
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
			

		# create control group
		for i in range(2, count+1):
			
			for side in ["l_t", "l_b", "r_t", "r_b"]:
				
				gr = cmds.duplicate(f"{m_name}_{side}_lip_1_group", n=f"{m_name}_{side}_lip_{i}_group")[0]
				c = cmds.listRelatives(gr, type="transform")[0]
				c = cmds.rename(gr+"|"+c, f"{m_name}_{side}_lip_{i}")
				for o in cmds.listRelatives(c, type="transform"):
					cmds.rename(c+"|"+o, o.replace("1", str(i)))

				if "t" in side:
					mp = cmds.createNode("motionPath", n=f"{m_name}_{side[0]}_lip_{i}_mpath")
					fmp = cmds.createNode("motionPath", n=f"{m_name}_{side[0]}_lip_{i}_flat_mpath")
					cmds.connectAttr(f"{m_name}_init_curve_rebuildCurve.outputCurve", f"{mp}.geometryPath")
					cmds.connectAttr(f"{m_name}_flat_rebuildCurve.outputCurve", f"{fmp}.geometryPath")
					cmds.setAttr(mp+".frontAxis", 0)
					cmds.setAttr(mp+".upAxis", 1)
					cmds.setAttr(fmp+".frontAxis", 0)
					cmds.setAttr(fmp+".upAxis", 1)
					
					if side == "l_t":
						npoc = cmds.createNode("nearestPointOnCurve", n=f"{m_name}_{side[0]}_lip_{i}_nearestPointOnCurve")
						cmds.connectAttr(f"{m_name}_init_curve_rebuildCurve.outputCurve", f"{npoc}.inputCurve")
						cmds.connectAttr(f"{m_name}_lip_{i}_pivotShape.worldPosition[0]", f"{npoc}.inPosition")

						add = utils.createNode("addDoubleLinear", n=f"{m_name}_{side[0]}_lip_{i}_uValue_addDoubleLinear")
						mult = utils.createNode("multDoubleLinear", n=f"{m_name}_{side[0]}_lip_{i}_corner_multDoubleLinear")

						cmds.connectAttr(f"{m_name}_l_mouthCorner_moveX_multDoubleLinear.output", f"{mult}.input1")
						cmds.connectAttr(f"{m_name}_l_t_lip_{i}.corner_h_influence", f"{mult}.input2")
						
						cmds.connectAttr(f"{npoc}.parameter", f"{add}.input1")
						cmds.connectAttr(f"{mult}.output", f"{add}.input2")
						
						cmds.connectAttr(f"{add}.output", f"{mp}.uValue")
						cmds.connectAttr(f"{add}.output", f"{fmp}.uValue")
						
					if side == "r_t":
						add = utils.createNode("addDoubleLinear", n=f"{m_name}_{side[0]}_lip_{i}_uValue_addDoubleLinear")
						mult1 = utils.createNode("multDoubleLinear", n=f"{m_name}_{side[0]}_lip_{i}_corner_multDoubleLinear")
						mult2 = utils.createNode("multDoubleLinear", n=f"{m_name}_{side[0]}_lip_{i}_cornerNegate_multDoubleLinear")
						plus = cmds.createNode("plusMinusAverage", n=f"{m_name}_{side[0]}_lip_{i}_reverseU_plusMinusAverage")
						
						cmds.connectAttr(f"{m_name}_r_mouthCorner_moveX_multDoubleLinear.output", f"{mult1}.input1")
						cmds.connectAttr(f"{m_name}_l_t_lip_{i}.corner_h_influence", f"{mult1}.input2")
						cmds.connectAttr(f"{mult1}.output", f"{mult2}.input1")
						cmds.setAttr(f"{mult2}.input2", -1)
						
						cmds.setAttr(f"{plus}.operation", 2)
						cmds.setAttr(f"{plus}.input1D[0]", 1)
						cmds.connectAttr(f"{npoc}.parameter", f"{plus}.input1D[1]")

						cmds.connectAttr(f"{plus}.output1D", f"{add}.input1")
						cmds.connectAttr(f"{mult2}.output", f"{add}.input2")
						
						cmds.connectAttr(f"{add}.output", f"{mp}.uValue")
						cmds.connectAttr(f"{add}.output", f"{fmp}.uValue")


		# set controls
		for i in range(1, count+1):
			c = f"{m_name}_l_t_lip_{i}"
			n = 1/(count+1) * i
			cmds.setAttr(c+".t_lip_influence", 1-n)
			cmds.setAttr(c+".corner_h_influence", n)
			cmds.setAttr(c+".corner_v_influence", n)
			cmds.setAttr(c+".followJaw", n)

			c = f"{m_name}_l_b_lip_{i}"
			cmds.setAttr(c+".b_lip_influence", 1-n)
			cmds.setAttr(c+".followJaw", 1-n)
				
				
		cmds.connectAttr(f"{m_name}_l_t_lip_{count}.worldMatrix[0]", f"{m_name}_l_t_lip_corner_aimMatrix.primaryTargetMatrix", f=1)
		cmds.connectAttr(f"{m_name}_l_b_lip_{count}.worldMatrix[0]", f"{m_name}_l_b_lip_corner_aimMatrix.primaryTargetMatrix", f=1)
		cmds.connectAttr(f"{m_name}_r_t_lip_{count}.worldMatrix[0]", f"{m_name}_r_t_lip_corner_aimMatrix.primaryTargetMatrix", f=1)
		cmds.connectAttr(f"{m_name}_r_b_lip_{count}.worldMatrix[0]", f"{m_name}_r_b_lip_corner_aimMatrix.primaryTargetMatrix", f=1)
						

		# rebuild surfs# rebuild surfs
		cv_count_v = count * 2 + 3

		def connect_surf(loc_shape, cp_index):
			cmds.connectAttr(
				f"{loc_shape}.worldPosition[0]",
				f"{surf_shape}.controlPoints[{cp_index}]"
			)

		for side in ["t", "b"]:
			lip_name = f"{side}_lip"  

			surf_shape = f"{m_name}_{lip_name}_surfShape"

			# disconnect surf
			conns_in = cmds.listConnections(surf_shape, plugs=1, connections=1, s=1, d=0) or []
			sources_in = conns_in[1::2]
			targets_in = conns_in[::2]

			for i,s in enumerate(sources_in):
				cmds.disconnectAttr(s, targets_in[i])

			# rebuild surfs
			mel.eval(
				f'rebuildSurface -ch 1 -rpo 1 -rt 0 -end 1 -kr 0 -kcp 0 -kc 0 '
				f'-su 1 -du 1 -sv {count * 2} -dv 3 -tol 0.01 -fr 0 -dir 2 '
				f'"{m_name}_{lip_name}_surf";'
			)

			# reconnect surf
			for u, suffix in enumerate(["surfUpLoc", "surfDnLoc"]):
				offset = u * cv_count_v  # 0 для Up, cv_count_v для Dn

				# R corner (v=0)
				connect_surf(f"{m_name}_r_{lip_name}_corner_{suffix}Shape", offset + 0)

				# R локаторы: count, count-1, ..., 1
				for i in range(count, 0, -1):
					connect_surf(f"{m_name}_r_{lip_name}_{i}_{suffix}Shape", offset + (count - i + 1))

				# Center (v=center)
				center_id = (cv_count_v - 1) // 2
				connect_surf(f"{m_name}_c_{lip_name}_{suffix}Shape", offset + center_id)

				# L локаторы: 1, 2, ..., count
				for i in range(1, count + 1):
					connect_surf(f"{m_name}_l_{lip_name}_{i}_{suffix}Shape", offset + center_id + i)

				# L corner (v=last)
				connect_surf(f"{m_name}_l_{lip_name}_corner_{suffix}Shape", offset + cv_count_v - 1)


		# connect input bifrost

		for i in range(1, count + 1):
			idx = i - 1

			# b_lip controls
			cmds.connectAttr(f"{m_name}_l_b_lip_{i}.followJaw",          f"{bf}.b_follow_jaw[{idx}]")
			cmds.connectAttr(f"{m_name}_l_b_lip_{i}.b_lip_influence",    f"{bf}.b_lip_influence[{idx}]")

			# t_lip controls
			cmds.connectAttr(f"{m_name}_l_t_lip_{i}.followJaw",          f"{bf}.t_follow_jaw[{idx}]")
			cmds.connectAttr(f"{m_name}_l_t_lip_{i}.t_lip_influence",    f"{bf}.t_lip_influence[{idx}]")
			cmds.connectAttr(f"{m_name}_l_t_lip_{i}.corner_h_influence", f"{bf}.corner_h_influence[{idx}]")
			cmds.connectAttr(f"{m_name}_l_t_lip_{i}.corner_v_influence", f"{bf}.corner_v_influence[{idx}]")

			# pivot локаторы
			cmds.connectAttr(f"{m_name}_lip_{i}_pivotShape.worldPosition[0]", f"{bf}.init_pos[{idx}]")

			# l mpath
			cmds.connectAttr(f"{m_name}_l_lip_{i}_mpath.allCoordinates", f"{bf}.l_translate[{idx}]")
			cmds.connectAttr(f"{m_name}_l_lip_{i}_mpath.rotate",         f"{bf}.l_rotate[{idx}]")
			cmds.connectAttr(f"{m_name}_l_lip_{i}_flat_mpath.rotateY",   f"{bf}.l_flat_rotateY[{idx}]")

			# r mpath
			cmds.connectAttr(f"{m_name}_r_lip_{i}_mpath.allCoordinates", f"{bf}.r_translate[{idx}]")
			cmds.connectAttr(f"{m_name}_r_lip_{i}_mpath.rotate",         f"{bf}.r_rotate[{idx}]")
			cmds.connectAttr(f"{m_name}_r_lip_{i}_flat_mpath.rotateY",   f"{bf}.r_flat_rotateY[{idx}]")

			# nearestPointOnCurve
			cmds.connectAttr(f"{m_name}_l_lip_{i}_nearestPointOnCurve.parameter", f"{bf}.parameter[{idx}]")


		# connect output bifrost

		for i in range(1, count + 1):
			idx = i - 1

			for side in ["l", "r"]:
				for lip in ["t", "b"]:
					cmds.connectAttr(
						f"{bf}.out_{side}_{lip}_lips[{idx}]",
						f"{m_name}_{side}_{lip}_lip_{i}_group.offsetParentMatrix"
					)








