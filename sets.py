import maya.cmds as cmds
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import logging, traceback, os, imp, math, json, sys

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

movedItems = []
oldParent = None
drag_widget = ""

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

class treeWidgetClass(QtWidgets.QTreeWidget):

	def __init__(self, parent=None, main=None):
		super(treeWidgetClass, self).__init__(parent)
		self.main = main
		self.setAcceptDrops(True)
		self.name = parent.objectName()
		self.items = {}

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
			
			# move opposite set
			if cmds.objExists("r" + set_child[1:]):
				opp_set_child = "r" + set_child[1:]
				opp_newSet_name = utils.getOppositeObject(newSet_name)
				set_oldParent = utils.getOppositeObject(set_oldParent)
								
				cmds.sets(opp_set_child, e=1, add=opp_newSet_name)		
				cmds.sets(opp_set_child, e=1, rm=set_oldParent)				

			currentSet_name = controlSetName(movedItems[0])

		# move current control set controls
		elif drag_widget == 'curSet_controls_listWidget':
			for i in movedItems:

				control = i.text()
				if control not in newSet_controls:
					cmds.sets(control, e=1, add=newSet_name)		
					cmds.sets(control, e=1, rm=currentSet_name)	

				if utils.objectIsSymmetrical(control):
					opp_control = utils.getOppositeObject(control)		
					opp_newSet_name = utils.getOppositeObject(newSet_name)	
					opp_newSet_controls = getSetControlsNoRecurcive(opp_newSet_name)
					opp_currentSet_name = utils.getOppositeObject(currentSet_name)	
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
			#print name, name.split("_")[0] == "r" , "l"+name[1:] in sets
			if name.split("_")[0] == "r" and "l"+name[1:] in sets:
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
			
		self.items = items

		self.setCurrentItem(root_item)

		debugEnd(traceback.extract_stack()[-1][2])	

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
			opp_set = utils.getOppositeObject(set_name)
			cmds.sets(n=opp_set)
			cmds.setAttr(opp_set+".annotation", "gControlSet", type="string")

			par = self.getCurrentControlSet()
			if par.split("_")[0] == "l": 
				par = utils.getOppositeObject(par)
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

	def selectItem(self, name):
		i = None
		for n in self.items:
			#print n , name, n == name
			if n == name:
				i = self.items[n]

		self.setCurrentItem(i)

class listWidgetClass(QtWidgets.QListWidget):

	def __init__(self, parent=None):
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


def itemName(set_name):
	debugStart(traceback.extract_stack()[-1][2])
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
	debugStart(traceback.extract_stack()[-1][2])

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

