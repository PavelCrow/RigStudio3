import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
from functools import partial
import os
import imp
import sys

from .import utils, main, attributes

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))

movedItems = []
drag_widget = ""


def oneStepUndo(func):
	def wrapper(*args, **kwargs):
		cmds.undoInfo(openChunk=True)
		func(*args, **kwargs)
		cmds.undoInfo(closeChunk=True)
	return wrapper

'''
class listWidgetClass(QtWidgets.QListWidget):

	def __init__(self, parent=None, main=None):
		super(listWidgetClass, self).__init__(parent)
		self.setAcceptDrops(True)
		self.setDragDropMode(QtWidgets.QAbstractItemView.DragOnly)
		self.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
		self.name = parent.objectName()
		self.movedItem = None

		font = QtGui.QFont("MsReferenceSansSerif", 11)
		self.setFont(font)	

	def mousePressEvent(self, event):
		global movedItems, drag_widget
		super(listWidgetClass, self).mousePressEvent(event)
		movedItems = self.selectedItems()
		drag_widget = self.name

	def dropEvent(self, event): 
		super(listWidgetClass, self).dropEvent(event)
		parentItem = self.itemAt(event.pos())

		for i in range(self.count()):
			item = self.item(i)

class listWidgetItemClass(QtWidgets.QListWidgetItem):

	def __init__(self, parent=None):
		super(listWidgetItemClass, self).__init__(parent)

	def mousePressEvent(self, event):
		global movedItems, drag_widget
		super(listWidgetItemClass, self).mousePressEvent(event)
		
class AddAttribute(object):
	
	def loadUiWidget(self, uifilename, parent=None):
		loader = QtUiTools.QUiLoader()
		uifile = QtCore.QFile(uifilename)
		
		uifile.open(QtCore.QFile.ReadOnly)
		ui = loader.load(uifile, parent)
		uifile.close()
		
		return ui	

	def __init__(self, parent):
		self.addAttrWin = self.loadUiWidget(rootPath+'//ui//attributes_addAttribute_window.ui', parent=parent)
		
		self.addAttrWin.add_btn.clicked.connect(self.addAttr)
		self.close_btn.clicked.connect(self.closeWin)
		self.addAttrWin.keyable_checkBox.clicked.connect(self.setKeyable)
		self.addAttrWin.visible_checkBox.clicked.connect(self.setVisible)
		self.addAttrWin.int_rbtn.clicked.connect(self.setType)
		self.addAttrWin.float_rbtn.clicked.connect(self.setType)
		self.addAttrWin.enum_rbtn.clicked.connect(self.setType)
		self.addAttrWin.bool_rbtn.clicked.connect(self.setType)
	
		self.listWidget = listWidgetClass(self.addAttrWin.listWidget)
		self.addAttrWin.verticalLayout_3.removeWidget(self.addAttrWin.listWidget)
		self.addAttrWin.listWidget.deleteLater()
		self.addAttrWin.listWidget = None		
		self.addAttrWin.verticalLayout_3.addWidget(self.listWidget)	
		self.listWidget.setDragDropMode(QtWidgets.QAbstractItemView.InternalMove)			
		self.addAttrWin.plus_pushButton.clicked.connect(self.addEnum)
	
		self.addAttrWin.frame.setVisible(0)
		self.addAttrWin.adjustSize()
	
		self.addAttrWin.show()			
		self.addAttrWin.name_lineEdit.setFocus()	
		
	def closeWin(self):
		self.addAttrWin.close()	
		
	def setVisible(self):
		if not self.addAttrWin.visible_checkBox.isChecked():
			self.addAttrWin.keyable_checkBox.setChecked(0)
		
	def setKeyable(self):
		if self.addAttrWin.keyable_checkBox.isChecked():
			self.addAttrWin.visible_checkBox.setChecked(1)
		
	def addEnum(self):

		name, ok = QtWidgets.QInputDialog.getText(self.addAttrWin, "Add Element", "Please enter the name", QtWidgets.QLineEdit.Normal)

		if ok:
			#if cmds.objExists(name+"_mod"):
				#QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
				#return

			if " " in name or "-" in name  or name[0].isdigit():
				QtWidgets.QMessageBox.information(self.win, "Warning", "Wrong Name.")
				return
		else:
			return			
		
		item = QtWidgets.QListWidgetItem(name)
		self.listWidget.addItem(item)
		
	def addAttr(self):
		name = self.addAttrWin.name_lineEdit.text()
		
		keyable = self.addAttrWin.keyable_checkBox.isChecked()
		locked = self.addAttrWin.locked_checkBox.isChecked()			
		visible = self.addAttrWin.visible_checkBox.isChecked()
		
		if self.addAttrWin.int_rbtn.isChecked():
			attr_type = 'short'
		elif self.addAttrWin.float_rbtn.isChecked():
			attr_type = 'float'
		elif self.addAttrWin.enum_rbtn.isChecked():
			attr_type = 'enum'
		elif self.addAttrWin.bool_rbtn.isChecked():
			attr_type = 'bool'		
		#elif self.addAttrWin.string_rbtn.isChecked():
			#attr_type = 'string'
		#elif self.addAttrWin.vector_rbtn.isChecked():
			#attr_type = 'vector'
		
		if attr_type == 'float':
			if self.addAttrWin.defailt_lineEdit.text().isdigit():
				def_v = float(self.addAttrWin.defailt_lineEdit.text())
			if self.addAttrWin.min_lineEdit.text().isdigit():
				min_v = float(self.addAttrWin.min_lineEdit.text())				
			if self.addAttrWin.max_lineEdit.text().isdigit():
				max_v = float(self.addAttrWin.max_lineEdit.text())				
		else:
			if self.addAttrWin.defailt_lineEdit.text().isdigit():
				def_v = int(self.addAttrWin.defailt_lineEdit.text())
			if self.addAttrWin.min_lineEdit.text().isdigit():
				min_v = int(self.addAttrWin.min_lineEdit.text())				
			if self.addAttrWin.max_lineEdit.text().isdigit():
				max_v = int(self.addAttrWin.max_lineEdit.text())				
		
		cmds.addAttr(self.driver, ln=name, at=attr_type)

		if self.addAttrWin.min_lineEdit.text().isdigit():
			cmds.addAttr(self.driver+'.'+name, e=1, min=min_v)
		if self.addAttrWin.max_lineEdit.text().isdigit():
			cmds.addAttr(self.driver+'.'+name, e=1, max=max_v)
		if self.addAttrWin.defailt_lineEdit.text().isdigit():
			cmds.addAttr(self.driver+'.'+name, e=1, dv=def_v)

		cmds.setAttr(self.driver+'.'+name, e=1, cb=visible, keyable=visible)
		cmds.setAttr(self.driver+'.'+name, e=1, keyable=keyable)
		cmds.setAttr(self.driver+'.'+name, e=1, l=locked)
		

		self.addAttribute(name)
		self.addAttrWin.close()
		
	def setType(self):
		self.addAttrWin.frame.setVisible(self.addAttrWin.enum_rbtn.isChecked())
'''

		
class driverItemClass(QtWidgets.QTreeWidgetItem):
	
	def loadUiWidget(self, uifilename, parent=None):
		loader = QtUiTools.QUiLoader()
		uifile = QtCore.QFile(uifilename)
		
		uifile.open(QtCore.QFile.ReadOnly)
		ui = loader.load(uifile, parent)
		uifile.close()
		
		return ui	
		
	def __init__(self, parent):
		super(driverItemClass, self).__init__(parent)
		
		self.driver = None
		self.attr = None
		self.treewidget = parent
		self.attrs = []
		self.hiddens = False
		
		ui_path = rootPath+'//ui//driver_item.ui'
		self.win = self.loadUiWidget(ui_path, parent=parent)
		#self.setIcon(QtGui.QIcon(rootPath+'/ui/icons/module_item_selected2.png'))
		
		self.treewidget.addTopLevelItem(self)
		self.treewidget.setItemWidget(self, 0, self.win)			
		
		self.setSizeHint(0, QtCore.QSize(-1, 30))
		
	def setup(self, dr):
		self.driver = dr
		self.win.label.setText(dr)
		
		self.buildMenu()
		
		if dr.split('_')[0] == 'r':
			self.win.setEnabled(0)			
		
	def buildMenu(self):
		menu = QtWidgets.QMenu(self.win)

		attr_list = cmds.listAttr(self.driver, k=1) or []
		for attr_name in sorted(attr_list):
			m_action = QtWidgets.QAction(self.win)
			name = utils.formatName(attr_name)
			m_action.setText(name)
			m_action.triggered.connect(partial(self.insertSubItem, attr_name))			
			menu.addAction(m_action)
			
		menu.addSeparator()
	
		m_action = QtWidgets.QAction('Add Attribute..', menu)
		m_action.triggered.connect(self.addAttributeWin)
		menu.addAction(m_action)		

		m_action = QtWidgets.QAction('Hiddens', menu, checkable=True)
		m_action.setChecked(self.hiddens)
		m_action.triggered.connect(partial(self.setHiddens, m_action))
		menu.addAction(m_action)

		menu.addSeparator()
		
		if self.hiddens:
			all_attr_list = cmds.listAttr(self.driver)
			for attr_name in sorted(all_attr_list):
				if attr_name in attr_list:
					continue
				if '.' in attr_name:
					continue				
				t = cmds.attributeQuery( attr_name, node=self.driver, attributeType=True )
				if '3' in t:
					continue
				if t in ['message', 'compound', 'generic', 'typed', 'long', 'short']:
					continue
				m_action = QtWidgets.QAction(self.win)
				name = utils.formatName(attr_name)
				m_action.setText(name)
				m_action.triggered.connect(partial(self.insertSubItem, attr_name))			
				menu.addAction(m_action)
		
		self.win.btn.setMenu(menu)

		#menu.setStyleSheet("QMenu { menu-scrollable: 1; }")
		#menu.setMaximumHeight(155)
		#menu.popup(QtCore.QPoint(posX, posY))
		#menu.move(posX, posY)
		
		#menu.show()
			
	def setHiddens(self, a):
		self.hiddens = a.isChecked()
		
		#for i in range(self.treewidget.topLevelItemCount()):
			#item = self.treewidget.topLevelItem(i)
			#item.hiddens = self.hiddens
				
		self.buildMenu()
			
	def insertSubItem(self, name):
		if name in self.attrs:
			return
		
		item = QtWidgets.QTreeWidgetItem([name])
		self.addChild(item)
		
		self.attrs.append(name)
			
	def addAttributeWin(self):
		try:
			self.addAttr.addAttrWin.close()
		except: pass
		
		self.addAttr = attributes.AddAttribute(self)
		
	def addAttribute(self, name):
		item = QtWidgets.QTreeWidgetItem([name])
		self.addChild(item)
		
		self.attrs.append(name)

