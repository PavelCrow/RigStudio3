import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
from functools import partial
import maya.OpenMayaUI as OpenMayaUI
import os
import maya.api.OpenMaya as om

from ...ui.groupLabel import GroupLabel
from ... import utils, module, controller, tools


version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

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

class Wing2(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
		self.tempData = []
		self.layersCount = 1
		self.layer_id = 0

		self.widget = None
		
	def connectSignals(self, mainInstance, w):
		self.widget = w
		self.mainInstance = mainInstance
		
		module = mainInstance.curModule

		self.widget.tableWidget.currentItemChanged.connect(self.select_layer)
		self.widget.tableWidget.itemDoubleClicked.connect(self.select_layer_group)

		self.widget.wingPosers_btn.clicked.connect(partial(self.toggle_posers, 0))
		self.widget.armPosers_btn.clicked.connect(partial(self.toggle_posers, 1))
		self.widget.closePosers_btn.clicked.connect(partial(self.toggle_posers, 2))
		self.widget.feathersFlatten_btn.clicked.connect(partial(self.toggle_posers, 3))

		self.widget.wingSurf_btn.clicked.connect(self.toggle_wing_surf)
		self.widget.armSurf_btn.clicked.connect(self.toggle_arm_surf)
		self.widget.featherPlanes_btn.clicked.connect(self.toggle_feathers_planes)

		self.widget.matchSelected_btn.clicked.connect(partial(self.match, "sel"))
		self.widget.matchAll_btn.clicked.connect(partial(self.match, "all"))
		self.widget.leftToRight_btn.clicked.connect(self.fromLeftToRight)

		self.widget.addLayer_btn.clicked.connect(self.add_layer)
		self.widget.removeLastLayer_btn.clicked.connect(self.removeLastLayer)
		self.widget.copy_btn.clicked.connect(self.copy)
		self.widget.paste_btn.clicked.connect(self.paste)
		self.widget.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))
		# self.widget.combine_btn.clicked.connect(self.combineLayer)

		self.widget.wide_slider.valueChanged.connect(partial(self.slider_update, "wide"))
		self.widget.slideMin_slider.valueChanged.connect(partial(self.slider_update, "slideMin"))
		self.widget.slideMax_slider.valueChanged.connect(partial(self.slider_update, "slideMax"))
		self.widget.lengthMin_slider.valueChanged.connect(partial(self.slider_update, "lengthMin"))
		self.widget.lengthMax_slider.valueChanged.connect(partial(self.slider_update, "lengthMax"))
		self.widget.offsetRoot_slider.valueChanged.connect(partial(self.slider_update, "offsetRoot"))
		self.widget.offsetTip_slider.valueChanged.connect(partial(self.slider_update, "offsetTip"))
		self.widget.twistRoot_slider.valueChanged.connect(partial(self.slider_update, "twistRoot"))
		self.widget.twistTip_slider.valueChanged.connect(partial(self.slider_update, "twistTip"))
		self.widget.bend_slider.valueChanged.connect(partial(self.slider_update, "bend"))

		self.widget.wide_spinBox.valueChanged.connect(partial(self.spinbox_update,  "wide"))
		self.widget.slideMin_spinBox.valueChanged.connect(partial(self.spinbox_update,  "slideMin"))
		self.widget.slideMax_spinBox.valueChanged.connect(partial(self.spinbox_update,  "slideMax"))
		self.widget.lengthMin_spinBox.valueChanged.connect(partial(self.spinbox_update, "lengthMin"))
		self.widget.lengthMax_spinBox.valueChanged.connect(partial(self.spinbox_update, "lengthMax"))
		self.widget.offsetRoot_spinBox.valueChanged.connect(partial(self.spinbox_update, "offsetRoot"))
		self.widget.offsetTip_spinBox.valueChanged.connect(partial(self.spinbox_update, "offsetTip"))
		self.widget.twistRoot_spinBox.valueChanged.connect(partial(self.spinbox_update, "twistRoot"))
		self.widget.twistTip_spinBox.valueChanged.connect(partial(self.spinbox_update, "twistTip"))
		self.widget.bend_spinBox.valueChanged.connect(partial(self.spinbox_update, "bend"))

		self.widget.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)
	
	def updateOptionsPage(self, widget=None):
		self.options = self.getOptions()

		if not self.widget:
			return
		
		self.widget.aimDistance_spinBox.setValue(cmds.getAttr(self.name+"_mod.aim_offset"))
		
		planes = cmds.ls(f"{self.name}_layer_*_feather_*_geo")
		if planes:
			self.widget.featherPlanes_btn.setChecked(cmds.getAttr(planes[0]+".visibility"))
		
		self.widget.wingSurf_btn.setChecked(cmds.getAttr(self.name+"_surf.visibility"))
		self.widget.armSurf_btn.setChecked(cmds.getAttr(self.name+"_arm_surf.visibility"))

		self.widget.wingPosers_btn.setChecked(cmds.getAttr(self.name+"_mainPoser.dysplayPosers")==0)
		self.widget.armPosers_btn.setChecked(cmds.getAttr(self.name+"_mainPoser.dysplayPosers")==1)
		self.widget.closePosers_btn.setChecked(cmds.getAttr(self.name+"_mainPoser.dysplayPosers")==2)
		self.widget.feathersFlatten_btn.setChecked(cmds.getAttr(self.name+"_mainPoser.flatten"))

		self.widget.tableWidget.setColumnWidth(0, 40)

		# delete old feather widgets
		self.widget.tableWidget.setRowCount(0)

		# add feathers widgets
		path = os.path.join(self.mainInstance.rootPath, "modules", self.type, self.type + "_addLayer_widget.ui")
		self.layers_widgets = []
		for i, l in enumerate(self.options['layersData']):
			count = self.widget.tableWidget.rowCount()
			self.widget.tableWidget.insertRow(count)

			item = QtWidgets.QTableWidgetItem(str(i))
			self.widget.tableWidget.setItem(count, 1, item)

			item = QtWidgets.QTableWidgetItem(f"Layer_{i}")
			self.widget.tableWidget.setItem(count, 2, item)

			# add visible button
			vis_btn = QtWidgets.QPushButton(self.widget)
			vis_btn.setCheckable(True)
			self.widget.tableWidget.setCellWidget(i, 0, vis_btn)
			vis_btn.clicked.connect(partial(self.layer_switch, vis_btn, i))
			vis = cmds.getAttr(f"{self.name}_control.feathersControls{i}")
			vis_btn.setChecked(vis)
			if vis:
				vis_btn.setText('On')
			else:
				vis_btn.setText('Off')

		self.widget.tableWidget.setCurrentCell(0, 0)

		self.select_layer(1)

	def layer_switch(self, btn, i, sym=False):
		self.modulePageUpdated = False

		cmds.setAttr(f"{self.name}_control.feathersControls{i}", btn.isChecked())
		
		if btn.isChecked():
			btn.setText('On')
		else:
			btn.setText('Off')

		if self.symmetrical:
			control = utils.getOpposite(f"{self.name}_control")
			cmds.setAttr(f"{control}.feathersControls{i}", btn.isChecked())

		self.modulePageUpdated = True

	def select_layer(self, i):
		current_row = self.widget.tableWidget.currentRow()
		item = self.widget.tableWidget.item(current_row, 1)
		if not item:
			return
		self.layer_id = i = int(item.text())

		data = self.getOptions()['layersData'][i]

		self.widget.feathersCount_lineEdit.setText(str(data['feathersCount']))
		self.widget.controlsCount_lineEdit.setText(str(data['controlsCount']))

		for attr in data:
			v = data[attr]
			try:
				eval(f'self.widget.{attr}_slider.setValue({v}*100)')
				eval(f'self.widget.{attr}_spinBox.setValue({v})')
			except: pass

	def select_layer_group(self):
		cmds.select(f"{self.name}_layer_{self.layer_id}_feathers_group")

	def toggle_feathers_planes(self):
		en = self.widget.featherPlanes_btn.isChecked()

		planes = cmds.ls(f"{self.name}_layer_*_feather_*_geo")
				
		for p in planes:
			cmds.setAttr(p+".visibility", en)
		
		if self.symmetrical:
			opp_planes = cmds.ls(f"{utils.getOpposite(self.name)}_layer_*_feather_*_geo")
			for p in opp_planes:
				cmds.setAttr(p+".visibility", en)

	def toggle_wing_surf(self):
		en = self.widget.wingSurf_btn.isChecked()
		cmds.setAttr(self.name+"_surf.visibility", en)

		if self.symmetrical:
			cmds.setAttr(utils.getOpposite(self.name)+"_surf.visibility", en)

	def toggle_arm_surf(self):
		en = self.widget.armSurf_btn.isChecked()
		cmds.setAttr(self.name+"_arm_surf.visibility", en)

		if self.symmetrical:
			cmds.setAttr(utils.getOpposite(self.name)+"_arm_surf.visibility", en)		

	def toggle_posers(self, state):
		if state == 3:
			en = self.widget.feathersFlatten_btn.isChecked()
			cmds.setAttr(self.name+"_mainPoser.flatten", en)
		else:
			cmds.setAttr(self.name+"_mainPoser.dysplayPosers", state)

			if state == 0:
				self.widget.armPosers_btn.setChecked(False)
				self.widget.wingPosers_btn.setChecked(True)
				self.widget.closePosers_btn.setChecked(False)
			elif state == 1:
				self.widget.wingPosers_btn.setChecked(False)
				self.widget.armPosers_btn.setChecked(True)
				self.widget.closePosers_btn.setChecked(False)
			elif state == 2:
				self.widget.wingPosers_btn.setChecked(False)
				self.widget.armPosers_btn.setChecked(False)
				self.widget.closePosers_btn.setChecked(True)

	def removeLastLayer(self, sym=False):
		if sym: name = utils.getOpposite(self.name)
		else: name = self.name
		# print("remove", name)
		
		cmds.delete(f"{name}_layer_{self.layersCount-1}_feathers_group")

		bif = pm.PyNode(name+"_bifrostGraphShape")

		if self.layersCount > 1:
			for i in range(1,8):
				cmds.setAttr( f"{name}_feathersLayer_{i}_{self.layersCount-1}Shape.visibility", 0)
		
		for a in ["length", "length_min", "pos_2_offset", "pos_3_offset", "root_pos", "tip_pos", "twist_root", "twist_tip", "wide"]:
			size = pm.getAttr(bif.attr(a), size=True)
			for i in range(size):
				inp = bif.attr(a)[i].attr(a+"_A")[0].inputs()
				if not inp:
					pm.removeMultiInstance( bif.attr(a)[i])

		if self.symmetrical and utils.getObjectSide(name) == "l":
			self.removeLastLayer(sym=True)
		
		self.updateOptionsPage()

	def getOptions(self):
		layersData = []

		self.layersCount = len(cmds.listRelatives(self.name+"_feathers_controls") or [])
		for id in range(self.layersCount):
			# if id>1: continue
			layerData = {}
			layerData['id'] = id
			layerData['controlsCount'] = int(len(cmds.ls(f"{self.name}_layer_{id}_feather_0_*_outJoint"))/3)
			layerData['feathersCount'] = int( len( cmds.listRelatives(self.name+'_layer_%s_feathers_group'%(id) ) ) ) - 1
			layerData['wide'] = cmds.getAttr(f"{self.name}_layer_{id}_control.wide")
			layerData['slideMin'] = cmds.getAttr(f"{self.name}_layer_{id}_control.slideMin")
			layerData['slideMax'] = cmds.getAttr(f"{self.name}_layer_{id}_control.slideMax")
			layerData['lengthMin'] = cmds.getAttr(f"{self.name}_layer_{id}_control.lengthMin")
			layerData['lengthMax'] = cmds.getAttr(f"{self.name}_layer_{id}_control.lengthMax")
			layerData['offsetRoot'] = cmds.getAttr(f"{self.name}_layer_{id}_control.offsetRoot")
			layerData['offsetTip'] = cmds.getAttr(f"{self.name}_layer_{id}_control.offsetTip")
			layerData['twistRoot'] = cmds.getAttr(f"{self.name}_layer_{id}_control.twistRoot")
			layerData['twistTip'] = cmds.getAttr(f"{self.name}_layer_{id}_control.twistTip")
			layerData['bend'] = cmds.getAttr(f"{self.name}_layer_{id}_control.bend")

			layersData.append(layerData)

		optionsData = {}
		optionsData['layersData'] = layersData
		optionsData['aimDistance'] = cmds.getAttr(self.name+"_mod.aim_offset")
		
		return optionsData
	
	def getData(self):
		data = super(self.__class__, self).getData()
		
		data["optionsData"] = self.getOptions()
		
		return data	

	def setData(self, data, sym=False, namingForce=False, load="all"):
		super(self.__class__, self).setData(data, sym, namingForce)
		
		data = data["optionsData"]

		self.update_aim_distance(data['aimDistance'])
		
		layersCount = self.layersCount = len(cmds.listRelatives(self.name+"_feathers_controls") or [])
		for i in range(layersCount):
			self.removeLastLayer()
		
		for i, f_data in enumerate(data["layersData"]):
			
			self.add_layer(data=f_data)

			for d_name in f_data:
				d = f_data[d_name]
				if d_name in ["id", "controlsCount", "feathersCount"]:
					continue
				cmds.setAttr(f"{self.name}_layer_{i}_control.{d_name}", d)

		if self.opposite:
			opp_name = utils.getOpposite(self.name)
			for i, f_data in enumerate(data["layersData"]):
				for d_name in f_data:
					d = f_data[d_name]
					if d_name in ["id", "controlsCount", "feathersCount"]:
						continue
					cmds.connectAttr(f"{opp_name}_layer_{i}_control.{d_name}", f"{self.name}_layer_{i}_control.{d_name}")
	
	def add_layer(self, data=None, sym=False, feathers_count=None, feather_controls_count=None):
		if sym: name = utils.getOpposite(self.name)
		else: name = self.name		
		# print("add layer", name)
		if data:
			feathers_count = data["feathersCount"]
			feather_controls_count = data["controlsCount"]
		elif not sym:
			dialog = InputDialog()
			result = dialog.exec_()

			if result == QtWidgets.QDialog.Accepted:
				feathers_count, feather_controls_count = dialog.get_values()
			else:
				return

		cmds.undoInfo(openChunk=True)

		bif = pm.PyNode(name+"_bifrostGraphShape")

		# get layer_id
		layer_id = 0
		while(cmds.objExists(f"{name}_layer_{layer_id}_feathers_group")):
			layer_id += 1    

		# add main group
		feathers_gr = f"{name}_feathers_controls"

		layer_gr = pm.group(n=f"{name}_layer_{layer_id}_feathers_group", empty=1)
		pm.parent(layer_gr, feathers_gr)

		bif.layers_count.set(layer_id+1)
		bif.debug_layer_id.set(layer_id)
			
		# layer control
		layer_c = pm.circle(n=f"{name}_layer_{layer_id}_control", nr=(1,0,0), r=0.2)[0]
		layer_c.tx.set(layer_id)
		pm.parent(layer_c,  layer_gr)

		pm.addAttr(layer_c, ln="feather_count", at="long", k=1, dv=feathers_count, min=1)
		pm.addAttr(layer_c, ln="feather_controls_count", at="long", k=1, dv=feather_controls_count, min=1)
		pm.addAttr(layer_c, ln="wide", k=1, dv=0.1, min=0.01)
		pm.addAttr(layer_c, ln="slideMin", k=1, dv=0, min=0, max=1)
		pm.addAttr(layer_c, ln="slideMax", k=1, dv=1, min=0, max=1)
		pm.addAttr(layer_c, ln="lengthMin", k=1, dv=0, min=0, max=1)
		pm.addAttr(layer_c, ln="lengthMax", k=1, dv=1, min=0, max=1)
		pm.addAttr(layer_c, ln="offsetRoot", k=1, dv=0)
		pm.addAttr(layer_c, ln="offsetTip", k=1, dv=0)
		pm.addAttr(layer_c, ln="twistRoot", k=1, dv=0)
		pm.addAttr(layer_c, ln="twistTip", k=1, dv=0)
		pm.addAttr(layer_c, ln="bend", k=1, dv=0)

		pm.connectAttr(layer_c.feather_count, f"{bif}.layer_feathers_count[{layer_id}]")
		pm.connectAttr(layer_c.feather_controls_count, f"{bif}.layer_feather_controls_count[{layer_id}]")
		pm.connectAttr(layer_c.wide, f"{bif}.layer_wide[{layer_id}]")
		pm.connectAttr(layer_c.slideMin, f"{bif}.layer_pos_min[{layer_id}]")
		pm.connectAttr(layer_c.slideMax, f"{bif}.layer_pos_max[{layer_id}]")
		pm.connectAttr(layer_c.lengthMin, f"{bif}.layer_length_min[{layer_id}]")
		pm.connectAttr(layer_c.lengthMax, f"{bif}.layer_length_max[{layer_id}]")
		pm.connectAttr(layer_c.offsetRoot, f"{bif}.layer_offset_root[{layer_id}]")
		pm.connectAttr(layer_c.offsetTip, f"{bif}.layer_offset_tip[{layer_id}]")
		pm.connectAttr(layer_c.twistRoot, f"{bif}.layer_twist_root[{layer_id}]")
		pm.connectAttr(layer_c.twistTip, f"{bif}.layer_twist_tip[{layer_id}]")
		pm.connectAttr(layer_c.bend, f"{bif}.layer_bend[{layer_id}]")

		layer_c.feather_count.lock(True)
		layer_c.feather_controls_count.lock(True)


			# create feather controls
		for id in range(feathers_count):
			gr = pm.group(n=f"{name}_layer_{layer_id}_feather_{id}_group", empty=1)

			for i in range(feather_controls_count):
				if i == 0:
					c = pm.circle(n=f"{name}_layer_{layer_id}_feather_{id}_{i}", nr=(1,0,0), r=0.2)[0]
					c_tip = pm.circle(n=f"{name}_layer_{layer_id}_feather_{id}", nr=(0.0001,0,-1), r=0.2)[0]
					c_tip.overrideEnabled.set(1)
					c_tip.overrideColor.set(15)
					mnc = c_tip.getShape().create.inputs()[0]
					mnc.sweep.set(180)
					pm.addAttr(c_tip, ln="wide", k=1, dv=1, min=0.01)
					pm.addAttr(c_tip, ln="root_pos", k=1, dv=0.5, min=0, max=1)
					pm.addAttr(c_tip, ln="middle_1_pos", k=1, dv=0, min=-1, max=1)
					pm.addAttr(c_tip, ln="middle_2_pos", k=1, dv=0, min=-1, max=1)
					pm.addAttr(c_tip, ln="tip_pos", k=1, dv=0.5, min=0, max=1)
					pm.addAttr(c_tip, ln="lengthMin", k=1, dv=0, max=1)
					pm.addAttr(c_tip, ln="length", k=1, dv=1, min=0)
					pm.addAttr(c_tip, ln="twistRoot", k=1, dv=0)
					pm.addAttr(c_tip, ln="twistTip", k=1, dv=0)
					pm.addAttr(c_tip, ln="bend", k=1, dv=0)
					pm.setAttr(c_tip.v, keyable=0, channelBox=0)

					f_gr = pm.group(c, n=f"{name}_layer_{layer_id}_feather_{id}_controls_group")

					# pm.connectAttr(c_tip.length, f"{bif}.length[{id}]")
					pm.connectAttr(c_tip.length, f"{bif}.length[{layer_id}].length_A[{id}]")
					pm.connectAttr(c_tip.lengthMin, f"{bif}.length_min[{layer_id}].length_min_A[{id}]")
					# pm.connectAttr(c_tip.twistRoot, f"{bif}.twist_root[{id}]")
					pm.connectAttr(c_tip.twistRoot, f"{bif}.twist_root[{layer_id}].twist_root_A[{id}]")
					# pm.connectAttr(c_tip.twistTip, f"{bif}.twist_tip[{id}]")
					pm.connectAttr(c_tip.twistTip, f"{bif}.twist_tip[{layer_id}].twist_tip_A[{id}]")
					# pm.connectAttr(c_tip.wide, f"{bif}.wide[{id}]")
					pm.connectAttr(c_tip.wide, f"{bif}.wide[{layer_id}].wide_A[{id}]")
					# pm.connectAttr(c_tip.pos_2_offset, f"{bif}.pos_2_offset[{id}]")
					pm.connectAttr(c_tip.middle_1_pos, f"{bif}.pos_2_offset[{layer_id}].pos_2_offset_A[{id}]")
					# pm.connectAttr(c_tip.pos_3_offset, f"{bif}.pos_3_offset[{id}]")
					pm.connectAttr(c_tip.middle_2_pos, f"{bif}.pos_3_offset[{layer_id}].pos_3_offset_A[{id}]")
					# pm.connectAttr(c_tip.root_pos, f"{bif}.root_pos[{id}]")
					pm.connectAttr(c_tip.root_pos, f"{bif}.root_pos[{layer_id}].root_pos_A[{id}]")
					# pm.connectAttr(c_tip.tip_pos, f"{bif}.tip_pos[{id}]")
					pm.connectAttr(c_tip.tip_pos, f"{bif}.tip_pos[{layer_id}].tip_pos_A[{id}]")
					pm.connectAttr(c_tip.bend, f"{bif}.bend[{layer_id}].bend_A[{id}]")
				else:
					c = pm.circle(n=f"{name}_layer_{layer_id}_feather_{id}_{i}", nr=(1,0,0), r=0.2)[0]
					mnc = c.getShape().create.inputs()[0]
					pm.delete(mnc)
							
				j = pm.joint(n=c+"_outJoint")
				pm.parent(j,c)
				j_in = pm.duplicate(c+"_outJoint", n=c+"_in_outJoint")[0]
				j_out = pm.duplicate(c+"_outJoint", n=c+"_out_outJoint")[0]
				pm.setAttr(c.v, keyable=0, channelBox=0)
				
				if i == 0:
					pm.parent(f_gr, gr)
				else:
					pm.parent(c, f"{name}_layer_{layer_id}_feather_{id}_{i-1}")
				
			pm.parent(c_tip, c)
			
			# set controls matrixes
			for i in range(feather_controls_count):
				if i == 0:
					pm.connectAttr(f"{bif}.out_controls_local_matrixes[{layer_id}].out_controls_local_matrixes_A[{id}].out_controls_local_matrixes_A_B[{i}]", f"{name}_layer_{layer_id}_feather_{id}_controls_group.offsetParentMatrix")
				else:
					pm.connectAttr(f"{bif}.out_controls_local_matrixes[{layer_id}].out_controls_local_matrixes_A[{id}].out_controls_local_matrixes_A_B[{i}]", f"{name}_layer_{layer_id}_feather_{id}_{i}.offsetParentMatrix")
				pm.connectAttr(f"{bif}.out_joints_in_matrixes[{layer_id}].out_joints_in_matrixes_A[{id}].out_joints_in_matrixes_A_B[{i}]", f"{name}_layer_{layer_id}_feather_{id}_{i}_in_outJoint.offsetParentMatrix")
				pm.connectAttr(f"{bif}.out_joints_out_matrixes[{layer_id}].out_joints_out_matrixes_A[{id}].out_joints_out_matrixes_A_B[{i}]", f"{name}_layer_{layer_id}_feather_{id}_{i}_out_outJoint.offsetParentMatrix")

				
			# geometry
			geo = pm.polyPlane(sx=feather_controls_count-1, sy=2, n=f"{name}_layer_{layer_id}_feather_{id}_geo")[0]
			pm.mel.eval("DeleteHistory")
			geoS = geo.getShape()
			for i in range(feather_controls_count):
				v = geoS.vtx[i]
				t = pm.xform(f"{name}_layer_{layer_id}_feather_{id}_{i}_in_outJoint", query=True, translation=True, worldSpace=True)
				v.setPosition(t)
				
				v = geoS.vtx[i+feather_controls_count]
				t = pm.xform(f"{name}_layer_{layer_id}_feather_{id}_{i}_outJoint", query=True, translation=True, worldSpace=True)
				v.setPosition(t)
				
				v = geoS.vtx[i+feather_controls_count*2]
				t = pm.xform(f"{name}_layer_{layer_id}_feather_{id}_{i}_out_outJoint", query=True, translation=True, worldSpace=True)
				v.setPosition(t)

			# skin
			cmds.select(clear=1)
			for i in range(feather_controls_count):
				cmds.select(f"{name}_layer_{layer_id}_feather_{id}_{i}_in_outJoint", add=1)
				cmds.select(f"{name}_layer_{layer_id}_feather_{id}_{i}_outJoint", add=1)
				cmds.select(f"{name}_layer_{layer_id}_feather_{id}_{i}_out_outJoint", add=1)
			pm.select(geo, add=1)
			pm.skinCluster(n=f"{name}_layer_{layer_id}_feather_{id}_skincluster")

			pm.parent(geo, gr)
			pm.parent(gr, layer_gr)
			
			# set pos
			pos = 1/(feathers_count-1)*id
			c_tip.root_pos.set(pos)
			c_tip.tip_pos.set(pos)  
			
		cmds.setAttr(f"{name}_control.feathersControls{layer_id}", 1)
		cmds.connectAttr(f"{name}_control.feathersControls{layer_id}", f"{name}_layer_{layer_id}_feathers_group.visibility")

		for n in pm.listRelatives(layer_gr, allDescendents=1):
			cmds.sets(n.name(), e=1, forceElement=name+'_nodesSet')
		cmds.sets(layer_gr.name(), e=1, forceElement=name+'_nodesSet')

		# mirror 
		if self.symmetrical:
			if utils.getObjectSide(name) == "l":
				self.add_layer(sym=True, feathers_count=feathers_count, feather_controls_count=feather_controls_count)
		
			elif utils.getObjectSide(name) == "r":
				opp_name = utils.getOpposite(name)
				for d_name in ["wide", "slideMin", "slideMax", "lengthMin", "lengthMax", "offsetRoot", "offsetTip", "twistRoot", "twistTip", "bend"]:
					# if "offset" in d_name:
					# 	m = cmds.createNode("multDoubleLinear")
					# 	cmds.connectAttr(f"{opp_name}_layer_{layer_id}_control.{d_name}", m+".input1")
					# 	cmds.setAttr(m+".input2", -1)
					# 	cmds.connectAttr(m+".output", f"{name}_layer_{layer_id}_control.{d_name}")
					# else:
					cmds.connectAttr(f"{opp_name}_layer_{layer_id}_control.{d_name}", f"{name}_layer_{layer_id}_control.{d_name}")
				
				# connections = cmds.listConnections(f"{name}_mainPoser.flatten", plugs=True, destination=False)
				# if not connections:
				# 	cmds.connectAttr(f"{opp_name}_mainPoser.flatten", f"{name}_mainPoser.flatten")
				# 	cmds.connectAttr(f"{opp_name}_mainPoser.dysplayPosers", f"{name}_mainPoser.dysplayPosers")

				# def connectOppClosedPosers(c):
				# 	print(333, c)
				# 	cmds.connectAttr(f"{opp_name}_{c}.t", f"{name}_{c}.t")
				# 	try:
				# 		cmds.connectAttr(f"{opp_name}_{c}.r", f"{name}_{c}.r")
				# 	except: pass

				# for c in ["clav_closed", "ik_root_closed", "ik_aim_closed", "ik_end_closed", 
			  	# 			"main_4_closed", "main_3_closed", "main_2_closed", "main_1_closed"]:
				# 	connectOppClosedPosers(c)
				# for i in range(1, 8):
				# 	for n in range(1, 4):
				# 		connectOppClosedPosers("feathers_{i}_{n}_closed")

		pm.select(layer_c)

		cmds.undoInfo(closeChunk=True)

		self.updateOptionsPage()

		if self.widget:
			self.widget.tableWidget.setCurrentCell(layer_id, 2)
			self.select_layer(layer_id)

	def rebuildWithNewOptions(self, mainInstance, widget):
		dialog = InputDialog(widget)
		result = dialog.exec_()

		if result == QtWidgets.QDialog.Accepted:
			feathersCount, controlsCount = dialog.get_values()
		else:
			return

		feathersCount, controlsCount = dialog.get_values()
		data = self.getData()

		for layer_data in data["optionsData"]["layersData"] :
			if layer_data["id"] == self.layer_id:
				layer_data["feathersCount"] = feathersCount
				layer_data["controlsCount"] = controlsCount
		id = self.layer_id
		self.setData(data)
		
		self.widget.tableWidget.setCurrentCell(id, 2)
		self.select_layer(id)

		# opp_mod = utils.getOpposite(self.name+"_mod")
		# if cmds.objExists(opp_mod) and opp_mod != self.name+"_mod":
		# 	opp_m = utils.getModuleInstance(utils.getOpposite(self.name))
		# 	opp_m.deleteLayer(layer_id=1)
		# 	opp_m.generateFingers(feathersCount, jointsCount)
			# opp_m.addSkinJoints()

		# self.updateOptionsPage()

	def connect(self, target, opposite=False, makeSeamless=False):
		super(self.__class__, self).connect(target, opposite, makeSeamless)
		
		# # Connect inbetween attrs
		if opposite:
			name = self.name
			opp_name = utils.getOpposite(self.name)
			connections = cmds.listConnections(f"{name}_mainPoser.flatten", plugs=True, destination=False)
			if not connections:
				cmds.connectAttr(f"{opp_name}_mainPoser.flatten", f"{name}_mainPoser.flatten")

			def connectOppClosedPosers(c):
				cmds.connectAttr(f"{opp_name}_{c}.t", f"{name}_{c}.t")
				try:
					cmds.connectAttr(f"{opp_name}_{c}.r", f"{name}_{c}.r")
				except: pass

			cm = pm.createNode("composeMatrix")
			cm.inputScaleX.set(-1)

			def connectOppClosedPosersByMatrix(c):
				mm = pm.createNode("multMatrix")
				dm = pm.createNode("decomposeMatrix")
				p = pm.listRelatives(f"{name}_{c}", p=1)[0]

				pm.connectAttr(f"{opp_name}_{c}.worldMatrix[0]", mm.matrixIn[0])
				cm.outputMatrix >> mm.matrixIn[1]
				p.worldInverseMatrix[0] >> mm.matrixIn[2]
				mm.matrixSum >> dm.inputMatrix
				pm.connectAttr(dm.outputTranslate, f"{name}_{c}.t")

				if c == "ik_end_closed":
					uc = pm.createNode("multDoubleLinear")
					uc.input2.set(-1)
					add = pm.createNode("addDoubleLinear")
					add.input2.set(180)
					pm.connectAttr(dm.outputRotateX, uc.input1)
					pm.connectAttr(uc.output, f"{name}_{c}.rx")
					pm.connectAttr(dm.outputRotateY, add.input1)
					pm.connectAttr(add.output, f"{name}_{c}.ry")
					pm.connectAttr(dm.outputRotateZ, f"{name}_{c}.rz")

			for c in ["clav_closed", "ik_root_closed", 
						"main_4_closed", "main_3_closed", "main_2_closed", "main_1_closed"]:
				connectOppClosedPosers(c)

			for c in ["ik_aim_closed", "ik_end_closed"]:
				connectOppClosedPosersByMatrix(c)

			for i in range(1, 8):
				for n in range(1, 4):
					# print(33333, f"feathers_{i}_{n}_closed")
					connectOppClosedPosers(f"feathers_{i}_{n}_closed")
		
	def deleteLayer(self, mainInstance=None, widget=None, layer_id=1, update=True):
		# print("DELETE", layer_id)
		if not cmds.objExists(self.name+"_layer_%s_group" %layer_id):
			return

		wing_name = self.name+"_layer_"+str(layer_id)
		
		# at first delete nodes to disable errors warning
		trash_nodes = cmds.ls(self.name+"_layer_%s_feather_*_curveInfo" %layer_id)
		if trash_nodes: cmds.delete(trash_nodes)
	
		cmds.delete(wing_name+"_group")
		cmds.delete(self.name+"_detail_layer_%s_group" %layer_id)

		trash_nodes = cmds.ls(wing_name+"_*_pointOnCurveInfo")
		if trash_nodes: cmds.delete(trash_nodes)

		trash_nodes = cmds.ls(self.name+"_layer_%s_feather_*" %layer_id)
		if trash_nodes: cmds.delete(trash_nodes)

		cmds.delete(wing_name+'_ikJoint')
		# cmds.delete(wing_name+'_outJoint')

		if layer_id > 1:
			cmds.delete(wing_name+"_curves")
			cmds.delete(wing_name+"_curve_*")
			cmds.deleteAttr(self.name+"_mod", attribute="layer_%s_offset" %layer_id)
			cmds.deleteAttr(self.name+"_mod", attribute="layer_%s_length" %layer_id)
			cmds.deleteAttr(self.name+"_control", attribute="addControls%s" %layer_id)

		opp_mod = utils.getOpposite(self.name+"_mod")
		if cmds.objExists(opp_mod) and opp_mod != self.name+"_mod" and utils.getObjectSide(opp_mod) == "r":
			opp_m = utils.getModuleInstance(utils.getOpposite(self.name))
			opp_m.deleteLayer(mainInstance, widget, layer_id)

		if update:
			self.updateOptionsPage()

	def rebuild(self, layer_id):
		data = self.getOptions()

		for d in data['layersData']:
			if d["id"] == layer_id:
				f_data = d
		
		for w in self.layers_widgets:
			if int(w.layer_checkBox.text().split(" ")[-1]) == layer_id:
				feathersCount = w.feathersCount_spinBox.value()
				jointsCount = w.jointsCount_spinBox.value()
		
		f_data['feathersCount'] = feathersCount
		f_data['jointsCount'] = jointsCount
		
		self.deleteLayer(layer_id=layer_id)
		
		self.addLayer(layer_id=layer_id, f_data=f_data)

	def slider_update(self, type, v):
		if self.opposite:
			return

		value = round(v * 0.01, 3)
		eval(f"self.widget.{type}_spinBox.setValue({value})")

	def spinbox_update(self, type, value):
		eval(f"self.widget.{type}_slider.setValue({value*100})")
		c = f"{self.name}_layer_{self.layer_id}_control"
		try:
			cmds.setAttr(c+"."+type, value)
		except: pass

	def update_aim_distance(self, v=None):
		def setValue(v):
			cmds.setAttr(self.name+"_mod.aim_offset", v)
			if self.symmetrical:
				opp_mod = utils.getOpposite(self.name+"_mod")
				cmds.setAttr(opp_mod+".aim_offset", v)

		if v:
			setValue(v)
		else:
			try: # fix error "C++ object already deleted"
				if not self.widget:
					return
				if not v:
					v = self.widget.aimDistance_spinBox.value()
					setValue(v)
			except:
				pass

	def ibtwOverride(self, name):
		if not self.opposite:
			opp_name = utils.getOpposite(self.name)
			if name == self.name + "_start" :
				cmds.setAttr(opp_name+"_start_ibtw_parent_offsetLoc_mirrorGroup.sx", 1)

	def copy(self):
		data = self.getOptions()
		for i, d in enumerate(data['layersData']):
			layer_data = data['layersData'][i]
			if layer_data["id"] == self.layer_id:
				self.tempData = layer_data
	
	def paste(self):
		for d_name in self.tempData:
			v = self.tempData[d_name]
			if d_name in ["id", "controlsCount", "feathersCount"]:
				continue
			cmds.setAttr(f"{self.name}_layer_{self.layer_id}_control.{d_name}", v)

		self.select_layer(self.layer_id)

	def fromLeftToRight(self):
		for i in range(100):
			if not cmds.objExists(self.name+"_layer_%s_feather_%s" %(self.layer_id,i)):
				break
			s = pm.PyNode(self.name+"_layer_%s_feather_%s" %(self.layer_id,i))
			t = pm.PyNode(utils.getOpposite(self.name)+"_layer_%s_feather_%s" %(self.layer_id,i))
			t.length.set(s.length.get())
			t.middle_1_pos.set(s.middle_1_pos.get())
			t.middle_2_pos.set(s.middle_2_pos.get())
			t.tip_pos.set(s.tip_pos.get())
			t.root_pos.set(s.root_pos.get())
			t.wide.set(s.wide.get())
			t.lengthMin.set(s.lengthMin.get())
			t.bend.set(s.bend.get())

	def match(self, type):
		def project_on_plane(source_mesh, target_mesh):
			"""
			Проецирует вершины source_mesh на плоскость, определяемую target_mesh.

			Args:
				source_mesh (str): Имя исходного объекта (который проецируем).
				target_mesh (str): Имя целевого объекта (который задает плоскость).
			"""
			
			# 1. Определяем плоскость по целевому объекту
			# Получаем путь к DAG-ноде объекта для доступа через API
			sel_list = om.MSelectionList()
			sel_list.add(target_mesh)
			target_dag_path = sel_list.getDagPath(0)
			
			# Используем MFnMesh для получения нормали первого полигона в мировых координатах
			mfn_mesh = om.MFnMesh(target_dag_path)
			plane_normal = mfn_mesh.getPolygonNormal(0, om.MSpace.kWorld)
			
			# Находим центр bounding box целевого объекта. Эта точка будет лежать на нашей плоскости.
			bbox_center_raw = cmds.xform(target_mesh, query=True, boundingBox=True, worldSpace=True)
			plane_point = om.MPoint(
				(bbox_center_raw[0] + bbox_center_raw[3]) / 2.0,
				(bbox_center_raw[1] + bbox_center_raw[4]) / 2.0,
				(bbox_center_raw[2] + bbox_center_raw[5]) / 2.0
			)

			# 2. Проецируем вершины исходного объекта
			# Получаем список всех вершин
			source_vertices = cmds.ls(f'{source_mesh}.vtx[*]', flatten=True)
			
			# Направление луча для проекции - инвертированная нормаль плоскости
			ray_direction = -plane_normal
			
			for vtx in source_vertices:
				# Получаем начальную позицию вершины (точка, из которой пускаем луч)
				start_pos_raw = cmds.pointPosition(vtx, world=True)
				ray_origin = om.MPoint(start_pos_raw)
				
				# --- Математика пересечения луча и плоскости ---
				# Формула для нахождения точки пересечения:
				# t = ((plane_point - ray_origin) * plane_normal) / (ray_direction * plane_normal)
				# IntersectionPoint = ray_origin + ray_direction * t
				
				dot_denom = ray_direction * plane_normal
				
				# Проверка, чтобы избежать деления на ноль (если луч параллелен плоскости)
				if abs(dot_denom) < 1e-6:
					continue
					
				w = plane_point - ray_origin
				dot_nom = w * plane_normal
				t = dot_nom / dot_denom
				
				# Рассчитываем конечную точку пересечения
				hit_point = ray_origin + ray_direction * t
				
				# Перемещаем вершину в рассчитанную точку
				cmds.move(hit_point.x, hit_point.y, hit_point.z, vtx, absolute=True, worldSpace=True)
				
			cmds.refresh()
			# print(f"Проекция {source_mesh} на плоскость {target_mesh} завершена.")

		# for i in range()

		if type == "sel":
			selection = cmds.ls(selection=True, long=True)
			if len(selection) != 2:
				cmds.warning("Select feather geo and plain.")
				return
				
			source_mesh, target_mesh = selection
			
			project_on_plane(source_mesh, target_mesh)
				
			# copy skin
			cmds.select(target_mesh, source_mesh)
			tools.copySkin()

		elif type == "all":
			feathersCount = int(self.widget.feathersCount_lineEdit.text())
			
			for i in range(feathersCount):
				source_mesh = f"l_feather_{self.layer_id}_{i}_geo"
				if not cmds.objExists(source_mesh):
					cmds.warning("Missed feather geometry "+source_mesh)
					return
				
			if self.symmetrical:
				for i in range(feathersCount):
					source_mesh = f"r_feather_{self.layer_id}_{i}_geo"
					if not cmds.objExists(source_mesh):
						cmds.warning("Missed feather geometry "+source_mesh)
						return

			for i in range(feathersCount):
				source_mesh = f"l_feather_{self.layer_id}_{i}_geo"
				target_mesh =  self.name+f"_layer_{self.layer_id}_feather_{i}_geo"
				cmds.select(source_mesh)
				cmds.DeleteHistory()
				project_on_plane(source_mesh, target_mesh)
				cmds.select(target_mesh, source_mesh)
				tools.copySkin()

			if self.symmetrical:
				for i in range(feathersCount):
					source_mesh = f"r_feather_{self.layer_id}_{i}_geo"
					target_mesh =  utils.getOpposite(self.name)+f"_layer_{self.layer_id}_feather_{i}_geo"
					cmds.select(source_mesh)
					cmds.DeleteHistory()
					project_on_plane(source_mesh, target_mesh)
					cmds.select(target_mesh, source_mesh)
					tools.copySkin()

	def combineLayer(self): # not used
		def run(geo_name, par):
			selection = cmds.ls(sl=True)
			joint_list = []
			
			for item in selection:       
				findSkinStart = mel.eval('findRelatedSkinCluster ' + item)
				
				if cmds.objExists (findSkinStart):
					print (findSkinStart)
		
				matrix_array = cmds.getAttr(findSkinStart + ".matrix", mi = True)

				for i in matrix_array:
					list = cmds.connectionInfo(findSkinStart + ".matrix[" + str(i) + "]", sourceFromDestination = True)
					joint = list.split(".")
					joint_list.append(joint[0])         
							

			if (len(selection) > 0):
					print (selection)
					for i in range(1):
						duplicateObj = cmds.duplicate (selection)
						createGrp = cmds.group (duplicateObj)        
						combine = cmds.polyUnite (createGrp, name = geo_name)
						deleteHistory = cmds.delete (combine, ch=True)
						deleteGrp = cmds.select (cmds.delete (createGrp))
						newskin = cmds.skinCluster(joint_list,geo_name, n=geo_name + "_SKC")
						newSelect = cmds.select (joint_list, selection, geo_name, add= True )
						transfer = cmds.copySkinWeights (nm=True, sa ="closestPoint", ia ="closestJoint")
						delete = cmds.delete (selection)
						selectnewobj = cmds.select (geo_name)
						cleanSkinEnd = mel.eval('removeUnusedInfluences ')

						deselect = cmds.select (cl=True)

			if par:
				cmds.parent(geo_name, par)

		geo_name = f"l_feathers_{self.layer_id}_geo"
		cmds.select(f"l_feather_{self.layer_id}_*_geo")
		par = cmds.listRelatives(f"l_feather_{self.layer_id}_0_geo", p=1)[0] or None
		run(geo_name, par)

		if self.symmetrical:
			geo_name = f"r_feathers_{self.layer_id}_geo"
			cmds.select(f"r_feather_{self.layer_id}_*_geo")
			par = cmds.listRelatives(f"r_feather_{self.layer_id}_0_geo", p=1)[0] or None
			run(geo_name, par)

