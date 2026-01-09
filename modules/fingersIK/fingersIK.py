import maya.cmds as cmds
import pymel.core as pm

from ... import utils, module

class FingersIK(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.main = None
		self.w = None
		
	def connect(self, target, opposite=False):
		super(self.__class__, self).connect(target, opposite)
		
	
		targetModuleName = utils.getModuleName(target)
		target_module = utils.getModuleInstance(targetModuleName)
		
		target_modType = utils.getModuleTypeFromAttr(target)
		if target_modType == 'limb':

			# connect ikfk attribute
			cmds.connectAttr(utils.getControlNameFromInternal(targetModuleName, 'control')+'.ikFk', self.root+'.ikFk')

			# remove unused connections
			cmds.delete(self.name+"_root_connector_multMat")
			utils.resetAttrs(self.name+'_root_connector', matrix=True)

			# connect self ik 
			cmds.parentConstraint(targetModuleName+"_ik_out", self.name+"_ik_connector", mo=0)

			# connect self fk
			utils.connectByMatrix(self.name+'_fk_connector', [self.name+'_root_poserOrient', targetModuleName+'_end_initLoc', targetModuleName+'_fk_out', self.name+'_fk_connector'], 
						          ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'parentInverseMatrix[0]'], self.name )

			# connect target ik 
			utils.connectByMatrix(targetModuleName+'_ik_connector', [self.name+'_ik_out', targetModuleName+'_ik_connector'], 
						['worldMatrix[0]', 'parentInverseMatrix[0]'], targetModuleName )

			# scale
			utils.connectByMatrix(self.name+'_root_connector', [targetModuleName+'_ik_out', targetModuleName+'_mainPoser'], 
						          ['worldMatrix[0]', 'worldInverseMatrix[0]'], self.name, attrs=['s'] )

			# make seamless only for not symmetry module or for symmetry but after creating opposite module
			if not self.opposite and not self.symmetrical:
				self.makeSeamless(True)

			# opposite fix
			if target_module.isOpposite():
				cmds.setAttr(self.name+"_root_connector.rx", 180)
				cmds.setAttr(self.name+"_root_poserOrient.rx", 180)

		if opposite:
			if not cmds.listConnections(f"{self.name}_thumbFinger_1_closed.t"): # если еще нет связи соединяем
				# соединяем closed и spread
				opp_name = utils.getOpposite(self.name)
				for f in ["thumb", "index", "middle", "ring", "pinky"]:
					for i in range(1, 4):
						cmds.connectAttr(f"{opp_name}_{f}Finger_{i}_closed.t", f"{self.name}_{f}Finger_{i}_closed.t")
						cmds.connectAttr(f"{opp_name}_{f}Finger_{i}_closed.r", f"{self.name}_{f}Finger_{i}_closed.r")
						cmds.connectAttr(f"{opp_name}_{f}Finger_{i}_closed.s", f"{self.name}_{f}Finger_{i}_closed.s")
					cmds.connectAttr(f"{opp_name}_{f}Finger_1_spread.t", f"{self.name}_{f}Finger_1_spread.t")
					cmds.connectAttr(f"{opp_name}_{f}Finger_1_spread.r", f"{self.name}_{f}Finger_1_spread.r")
					cmds.connectAttr(f"{opp_name}_{f}Finger_1_spread.s", f"{self.name}_{f}Finger_1_spread.s")

		
	def disconnect(self):
		out_nodes = pm.PyNode( self.name+"_ik_out").worldMatrix[0].outputs()
		if out_nodes:
			print(111, out_nodes)
			mm = out_nodes[0]
			print(111, mm)
			dm = mm.matrixSum.outputs()[0]
			print(222, dm)
			con = dm.outputTranslateX.outputs()[0]
			print(111, con)
			pm.delete(mm)
			con.t.set(0,0,0)
			con.r.set(0,0,0)
			targetModuleName = utils.getModuleName(con.name)
			cmds.disconnectAttr(utils.getControlNameFromInternal(targetModuleName, 'control')+'.ikFk', self.root+'.ikFk')
		super(self.__class__, self).disconnect()
		
	

	def connectSignals(self, mainInstance, w):
		self.w = w
		self.main = mainInstance
			
	def rebuild(self):
		module = self.main.curModule
			
	def updateOptionsPage(self, w):
		pass

	def getData(self):
		data = super(self.__class__, self).getData()
		
		optionsData = {}
		
		data['optionsData'] = optionsData	

		return data	
	
	def setOptions(self, options):
		name = self.name
		opp_name = utils.getOpposite(self.name)