class Driver(object):
	def loadUiWidget(self, uifilename, parent=None):
		loader = QtUiTools.QUiLoader()
		uifile = QtCore.QFile(uifilename)
		
		uifile.open(QtCore.QFile.ReadOnly)
		ui = loader.load(uifile, parent)
		uifile.close()

		return ui	
	
	def __init__(self, win):
		self.main = win
		self.win = self.main.driverWin

		self.driver = None
		self.attr = ""
		self.keys = []
		self.drivens = {}
		
		self.custom_item = rootPath+'//ui//driver_item.ui'
		
		self.connect()
		self.updateList()

		#self.win.driver_addTarget_btn.setIconSize(QtCore.QSize(30, 30))	
		#self.win.driver_addTarget_btn.setIcon(QtGui.QIcon(rootPath+'/ui/icons/os_target_plus.png'))	
		#self.win.driver_removeTarget_btn.setIconSize(QtCore.QSize(30, 30))	
		#self.win.driver_removeTarget_btn.setIcon(QtGui.QIcon(rootPath+'/ui/icons/os_target_minus.png'))		

	def connect(self):
		self.win.driver_addDriver_btn.clicked.connect(self.addDriver)
		self.win.driver_removeDriver_btn.clicked.connect(self.removeDriver)		
		self.win.driver_addTarget_btn.clicked.connect(self.addTarget)		
		self.win.driver_removeTarget_btn.clicked.connect(self.removeTarget)		
		self.win.driver_addKey_btn.clicked.connect(self.addKey)		
		self.win.driver_removeKey_btn.clicked.connect(self.removeKey)		
		self.win.driver_selectAll_btn.clicked.connect(self.selectAllDrivens)		
		self.win.driver_deleteAttribute_btn.clicked.connect(self.removeDriver)		
		
		self.win.drivers_treeWidget.currentItemChanged.connect(self.updateDrivensPage)
		self.win.drivers_treeWidget.itemClicked.connect(self.updateDrivensPage)
		self.win.driver_targets_listWidget.currentItemChanged.connect(self.selectDriven)
		self.win.driver_targets_listWidget.itemClicked.connect(self.selectDriven)

	def addDriverItem(self, dr):#, attr):
		item = driverItemClass(self.win.drivers_treeWidget)
		item.setup(dr)#, attr)
		
		self.win.drivers_treeWidget.expandAll()
		
		return item
	
	def selectItem(self, name):
		item = self.getDriverItem(name)
		self.win.drivers_treeWidget.setCurrentItem(item)
	
	def addDriver(self):
		sel = cmds.ls(sl=1)
		if len(sel) != 1:
			cmds.warning("Select one driver control with attribute")
			return

		#channelBox = mel.eval('global string $gChannelBoxName; $temp=$gChannelBoxName;')
		#attrs = cmds.channelBox(channelBox, q=True, sma=True) or []
		
		#if len(attrs) != 1:
			#cmds.warning("Select one attribute in chennelbox")
			#return		
		
		for i in range(self.win.drivers_treeWidget.topLevelItemCount()):
			item = self.win.drivers_treeWidget.topLevelItem(i)
			item_name = item.win.label.text()
			if item_name == sel[0]:
				cmds.warning("This object already in the drivers list")
				return
			
		self.driver = sel[0]

		#self.attr = attrs[0]
		#item_name = self.driver+" ("+self.attr+")"
		
		#transform_list = ['translate', 'rotate', 'scale', 'translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ', 'scaleX', 'scaleY', 'scaleZ']
		

		# add item
		self.addDriverItem(self.driver)#, self.attr)
		
		opp_driver = utils.getOppositeObject(self.driver)
		if cmds.objExists(opp_driver) and self.driver != opp_driver:
			self.addDriverItem(opp_driver)#, self.attr)

		# select current parent object item
		self.selectItem(self.driver)

	def addTarget(self):
		sel = cmds.ls(sl=1)
		
		if len(sel) == 0:
			return

		name = self.driver+'__'+self.attr
		if name not in self.drivens:
			self.drivens[name] = sel
		else:
			for o in sel:
				if o not in self.drivens[name]:
					self.drivens[name].append(o)
			
		self.updateDrivensPage()
		
		cmds.select(sel)

	def removeTarget(self):
		cur_items = self.win.driver_targets_listWidget.selectedItems()

		if not cur_items:
			return
		
		name = self.driver+'__'+self.attr
		
		for item in cur_items:
			self.drivens[name].remove(item.text())
			
		self.updateDrivensPage()
	
	@oneStepUndo
	def addKey(self):

		if not self.attr or not self.targets:
			return

		sel = cmds.ls(sl=1)
		
		transform_list = ['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ', 'scaleX', 'scaleY', 'scaleZ']

		for t in self.targets:
			dn_a_list = cmds.listAttr(t, k=1) or []
			gr = "%s__%s__%s__drivenGroup"% (self.driver, self.attr, t)

			if not cmds.objExists(gr):
				
				# check zero channels
				for target in self.targets:
					for a in transform_list[:-3]:
						if a in dn_a_list:
							if round(cmds.getAttr(target+'.'+a), 5) != 0:
								cmds.warning("Selecter driven object has not zero transform values")
								return
					for a in transform_list[6:]:
						if a in dn_a_list:
							if round(cmds.getAttr(target+'.'+a), 5) != 1:
								cmds.warning("Selecter driven object has not zero transform values")
								return				
				
				cmds.group(n=gr, empty=1)
				cmds.parent(gr, t)
				cmds.setAttr(gr+'.t', 0,0,0 )
				cmds.setAttr(gr+'.r', 0,0,0 )
				cmds.setAttr(gr+'.s', 1,1,1 )
				p = cmds.listRelatives(t, p=1)
				
				if p:
					cmds.parent(gr, p[0])
				else:
					cmds.parent(gr, w=1)
				cmds.parent(t, gr)

				for a in dn_a_list:
					if a in transform_list:
						cmds.setDrivenKeyframe(gr+'.'+a, currentDriver=self.driver+'.'+self.attr)

			else:
				m = cmds.xform(t, q=1, m=1, ws=1)
				cmds.xform(gr, m=m, ws=1)		
				
				for a in ['.tx', '.ty', '.tz', '.rx', '.ry', '.rz']:
					try:
						cmds.setAttr(t+a, 0 )
					except: pass
				for a in ['.sx', '.sy', '.sz']:
					try:
						cmds.setAttr(t+a, 1 )
					except: pass
				
				for a in dn_a_list:
					if a in transform_list:
						cmds.setDrivenKeyframe(gr+'.'+a, currentDriver=self.driver+'.'+self.attr)

		cur_v = cmds.getAttr(self.driver+'.'+self.attr)

		# update keys
		if cur_v not in self.keys:	
			self.keys.append(cur_v)
			self.keys = sorted(self.keys)
			self.updateKeybar()
			
		# Mirror
		opp = utils.getOppositeObject(self.driver+"."+self.attr)
		if cmds.objExists(opp) and opp != self.driver+"."+self.attr:
			for t in self.targets:
				if not cmds.objExists(utils.getOppositeObject(t)):
					return
			
			# update driver
			driver = utils.getOppositeObject(self.driver)
			v = cmds.getAttr(self.driver+'.'+self.attr)
			cmds.setAttr(driver+'.'+self.attr, v)
					
			for t in self.targets:
				# rotate controls
				for a in transform_list:
					p = cmds.listRelatives(t, p=1)[0]
					v = cmds.getAttr(p+'.'+a)
					try:
						cmds.setAttr(utils.getOppositeObject(t)+'.'+a, v)
					except: 
						print ('Cannot set attribute', utils.getOppositeObject(t)+'.'+a)

				t = utils.getOppositeObject(t)
				dn_a_list = cmds.listAttr(t, k=1) or []
				gr = "%s__%s__%s__drivenGroup"% (driver, self.attr, t)
				
				if not cmds.objExists(gr):
					cmds.group(n=gr, empty=1)
					cmds.parent(gr, t)
					cmds.setAttr(gr+'.t', 0,0,0 )
					cmds.setAttr(gr+'.r', 0,0,0 )
					cmds.setAttr(gr+'.s', 1,1,1 )
					p = cmds.listRelatives(t, p=1)
					if p:
						cmds.parent(gr, p[0])
					else:
						cmds.parent(gr, w=1)
					cmds.parent(t, gr)
	
					for a in dn_a_list:
						if a in transform_list:
							cmds.setDrivenKeyframe(gr+'.'+a, currentDriver=driver+'.'+self.attr)
	
				else:
					m = cmds.xform(t, q=1, m=1, ws=1)
					#print t, m
					#return
					cmds.xform(gr, m=m, ws=1)		
					
					for a in ['.tx', '.ty', '.tz', '.rx', '.ry', '.rz']:
						try:
							cmds.setAttr(t+a, 0 )
						except: pass
					for a in ['.sx', '.sy', '.sz']:
						try:
							cmds.setAttr(t+a, 1 )
						except: pass					
					
					for a in dn_a_list:
						if a in transform_list:
							cmds.setDrivenKeyframe(gr+'.'+a, currentDriver=driver+'.'+self.attr)			
					
		cmds.select(sel)
	
	def updateKeybar(self):
		for i in reversed(range(self.win.horizontalLayout_56.count())): 
			if 0 < i < self.win.horizontalLayout_56.count()-1:
				self.win.horizontalLayout_56.itemAt(i).widget().deleteLater()		
		
		for i,k in enumerate(self.keys):
			#w = self.loadUiWidget(rootPath+'//ui//driverKeyWindow.ui')
			b = QtWidgets.QPushButton(str(round(k, 3)))
			b.clicked.connect(partial(self.goToKey, k))
			#b.setMaximumWidth(40)
			b.setMinimumHeight(40)		

			self.win.horizontalLayout_56.insertWidget(i+1, b)
	
	@oneStepUndo
	def removeKey(self):
		cur_v = cmds.getAttr(self.driver+"."+self.attr)
		
		num = None
		for i,k in enumerate(self.keys):
			if k == cur_v:
				num = i		
				self.keys.remove(k)
				for t in self.targets:
					gr = "%s__%s__%s__drivenGroup"% (self.driver, self.attr, t)
					cmds.cutKey(gr, index=(num,num))
					
					# Mirror
					opp_gr = "%s__%s__%s__drivenGroup"% (utils.getOppositeObject(self.driver), self.attr, utils.getOppositeObject(t))
					if cmds.objExists(opp_gr) and opp_gr != gr:
						cmds.cutKey(opp_gr, index=(num,num))						
						
				self.updateKeybar()

	@oneStepUndo
	def removeDriver(self):
		dr = self.driver
		attr = self.attr
		#dr = self.win.drivers_treeWidget.currentItem().text().split(" ")[0]
		#attr = self.win.drivers_treeWidget.currentItem().text().split(" (")[1][:-1]

		transform_list = ['translate', 'rotate', 'scale', 'translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ', 'scaleX', 'scaleY', 'scaleZ']

		dns = []
		opp_dns = []
		for dn in pm.ls("*drivenGroup"):
			if dr+"__"+attr in dn.name():
				dns.append(dn)
				opp_dn = utils.getOppositeObject(dn).replace("_l_","_r_")
				if cmds.objExists(opp_dn) and opp_dn != dn:
					opp_dns.append(opp_dn)

		for dn in dns:
			child = pm.listRelatives(dn)[0]
			p = pm.listRelatives(dn, p=1)
			if p:
				pm.parent(child, p[0])
			else:
				pm.parent(child, w=1)
				
			dn_a_list = pm.listAttr(child, k=1) or []
			for a in dn_a_list:
				if a in transform_list:
					if 'scale' in a:
						pm.setAttr(child+'.'+a, 1)
					else:
						pm.setAttr(child+'.'+a, 0)
			pm.delete(dn)
			
		# Mirror
		for dn in opp_dns:
			child = pm.listRelatives(dn)[0]
			p = pm.listRelatives(dn, p=1)
			if p:
				pm.parent(child, p[0])
			else:
				pm.parent(child, w=1)
				
			dn_a_list = pm.listAttr(child, k=1) or []
			for a in dn_a_list:
				if a in transform_list:
					if 'scale' in a:
						pm.setAttr(child+'.'+a, 1)
					else:
						pm.setAttr(child+'.'+a, 0)
			pm.delete(dn)
		
		try:
			del self.drivens[self.driver+'__'+self.attr]
		except: pass
			
		# remove item
		root = self.win.drivers_treeWidget.invisibleRootItem()
		for item in self.win.drivers_treeWidget.selectedItems():
			(item.parent() or root).removeChild(item)		
			
	def goToKey(self, v):
		cmds.setAttr(self.driver+'.'+self.attr, v)
		
		opp_driver = utils.getOppositeObject(self.driver)
		if cmds.objExists(opp_driver) and opp_driver != self.driver:
			cmds.setAttr(opp_driver+'.'+self.attr, v)
		
	def readScene(self):
		self.drivens = {}
		
		drivers = []
		for d in cmds.ls("*drivenGroup"):
			dr, attr, dn, n = d.split("__")
			
			if dr not in drivers:
				drivers.append(dr)
				
			if dr+'__'+attr not in self.drivens:
				self.drivens[dr+'__'+attr] = [dn]
			else:
				self.drivens[dr+'__'+attr].append(dn)
				
	def readKeys(self):
		self.keys = []
		dr_node = pm.PyNode(self.driver)
		nodes = []
		for n in dr_node.attr(self.attr).outputs():
			if cmds.objectType(n.name()) == 'unitConversion':
				n = n.output.outputs()[0]
			if cmds.objectType(n.name())[:-1] == 'animCurveU':
				dn = n.output.outputs()[0]
				if dn.split("__")[-1] == 'drivenGroup':
					nodes.append(n)
		
		if not nodes:
			return

		frames = nodes[0].numKeyframes()
		
		for c in nodes:
			if c.numKeyframes() != frames:
				cmds.warning("Keycount is different")
		
		for i in range(frames):
			try:
				self.keys.append(c.getUnitlessInput(i))
			except: pass
						
	def getDrivens(self, dr, attr):
		for d in self.drivens:
			if d == dr+'__'+attr:
				return self.drivens[d]		
		return []
				
	def getDriverItem(self, name):
		for i in range(self.win.drivers_treeWidget.topLevelItemCount()):
			item = self.win.drivers_treeWidget.topLevelItem(i)
			item_name = item.win.label.text()		
			if item_name == name:
				return item
		return None
				
	def updateList(self):
		self.readScene()
		
		self.win.drivers_treeWidget.clear()
		
		drivers = []
		for d in sorted(self.drivens):
			dr, attr = d.split("__")
			
			if dr not in drivers:
				drivers.append(dr)
				item = self.addDriverItem(dr)
			else:
				item = self.getDriverItem(dr)
			
			item.insertSubItem(attr)
			
		self.updateDrivensPage()
		
		self.win.drivers_treeWidget.expandAll()
		
	def updateDrivensPage(self):
		cur_item = self.win.drivers_treeWidget.currentItem()

		if self.win.drivers_treeWidget.indexOfTopLevelItem(cur_item) > -1:
			self.win.frame_36.setEnabled(0)
			cmds.select(self.driver)
			return
		
		self.win.driver_targets_listWidget.clear()
		
		self.keys = []
		self.driver = None
		self.attr = None	
		self.targets = []		
		
		

		if cur_item:
			parent = cur_item.parent()
			self.driver = parent.win.label.text()
			self.attr = cur_item.text(0)

			drivens = self.getDrivens(self.driver, self.attr)

			for o in drivens:
				self.targets.append(o)
				item = QtWidgets.QListWidgetItem(o)
				item.setFlags(QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled)	
				self.win.driver_targets_listWidget.addItem(item)		
			
			self.readKeys()
			
			self.win.frame_36.setEnabled(1)
			if self.driver.split('_')[0] == 'r':
				self.win.frame_36.setEnabled(0)
				
		else:
			self.win.frame_36.setEnabled(0)

		self.updateKeybar()

	def selectDriven(self):
		cur_items = self.win.driver_targets_listWidget.selectedItems()
		
		objs = []
		for item in cur_items:
			name = item.text()
			objs.append(name)
		cmds.select(objs)
		
	def selectAllDrivens(self):
		
		for i in range(self.win.driver_targets_listWidget.count()):
			self.win.driver_targets_listWidget.item(i).setSelected(1)
		
		cmds.select(self.targets)