import maya.cmds as cmds

from ... import utils, module

class Fingers(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.main = None
		self.w = None
		
	def connect(self, target, opposite=False):
		targetModuleName = utils.getModuleName(target)
		target_modType = utils.getModuleTypeFromAttr(target)
		if target_modType == 'limb':
			target = targetModuleName+"_end_out"
			ctrl = utils.getControlNameFromInternal(targetModuleName, 'ik_end')
			cmds.setAttr(ctrl+'.tx', 0)

		super(self.__class__, self).connect(target, opposite)
		
		if target_modType == 'limb':
			self.makeSeamless(True)

	def disconnect(self):
		# the thumb parent locator lives inside a joint of another module,
		# so it has to come back home before the modules are separated
		self.disconnectThumbParent(self.name)

		super(self.__class__, self).disconnect()

	def connectSignals(self, mainInstance, w):
		self.w = w
		self.main = mainInstance

		w.setThumbParent_btn.clicked.connect(self.setThumbParent)
		w.reset_btn.clicked.connect(self.resetThumbParent)

		# w.rebuild_btn.clicked.connect(self.rebuild)
		# w.addSDKGroup_btn.clicked.connect(self.addSDKGroup)
	
	def rebuild(self):
		module = self.main.curModule
		
		def switch(name, w):
			v = w.isChecked()
			
			if name == "thumb":
				cmds.setAttr(self.name+"_%sFinger_1_skinJoint.v" %name, v)	
			else:
				cmds.setAttr(self.name+"_%s_root_skinJoint.v" %name, v)	
				cmds.setAttr(self.name+"_%sFingerRoot_poser.lodVisibility" %name, v)	
				cmds.setAttr(self.name+"_%sFingerRoot_line.v" %name, v)	
			cmds.setAttr(self.name+"_%sFinger_mainPoser.lodVisibility" %name, v)
			cmds.setAttr(self.name+"_%sFingerA_line.lodVisibility" %name, v)
			cmds.setAttr(self.name+"_%sFingerB_line.lodVisibility" %name, v)
			cmds.setAttr(self.name+"_%sFingerC_line.lodVisibility" %name, v)
			cmds.setAttr(self.name+"_%sFingerD_line.lodVisibility" %name, v)
			
		switch("thumb", self.w.thumb_checkBox)
		switch("index", self.w.index_checkBox)
		switch("middle", self.w.middle_checkBox)
		switch("ring", self.w.ring_checkBox)
		switch("pinky", self.w.pinky_checkBox)

		# clench
		if self.w.pinky_checkBox.isChecked() and ( self.w.ring_checkBox.isChecked() or self.w.middle_checkBox.isChecked() ):
			cmds.setAttr(self.name+"_clench_group.v", 1)
		else:
			cmds.setAttr(self.name+"_clench_group.v", 0)
			
		cmds.setAttr(self.name+"_ring_pairBlend.weight", self.w.ring_spinBox.value())
		cmds.setAttr(self.name+"_middle_pairBlend.weight", self.w.middle_spinBox.value())
			
	# ---------------------------------------------------------------- thumb parent

	def thumbParentNodes(self, m_name): #
		return {
			'loc':         m_name + "_thumb_parent_loc",
			'target':      m_name + "_thumb_target_loc",
			'targetMat':   m_name + "_thumb_target_loc_multMat",
			'parentMat':   m_name + "_thumbFinger_parent_multMat",
			'noParentMat': m_name + "_thumbFinger_no_parent_multMat",
			'decMat':      m_name + "_thumbFinger_1_group_decMat",
			'input':       m_name + "_input",
			'controls':    m_name + "_controls",
		}

	def getThumbParentNodes(self, m_name, warn=False): #
		nodes = self.thumbParentNodes(m_name)
		for n in nodes:
			if not cmds.objExists(nodes[n]):
				if warn:
					cmds.warning("fingers - cannot find "+nodes[n]+", the module is built from an old version")
				return None
		return nodes

	def connectIfNeeded(self, source, destination): #
		# connectAttr warns when the connection is already there
		if not cmds.isConnected(source, destination):
			cmds.connectAttr(source, destination, f=1)

	def getThumbParent(self, m_name=None): #
		# the parent joint is the object the thumb_parent_loc is placed into
		if not m_name:
			m_name = self.name

		loc = m_name + "_thumb_parent_loc"
		if not cmds.objExists(loc):
			return None

		parent = cmds.listRelatives(loc, parent=1) or []
		if not parent or parent[0] == m_name + "_input":
			return None

		return parent[0]

	def connectThumbParent(self, m_name, joint): #
		nodes = self.getThumbParentNodes(m_name, warn=True)
		if not nodes:
			return False

		if not cmds.objExists(joint):
			cmds.warning("fingers - cannot find the parent joint "+joint)
			return False

		initLoc = joint.replace("outJoint", "initLoc")
		if not cmds.objExists(initLoc):
			cmds.warning("fingers - cannot find the init locator "+initLoc)
			return False

		# put the locator into the parent joint and zero it.
		# the right side is mirrored by the negative scale
		scale = -1 if utils.getObjectSide(m_name) == "r" else 1

		parent = cmds.listRelatives(nodes['loc'], parent=1) or []
		if not parent or parent[0] != joint:
			cmds.parent(nodes['loc'], joint)
		cmds.setAttr(nodes['loc']+".translate", 0, 0, 0)
		cmds.setAttr(nodes['loc']+".rotate", 0, 0, 0)
		cmds.setAttr(nodes['loc']+".scale", scale, scale, scale)

		# the target locator keeps the rest offset of the thumb from the parent joint
		self.connectIfNeeded(initLoc+".worldInverseMatrix[0]", nodes['targetMat']+".matrixIn[1]")

		# drive the thumb group by the target locator instead of the poser
		self.connectIfNeeded(nodes['target']+".worldMatrix[0]", nodes['parentMat']+".matrixIn[0]")
		self.connectIfNeeded(nodes['controls']+".worldInverseMatrix[0]", nodes['parentMat']+".matrixIn[1]")
		self.connectIfNeeded(nodes['parentMat']+".matrixSum", nodes['decMat']+".inputMatrix")

		return True

	def disconnectThumbParent(self, m_name, warn=False): #
		nodes = self.getThumbParentNodes(m_name, warn=warn)
		if not nodes:
			return False

		# drive the thumb group by the poser again
		self.connectIfNeeded(nodes['noParentMat']+".matrixSum", nodes['decMat']+".inputMatrix")

		# clear the parent connections
		for attr in [nodes['parentMat']+".matrixIn[0]", nodes['parentMat']+".matrixIn[1]",
					 nodes['targetMat']+".matrixIn[1]"]:
			source = cmds.listConnections(attr, source=1, destination=0, plugs=1) or []
			if source:
				cmds.disconnectAttr(source[0], attr)

		# put the locator back
		parent = cmds.listRelatives(nodes['loc'], parent=1) or []
		if not parent or parent[0] != nodes['input']:
			cmds.parent(nodes['loc'], nodes['input'])
		cmds.setAttr(nodes['loc']+".translate", 0, 0, 0)
		cmds.setAttr(nodes['loc']+".rotate", 0, 0, 0)
		cmds.setAttr(nodes['loc']+".scale", 1, 1, 1)

		return True

	def setThumbParent(self): #
		sel = cmds.ls(sl=1) or []
		if len(sel) != 1:
			cmds.warning("Select one joint to be the parent of the thumb")
			return

		joint = sel[0].replace("skinJoint", "outJoint")
		if not cmds.objExists(joint):
			cmds.warning("Cannot find the out joint "+joint)
			return

		if utils.getModuleName(joint) == self.name:
			cmds.warning("Select a joint from another module")
			return

		cmds.undoInfo(openChunk=True)
		try:
			if not self.connectThumbParent(self.name, joint):
				return

			opp_name = utils.getOpposite(self.name)
			if opp_name != self.name and cmds.objExists(opp_name+"_mod"):
				self.connectThumbParent(opp_name, utils.getOppositeIfExists(joint))
		finally:
			cmds.undoInfo(closeChunk=True)

		self.updateOptionsPage(self.w)

	def resetThumbParent(self): #
		cmds.undoInfo(openChunk=True)
		try:
			self.disconnectThumbParent(self.name, warn=True)

			opp_name = utils.getOpposite(self.name)
			if opp_name != self.name and cmds.objExists(opp_name+"_mod"):
				self.disconnectThumbParent(opp_name)
		finally:
			cmds.undoInfo(closeChunk=True)

		self.updateOptionsPage(self.w)

	# ----------------------------------------------------------------

	def updateOptionsPage(self, w):
		if w:
			try:
				w.thumbParent_lineEdit.setText(self.getThumbParent() or "")
			except RuntimeError:
				# self.w keeps the widget of the page which is already rebuilt
				pass

		# w.thumb_checkBox.setChecked(cmds.getAttr(self.name+"_thumbFinger_1_joint.v"))
		# w.index_checkBox.setChecked(cmds.getAttr(self.name+"_index_root_joint.v"))
		# w.middle_checkBox.setChecked(cmds.getAttr(self.name+"_middle_root_joint.v"))
		# w.ring_checkBox.setChecked(cmds.getAttr(self.name+"_ring_root_joint.v"))
		# w.pinky_checkBox.setChecked(cmds.getAttr(self.name+"_pinky_root_joint.v"))
		
		# w.ring_spinBox.setValue(cmds.getAttr(self.name+"_ring_pairBlend.weight"))
		# w.middle_spinBox.setValue(cmds.getAttr(self.name+"_middle_pairBlend.weight"))
		pass

	def getData(self):
		data = super(self.__class__, self).getData()
		
		optionsData = {}
		
		optionsData['thumb'] = cmds.getAttr(self.name+"_thumbFinger_1_skinJoint.v")
		optionsData['index'] = cmds.getAttr(self.name+"_indexFingerRoot_skinJoint.v")
		optionsData['middle'] = cmds.getAttr(self.name+"_middleFingerRoot_skinJoint.v")
		optionsData['ring'] = cmds.getAttr(self.name+"_ringFingerRoot_skinJoint.v")
		optionsData['pinky'] = cmds.getAttr(self.name+"_pinkyFingerRoot_skinJoint.v")
		# the module name is saved separately, so the loading does not have to guess
		# where the module name ends in the joint name (both are joined by "_")
		thumbParent = self.getThumbParent()
		optionsData['thumbParent'] = thumbParent
		optionsData['thumbParentModule'] = utils.getModuleName(thumbParent) if thumbParent else None
		# optionsData['middle_value'] = cmds.getAttr(self.name+"_middle_pairBlend.weight")
		# optionsData['ring_value'] = cmds.getAttr(self.name+"_ring_pairBlend.weight")
		
		data['optionsData'] = optionsData	

		return data	
	
	def setOptions(self, options):
		name = self.name
		opp_name = utils.getOpposite(self.name)
		
		def switch(m_name, name, v, opp=False):
			if name == "thumb":
				cmds.setAttr(m_name+"_%sFinger_1_skinJoint.v" %name, v)	
			else:
				cmds.setAttr(m_name+"_%sFingerRoot_skinJoint.v" %name, v)	
				cmds.setAttr(m_name+"_%sFingerRoot_poser.lodVisibility" %name, v)
				# cmds.setAttr(m_name+"_%sFingerRoot_line.v" %name, v)
			cmds.setAttr(m_name+"_%sFinger_mainPoser.lodVisibility" %name, v)
			# cmds.setAttr(m_name+"_%sFingerA_line.lodVisibility" %name, v)
			# cmds.setAttr(m_name+"_%sFingerB_line.lodVisibility" %name, v)
			# cmds.setAttr(m_name+"_%sFingerC_line.lodVisibility" %name, v)
			# cmds.setAttr(m_name+"_%sFingerD_line.lodVisibility" %name, v)
		
		if "thumb" in options:
			switch(name, "thumb", options["thumb"])
			switch(name, "index", options["index"])
			switch(name, "middle", options["middle"])
			switch(name, "ring", options["ring"])
			switch(name, "pinky", options["pinky"])
		
			# clench
			v = options["pinky"] and ( options["ring"] or options["middle"] )
			clench_ctrl = utils.getControlNameFromInternal(self.name, 'clench')
			cmds.setAttr("%s_group.v" %(clench_ctrl), v)
	
			# cmds.setAttr(self.name+"_ring_pairBlend.weight", options["ring_value"])
			# cmds.setAttr(self.name+"_middle_pairBlend.weight", options["middle_value"])
			
			if cmds.objExists(opp_name):
				switch(opp_name, "thumb", options["thumb"], True)
				switch(opp_name, "index", options["index"], True)
				switch(opp_name, "middle", options["middle"], True)
				switch(opp_name, "ring", options["ring"], True)
				switch(opp_name, "pinky", options["pinky"], True)
		
				clench_ctrl = utils.getControlNameFromInternal(opp_name, 'clench')
				cmds.setAttr("%s_group.v" %(clench_ctrl), v)		
		
				# cmds.setAttr(opp_name+"_ring_pairBlend.weight", options["ring_value"])
				# cmds.setAttr(opp_name+"_middle_pairBlend.weight", options["middle_value"])

		if "thumbParent" in options:
			opp_exists = opp_name != name and cmds.objExists(opp_name+"_mod")

			if options["thumbParent"]:
				self.connectThumbParent(name, options["thumbParent"])
				if opp_exists:
					self.connectThumbParent(opp_name, utils.getOppositeIfExists(options["thumbParent"]))
			else:
				self.disconnectThumbParent(name)
				if opp_exists:
					self.disconnectThumbParent(opp_name)

			self.updateOptionsPage(self.w)

	def addSDKGroup(self):
		import pymel.core as pm
		sel = pm.selected()
		if len(sel) == 0 :
			cmds.warning("Select finger control")
			return
		
		for c in sel:
			m_name = utils.getModuleNameFromAttr(c.name())
			if m_name != self.name and m_name != utils.getOppositeObject(self.name):
				cmds.warning("Select control from current module")
				return			
	
			mmat = c.matrix.outputs()[0]
			
			count = 0
			for i in range(100):
				if mmat.matrixIn[i].inputs():
					count += 1
				else:
					break
			
			name = c.name() + "_sdkGroup"
			suffix = name.split('_')[-1]
			if suffix.isdigit():
				rootName = name[:-len(suffix)-1]
			else:
				suffix = ""
				rootName = name	
			
			while cmds.objExists(name):
				suffix = name.split('_')[-1]
				if suffix.isdigit():
					name = rootName + '_' + str( int(suffix) + 1 )
				else:
					name += '_2'
			
			compm = mmat.matrixIn[count-1].inputs()[0]
			compm.outputMatrix >> mmat.matrixIn[count]
			for i in reversed(range(1, count-1)):
				gr = mmat.matrixIn[i].inputs()[0]
				gr.matrix >> mmat.matrixIn[i+1]
			
			p = c.getParent()
			gr = pm.group(c, n=name)
			pm.xform(os=1, piv=(0,0,0))
			gr.matrix >> mmat.matrixIn[1]	
		
		pm.select(sel)
