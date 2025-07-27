import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
import maya.OpenMayaUI as OpenMayaUI
from functools import partial
import os, sys, imp, math, json, shutil, importlib

from .import utils, posers

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
    from PySide2.QtWidgets import QAction
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance
    from PySide6.QtGui import QAction

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])

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

class ModuleBuilder(object):
	def __init__(self, main):
		self.main = main
		self.win = main.moduleBuilderWin

		self.connect()
		self.addDuplicateMenu()
		self.addEditMenu()
		
		# fill menu
		self.sections = utils.getModuleSections()
		for s in self.sections:
			self.win.comboBox.addItem(s)

		self.updateCurrentModule()

	def connect(self):
		self.win.createNew_btn.clicked.connect(self.createNew)
		self.win.set_btn.clicked.connect(self.setSection)
		self.win.addInfo_btn.clicked.connect(self.show_moduleInfo)
		self.win.createMainPoser_btn.clicked.connect(self.createMainPoser)
		self.win.createPoser_btn.clicked.connect(self.createPoser)
		self.win.connectPosers_btn.clicked.connect(self.connectPosers)
		self.win.checkModule_btn.clicked.connect(self.check)
		self.win.mirrorModule_btn.clicked.connect(self.mirror)

	def updateCurrentModule(self):
		try:
			name = cmds.file(q=1, sceneName=1, shortName=1).split(".")[0]
			path = rootPath + '/modules/' + name
			
			with open(path+'/info.txt') as file :
				for line in file:
					if line.split("=")[0] == "section":
						sec_name = line.split("=")[1]
						self.win.comboBox.setEditText(sec_name)
		except:
			name = ""
			self.win.comboBox.setEditText("Custom")
		
		self.win.lineEdit.setText(name)

	def createNew(self):
		name, ok = QtWidgets.QInputDialog.getText(self.win, "Create Module", "Please enter new module name", QtWidgets.QLineEdit.Normal, "")

		if ok:
			name = utils.nameLower(name)
			name = name.replace(' ', '_')
			modules = utils.getModuleFiles()

			if name in modules:
				QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
				return

		else:
			return

		dir_path = rootPath + '/modules/' + name

		# create new scene, directory and save
		mel.eval('NewScene;')
		
		os.makedirs(dir_path)	
		
		cmds.file(rootPath + '//modules//_template.ma', o=1)
		cmds.file( rename=dir_path + '/' + name + '.ma' )
		cmds.file( save=True, type='mayaAscii' )		
		
		# copy needed files
		shutil.copy2(rootPath + '/modules/_template.py', dir_path+'/%s.py' %name)
		shutil.copy2(rootPath + '/modules/__init__.py', dir_path)
		shutil.copy2(rootPath + '/modules/_info.txt', dir_path+'/info.txt')

		# Read class py file
		with open(dir_path+'/%s.py' %name) as file :
			filedata = file.read()		

		filedata = filedata.replace('class Template', 'class '+utils.capitalizeName(name))

		# Write class py file
		with open(dir_path+'/%s.py' %name, 'w') as file:
			file.write(filedata)	
			
		self.updateCurrentModule()

	def addDuplicateMenu(self):
		menu = QtWidgets.QMenu(self.win)
		moduleFiles = utils.getModuleFiles()
		# get sections
		sections = {}
		for m in moduleFiles:
			with open(rootPath+'/modules/'+m+'/info.txt') as f:
				lines = f.readlines()	
			sect = lines[2].split('=')[1]
			try: sectionList = sections[sect]
			except: sectionList = []
			sectionList.append(m)
			sections[sect] = sectionList

		# add module names in sections
		for sectionListName in sorted(sections):
			sub_menu = menu.addMenu('&%s' %sectionListName)
			for m in sections[sectionListName]:
				m_action = QAction(self.win)
				name = utils.formatName(m)
				#m_action = ActionClass(self.win)
				m_action.setText(name)
				m_action.setToolTip(name.upper())
				m_action.triggered.connect(partial(self.duplicate, m))
				sub_menu.addAction(m_action)

		self.win.duplicate_btn.setMenu(menu)		

	def addEditMenu(self):
		menu = QtWidgets.QMenu(self.win)
		moduleFiles = utils.getModuleFiles()
		# get sections
		sections = {}
		for m in moduleFiles:
			with open(rootPath+'/modules/'+m+'/info.txt') as f:
				lines = f.readlines()	
			sect = lines[2].split('=')[1]
			try: sectionList = sections[sect]
			except: sectionList = []
			sectionList.append(m)
			sections[sect] = sectionList

		# add module names in sections
		for sectionListName in sorted(sections):
			sub_menu = menu.addMenu('&%s' %sectionListName)
			for m in sections[sectionListName]:
				m_action = QAction(self.win)
				name = utils.formatName(m)
				#m_action = ActionClass(self.win)
				m_action.setText(name)
				m_action.setToolTip(name.upper())
				m_action.triggered.connect(partial(self.edit, m))
				m_action.setEnabled(utils.moduleIsHaveScene(m))
				sub_menu.addAction(m_action)

		self.win.edit_btn.setMenu(menu)		
				
	def duplicate(self, sourceName):
		name, ok = QtWidgets.QInputDialog.getText(self.win, "Create Module", "Please enter new module name", QtWidgets.QLineEdit.Normal, sourceName)

		if ok:
			name = utils.nameLower(name)
			name = name.replace(' ', '_')
			modules = utils.getModuleFiles()

			if name in modules:
				QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
				return

		else:
			return

		source_dir_path = rootPath + '//modules//' + sourceName
		dir_path = rootPath + '/modules/' + name

		# create new scene
		m_file = source_dir_path + '//' + sourceName + '.ma'	
		if os.path.isfile(m_file):
			mel.eval('NewScene;')
			cmds.file(m_file, o=1)

		# create directory and save		
		os.makedirs(dir_path)
		if os.path.isfile(m_file):
			cmds.file( rename=dir_path + '/' + name + '.ma' )
			cmds.file( save=True, type='mayaAscii' )		

		# copy needed files
		shutil.copy2(source_dir_path+'/'+sourceName+'.py', dir_path+'/'+name+'.py')
		shutil.copy2(rootPath + '/modules/__init__.py', dir_path)
		shutil.copy2(rootPath + '/modules/_info.txt', dir_path+'/info.txt')		
		shutil.copy2(source_dir_path+'/'+sourceName+'_widget.ui', dir_path+'/'+name+'_widget.ui')
		
		# Read class py file
		with open(dir_path+'/%s.py' %name) as file :
			filedata = file.read()		

		filedata = filedata.replace('class '+utils.capitalizeName(sourceName), 'class '+utils.capitalizeName(name))

		# Write class py file
		with open(dir_path+'/%s.py' %name, 'w') as file:
			file.write(filedata)	

		sys.stdout.write("Created new module " + name)
		
		self.updateCurrentModule()

	def edit(self, sourceName):
		source_dir_path = rootPath + '//modules//' + sourceName

		# open scene
		m_file = source_dir_path + '//' + sourceName + '.ma'	
		if os.path.isfile(m_file):
			mel.eval('NewScene;')
			cmds.file(m_file, o=1)

		self.updateCurrentModule()

	def setSection(self):
		if not cmds.objExists("mod"):
			cmds.warning("This scene is not a module")
			return
		
		name = cmds.file(q=1, sceneName=1, shortName=1).split(".")[0]
		path = rootPath + '/modules/' + name
		
		# Read class py file
		
		filedata = []
		with open(path+'/info.txt') as file :
			for line in file:
				if line.split("=")[0] == "section":
					sec_name = self.win.comboBox.currentText()
					line = "section="+ sec_name + "\r\n"
				filedata.append(line)

		stringData = ""
		for l in filedata:
			stringData += l
		
		# Write class py file
		with open(path+'/info.txt', 'w') as file:
			file.write(stringData)		

	def setInfo(self):
		if not cmds.objExists("mod"):
			cmds.warning("This scene is not a module")
			return
		
		name = cmds.file(q=1, sceneName=1, shortName=1).split(".")[0]
		path = rootPath + '/modules/' + name
		
		# Read class py file
		
		filedata = []
		with open(path+'/info.txt') as file :
			for line in file:
				
				if line.split("=")[0] == "description":
					text = self.win.comboBox.currentText()
					line = "description=" + text + "\r\n"
					
				filedata.append(line)

		stringData = ""
		for l in filedata:
			stringData += l
		
		# Write class py file
		with open(path+'/info.txt', 'w') as file:
			file.write(stringData)		
			
	def show_moduleInfo(self):
		if not cmds.objExists("mod"):
			cmds.warning("This scene is not a module")
			return
		
		name = cmds.file(q=1, sceneName=1, shortName=1).split(".")[0]
		path = rootPath + '/modules/' + name		

		def aboutClose():
			filedata = []
			with open(path+'/info.txt') as file :
				for line in file:
					if line.split("=")[0] == "description":
						text = self.infoWin.lineEdit.text()
						line = "description=" + text + "\r\n"
					filedata.append(line)
	
			stringData = ""
			for l in filedata:
				stringData += l
			
			# Write class py file
			with open(path+'/info.txt', 'w') as file:
				file.write(stringData)				

			self.infoWin.close()
			
		self.infoWin = load_ui_widget(os.path.join(rootPath, 'ui', 'designer', 'moduleDecsriptionWindow.ui'), parent=self.win)
		self.infoWin.pushButton.clicked.connect(aboutClose)

		self.infoWin.lineEdit.setText(utils.readInfo(name))

		self.infoWin.show()	
			
	def rename(self):
		#if not cmds.objExists("mod"):
			#cmds.warning("This scene is not a module")
			#return
		
		#old_name = cmds.file(q=1, sceneName=1, shortName=1).split(".")[0]
		#path = rootPath + '/modules/' + name		

		#name, ok = QtWidgets.QInputDialog.getText(self.win, "Create Module", "Please enter new module name", QtWidgets.QLineEdit.Normal, old_name)

		#if ok:
			#name = utils.nameLower(name)
			#name = name.replace(' ', '_')
			#modules = utils.getModuleFiles()

			#if name in modules:
				#QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
				#return

		#else:
			#return
		
		#source_dir_path = rootPath + '//modules//' + old_name
		#dir_path = rootPath + '/modules/' + name

		## create directory and save		
		#os.makedirs(dir_path)
		#cmds.file( rename=dir_path + '/' + name + '.ma' )
		#cmds.file( save=True, type='mayaAscii' )		

		## copy needed files
		#shutil.copy2(source_dir_path+'/'+old_name+'.py', dir_path+'/'+name+'.py')
		#shutil.copy2(rootPath + '/modules/__init__.py', dir_path)
		#shutil.copy2(rootPath + '/modules/_info.txt', dir_path+'/info.txt')		

		## Read class py file
		#with open(dir_path+'/%s.py' %name) as file :
			#filedata = file.read()		

		#filedata = filedata.replace('class '+utils.capitalizeName(old_name), 'class '+utils.capitalizeName(name))

		## Write class py file
		#with open(dir_path+'/%s.py' %name, 'w') as file:
			#file.write(filedata)	

		self.updateCurrentModule()
		
	def createMainPoser(self):
		posers.createMainPoser()
		
	def createPoser(self):
		posers.createPoser()
		
	def connectPosers(self):
		posers.connectPosers()
		
	def mirror(self):
		mirr = cmds.getAttr("posers.sz") == -1
		
		if mirr:
			cmds.setAttr("posers.sz", 1)
			cmds.setAttr("posers.ry", 0)
			cmds.setAttr("mod.mirror", 0)
		else:
			cmds.setAttr("posers.sz", -1)
			cmds.setAttr("posers.ry", 180)
			cmds.setAttr("mod.mirror", 1)		

	def check(self):
		warnings = False
		def check_groups(groups):
			for g in groups:
				if not cmds.objExists(g):
					cmds.warning(f'Group "{g}" is not exists')
					warnings = True
		
		def check_objects(objs):
			for o in objs:
				if not cmds.objExists(o):
					cmds.warning(f'"{o}" is not exists')
					warnings = True
		
		def check_sets(sets):
			for s in sets:
				if not cmds.objExists(s):
					cmds.warning(f'Set "{s}" is not exists')
					warnings = True
		
		# check groups and objects
		check_groups(["mod", "posers", "input", "controls", "system", "output", "outJoints"])
		check_objects(["mainPoser", "root_poser", "root_connector", "root_outJoint"])
		check_sets(["sets", "moduleControlSet", "skinJointsSet"])

		# check joints
		joints = cmds.listRelatives("outJoints", allDescendents=1)
		for j in joints:
			if cmds.objectType(j) == "joint":
				if j.split("_")[-1] != "outJoint":
					cmds.warning(f'Joint {j} have not a "outJoint" suffix in name')
					warnings = True

		# check initLocs
		posers = []
		for o in cmds.listRelatives("mainPoser", allDescendents=1):
			if o.split("_")[-1] == "poser":
				posers.append(o)

		for j in joints:
			il = j.replace("outJoint", "initLoc")
			if not cmds.objExists(il):
				cmds.warning(f'InitLoc "{il}" is not exists, you cannot connect to {j}')
				warnings = True
		

		controls = utils.getSetObjects("moduleControlSet")
		for c in controls:
			il = c + "_initLoc"
			if not cmds.objExists(il):
				cmds.warning(f'InitLoc "{il}" is not exists, you cannot connect to {c} control')
				warnings = True
		
		# check axises
		def check_axes_match(control, joint, tolerance=0.01):
			"""
			Проверяет, совпадают ли оси контрола и джоинта.
			tolerance (float): Допустимое отклонение для углов (в градусах).
			"""
			# Получаем мировые матрицы объектов
			control_matrix = cmds.xform(control, query=True, matrix=True, worldSpace=True)
			joint_matrix = cmds.xform(joint, query=True, matrix=True, worldSpace=True)

			# Извлекаем углы вращения (в градусах) из матриц
			control_rot = cmds.xform(control, query=True, rotation=True, worldSpace=True)
			joint_rot = cmds.xform(joint, query=True, rotation=True, worldSpace=True)

			# Сравниваем углы по каждой оси (X, Y, Z)
			for i in range(3):
				diff = abs(control_rot[i] - joint_rot[i])
				if diff > tolerance:
					return False
			
			return True
		
		for c in controls:
			j = c+"_outJoint"
			if cmds.objExists(j):
				if not check_axes_match(c, j):
					cmds.warning(f'Axises "{c}" and {j} is different')
					warnings = True

		# check skinJoints set
		if utils.getSetsInSet("skinJointsSet"):
			cmds.warning('skinJointsSet must not contain any nested sets')
			warnings = True

		# check "root" control
		for c in controls:
			if c == "root":
				cmds.warning('The module must not have a "root" control')
				warnings = True

		# # check outJoints
		# for j in joints:
		# 	if j.split("_")[-1] != "outJoint":
		# 		cmds.warning(f'Joint {j} have not a "outJoint" suffix in name')

		# check duplicates
		all = cmds.ls()
		for o in all:
			if "|" in o:
				cmds.warning("Duplicates in scene: "+ o)
				warnings = True

		if not warnings:
			print("All is good")