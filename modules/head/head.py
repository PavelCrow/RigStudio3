import maya.cmds as cmds
import maya.api.OpenMaya as om

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

		Здесь голова входит в оба пути. В сумму - крен головы вокруг
		направления шеи: поворот головы относительно конечного контрола
		переводится в кадр, у которого X идёт вдоль шеи, а Z поперёк тела, и
		берётся его X. Брать X самого контрола нельзя: у конечного контрола
		шеи он может смотреть куда угодно (на медведе - поперёк тела, и кивок
		шёл в твист). В advanced - worldMatrix головы вместо конечного
		контрола, а up-вектор конца - Y того же кадра в осях головы, тот же
		"верх", что у старта цепочки: иначе поворот вбок подтвистывает.

		"Верх" берётся с самого модуля: up-матрица старта его ikHandle и ось
		+Y - так chainIk задаёт себя сам. Поперёк тела - произведение
		направления шеи на этот верх.

		Замер на медведе, по суставам: крен головы на 40 вдоль шеи - 8.0 в
		сумме, 8.4..7.4 в advanced; кивок вниз, вверх и поворот вбок на 30 -
		ровно 0 в обоих.
		"""
		head_control = utils.getControlNameFromInternal(self.name, "control")
		ikh = chain + "_ikHandle"
		pma = chain + "_twist_plusMinusAverage"
		if not cmds.objExists(ikh) or not cmds.objExists(pma):
			return

		# направление шеи у её конца - по двум последним костям цепочки
		joints = cmds.listRelatives(chain+"_outJoints", allDescendents=1, type="joint") or []
		last = "%s_%s_outJoint" %(chain, len(joints)-1)
		prev = "%s_%s_outJoint" %(chain, len(joints)-2)
		up_start = (cmds.listConnections(ikh+".dWorldUpMatrix", source=1, destination=0) or [""])[0]
		if not cmds.objExists(last) or not cmds.objExists(prev) or not up_start:
			cmds.warning(" %s: chain twist is not connected - no joints or start up matrix on %s" %(self.name, chain))
			return

		def rot3(node):
			m = om.MMatrix(cmds.xform(node, q=1, ws=1, matrix=1))
			m[12], m[13], m[14] = 0.0, 0.0, 0.0
			return om.MTransformationMatrix(m).rotation().asMatrix()

		p_last = om.MVector(*cmds.xform(last, q=1, ws=1, t=1))
		p_prev = om.MVector(*cmds.xform(prev, q=1, ws=1, t=1))
		d_world = (p_last - p_prev).normal()
		m_up = cmds.xform(up_start, q=1, ws=1, matrix=1)
		up_world = om.MVector(m_up[4], m_up[5], m_up[6]).normal()
		across_world = (d_world ^ up_world).normal()

		# кадр в осях конечного контрола: X вдоль шеи, Z поперёк, Y - верх
		end_inv = rot3(end_control).inverse()
		x = (d_world * end_inv).normal()
		z = (across_world * end_inv).normal()
		z = (z - x * (z * x)).normal()
		y = z ^ x
		frame = om.MMatrix([x.x, x.y, x.z, 0, y.x, y.y, y.z, 0, z.x, z.y, z.z, 0, 0, 0, 0, 1])

		mult = self.name + "_chainTwist_multMat"
		dec = self.name + "_chainTwist_decomposeMatrix"
		if not cmds.objExists(mult):
			cmds.createNode("multMatrix", n=mult)
			cmds.createNode("decomposeMatrix", n=dec)
			# поворот головы относительно конца, сказанный в осях кадра:
			# frame * rel * frame^-1
			cmds.connectAttr(head_control+".worldMatrix[0]", mult+".matrixIn[1]")
			cmds.connectAttr(end_control+".worldInverseMatrix[0]", mult+".matrixIn[2]")
			cmds.connectAttr(mult+".matrixSum", dec+".inputMatrix")
			for n in (mult, dec):
				utils.addModuleNameAttr(n, self.name)
				if cmds.objExists(self.name+"_nodesSet"):
					cmds.sets(n, e=1, forceElement=self.name+"_nodesSet")
		cmds.setAttr(mult+".matrixIn[0]", list(frame), type="matrix")
		cmds.setAttr(mult+".matrixIn[3]", list(frame.inverse()), type="matrix")

		if not cmds.listConnections(dec+".outputRotateX", s=0, d=1):
			index = max(cmds.getAttr(pma+".input1D", multiIndices=True) or [-1]) + 1
			cmds.connectAttr(dec+".outputRotateX", "%s.input1D[%s]" %(pma, index))

		# advanced twist: голова - конечная up-матрица, её up-вектор - верх
		# кадра в осях головы
		y_world = (y * rot3(end_control)).normal()
		up_end = (y_world * rot3(head_control).inverse()).normal()
		cmds.connectAttr(head_control+".worldMatrix[0]", ikh+".dWorldUpMatrixEnd", f=1)
		cmds.setAttr(ikh+".dWorldUpVectorEnd", up_end.x, up_end.y, up_end.z)

	def disconnectChainTwist(self, chain, end_control):
		"""Обратно: конечная up-матрица - снова конечный контрол с up-вектором
		по умолчанию, вход суммы и ноды головы удаляются."""
		ikh = chain + "_ikHandle"
		if cmds.objExists(ikh) and cmds.objExists(end_control):
			cmds.connectAttr(end_control+".worldMatrix[0]", ikh+".dWorldUpMatrixEnd", f=1)
			cmds.setAttr(ikh+".dWorldUpVectorEnd", 0, 1, 0)
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
