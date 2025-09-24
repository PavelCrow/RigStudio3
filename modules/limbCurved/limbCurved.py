import maya.cmds as cmds
import logging, traceback, sys
from functools import partial
import pymel.core as pm

from ... import utils, module

logger = logging.getLogger(__name__)
logger.setLevel(logging.INFO)
#logger.setLevel(logging.DEBUG)

def oneStepUndo(func):
	def wrapper(*args, **kwargs):
		cmds.undoInfo(openChunk=True)
		func(*args, **kwargs)
		cmds.undoInfo(closeChunk=True)
	return wrapper


class LimbCurved(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()
		logger.debug(traceback.extract_stack()[-1][2])

		self.name = name 
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.widget = None

	def connect(self, target, opposite=False):
		super(self.__class__, self).connect(target, opposite)
		return
		ext = target.split("_")[-1]
		outJoint = target[:-len(ext)] + "outJoint"		
		#cmds.connectAttr( outJoint+'.worldMatrix', self.name+"_ikHandle1.dWorldUpMatrix", f=1)
		par = cmds.group(n=self.name+'_startEulerGroup', empty=1)
		utils.addModuleNameAttr(par, self.name)
		cmds.parent(par, self.name+'_root_outJoint')
		utils.resetAttrs(par)
		cmds.parent(par, outJoint)
		cmds.parent(self.name+"_startEulerLoc", par)
		con = cmds.pointConstraint(self.name+"_startEulerLoc", self.name+"_root_joint", mo=0)
		cmds.delete(con)

	def disconnect(self):
		super(self.__class__, self).disconnect()

	def delete(self):
		cmds.delete(self.name+'_rootEnd_vectorNormalized')
		cmds.delete(self.name+'_cosAngle_bewtweenVectors')
		cmds.delete(self.name+'_middleOut_vectorNormalized')

		super(self.__class__, self).delete()
			
	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		opp_module = mainInstance.rig.getMirroredModule(module)
		w.swapEndOrient_btn.clicked.connect(partial(self.swapEndPose, mainInstance, opp_module))
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, w))
		w.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)

	def updateOptionsPage(self, w):
		optionsData = self.getOptions()
		w.aimDistance_spinBox.setValue(optionsData['aimDistance'])
		w.jointsCount_spinBox.setValue(optionsData['jointsCount'])
		self.widget = w
		
	def setMirrored(self):
		# fix joint positions (Update)
		oppModuleName = utils.getOppositeObject(self.name)
		cmds.setAttr(oppModuleName+'_ik_hand.tx', 0)
		super(self.__class__, self).setMirrored()

	def swapEndPose(self, mainInstance, opp_module):
		logger.debug(traceback.extract_stack()[-1][2])
		
		l_fk_ctrl = utils.getControlNameFromInternal(self.name, 'fk_end')
		l_ik_ctrl = utils.getControlNameFromInternal(self.name, 'ik_end')
		l_ik_loc = self.name + "_end_pose_loc"
		if opp_module:
			r_fk_ctrl = utils.getControlNameFromInternal(opp_module.name, 'fk_end')
			r_ik_ctrl = utils.getControlNameFromInternal(opp_module.name, 'ik_end')			
			r_ik_loc = utils.getOppositeObject(l_ik_loc)

		childs = mainInstance.rig.getModuleChildren(self.name)
		if len(childs) == 0:
			cmds.warning("Selected module have not child module")
			return
		
		child_name = childs[0]
		child_poser = child_name + '_root_poser'
		
		rot_local = cmds.xform(l_ik_ctrl, q=1, ro=1)
		
		if -0.01 < rot_local[0] < 0.01 and -0.01 < rot_local[1] < 0.01 and -0.01 < rot_local[2] < 0.01:
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
	
	def getOptions(self):
		optionsData = {}
		optionsData['aimDistance'] = cmds.getAttr(self.name+'_mod.aim_offset')
		optionsData['jointsCount'] = len(cmds.listRelatives(self.name+"_twist_joints"))
		
		return optionsData				

	def getData(self):
		data = super(self.__class__, self).getData()
		optionsData = self.getOptions()
		data['optionsData'] = optionsData	

		return data	
	
	def setOptions(self, optionsData):
		self.update_aim_distance(optionsData['aimDistance'])
		
	@ utils.oneStepUndo
	def rebuildWithNewOptions(self, widget=None, name=None, joints_count=None):
		if not name: 
			name = self.name

		# get children
		children = {}
		for m_name in self.main.rig.getModuleChildren(self.name):
			m = self.main.rig.modules[m_name]
			children[m_name] = [m.parent, m, m.isSeamless()]
			self.main.disconnectModule(m_name)			

		cmds.delete(cmds.listRelatives(name+"_twist_joints"))
		cmds.delete(cmds.ls(name+"_twist_*_mpath"))
		cmds.parent(name+"_end_outJoint", w=1)
		cmds.delete(name+f'_twist_0_outJoint')
		cmds.delete(utils.getOutputNodes(name+"_twist_quatToEuler", "outputRotateX"))
		cmds.delete(name+"_root_skinJoint")
		cmds.setAttr(name+"_root_outJoint.drawStyle", 0)

		if not joints_count:
			joints_count = widget.jointsCount_spinBox.value()

		for i in range(joints_count):
			j = pm.joint(n=name+f'_twist_{i}_joint')
			pm.parent(j, name+"_twist_joints")
			utils.removeTransformParentJoint(j.name())

			sj = pm.joint(n=name+f'_twist_{i}_outJoint')
			if i == 0:
				pm.parent(sj, name+f'_root_outJoint')
				utils.connectByMatrix(sj.name(), [j.name(), name+f'_root_outJoint'], ['worldMatrix[0]', 'worldInverseMatrix[0]'], module_name=name)
			else:
				pm.parent(sj, name+f'_twist_{i-1}_outJoint')
				utils.connectByMatrix(sj.name(), [j.name(), name+f'_twist_{i-1}_outJoint'], ['worldMatrix[0]', 'worldInverseMatrix[0]'], module_name=name)
			utils.removeTransformParentJoint(sj.name())
			sj.drawStyle.set(0)

			sj.jointOrient.set(0,0,0)
			pm.addAttr(sj, ln='pos', at='double', k=1, min=0, max=1)
			
			mp = pm.createNode("motionPath", n=j.replace("joint", "mpath"))
			pm.connectAttr(name+"_final_curveShape.worldSpace[0]", mp.geometryPath)
			mp.fractionMode.set(1)
			mp.worldUpType.set(2)
			pm.connectAttr(name+"_twistUp_startUp_loc.worldMatrix[0]", mp.worldUpMatrix)
			mp.rotate >> j.r
			mp.allCoordinates >> j.translate
			uc = pm.createNode("unitConversion", n=j.replace("joint", "unitConversion"))
			pm.connectAttr(name+"_twist_quatToEuler.outputRotateX", uc.input)
			uc.output >> mp.frontTwist
			sj.pos >> mp.uValue

			sj.pos.set(1.0/(joints_count+1)*(i+1))
			cmds.sets(sj.name(), e=1, forceElement=name+"_nodesSet")
			cmds.sets(mp.name(), e=1, forceElement=name+"_nodesSet")
			cmds.sets(uc.name(), e=1, forceElement=name+"_nodesSet")

		pm.parent(name+"_end_outJoint", name+f'_twist_{joints_count-1}_outJoint')
		utils.removeTransformParentJoint(name+"_end_outJoint")
		utils.resetAttrs(name+"_end_outJoint", jointOrient=True)
		# cmds.parent(name+"_end_skinJoint", w=1)
		# pm.parent(name+"_end_skinJoint", name+f'_twist_{joints_count-1}_outJoint')
		self.addSkinJoints(name)
				
		for i in range(joints_count):
			cmds.connectAttr(name+f'_twist_{i}_skinJoint.pos', name+f'_twist_{i}_outJoint.pos')

		utils.resetAttrs(name+"_end_skinJoint", jointOrient=True)

		if self.symmetrical and utils.getObjectSide(name) == "l":
			opp_name = utils.getOpposite(name)
			self.rebuildWithNewOptions(name=opp_name, joints_count=joints_count)
			cmds.parent(name+"_root_skinJoint", self.parent.replace("outJoint", "skinJoint"))
		else:
			cmds.parent(name+"_root_skinJoint", utils.getOpposite(self.parent).replace("outJoint", "skinJoint"))
		
		utils.removeTransformParentJoint(name+"_root_outJoint")
		utils.resetAttrs(name+"_root_skinJoint", jointOrient=True)
		utils.resetAttrs(name+"_end_skinJoint", jointOrient=True)

		if self.main.rig.singleHierarhy:
			cmds.hide(name+"_outJoints")

		# delete empty transforms in scene root
		all_transforms = cmds.ls("transform*", type="transform", l=1)
		root_transforms = [] 
		for o in all_transforms:
			childs = cmds.listRelatives(o) or []
			if o.count('|') == 1 and childs == []:
				root_transforms.append(o)
		if root_transforms:
			cmds.delete(root_transforms)

		# reconnect children
		for m_name in children:
			if utils.getObjectSide(m_name) != 'r':
				self.main.connectModule(children[m_name][0], m_name)			