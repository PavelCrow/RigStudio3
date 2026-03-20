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
		w.setJointsCount_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))

		w.setTopEdges_btn.clicked.connect(partial(self.setEdges, w, "top"))
		w.setBottomEdges_btn.clicked.connect(partial(self.setEdges, w, "bottom"))
		w.manual_btn.clicked.connect(partial(self.manual_auto_toggle, w, "manual"))
		w.auto_btn.clicked.connect(partial(self.manual_auto_toggle, w, "auto"))
		w.rebuild_btn.clicked.connect(self.joint_from_edges)

		w.stackedWidget.setCurrentIndex(0)

		GroupLabel(self.widget.manual_label, self.widget.frame_3, self.widget.verticalLayout_6)

		g = GroupLabel(self.widget.secondaryControls_label, self.widget.secondaryControls_groupFrame, self.widget.verticalLayout_9)
		g.mousePressEvent(1)		

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
		
		widget.jointsCount_spinBox.setValue(self.jointsCount)

		widget.topEdges_lineEdit.setText(self.topEdges)
		widget.bottomEdges_lineEdit.setText(self.bottomEdges)

	def getOptions(self): #
		self.jointsCount = int ( ( len(cmds.listRelatives(self.name+'_lipsExtra_controls')) - 2 ) / 4 )

		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
			self.topEdges = optionsData['topEdges']
			self.bottomEdges = optionsData['bottomEdges']				
		else:
			optionsData = {}
			optionsData['topEdges'] = ''
			optionsData['bottomEdges'] = ''			

		optionsData['jointsCount'] = self.jointsCount

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

		self.rebuildWithNewOptions(count=joints_count)

		for i, v in enumerate(t_u_values):
			cmds.setAttr(self.name+f"_l_t_lip_{i+1}_outJoint.pos", v)
			print(111, self.name+f"_l_t_lip_{i+1}_outJoint.pos", v)


	def rebuildWithNewOptions(self, mainInstance=None, widget=None, count=None):
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
			self.rebuildWithNewOptions(count=optionsData["jointsCount"])

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