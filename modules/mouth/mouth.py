import maya.cmds as cmds
from functools import partial
import maya.OpenMayaUI as OpenMayaUI
import os

from ... import utils, module

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

	def connectSignals(self, mainInstance, w): #
		self.mainInstance = mainInstance
		self.widget = w
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))

	def updateOptionsPage(self, widget):
		module_folder_path = os.path.dirname(__file__)
		pixmap = QtGui.QPixmap(os.path.join(module_folder_path, 'helpImage.png'))
		widget.image_label.setPixmap(pixmap)
	
		options = self.getOptions()
		self.jointsCount = options['jointsCount']
		
		widget.jointsCount_spinBox.setValue(self.jointsCount)
		
		widget.frame_6.setVisible(False)

		# # delete old feather widgets
		# for x in range(self.widget.pos_verticalLayout.count()):
		# 	w = self.widget.pos_verticalLayout.itemAt(x).widget()
		# 	w.deleteLater()

		# # add feathers widgets
		# path = os.path.join(self.mainInstance.rootPath, "modules", self.type, "inbetweenJointPos_widget.ui")

		# for i, pos in enumerate(options['posData']):
		# 	id = i + 1
		# 	w = load_ui_widget(path)
		# 	self.widget.pos_verticalLayout.addWidget(w)

		# 	w.label.setText("Pos "+str(id))

		# 	w.slider.valueChanged.connect(partial(self.slider_update, w, id))
		# 	w.lineEdit.editingFinished.connect(partial(self.sliderValue_update, w))

		# 	w.slider.setValue(pos*10000)

	def getOptions(self): #
		self.jointsCount = int ( ( len(cmds.listRelatives(self.name+'_lipsExtra_controls')) - 2 ) / 4 )

		optionsData = {}
		optionsData['jointsCount'] = self.jointsCount

		posData = []
		for i in range(1, self.jointsCount+1):
			pos = cmds.getAttr(self.name+"_l_t_lip_%s_outJoint.pos" %(i))
			posData.append(pos)

		optionsData['posData'] = posData

		return optionsData	
	
	def rebuildWithNewOptions(self, mainInstance=None, widget=None, count=None):
		if not count:
			count = widget.jointsCount_spinBox.value()

		m_name = self.name
		center_c_int_name = "c_t_lip_detail"
		center_c_t_name = utils.getControlNameFromInternal(m_name, center_c_int_name)
		center_c_b_name = center_c_t_name.replace("_t_", "_b_")

		# delete old 
		count_cur = int( ( len(cmds.listRelatives(m_name+'_lipsExtra_controls')) - 2 ) / 4 )
		cmds.delete(m_name+"_root_skinJoint")
		for i in range(1, count_cur+1):
			for n in ["l_t", "r_t", "l_b", "r_b"]:
				name = m_name+"_%s_lip_%s_" %(n,i)
				cmds.delete(name+"outJoint")
				cmds.delete(name+"detail_group")
				cmds.delete(name+"outJoint_decMat")
				cmds.delete(name+"outJoint_multMat")

		step = 0.5/(count+1)

		cmds.setAttr(m_name+"_c_t_lip_detail_multDoubleLinear_1.input2", count)
		cmds.setAttr(m_name+"_c_t_lip_detail_multDoubleLinear_2.input2", count)

		for i in range(1, count+1):
			c = center_c_t_name.replace("c_t_lip_", "l_t_lip_%s_" %i)
			center_c_name = center_c_t_name

			pos = 0.5 + step * i
					
			# l_t
			gr = cmds.duplicate(center_c_name+"_group")[0]
			gr = cmds.rename(gr, c+"_group")
			cmds.rename(gr+"|"+center_c_name, c)
			cmds.setAttr(c+".internalName", l=0)
			cmds.setAttr(c+".internalName", c[len(m_name)+1:], type="string")
			cmds.setAttr(c+".internalName", l=1)

			pb = cmds.createNode("pairBlend", n=c+"_pairBlend")
			uc1 = cmds.createNode("unitConversion", n=c+"_unitConversion_1")
			uc2 = cmds.createNode("unitConversion", n=c+"_unitConversion_2")
			mp = cmds.createNode("motionPath", n=c+"_motionPath")
			rmp = cmds.createNode("remapValue", n=c+"_remapValue")
			add1 = cmds.createNode("addDoubleLinear", n=c+"_addDoubleLinear_1")
			add2 = cmds.createNode("addDoubleLinear", n=c+"_addDoubleLinear_2")
			add3 = cmds.createNode("addDoubleLinear", n=c+"_addDoubleLinear_3")
			mult1 = cmds.createNode("multDoubleLinear", n=c+"_multDoubleLinear_1")
			mult2 = cmds.createNode("multDoubleLinear", n=c+"_multDoubleLinear_2")
			sr1 = cmds.createNode("setRange", n=c+"_setRange_1")
			sr2 = cmds.createNode("setRange", n=c+"_setRange_2")
			plus1 = cmds.createNode("plusMinusAverage", n=c+"_plusMinusAverage_1")
			plus2 = cmds.createNode("plusMinusAverage", n=c+"_plusMinusAverage_2")
			j = cmds.duplicate(m_name+"_c_t_lip_outJoint", n=c.replace("detail", "outJoint"))[0]

			utils.connectByMatrix(j, [c, gr, m_name+"_root_poser", m_name+"_root_rel_lips_multMatrix"], inputs=["matrix", "matrix", "worldInverseMatrix", "matrixSum"], module_name=m_name, attrs=['t', 'r'])
			cmds.connectAttr(c+".s", j+".s")

			cmds.connectAttr(pb+".outTranslate", gr+".translate")
			cmds.connectAttr(pb+".outRotateX", gr+".rx")
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScale", gr+".s")

			cmds.connectAttr(m_name+"_static_t_lips.rx", uc1+".input")
			cmds.connectAttr(m_name+"_static_b_lips.rx", uc2+".input")
			cmds.connectAttr(uc1+".output", pb+".inRotateX1")
			cmds.connectAttr(uc2+".output", pb+".inRotateX2")

			cmds.setAttr(mp+".frontAxis", 0)
			cmds.setAttr(mp+".upAxis", 1)
			cmds.addAttr(j, ln="pos", at="double", min=0, max=1, k=1)
			cmds.connectAttr(j+".pos", mp+".uValue")
			cmds.connectAttr(m_name+"_t_lip_curveShape.worldSpace[0]", mp+".geometryPath")
			cmds.connectAttr(mp+".allCoordinates", pb+".inTranslate1")

			# cmds.connectAttr(add1+".output", clp+".inputR")
			# cmds.setAttr(clp+".maxR", 0.5)
			# cmds.connectAttr(clp+".outputR", pb+".weight")
			cmds.connectAttr(add1+".output", rmp+".inputValue")
			cmds.setAttr(rmp+".inputMax", 0.5)
			cmds.setAttr(rmp+".outputMax", 0.5)
			cmds.setAttr(rmp+".value[0].value_Interp", 2)
			cmds.connectAttr(rmp+".outValue", pb+".weight")

			cmds.setAttr(sr1+".maxX", 0.5)
			cmds.setAttr(sr2+".maxX", 0.5)
			cmds.connectAttr(sr1+".outValueX", add1+".input1")
			cmds.connectAttr(sr2+".outValueX", add1+".input2")

			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputX", add2+".input1")
			cmds.connectAttr(add2+".output", sr1+".oldMaxX")
			cmds.connectAttr(m_name+"_l_mouthCorner.zip", sr1+".valueX")
			cmds.setAttr(plus1+".operation", 2)
			cmds.connectAttr(plus1+".output1D", sr1+".oldMinX")
			cmds.connectAttr(add2+".output", plus1+".input1D[0]")
			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputX", plus1+".input1D[1]")

			cmds.setAttr(mult1+".input1", 0.1)
			cmds.setAttr(mult1+".input2", count-i)
			cmds.connectAttr(mult1+".output", add2+".input2")

			cmds.connectAttr(add3+".output", sr2+".oldMaxX")
			cmds.connectAttr(plus2+".output1D", sr2+".oldMinX")
			cmds.connectAttr(m_name+"_r_mouthCorner.zip", sr2+".valueX")

			cmds.setAttr(plus2+".operation", 2)
			cmds.connectAttr(add3+".output", plus2+".input1D[0]")
			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputY", plus2+".input1D[1]")
			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputY", add3+".input1")

			cmds.setAttr(mult2+".input1", 0.1)
			cmds.setAttr(mult2+".input2", count+i)
			cmds.connectAttr(mult2+".output", add3+".input2")

			cmds.setAttr(j+".pos", pos)
			



			# l_b
			c = center_c_name.replace("c_t_lip_", "l_b_lip_%s_" %i)
			gr = cmds.duplicate(center_c_b_name+"_group")[0]
			gr = cmds.rename(gr, c+"_group")
			cmds.rename(gr+"|"+center_c_b_name, c)
			cmds.setAttr(c+".internalName", l=0)
			cmds.setAttr(c+".internalName", c[len(m_name)+1:], type="string")
			cmds.setAttr(c+".internalName", l=1)

			pb = cmds.createNode("pairBlend", n=c+"_pairBlend")
			mp = cmds.createNode("motionPath", n=c+"_motionPath")
			j = cmds.duplicate(m_name+"_c_t_lip_outJoint", n=c.replace("detail", "outJoint"))[0]

			utils.connectByMatrix(j, [c, gr, m_name+"_root_poser", m_name+"_root_rel_lips_multMatrix"], inputs=["matrix", "matrix", "worldInverseMatrix", "matrixSum"], module_name=m_name, attrs=['t', 'r'])
			cmds.connectAttr(c+".s", j+".s")

			cmds.connectAttr(pb+".outTranslate", gr+".translate")
			cmds.connectAttr(pb+".outRotateX", gr+".rx")
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScale", gr+".s")

			cmds.connectAttr(uc2+".output", pb+".inRotateX1")
			cmds.connectAttr(uc1+".output", pb+".inRotateX2")

			cmds.setAttr(mp+".frontAxis", 0)
			cmds.setAttr(mp+".upAxis", 1)
			cmds.connectAttr(j.replace("_b_", "_t_")+".pos", mp+".uValue")
			cmds.connectAttr(m_name+"_b_lip_curveShape.worldSpace[0]", mp+".geometryPath")
			cmds.connectAttr(mp+".allCoordinates", pb+".inTranslate1")
			cmds.connectAttr(mp+".allCoordinates", pb.replace("_b_", "_t_")+".inTranslate2")
			cmds.connectAttr(mp.replace("_b_", "_t_")+".allCoordinates", pb+".inTranslate2")
			# cmds.connectAttr(clp+".outputR", pb+".weight")
			cmds.connectAttr(rmp+".outValue", pb+".weight")




			# r_t
			c = center_c_t_name.replace("c_t_lip_", "r_t_lip_%s_" %i)
			gr = cmds.duplicate(center_c_name+"_group")[0]
			gr = cmds.rename(gr, c+"_group")
			cmds.rename(gr+"|"+center_c_name, c)
			cmds.setAttr(c+".internalName", l=0)
			cmds.setAttr(c+".internalName", c[len(m_name)+1:], type="string")
			cmds.setAttr(c+".internalName", l=1)

			cmds.connectAttr(c.replace("_r_", "_l_")+"Shape.worldSpace[0]", c+"Shape.create")

			pb = cmds.createNode("pairBlend", n=c+"_pairBlend")
			uc1 = cmds.createNode("unitConversion", n=c+"_unitConversion_1")
			uc2 = cmds.createNode("unitConversion", n=c+"_unitConversion_2")
			mp = cmds.createNode("motionPath", n=c+"_motionPath")
			# clp = cmds.createNode("clamp", n=c+"_clamp")
			rmp = cmds.createNode("remapValue", n=c+"_remapValue")
			add1 = cmds.createNode("addDoubleLinear", n=c+"_addDoubleLinear_1")
			add2 = cmds.createNode("addDoubleLinear", n=c+"_addDoubleLinear_2")
			add3 = cmds.createNode("addDoubleLinear", n=c+"_addDoubleLinear_3")
			mult1 = cmds.createNode("multDoubleLinear", n=c+"_multDoubleLinear_1")
			mult2 = cmds.createNode("multDoubleLinear", n=c+"_multDoubleLinear_2")
			mult3 = cmds.createNode("multDoubleLinear", n=c+"_multDoubleLinear_3")
			sr1 = cmds.createNode("setRange", n=c+"_setRange_1")
			sr2 = cmds.createNode("setRange", n=c+"_setRange_2")
			plus1 = cmds.createNode("plusMinusAverage", n=c+"_plusMinusAverage_1")
			plus2 = cmds.createNode("plusMinusAverage", n=c+"_plusMinusAverage_2")
			rev = cmds.createNode("reverse", n=c+"_reverse")
			j = cmds.duplicate(m_name+"_c_t_lip_outJoint", n=c.replace("detail", "outJoint"))[0]

			utils.connectByMatrix(j, [c, gr, m_name+"_root_poser", m_name+"_root_rel_lips_multMatrix"], inputs=["matrix", "matrix", "worldInverseMatrix", "matrixSum"], module_name=m_name, attrs=['t', 'r'])
			cmds.connectAttr(c+".s", j+".s")

			cmds.connectAttr(pb+".outTranslate", gr+".translate")
			cmds.connectAttr(pb+".outRotateX", gr+".rx")
			cmds.setAttr(mult1+".input2", -1)
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScaleX", mult1+".input1")
			cmds.connectAttr(mult1+".output", gr+".sx")
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScaleY", gr+".sy")
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScaleZ", gr+".sz")

			cmds.connectAttr(m_name+"_static_t_lips.rx", uc1+".input")
			cmds.connectAttr(m_name+"_static_b_lips.rx", uc2+".input")
			cmds.connectAttr(uc1+".output", pb+".inRotateX1")
			cmds.connectAttr(uc2+".output", pb+".inRotateX2")

			cmds.setAttr(mp+".frontAxis", 0)
			cmds.setAttr(mp+".upAxis", 1)
			cmds.connectAttr(j.replace("r_t_", "l_t_")+".pos", rev+".inputX")
			cmds.connectAttr(rev+".outputX", mp+".uValue")
			cmds.connectAttr(m_name+"_t_lip_curveShape.worldSpace[0]", mp+".geometryPath")
			cmds.connectAttr(mp+".allCoordinates", pb+".inTranslate1")

			# cmds.connectAttr(add1+".output", clp+".inputR")
			# cmds.setAttr(clp+".maxR", 0.5)
			# cmds.connectAttr(clp+".outputR", pb+".weight")
			cmds.connectAttr(add1+".output", rmp+".inputValue")
			cmds.setAttr(rmp+".inputMax", 0.5)
			cmds.setAttr(rmp+".outputMax", 0.5)
			cmds.setAttr(rmp+".value[0].value_Interp", 2)
			cmds.connectAttr(rmp+".outValue", pb+".weight")

			cmds.setAttr(sr1+".maxX", 0.5)
			cmds.setAttr(sr2+".maxX", 0.5)
			cmds.connectAttr(sr1+".outValueX", add1+".input1")
			cmds.connectAttr(sr2+".outValueX", add1+".input2")

			cmds.connectAttr(add2+".output", sr1+".oldMaxX")
			cmds.setAttr(plus1+".operation", 2)
			cmds.connectAttr(plus1+".output1D", sr1+".oldMinX")
			cmds.connectAttr(m_name+"_l_mouthCorner.zip", sr1+".valueX")

			cmds.connectAttr(add3+".output", sr2+".oldMaxX")
			cmds.setAttr(plus2+".operation", 2)
			cmds.connectAttr(plus2+".output1D", sr2+".oldMinX")
			cmds.connectAttr(m_name+"_r_mouthCorner.zip", sr2+".valueX")

			cmds.connectAttr(add2+".output", plus1+".input1D[0]")
			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputX", plus1+".input1D[1]")

			cmds.connectAttr(add3+".output", plus2+".input1D[0]")
			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputY", plus2+".input1D[1]")

			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputX", add2+".input1")
			cmds.connectAttr(m_name+"_dropoff_multiplyDivide.outputY", add3+".input1")

			cmds.setAttr(mult2+".input1", 0.1)
			cmds.setAttr(mult2+".input2", count+i)
			cmds.connectAttr(mult2+".output", add2+".input2")

			cmds.setAttr(mult3+".input1", 0.1)
			cmds.setAttr(mult3+".input2", count-i)
			cmds.connectAttr(mult3+".output", add3+".input2")



			# r_b
			c = center_c_name.replace("c_t_lip_", "r_b_lip_%s_" %i)
			gr = cmds.duplicate(center_c_b_name+"_group")[0]
			gr = cmds.rename(gr, c+"_group")
			cmds.rename(gr+"|"+center_c_b_name, c)
			cmds.setAttr(c+".internalName", l=0)
			cmds.setAttr(c+".internalName", c[len(m_name)+1:], type="string")
			cmds.setAttr(c+".internalName", l=1)

			cmds.connectAttr(c.replace("_r_", "_l_")+"Shape.worldSpace[0]", c+"Shape.create")

			pb = cmds.createNode("pairBlend", n=c+"_pairBlend")
			mp = cmds.createNode("motionPath", n=c+"_motionPath")
			j = cmds.duplicate(m_name+"_c_t_lip_outJoint", n=c.replace("detail", "outJoint"))[0]

			utils.connectByMatrix(j, [c, gr, m_name+"_root_poser", m_name+"_root_rel_lips_multMatrix"], inputs=["matrix", "matrix", "worldInverseMatrix", "matrixSum"], module_name=m_name, attrs=['t', 'r'])
			cmds.connectAttr(c+".s", j+".s")

			cmds.connectAttr(pb+".outTranslate", gr+".translate")
			cmds.connectAttr(pb+".outRotateX", gr+".rx")
			cmds.connectAttr(mult1+".output", gr+".sx")
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScaleY", gr+".sy")
			cmds.connectAttr(m_name+"_mainPoser_decomposeMatrix.outputScaleZ", gr+".sz")

			cmds.connectAttr(uc2+".output", pb+".inRotateX1")
			cmds.connectAttr(uc1+".output", pb+".inRotateX2")

			cmds.setAttr(mp+".frontAxis", 0)
			cmds.setAttr(mp+".upAxis", 1)
			cmds.connectAttr(rev+".outputX", mp+".uValue")
			cmds.connectAttr(m_name+"_b_lip_curveShape.worldSpace[0]", mp+".geometryPath")
			cmds.connectAttr(mp+".allCoordinates", pb+".inTranslate1")
			cmds.connectAttr(mp+".allCoordinates", pb.replace("_b_", "_t_")+".inTranslate2")
			cmds.connectAttr(mp.replace("_b_", "_t_")+".allCoordinates", pb+".inTranslate2")
			# cmds.connectAttr(clp+".outputR", pb+".weight")
			cmds.connectAttr(rmp+".outValue", pb+".weight")

		self.addSkinJoints()
		
		for i in range(1, count+1):
			cmds.connectAttr(f"{m_name}_l_t_lip_{i}_skinJoint.pos", f"{m_name}_l_t_lip_{i}_outJoint.pos")
			

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