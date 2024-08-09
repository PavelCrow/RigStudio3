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

	def connectSignals(self, mainInstance, w):
		self.w = w
		self.main = mainInstance
		
		w.rebuild_btn.clicked.connect(self.rebuild)			
		w.addSDKGroup_btn.clicked.connect(self.addSDKGroup)			
			
	def rebuild(self):
		module = self.main.curModule
		
		def switch(name, w):
			v = w.isChecked()
			
			if name == "thumb":
				cmds.setAttr(self.name+"_%sFinger_1_joint.v" %name, v)	
			else:
				cmds.setAttr(self.name+"_%s_root_joint.v" %name, v)	
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
			
	def updateOptionsPage(self, w):
		w.thumb_checkBox.setChecked(cmds.getAttr(self.name+"_thumbFinger_1_joint.v"))
		w.index_checkBox.setChecked(cmds.getAttr(self.name+"_index_root_joint.v"))
		w.middle_checkBox.setChecked(cmds.getAttr(self.name+"_middle_root_joint.v"))
		w.ring_checkBox.setChecked(cmds.getAttr(self.name+"_ring_root_joint.v"))
		w.pinky_checkBox.setChecked(cmds.getAttr(self.name+"_pinky_root_joint.v"))
		
		w.ring_spinBox.setValue(cmds.getAttr(self.name+"_ring_pairBlend.weight"))
		w.middle_spinBox.setValue(cmds.getAttr(self.name+"_middle_pairBlend.weight"))

	def getData(self):
		data = super(self.__class__, self).getData()
		
		optionsData = {}
		
		optionsData['thumb'] = cmds.getAttr(self.name+"_thumbFinger_1_joint.v")
		optionsData['index'] = cmds.getAttr(self.name+"_index_root_joint.v")
		optionsData['middle'] = cmds.getAttr(self.name+"_middle_root_joint.v")
		optionsData['ring'] = cmds.getAttr(self.name+"_ring_root_joint.v")
		optionsData['pinky'] = cmds.getAttr(self.name+"_pinky_root_joint.v")
		optionsData['middle_value'] = cmds.getAttr(self.name+"_middle_pairBlend.weight")
		optionsData['ring_value'] = cmds.getAttr(self.name+"_ring_pairBlend.weight")
		
		data['optionsData'] = optionsData	

		return data	
	
	def setOptions(self, options):
		name = self.name
		opp_name = utils.getOpposite(self.name)
		
		def switch(m_name, name, v, opp=False):
			if name == "thumb":
				cmds.setAttr(m_name+"_%sFinger_1_joint.v" %name, v)	
			else:
				cmds.setAttr(m_name+"_%s_root_joint.v" %name, v)	
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
	
			cmds.setAttr(self.name+"_ring_pairBlend.weight", options["ring_value"])
			cmds.setAttr(self.name+"_middle_pairBlend.weight", options["middle_value"])
			
			if cmds.objExists(opp_name):
				switch(opp_name, "thumb", options["thumb"], True)
				switch(opp_name, "index", options["index"], True)
				switch(opp_name, "middle", options["middle"], True)
				switch(opp_name, "ring", options["ring"], True)
				switch(opp_name, "pinky", options["pinky"], True)
		
				clench_ctrl = utils.getControlNameFromInternal(opp_name, 'clench')
				cmds.setAttr("%s_group.v" %(clench_ctrl), v)		
		
				cmds.setAttr(opp_name+"_ring_pairBlend.weight", options["ring_value"])
				cmds.setAttr(opp_name+"_middle_pairBlend.weight", options["middle_value"])
			
	def connectOpposite(self):
		super(self.__class__, self).connectOpposite()
		
		side = utils.getObjectSide(self.name)
		if side != 'r':# or not cmds.objExists(opp_name+'_mod'):
			return		

		opp_name = self.name
		name = utils.getOppositeObject(opp_name)		
		#print 111, name, opp_name
		
		try:
			if cmds.objExists(opp_name+"_mod"):
				cmds.connectAttr(name+"_clench_group.v", opp_name+"_clench_group.v")
				cmds.connectAttr(name+"_ring_pairBlend.weight", opp_name+"_ring_pairBlend.weight")
				cmds.connectAttr(name+"_middle_pairBlend.weight", opp_name+"_middle_pairBlend.weight")
		
				for f in ['thumb', 'index', 'middle', 'ring', 'pinky']:
					cmds.connectAttr(name+"_%sFinger_mainPoser.lodVisibility" %f, opp_name+"_%sFinger_mainPoser.lodVisibility" %f)
					cmds.connectAttr(name+"_%sFingerA_line.lodVisibility" %f, opp_name+"_%sFingerA_line.lodVisibility" %f)
					cmds.connectAttr(name+"_%sFingerB_line.lodVisibility" %f, opp_name+"_%sFingerB_line.lodVisibility" %f)
					cmds.connectAttr(name+"_%sFingerC_line.lodVisibility" %f, opp_name+"_%sFingerC_line.lodVisibility" %f)
					cmds.connectAttr(name+"_%sFingerD_line.lodVisibility" %f, opp_name+"_%sFingerD_line.lodVisibility" %f)
					if f == "thumb":
						cmds.connectAttr(name+"_%sFinger_1_joint.v" %f, opp_name+"_%sFinger_1_joint.v" %f)
					else:
						cmds.connectAttr(name+"_%s_root_joint.v" %f, opp_name+"_%s_root_joint.v" %f)
						cmds.connectAttr(name+"_%sFingerRoot_line.v" %f, opp_name+"_%sFingerRoot_line.v" %f)
						cmds.connectAttr(name+"_%sFingerRoot_poser.lodVisibility" %f, opp_name+"_%sFingerRoot_poser.lodVisibility" %f)
		except:
			pass

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