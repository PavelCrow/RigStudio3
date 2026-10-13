import maya.cmds as cmds
import maya.api.OpenMaya as om

from ...import utils, module


class Head(module.Module):
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.neckTwistAxis = "Y"

	def load(self):
		self._repairMirroredChainConnector()
		module.Module.load(self)
		self._refreshAttachedChainSkin(self.parent)
		if cmds.objExists(self.name + "_hairFollow"):
			self.repairHairFollow()

	@staticmethod
	def _refreshAttachedChainSkin(end_joint):
		"""Refresh a Full IKFK end skin joint after seamless reparenting."""
		if not end_joint or not end_joint.endswith("_outJoint"):
			return False
		skin_joint = end_joint[:-len("_outJoint")] + "_skinJoint"
		matrix_input = skin_joint + "_fullIKFKMatrix.matrixIn[1]"
		if not cmds.objExists(matrix_input):
			return False
		parents = cmds.listRelatives(skin_joint, parent=True) or []
		if not parents:
			return False
		parent = parents[0]
		cmds.connectAttr(parent + ".worldInverseMatrix[0]",
					 matrix_input, force=True)
		cmds.setAttr(skin_joint + ".translate", 0, 0, 0, type="double3")
		cmds.setAttr(skin_joint + ".rotate", 0, 0, 0, type="double3")
		cmds.setAttr(skin_joint + ".scale", 1, 1, 1, type="double3")
		cmds.setAttr(skin_joint + ".shear", 0, 0, 0, type="double3")
		return True

	def _repairMirroredChainConnector(self):
		"""Remove the extra end-joint input left by mirrored chain connection."""
		matrix = self.name + "_root_connector_multMat"
		last_input = matrix + ".matrixIn[4]"
		if not cmds.objExists(last_input):
			return False
		parent_inverse = cmds.connectionInfo(
			last_input, sourceFromDestination=True)
		if not parent_inverse or not parent_inverse.endswith(
				".worldInverseMatrix[0]"):
			return False
		poser_source = cmds.connectionInfo(
			matrix + ".matrixIn[1]", sourceFromDestination=True)
		control_source = cmds.connectionInfo(
			matrix + ".matrixIn[2]", sourceFromDestination=True)
		if not poser_source or not control_source:
			return False
		control_node = control_source.split(".", 1)[0]
		internal_name = utils.getInternalNameFromControl(control_node)
		module_name = utils.getModuleName(control_node)
		if (not internal_name.startswith("element_") or
				not internal_name[8:].isdigit() or
				not module_name or
				not cmds.objExists(module_name + "_mod.moduleType") or
				cmds.getAttr(module_name + "_mod.moduleType") != "chainFullIKFK" or
				poser_source.split(".", 1)[0] !=
				module_name + "_" + internal_name + "_poser"):
			return False
		# Module.connect uses five inputs for a mirrored connector. Head.connect
		# replaces the first target inputs with FK control and poser matrices;
		# the original end joint at index 3 would then feed back through Head.
		cmds.connectAttr(parent_inverse, matrix + ".matrixIn[3]",
					 force=True)
		cmds.disconnectAttr(parent_inverse, last_input)
		cmds.setAttr(last_input, 1, 0, 0, 0,
					 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1,
					 type="matrix")
		return True

	def getTwistAxis(self):
		plug = self.name + "_mod.neckTwistAxis"
		if cmds.objExists(plug):
			return cmds.getAttr(plug, asString=True)
		return self.neckTwistAxis

	def setTwistAxis(self, axis, update_graph=True):
		axis = str(axis).upper()
		if axis not in ("Y", "Z"):
			raise ValueError("Neck Twist Axis must be Y or Z")
		self.neckTwistAxis = axis
		plug = self.name + "_mod.neckTwistAxis"
		if not cmds.objExists(self.name + "_mod"):
			return
		if not cmds.objExists(plug):
			cmds.addAttr(self.name + "_mod", longName="neckTwistAxis",
						 attributeType="enum", enumName="Y:Z", defaultValue=0)
		cmds.setAttr(plug, ("Y", "Z").index(axis))
		if not update_graph:
			return
		end_input = self.name + "_root_connector_multMat.matrixIn[2]"
		if not cmds.objExists(end_input):
			return
		source = cmds.connectionInfo(end_input, sourceFromDestination=True)
		if not source:
			return
		end_control = source.split(".")[0]
		chain = utils.getModuleName(end_control)
		if (chain and cmds.objExists(chain + "_ikHandle") and
				utils.getModuleTypeFromAttr(end_control) in ("chainIk", "chainFullIKFK")):
			self.connectChainTwist(chain, end_control, head_axis=axis)

	def getOptions(self):
		return {"neckTwistAxis": self.getTwistAxis()}

	def setOptions(self, options):
		if isinstance(options, dict) and "neckTwistAxis" in options:
			self.setTwistAxis(options["neckTwistAxis"])

	def connectSignals(self, mainInstance, widget):
		widget.neckTwistAxis_comboBox.currentTextChanged.connect(self.setTwistAxis)

	def updateOptionsPage(self, widget):
		combo = widget.neckTwistAxis_comboBox
		combo.blockSignals(True)
		combo.setCurrentIndex(("Y", "Z").index(self.getTwistAxis()))
		combo.blockSignals(False)

	def connect(self, target, opposite=False):
		target_module_name = utils.getModuleName(target)
		target_module_type = utils.getModuleTypeFromAttr(target)
		
		if target_module_type in ("chainIk", "chainFullIKFK"):
			# Inbetween joints can also live below _outJoints. Count only the
			# chain's numbered joints when finding its actual end joint.
			joints = cmds.listRelatives(
				target_module_name + '_outJoints', allDescendents=True,
				type='joint') or []
			prefix = target_module_name + '_'
			suffix = '_outJoint'
			indices = [int(joint[len(prefix):-len(suffix)]) for joint in joints
					   if joint.startswith(prefix) and joint.endswith(suffix)
					   and joint[len(prefix):-len(suffix)].isdigit()]
			if not indices:
				raise RuntimeError('No numbered output joints found in ' + target_module_name)
			target = '{}_{}_outJoint'.format(target_module_name, max(indices))

			fk_controls = []
			for control in utils.getSetObjects(target_module_name+'_moduleControlSet'):
				internal = utils.getInternalNameFromControl(control)
				if internal.startswith('element_') and internal[8:].isdigit():
					fk_controls.append((int(internal[8:]), control))
			if not fk_controls:
				raise RuntimeError('No FK controls found in '+target_module_name)
			last_index, target_control = max(fk_controls)
			int_name = 'element_'+str(last_index)
			target_poser = target_module_name+'_'+int_name+'_poser'
			target_control_local = utils.getControlNameFromInternal(target_module_name, "local_"+int_name)
			if not target_control_local or not cmds.objExists(target_poser):
				raise RuntimeError('End FK control is incomplete in '+target_module_name)

			super().connect(target, opposite, makeSeamless=True)
			self._refreshAttachedChainSkin(target)

			cmds.connectAttr(target_control+".worldMatrix[0]", self.name+"_root_connector_multMat.matrixIn[2]", f=1)
			cmds.connectAttr(target_poser+".worldInverseMatrix[0]", self.name+"_root_connector_multMat.matrixIn[1]", f=1)
			self._repairMirroredChainConnector()

			control = utils.getControlNameFromInternal(self.name, "root")
			system_nodes = cmds.listRelatives(
				target_module_name + "_system", allDescendents=True,
				type="transform") or []
			hair_dynamic = (cmds.objExists(target_module_name + "_hairSystem")
							or cmds.objExists(target_module_name + "_outCrv")
							or any(node.endswith("_outCrv")
								   for node in system_nodes))
			if hair_dynamic:
				proxy_root, proxy_head, proxy_parent = self._createHairFollowProxies(control)
			else:
				proxy_root = control
				proxy_head = utils.getControlNameFromInternal(self.name, "control")
			utils.connectToOffsetParentMatrix(target_control_local, [proxy_root, target_control], ["worldMatrix[0]", "worldInverseMatrix[0]"])

			cmds.setAttr(target_control+".lodVisibility", 0)
			cmds.setAttr(target_control_local+".lodVisibility", 0)

			axis = self.getTwistAxis()
			self.setTwistAxis(axis, update_graph=False)
			self.connectChainTwist(target_module_name, target_control,
							   head_axis=axis, head_matrix_control=proxy_head)
			if hair_dynamic:
				self._activateHairFollow(target, target_poser,
										 proxy_parent, proxy_head)

		else:
			super().connect(target, opposite)

	def _createHairFollowProxies(self, root_control):
		"""Keep head animation as a static input to the neck simulation."""
		head_control = utils.getControlNameFromInternal(self.name, "control")
		controls = self.name + "_controls"
		path = []
		node = head_control
		while node != controls:
			path.append(node)
			parent = cmds.listRelatives(node, parent=True)
			if not parent:
				raise RuntimeError("Head control is outside " + controls)
			node = parent[0]
		path.reverse()
		# The first node is the orientation group. It stays on the FK end,
		# while the animated descendants get a second, static copy.
		orientation_group = path.pop(0)
		proxy_parent = orientation_group
		proxy_root = proxy_head = None
		for index, original in enumerate(path):
			proxy = cmds.createNode("transform", name=self.name + "_hairInput_%s" % index,
										  parent=proxy_parent)
			local = cmds.createNode("multMatrix", name=proxy + "_localMatrix")
			cmds.connectAttr(original + ".matrix", local + ".matrixIn[0]")
			cmds.connectAttr(original + ".offsetParentMatrix", local + ".matrixIn[1]")
			cmds.connectAttr(local + ".matrixSum", proxy + ".offsetParentMatrix")
			cmds.setAttr(proxy + ".visibility", 0)
			for created in (proxy, local):
				utils.addModuleNameAttr(created, self.name)
				utils.addToModuleSet(created, self.name)
			if original == root_control:
				proxy_root = proxy
			if original == head_control:
				proxy_head = proxy
			proxy_parent = proxy
		if not proxy_root or not proxy_head:
			raise RuntimeError("Could not copy head controls for hair dynamics")
		return proxy_root, proxy_head, orientation_group

	def _activateHairFollow(self, end_joint, end_poser,
							orientation_group, input_head):
		"""Follow only the neck's change relative to the head's static input."""
		first_control_group = utils.getControlNameFromInternal(self.name, "root")
		while True:
			parent = cmds.listRelatives(first_control_group, parent=True)
			if not parent:
				raise RuntimeError("Cannot find the head animation group")
			if parent[0] == orientation_group:
				break
			first_control_group = parent[0]
		# The rest pose must remain live: rebuild reconnects the head before
		# restoring its posers, and hair simulation can also be stale then.
		# Compare the dynamic joint with the static end in the head input's
		# current frame rather than baking a connection-time point.
		rest_joint = end_joint.replace("_outJoint", "_initLoc")
		if not cmds.objExists(rest_joint):
			rest_joint = end_poser
		follow = cmds.createNode("transform", name=self.name + "_hairFollow",
										parent=orientation_group)
		actual = cmds.createNode("decomposeMatrix", name=follow + "_actual")
		delta = cmds.createNode("plusMinusAverage", name=follow + "_delta")
		local = cmds.createNode("vectorProduct", name=follow + "_local")
		self._connectHairFollowPrediction(rest_joint, end_poser,
										orientation_group,
										input_head, follow, delta)
		cmds.connectAttr(end_joint + ".worldMatrix[0]",
					 actual + ".inputMatrix")
		cmds.setAttr(delta + ".operation", 2)
		cmds.connectAttr(actual + ".outputTranslate", delta + ".input3D[0]")
		cmds.setAttr(local + ".operation", 3)
		cmds.connectAttr(delta + ".output3D", local + ".input1")
		cmds.connectAttr(orientation_group + ".worldInverseMatrix[0]",
					 local + ".matrix")
		cmds.connectAttr(local + ".output", follow + ".translate")
		cmds.parent(first_control_group, follow, relative=True)
		for created in (follow, actual, delta, local):
			utils.addModuleNameAttr(created, self.name)
			utils.addToModuleSet(created, self.name)

	def _connectHairFollowPrediction(self, rest_joint, end_poser,
									orientation_group, input_head,
									follow, delta):
		"""Calculate the static neck end in the current head control frame."""
		static_end = follow + "_staticEnd"
		predicted = follow + "_predictedMatrix"
		predicted_parts = follow + "_predictedParts"
		for node, node_type in ((static_end, "multMatrix"),
								(predicted, "multMatrix"),
								(predicted_parts, "decomposeMatrix")):
			if not cmds.objExists(node):
				cmds.createNode(node_type, name=node)
				utils.addModuleNameAttr(node, self.name)
				utils.addToModuleSet(node, self.name)
		# The init locator follows the poser, while the FK end also follows the
		# IK boxes. Include that FK motion in the static prediction so it is not
		# added to the head a second time as simulated motion.
		for source, destination in (
				(rest_joint + ".worldMatrix[0]", static_end + ".matrixIn[0]"),
				(end_poser + ".worldInverseMatrix[0]",
				 static_end + ".matrixIn[1]"),
				(end_poser[:-len("_poser")] + ".worldMatrix[0]",
				 static_end + ".matrixIn[2]"),
				(static_end + ".matrixSum", predicted + ".matrixIn[0]"),
				(orientation_group + ".worldInverseMatrix[0]",
				 predicted + ".matrixIn[1]"),
				(input_head + ".worldMatrix[0]", predicted + ".matrixIn[2]"),
				(predicted + ".matrixSum", predicted_parts + ".inputMatrix"),
				(predicted_parts + ".outputTranslate", delta + ".input3D[1]")):
			if cmds.connectionInfo(destination, sourceFromDestination=True) != source:
				cmds.connectAttr(source, destination, force=True)

	def repairHairFollow(self):
		"""Upgrade an existing hair follow without rebuilding the head."""
		follow = self.name + "_hairFollow"
		actual = follow + "_actual"
		delta = follow + "_delta"
		if not all(cmds.objExists(node) for node in (follow, actual, delta)):
			return False
		joint_source = cmds.connectionInfo(actual + ".inputMatrix",
										 sourceFromDestination=True)
		old_predicted = follow + "_predicted"
		input_plug = (old_predicted + ".inMatrix" if cmds.objExists(old_predicted)
					  else follow + "_predictedMatrix.matrixIn[2]")
		input_source = cmds.connectionInfo(input_plug,
										 sourceFromDestination=True)
		if not joint_source or not input_source:
			return False
		end_joint = joint_source.split(".", 1)[0]
		rest_joint = end_joint.replace("_outJoint", "_initLoc")
		if not cmds.objExists(rest_joint):
			cmds.warning("Missing static end joint locator: " + rest_joint)
			return False
		input_head = input_source.split(".", 1)[0]
		poser_source = cmds.connectionInfo(
			self.name + "_root_connector_multMat.matrixIn[1]",
			sourceFromDestination=True)
		if not poser_source:
			return False
		end_poser = poser_source.split(".", 1)[0]
		if not end_poser.endswith("_poser") or not cmds.objExists(
				end_poser[:-len("_poser")]):
			return False
		orientation_group = cmds.listRelatives(follow, parent=True)[0]
		self._connectHairFollowPrediction(rest_joint, end_poser,
										orientation_group,
										input_head, follow, delta)
		if cmds.objExists(old_predicted):
			cmds.delete(old_predicted)
		return True

	def _removeHairFollow(self):
		follow = self.name + "_hairFollow"
		if not cmds.objExists(follow):
			return
		parent = cmds.listRelatives(follow, parent=True)[0]
		for child in cmds.listRelatives(follow, children=True, type="transform") or []:
			cmds.parent(child, parent, relative=True)
		cmds.delete(follow)
		for suffix in ("_hairFollow_multMat", "_hairFollow_pickMatrix",
					   "_hairFollow_staticEnd",
					   "_hairFollow_predicted", "_hairFollow_predictedMatrix",
					   "_hairFollow_predictedParts", "_hairFollow_actual",
					   "_hairFollow_delta", "_hairFollow_local"):
			if cmds.objExists(self.name + suffix):
				cmds.delete(self.name + suffix)
		for proxy in cmds.ls(self.name + "_hairInput_*", type="transform") or []:
			if cmds.objExists(proxy):
				cmds.delete(proxy)
		for local in cmds.ls(self.name + "_hairInput_*_localMatrix", type="multMatrix") or []:
			if cmds.objExists(local):
				cmds.delete(local)

	def connectChainTwist(self, chain, end_control, head_axis=None,
					  head_matrix_control=None):
		"""Поворот головы твистит цепочку, к концу которой она подключена.

		Твист chainIk берётся с главных контролов: при autoTwist - сумма их
		rotateX в ikHandle.twist, без него - advanced twist по up-матрицам
		первого и последнего. Конечный контрол после подключения головы
		прячется и больше не анимируется, а голова ведёт только локальный,
		которого ни в сумме, ни в up-матрицах нет - вращение головы до шеи не
		доходило вовсе.

		Для обоих модулей берётся вращение головы вокруг Y в покое.
		Поворот головы относительно конечного контрола переводится в кадр
		с X вдоль выбранной оси, и из кватерниона остаётся только
		X-компонента: вращения вокруг двух других осей не попадают.
		Ось головы берётся с её позера, поскольку направление шеи может
		отличаться от неё.

		Этот угол идёт в оба пути модуля. В сумму - как есть. В advanced -
		через "локатор": голова в покое, едущая за концом шеи, повёрнутая на
		этот угол вокруг направления шеи, становится конечной up-матрицей,
		а up-вектор конца - верх кадра шеи в осях головы, тот же, что у
		старта цепочки. "Верх" берётся с самого модуля: up-матрица старта
		его ikHandle и ось +Y - так chainIk задаёт себя сам; поперёк тела -
		произведение оси на этот верх.

		Атрибут neckTwist задаёт долю передаваемого вращения.
		"""
		if head_axis is None:
			head_axis = self.getTwistAxis()
		head_control = utils.getControlNameFromInternal(self.name, "control")
		if head_matrix_control is None:
			proxies = cmds.ls(self.name + "_hairInput_*", type="transform") or []
			head_matrix_control = max(proxies, key=lambda node: int(node.rsplit("_", 1)[1])) if proxies else head_control
		ikh = chain + "_ikHandle"
		pma = chain + "_twist_plusMinusAverage"
		if not cmds.objExists(ikh) or not cmds.objExists(pma):
			return

		# Всё, из чего строится кадр, - от позеров, не от живых контролов:
		# контролы стоят в той позе, в какой голову подключают, и кадр,
		# снятый с них, запекает эту позу - на медведе голову подключили с
		# рысканьем в 5 без наклона, и потом в покое крен был 1.8, а кивок
		# на 85 к оси кадра тёк в твист. Позеры не анимируются.
		#   ось головы - Y или Z позера корня; верх - up-матрица старта
		#   initIkHandle цепочки, как модуль задаёт себя сам; направление
		#   шеи у конца - от предпоследнего позера к последнему (up-матрица
		#   конца того же initIkHandle)
		init_ikh = chain + "_initIkHandle"
		head_poser = self.name + "_root_poser"
		up_start = (cmds.listConnections(init_ikh+".dWorldUpMatrix", source=1, destination=0) or [""])[0]
		last_poser = (cmds.listConnections(init_ikh+".dWorldUpMatrixEnd", source=1, destination=0) or [""])[0]
		prev_poser = ""
		if last_poser.endswith("_poser") and "_element_" in last_poser:
			n = int(last_poser.split("_element_")[-1][:-len("_poser")])
			prev_poser = chain + ("_root_poser" if n <= 2 else "_element_%s_poser" %(n-1))
		if not cmds.objExists(head_poser) or not up_start or not cmds.objExists(prev_poser):
			cmds.warning(" %s: chain twist is not connected - no posers on %s or %s" %(self.name, chain, self.name))
			return

		def rot3(node):
			m = om.MMatrix(cmds.xform(node, q=1, ws=1, matrix=1))
			m[12], m[13], m[14] = 0.0, 0.0, 0.0
			return om.MTransformationMatrix(m).rotation().asMatrix()

		def frameFor(axis_world, up_world, space):
			"""Кадр с X вдоль оси и Z поперёк тела, в осях space; и его верх."""
			across = (axis_world ^ up_world).normal()
			inv = rot3(space).inverse()
			x = (axis_world * inv).normal()
			z = (across * inv).normal()
			z = (z - x * (z * x)).normal()
			y = z ^ x
			return om.MMatrix([x.x, x.y, x.z, 0, y.x, y.y, y.z, 0, z.x, z.y, z.z, 0, 0, 0, 0, 1]), y

		p_last = om.MVector(*cmds.xform(last_poser, q=1, ws=1, t=1))
		p_prev = om.MVector(*cmds.xform(prev_poser, q=1, ws=1, t=1))
		neck_world = (p_last - p_prev).normal()
		m_up = cmds.xform(up_start, q=1, ws=1, matrix=1)
		up_world = om.MVector(m_up[4], m_up[5], m_up[6]).normal()
		m_head = cmds.xform(head_poser, q=1, ws=1, matrix=1)
		look_world = om.MVector(m_head[8], m_head[9], m_head[10]).normal()
		head_rest = rot3(head_poser)

		if head_axis == "Y":
			# The head's Y axis may be parallel to the neck's up axis. Its Z
			# axis is a stable perpendicular reference for the twist frame.
			twist_axis = om.MVector(m_head[4], m_head[5], m_head[6]).normal()
			frame_head_axis, _ = frameFor(twist_axis, look_world, end_control)
		else:
			frame_head_axis, _ = frameFor(look_world, up_world, end_control)
		frame_neck, y_neck = frameFor(neck_world, up_world, end_control)

		# Сколько поворота головы доходит до шеи; 0 - шея на голову не реагирует,
		# как было до подключения.
		if not cmds.objExists(head_control+".neckTwist"):
			cmds.addAttr(head_control, ln="neckTwist", at="double", min=0, max=1, dv=1, k=1)
		if not cmds.pluginInfo("quatNodes", q=1, loaded=1):
			cmds.loadPlugin("quatNodes", quiet=1)

		mult = self.name + "_chainTwist_multMat"
		dec = self.name + "_chainTwist_decomposeMatrix"
		qn = self.name + "_chainTwist_quatNormalize"
		q2e = self.name + "_chainTwist_quatToEuler"
		weight = self.name + "_chainTwist_weight"
		comp = self.name + "_chainTwist_composeMatrix"
		loc = self.name + "_chainTwist_locator_multMat"
		if not cmds.objExists(mult):
			cmds.createNode("multMatrix", n=mult)
			cmds.createNode("decomposeMatrix", n=dec)
			cmds.createNode("quatNormalize", n=qn)
			cmds.createNode("quatToEuler", n=q2e)
			cmds.createNode("multiplyDivide", n=weight)
			cmds.createNode("composeMatrix", n=comp)
			cmds.createNode("multMatrix", n=loc)
			# поворот головы относительно конца в кадре выбранной оси:
			# frame * rel * frame^-1, из кватерниона - только X и W
			cmds.connectAttr(head_matrix_control+".worldMatrix[0]", mult+".matrixIn[1]")
			cmds.connectAttr(end_control+".worldInverseMatrix[0]", mult+".matrixIn[2]")
			cmds.connectAttr(mult+".matrixSum", dec+".inputMatrix")
			cmds.connectAttr(dec+".outputQuatX", qn+".inputQuatX")
			cmds.connectAttr(dec+".outputQuatW", qn+".inputQuatW")
			cmds.connectAttr(qn+".outputQuat", q2e+".inputQuat")
			cmds.connectAttr(q2e+".outputRotateX", weight+".input1X")
			cmds.connectAttr(head_control+".neckTwist", weight+".input2X")
			# локатор: покой головы на конце шеи, повёрнутый на этот угол вокруг
			# направления шеи - offset * frame^-1 * Rx * frame * end
			cmds.connectAttr(weight+".outputX", comp+".inputRotateX")
			cmds.connectAttr(comp+".outputMatrix", loc+".matrixIn[2]")
			cmds.connectAttr(end_control+".worldMatrix[0]", loc+".matrixIn[4]")
			for n in (mult, dec, qn, q2e, weight, comp, loc):
				utils.addModuleNameAttr(n, self.name)
				if cmds.objExists(self.name+"_nodesSet"):
					cmds.sets(n, e=1, forceElement=self.name+"_nodesSet")
		if cmds.connectionInfo(mult+".matrixIn[1]", sourceFromDestination=True) != head_matrix_control+".worldMatrix[0]":
			cmds.connectAttr(head_matrix_control+".worldMatrix[0]", mult+".matrixIn[1]", force=True)
		cmds.setAttr(mult+".matrixIn[0]", list(frame_head_axis), type="matrix")
		cmds.setAttr(mult+".matrixIn[3]", list(frame_head_axis.inverse()), type="matrix")
		cmds.setAttr(loc+".matrixIn[0]", list(head_rest * rot3(end_control).inverse()), type="matrix")
		cmds.setAttr(loc+".matrixIn[1]", list(frame_neck.inverse()), type="matrix")
		cmds.setAttr(loc+".matrixIn[3]", list(frame_neck), type="matrix")

		if not cmds.listConnections(weight+".outputX", s=0, d=1, type="plusMinusAverage"):
			index = max(cmds.getAttr(pma+".input1D", multiIndices=True) or [-1]) + 1
			cmds.connectAttr(weight+".outputX", "%s.input1D[%s]" %(pma, index))

		# up-вектор конца - верх кадра шеи в осях покоя головы
		y_world = (y_neck * rot3(end_control)).normal()
		up_end = (y_world * head_rest.inverse()).normal()
		cmds.connectAttr(loc+".matrixSum", ikh+".dWorldUpMatrixEnd", f=1)
		cmds.setAttr(ikh+".dWorldUpVectorEnd", up_end.x, up_end.y, up_end.z)

	def disconnectChainTwist(self, chain, end_control):
		"""Обратно: конечная up-матрица - снова конечный контрол с up-вектором
		по умолчанию, вход суммы, ноды и атрибут головы удаляются."""
		ikh = chain + "_ikHandle"
		if cmds.objExists(ikh) and cmds.objExists(end_control):
			cmds.connectAttr(end_control+".worldMatrix[0]", ikh+".dWorldUpMatrixEnd", f=1)
			cmds.setAttr(ikh+".dWorldUpVectorEnd", 0, 1, 0)
		for n in ("_chainTwist_locator_multMat", "_chainTwist_composeMatrix", "_chainTwist_weight",
				  "_chainTwist_quatToEuler", "_chainTwist_quatNormalize",
				  "_chainTwist_decomposeMatrix", "_chainTwist_multMat",
				  "_chainTwist_blendMatrix", "_chainTwist_follow_multMat"):
			if cmds.objExists(self.name + n):
				cmds.delete(self.name + n)
		head_control = utils.getControlNameFromInternal(self.name, "control")
		if head_control and cmds.objExists(head_control+".neckTwist"):
			cmds.setAttr(head_control+".neckTwist", lock=False)
			cmds.deleteAttr(head_control+".neckTwist")
	
	def disconnect(self):
		target = self.parent
		
		target_module_name = utils.getModuleName(target)
		target_module_type = utils.getModuleTypeFromAttr(target)
		if target_module_type in ("chainIk", "chainFullIKFK"):
			connected_controls = cmds.listConnections(
				self.name+"_root_connector_multMat.matrixIn[2]", s=1, d=0) or []
			if connected_controls:
				target_control = connected_controls[0]
				int_name = utils.getInternalNameFromControl(target_control)
				target_poser = target_module_name+"_"+int_name+"_poser"
			else:
				target_poser = utils.getClosestPoser(target_module_name, target)
				int_name = target_poser[len(target_module_name)+1:-6]
				target_control = utils.getControlNameFromInternal(target_module_name, int_name)
			target_control_local = utils.getControlNameFromInternal(target_module_name, "local_"+int_name)
		
		super().disconnect()
		self._refreshAttachedChainSkin(target)

		if target_module_type in ("chainIk", "chainFullIKFK"):
			cmds.setAttr(target_control+".lodVisibility", 1)
			cmds.setAttr(target_control_local+".lodVisibility", 1)

			self.disconnectChainTwist(target_module_name, target_control)

			if cmds.objExists(target_control_local+"_multMat"):
				cmds.delete(target_control_local+"_multMat")
			self._removeHairFollow()

			cmds.showHidden(target_poser)

	def getParent(self):
		parent = super().getParent()
		
		# if parent module is ChainIk - replace parent from control to joint
		if parent:
			target_module_name = utils.getModuleName(parent)
			target_module_type = utils.getModuleTypeFromAttr(parent)

			if target_module_type in ("chainIk", "chainFullIKFK"):
				if not "outJoint" in parent:
					parent = utils.getClosestOutJoint(target_module_name, parent)
		
		return parent
