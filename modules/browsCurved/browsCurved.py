import maya.cmds as cmds
from functools import partial
import pymel.core as pm
import os, imp, math

from ... import utils, module

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
    from PySide2.QtWidgets import QAction
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance
    from PySide6.QtGui import QAction

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])#.split(fileName)[0]

class BrowsCurved(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.edges = ''

	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.setEdges_btn.clicked.connect(partial(self.setEdges, w))
		w.regenerate_btn.clicked.connect(self.generate)
		
	def setEdges(self, widget):
		edges = cmds.ls(sl=1)

		edges_string = ""
		for e in edges:
			edges_string += e
			edges_string += " "
	
		options = self.getOptions()
		options['edges'] = edges_string
		self.setOptions(options)	

		w_lineEdit = eval("widget.edges_lineEdit")
		w_lineEdit.setText(edges_string)		

	def updateOptionsPage(self, widget):

		pixmap = QtGui.QPixmap(rootPath+'/modules/browsCurved/helpImage.png')
		widget.image_label.setPixmap(pixmap)
	
		data = self.getOptions()

		widget.edges_lineEdit.setText(self.edges)

	def getOptions(self):

		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
		else:
			optionsData = {}

		if optionsData == {}:
			optionsData['edges'] = ''

		else:
			self.edges = optionsData['edges']
		
		return optionsData		

	def setOptions(self, optionsData):
		# old templates may store optionsData as a bool (no options dict yet)
		if not isinstance(optionsData, dict):
			optionsData = {}

		if 'edges' in optionsData:
			self.edges = optionsData['edges']
		else:
			self.edges = ""

		utils.pyToAttr(self.root+'.options', optionsData)

	def generate(self):

		root_out_joint = f"{self.name}_root_outJoint"
		if not cmds.objExists(root_out_joint):
			cmds.warning(f"Cannot find {root_out_joint}")
			return

		root_connector = f"{self.name}_root_connector"
		if not cmds.objExists(root_connector):
			cmds.warning(f"Cannot find {root_connector}")
			return

		def create_joints_on_curve_from_selection(side):
			# ======================
			curve = f"{self.name}_{side}_curve"

			up_controls = [
				f"{self.name}_brow_center",
				f"{self.name}_{side}_brow_in",
				f"{self.name}_{side}_brow_mid",
				f"{self.name}_{side}_brow_out",
				f"{self.name}_{side}_brow_last"
			]

			brow_ctrl = f"{self.name}_l_brow"
			if not cmds.objExists(brow_ctrl):
				cmds.warning(f"Cannot find {brow_ctrl}")
				return

			# ======================

			# --- Чистим локаторы (и всё, что внутри них), оставшиеся от предыдущего generate ---
			existing = cmds.ls(f"{side}_{self.name}_curveLoc_*", type="transform") or []
			if existing:
				cmds.delete(existing)

			if not self.edges:
				cmds.warning("Set edges or vertexes first")
				return

			components = [s for s in self.edges.split() if "." in s]
			if not components:
				cmds.warning("Cannot find edges or vertexes")
				return

			# --- Конвертируем в вершины ---
			verts = cmds.polyListComponentConversion(components, toVertex=True)
			verts = cmds.ls(verts, fl=True) or []
			if not verts:
				cmds.warning("Cannot get verexes")
				return

			unique_verts = []
			seen = set()
			for v in verts:
				if v not in seen:
					unique_verts.append(v)
					seen.add(v)

			# --- Находим ближайшие точки на кривой ---
			points_data = []

			for v in unique_verts:
				pos = cmds.pointPosition(v, world=True)
				if side == "r":
					pos = (-pos[0], pos[1], pos[2])
				print (v, pos)
				npoc = cmds.createNode("nearestPointOnCurve", name="temp_npoc")
				cmds.connectAttr(f"{curve}.worldSpace[0]", f"{npoc}.inputCurve", force=True)
				cmds.setAttr(f"{npoc}.inPosition", *pos, type="double3")

				u = cmds.getAttr(f"{npoc}.parameter")
				closest_pos = cmds.getAttr(f"{npoc}.position")[0]
				cmds.delete(npoc)

				points_data.append((u, closest_pos))

			points_data.sort(key=lambda x: x[0])
			points_data = points_data[1:]

			main_joints = []
			end_joints = []

			# правая сторона зеркальна (негативный scale в родительской цепочке) - офсет по Y нужно инвертировать
			rotYSign = -1.0 if side == "r" else 1.0

			for i, (u, pos) in enumerate(points_data):
				# --- Локатор: только позиция; вращение root_connector теперь приходит через root_out_joint ---
				loc = cmds.spaceLocator(name=f"{side}_{self.name}_curveLoc_{i:02d}")[0]
				cmds.parent(loc, root_out_joint)
				cmds.hide(loc+"Shape")

				# --- Motion Path ---
				mp = cmds.createNode("motionPath", name=f"mp_{loc}")
				cmds.connectAttr(f"{curve}.worldSpace[0]", f"{mp}.geometryPath", force=True)

				cmds.setAttr(f"{mp}.fractionMode", 0)
				cmds.setAttr(f"{mp}.follow", 1)
				# up от root_connector, а не от контролов брови: он вращается вместе с ригом,
				# но не крутится от анимации бровей, поэтому фрейм не вырождается.
				# Твист от контролов добавляем ниже через frontTwist, от их rotateX
				cmds.setAttr(f"{mp}.worldUpType", 2)          # Object Rotation Up
				cmds.connectAttr(f"{root_connector}.worldMatrix[0]", f"{mp}.worldUpMatrix", force=True)

				# allCoordinates — мировые координаты, переводим их в пространство родителя (root_out_joint)
				pmm = cmds.createNode("pointMatrixMult", name=f"pmm_{loc}")
				cmds.connectAttr(f"{mp}.allCoordinates", f"{pmm}.inPoint", force=True)
				cmds.connectAttr(f"{loc}.parentInverseMatrix[0]", f"{pmm}.inMatrix", force=True)
				cmds.connectAttr(f"{pmm}.output", f"{loc}.translate", force=True)

				# --- Основной джоинт, внутри локатора ---
				jnt1 = cmds.joint(name=f"{side}_{self.name}_curveJnt_{i:02d}")
				cmds.parent(jnt1, loc)
				cmds.setAttr(f"{jnt1}.translate", 0, 0, 0)
				main_joints.append(jnt1)

				# ============================================================
				#  TWIST — взвешенный rotateX двух ближайших контролов
				# ============================================================
				distances = []
				for ctrl in up_controls:
					ctrl_pos = cmds.xform(ctrl, q=True, ws=True, translation=True)
					dist = math.sqrt(
						(pos[0] - ctrl_pos[0]) ** 2 +
						(pos[1] - ctrl_pos[1]) ** 2 +
						(pos[2] - ctrl_pos[2]) ** 2
					)
					distances.append((dist, ctrl))

				# Сортируем по расстоянию и берём два ближайших
				distances.sort(key=lambda x: x[0])
				dist1, ctrl1 = distances[0]
				dist2, ctrl2 = distances[1]

				# Защита от деления на ноль
				dist1 = max(dist1, 0.0001)
				dist2 = max(dist2, 0.0001)

				# Обратные расстояния > нормализованные веса
				w1 = 1.0 / dist1
				w2 = 1.0 / dist2
				total = w1 + w2
				weight1 = w1 / total
				weight2 = w2 / total

				# Твист = rotateX ближайших контролов, смешанный по тем же весам.
				# Локальный угол, а не мировой up-вектор - вырождаться нечему
				tw1 = cmds.createNode("multDoubleLinear", name=f"twist1_{jnt1}")
				cmds.connectAttr(f"{ctrl1}.rotateX", f"{tw1}.input1", force=True)
				cmds.setAttr(f"{tw1}.input2", weight1)

				tw2 = cmds.createNode("multDoubleLinear", name=f"twist2_{jnt1}")
				cmds.connectAttr(f"{ctrl2}.rotateX", f"{tw2}.input1", force=True)
				cmds.setAttr(f"{tw2}.input2", weight2)

				twist = cmds.createNode("addDoubleLinear", name=f"twist_{jnt1}")
				cmds.connectAttr(f"{tw1}.output", f"{twist}.input1", force=True)
				cmds.connectAttr(f"{tw2}.output", f"{twist}.input2", force=True)

				# правая сторона зеркальна - твист тоже инвертируем (тот же rotYSign)
				twistSigned = cmds.createNode("multDoubleLinear", name=f"twistSigned_{jnt1}")
				cmds.connectAttr(f"{twist}.output", f"{twistSigned}.input1", force=True)
				cmds.setAttr(f"{twistSigned}.input2", rotYSign)

				# frontTwist - поворот вокруг касательной, уже входит в mp.rotate
				cmds.connectAttr(f"{twistSigned}.output", f"{mp}.frontTwist", force=True)
				# ============================================================

				# --- Атрибут pos, управляющий положением джоинта на кривой ---
				cmds.addAttr(jnt1, longName="pos", attributeType="double",
							 min=0, max=1, defaultValue=u, keyable=True)
				cmds.setAttr(f"{jnt1}.pos", u)
				cmds.connectAttr(f"{jnt1}.pos", f"{mp}.uValue", force=True)

				# --- Замораживаем ориентацию по кривой в jointOrient (только дефолтная поза) ---
				cmds.connectAttr(f"{mp}.rotate", f"{jnt1}.jointOrient", force=True)
				init_orient = cmds.getAttr(f"{jnt1}.jointOrient")[0]
				cmds.disconnectAttr(f"{mp}.rotate", f"{jnt1}.jointOrient")
				cmds.setAttr(f"{jnt1}.jointOrient", *init_orient)
				# jnt1.rotate остаётся 0 — по кривой больше не меняется; вращение root_connector
				# приходит через root_out_joint (его родителя)

				# --- Офсет по Y: своя высота локатора (ty) относительно исходной, upLimit/downLimit/
				# --- upRotateJoints/downRotateJoints берутся с l_brow, но у каждого джоинта свой вес ---
				ty0 = cmds.getAttr(f"{loc}.translateY")

				deltaY = cmds.createNode("plusMinusAverage", name=f"locDeltaY_{jnt1}")
				cmds.setAttr(f"{deltaY}.operation", 2)  # subtract
				cmds.connectAttr(f"{loc}.translateY", f"{deltaY}.input1D[0]")
				cmds.setAttr(f"{deltaY}.input1D[1]", ty0)

				mdUp = cmds.createNode("multiplyDivide", name=f"upWeight_md_{jnt1}")
				cmds.setAttr(f"{mdUp}.operation", 2)  # divide
				cmds.connectAttr(f"{deltaY}.output1D", f"{mdUp}.input1X")
				cmds.connectAttr(f"{brow_ctrl}.upLimit", f"{mdUp}.input2X")
				clampUp = cmds.createNode("clamp", name=f"upWeight_clamp_{jnt1}")
				cmds.setAttr(f"{clampUp}.minR", 0)
				cmds.setAttr(f"{clampUp}.maxR", 1)
				cmds.connectAttr(f"{mdUp}.outputX", f"{clampUp}.inputR")

				mdDown = cmds.createNode("multiplyDivide", name=f"downWeight_md_{jnt1}")
				cmds.setAttr(f"{mdDown}.operation", 2)  # divide
				cmds.connectAttr(f"{deltaY}.output1D", f"{mdDown}.input1X")
				cmds.connectAttr(f"{brow_ctrl}.downLimit", f"{mdDown}.input2X")
				clampDown = cmds.createNode("clamp", name=f"downWeight_clamp_{jnt1}")
				cmds.setAttr(f"{clampDown}.minR", 0)
				cmds.setAttr(f"{clampDown}.maxR", 1)
				cmds.connectAttr(f"{mdDown}.outputX", f"{clampDown}.inputR")

				mulUp = cmds.createNode("multDoubleLinear", name=f"upRotate_mul_{jnt1}")
				cmds.connectAttr(f"{clampUp}.outputR", f"{mulUp}.input1")
				cmds.connectAttr(f"{brow_ctrl}.upRotateJoints", f"{mulUp}.input2")

				mulDown = cmds.createNode("multDoubleLinear", name=f"downRotate_mul_{jnt1}")
				cmds.connectAttr(f"{clampDown}.outputR", f"{mulDown}.input1")
				cmds.connectAttr(f"{brow_ctrl}.downRotateJoints", f"{mulDown}.input2")

				rotYOffset = cmds.createNode("addDoubleLinear", name=f"rotYOffset_{jnt1}")
				cmds.connectAttr(f"{mulUp}.output", f"{rotYOffset}.input1")
				cmds.connectAttr(f"{mulDown}.output", f"{rotYOffset}.input2")

				rotYOffsetSigned = cmds.createNode("multDoubleLinear", name=f"rotYOffsetSigned_{jnt1}")
				cmds.connectAttr(f"{rotYOffset}.output", f"{rotYOffsetSigned}.input1")
				cmds.setAttr(f"{rotYOffsetSigned}.input2", rotYSign)

				cmds.connectAttr(f"{rotYOffsetSigned}.output", f"{jnt1}.rotateY", force=True)

				cmds.select(clear=True)

				# --- Второй джоинт: ребёнок jnt1 ---
				jnt2 = cmds.joint(name=f"{side}_{self.name}_curveJnt_{i:02d}_end")
				cmds.parent(jnt2, jnt1)
				cmds.setAttr(f"{jnt2}.jointOrient", 0, 0, 0)
				cmds.setAttr(f"{jnt2}.translate", 0.05, 0, 0)

				# --- Матрица офсета по Y (тот же rotYOffsetSigned, что и у jnt1) ---
				offsetMat = cmds.createNode("composeMatrix", name=f"rotYOffsetMat_{jnt2}")
				cmds.connectAttr(f"{rotYOffsetSigned}.output", f"{offsetMat}.inputRotateY", force=True)

				# --- Вращение родителя БЕЗ scale: parentInverseMatrix несёт ещё и scale (у зеркальной
				# --- стороны отрицательный), из-за него цепочка перестаёт быть чистым поворотом,
				# --- decomposeMatrix даёт неточный Эйлер и флипает около 180 ---
				parentRot = cmds.createNode("pickMatrix", name=f"jnt2ParentRot_{jnt2}")
				cmds.connectAttr(f"{jnt1}.worldMatrix[0]", f"{parentRot}.inputMatrix", force=True)
				cmds.setAttr(f"{parentRot}.useTranslate", 0)
				cmds.setAttr(f"{parentRot}.useScale", 0)
				cmds.setAttr(f"{parentRot}.useShear", 0)
				parentRotInv = cmds.createNode("inverseMatrix", name=f"jnt2ParentRotInv_{jnt2}")
				cmds.connectAttr(f"{parentRot}.outputMatrix", f"{parentRotInv}.inputMatrix", force=True)

				# --- rotate = офсет + mp.rotate, погашенный вращением родителя (root_connector) ---
				# --- вся цепочка - чистые повороты, разлагаем один раз ---
				mpRotMat = cmds.createNode("composeMatrix", name=f"mpRotMat_{jnt2}")
				cmds.connectAttr(f"{mp}.rotate", f"{mpRotMat}.inputRotate", force=True)
				mm2 = cmds.createNode("multMatrix", name=f"jnt2RotMat_{jnt2}")
				cmds.connectAttr(f"{offsetMat}.outputMatrix", f"{mm2}.matrixIn[0]", force=True)
				cmds.connectAttr(f"{mpRotMat}.outputMatrix", f"{mm2}.matrixIn[1]", force=True)
				cmds.connectAttr(f"{parentRotInv}.outputMatrix", f"{mm2}.matrixIn[2]", force=True)
				dm2 = cmds.createNode("decomposeMatrix", name=f"jnt2RotDM_{jnt2}")
				cmds.connectAttr(f"{mm2}.matrixSum", f"{dm2}.inputMatrix", force=True)
				cmds.connectAttr(f"{dm2}.outputRotate", f"{jnt2}.rotate", force=True)
				end_joints.append(jnt2)

			cmds.select(main_joints)
			# print(f"Готово! Создано {len(main_joints)} точек. Up-вектор блендится между двумя ближайшими контролами.")
			return main_joints, end_joints


		# Запуск
		create_joints_on_curve_from_selection("l")
		create_joints_on_curve_from_selection("r")

		self.addSkinJoints()

	def addSkinJoints(self, m_name=None):
		if not m_name:
			m_name = self.name

		root_out_joint = f"{m_name}_root_outJoint"
		if not cmds.objExists(root_out_joint):
			cmds.warning(f"Cannot find {root_out_joint}")
			return
		
		try:
			jointsSize = cmds.getAttr(self.main.rig.root+".jointsSize")
		except Exception:
			jointsSize = 1

		root_skin_joint = f"{m_name}_root_skinJoint"
		if cmds.objExists(root_skin_joint):
			cmds.delete(root_skin_joint)

		# --- Корень: подхватываем root_out_joint по матрице, чтобы не зависеть от того,
		# --- под кем root_skin_joint окажется после connect()/disconnect() (skeleton или self.parent) ---
		cmds.select(clear=True)
		cmds.joint(name=root_skin_joint)
		cmds.parent(root_skin_joint, 'skeleton')
		cmds.setAttr(f"{root_skin_joint}.jointOrient", 0, 0, 0)
		cmds.setAttr(f"{root_skin_joint}.segmentScaleCompensate", 0)
		cmds.setAttr(f"{root_skin_joint}.radius", cmds.getAttr(root_out_joint+".radius")*jointsSize)
		utils.connectByMatrix(root_skin_joint, [root_out_joint, root_skin_joint],
							   ['worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=m_name)
		utils.addToModuleSet(root_skin_joint, m_name)
		if not cmds.objExists('skinJointsSet'):
			cmds.sets(n='skinJointsSet')
		cmds.sets(root_skin_joint, e=1, forceElement='skinJointsSet')

		cmds.setAttr(f"{root_skin_joint}.drawStyle", 2)

		# --- Центральная кость на переносице: прямой ребёнок root_out_joint, поэтому,
		# --- как и с jnt2, хватает дешёвого connectTrandform без матриц ---
		center_out_joint = f"{m_name}_center_outJoint"
		if cmds.objExists(center_out_joint):
			center_skin_joint = center_out_joint.replace("outJoint", "skinJoint")
			cmds.select(clear=True)
			cmds.joint(name=center_skin_joint)
			cmds.parent(center_skin_joint, root_skin_joint)
			cmds.setAttr(f"{center_skin_joint}.jointOrient", *cmds.getAttr(center_out_joint+".jointOrient")[0])
			cmds.setAttr(f"{center_skin_joint}.segmentScaleCompensate", 0)
			cmds.setAttr(f"{center_skin_joint}.radius", cmds.getAttr(center_out_joint+".radius")*jointsSize)
			utils.connectTrandform(center_out_joint, center_skin_joint)
			utils.addToModuleSet(center_skin_joint, m_name)
			cmds.sets(center_skin_joint, e=1, forceElement='skinJointsSet')

		for side in ("l", "r"):
			joints = cmds.ls(f"{side}_{m_name}_curveJnt_*", type="joint") or []
			main_joints = sorted(j for j in joints if not j.endswith("_end"))

			for jnt1 in main_joints:
				# --- jnt1 сидит внутри локатора (не прямой ребёнок root_out_joint), поэтому
				# --- гонять его локальный transform бессмысленно - дороже, но верно: по матрице ---
				skin_jnt1 = f"{jnt1}_skinJoint"
				cmds.select(clear=True)
				cmds.joint(name=skin_jnt1)
				cmds.parent(skin_jnt1, root_skin_joint)
				cmds.setAttr(f"{skin_jnt1}.jointOrient", 0, 0, 0)
				cmds.setAttr(f"{skin_jnt1}.segmentScaleCompensate", 0)
				cmds.setAttr(f"{skin_jnt1}.radius", cmds.getAttr(jnt1+".radius")*jointsSize)
				utils.connectByMatrix(skin_jnt1, [jnt1, skin_jnt1],
									   ['worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=m_name)
				utils.addToModuleSet(skin_jnt1, m_name)
				cmds.sets(skin_jnt1, e=1, forceElement='skinJointsSet')

				# --- pos переезжает на скин-джоинт: им и управляют, джоинт модуля просто следует ---
				cmds.addAttr(skin_jnt1, longName="pos", attributeType="double",
							 min=0, max=1, defaultValue=cmds.getAttr(jnt1+".pos"), keyable=True)
				cmds.connectAttr(f"{skin_jnt1}.pos", f"{jnt1}.pos", force=True)

				# --- jnt2 - прямой ребёнок jnt1 и в исходной иерархии, и здесь: раз skin_jnt1
				# --- по матрице точно совпадает с jnt1, для jnt2 хватает дешёвого connectAttr ---
				jnt2 = f"{jnt1}_end"
				if cmds.objExists(jnt2):
					skin_jnt2 = f"{jnt2}_skinJoint"
					cmds.select(clear=True)
					cmds.joint(name=skin_jnt2)
					cmds.parent(skin_jnt2, skin_jnt1)
					cmds.setAttr(f"{skin_jnt2}.jointOrient", *cmds.getAttr(jnt2+".jointOrient")[0])
					cmds.setAttr(f"{skin_jnt2}.segmentScaleCompensate", 0)
					cmds.setAttr(f"{skin_jnt2}.radius", cmds.getAttr(jnt2+".radius")*jointsSize/2)
					utils.connectTrandform(jnt2, skin_jnt2)
					utils.addToModuleSet(skin_jnt2, m_name)
					cmds.sets(skin_jnt2, e=1, forceElement='skinJointsSet')