class Sets(object):
	def __init__(self, win):
		debugStart(traceback.extract_stack()[-1][2])
		self.win = win
		self.modules = []
		self.moduleNames = []
		self.moduleSets = []

		self.treeWidget = treeWidgetClass(self.win.sets_treeWidget, self)
		self.treeWidget.setDragDropMode(QtWidgets.QAbstractItemView.DragDrop)
		self.win.verticalLayout_64.removeWidget(self.win.sets_treeWidget)
		self.win.sets_treeWidget.deleteLater()
		self.win.sets_treeWidget = None		
		self.win.verticalLayout_64.addWidget(self.treeWidget)

		self.listWidget = listWidgetClass(self.win.curSet_controls_listWidget)
		self.win.verticalLayout_70.removeWidget(self.win.curSet_controls_listWidget)
		self.win.curSet_controls_listWidget.deleteLater()
		self.win.curSet_controls_listWidget = None		
		self.win.verticalLayout_70.addWidget(self.listWidget)

		#self.win.setsTemplate_btn.setVisible(False)

		self.win.setsTemplate_btn.setIcon(QtGui.QIcon(rootPath+'/ui/icons/save.png'))
		self.win.setsTemplate_btn.setIconSize(QtCore.QSize(20, 20))			
		self.win.setsRename_btn.setIcon(QtGui.QIcon(rootPath+'/ui/icons/rename.png'))
		self.win.setsRename_btn.setIconSize(QtCore.QSize(20, 20))			

		self.connect()
		self.update()

		debugEnd(traceback.extract_stack()[-1][2])

	def connect(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.treeWidget.currentItemChanged.connect(self.updateCurrentSetControls)

		self.win.setsAddControlSet_btn.clicked.connect(self.addControlSet)
		self.win.setsRemoveControlSet_btn.clicked.connect(self.removeControlSet)
		self.win.setsRecurcive_btn.clicked.connect(self.updateCurrentSetControls)
		self.win.setsRename_btn.clicked.connect(self.setRename)

		self.win.setsAddSelection_btn.clicked.connect(self.addSelectedToControlSet)
		self.win.setsRemoveControl_btn.clicked.connect(self.removeFromControlSet)

		debugEnd(traceback.extract_stack()[-1][2])

	def update(self):
		debugStart(traceback.extract_stack()[-1][2])

		self.treeWidget.updateControlSetTree()	
		self.setsTemplatesMenuUpdate()

		debugEnd(traceback.extract_stack()[-1][2])

	def controlInControlSet(self, control):
		controls = utils.getSetObjects('controlSet')
		count = 0
		for c in controls:
			if c == control:
				count += 1
		return count

	def updateCurrentSetControls(self):
		debugStart(traceback.extract_stack()[-1][2])

		def getSetControls(set):
			objects = []
			if type(cmds.sets(set, q=1)).__name__ == "NoneType":
				return []
			for o in cmds.sets(set, q=1):
				if cmds.objectType(o) != 'objectSet':
					objects.append(o)
			return objects		

		try:		
			currentControlSet = self.treeWidget.getCurrentControlSet()

			self.listWidget.clear()

			if self.win.setsRecurcive_btn.isChecked():
				controls = utils.getSetObjects(currentControlSet)
			else:
				controls = getSetControls(currentControlSet)

			self.listWidget.addItems(sorted(controls))

			if utils.objectIsOpposite(currentControlSet):
				self.listWidget.setEnabled(False)
			else:
				self.listWidget.setEnabled(True)

			#cmds.select(currentControlSet)	
		except: pass



		debugEnd(traceback.extract_stack()[-1][2])

	def addControlSet(self, name=''):
		debugStart(traceback.extract_stack()[-1][2])

		if not name or name == "":
			name, ok = QtWidgets.QInputDialog.getText(self.win, "Add Control Set", "Please enter set name", QtWidgets.QLineEdit.Normal, "")

			if ok:
				set_name = name+"_controlSet"

				if cmds.objExists(set_name):
					QtWidgets.QMessageBox.information(self.win, "Warning", "This set is exists.")
					return

				if name == '' or " " in name or "-" in name  or name[0].isdigit():
					QtWidgets.QMessageBox.information(self.win, "Warning", "Wrong Name.")
					return
			else:
				return

			self.treeWidget.addSet(set_name)

		debugEnd(traceback.extract_stack()[-1][2])

	def removeControlSet(self):
		debugStart(traceback.extract_stack()[-1][2])

		# get item
		currentControlSet = self.treeWidget.getCurrentControlSet()
		item = self.treeWidget.currentItem()
		item_name_ = itemName(currentControlSet)

		if currentControlSet == 'controlSet':
			return

		def remove(item_name):
			#print "TRY To DELETE", item_name
			#try:
			item = self.treeWidget.findItems(item_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
			set_name = controlSetName(item)

			# get parent
			parent_item = item.parent()
			parent_name = controlSetName(parent_item)

			if not cmds.objExists(set_name):
				return
			#print "PARENT IS", parent_name
			if cmds.objExists(parent_name):
				# remove from parent set
				cmds.sets(set_name, e=1, rm=parent_name)
				#print "REMOVE", set_name, "FROM", parent_name

			sets = utils.getSetsInSet('sets')
			if set_name not in sets:
				# remove current set
				cmds.delete(set_name)
				#print "DELETE", set_name

			self.treeWidget.updateControlSetTree()
			#except: pass

		def getChilds(itm):
			childs_items = []
			childs_count = itm.childCount()
			for i in range(childs_count):
				child = itm.child(i)
				childs_items.append(child.text(0))
				childs_items += getChilds(child)
				#print child.text(0)
			return childs_items

		# remove set
		childs_names = getChilds(item)

		for child in childs_names:
			remove(child)

		remove(item_name_)

		# remove opposite set
		opp_currentControlSet = utils.getOppositeObject(currentControlSet)

		if cmds.objExists(opp_currentControlSet):
			opp_item_name_ = itemName(opp_currentControlSet)
			opp_item = self.treeWidget.findItems(opp_item_name_, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]

			childs_names = getChilds(opp_item)

			for child in childs_names:
				remove(child)

			remove(opp_item_name_)		

	def addSelectedToControlSet(self):
		sel = cmds.ls(sl=1)

		if len(sel) == 0:
			return

		set_name = controlSetName(self.treeWidget.currentItem())
		cmds.sets(sel, e=1, add=set_name)	
		
		opp_set_name = utils.getOppositeObject(set_name)
		opp_sel = []
		for c in sel:
			opp_c = utils.getOppositeObject(c)
			if opp_c != c:
				opp_sel.append(opp_c)
		cmds.sets(opp_sel, e=1, add=opp_set_name)	

		# update sets tree
		self.treeWidget.updateControlSetTree()
		currentSet_item = self.treeWidget.findItems(itemName(set_name), QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
		self.treeWidget.setCurrentItem(currentSet_item)		

	def removeFromControlSet(self):
		# get set name
		set_name = controlSetName(self.treeWidget.currentItem())

		# remove selected items
		for o in self.listWidget.selectedItems():
			cmds.sets(o.text(), e=1, rm=set_name)
			
			# add opposide set
			if set_name.split("_")[0] == "l" and o.text().split("_")[0] == "l":
				opp_set = utils.getOppositeObject(set_name)
				opp_o = utils.getOppositeObject(o.text())
				cmds.sets(opp_o, e=1, rm=opp_set)			

		# update sets tree
		self.treeWidget.updateControlSetTree()
		currentSet_item = self.treeWidget.findItems(itemName(set_name), QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
		self.treeWidget.setCurrentItem(currentSet_item)		

	def	setsTemplatesMenuUpdate(self):
		debugStart(traceback.extract_stack()[-1][2])

		menu = QtWidgets.QMenu(self.win)

		saveModTepl_action = QtWidgets.QAction(self.win)
		saveModTepl_action.setText("Save Template")
		menu.addAction(saveModTepl_action)	
		saveModTepl_action.triggered.connect(partial(self.templActions, 'save'))

		resetModTepl_action = QtWidgets.QAction(self.win)
		resetModTepl_action.setText("Clear")
		menu.addAction(resetModTepl_action)	
		resetModTepl_action.triggered.connect(partial(self.templActions, 'clear'))

		menu.addSeparator()

		def getTemplateFiles():
			templfilesList = os.listdir(rootPath + '/templates/sets')
			templFiles = []
			# if file is template file for current module, add it to list
			for f in templfilesList:
				if f.split('.')[-1] == 'tmpl':
					name = f.split(".")[0]
					templFiles.append(name)
			return templFiles		

		# build template menu for current module
		templateNames = getTemplateFiles()
		for t in templateNames:
			t_action = QtWidgets.QAction(self.win)
			t_action.setText(t)
			t_action.triggered.connect(partial(self.templActions, 'load', t))				
			menu.addAction(t_action)				

		# add menu to button
		self.win.setsTemplate_btn.setMenu(menu)

		debugEnd(traceback.extract_stack()[-1][2])			

	def getData(self):
		sets_list = []

		sets_data = {}
		# get all nodes under controlSet
		sets = self.treeWidget.getSetObjects('controlSet')

		for s in sets:
			childs = cmds.sets(s, q=1) or []
			for o in childs:
				if o in sets:
					parent = s
					set_data = {}

					set_data['name'] = o
					set_data['parent'] = parent
					set_data['controls'] = getSetControlsNoRecurcive(o)

					sets_data[o] = set_data

		return sets_data		

	def templActions(self, action, tName="", data=None):
		debugStart(traceback.extract_stack()[-1][2])

		if action == 'save':

			name, ok = QtWidgets.QInputDialog().getText(self.win, 'Save Sets Tree Template', 'Enter name:', QtWidgets.QLineEdit.Normal, 'controlSet')

			if ok and name != "":
				name = name.replace(" ", "_")
			else:
				return

			mData = self.getData()

			fullPath = rootPath + '/templates/sets/' + name + ".tmpl"
			# format data 
			json_string = json.dumps(mData, indent=4)
			# save data to file					
			with open(fullPath, 'w') as f:
				f.write(json_string)		

			self.setsTemplatesMenuUpdate()

		elif action == 'load':

			def load(sets_data):
				if cmds.objExists('controlSet'):
					sets = utils.getSetsInSet('controlSet')
					for s in sets:
						if cmds.objExists(s):
							cmds.delete(s)
					if cmds.objExists('controlSet'):
						cmds.delete('controlSet')

				cmds.sets(n='controlSet')
				cmds.sets('controlSet', e=1, add='sets')		

				for s in sets_data:
					cmds.select(clear=1)
					if cmds.objExists(s):
						cmds.delete(s)
					cmds.sets(n=s)

				for s in sets_data:
					set_data = sets_data[s]
					name = set_data['name']
					parent = set_data['parent']
					controls = set_data['controls']

					cmds.sets(name, e=1, add=parent)

					existed_controls = []
					for c in controls:
						if cmds.objExists(c):
							existed_controls.append(c)
					if existed_controls != []:
						cmds.sets(existed_controls, e=1, add=name)


					#print '---------------'
					#print 'NAME', name
					#print 'PARENT', parent
					#print 'COTRLS', controls

				self.treeWidget.updateControlSetTree()	

			# read data
			if not data:
				with open(rootPath+'/templates/sets/'+ tName+'.tmpl', mode='r') as f:
					data = json.load(f)	

			load(data)

		elif action == 'clear':

			sData = self.getData()

			if cmds.objExists('controlSet'):
				cmds.delete('controlSet')

			for s in sData:
				if cmds.objExists(s):
					cmds.delete(s)

			cmds.select(clear=1)
			cmds.sets(n='controlSet')
			cmds.sets('controlSet', e=1, add='sets')

			self.treeWidget.updateControlSetTree()	

		debugEnd(traceback.extract_stack()[-1][2])

	def setRename(self):
		#print self.treeWidget.currentItem().text(0)

		old_name = self.treeWidget.currentItem().text(0).split(" ")[0]
		newName, ok = QtWidgets.QInputDialog().getText(self.win, 'Rename Set', 'Enter set name:', QtWidgets.QLineEdit.Normal, old_name)

		if ok and newName != "":
			name = newName.replace(" ", "_")
		else:
			return

		cmds.rename(old_name+"_controlSet", name+"_controlSet")
		
		if cmds.objExists("r"+old_name[1:]+"_controlSet"):
			cmds.rename("r"+old_name[1:]+"_controlSet", "r"+name[1:]+"_controlSet")
		
		self.treeWidget.updateControlSetTree()	
		self.treeWidget.selectItem(name+"_controlSet")