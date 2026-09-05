import maya.cmds as cmds
import logging, traceback, math, os, sys
from functools import partial

from ... import utils, module

class LimbMll(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.widget = None

	def loadPlugin(self):
		"""Загружает pk_rigNodes.mll, собранный под текущую версию Maya."""
		if "pk_rigNodes" not in (cmds.pluginInfo(q=1, listPlugins=1) or []):
			mayaVersion = cmds.about(v=True).split(" ")[0]
			path = os.path.join(module.rootPath, "plugins", "plug-ins",
								mayaVersion, "pk_rigNodes.mll")

			if not os.path.isfile(path):
				cmds.warning("pk_rigNodes.mll is not built for Maya %s - %s"
							 %(mayaVersion, path))
				return False

			cmds.loadPlugin(path)
			if "pk_rigNodes" not in (cmds.pluginInfo(q=1, listPlugins=1) or []):
				return False

		# та же ловушка, что у pk_twist и pk_ibtw: выгрузка плагина при живых
		# нодах оставляет тип пустой заглушкой, и нода приходит без единого
		# атрибута вместо ошибки
		try:
			healthy = cmds.attributeQuery("fkElbowAutoTwist", type="pk_limbIk", exists=True)
		except RuntimeError:
			healthy = False

		if not healthy:
			cmds.warning(" pk_limbIk is registered without its attributes - restart Maya. "
						 "The plugin was unloaded while its nodes were still in the scene.")
			return False

		return True

	def create(self, options={}):
		# Плагин грузится ДО импорта .ma. В файле стоит
		# requires -nodeType "pk_limbIk" "pk_rigNodes", но искать его Maya будет
		# по MAYA_PLUG_IN_PATH, а он лежит внутри rigStudio. Не найдя типа, Maya
		# подменит солвер unknown-нодой и молча выбросит все его связи - модуль
		# соберётся с виду целым и не будет работать.
		if not self.loadPlugin():
			cmds.warning("%s is not created: pk_rigNodes is not available" %self.name)
			return

		return super(self.__class__, self).create(options)

	def load(self):
		super(self.__class__, self).load()

		# Сцену могли открыть без плагина: тогда Maya уже подменила солвер
		# unknown-нодой и выбросила его связи. Загружать плагин здесь поздно -
		# связи не вернутся, - но молча отдавать неработающую руку хуже.
		solver = self.name+"_pkIk_solver"
		if not cmds.objExists(solver):
			cmds.warning(" Missed "+solver+" - the limb has no solver")
		elif cmds.objectType(solver) == "unknown":
			cmds.warning(" "+solver+" came in as an unknown node: the scene was "
						 "opened without pk_rigNodes. Load the plugin and open it again.")

	def connect(self, target, opposite=False):
		super(self.__class__, self).connect(target, opposite)

	def delete(self):
		# Ноды вне группы модуля: с self.root они не уйдут. final_length_factor
		# в этом модуле нет - растяжение считает солвер.
		for n in ('_rootEnd_vectorNormalized', '_cosAngle_bewtweenVectors',
				  '_middleOut_vectorNormalized'):
			if cmds.objExists(self.name+n):
				cmds.delete(self.name+n)

		super(self.__class__, self).delete()
			
	def connectSignals(self, main, w):
		module = main.curModule
		opp_module = main.rig.getMirroredModule(module)
		# w.swapEndOrient_btn.clicked.connect(partial(self.swapEndPose, main, opp_module))
		# w.addMiddleTwistOffsetControl_btn.clicked.connect(self.addMiddleTwistOffsetControl)
		w.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)
		w.ikSymmetry_checkBox.clicked.connect(partial(self.ikSymmetryToggle, w))

	def updateOptionsPage(self, w):
		w.aimDistance_spinBox.setValue(cmds.getAttr(self.name+"_mod.aim_offset"))
		self.widget = w

		w.ikSymmetry_checkBox.setChecked(self.getOptions()['ikSymmetry'])

	def setMirrored(self):
		# fix joint positions (Update)
		oppModuleName = utils.getOppositeObject(self.name)
		cmds.setAttr(oppModuleName+'_ik_hand.tx', 0)
		super(self.__class__, self).setMirrored()

	def swapEndPose(self, main, opp_module):
		l_fk_ctrl = utils.getControlNameFromInternal(self.name, 'fk_end')
		l_ik_ctrl = utils.getControlNameFromInternal(self.name, 'ik_end')
		l_ik_loc = self.name + "_end_pose_loc"
		if opp_module:
			r_fk_ctrl = utils.getControlNameFromInternal(opp_module.name, 'fk_end')
			r_ik_ctrl = utils.getControlNameFromInternal(opp_module.name, 'ik_end')			

		childs = main.rig.getModuleChildren(self.name)
		if len(childs) == 0:
			cmds.warning("Selected module have not child module")
			return
		
		child_name = childs[0]
		child_poser = child_name + '_mainPoser'
		
		rot_local = cmds.xform(l_ik_ctrl, q=1, ro=1)
		
		offset_gr = l_ik_ctrl+"_offset_group"
		offset_fk_gr = l_fk_ctrl+"_offset_group"

		if (-0.01 < rot_local[0] < 0.01 and -0.01 < rot_local[1] < 0.01 and -0.01 < rot_local[2] < 0.01) and not cmds.objExists(offset_gr):
			r = cmds.xform(child_poser, q=1, ro=1, ws=1)
			cmds.xform(child_poser, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(l_ik_ctrl, ro=r, ws=1)
			cmds.xform(l_fk_ctrl, ro=r, ws=1)
			cmds.xform(l_ik_ctrl, ro=r, ws=1)

			if opp_module:
				cmds.setAttr(r_fk_ctrl+'.rx', r[0])
				cmds.setAttr(r_fk_ctrl+'.ry', r[1])
				cmds.setAttr(r_fk_ctrl+'.rz', r[2])
				cmds.setAttr(r_ik_ctrl+'.rx', r[0])
				cmds.setAttr(r_ik_ctrl+'.ry', -r[1])
				cmds.setAttr(r_ik_ctrl+'.rz', -r[2])

			if self.widget.keepZeroAttributes_checkBox.isChecked():
				cmds.group(empty=1, n=offset_gr)
				cmds.group(empty=1, n=offset_fk_gr)
				cmds.parent(offset_gr, l_ik_ctrl)
				cmds.parent(offset_fk_gr, l_fk_ctrl)
				utils.resetAttrs(offset_gr)
				utils.resetAttrs(offset_fk_gr)
				cmds.parent(offset_gr, cmds.listRelatives(l_ik_ctrl, p=1)[0])
				cmds.parent(offset_fk_gr, cmds.listRelatives(l_fk_ctrl, p=1)[0])
				cmds.parent(l_ik_ctrl, offset_gr)
				cmds.parent(l_fk_ctrl, offset_fk_gr)

				if opp_module:
					offset_gr = r_ik_ctrl+"_offset_group"
					cmds.group(empty=1, n=offset_gr)
					cmds.parent(offset_gr, r_ik_ctrl)
					utils.resetAttrs(offset_gr)
					cmds.parent(offset_gr, cmds.listRelatives(r_ik_ctrl, p=1)[0])
					cmds.parent(r_ik_ctrl, offset_gr)

					offset_gr = r_fk_ctrl+"_offset_group"
					cmds.group(empty=1, n=offset_gr)
					cmds.parent(offset_gr, r_fk_ctrl)
					utils.resetAttrs(offset_gr)
					cmds.parent(offset_gr, cmds.listRelatives(r_fk_ctrl, p=1)[0])
					cmds.parent(r_fk_ctrl, offset_gr)

		else:
			r = cmds.xform(l_ik_ctrl, q=1, ro=1, ws=1)
			cmds.xform(l_ik_ctrl, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(l_fk_ctrl, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(l_ik_ctrl, ro=[0.0, 0.0, 0.0], ws=1)
			cmds.xform(child_poser, ro=r, ws=1)

			if opp_module:
				cmds.setAttr(r_fk_ctrl+'.rx', 0)
				cmds.setAttr(r_fk_ctrl+'.ry', 0)
				cmds.setAttr(r_fk_ctrl+'.rz', 0)
				cmds.setAttr(r_ik_ctrl+'.rx', 0)
				cmds.setAttr(r_ik_ctrl+'.ry', 0)
				cmds.setAttr(r_ik_ctrl+'.rz', 0)

			if cmds.objExists(offset_gr):
				cmds.parent(l_ik_ctrl, cmds.listRelatives(offset_gr, p=1)[0])
				utils.resetAttrs(l_ik_ctrl)
				cmds.delete(offset_gr)
				cmds.parent(l_fk_ctrl, cmds.listRelatives(offset_fk_gr, p=1)[0])
				utils.resetAttrs(l_fk_ctrl)
				cmds.delete(offset_fk_gr)

				offset_gr = r_ik_ctrl+"_offset_group"
				if cmds.objExists(offset_gr):
					cmds.parent(r_ik_ctrl, cmds.listRelatives(offset_gr, p=1)[0])
					utils.resetAttrs(r_ik_ctrl)
					cmds.delete(offset_gr)

				offset_gr = r_fk_ctrl+"_offset_group"
				if cmds.objExists(offset_gr):
					cmds.parent(r_fk_ctrl, cmds.listRelatives(offset_gr, p=1)[0])
					utils.resetAttrs(r_fk_ctrl)
					cmds.delete(offset_gr)

	def addMiddleTwistOffsetControl(self):
		if self.name.split("_")[0] == 'r':
			return

		opp_name = utils.getOppositeObject(self.name)

		tw_joints = []
		for o in cmds.listRelatives('twists') or []:
			tw_joints.append(o.split("_mod")[0])		

		# root connections
		if cmds.objExists(self.name+'_root_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_root_twist_0_joint', allDescendents=1) + [self.name+'_root_twist_0_joint']
			if not cmds.isConnected(self.name+'_root_volume_outJoint.s', tw_js[0]+'.s'):
				
				if self.name+"_root" in tw_joints:
					
					# connect twist to control
					c = self.name+"_middleOffset"
					c_ins = utils.getControlInstance(c)
		
					if cmds.listRelatives(self.name+"_root_end_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_root_end_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_root_end_connectorLoc", utils.getOppositeObject(c))
					
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_root_volume_outJoint.s', j+'.s', f=1)			
					
					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_root_twist_0_joint')
						tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
						for j in tw_js:
							cmds.connectAttr(utils.getOppositeObject(self.name+'_root_volume_outJoint.s'), j+'.s', f=1)					
							
						cmds.showHidden(utils.getOppositeObject(self.name+'_middleOffset'))
							
					cmds.showHidden(self.name+'_middleOffset')

		# middle connections			
		if cmds.objExists(self.name+'_middle_twist_0_joint'):	
			tw_js = cmds.listRelatives(self.name+'_middle_twist_0_joint', allDescendents=1) + [self.name+'_middle_twist_0_joint']
			if not cmds.isConnected(self.name+'_middle_volume_outJoint.s', tw_js[0]+'.s'):					
				
				if self.name+"_middle" in tw_joints:
					
					# connect twist to control
					c = self.name+"_middleOffset"
					c_ins = utils.getControlInstance(c)					
					
					if cmds.listRelatives(self.name+"_middle_root_connectorLoc", p=1)[0] != c:
						cmds.parent(self.name+"_middle_root_connectorLoc", c)
						if self.symmetrical:
							cmds.parent(opp_name+"_middle_root_connectorLoc", utils.getOppositeObject(c))
		
					# connect volume joints		
					for j in tw_js:
						cmds.connectAttr(self.name+'_middle_volume_outJoint.s', j+'.s', f=1)		

					if self.symmetrical:
						j_root = utils.getOppositeObject(self.name+'_middle_twist_0_joint')	
						tw_js = cmds.listRelatives(j_root, allDescendents=1) + [j_root]
						for j in tw_js:
							cmds.connectAttr(utils.getOppositeObject(self.name+'_middle_volume_outJoint.s'), j+'.s', f=1)

	def update_aim_distance(self, v=None):
		def setValue(v):
			cmds.setAttr(self.name+"_mod.aim_offset", v)
			if self.symmetrical:
				opp_mod = utils.getOpposite(self.name+"_mod")
				cmds.setAttr(opp_mod+".aim_offset", v)

		if v:
			setValue(v)
		else:
			try: # fix error "C++ object already deleted"
				if not self.widget:
					return
				if not v:
					v = self.widget.aimDistance_spinBox.value()
					setValue(v)
			except:
				pass

	def bake(self):
		super(self.__class__, self).bake(addObjects=[self.name+"_ik_connector"])

	def getData(self):
		data = super(self.__class__, self).getData()
		
		optionsData = self.getOptions()
		
		data['optionsData'] = optionsData	

		return data	

	def getOptions(self):
		optionsData = {}
		optionsData['aimDistance'] = cmds.getAttr(self.name+"_mod.aim_offset")
		optionsData['ikSymmetry'] = cmds.getAttr(self.name+"_mod.ikSymmetryBehaviour")
		return optionsData
	
	def setOptions(self, optionsData):
		# old templates may store optionsData as a bool (no options dict yet)
		if not isinstance(optionsData, dict):
			optionsData = {}
		if 'aimDistance' in optionsData:
			self.update_aim_distance(optionsData['aimDistance'])
		self.ikSymmetryToggle(set=True, v=optionsData.get('ikSymmetry', False))
	
	def twistOverride(self, t_name, data):
		if t_name == self.name+"_root":
			cmds.parent(t_name+'_end_connectorLoc', self.name+'_middleOffset')
			cmds.connectAttr(self.name+"_middleOffset.worldMatrix[0]", t_name+"_aimMatrix.primaryTargetMatrix", f=1)

		elif t_name == self.name+"_middle":
			# middleTwistAim задаёт ориентацию твиста предплечья. В limbMll он
			# удалён вместе со штатной обвязкой, хотя к солверу отношения не
			# имел - без него твист середины останется на своей ориентации.
			aim = self.name+"_middleTwistAim"
			if cmds.objExists(aim):
				cmds.connectAttr(aim+".worldMatrix[0]", t_name+"_aimMatrix.inputMatrix", f=1)
			else:
				cmds.warning(" Missed "+aim+" - middle twist keeps its own orientation")

		if self.opposite:
			if t_name == self.name+"_root":
				cmds.setAttr(t_name+'_rootUpLoc.s', 1, 1, -1)
				cmds.setAttr(t_name+'_end_connectorLoc.s', 1, 1, 1)
			elif t_name == self.name+"_middle":
				cmds.setAttr(t_name+'_rootUpLoc.s', 1, 1, -1)
				cmds.setAttr(t_name+'_end_connectorLoc.s', 1, 1, -1)

	def ibtwOverride(self, name):
		if name == self.name + "_middle_twist_0" :
			cmds.connectAttr(self.name+"_middleOffset.worldMatrix[0]", self.name+"_middle_twist_0_ibtw_joints_group_multMat.matrixIn[0]", f=1)

	def ikSymmetryToggle(self, w=None, set=False, v=False):
		if not set:
			v = not cmds.getAttr(self.name+"_mod.ikSymmetryBehaviour")
		
		cmds.setAttr(self.name+"_mod.ikSymmetryBehaviour", v)
		opp_mod = utils.getOppositeIfExists(self.name+"_mod")
		cmds.setAttr(opp_mod+".ikSymmetryBehaviour", v)

		if w:
			self.updateOptionsPage(w)			