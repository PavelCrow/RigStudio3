import maya.cmds as cmds
import pymel.core as pm
from functools import partial
import maya.OpenMayaUI as OpenMayaUI
import os

from ...ui.groupLabel import GroupLabel
from ... import utils, module, controller

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

class Wing(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		
		self.feathersCount = 20
		self.jointsCount = 8

		self.widget = None
		
	def connectSignals(self, mainInstance, w):
		self.widget = w
		self.mainInstance = mainInstance
		
		module = mainInstance.curModule
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))

		w.addLayer_btn.clicked.connect(partial(self.addLayer, self.mainInstance, w))

		v = cmds.getAttr(self.name+"_control.addControls1")
		w.layer_checkBox.setChecked(v)
		w.layer_checkBox.clicked.connect(partial(self.toggle, w, 1))

		g = GroupLabel(w.density_label, w.density_groupFrame, w.verticalLayout_24)
		g.off = False
		g.mousePressEvent(1)

		w.tip_slider_1.valueChanged.connect(partial(self.slider_update, "tip", 1))
		w.tip_slider_2.valueChanged.connect(partial(self.slider_update, "tip", 2))
		w.tip_slider_3.valueChanged.connect(partial(self.slider_update, "tip", 3))
		w.tip_slider_4.valueChanged.connect(partial(self.slider_update, "tip", 4))

		w.root_slider_1.valueChanged.connect(partial(self.slider_update, "root", 1))
		w.root_slider_2.valueChanged.connect(partial(self.slider_update, "root", 2))
		w.root_slider_3.valueChanged.connect(partial(self.slider_update, "root", 3))
		w.root_slider_4.valueChanged.connect(partial(self.slider_update, "root", 4))

		w.tip_lineEdit_1.editingFinished.connect(partial(self.sliderValue_update,  "tip", 1))
		w.tip_lineEdit_2.editingFinished.connect(partial(self.sliderValue_update,  "tip", 2))
		w.tip_lineEdit_3.editingFinished.connect(partial(self.sliderValue_update,  "tip", 3))
		w.tip_lineEdit_4.editingFinished.connect(partial(self.sliderValue_update,  "tip", 4))

		w.root_lineEdit_1.editingFinished.connect(partial(self.sliderValue_update,  "root", 1))
		w.root_lineEdit_2.editingFinished.connect(partial(self.sliderValue_update,  "root", 2))
		w.root_lineEdit_3.editingFinished.connect(partial(self.sliderValue_update,  "root", 3))
		w.root_lineEdit_4.editingFinished.connect(partial(self.sliderValue_update,  "root", 4))
	
	def updateOptionsPage(self, widget=None):
		options = self.getOptions()

		if not self.widget:
			return
		
		# update main layer values
		self.feathersCount = options['feathersCount']
		self.widget.feathersCount_spinBox.setValue(self.feathersCount)	

		self.jointsCount = options['jointsCount']
		self.widget.jointsCount_spinBox.setValue(self.jointsCount)
		
		# delete old feather widgets
		for x in range(self.widget.layers_verticalLayout.count()):
			w = self.widget.layers_verticalLayout.itemAt(x).widget()
			w.deleteLater()

		# add feathers widgets
		path = os.path.join(self.mainInstance.rootPath, "modules", self.type, self.type + "_addLayer_widget.ui")
		self.layers_widgets = []
		for i, l in enumerate(options['addLayersData']):
			w = load_ui_widget(path)
			self.widget.layers_verticalLayout.addWidget(w)
			self.layers_widgets.append(w)
			
			w.feathersCount_spinBox.setValue(l['feathersCount'])
			w.jointsCount_spinBox.setValue(l['jointsCount'])
			w.layer_checkBox.setText("Layer "+str(l['id']))

			v = cmds.getAttr(self.name+"_control.addControls%s" %l['id'])
			w.layer_checkBox.setChecked(v)
			w.layer_checkBox.clicked.connect(partial(self.toggle, w, l['id']))

			w.delete_btn.clicked.connect(partial(self.deleteLayer, self.mainInstance, widget, l['id']))
			w.rebuild_btn.clicked.connect(partial(self.rebuild, l['id']))

			w.offset_slider.valueChanged.connect(partial(self.add_slider_update, w, "offset", l['id']))
			w.length_slider.valueChanged.connect(partial(self.add_slider_update, w, "length", l['id']))

			w.offset_lineEdit.editingFinished.connect(partial(self.add_sliderValue_update, w, "offset"))
			w.length_lineEdit.editingFinished.connect(partial(self.add_sliderValue_update, w, "length"))

			w.offset_lineEdit.setText(str(l['offset']))
			w.length_lineEdit.setText(str(l['length']))

			w.offset_slider.setValue(l['offset']*100)
			w.length_slider.setValue(l['length']*100)

		# update density sliders
		for i in range(1, 5):
			v = cmds.getAttr(self.name+"_mod.inbetween_1_%s" %i) * 100
			eval("self.widget.root_slider_%s.setValue(%s)" %(i, v))
			eval("self.widget.root_lineEdit_%s.setText(str(%s))" %(i, v))
			v = cmds.getAttr(self.name+"_mod.inbetween_4_%s" %i) * 100
			eval("self.widget.tip_slider_%s.setValue(%s)" %(i, v))
			eval("self.widget.tip_lineEdit_%s.setText(str(%s))" %(i, v))

	def get_layers_ids(self):
		# get existed ids
		groups = cmds.listRelatives(self.name+'_detail_group') or []
		ids = []
		for g in groups:
			id = int(g.split("_")[-2])
			if id != 1:
				ids.append(id)

		addLayersIds = sorted(ids)

		return addLayersIds

	def getOptions(self):
		if cmds.objExists(self.name+'_layer_1_feather_0_0_ikJoint'):
			self.jointsCount = len(cmds.listRelatives(self.name+'_layer_1_feather_0_0_ikJoint', allDescendents=1, type='joint')) + 1
			self.feathersCount = len(cmds.listRelatives(self.name+'_layer_1_ikJoint', allDescendents=0 ))

		addLayersData = []
		addLayersIds = self.get_layers_ids()
		for id in addLayersIds:
			addLayerData = {}
			addLayerData['id'] = id
			addLayerData['jointsCount'] = len(cmds.listRelatives(self.name+'_layer_%s_feather_0_0_ikJoint' %(id), allDescendents=1, type='joint')) + 1
			addLayerData['feathersCount'] = len(cmds.listRelatives(self.name+'_layer_%s_group' %(id) or []) )
			addLayerData['offset'] = cmds.getAttr(self.name+"_mod.layer_%s_offset" %(id))
			addLayerData['length'] = cmds.getAttr(self.name+"_mod.layer_%s_length" %(id))
			addLayersData.append(addLayerData)

		optionsData = {}
		optionsData['jointsCount'] = self.jointsCount
		optionsData['feathersCount'] = self.feathersCount
		optionsData['addLayersData'] = addLayersData
		
		return optionsData
	
	def getData(self):
		data = super(self.__class__, self).getData()
		
		options = self.getOptions()
		
		self.feathersCount = options['feathersCount']
		self.jointsCount = options['jointsCount']

		return data	

	def setData(self, data, sym=False, namingForce=False, load="all"):
		super(self.__class__, self).setData(data, sym, namingForce)

		data = data["optionsData"]

		self.deleteLayer(layer_id=1, update=None)
		
		self.generateFingers(data["feathersCount"], data["jointsCount"], layer_id=1)
		
		for i, f_data in enumerate(data["addLayersData"]):
			self.deleteLayer(layer_id=(i+2), update=None)
			self.addLayer(layer_id=(i+2), f_data=f_data)
		# self.addSkinJoints()
	
	def rebuildWithNewOptions(self, mainInstance, widget):
		feathersCount, jointsCount = widget.feathersCount_spinBox.value(), widget.jointsCount_spinBox.value()

		self.deleteLayer(layer_id=1)
		
		self.generateFingers(feathersCount, jointsCount)
		# self.addSkinJoints()

		opp_mod = utils.getOpposite(self.name+"_mod")
		if cmds.objExists(opp_mod) and opp_mod != self.name+"_mod":
			opp_m = utils.getModuleInstance(utils.getOpposite(self.name))
			opp_m.deleteLayer(layer_id=1)
			opp_m.generateFingers(feathersCount, jointsCount)
			# opp_m.addSkinJoints()

		self.updateOptionsPage()
		
	def generateFingers(self, feathersCount, chainLengh, layer_id=1):
		# print("GENERATE", feathersCount, chainLengh, layer_id)
		name = self.name
		wing_name = name+"_layer_"+str(layer_id)
		detail_group = name+'_layer_%s_group' %layer_id
		detail_controls_group = name+'_detail_layer_%s_group' %layer_id

		cmds.undoInfo(openChunk=True)

		pm.group(empty=1, n=detail_group)
		pm.parent(detail_group, name+"_detail_group")
		pm.setAttr(detail_group+".inheritsTransform", 0)
		cmds.sets(detail_group, e=1, forceElement=name+'_nodesSet')

		pm.group(empty=1, n=detail_controls_group)
		pm.parent(detail_controls_group, name+"_detail_feathers_controls")
		utils.resetAttrs(detail_controls_group)
		cmds.connectAttr(name+"_control.addControls%s" %layer_id, detail_controls_group+".visibility")
		cmds.sets(detail_controls_group, e=1, forceElement=name+'_nodesSet')

		root_j = cmds.joint(n=wing_name+'_ikJoint')
		pm.parent(root_j, self.name+'_feathers_ik_joints')
		utils.removeTransformParentJoint(root_j)
		cmds.setAttr(root_j+".drawStyle", 2)
		cmds.sets(root_j, e=1, forceElement=name+'_nodesSet')

		for f in range(feathersCount):
			step = 1.0/(feathersCount-1)*f
			joints = []
			f_name = "feather_%s" %f
			prev_f = '%s_feather_%s' %(wing_name,f-1)
			cur_f = '%s_feather_%s' %(wing_name,f)
			
			gr = pm.group(empty=1, n=cur_f+"_system_group")
			cmds.sets(gr.name(), e=1, forceElement=name+'_nodesSet')
			
			for i in range(chainLengh):
				pm.select(clear=1)
				j = pm.joint(n="%s_%s_ikJoint" %(cur_f,i))
				cmds.sets(j.name(), e=1, forceElement=name+'_nodesSet')

				joints.append(j)
				# cmds.sets(j.name(), e=1, forceElement=name+'_skinJointsSet')

				if i > 0:
					pm.parent(j, joints[i-1])
					j.tx.set(1)
					
			pm.parent(joints[0], gr)
			
			points = [ (x*2,0,0) for x in range(4) ]
			crv = pm.curve(d=3, p=points, n=cur_f+"_crv")
			cmds.sets(crv.name(), e=1, forceElement=name+'_nodesSet')
			sCrv = crv.getShape()
			cvs = sCrv.getCVs()
			pm.parent(crv, gr)
			pm.hide(crv)
			
			for i in range(4):
				# make locator
				loc = pm.spaceLocator(n=crv+"_"+str(i+1)+'_loc')
				cmds.sets(loc.name(), e=1, forceElement=name+'_nodesSet')
				loc.hide()
				pm.parent(loc, gr)

				# move locator to cv
				cv = cvs[i]
				loc.setTranslation((cv.x,cv.y,cv.z))

				pcu = pm.createNode('pointOnCurveInfo', n='%s_%s_pointOnCurveInfo' %(cur_f,i+1))
				cmds.sets(pcu.name(), e=1, forceElement=name+'_nodesSet')
				pm.connectAttr(wing_name+'_curve_%sShape.worldSpace[0]' %(i+1), pcu.inputCurve)
				pcu.position >> loc.t
				pcu.parameter.set(step)

				# connect loc to cv
				pm.connectAttr(loc.worldPosition[0], sCrv.controlPoints[i])
				
			if f > 0:
				con = pm.aimConstraint(prev_f+'_crv_1_loc', cur_f+'_crv_1_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', 1,0,0)
				pm.setAttr(con+'.upVector', 0,0,1)
				pm.connectAttr(cur_f+'_crv_2_loc.worldMatrix', con.worldUpMatrix)

				con = pm.aimConstraint(cur_f+'_crv_1_loc', cur_f+'_crv_4_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', 0,0,-1)
				pm.setAttr(con+'.upVector', 1,0,0)
				pm.connectAttr(prev_f+'_crv_4_loc.worldMatrix', con.worldUpMatrix)
				
			if f == 1: 
				cur_f
				con = pm.aimConstraint(cur_f+'_crv_1_loc', prev_f+'_crv_1_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', -1,0,0)
				pm.setAttr(con+'.upVector', 0,0,1)
				pm.connectAttr(prev_f+'_crv_4_loc.worldMatrix', con.worldUpMatrix)

				con = pm.aimConstraint(cur_f+'_crv_4_loc', prev_f+'_crv_4_loc')
				cmds.sets(con.name(), e=1, forceElement=name+'_nodesSet')
				pm.setAttr(con+'.worldUpType', 1)
				pm.setAttr(con+'.aimVector', -1,0,0)
				pm.setAttr(con+'.upVector', 0,0,-1)
				pm.connectAttr(prev_f+'_crv_2_loc.worldMatrix', con.worldUpMatrix)
				
			# make spline ik
			pm.select(joints[0], joints[-1], crv)
			ikh = pm.ikHandle(sol='ikSplineSolver', ccv=0, pcv=0, ns=2, n=cur_f+'_ikHandle')[0]
			cmds.sets(ikh.name(), e=1, forceElement=name+'_nodesSet')
			ikh.dTwistControlEnable.set(1)
			ikh.dWorldUpType.set(4)
			pm.connectAttr(cur_f+'_crv_1_loc.worldMatrix[0]', ikh.dWorldUpMatrix)
			pm.connectAttr(cur_f+'_crv_4_loc.worldMatrix[0]', ikh.dWorldUpMatrixEnd)
			pm.parent(ikh, gr)
			ikh.hide()

			l = pm.spaceLocator(n=cur_f+'_twistReader_loc')
			cmds.sets(l.name(), e=1, forceElement=name+'_nodesSet')
			pm.parent(l, cur_f+'_crv_1_loc')
			l.t.set(0,0,0)
			pm.orientConstraint(cur_f+'_crv_4_loc', l, mo=0)
			l.rotateOrder.set(1)

			if f < feathersCount:
				step = 1.0/(feathersCount-1)*f
				for n in range(1, 5):
					pc1 = pm.createNode('pointOnCurveInfo', n='%s_%s_sample_pointOnCurveInfo' %(cur_f,n))
					cmds.sets(pc1.name(), e=1, forceElement=name+'_nodesSet')
					pm.connectAttr(name+'_sample_%s_crvShape.worldSpace[0]' %n, pc1.inputCurve)
					pc1.parameter.set(step)
					pm.connectAttr(pc1.positionX, '%s_%s_pointOnCurveInfo.parameter' %(cur_f,n))

			pm.parent(joints[0], root_j)
			utils.removeTransformParentJoint(joints[0].name())
			pm.parent(gr, detail_group)    

		
			# add feather control
			c = cmds.curve(d=3, p=[(0,0, 1.5), (1,0,1), (1,0,-1), (0,0,-1.5)], n=cur_f)
			cmds.sets(c, e=1, forceElement=name+'_nodesSet')
			cS = cmds.listRelatives(c)[0]
			cmds.setAttr(cS+".overrideEnabled", 1)
			cmds.setAttr(cS+".overrideColor", 18)
			cmds.rename(cS, cur_f+"Shape")
			cmds.select(c+"Shape.cv[0:3]")
			cmds.scale(0.2, 0.2, 0.2, ocp=1)
			utils.lockChannels(c, channels=[])
			cmds.addAttr(c, ln="bend", at="double", k=1)
			cmds.addAttr(c, ln="bendHorizontal", at="double", k=1)
			cmds.addAttr(c, ln="twist", at="double", k=1)

			# # add skin joints
			mm = cmds.createNode("multMatrix", n=cur_f+"_inverse_multMatrix")
			cmds.sets(mm, e=1, forceElement=name+'_nodesSet')
			dm = cmds.createNode("decomposeMatrix", n=cur_f+"_inverse_decomposeMatrix")
			cmds.sets(dm, e=1, forceElement=name+'_nodesSet')
			cmds.connectAttr(mm+".matrixSum", dm+".inputMatrix")
			for n in range(chainLengh):
				sj = cmds.joint(n="%s_%s_outJoint" %(cur_f,n))
				cmds.sets(sj, e=1, forceElement=name+'_nodesSet')
				if n==0:
					sj_gr = cmds.group(sj, n=cur_f+"_outJoints_group")
					cmds.sets(sj_gr, e=1, forceElement=name+'_nodesSet')
					cmds.parent(sj_gr, detail_controls_group)
					utils.resetAttrs(sj_gr)
					cmds.connectAttr("%s_%s_ikJoint.matrix" %(cur_f,n), sj_gr+".offsetParentMatrix")
					cmds.addAttr(sj, ln="length", at="double", k=1, min=0, max=1, dv=1)
					cmds.addAttr(sj, ln="pos", at="double", k=1, min=0, max=1)
					cmds.setAttr(sj+".pos", step)
					for m in range(1,5):
						cmds.connectAttr(sj+".pos", "%s_%s_sample_pointOnCurveInfo.parameter" %(cur_f,m))
					if utils.getObjectSide(sj) == "r":
						opp_sj = utils.getOpposite(sj)
						cmds.connectAttr(opp_sj+".pos", sj+".pos")

					cmds.select(sj)
				else:
					cmds.connectAttr("%s_%s_ikJoint.matrix" %(cur_f,n), sj+".offsetParentMatrix")
					cmds.connectAttr("%s_%s_ikJoint.matrix" %(cur_f,n), mm+".matrixIn[%s]" %n)
					cmds.connectAttr(c+".bend", sj+".rz")
					cmds.connectAttr(c+".bendHorizontal", sj+".ry")
					cmds.connectAttr(c+".twist", sj+".rx")
			
			# add first feather control group
			c_gr = cmds.group(empty=1, n=c+"_group")
			cmds.sets(c_gr, e=1, forceElement=name+'_nodesSet')
			c_rev_gr = cmds.group(empty=1, n=c+"_reverseGroup")
			cmds.sets(c_rev_gr, e=1, forceElement=name+'_nodesSet')
			cmds.parent(c, c_gr)
			cmds.parent(c_gr, c_rev_gr)
			cmds.parent(c_rev_gr, sj)
			utils.resetAttrs(c_rev_gr)
			mult = cmds.createNode("multiplyDivide", n=c+"_inverse_multiplyDivide")
			cmds.sets(mult, e=1, forceElement=name+'_nodesSet')
			cmds.setAttr(mult+".input2", -1,-1,-1)
			cmds.connectAttr(c+".t", mult+".input1")
			cmds.connectAttr(mult+".output", c_rev_gr+".t")
			cmds.connectAttr(c+".t", sj_gr+".t")
			cmds.connectAttr(c+".r", sj_gr+".r")
			cmds.connectAttr(c+".s", sj_gr+".s")
			cmds.connectAttr(dm+".outputRotate", c_gr+".r")
			uc = cmds.createNode("unitConversion", n=c+"_inverse_unitConversion")
			cmds.sets(uc, e=1, forceElement=name+'_nodesSet')
			cmds.setAttr(uc+".conversionFactor", -1)
			cmds.connectAttr(c+".r", uc+".input")
			cmds.connectAttr(uc+".output", c_rev_gr+".r")

			# set chain length
			ci = pm.createNode('curveInfo')
			sCrv.worldSpace[0] >> ci.inputCurve
			md = pm.createNode('multiplyDivide')
			ci.arcLength >> md.input1X
			md.operation.set(2)
			md.input2X.set(chainLengh-1)
			sc = ci.arcLength.get() / (chainLengh-1)
		
			for j in pm.listRelatives(cur_f+"_0_ikJoint", allDescendents=1, type='joint'):
				j.tx.set(sc)
		
			pm.delete(md, ci)

			ci = cmds.createNode("curveInfo", n=cur_f+"_curveInfo")
			cmds.sets(ci, e=1, forceElement=name+'_nodesSet')
			cmds.connectAttr(cur_f+"_crvShape.worldSpace[0]", ci+".inputCurve")

			mult1 = cmds.createNode("multiplyDivide", n=cur_f+"_multiplyDivide")
			cmds.sets(mult1, e=1, forceElement=name+'_nodesSet')
			cmds.setAttr(mult1+".operation", 2)
			cmds.connectAttr(ci+".arcLength", mult1+".input1X")
			cmds.connectAttr(name+"_root_connector_decomposeMatrix.outputScaleX", mult1+".input2X")

			mult2 = cmds.createNode("multDoubleLinear", n=cur_f+"_multDoubleLinear")
			cmds.sets(mult2, e=1, forceElement=name+'_nodesSet')
			cmds.connectAttr(mult1+".outputX", mult2+".input1")
			if layer_id == 1:
				cmds.setAttr(mult2+".input2", 1)
			else:
				cmds.connectAttr(self.name+"_mod.layer_%s_length" %layer_id, mult2+".input2")

			mult3 = cmds.createNode("multDoubleLinear", n=cur_f+"_multDoubleLinear_2")
			cmds.sets(mult3, e=1, forceElement=name+'_nodesSet')
			cmds.connectAttr(mult2+".output", mult3+".input1")
			cmds.connectAttr( "%s_0_outJoint.length" %cur_f, mult3+".input2")

			mult4 = cmds.createNode("multiplyDivide", n=cur_f+"_multiplyDivide_2")
			cmds.sets(mult4, e=1, forceElement=name+'_nodesSet')
			cmds.setAttr(mult4+".operation", 2)
			cmds.connectAttr(mult3+".output", mult4+".input1Y")
			cmds.setAttr(mult4+".input2Y", chainLengh-1)

			for i in range(chainLengh-1):
				cmds.connectAttr(mult4+".outputY", cur_f+"_%s_ikJoint.translateX" %(i+1))
		
		cmds.undoInfo(closeChunk=True)

	def addSkinJoints(self):
		super(self.__class__, self).addSkinJoints()
		if self.parent:
			cmds.parent(self.name+"_root_skinJoint", self.parent.replace("outJoint", "skinJoint"))

	def connect(self, target, opposite=False, makeSeamless=False):
		super(self.__class__, self).connect(target, opposite, makeSeamless)
		
		# # Connect inbetween attrs
		if opposite:
			oppModuleName = utils.getOpposite(self.name)
			for i in range(1, 5):
				for n in range(1, 5):
					cmds.connectAttr(oppModuleName+"_mod.inbetween_%s_%s" %(i, n), self.name+"_mod.inbetween_%s_%s" %(i, n), f=1)
		
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

		for d in data['addLayersData']:
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

	def addLayer(self, mainInstance=None, widget=None, f_data=None, layer_id=None):
		if not layer_id:
			layer_id = 2
			while(cmds.objExists(self.name+"_layer_%s_group" %layer_id)):
				layer_id += 1

		wing_name = self.name + "_layer_" + str(layer_id)
		crv_name = wing_name + "_curve"

		cmds.undoInfo(openChunk=True)
		
		# add attributes
		cmds.addAttr(self.name+"_mod", ln="layer_%s_offset" %layer_id, at="double", k=1)
		cmds.addAttr(self.name+"_mod", ln="layer_%s_length" %layer_id, at="double", k=1, dv=1)
		cmds.addAttr(self.name+"_control", ln="addControls%s" %layer_id, at="bool", dv=True)
		cmds.setAttr(self.name+"_control.addControls%s" %layer_id, channelBox=1)
		
		# duplicate feathers rig
		crv_gr = cmds.duplicate(self.name+"_layer_1_curves", n=wing_name+"_curves")[0]
		for i in range(1, 5):
			cmds.rename("%s|%s_layer_1_curve_%s" %(crv_gr,self.name,i), "%s_%s" %(crv_name,i))
		for n in range(1, 5):
			for i in range(1, 7):
				l = cmds.duplicate(self.name+"_layer_1_curve_%s_loc_%s" %(n,i), n=crv_name+"_%s_loc_%s" %(n,i))[0]
				cmds.connectAttr(l+"Shape.worldPosition[0]", crv_name+"_%sShape.controlPoints[%s]" %(n,i-1))
				cmds.connectAttr(self.name+"_mod.layer_%s_offset" %layer_id, l+".ty")

		# add widget
		if widget:
			# if utils.getObjectSide(self.name) != "r":
			path = os.path.join(self.mainInstance.rootPath, "modules", self.type, self.type + "_addLayer_widget.ui")
			w = load_ui_widget(path)
			widget.layers_verticalLayout.addWidget(w)
			self.layers_widgets.append(w)
			w.delete_btn.clicked.connect(partial(self.deleteLayer, self.mainInstance, widget, layer_id, update=True))

			# set default values
			feathersCount = 10 #eval('widget.feathersCount_spinBox_%s.value()' %(layer_id))
			jointsCount = 4 #eval('widget.jointsCount_spinBox_%s.value()' %(layer_id))
			f_data = {}
			f_data["id"] = layer_id
			f_data["feathersCount"] = feathersCount
			f_data["jointsCount"] = jointsCount
			f_data["offset"] = 0.0
			f_data["length"] = 1.0
		else:
			feathersCount = f_data["feathersCount"]
			jointsCount = f_data["jointsCount"]
			cmds.setAttr(self.name+"_mod.layer_%s_offset" %layer_id, f_data['offset'])
			cmds.setAttr(self.name+"_mod.layer_%s_length" %layer_id, f_data['length'])
		
		# generate feathers
		self.generateFingers(feathersCount, jointsCount, layer_id)

		# mirror 
		mod = self.name+"_mod"
		opp_mod = utils.getOpposite(mod)
		if cmds.objExists(opp_mod) and opp_mod != mod:
			if utils.getObjectSide(opp_mod) == "r":
				opp_m = utils.getModuleInstance(utils.getOpposite(self.name))
				opp_m.addLayer(layer_id=layer_id, f_data=f_data)
			elif utils.getObjectSide(self.name) == "r":
				cmds.connectAttr(opp_mod+".layer_%s_offset" %layer_id, mod+".layer_%s_offset" %layer_id)
				cmds.connectAttr(opp_mod+".layer_%s_length" %layer_id, mod+".layer_%s_length" %layer_id)

		cmds.undoInfo(closeChunk=True)

		self.updateOptionsPage()

	def slider_update(self, part, id, v):
		if self.opposite:
			return
		
		value = round(v * 0.01, 3)
		eval("self.widget.%s_lineEdit_%s.setText(str(%s))" %(part, id, value))

		if part == "root":
			cmds.setAttr(self.name+"_mod.inbetween_1_%s" %id, value)
		else:
			cmds.setAttr(self.name+"_mod.inbetween_4_%s" %id, value)

	def add_slider_update(self, widget, attr, id, v):
		if self.opposite:
			return

		value = round(v * 0.01, 3)
		eval("widget.%s_lineEdit.setText(str(%s))" %(attr, value))

		try:
			cmds.setAttr(self.name+"_mod.layer_%s_%s" %(id,attr), value)
		except: pass

	def sliderValue_update(self, part, id):
		v = float( self.widget.tip_lineEdit_1.text() ) * 100
		self.widget.tip_slider_1.setValue(v)
		eval("self.widget.%s_slider_%s.setValue(%s)" %(part, id, v))

	def add_sliderValue_update(self, widget, attr):
		v = float( eval("widget.%s_lineEdit.text()" %attr) ) * 100

		eval("widget.%s_slider.setValue(%s)" %(attr, v))

	def toggle(self, widget, id):
		v = widget.layer_checkBox.isChecked()
		cmds.setAttr(self.name+"_control.addControls%s" %id, v)

		if self.symmetrical:
			cmds.setAttr(utils.getOpposite(self.name)+"_control.addControls%s" %id, v)