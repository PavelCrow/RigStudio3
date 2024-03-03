import maya.cmds as cmds
import maya.mel as mel
from . import utils
from PySide2 import QtWidgets, QtCore
import os, json


class Template(object):
	def __init__(self):
		self.main = None
		self.rootPath = os.path.normpath(os.path.dirname(__file__))

	def save(self):
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
	
	def template_actions(self, action, tName="", forceData=None):

		sel = cmds.ls(sl=1)

		print_main_messages = 0
		renamedModules = {}

		def incrementData(mData):
			add_data = mData['additionalControlsData']
			print("------------------------", mData['name'])
			# print d["name"]
			# print d["parent"]
			# print "------------------------", mData['name']
			# for d in mData["twistsData"]:
			# for dd in d:
			# print dd, d[dd]

			new_names = []
			for data in add_data:
				name = data['name']
				if cmds.objExists(name):
					new_name = utils.incrementNameIfExists(name)
					while new_name in new_names:
						new_name = utils.incrementName(new_name)
					data["name"] = new_name
					new_names.append(new_name)

			# print mData["parents"]

			##print "Need to REPLACE", name, new_name, new_names
			# for d in add_data:
			# par = d["parent"]
			# if par == name:
			##print "REPLACE", name, new_name
			# d["parent"] = new_name

			# twData = mData["twistsData"]
			# for tw_d in twData:
			# print "AAAAAAAAAAAAAAAAAAAAAA"
			# s_j = tw_d["start_j"]
			# e_j = tw_d["end_j"]
			# if s_j.split("_joint")[0] == name:
			# tw_d["start_j"] = new_name + "_joint"
			# if e_j.split("_joint")[0] == name:
			# tw_d["end_j"] = new_name + "_joint"	
			pass

		def connectToParent(mData):

			if mData['parent'] != None:
				if mData['name'] in renamedModules:
					mod_name = renamedModules[mData['name']]
				# print "old ", mData['name'], "new", mod_name
				else:
					mod_name = mData['name']

				old_par_mod_name = mData['parent'].split("_")[0]
				if old_par_mod_name in renamedModules:
					newParMod_name = renamedModules[old_par_mod_name]
					parent = utils.getRealNameFromDataName(mData['parent'], newParMod_name)
				else:
					parent = mData['parent']

				if parent:
					# print 'connect', mod_name, ' to ', parent
					self.connectModule(parent, mod_name, updateUI=False)

		def loadParents(mData):
			# make oss
			for snapped in mData['parents']:
				if snapped:
					for d in mData['parents']:
						self.curParents.os_makeConstraint(d)

		def snapToParentsEnd(mData):
			# make oss
			if mData['snapped']:
				self.curModule.snapToParent(True)

		def haveParent(parent_name, module_name):
			m = self.rig.modules[module_name]
			p_moduleName = None
			# print "checking", module_name, '------------- '
			while m.parent != None:
				p_moduleName = utils.getModuleName(m.parent)
				if p_moduleName == parent_name:
					return True
				m = self.rig.modules[p_moduleName]

			return False

		def setAddAttributes(mData):
			# set attributes
			for cData in mData['additionalControlsData']:
				c = utils.getControlInstance(cData['name'])
				intName = utils.getInternalNameFromControl(c.name)
				default_attrs = utils.getVisibleAttrs(c.name)
				for a in default_attrs:
					if intName + "." + a in mData['controlsData']:
						cmds.setAttr(c.name + "." + a, mData['controlsData'][intName + "." + a])
					else:
						cmds.setAttr(c.name + "." + a, keyable=0, lock=1)

		if action == 'save':
			pass

		elif action == 'load':
			# read data
			with open(self.rootPath + '/templates/modules/' + self.curModule.type + '_' + tName + '.tmpl', mode='r') as f:
				mData = json.load(f)

				# skip if any add control is exists
				curAddControlsNames = []
				for c in self.curModule.additionalControls:
					curAddControlsNames.append(c.name)

				# for m in mData['additionalControlsData']:
				# if cmds.objExists(m['name']) and m['name'] not in curAddControlsNames:
				# QtWidgets.QMessageBox.information(self.win, "Warning", 'Object with name "%s" is exist.' %m['name'])
				# return		

				# skip if module name is exists
				# if mData['name'] in self.rig.moduleNames and mData['name'] != self.curModuleName:
				# QtWidgets.QMessageBox.information(self.win, "Warning", 'Module name "%s" is exist.' %mData['name'])
				# return

				# turn off hierarhy connections
				# hierarhy_state = self.win.actionPosers_Hierarhy.isChecked()
				# self.action_posersHierarhy(False)	

				# rename for use template names
				# oldName = self.curModuleName
				# if mData['name'] != self.curModuleName:
				# self.renameModule(mData['name'])

				# remove opposite module
				sym = False
				if self.curModule.symmetrical:
					cur_m = self.curModule
					sym = True
					oppMod = self.rig.getMirroredModule(self.curModule)
					self.deleteModule(oppMod.name)

					self.curModule = cur_m
					oldCurItem = \
					    self.win.modules_treeWidget.findItems(cur_m.name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
					                                      0)[0]
					self.win.modules_treeWidget.setCurrentItem(oldCurItem)
					self.curModule.symmetrical = False

				# remove twists
				twists = self.twistClass.getTwists(self.curModuleName)
				for tw in twists:
					self.twistClass.twists_remove(tw)

				# remove add controls
				for c in self.curModule.additionalControls:
					c.delete()

				# set module paraneters
				self.curModule.setData(mData)

				# set options
				opt = mData['optionsData']
				if opt != {}:
					self.rebuildModule(options=opt)

				self.curModule.setData(mData)
				# rename to original name
				# self.renameModule(oldName)

				self.updateModulesTree()
				self.updateModulePage(self.curModuleName)

				# make symmetry module if needed
				if sym:
					self.makeSymmetryModule()

				self.setAddControlsData(mData, self.curModuleName)
				self.addControls_updateTree()

				# twists
				for twData in mData['twistsData']:
					real_data = []
					real_data = twData
					m_name = self.curModule.name
					real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
					real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
					real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
					twist.Twist(self.win).twists_add(real_data)

				self.twistClass.updateList()

				# restore hierarhy connections
				# self.action_posersHierarhy(hierarhy_state)

				try:
					cmds.select(sel)
				except:
					cmds.select(clear=1)

		elif action == 'rig_save':

			if not full:
				QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
				return
			print(full)
			data = {}
			modulesData = []

			t_name, ok = QtWidgets.QInputDialog().getText(self.win, 'Save Rig Template', 'Enter template name:',
			                                              QtWidgets.QLineEdit.Normal, self.rig.name)

			if ok and t_name != "":
				t_name = t_name.replace(" ", "_")
			else:
				return

			if len(self.rig.moduleNames) == 0:
				cmds.warning("No modules")
				return

			# create progress window
			window = cmds.window(t='Save modules')
			cmds.columnLayout()
			if len(self.rig.moduleNames) > 1:
				progressControl = cmds.progressBar(maxValue=len(self.rig.moduleNames) - 1, width=300)
			else:
				progressControl = cmds.progressBar(maxValue=1, width=300)
			cmds.showWindow(window)

			for name in self.rig.moduleNames:
				m = self.rig.modules[name]

				mData = m.getData()
				modulesData.append(mData)

				cmds.progressBar(progressControl, edit=True, step=1)

			# delete progress window
			cmds.deleteUI(window)

			data['type'] = 'rs_rig'
			data['name'] = self.rig.name
			data['modulesData'] = modulesData
			# data['sets'] = self.sets.getData()

			fullPath = self.rootPath + '/templates/rigs/' + t_name + ".tmpl"
			print(fullPath)
			# format data 
			json_string = json.dumps(data, indent=4)
			# save data to file					
			with open(fullPath, 'w') as f:
				f.write(json_string)

			self.rigTemplatesMenuUpdate()

		elif action == 'rig_load':
			# read data
			with open(self.rootPath + '/templates/rigs/' + tName + '.tmpl', mode='r') as f:
				data = json.load(f)

				if forceData:
					data = forceData

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

				try:
					self.rig.delete()
				except:
					pass

				self.twistClass.twists = {}
				self.win.twists_listWidget.clear()

				rigName = self.rig.name
				self.create_rig(data['name'])

				# create modules
				if print_main_messages: print(
				    " -------------------------------- LOAD MODULES ------------------------------------------------ ")
				modulesData = []
				mirroredModulesData = []
				for mData in data['modulesData']:
					if mData['opposite']:
						mirroredModulesData.append([m, mData])
					else:
						m = self.addModule(mData['type'], name=mData['name'], options=mData['optionsData'],
						                   updateUI=False)
						for p in mData['posersMatrixData']:
							if p == "MODNAME_mainPoser":
								mat = mData['posersMatrixData'][p]
								p_name = utils.getRealNameFromTemplated(m.name, p)
								cmds.xform(p_name, m=mat, ws=1)
						modulesData.append([m, mData])
					cmds.progressBar(progressControl, edit=True, step=1)
				# moduleLoad(mData)
				cmds.progressBar(progressControl2, edit=True, step=1)

				# turn off hierarhy connections
				# hierarhy_state = self.win.actionPosers_Hierarhy.isChecked()
				# self.action_posersHierarhy(False)					

				if print_main_messages: print(
				    " -------------------------------- SET MODULES ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load modules data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					# print 22222, self.curModule.name
					self.curModule.setData(mData[1], sym=False, namingForce=True)
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- SET ADD CONTROLS DATA ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load add controls data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in data['modulesData']:
					self.setAddControlsData(mData)
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- CONNECT MODULES ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load modules data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					connectToParent(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- MIRROR MODULES ------------------------------------------------ ")
				cmds.window(window, e=1, t='Create mirror modules')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in data['modulesData']:
					if mData['symmetrical']:
						# print 1000, mData['name']
						# if mData['name'] != "l_leg":
						# continue
						self.makeSymmetryModule(mData['name'], updateUI=False)
						cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- SET Parents DATA ------------------------------------------------ ")
				# load oss data
				cmds.window(window, e=1, t='Load parents data')
				cmds.progressBar(progressControl, e=1, progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					loadParents(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- Snap To Parents End Joint DATA ------------------------------------------------ ")
				# load oss data
				cmds.window(window, e=1, t='Load snap to parents ends data')
				cmds.progressBar(progressControl, e=1, progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					snapToParentsEnd(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				# restore hierarhy connections
				# self.action_posersHierarhy(hierarhy_state)

				# update joints placement
				cmds.refresh()

				if print_main_messages: print(
				    " -------------------------------- TWISTS ------------------------------------------------ ")
				cmds.window(window, e=1, t='Load twists data')
				cmds.progressBar(progressControl, e=1, progress=0)

				# for mData in data['modulesData']:	
				for mData in modulesData:
					m = mData[0]
					for twData in mData[1]['twistsData']:
						# print "Rig load ADD TWIST Start ------------" , twData['name']
						real_data = []
						real_data = twData
						m_name = m.name
						real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
						real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
						real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
						# print real_data['name'], real_data['start_j']
						self.twistClass.twists_add(real_data)
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- SET ATTRIBUTES ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load modules data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					setAddAttributes(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)
				cmds.progressBar(progressControl2, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- END ------------------------------------------------ ")

				# delete progress window
				cmds.deleteUI(window)

				# sets
				# self.sets.templActions('clear')
				# self.sets.templActions('load', data=data['sets'])

				cmds.select(clear=1)

			# fix joints placement (update)
			for m_name in self.rig.modules:
				m = self.rig.modules[m_name]
				# if m.type == 'bend':
				# cmds.setAttr(m_name+'_0_skinJoint.tz', 0)

				c = utils.getControlNameFromInternal(m_name, 'posCtrl')
				if c != None and cmds.objExists(c):
					cmds.setAttr(c + '.tx', 0)
				# break

			# return rig name
			self.rig.rename(rigName)
			self.rigPage_update()

			# update ui
			self.updateModulePage(self.curModuleName)

			cmds.select(clear=1)

		elif action == 'compound_save':

			if not full:
				QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
				return

			t_name = QtWidgets.QFileDialog.getSaveFileName(self.win, "Save compound module",
			                                               self.rootPath + '/templates/compoundModules', "*.ctmpl")[0]

			if t_name == "":
				return

			data = {}
			modulesData = []

			if len(self.rig.moduleNames) == 0:
				cmds.warning("No modules")
				return

			# create progress window
			# window = cmds.window(t='Save modules')
			# cmds.columnLayout()
			# progressControl = cmds.progressBar(maxValue=len(self.rig.moduleNames)-1, width=300)		
			# cmds.showWindow( window )

			# collect data for current module and his children
			for name in self.rig.moduleNames:
				m = self.rig.modules[name]

				# print name, m.parent
				if haveParent(self.curModuleName, m.name) or name == self.curModuleName:
					mData = m.getData()
					modulesData.append(mData)

				# cmds.progressBar(progressControl, edit=True, step=1)

			# delete progress window
			# cmds.deleteUI(window)

			data['type'] = 'compound_module'
			data['name'] = self.curModuleName
			data['modulesData'] = modulesData
			# data['sets'] = self.sets.getData()

			# print t_name
			# format data 
			json_string = json.dumps(data, indent=4)
			# save data to file					
			with open(t_name, 'w') as f:
				f.write(json_string)

			self.compoundModuleMenuUpdate()

		elif action == 'compound_load':
			# read data
			with open(tName, mode='r') as f:
				data = json.load(f)

				# for mData in data['modulesData']:
				# incrementData(mData)
				# return				

				# create progress window
				window = cmds.window(t='Import modules')
				cmds.columnLayout()
				if len(data['modulesData']) > 1:
					progressControl = cmds.progressBar(maxValue=len(data['modulesData']) - 1, width=300)
				else:
					progressControl = cmds.progressBar(maxValue=1, width=300)
				cmds.showWindow(window)

				# self.twistClass.twists = {}
				# self.win.twists_listWidget.clear()

				# create modules
				if print_main_messages:    print(
				    " -------------------------------- LOAD MODULES ------------------------------------------------ ")
				modulesData = []
				root_module_name = None
				mirroredModulesData = []
				for mData in data['modulesData']:
					if mData['opposite']:
						mirroredModulesData.append([m, mData])
					else:
						name = mData['name']
						old_name = name
						while cmds.objExists(name + '_mod'):
							name = utils.incrementName(name)
						new_name = name
						renamedModules[old_name] = new_name
						m = self.addModule(mData['type'], name=name, options=mData['optionsData'])
						modulesData.append([m, mData])
						# correct moduleName in data
						mData["name"] = new_name

						if mData['parent'] == None:
							root_module_name = name

					cmds.progressBar(progressControl, edit=True, step=1)
				# moduleLoad(mData)

				# turn off hierarhy connections
				# hierarhy_state = self.win.actionPosers_Hierarhy.isChecked()
				# self.action_posersHierarhy(False)					

				if print_main_messages: print(
				    " -------------------------------- SET ADD CONTROLS DATA ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load add controls data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in modulesData:
					self.setAddControlsData(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- SET MODULES ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load modules data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					connectToParent(mData[1])
					self.curModule.setData(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- MIRROR MODULES ------------------------------------------------ ")
				for mData in data['modulesData']:
					if mData['symmetrical']:
						# print 000, mData['name']
						self.makeSymmetryModule(mData['name'])

				if print_main_messages: print(
				    " -------------------------------- SET Parents DATA ------------------------------------------------ ")
				# load oss data
				cmds.window(window, e=1, t='Load parents data')
				cmds.progressBar(progressControl, e=1, progress=0)
				for mData in modulesData:
					m = mData[0]
					os_data = mData[1]["parents"]
					for d in os_data:
						# print " ------------------------"
						if d["moduleName"] in renamedModules:
							new_name = renamedModules[d["moduleName"]]
							# print "!!!", d["moduleName"], new_name
							d["moduleName"] = new_name
						# for t in d["targetModules"]:
						for i, t in enumerate(d["targetModules"]):
							if t in renamedModules:
								new_name = renamedModules[t]
								# print "!!!", t, new_name
								d["targetModules"][i] = new_name
					# for dd in d:
					# print dd, d[dd]
					loadParents(mData[1])
					cmds.progressBar(progressControl, edit=True, step=1)

				if print_main_messages: print(
				    " -------------------------------- Last SET Data MODULES ------------------------------------------------ ")
				# load modules data
				cmds.window(window, e=1, t='Load modules data')
				cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
				for mData in modulesData:
					self.curModule = mData[0]
					self.curModule.setData(mData[1])

				if print_main_messages: print(
				    " -------------------------------- END ------------------------------------------------ ")

				# restore hierarhy connections
				# self.action_posersHierarhy(hierarhy_state)

				# update joints placement
				cmds.refresh()

				cmds.window(window, e=1, t='Load twists data')
				cmds.progressBar(progressControl, e=1, progress=0)

				# add twists !!!!!!!!!!!!!!!!! NEED TO ADD SET TWISTS CONTROLS ATTR
				for mData in modulesData:
					m = mData[0]
					for twData in mData[1]['twistsData']:
						# print "Rig load ADD TWIST Start ------------" , twData['name']
						real_data = []
						real_data = twData
						m_name = m.name
						real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
						real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
						real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
						# print real_data['name'], real_data['start_j']
						self.twistClass.twists_add(real_data)

					# for mData in data['modulesData']:	
					# for twData in mData['twistsData']:
					# print "Rig load ADD TWIST Start ------------" , twData['name']
					# tw = self.twistClass.twists_add(twData, mirror=False)		
					# print "Rig load ADD TWIST End" 
					cmds.progressBar(progressControl, edit=True, step=1)

				# delete progress window
				cmds.deleteUI(window)

				# sets
				# self.sets.templActions('clear')
				# self.sets.templActions('load', data=data['sets'])

				if root_module_name:
					cmds.select(root_module_name + "_mainPoser")

			# fix joints placement (update)
			for m_name in self.rig.modules:
				m = self.rig.modules[m_name]
				# if m.type == 'bend':
				# cmds.setAttr(m_name+'_0_skinJoint.tz', 0)

				c = utils.getControlNameFromInternal(m_name, 'posCtrl')
				if c != None and cmds.objExists(c):
					cmds.setAttr(c + '.tx', 0)
				# break

			# update ui
			self.updateModulesTree()
			self.updateModulePage(self.curModuleName)
			self.addControls_updateTree()

		elif action == 'compound_delete':
			# print tName
			os.remove(tName)
			self.compoundModuleMenuUpdate()

			print("Template file %s was deleted" % tName)

		elif action == 'delete':
			path = self.rootPath + '/templates/modules/' + self.curModule.type + '_' + tName + '.tmpl'
			os.remove(path)
			self.moduleTemplatesMenuUpdate()

			print("Template file %s was deleted" % tName)

		elif action == 'delete_rig':
			path = self.rootPath + '/templates/rigs/' + tName + '.tmpl'
			os.remove(path)
			self.rigTemplatesMenuUpdate()

			print("Template file %s was deleted" % tName)

		elif action == 'delete_shape':
			del self.controlShapes_data[tName]

			json_string = json.dumps(self.controlShapes_data, indent=4)
			with open(self.rootPath + '/controlShapes.cmds', 'w') as f:
				f.write(json_string)

			self.controlShapesUpdate()

			print("Template file %s was deleted" % tName)

