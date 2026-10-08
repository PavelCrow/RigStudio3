import maya.cmds as cmds

from ...import utils, module


class Head(module.Module):
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]


	# def create(self, options={}):
	# 	super(self.__class__, self).create(options)	
		
	# 	cmds.setAttr(self.name+"_root_skinJoint.drawStyle", 2)

	def connect(self, target, opposite=False):
		target_module_name = utils.getModuleName(target)
		target_module_type = utils.getModuleTypeFromAttr(target)
		
		if target_module_type == "chainIk":
			childs = cmds.listRelatives(target_module_name+'_outJoints', allDescendents=1, type='joint' )
			jointsCount = len(childs)
			target = "%s_%s_outJoint" %(target_module_name, (jointsCount-1))

			target_poser = utils.getClosestPoser(target_module_name, target)

			int_name = target_poser[len(target_module_name)+1:-6]
			target_control = utils.getControlNameFromInternal(target_module_name, int_name)
			target_control_local = utils.getControlNameFromInternal(target_module_name, "local_"+int_name)

			super().connect(target, opposite, makeSeamless=True)

			cmds.connectAttr(target_control+".worldMatrix[0]", self.name+"_root_connector_multMat.matrixIn[2]", f=1)
			cmds.connectAttr(target_poser+".worldInverseMatrix[0]", self.name+"_root_connector_multMat.matrixIn[1]", f=1)

			control = utils.getControlNameFromInternal(self.name, "root")
			utils.connectToOffsetParentMatrix(target_control_local, [control, target_control], ["worldMatrix[0]", "worldInverseMatrix[0]"])

			cmds.setAttr(target_control+".lodVisibility", 0)
			cmds.setAttr(target_control_local+".lodVisibility", 0)

			self.connectChainTwist(target_module_name, target_control)

		else:
			super().connect(target, opposite)

	def connectChainTwist(self, chain, end_control):
		"""Поворот головы твистит цепочку, к концу которой она подключена.

		Твист chainIk берётся с главных контролов: при autoTwist - сумма их
		rotateX в ikHandle.twist, без него - advanced twist по up-матрицам
		первого и последнего. Конечный контрол после подключения головы
		прячется и больше не анимируется, а голова ведёт только локальный,
		которого ни в сумме, ни в up-матрицах нет - вращение головы до шеи не
		доходило вовсе.

		Здесь голова входит в оба пути: в сумму - её поворот относительно
		конечного контрола, компонентой X, как у самих контролов модуля; в
		advanced - её worldMatrix вместо конечного контрола. Замер на медведе,
		крен головы на 40 вдоль шеи: advanced - 7.0/6.8/6.6/6.4/6.4 по
		суставам, кивок - 0.
		"""
		head_control = utils.getControlNameFromInternal(self.name, "control")
		ikh = chain + "_ikHandle"
		pma = chain + "_twist_plusMinusAverage"
		if not cmds.objExists(ikh) or not cmds.objExists(pma):
			return

		mult = self.name + "_chainTwist_multMat"
		dec = self.name + "_chainTwist_decomposeMatrix"
		if not cmds.objExists(mult):
			cmds.createNode("multMatrix", n=mult)
			cmds.createNode("decomposeMatrix", n=dec)
			cmds.connectAttr(head_control+".worldMatrix[0]", mult+".matrixIn[0]")
			cmds.connectAttr(end_control+".worldInverseMatrix[0]", mult+".matrixIn[1]")
			cmds.connectAttr(mult+".matrixSum", dec+".inputMatrix")
			for n in (mult, dec):
				utils.addModuleNameAttr(n, self.name)
				if cmds.objExists(self.name+"_nodesSet"):
					cmds.sets(n, e=1, forceElement=self.name+"_nodesSet")

		if not cmds.listConnections(dec+".outputRotateX", s=0, d=1):
			index = max(cmds.getAttr(pma+".input1D", multiIndices=True) or [-1]) + 1
			cmds.connectAttr(dec+".outputRotateX", "%s.input1D[%s]" %(pma, index))

		cmds.connectAttr(head_control+".worldMatrix[0]", ikh+".dWorldUpMatrixEnd", f=1)

	def disconnectChainTwist(self, chain, end_control):
		"""Обратно: конечная up-матрица - снова конечный контрол, вход суммы и
		ноды головы удаляются."""
		ikh = chain + "_ikHandle"
		if cmds.objExists(ikh) and cmds.objExists(end_control):
			cmds.connectAttr(end_control+".worldMatrix[0]", ikh+".dWorldUpMatrixEnd", f=1)
		for n in (self.name + "_chainTwist_decomposeMatrix", self.name + "_chainTwist_multMat"):
			if cmds.objExists(n):
				cmds.delete(n)
	
	def disconnect(self):
		target = self.parent
		
		target_module_name = utils.getModuleName(target)
		target_module_type = utils.getModuleTypeFromAttr(target)
		
		super().disconnect()

		if target_module_type == "chainIk":
			target_poser = utils.getClosestPoser(target_module_name, target)
			int_name = target_poser[len(target_module_name)+1:-6]
			target_control = utils.getControlNameFromInternal(target_module_name, int_name)
			target_control_local = utils.getControlNameFromInternal(target_module_name, "local_"+int_name)
			
			cmds.setAttr(target_control+".lodVisibility", 1)
			cmds.setAttr(target_control_local+".lodVisibility", 1)

			self.disconnectChainTwist(target_module_name, target_control)

			cmds.delete(target_control_local+"_multMat")

			cmds.showHidden(target_poser)

	def getParent(self):
		parent = super().getParent()
		
		# if parent module is ChainIk - replace parent from control to joint
		if parent:
			target_module_name = utils.getModuleName(parent)
			target_module_type = utils.getModuleTypeFromAttr(parent)

			if target_module_type == "chainIk":
				if not "outJoint" in parent:
					parent = utils.getClosestOutJoint(target_module_name, parent)
		
		return parent
