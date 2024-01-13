import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
from functools import partial
import logging, traceback, os, imp, sys

if sys.version[0] == "2":
	import utils, main
else:
	import importlib
	import rigStudio2.main as main
	import rigStudio2.utils as utils
	
version = int(cmds.about(v=True).split(" ")[0])
if version >= 2020:
	from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
else:
	from Qt import QtWidgets, QtGui, QtCore, QtUiTools
try:
	from shiboken import wrapInstance
except:
	from shiboken2 import wrapInstance

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
logger.setLevel(logging.DEBUG)

rootDebug = ""
fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])

def debugStart(func, name="", noEnd=False):
	if not main.configData['debug']: return
	global rootDebug
	rootDebug = rootDebug + ' -> ' + func
	logger.debug(rootDebug + ' ' + name + ' -> ')	

	if noEnd:
		rootDebug = rootDebug.split(' -> ' + func)[0]	

def debugEnd(func, name=""):
	if not main.configData['debug']: return
	global rootDebug
	logger.debug(rootDebug + ' ' + name + " -| ")
	rootDebug = rootDebug.split(' -> ' + func)[0]	

class Connections(object):
	
	def loadUiWidget(self, uifilename, parent=None):
		loader = QtUiTools.QUiLoader()
		uifile = QtCore.QFile(uifilename)

		uifile.open(QtCore.QFile.ReadOnly)
		ui = loader.load(uifile, parent)
		uifile.close()
		return ui	
	
	def __init__(self, win):
		debugStart(traceback.extract_stack()[-1][2])

		self.win = win
		self.connectSignals()
		self.items = []
		self.itemsData = {}
		
		self.load()
		self.updateUi()
		
		#self.win.connections_listWidget.setStyleSheet("#connections_listWidget { background-color:rgb(60, 60, 60); } ")
		self.win.connections_listWidget.setStyleSheet("background-color:rgb(60, 60, 60);")
		
		debugEnd(traceback.extract_stack()[-1][2])

	def connectSignals(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.win.addConnection_btn.clicked.connect(self.createConnection)

	def addTarget(self, source):
		sel = cmds.ls(sl=1)
		if len(sel) == 0:
			cmds.warning("Select controls with attributes")
			return

		s_c, s_a = source.split(".")
		data = self.itemsData[source]
		w = data['widget']
		targets = data['targets']
		
		channelBox = mel.eval('global string $gChannelBoxName; $temp=$gChannelBoxName;')
		attrs = pm.channelBox(channelBox, q=True, sma=True)
		
		for t_c in sel:
			if not attrs:
				attrs = ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ"]
			
			new_attrs = []
			for a in attrs:
				a = cmds.attributeQuery(a, node=t_c, longName=1)
				
				if t_c+"."+a not in targets and t_c+"."+a != source:
					new_attrs.append(a)
					targets.append(t_c+"."+a)
			
		data['targets'] = sorted(targets)
		self.itemsData[source] = data
		
		self.fillTargetList(source)
			
	def fillTargetList(self, source):
		s_c, s_a = source.split(".")
		data = self.itemsData[source]
		w = data['widget']
		targets = data['targets']
		
		w.target_treeWidget.clear()
		
		for t in targets:
			t_c, t_a = t.split(".")
			
			parents = w.target_treeWidget.findItems(t_c,QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)
			if len(parents) == 1:
				root_item = parents[0]
			else:
				root_item = QtWidgets.QTreeWidgetItem()
				root_item.setText(0, t_c)
				w.target_treeWidget.addTopLevelItem(root_item)
			
			item = QtWidgets.QTreeWidgetItem()
			item.setText(0, t_a)
			root_item.addChild(item)
		
	def setKey(self, source):
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)
		
		data = self.itemsData[source]
		w = data['widget']
		targets = data['targets']
		
		driver = pm.PyNode(s_c)
		dAttr = driver.attr(s_a)
	
		for t in targets:
			t_c, t_a = t.split(".")		
			target = pm.PyNode(t_c)
			tAttr = target.attr(t_a)
			
			node_name = ("%s_connectionPlus" %tAttr).replace(".", "_")
			gr_name = "%s_connectionPlus_group" %t_c
			
			# create group 
			if not cmds.objExists(gr_name):
				gr = pm.group(n=gr_name, empty=1)
				mat = pm.xform(target, q=1, m=1)
				target.t.set(0,0,0)
				target.r.set(0,0,0)
				target.s.set(1,1,1)
				con1 = pm.parentConstraint(target, gr, mo=0)
				con2 = pm.scaleConstraint(target, gr, mo=0)
				pm.delete(con1, con2)
				par = target.getParent()
				pm.parent(gr, par)
				pm.parent(target, gr)
				pm.xform(target, m=mat)
			
			else:
				gr = pm.PyNode(gr_name)	
			
			# create plus node
			if not cmds.objExists(node_name):
				plus = pm.createNode("plusMinusAverage", n=node_name)
				plus.output1D >> gr.attr(t_a)
			else:
				plus = pm.PyNode(node_name) 	
			
			
			# check what attr is connected
			inputs_count = len(plus.input1D.inputs())
			s_isConnected = False
			if inputs_count > 0:
				for conn in plus.input1D.inputs():
					if 'animCurve' in conn.type():
						input_node = conn.input.inputs()[0]
						in_attr = pm.PyNode(pm.connectionInfo(conn.input, sourceFromDestination=1))
						if 'unitConversion' in input_node.type():
							in_attr = pm.PyNode(pm.connectionInfo(input_node.input, sourceFromDestination=1))
						if in_attr == pm.PyNode(source):
							s_isConnected = True
			
			# connect to first free input attr if not connected
			i = 0
			if not s_isConnected:
				while plus.input1D[i].inputs() != []:
					i += 1
					
			# add key
			drivenAttr = plus.input1D[i]
			
			v = drivenAttr.get() + tAttr.get()
			drivenAttr.set(v)
			tAttr.set(0)
			
			dk = pm.setDrivenKeyframe(drivenAttr, currentDriver=source)
			
		for conn in sAttr.outputs():
			if 'unitConversion' in conn.type():
				conn = conn.outputs()[0]
			if 'animCurve' in conn.type():
				dk_c = conn
				count = dk_c.numKeys()
				v_min = dk_c.getValue(0)
				v_max = dk_c.getValue(count-1)
				data['keys'] = [v_min, v_max]
				frames = pm.keyframe(dk_c, q=True, floatChange=1)
				data["frames"] = frames
				self.itemsData[source] = data
				break
			
		self.updateUi()
		self.updateUi()
		self.updateUi()
		self.updateUi()
		self.updateUi()		

		'''
		for t in targets:
			t_c, t_a = t.split(".")
			target = pm.PyNode(t_c)
			tAttr = target.attr(t_a)
			node_name = ("%s_connectionPlus" %tAttr).replace(".", "_")
			gr_name = "%s_connectionPlus_group" %t_c
			
			if not cmds.objExists(node_name):
				plus = pm.createNode("plusMinusAverage", n=node_name)
			else:
				plus = pm.PyNode(node_name) 			

			if t_a in ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ", "scaleX", "scaleY", "scaleZ"]:
				
				# create grup 
				if not cmds.objExists(gr_name):
					gr = pm.group(n=gr_name, empty=1)
					mat = pm.xform(target, q=1, m=1)
					target.t.set(0,0,0)
					target.r.set(0,0,0)
					target.s.set(1,1,1)
					con1 = pm.parentConstraint(target, gr, mo=0)
					con2 = pm.scaleConstraint(target, gr, mo=0)
					pm.delete(con1, con2)
					par = target.getParent()
					pm.parent(gr, par)
					pm.parent(target, gr)
					pm.xform(target, m=mat)
			
					# connect to stright out connctions
					#for a in ["t", "r", "s", "tx", "ty", "tz", "rx", "ry", "rz", "sx", "sy", "sz", ]: 
						#outConnections = pm.listConnections(target.attr(a), plugs=1, connections=1, s=0, d=1)
						#if len(outConnections) == 0:
							#continue
						#for outAttrData in outConnections:
							#outAttr = outAttrData[1]
							#if a == "s":
								#add = pm.createNode("multiplyDivide", n=outAttr+"_add")
								#gr.attr(a) >> add.input1
								#target.attr(a) >> add.input2
								#add.output >> outAttr
							#else:
								#add = pm.createNode("plusMinusAverage", n=outAttr+"_add")
								#gr.attr(a) >> add.input3D[0]
								#target.attr(a) >> add.input3D[1]
								#add.output3D >> outAttr
				else:
					gr = pm.PyNode(gr_name)
			
				
				
				plus.output1D >> gr.attr(t_a)								
					
			else:
				outConnections = pm.listConnections(tAttr, plugs=1, connections=1, s=0, d=1)
				if len(outConnections) == 0:
					continue
		
				for outAttrData in outConnections:
					outAttr = outAttrData[1]
					plus.output1D >> outAttr
	
				tAttr >> plus.input1D[0]
				
					
			mult = pm.createNode("multDoubleLinear", n="%s__%s__connectionMult" %(dAttr.replace(".", "_"), tAttr.replace(".", "_")))
			
			#dk = pm.setDrivenKeyframe(currentDriver=source, node_name.input1D[1];
			
			dAttr >> mult.input1
			id = len(plus.input1D.inputs())
			mult.output >> plus.input1D[id]
			
			v = tAttr.get()
			mult.input2.set(v)
		
			tAttr.set(0)				
		'''

	def fillList(self):
		self.win.connections_listWidget.clear()
		
		for t in self.items:
			d = self.itemsData[t]
			item = self.addItem(d)
		
		
	def load(self):
		data = {}
		
		# get groups
		grs = []
		for o in pm.ls(type="transform"):
			if 'connectionPlus_group' in o.name():
				grs.append(o)
		
		# get sources
		sources = []
		for gr in grs:
			for conn in gr.inputs():
				if 'unitConversion' in conn.type():
					conn = conn.inputs()[0]
				if conn.split("_")[-1] == 'connectionPlus':
					for dk in conn.inputs():
						in_attr = dk.input
						in_node = in_attr.inputs()[0]
						if 'unitConversion' in in_node.type():
							in_attr = in_node.input
							in_node = in_node.inputs()[0]
						in_conn = pm.PyNode(pm.connectionInfo(in_attr, sourceFromDestination=1))
						if in_conn not in sources:
							sources.append(in_conn)
		
		# get targets and data
		for sAttr in sources:
			targets = []
			for out in sAttr.outputs():
				if 'unitConversion' in out.type():
					out = out.output.outputs()[0]
				if 'animCurve' in out.type():
					dk = out
					plus = out.output.outputs()[0]
					out = plus.output1D.outputs()[0]
					outAttr = plus.output1D
					if 'unitConversion' in out.type():
						outAttr = out.output
						out = out.output.outputs()[0]
					gr = out
					conn = pm.PyNode(pm.connectionInfo(outAttr, destinationFromSource=1)[0])
					ctrl = pm.listRelatives(gr)[0]
					targets.append(ctrl+'.'+conn.split('.')[-1])
					
			for conn in sAttr.outputs():
				if 'unitConversion' in conn.type():
					conn = conn.outputs()[0]
				if 'animCurve' in conn.type():
					dk_c = conn
					frames = pm.keyframe(dk_c, q=True, floatChange=1)
					break						

			data[sAttr.name()] = [targets, frames]
			
			#print dk_c, frames
	
	
		# organize data
		self.items = []
		self.itemsData = {}
		
		for d in data:
			s_c, s_a = d.split(".")
			item_data = {}
			item_data["name"] = s_c
			item_data["moduleName"] = utils.getModuleNameFromAttr(s_c)
			item_data["s_attr"] = s_a
			item_data["targets"] = data[d][0]
			item_data["frames"] = data[d][1]
			item_data["widget"] = self.addItem(item_data)			

			self.items.append(d)
			self.itemsData[d] = item_data	
			
			self.fillTargetList(d)
		
	def updateUi(self):
		for source in self.itemsData:
			data = self.itemsData[source]
			w = data["widget"]
			
			w.update_btn.setStyleSheet("background-color:rgb(20, 50, 50);")
			w.createFromPose_btn.setStyleSheet("background-color:hsv(30, 50, 70);")			
			
			s_c, s_a = source.split(".")
			sAttr = pm.PyNode(source)		
			
			# remove old button
			last = False
			i = 0
			while not last:
				old_b = w.findChild(QtWidgets.QPushButton, source+"_"+str(i))
				if old_b:
					old_b.setParent(None)			
					#print "removed", source+"_"+str(i)
					i += 1
				else:
					last = True			

			# get curves
			dk_c = None
			for conn in sAttr.outputs():
				if 'unitConversion' in conn.type():
					conn = conn.outputs()[0]
				if 'animCurve' in conn.type():
					dk_c = conn
					break
			
			if not dk_c:
				return
			
			count = dk_c.numKeys()
			
			v_min = dk_c.getValue(0)
			v_max = dk_c.getValue(count-1)
			v_current = sAttr.get()
			
			w.doubleSpinBox.setValue(v_current)
			
			
			#width = w.frame.size().width() - 10
			width = 146
			
			frames = pm.keyframe(dk_c, q=True, floatChange=1)
			#print 1, frames
			#frames_length = frames[-1] - frames[0]
			
			#w.horizontalSlider.setMinimum(frames[0])
			#w.horizontalSlider.setMaximum(frames[-1])			
			
			
			if len(frames) > 1:
				slider_current = 100 * (v_current - frames[0]) / (frames[-1] - frames[0])
				w.horizontalSlider.setValue(slider_current)
			
			
			frames_offseted = []
			for f in frames:
				frames_offseted.append(f-frames[0])
			
			keys = []
			for k, f in enumerate(frames):
				keys.append(dk_c.getValue(k))
				
				b = QtWidgets.QPushButton(".", w.frame_3)
				
				v = frames_offseted[k]
				if frames_offseted[-1] == 0:
					pos = width / 2
				else:
					pos = v / frames_offseted[-1] * width
				
				#print v_current, f
				if abs(v_current - f) < 0.0001: 
					b.setStyleSheet("background-color:rgb(200, 60, 60);")
				
				b.setGeometry(pos,0,10,8)
				b.setObjectName(source+"_"+str(k))
				b.show()
				b.clicked.connect(partial(self.keyPress, source, b))	


			break


	def addItem(self, data):
		c = data["name"]
		a = data["s_attr"]
		s = c + '.' + a
		
		itemUiFilePath = rootPath+'//ui//connections_stright_widget.ui'
		w = self.loadUiWidget(itemUiFilePath, parent=self.win.connections_listWidget)		

		item = QtWidgets.QListWidgetItem()
		item.setSizeHint(w.sizeHint())
		self.win.connections_listWidget.addItem(item)
		self.win.connections_listWidget.setItemWidget(item, w)		
		
		w.source_label.setText(c)
		w.source_label.setText("%s (%s)" %(c, data["moduleName"] ) )
		w.sourceAttr_label.setText(a)		
		
		
		w.setStyleSheet("#frame_6 { background-color:rgb(50, 50, 50); } ")
		w.line_1.setStyleSheet("background-color:rgb(0, 0, 0);")
		w.line_2.setStyleSheet("background-color:rgb(0, 0, 0);")
		w.frame_7.setStyleSheet("#frame_7 { border:2px solid black; }")
		w.frame_9.setStyleSheet("#frame_9 { border:2px solid black; }")
		w.frame.setStyleSheet("#frame { border:2px solid black; }")
		w.frame_2.setStyleSheet("#frame_2 { background-color:rgb(50, 50, 50); } ")
		w.horizontalSlider.setStyleSheet("#horizontalSlider { background-color:rgb(40, 40, 40); } ")
		w.update_btn.setStyleSheet("background-color:rgb(20, 50, 50);")
		w.createFromPose_btn.setStyleSheet("background-color:rgb(20, 30, 60);")		
		#w.edit_btn.setStyleSheet("background-color:rgb(100, 50, 50);")
		#w.frame.setStyleSheet("#frame { background-color:rgb(50, 50, 50); } ")
		
		# connect signals
		w.delete_btn.clicked.connect(partial(self.deleteItem, s))
		
		# set menues
		#s_attr_menu = QtWidgets.QMenu(self.win)
		#for a in utils.getVisibleAttrs(c):
			#m_action = QtWidgets.QAction(self.win)
			#m_action.setText(a)
			#m_action.triggered.connect(partial(self.setSourceAttr, c, a))
			#s_attr_menu.addAction(m_action)			
		#w.s_chooseAttr_btn.setMenu(s_attr_menu)
		
		#b = QtWidgets.QPushButton(".",w.frame_3)
		#b.setGeometry(0,0,10,8)
		#b.setObjectName(s+"_1")
		#b.show()
		#b.clicked.connect(partial(self.keyPress, b))
		
		#b2 = QtWidgets.QPushButton(".",w.frame_3)
		#width = w.frame_3.size().width()
		#b2.setGeometry(width-10,0,10,8)
		#b2.show()
		#b2.clicked.connect(partial(self.keyPress, b2))
		
		w.addTarget_btn.clicked.connect(partial(self.addTarget, s))
		w.update_btn.clicked.connect(partial(self.setKey, s))
		w.selectCurves_btn.clicked.connect(partial(self.selectCurves, s))
		w.removeKet_btn.clicked.connect(partial(self.deleteKey, s))
		w.horizontalSlider.valueChanged.connect(partial(self.sliderChange, s))
		w.prevKey_btn.clicked.connect(partial(self.nextKey, s, False))
		w.nextKey_btn.clicked.connect(partial(self.nextKey, s, True))
		w.selectSource_btn.clicked.connect(partial(self.selectSource, s))
		w.selectTargets_btn.clicked.connect(partial(self.selectTargets, s))
		w.createFromPose_btn.clicked.connect(partial(self.createFromPose, s))
		
		return w
				
	def deleteItem(self, source):
		self.items.remove(source)
		del self.itemsData[source]
		self.fillList()
		
		sAttr = pm.PyNode(source)
		
		for out in sAttr.outputs():
			if 'unitConversion' in out.type():
				out = out.output.outputs()[0]
			if 'animCurve' in out.type():
				dk = out
				plus = out.output.outputs()[0]
				out = plus.output1D.outputs()[0]
				if 'unitConversion' in out.type():
					out = out.output.outputs()[0]
				if '_connectionPlus_group' in out.name():
					gr = out
					
				pm.delete(dk)
		
				if gr.inputs() == []:
					childs = pm.listRelatives(gr)
					par = pm.listRelatives(gr, p=1)[0]
					pm.parent(childs, par)
					pm.delete(gr)
								
	def createConnection(self):
		sel = cmds.ls(sl=1)
		if len(sel) != 1:
			cmds.warning("Select one control with attribute")
			return
		
		c = sel[0]
		
		channelBox = mel.eval('global string $gChannelBoxName; $temp=$gChannelBoxName;')
		attrs = pm.channelBox(channelBox, q=True, sma=True)
		if not attrs or len(attrs) != 1:
			cmds.warning("Select one control with one attribute")
			return
		
		a = cmds.attributeQuery(attrs[0], node=c, longName=1)
				
		if c+"."+a in self.itemsData:
			cmds.warning("This control and attribute is exists")
			return		
			
		data = {}
		data["name"] = c
		data["moduleName"] = utils.getModuleNameFromAttr(c)
		data["s_attr"] = a
		data["targets"] = []
		data["frames"] = []
		data["widget"] = self.addItem(data)
		
		self.items.append(c+"."+a)
		self.itemsData[c+"."+a] = data
		
	def selectCurves(self, source):
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)		
		
		data = self.itemsData[source]
		w = data['widget']	
		
		curves = []
		for conn in sAttr.outputs():
			if 'unitConversion' in conn.type():
				conn = conn.outputs()[0]
			if 'animCurve' in conn.type():
				curves.append(conn)
				
		pm.select(curves)
		
	def keyPress(self, source, b):
		#print b.layout(), b.objectName()
		#b.setParent(None)	
		
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)	
		
		data = self.itemsData[source]
		w = data['widget']			
		
		id = int(b.objectName().split("_")[-1])
		
		for conn in sAttr.outputs():
			if 'unitConversion' in conn.type():
				conn = conn.outputs()[0]
			if 'animCurve' in conn.type():
				dk_c = conn
				break
		
		frames = pm.keyframe(dk_c, q=True, floatChange=1)
	
		v = 100 * (frames[id] - frames[0]) / (frames[-1] - frames[0])
		w.horizontalSlider.setValue(v)
		sAttr.set(frames[id])
		
		self.updateUi()
		
	def deleteKey(self, source):
		#print b.layout(), b.objectName()
		#b.setParent(None)	
		
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)		
		
		for conn in sAttr.outputs():
			if 'unitConversion' in conn.type():
				conn = conn.outputs()[0]
			if 'animCurve' in conn.type():
				dk_c = conn

				frames = pm.keyframe(dk_c, q=True, floatChange=1)
				f = sAttr.get()
				
				attr = pm.connectionInfo(dk_c.output, destinationFromSource=1)[0].split(".")[-1]
				plus = dk_c.outputs()[0]
				
				# get group
				out = plus.output1D.outputs()[0]
				if 'unitConversion' in out.type():
					out = out.output.outputs()[0]
				if '_connectionPlus_group' in out.name():
					gr = out
					
				# delete key
				pm.cutKey( plus, f=(f,f), attribute=attr, option="keys" )
				
				# if not keys, delete group
				if not pm.objExists(plus):
					childs = pm.listRelatives(gr)
					par = pm.listRelatives(gr, p=1)[0]
					pm.parent(childs, par)
					pm.delete(gr)	
					

				data = self.itemsData[source]
				if pm.objExists(dk_c):
					count = dk_c.numKeys()
					v_min = dk_c.getValue(0)
					v_max = dk_c.getValue(count-1)
					frames = pm.keyframe(dk_c, q=True, floatChange=1)
					data['keys'] = [v_min, v_max]
					data["frames"] = frames
				else:
					data['keys'] = [0,0]
					data["frames"] = []
				self.itemsData[source] = data			
				
		self.updateUi()
		self.updateUi()
		self.updateUi()
		self.updateUi()
		self.updateUi() #second update for fix not disappearing deleted button

		
	def sliderChange(self, source, x):
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)
		
		data = self.itemsData[source]
		w = data['widget']		
		frames = data['frames']
		#print frames
		if frames != []:
			slider_v = w.horizontalSlider.value()
			v = (frames[-1] - frames[0]) / 100 * slider_v + frames[0]
			sAttr.set(v)
		self.updateUi()
		
	def nextKey(self, source, next=True):
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)		
		
		data = self.itemsData[source]
		w = data['widget']	
		
		for conn in sAttr.outputs():
			if 'unitConversion' in conn.type():
				conn = conn.outputs()[0]
			if 'animCurve' in conn.type():
				dk_c = conn

				frames = pm.keyframe(dk_c, q=True, floatChange=1)
				cur = round(sAttr.get(), 6)

				if next:
					for f in frames:
						f = round(f,6)
						#print f, cur, f>cur
						if f > cur:
							v = 100 * (f - frames[0]) / (frames[-1] - frames[0])
							w.horizontalSlider.setValue(v)
							#print frames
							sAttr.set(f)
							break
				else:
					for f in reversed(frames):
						f = round(f,6)
						#print f, cur, f<cur
						if f < cur:
							v = 100 * (f - frames[0]) / (frames[-1] - frames[0])
							w.horizontalSlider.setValue(v)
							sAttr.set(f)
							break
				break

		self.updateUi()		
		
	def selectSource(self, source):
		s_c, s_a = source.split(".")
		pm.select(s_c)
		
	def selectTargets(self, source):
		data = self.itemsData[source]
		targets = []
		for t in data["targets"]:
			targets.append(t.split(".")[0])
		pm.select(targets)
		
	def createFromPose(self, source):
		s_c, s_a = source.split(".")
		sAttr = pm.PyNode(source)		
		data = self.itemsData[source]	
		
		start_c_v = sAttr.get()
		start_t_v = []
		for t in data["targets"]: 
			start_t_v.append(pm.getAttr(t))
		
		for conn in sAttr.outputs():
			if 'unitConversion' in conn.type():
				conn = conn.outputs()[0]
			if 'animCurve' in conn.type():
				dk_c = conn

				frames = pm.keyframe(dk_c, q=True, floatChange=1)
				
				#if len(frames) > 1:
					#cmds.warning("Two many keys already")
					#return
				
				#print frames
				
				attr = pm.connectionInfo(dk_c.output, destinationFromSource=1)[0].split(".")[-1]
				plus = dk_c.outputs()[0]
				
					
				# delete key
				for f in frames:
					pm.cutKey( plus, f=(f,f), attribute=attr, option="keys" )

		sAttr.set(0)
		for t in data["targets"]:
			pm.setAttr(t, 0)
		self.setKey(source)
		
		sAttr.set(start_c_v)
		if start_c_v == 0:
			sAttr.set(1)
		for i, t in enumerate(data["targets"]):
			v = start_t_v[i]
			pm.setAttr(t, v)
		
		self.setKey(source)