class InputDialog(QtWidgets.QDialog):
	def __init__(self, widget=None, parent=None):
		super().__init__(parent)
		self.setWindowTitle("Layer Options")

		# Создание полей ввода
		self.num1_edit = QtWidgets.QSpinBox()
		self.num2_edit = QtWidgets.QSpinBox()
		if widget:
			self.num1_edit.setValue(int(widget.feathersCount_lineEdit.text()))
			self.num2_edit.setValue(int(widget.controlsCount_lineEdit.text()))
		else:
			self.num1_edit.setValue(10)
			self.num2_edit.setValue(3)

		# Создание кнопок
		self.ok_button = QtWidgets.QPushButton("OK")
		self.cancel_button = QtWidgets.QPushButton("Cancel")

		# Создание макета
		layout = QtWidgets.QVBoxLayout()
		layout.addWidget(QtWidgets.QLabel("Feathers Count:"))
		layout.addWidget(self.num1_edit)
		layout.addWidget(QtWidgets.QLabel("Feather Controls Count:"))
		layout.addWidget(self.num2_edit)

		# Создание горизонтального макета для кнопок
		button_layout = QtWidgets.QHBoxLayout()
		button_layout.addWidget(self.ok_button)
		button_layout.addWidget(self.cancel_button)
		layout.addLayout(button_layout)

		self.setLayout(layout)

		# Подключение сигналов
		self.ok_button.clicked.connect(self.accept)
		self.cancel_button.clicked.connect(self.reject)

	def get_values(self):
		num1 = self.num1_edit.value()
		num2 = self.num2_edit.value()
		return num1, num2