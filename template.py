import maya.cmds as cmds
import maya.mel as mel
from . import utils, parents

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

import os, json



class Template(object):
	def __init__(self):
		self.main = None
		self.rootPath = os.path.normpath(os.path.dirname(__file__))
		

	def module_save(self):
		m = self.main.curModule
		name, ok = QtWidgets.QInputDialog().getText(self.main.win, 'Save Module Template', 'Enter template name:',
													QtWidgets.QLineEdit.Normal, m.name)

		if not ok or not utils.nameIsOk(name):
			return

		mData = m.getData()

		fullPath = os.path.join(self.rootPath, 'templates', 'modules', m.type + '_' + name + ".tmpl")
		print("Saved to:", fullPath)
		# format data 
		json_string = json.dumps(mData, indent=4)
		# save data to file					
		with open(fullPath, 'w') as f:
			f.write(json_string)

		self.main.moduleTemplatesMenuUpdate()

	def module_load(self, templateName=None, moduleName=None):
		sel = cmds.ls(sl=1)

		if not moduleName:
			moduleName = self.main.curModule.name
			mod = self.main.curModule
		else:
			mod = self.main.rig.modules[moduleName]

		# read data
		path = os.path.join(self.rootPath,'templates', 'modules', mod.type + '_' + templateName + '.tmpl')
		with open(path, mode='r') as f:
			mData = json.load(f)

		# skip if any add control is exists
		# curAddControlsNames = []
		# for c in m.additionalControls:
		# 	curAddControlsNames.append(c.name)

		# remove opposite module
		# sym = False
		# if m.symmetrical:
		# 	cur_m = m
		# 	sym = True
		# 	oppMod = self.rig.getMirroredModule(m)
		# 	self.deleteModule(oppMod.name)

		# 	self.curModule = cur_m
		# 	oldCurItem = \
		# 		self.win.modules_treeWidget.findItems(cur_m.name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
		# 											0)[0]
		# 	self.win.modules_treeWidget.setCurrentItem(oldCurItem)
		# 	self.curModule.symmetrical = False

		# remove twists
		# twists = self.twistClass.getTwists(m.name)
		# for tw in twists:
		# 	self.twistClass.twists_remove(tw)

		# # remove add controls
		# for c in m.additionalControls:
		# 	c.delete()

		# set module paraneters
		mod.setData(mData)

		# set options
		# opt = mData['optionsData']
		# if opt != {}:
		# 	self.rebuildModule(options=opt)

		# m.setData(mData)

		self.main.updateModulesTree()
		self.main.updateModulePage(mod.name)

		# make symmetry module if needed
		# if sym:
		# 	self.makeSymmetryModule()

		mod.deleteAllAdditionalControls()
		mod.setAddControlsData(mData, mod.name)
		self.main.addControls_updateTree()

		# twists
		# for twData in mData['twistsData']:
		# 	real_data = []
		# 	real_data = twData
		# 	m_name = self.curModule.name
		# 	real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
		# 	real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
		# 	real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
		# 	twist.Twist(self.win).twists_add(real_data)

		# self.twistClass.updateList()

		self.main.selectModuleInList(mod.name)

		try:
			cmds.select(sel)
		except:
			cmds.select(clear=1)

	def module_delete(self, templateName):
		m = self.main.rig.modules[templateName]
		path = os.path.join(self.rootPath,'templates', 'modules', m.type + '_' + templateName + '.tmpl')
		os.remove(path)
		self.main.moduleTemplatesMenuUpdate()

		print("Template file %s was deleted" % path)
	
	def rig_save(self):
		data = {}
		modulesData = []

		# t_name, ok = QtWidgets.QInputDialog().getText(self.main.win, 'Save Rig Template', 'Enter template name:',
		# 												QtWidgets.QLineEdit.Normal, self.main.rig.name)


		t_name, ok = QtWidgets.QFileDialog.getSaveFileName(self.main.win, "Save Rig Template",
														os.path.join(self.rootPath,'templates','rigs'), "*.tmpl")
		
		t_name = t_name.split(".tmpl")[0]

		if not ok:
			return
		
		if not utils.nameIsOk(t_name):
			QtWidgets.QMessageBox.information(self.main.win, "Warning", "Wrong Name.")
			return

		if len(self.main.rig.modules) == 0:
			cmds.warning("No modules")
			return

		# create progress window
		window = cmds.window(t='Save modules')
		cmds.columnLayout()
		if len(self.main.rig.modules) > 1:
			progressControl = cmds.progressBar(maxValue=len(self.main.rig.modules) - 1, width=300)
		else:
			progressControl = cmds.progressBar(maxValue=1, width=300)
		cmds.showWindow(window)

		for name in self.main.rig.modules:
			m = self.main.rig.modules[name]

			mData = m.getData()
			modulesData.append(mData)

			cmds.progressBar(progressControl, edit=True, step=1)

		# delete progress window
		cmds.deleteUI(window)

		data['type'] = 'rs_rig'
		data['name'] = self.main.rig.name
		data['modulesData'] = modulesData
		data['ibtwsData'] = self.main.rig.getIbtwsData()
		# data['sets'] = self.sets.getData()

		fullPath = os.path.join(self.rootPath, 'templates', 'rigs', t_name + ".tmpl")
		print(fullPath)
		# format data 
		json_string = json.dumps(data, indent=4)
		# save data to file					
		with open(fullPath, 'w') as f:
			f.write(json_string)

		self.main.rigTemplatesMenuUpdate()

	def rig_load(self, tName=None):

		# read data
		if tName:
			with open(os.path.join(self.rootPath, 'templates', 'rigs', tName + '.tmpl'), mode='r') as f:
				data = json.load(f)

		else:
			t_path = QtWidgets.QFileDialog.getOpenFileName(self.main.win, "Load Rig Template", os.path.join(self.rootPath,'templates','rigs'), "*.tmpl")[0]
	
			if not t_path:
				return

			with open(t_path, mode='r') as f:
				data = json.load(f)


		# delete rig
		try:
			self.main.rig.delete()
		except:
			pass

		# create rig
		rigName = self.main.rig.name
		self.main.rig.create()
		self.main.rig.rename(rigName)

		# create modules
		self.load_modules(data, load='rig')

		self.main.rigPage_update()

	def	compound_save(self):
		def haveParent(parent_name, module_name):
			m = self.main.rig.modules[module_name]
			p_moduleName = None
			while m.parent != None:
				p_moduleName = utils.getModuleName(m.parent)
				if p_moduleName == parent_name:
					return True
				m = self.main.rig.modules[p_moduleName]
			return False

		t_name = QtWidgets.QFileDialog.getSaveFileName(self.main.win, "Save compound module",
														os.path.join(self.rootPath,'templates','compoundModules'), "*.ctmpl")[0]

		if t_name == "":
			return

		data = {}
		modulesData = []
		ibtwsData = []

		if len(self.main.rig.modules) == 0:
			cmds.warning("No modules")
			return

		# collect data for current module and his children
		for name in self.main.rig.modules:
			m = self.main.rig.modules[name]

			# print name, m.parent
			if haveParent(self.main.curModule.name, m.name) or name == self.main.curModule.name:
				mData = m.getData()
				modulesData.append(mData)

				ibtwsData.append(m.getIbtwsData())
		
		data['type'] = 'compound_module'
		data['name'] = os.path.basename(t_name).split(".")[0]
		data['modulesData'] = modulesData
		data['ibtwsData'] = ibtwsData

		# format data 
		json_string = json.dumps(data, indent=4)
		# save data to file					
		with open(t_name, 'w') as f:
			f.write(json_string)

		self.main.compoundModuleMenuUpdate()

	def compound_load(self, path):
		# read data
		with open(os.path.join(self.rootPath, 'templates', 'rigs', path), mode='r') as f:
			data = json.load(f)

		def incrementIfExists(name): 
			suffix = name.split('_')[-1]
			if suffix.isdigit():
				rootName = name[:-len(suffix)-1]
			else:
				suffix = ""
				rootName = name	

			while cmds.objExists(name+"_mod"):
				suffix = name.split('_')[-1]
				if suffix.isdigit():
					name = rootName + '_' + str( int(suffix) + 1 )
				else:
					name += '_1'

			return name

		for mData in data['modulesData']:
			name = mData["name"]
			if cmds.objExists(name+"_mod"):
				# get new name
				new_name = incrementIfExists(name)
				# rename parents
				for mData_ in data['modulesData']:
					if mData_["parent"]:
						if name+"_" == mData_["parent"][:len(name)+1]: 
							mData_["parent"] = new_name + mData_["parent"][len(name):] 
				# rename name
				mData["name"] = new_name

		# create modules
		self.load_modules(data, load='rig')

		self.main.updateModulesTree()

	def load_modules(self, data, load):
		
		modulesData = []

		def create_modules():
			# create modules with add controls
			if print_main_messages: print(
				" -------------------------------- LOAD MODULES ------------------------------------------------ ")
			for mData in data['modulesData']:
				if not mData['opposite']:
					mod = self.main.addModule(mData['type'], name=mData['name'], options=mData['optionsData'],
										updateUI=False)
					modulesData.append([mod, mData])

				cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

		def create_addControls():
			if print_main_messages: print(
				" -------------------------------- LOAD ADD CONTROLS ------------------------------------------------ ")
			for d in modulesData:
				mod, mData = d
				mod.setAddControlsData(mData, mod.name)

				cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

		def setAddAttributes(mData):
			# set attributes
			for cData in mData['additionalControlsData']:
				c = utils.getControlInstance(cData['name'])
				intName = utils.getInternalNameFromControl(c.name)
				default_attrs = utils.getVisibleAttrs(c.name)
				for a in default_attrs:
					if intName + "." + a in mData['controlsAttrData']:
						cmds.setAttr(c.name + "." + a, mData['controlsAttrData'][intName + "." + a])
					else:
						cmds.setAttr(c.name + "." + a, keyable=0, lock=1)

		def connect_modules(modulesData):
			if print_main_messages: print(
				" -------------------------------- CONNECT MODULES ------------------------------------------------ ")
			# load modules data
			cmds.window(window, e=1, t='Load modules data')
			cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
			for mDataList in modulesData:
				mod, mData = mDataList
				mData = mDataList[1]
				if not mData['opposite']:
					if mData['parent'] != None:
						mod_name = mData['name']
						parent = mData['parent']
						self.main.connectModule(parent, mod_name, updateUI=False)
				cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

		def set_modules(modulesData, load="all"):
			if print_main_messages: print(
				" -------------------------------- SET MODULES ------------------------------------------------ ")
			# load modules data
			cmds.window(window, e=1, t='Load modules data')
			cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
			for mData in modulesData:
				mod = mData[0]
				mod.setData(mData[1], sym=False, namingForce=True, load=load)
				cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

		def mirror_modules(modulesData):
			if print_main_messages: print(
				" -------------------------------- MIRROR MODULES ------------------------------------------------ ")
			# save all modules which needed to mirror
			mirrored_names = []
			for mData in data['modulesData']:
				if mData['symmetrical']:
					mirrored_names.append(mData["name"])

			cmds.window(window, e=1, t='Create mirror modules')
			cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
			for mData in data['modulesData']:
				if mData['symmetrical']:
					# mirror only module which not child another mirrored module
					p_moduleName = utils.getModuleName(mData["parent"])
					if p_moduleName not in mirrored_names:
						self.main.makeSymmetryModule(mData['name'], updateUI=False)
					cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

			# hide opposite posers
			for mData in data['modulesData']:
				if mData['symmetrical']:
					cmds.setAttr(utils.getOpposite(mData['name'])+"_posers.v", 0)

		def create_twists(modulesData):
			if print_main_messages: print(" -------------------------------- TWISTS ------------------------------------------------ ")
			
			cmds.window(window, e=1, t='Load twists data')
			cmds.progressBar(progressControl, e=1, progress=0)

			for mData in modulesData:
				m = mData[0]
				for twData in mData[1]['twistsData']:
					# print "Rig load ADD TWIST Start ------------" , twData['name']
					real_data = []
					real_data = twData
					m_name = m.name
					real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
					target = real_data['target'] = utils.getRealNameFromTemplated(m_name, twData['target'])
					endTarget = real_data['endTarget'] = utils.getRealNameFromTemplated(m_name, twData['endTarget'])
					rootOrientTarget = real_data['rootOrientTarget'] = utils.getRealNameFromTemplated(m_name, twData['rootOrientTarget'])
					endOrientTarget = real_data['endOrientTarget'] = utils.getRealNameFromTemplated(m_name, twData['endOrientTarget'])
					real_data['jointsCount'] = utils.getRealNameFromTemplated(m_name, twData['jointsCount'])
					if 'rootOffset' in twData: real_data['rootOffset'] = utils.getRealNameFromTemplated(m_name, twData['rootOffset'])
					if 'rootUpOffset' in twData: real_data['rootUpOffset'] = utils.getRealNameFromTemplated(m_name, twData['rootUpOffset'])
					if 'endOffset' in twData: real_data['endOffset'] = utils.getRealNameFromTemplated(m_name, twData['endOffset'])
					self.main.twistClass.twists_add(real_data)

					if rootOrientTarget != target:
						self.main.twistClass.attach("root", rootOrientTarget)

					if endOrientTarget != endTarget:
						self.main.twistClass.attach("end", endOrientTarget)

					if 'rootFlipped' in twData and twData['rootFlipped']:
						self.main.twistClass.setRootFlipped(name=utils.getOpposite(twData['name']), state=twData['rootFlipped'])

				cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

		def create_ibtws(ibtwsData):
			if print_main_messages: print(" -------------------------------- INBETWEENS ------------------------------------------------ ")
			
			cmds.window(window, e=1, t='Load inbetweens data')
			cmds.progressBar(progressControl, e=1, progress=0)
			
			for module_ibtwsData in ibtwsData:
				if type(module_ibtwsData)==type({}): 			# for rig template
					self.main.ibtwClass.add(module_ibtwsData)
				elif module_ibtwsData:							# for compound module template
					for ibtwData in module_ibtwsData:
						self.main.ibtwClass.add(ibtwData)

				cmds.progressBar(progressControl, edit=True, step=1)
			cmds.progressBar(progressControl2, edit=True, step=1)

		def create_oss(modulesData):
			self.par_class = parents.Parents(self.main.win, self.main.rig)
			for data in modulesData:
				mData = data[1]
				for d in mData['parents']:
					self.par_class.os_makeConstraint(d)

		print_main_messages = True

		# create progress window
		window = cmds.window(t='Import modules')
		cmds.columnLayout()
		if len(data['modulesData']) > 1:
			progressControl2 = cmds.progressBar(maxValue=8, width=300)
			progressControl = cmds.progressBar(maxValue=len(data['modulesData']) - 1, width=300)
		else:
			progressControl2 = cmds.progressBar(maxValue=1, width=300)
			progressControl = cmds.progressBar(maxValue=1, width=300)
		cmds.showWindow(window)

		# self.main.twistClass.twists = {}
		# self.main.win.twists_listWidget.clear()

		create_modules()
		print(111, cmds.getAttr("spine_end_skinJoint.jointOrient"))
		create_addControls()
		connect_modules(modulesData)
		print(222, cmds.getAttr("spine_end_skinJoint.jointOrient"))
		set_modules(modulesData)
		print(333, cmds.getAttr("spine_end_skinJoint.jointOrient"))
		if load == 'rig': mirror_modules(modulesData)
		create_twists(modulesData)
		print(444, cmds.getAttr("spine_end_skinJoint.jointOrient"))
		create_ibtws(data["ibtwsData"])
		create_oss(modulesData)
		print(555, cmds.getAttr("spine_end_skinJoint.jointOrient"))

		# if print_main_messages: print(
		# 	" -------------------------------- SET Parents DATA ------------------------------------------------ ")
		# # load oss data
		# cmds.window(window, e=1, t='Load parents data')
		# cmds.progressBar(progressControl, e=1, progress=0)
		# for mData in modulesData:
		# 	self.main.curModule = mData[0]
		# 	loadParents(mData[1])
		# 	cmds.progressBar(progressControl, edit=True, step=1)
		# cmds.progressBar(progressControl2, edit=True, step=1)

		# if print_main_messages: print(
		# 	" -------------------------------- Snap To Parents End Joint DATA ------------------------------------------------ ")
		# # load oss data
		# cmds.window(window, e=1, t='Load snap to parents ends data')
		# cmds.progressBar(progressControl, e=1, progress=0)
		# for mData in modulesData:
		# 	self.main.curModule = mData[0]
		# 	snapParentsEnd(mData[1])
		# 	cmds.progressBar(progressControl, edit=True, step=1)
		# cmds.progressBar(progressControl2, edit=True, step=1)

		# update joints placement
		cmds.refresh()



		# if print_main_messages: print(
		# 	" -------------------------------- SET ATTRIBUTES ------------------------------------------------ ")
		# # load modules data
		# cmds.window(window, e=1, t='Load modules data')
		# cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
		# for mData in modulesData:
		# 	self.main.curModule = mData[0]
		# 	setAddAttributes(mData[1])
		# 	cmds.progressBar(progressControl, edit=True, step=1)
		# cmds.progressBar(progressControl2, edit=True, step=1)

		# if print_main_messages: print(
		# 	" -------------------------------- END ------------------------------------------------ ")

		# delete progress window
		cmds.deleteUI(window)

		# fix joints placement (update)
		# for m_name in self.main.rig.modules:
		# 	m = self.main.rig.modules[m_name]
		# 	c = utils.getControlNameFromInternal(m_name, 'posCtrl')
		# 	if c != None and cmds.objExists(c):
		# 		cmds.setAttr(c + '.tx', 0)

		cmds.select(clear=1)
		
		# update ui
		self.main.updateModulePage(self.main.curModule.name)
		self.main.addControls_updateTree()

		
