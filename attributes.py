import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import logging, traceback, os, imp, math, json, sys

from .import utils, main

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))

movedItems = []
oldParent = None
drag_widget = ""

class treeWidgetClass(QtWidgets.QTreeWidget):

	def __init__(self, parent=None, main=None):
		super(treeWidgetClass, self).__init__(parent)
		self.main = main
		self.setAcceptDrops(True)
		self.name = parent.objectName()
		
		font = QtGui.QFont("MsReferenceSansSerif", 11)
		self.setFont(font)	

	def dropEvent(self, event): 
		parentItem = self.itemAt(event.pos())
		newSet_name = controlSetName(parentItem)
		currentSet_name = controlSetName(self.currentItem())
		newSet_controls = getSetControlsNoRecurcive(newSet_name)
		
		# stop if item dropped on self
		if movedItems[0] is parentItem:
			return		

		# move set
		if drag_widget == 'sets_treeWidget':
			#print movedItems
			if movedItems[0].text(0) == 'controlSet':
				return				
			set_child = controlSetName(movedItems[0])
			set_oldParent = controlSetName(oldParent)
			
			if oldParent is parentItem:
				return
			
			moved_set_name = controlSetName( movedItems[0] )
			if newSet_name in utils.getSetsInSet( moved_set_name ):
				return
			
			cmds.sets(set_child, e=1, add=newSet_name)		
			cmds.sets(set_child, e=1, rm=set_oldParent)
			
			currentSet_name = controlSetName(movedItems[0])
			
		# move current control set controls
		elif drag_widget == 'curSet_controls_listWidget':
			for i in movedItems:
				
				control = i.text()
				if control not in newSet_controls:
					cmds.sets(control, e=1, add=newSet_name)		
					cmds.sets(control, e=1, rm=currentSet_name)	
					
				if utils.objectIsSymmetrical(control):
					opp_control = utils.getOpposite(control)		
					opp_newSet_name = utils.getOpposite(newSet_name)	
					opp_newSet_controls = getSetControlsNoRecurcive(opp_newSet_name)
					opp_currentSet_name = utils.getOpposite(currentSet_name)	
					if opp_control not in opp_newSet_controls:
						cmds.sets(opp_control, e=1, add=opp_newSet_name)		
						cmds.sets(opp_control, e=1, rm=opp_currentSet_name)						

		# update treewidget
		super(treeWidgetClass, self).dropEvent(event)		
		self.updateControlSetTree()
		
		# select current set item
		try:
			currentSet_item = self.findItems(itemName(currentSet_name), QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
			self.setCurrentItem(currentSet_item)
		except: pass
				
	def mousePressEvent(self, event):
		global movedItems, oldParent, drag_widget
		super(treeWidgetClass, self).mousePressEvent(event)
		movedItems = [self.currentItem()]
		oldParent = self.currentItem().parent()
		drag_widget = self.name
		
	def updateControlSetTree(self):
		# save expand data
		old_data = {}
		if self.topLevelItemCount() > 0:
			def getChilds(item):
				childs = []
				for i in range(item.childCount()):
					child = item.child(i)
					childs.append(child)
					childs += getChilds(child)
				return childs
				
			root_item = self.topLevelItem(0)
			child_items = getChilds(root_item)
			for ch in child_items:
				#print ch.text(0), ch.isExpanded()
				name = ch.text(0).split(" ")[0]
				old_data[name] = ch.isExpanded()
		
		#for d in old_data:
			#if d == "brows":
				#print d, old_data[d]
			
		self.sets_list = []
		items = {}
		sets_parents = {}
		self.clear()
		
		if not cmds.objExists('controlSet'):
			return 		

		# get all nodes under controlSet
		sets = self.getSetObjects('controlSet')
		sets.append('controlSet')
		
		# get pairs [set:parent]
		for s in sets:
			objects = cmds.sets(s, q=1) or []
			for o in objects:
				if cmds.objectType(o) == 'objectSet':
					sets_parents[o] = s
		
		# add root item
		root_item = QtWidgets.QTreeWidgetItem(["controlSet"])
		self.addTopLevelItem(root_item)
		items['controlSet'] = root_item

		# create sets items
		for name in sets_parents:
			#print name, sets_parents[name]
			item = QtWidgets.QTreeWidgetItem([itemName(name)])
			items[name] = item
			if utils.objectIsOpposite(name):
				item.setForeground(0,QtGui.QBrush(QtGui.QColor("#6C6B6B")))	
		
		# add item to tree
		for name in sorted(sets_parents):
			item = items[name]
			parent_name = sets_parents[name]
			parent = items[parent_name]
			parent.addChild(item)
			# restore expanding
		
		root_item.setExpanded(True)
		for name in sorted(sets_parents):	
			item = items[name]
			if name.split("_controlSet")[0] in old_data:
				exp = old_data[name.split("_controlSet")[0]]
				item.setExpanded(exp)
			else:
				item.setExpanded(True)
			
			#print name, item.isExpanded()
			
		self.setCurrentItem(root_item)
	
	def getSetObjects(self, set):
		
		if not cmds.objExists(set):
			return []
		
		objects = cmds.sets(set, q=1) or []
		for o in objects:
			if cmds.objectType(o) == 'objectSet':
				innerObjects = self.getSetObjects(o)
				if o not in self.sets_list:
					self.sets_list.append(o)
		return self.sets_list

	def addSet(self, set_name):
		cmds.select(clear=1)
		cmds.sets(n=set_name)
		cmds.setAttr(set_name+".annotation", "gControlSet", type="string")
		cmds.sets(set_name, e=1, add=self.getCurrentControlSet())
		
		# add opposide set
		if set_name.split("_")[0] == "l":
			opp_set = utils.getOpposite(set_name)
			cmds.sets(n=opp_set)
			cmds.setAttr(opp_set+".annotation", "gControlSet", type="string")
			
			par = self.getCurrentControlSet()
			if par.split("_")[0] == "l": 
				par = utils.getOpposite(par)
			cmds.sets(opp_set, e=1, add=par)			
			
		# update tree
		self.updateControlSetTree()
		
		#print "1", set_name, self.itemName(set_name)
		newItem_name = itemName(set_name)
		#print newItem_name
		item = self.findItems(newItem_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
		self.setCurrentItem(item)		
		
	def getCurrentControlSet(self):
		cur_item = self.currentItem()

		if cur_item.text(0) == 'controlSet':
			currentControlSet = 'controlSet'
		else:
			currentControlSet = controlSetName(cur_item)

		return currentControlSet	

class listWidgetClass(QtWidgets.QListWidget):

	def __init__(self, parent=None, main=None):
		super(listWidgetClass, self).__init__(parent)
		self.setAcceptDrops(True)
		self.setDragDropMode(QtWidgets.QAbstractItemView.DragOnly)
		self.setSelectionMode(QtWidgets.QAbstractItemView.ExtendedSelection)
		self.name = parent.objectName()
		self.movedItem = None
		
		self.items_names = []
		
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
		
		transform_attrs = ['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ', 'scaleX', 'scaleY', 'scaleZ', 'visibility']
		
		old_names = self.items_names
		self.items_names = []
		
		for i in range(self.count()):
			item = self.item(i)
			if item.text() == '':
				continue
			if item.text() not in transform_attrs:
				self.items_names.append(item.text())
			
		#print 1, old_names
		#print 2, self.items_names
		
		o = cmds.ls(sl=1)[0]
		
		for i in range(len(self.items_names)):
			a_old = old_names[i]
			a_new = self.items_names[i]
			if a_old != a_new:
				#print 3, a_old, a_new
				cmds.deleteAttr(o+'.'+a_old)
				cmds.undo()
			

class listWidgetItemClass(QtWidgets.QListWidgetItem):

	def __init__(self, parent=None):
		super(listWidgetItemClass, self).__init__(parent)
		
	def mousePressEvent(self, event):
		global movedItems, drag_widget
		super(listWidgetItemClass, self).mousePressEvent(event)


def itemName(set_name):
	#print "InName", set_name
	def getSetChildsCount(set):
		count = 0
		if type(cmds.sets(set, q=1)).__name__ == "NoneType":
			return 0
		for o in cmds.sets(set, q=1):
			if cmds.objectType(o) != 'objectSet':
				count += 1
		return count	

	item_name = set_name.split('_controlSet')[0]+'   '+str(getSetChildsCount(set_name))
	#print "outName", item_name
	return item_name

def controlSetName(item):
	if item.text(0) == 'controlSet':
		return 'controlSet'
	else:
		return item.text(0).split('   ')[0] + '_controlSet'	

def getSetControlsNoRecurcive(set):
	objects = []
	if type(cmds.sets(set, q=1)).__name__ == "NoneType":
		return []
	for o in cmds.sets(set, q=1):
		if cmds.objectType(o) != 'objectSet':
			objects.append(o)
	return objects



class Attributes(object):
	
	def loadUiWidget(self, uifilename, parent=None):
		loader = QtUiTools.QUiLoader()
		uifile = QtCore.QFile(uifilename)

		uifile.open(QtCore.QFile.ReadOnly)
		ui = loader.load(uifile, parent)
		uifile.close()

		return ui	
	
	def __init__(self, main):
		self.main = main
		self.win = self.loadUiWidget(rootPath+'//ui//attributesWindow.ui', parent=main.win)

		self.listWidget = listWidgetClass(self.win.listWidget)
		self.win.verticalLayout_44.removeWidget(self.win.listWidget)
		self.win.listWidget.deleteLater()
		self.win.listWidget = None		
		self.win.verticalLayout_44.addWidget(self.listWidget)	
		self.listWidget.setDragDropMode(QtWidgets.QAbstractItemView.InternalMove)	

		self.objects = []
		self.attributes = []

		self.connect()
		self.updateObjects()
		
		self.win.show()

	def connect(self):
		self.listWidget.currentItemChanged.connect(self.reorder)
		self.win.update_btn.clicked.connect(self.updateObjects)

	def updateObjects(self):
		self.objects = cmds.ls(sl=1) 
		
		self.listWidget.clear()
		
		#if len(self.objects) == 0:
			#self.win.objects_lineEdit.setText("")
		#elif len(self.objects) == 1:
			#self.win.objects_lineEdit.setText(self.objects[0])
		#else:
			#self.win.objects_lineEdit.setText("Mult..")
		
		transform_attrs = ['translateX', 'translateY', 'translateZ', 'rotateX', 'rotateY', 'rotateZ', 'scaleX', 'scaleY', 'scaleZ', 'visibility']
		
		visible_attrs_all = []
		unvisible_attrs_all = []
		
		for o in self.objects:
			# get channelBox attrs list
			transform_list = []
			if cmds.objectType(o) == "transform":
				transform_list = transform_attrs
			user = cmds.listAttr(o, ud=1)	or []
			locked = cmds.listAttr(o, l=1) or []
			unkeyable =  cmds.listAttr(o, cb=1) or []
			keyable = cmds.listAttr(o, k=1) or []
			visible = keyable + unkeyable


			vis_transform_list = []
			for a in transform_list:
				if a in visible:
					vis_transform_list.append(a)
			visible_sorted = vis_transform_list + keyable + unkeyable
			
			for a in visible_sorted:
				if a not in visible_attrs_all:
					visible_attrs_all.append(a)
					
					
			all_attrs = locked + visible + user
			unvisible = []
			for a in all_attrs:
				if a not in visible:
					unvisible.append(a)		
					
			for a in unvisible:
				if a not in unvisible_attrs_all:
					unvisible_attrs_all.append(a)			
		
		
		#self.custom_item = rootPath+'//ui//attributes_listWidgetItem_window.ui'
		#w = self.main.loadUiWidget(self.custom_item, parent=self.win)
		#item_ = QtWidgets.QListWidgetItem(self.listWidget)
		#self.listWidget.addItem(item_)
		#self.listWidget.setItemWidget(item_, w)		

		# visible 
		for a in visible_attrs_all:
			item = listWidgetItemClass(a)
			self.listWidget.addItem(item)	
			
		# separator
		sep = QtWidgets.QFrame(self.listWidget)
		sep.setGeometry(QtCore.QRect(320, 150, 118, 3))
		sep.setFrameShape(QtWidgets.QFrame.HLine)
		sep.setFrameShadow(QtWidgets.QFrame.Sunken)			
		sep_item = QtWidgets.QListWidgetItem(self.listWidget)
		self.listWidget.addItem(sep_item)
		self.listWidget.setItemWidget(sep_item, sep)
		
		# hidden
		for a in unvisible_attrs_all:
			item = listWidgetItemClass(a)
			self.listWidget.addItem(item)			
		
		self.listWidget.items_names = []
		for a in visible_attrs_all:
			if a not in transform_attrs:
				self.listWidget.items_names.append(a)
	
	def reorder(self):
		pass
	

class AddAttribute(object):

	def loadUiWidget(self, uifilename, parent=None):
		loader = QtUiTools.QUiLoader()
		uifile = QtCore.QFile(uifilename)

		uifile.open(QtCore.QFile.ReadOnly)
		ui = loader.load(uifile, parent)
		uifile.close()

		return ui	

	def __init__(self, main, obj=None):
		
		self.main = main
		
		if not obj:
			self.obj = cmds.ls(sl=1)[0]
		else:
			self.obj = None
		
		self.addAttrWin = self.loadUiWidget(rootPath+'//ui//attributes_addAttribute_window.ui', parent=main.win)

		self.addAttrWin.add_btn.clicked.connect(self.addAttr)
		self.addAttrWin.close_btn.clicked.connect(self.closeWin)
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

		self.listWidget.itemDoubleClicked.connect(self.editItem)

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
		

		def add(obj):
			cmds.addAttr(obj, ln=name, at=attr_type)
	
			if self.addAttrWin.min_lineEdit.text().isdigit():
				cmds.addAttr(obj+'.'+name, e=1, min=min_v)
			if self.addAttrWin.max_lineEdit.text().isdigit():
				cmds.addAttr(obj+'.'+name, e=1, max=max_v)
			if self.addAttrWin.defailt_lineEdit.text().isdigit():
				cmds.addAttr(obj+'.'+name, e=1, dv=def_v)
	
			cmds.setAttr(obj+'.'+name, e=1, cb=visible, keyable=visible)
			cmds.setAttr(obj+'.'+name, e=1, keyable=keyable)
			cmds.setAttr(obj+'.'+name, e=1, l=locked)
			
		add(self.obj)
		if cmds.objExists(utils.getOpposite(self.obj)):
			add(utils.getOpposite(self.obj))

		try:
			self.main.addAttribute(name)
			self.addAttrWin.close()
		except: pass

	def setType(self):
		self.addAttrWin.frame.setVisible(self.addAttrWin.enum_rbtn.isChecked())
		
	def editItem(self):
		item = self.listWidget.currentItem()
		
		name, ok = QtWidgets.QInputDialog.getText(self.addAttrWin, "Edit Element", "Please enter the name", QtWidgets.QLineEdit.Normal, item.text())

		if ok:
			#if cmds.objExists(name+"_mod"):
				#QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
				#return

			if " " in name or "-" in name  or name[0].isdigit():
				QtWidgets.QMessageBox.information(self.win, "Warning", "Wrong Name.")
				return
		else:
			return			

		item.setText(name)