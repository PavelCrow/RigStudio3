import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import logging, traceback, os, sys, imp, math, json, shutil, importlib

from .import utils, main

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])

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
				m_action = QtWidgets.QAction(self.win)
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
				m_action = QtWidgets.QAction(self.win)
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
			

		self.infoWin = self.main.load_ui_widget(rootPath + '//ui//moduleDecsriptionWindow.ui', parent=self.win)
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
		#from .import utils, main
		import rigStudio2.rigTools.posers
		importlib.reload(rigStudio2.rigTools.posers)
		rigStudio2.rigTools.posers.createMainPoser()
		
	def createPoser(self):
		import rigStudio2.rigTools.posers
		importlib.reload(rigStudio2.rigTools.posers)
		rigStudio2.rigTools.posers.createPoser()
		
	def connectPosers(self):
		import rigStudio2.rigTools.posers
		importlib.reload(rigStudio2.rigTools.posers)
		rigStudio2.rigTools.posers.connectPosers()
		
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