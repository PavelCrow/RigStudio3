import maya.cmds as cmds
import maya.api.OpenMaya as om
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
		self.widget = None

	def connectSignals(self, mainInstance, w):
		self.mainInstance = mainInstance
		self.widget = w

		w.setEdges_btn.clicked.connect(partial(self.setEdges, w))
		w.regenerate_btn.clicked.connect(self.generate)
		if hasattr(w, "regenerateCount_btn"):
			w.regenerateCount_btn.clicked.connect(self.generateByCount)
		if hasattr(w, "makeLocal_btn"):
			w.makeLocal_btn.clicked.connect(self.makeLocal)
		if hasattr(w, "makeWorld_btn"):
			w.makeWorld_btn.clicked.connect(self.makeWorld)
		
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

		self.getOptions()
		widget.edges_lineEdit.setText(self.edges)
		if hasattr(widget, "jointsCount_spinBox"):
			current = len(self.getCurveJoints("l"))
			if current:
				widget.jointsCount_spinBox.setValue(current)
		self.updateModeButtons(widget)

	def updateModeButtons(self, widget=None):
		"""Активна только та кнопка, которая меняет режим: вторая уже применена."""
		widget = widget or self.widget
		if not widget:
			return
		local = self.isLocal()
		if hasattr(widget, "makeLocal_btn"):
			widget.makeLocal_btn.setEnabled(not local)
		if hasattr(widget, "makeWorld_btn"):
			widget.makeWorld_btn.setEnabled(local)

	def getOptions(self):

		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
		else:
			optionsData = {}

		if optionsData == {}:
			# без сброса в поле опций оставались рёбра прошлого модуля
			optionsData['edges'] = ''
			self.edges = ''

		else:
			self.edges = optionsData['edges']

		# режим читается из сцены, чтобы уйти в темплейт и пережить ребилд модуля
		optionsData['localRig'] = self.isLocal()

		# pos скиновых костей - их двигают руками, и без них generate() при
		# загрузке темплейта расставил бы кости по исходным точкам кривой
		optionsData['posData'] = self.getPosData()

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

	def getPosData(self):
		"""pos каждой кости на кривой, по сторонам: {"l": [...], "r": [...]}."""
		posData = {}
		for side in ("l", "r"):
			values = []
			for jnt in self.getCurveJoints(side):
				skin = jnt + "_skinJoint"
				plug = skin if cmds.objExists(skin + ".pos") else jnt
				if cmds.objExists(plug + ".pos"):
					values.append(cmds.getAttr(plug + ".pos"))
			posData[side] = values
		return posData

	def setPosData(self, posData):
		for side in ("l", "r"):
			joints = self.getCurveJoints(side)
			for jnt, value in zip(joints, posData.get(side) or []):
				skin = jnt + "_skinJoint"
				plug = skin if cmds.objExists(skin + ".pos") else jnt
				if not cmds.objExists(plug + ".pos"):
					continue
				# правая сторона ведома левой (см. addSkinJoints) - писать в неё нельзя
				if cmds.listConnections(plug + ".pos", source=1, destination=0):
					continue
				cmds.setAttr(plug + ".pos", value)

	# ------------------------------------------------------------------ локальный режим
	# Модуль перестаёт ехать за головой и остаётся в центре сцены, а на персонаже
	# работают прокси-контролы: они носят прежние имена, а настоящие получают префикс.
	# Прокси ведёт свой контрол канал в канал, без мировых матриц.
	localPrefix = "localRig_"

	def isLocal(self):
		if not self.root or not cmds.objExists(self.root + ".localRig"):
			return False
		return bool(cmds.getAttr(self.root + ".localRig"))

	def setOutputVisible(self, visible):
		"""Показать или спрятать кости модуля.

		В мировом режиме их место в сцене занимают скиновые, поэтому группа скрыта, а у
		костей drawStyle = 2 (его ставит module.build). В локальном режиме скиновых нет
		вовсе, и эти кости - те самые, на которые скинится локальная геометрия.
		"""
		out_grp = f"{self.name}_output"
		if not cmds.objExists(out_grp):
			return
		try:
			cmds.setAttr(out_grp + ".visibility", bool(visible))
		except Exception as e:
			cmds.warning(f"Cannot show {out_grp} ({e})")
		root_out_joint = f"{self.name}_root_outJoint"
		for j in cmds.listRelatives(out_grp, allDescendents=1, type="joint") or []:
			# корневая кость не рисуется никогда: она служебная, скиновая копия тоже None
			draw = 2 if (not visible or j == root_out_joint) else 0
			try:
				cmds.setAttr(j + ".drawStyle", draw)
			except Exception:
				pass

	def spaceMatrixPlug(self, attr="worldMatrix"):
		"""Матрица пространства модуля: в локальном режиме - позер, иначе коннектор."""
		node = f"{self.name}_root_poser" if self.isLocal() else f"{self.name}_root_connector"
		return f"{node}.{attr}[0]"

	def localControlName(self, control):
		return self.localPrefix + control

	def getModuleControls(self):
		"""Контролы модуля: из наборов плюс главные - их в наборах нет.

		l_brow и r_brow в шаблоне не подключены ни к одному moduleControlSet,
		поэтому getControls() их не отдаёт, и прокси для них не делались.
		"""
		controls = list(self.getControls())
		for extra in (f"{self.name}_l_brow", f"{self.name}_r_brow"):
			if extra in controls:
				continue
			if cmds.objExists(extra) or cmds.objExists(self.localControlName(extra)):
				controls.append(extra)
		return controls

	def linkProxy(self, proxy, local):
		"""Прокси ведёт настоящий контрол: тот же атрибут в тот же атрибут.

		Не только keyable каналы, но и все пользовательские атрибуты - и те, что видны
		в channel box без ключей (настройки вроде upLimit, lift/side), и скрытые:
		модуль читает их с настоящего контрола, а правят их на прокси.
		"""
		attrs = set(cmds.listAttr(local, keyable=1) or []) | set(cmds.listAttr(local, userDefined=1) or [])
		for attr in sorted(attrs):
			src_, dst = f"{proxy}.{attr}", f"{local}.{attr}"
			if "." in attr or not cmds.objExists(src_) or not cmds.objExists(dst):
				continue
			# компаунд целиком не трогаем - его дети идут в этом же списке отдельно
			if cmds.attributeQuery(attr, node=local, listChildren=True):
				continue
			if cmds.getAttr(dst, lock=True):
				continue
			if cmds.listConnections(dst, source=1, destination=0):
				continue
			try:
				cmds.connectAttr(src_, dst, force=True)
			except Exception as e:
				cmds.warning(f"Cannot link {src_} -> {dst} ({e})")

		# связи контрола с самим собой (limits -> ограничения translate и т.п.) повторяем
		# на прокси, иначе у него самого эти настройки не работали бы
		pairs = cmds.listConnections(local, source=1, destination=0, plugs=1, connections=1) or []
		for dst, src_ in zip(pairs[0::2], pairs[1::2]):
			if src_.split(".")[0] != local:
				continue
			p_src = proxy + "." + src_.split(".", 1)[1]
			p_dst = proxy + "." + dst.split(".", 1)[1]
			if cmds.objExists(p_src) and cmds.objExists(p_dst):
				try:
					cmds.connectAttr(p_src, p_dst, force=True)
				except Exception:
					pass

	def unlinkProxy(self, proxy, local):
		"""Снять связи прокси с контрола, оставив на нём текущие значения."""
		pairs = cmds.listConnections(local, source=1, destination=0, plugs=1, connections=1) or []
		for dst, src_ in zip(pairs[0::2], pairs[1::2]):
			if src_.split(".")[0] != proxy:
				continue
			cmds.disconnectAttr(src_, dst)
			try:
				value = cmds.getAttr(src_)
				if cmds.getAttr(src_, type=True) == "string":
					cmds.setAttr(dst, value or "", type="string")
				elif isinstance(value, list):
					cmds.setAttr(dst, *value[0])
				else:
					cmds.setAttr(dst, value)
			except Exception:
				pass

	def makeLocal(self):
		if self.isLocal():
			cmds.warning(f"{self.name}: module is local already")
			return

		connector = f"{self.name}_root_connector"
		root_poser = f"{self.name}_root_poser"
		controls_grp = f"{self.name}_controls"
		mod = self.root
		for n in (connector, root_poser, controls_grp, mod):
			if not cmds.objExists(n):
				cmds.warning(f"Cannot find {n}")
				return

		# --- Локальное пространство модуля - это его позер.
		# --- Коннектор = root_poser.wm * initLoc.wim * outJoint.wm, то есть поза позера
		# --- плюс анимация родителя; берём из него только позерную часть. Связь живая,
		# --- поэтому позеры по-прежнему двигают модуль без пересборки.
		# --- Переключаем ВСЕХ потребителей коннектора, а не только группу контролов:
		# --- на нём же висят выходные кости (root_outJoint.opm), заводка позеров в
		# --- пространство модуля и worldUpMatrix у motionPath, сделанных generate().
		switched = []
		for attr in ("worldMatrix", "worldInverseMatrix"):
			for dst in cmds.listConnections(f"{connector}.{attr}[0]", source=0, destination=1, plugs=1) or []:
				cmds.connectAttr(f"{root_poser}.{attr}[0]", dst, force=True)
				switched.append([dst, attr])
		utils.pyToAttr(self.root + ".localRigPlugs", switched)

		# --- Разница между коннектором и позером - это и есть анимация родителя.
		# --- Ей двигаются прокси, остальное уже сидит в матрицах самих контролов.
		delta = f"{self.name}_localRigDelta_multMatrix"
		if not cmds.objExists(delta):
			delta = cmds.createNode("multMatrix", n=delta)
		for i, m in enumerate((mod + ".worldInverseMatrix[0]", root_poser + ".worldInverseMatrix[0]",
							   connector + ".worldMatrix[0]", mod + ".worldMatrix[0]")):
			cmds.connectAttr(m, f"{delta}.matrixIn[{i}]", force=True)
		utils.addToModuleSet(delta, self.name)

		proxy_grp = f"{self.name}_proxyControls"
		if not cmds.objExists(proxy_grp):
			proxy_grp = cmds.createNode("transform", n=proxy_grp, p=mod)
		utils.addToModuleSet(proxy_grp, self.name)

		for control in self.getModuleControls():
			parent_grp = (cmds.listRelatives(control, parent=1) or [None])[0]
			# оба дерева наборов: свой moduleControlSet и его копия controlSet, которую
			# module.build кладёт в общий controlSet - иначе в анимационном дереве
			# оставались бы настоящие контролы с префиксом
			control_sets = [s for s in cmds.listSets(o=control) or [] if s.endswith("controlSet")]

			local = cmds.rename(control, self.localControlName(control))

			# прокси - тот же трансформ с теми же атрибутами, но без детей
			proxy = cmds.duplicate(local, parentOnly=True, n=control)[0]

			# Место прокси держит ЕГО ГРУППА, а сам прокси остаётся с единичным
			# offsetParentMatrix, как обычный контрол: utils.curveShapeToCommand()
			# (его зовёт getData) дублирует контрол и обнуляет каналы, но не opm -
			# с матрицей в opm формы уходили в данные перемноженными на неё и после
			# ребилда разлетались.
			grp = cmds.createNode("transform", n=f"{control}_proxy_group", p=proxy_grp)
			# relative - иначе Maya пересчитает локальные каналы под новое место,
			# а они должны остаться теми же: положение даёт матрица группы
			proxy = cmds.parent(proxy, grp, relative=True)[0]
			utils.addToModuleSet(grp, self.name)

			# место группы = место контрола в локальном риге плюс анимация родителя
			if parent_grp:
				mm = cmds.createNode("multMatrix", n=f"{control}_proxy_multMatrix")
				cmds.connectAttr(parent_grp + ".worldMatrix[0]", mm + ".matrixIn[0]")
				cmds.connectAttr(delta + ".matrixSum", mm + ".matrixIn[1]")
				cmds.connectAttr(proxy_grp + ".worldInverseMatrix[0]", mm + ".matrixIn[2]")
				cmds.connectAttr(mm + ".matrixSum", grp + ".offsetParentMatrix", force=True)
				utils.addToModuleSet(mm, self.name)

			# формы переезжают копией: сам контрол остаётся, но в вьюпорте не мешает
			for shape in cmds.listRelatives(local, shapes=1, fullPath=1) or []:
				vis = (cmds.listConnections(shape + ".visibility", source=1, destination=0, plugs=1) or [""])[0]
				tmp = cmds.duplicate(shape, returnRootsOnly=1)[0]
				new = cmds.parent(cmds.listRelatives(tmp, shapes=1, fullPath=1)[0], proxy, shape=1, relative=1)[0]
				new = cmds.rename(new, proxy + "Shape")
				cmds.delete(tmp)
				if vis:
					cmds.connectAttr(vis, new + ".visibility", force=True)
				cmds.setAttr(shape + ".lodVisibility", 0)

			self.linkProxy(proxy, local)

			for s_ in control_sets:
				cmds.sets(proxy, e=1, forceElement=s_)
				try:
					cmds.sets(local, e=1, remove=s_)
				except Exception:
					pass
			utils.addToModuleSet(proxy, self.name)

		# остатки от прежних включений: настоящих контролов в наборах быть не должно
		for set_ in cmds.ls(type="objectSet") or []:
			if not set_.endswith("controlSet"):
				continue
			for member in cmds.sets(set_, q=1) or []:
				if member.startswith(self.localPrefix):
					try:
						cmds.sets(member, e=1, remove=set_)
					except Exception:
						pass

		# --- скиновых костей в скелете нет: локальную геометрию скинят кости модуля ---
		root_skin_joint = f"{self.name}_root_skinJoint"
		if cmds.objExists(root_skin_joint):
			cmds.delete(root_skin_joint)
			# с последним членом Maya удаляет и сам сет, а за пустым skinJointsSet - sets
			utils.create_default_sets()

		# в локальном режиме эти кости - видимые: скиновых в скелете больше нет
		self.setOutputVisible(True)

		utils.setUserAttr(self.root, "localRig", 1, type="bool", lock=0)
		self.updateModeButtons()
		print(f"[{self.name}] local mode on")

	def makeWorld(self):
		if not self.isLocal():
			cmds.warning(f"{self.name}: module is not local")
			return

		for proxy in self.getModuleControls():
			local = self.localControlName(proxy)
			if not cmds.objExists(local) or not cmds.objExists(proxy):
				continue
			control_sets = [s for s in cmds.listSets(o=proxy) or [] if s.endswith("controlSet")]

			self.unlinkProxy(proxy, local)

			for shape in cmds.listRelatives(local, shapes=1, fullPath=1) or []:
				cmds.setAttr(shape + ".lodVisibility", 1)

			for n in (proxy, f"{proxy}_proxy_group", f"{proxy}_proxy_multMatrix"):
				if cmds.objExists(n):
					cmds.delete(n)
			cmds.rename(local, proxy)
			for s_ in control_sets:
				cmds.sets(proxy, e=1, forceElement=s_)

		for n in (f"{self.name}_proxyControls", f"{self.name}_localRigDelta_multMatrix"):
			if cmds.objExists(n):
				cmds.delete(n)

		# вернуть коннектор всем, у кого он был отобран
		connector = f"{self.name}_root_connector"
		switched = utils.attrToPy(self.root + ".localRigPlugs") if cmds.objExists(self.root + ".localRigPlugs") else []
		for dst, attr in switched or []:
			if cmds.objExists(dst.split(".")[0]):
				cmds.connectAttr(f"{connector}.{attr}[0]", dst, force=True)

		# motionPath, сделанные generate() уже в локальном режиме, в этом списке не лежат
		for mp in cmds.ls(f"*_{self.name}_curveLoc_*_motionPath", type="motionPath") or []:
			cmds.connectAttr(f"{connector}.worldMatrix[0]", mp + ".worldUpMatrix", force=True)

		utils.setUserAttr(self.root, "localRig", 0, type="bool", lock=0)
		self.addSkinJoints()
		self.setOutputVisible(False)
		self.updateModeButtons()
		print(f"[{self.name}] world mode on")

	def getCurveJoints(self, side):
		"""Кости на кривой одной стороны, по порядку номеров."""
		joints = cmds.ls(f"{side}_{self.name}_curveJnt_*", type="joint") or []
		return sorted(j for j in joints if not j.endswith("_end") and not j.endswith("_skinJoint"))

	def getData(self): #
		data = super(self.__class__, self).getData()
		data['optionsData'] = self.getOptions()
		return data

	def setData(self, data, sym=False, namingForce=False, load="all"): #
		super(self.__class__, self).setData(data, sym, namingForce, load)

		# опции применяет базовый setData (он же ставит self.edges), здесь они нужны
		# только чтобы вернуть pos
		optionsData = data.get('optionsData') or {}

		# из темплейта кости на кривой не приходят, их ставит generate(), а он висит на
		# кнопке - зовём его здесь (так же в brows.py). Как они строились - не важно:
		# в данных лежат сами pos, кости встают прямо по ним
		posData = optionsData.get('posData') or {}
		if not self.getCurveJoints("l"):
			if posData.get('l'):
				self.generate(positions=posData)
			elif self.edges:
				self.generate()

		if posData:
			self.setPosData(posData)

		# модуль всегда собирается мировым (он строится из шаблона), поэтому локальный
		# режим включаем здесь - и после ребилда модуля, и после загрузки темплейта
		if optionsData.get('localRig') and not self.isLocal():
			self.makeLocal()

		if self.widget:
			self.updateOptionsPage(self.widget)

	def generateByCount(self, count=None):
		"""Кнопка: кости ставятся поровну по кривой, без вершин меша."""
		if not count:
			if self.widget and hasattr(self.widget, "jointsCount_spinBox"):
				count = self.widget.jointsCount_spinBox.value()
			else:
				count = len(self.getCurveJoints("l")) or 8
		self.generate(count=int(count))

	def generate(self, count=None, positions=None):
		"""Кости на кривой.

		positions - готовые pos по сторонам ({"l": [...], "r": [...]}), так приходит из темплейта;
		count - поставить столько костей поровну по кривой;
		без того и другого точки берутся из вершин меша (self.edges).
		"""
		count = int(count) if count else 0

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

			# --- Чистим всё, что сделал прошлый generate: у всех его нод общий префикс,
			# --- поэтому утилитные ноды больше не остаются висеть, а имена не уезжают в _1 ---
			existing = [n for n in cmds.ls(f"{side}_{self.name}_curve*") or [] if cmds.objExists(n)]
			if existing:
				cmds.delete(existing)

			if positions:
				values = positions.get(side) or positions.get("l") or []
				return build_joints(side, [(u, cmds.pointOnCurve(curve, pr=u, p=True)) for u in values])

			if count:
				# кости поровну по кривой, от начала до конца: параметр кривой как раз 0..1
				us = [(float(i) / (count - 1)) if count > 1 else 0.5 for i in range(count)]
				return build_joints(side, [(u, cmds.pointOnCurve(curve, pr=u, p=True)) for u in us])

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
				npoc = cmds.createNode("nearestPointOnCurve", name="temp_npoc")
				cmds.connectAttr(f"{curve}.worldSpace[0]", f"{npoc}.inputCurve", force=True)
				cmds.setAttr(f"{npoc}.inPosition", *pos, type="double3")

				u = cmds.getAttr(f"{npoc}.parameter")
				closest_pos = cmds.getAttr(f"{npoc}.position")[0]
				cmds.delete(npoc)

				points_data.append((u, closest_pos))

			points_data.sort(key=lambda x: x[0])
			# первая точка приходится на центр брови, там уже стоит center_joint
			points_data = points_data[1:]

			return build_joints(side, points_data)

		def build_joints(side, points_data):
			curve = f"{self.name}_{side}_curve"
			brow_ctrl = f"{self.name}_l_brow"
			up_controls = [
				f"{self.name}_brow_center",
				f"{self.name}_{side}_brow_in",
				f"{self.name}_{side}_brow_mid",
				f"{self.name}_{side}_brow_out",
				f"{self.name}_{side}_brow_last"
			]

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
				mp = cmds.createNode("motionPath", name=f"{loc}_motionPath")
				cmds.connectAttr(f"{curve}.worldSpace[0]", f"{mp}.geometryPath", force=True)

				cmds.setAttr(f"{mp}.fractionMode", 0)
				cmds.setAttr(f"{mp}.follow", 1)
				# up от root_connector, а не от контролов брови: он вращается вместе с ригом,
				# но не крутится от анимации бровей, поэтому фрейм не вырождается.
				# Твист от контролов добавляем ниже через frontTwist, от их rotateX
				cmds.setAttr(f"{mp}.worldUpType", 2)          # Object Rotation Up
				cmds.connectAttr(self.spaceMatrixPlug(), f"{mp}.worldUpMatrix", force=True)

				# allCoordinates — мировые координаты, переводим их в пространство родителя (root_out_joint)
				pmm = cmds.createNode("pointMatrixMult", name=f"{loc}_pointMatrixMult")
				cmds.connectAttr(f"{mp}.allCoordinates", f"{pmm}.inPoint", force=True)
				cmds.connectAttr(f"{loc}.parentInverseMatrix[0]", f"{pmm}.inMatrix", force=True)
				cmds.connectAttr(f"{pmm}.output", f"{loc}.translate", force=True)

				# --- Основной джоинт, внутри локатора ---
				jnt1 = cmds.joint(name=f"{side}_{self.name}_curveJnt_{i:02d}")
				cmds.parent(jnt1, loc, relative=True)
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
				tw1 = cmds.createNode("multDoubleLinear", name=f"{jnt1}_twistNear_multDoubleLinear")
				cmds.connectAttr(f"{ctrl1}.rotateX", f"{tw1}.input1", force=True)
				cmds.setAttr(f"{tw1}.input2", weight1)

				tw2 = cmds.createNode("multDoubleLinear", name=f"{jnt1}_twistFar_multDoubleLinear")
				cmds.connectAttr(f"{ctrl2}.rotateX", f"{tw2}.input1", force=True)
				cmds.setAttr(f"{tw2}.input2", weight2)

				twist = cmds.createNode("addDoubleLinear", name=f"{jnt1}_twist_addDoubleLinear")
				cmds.connectAttr(f"{tw1}.output", f"{twist}.input1", force=True)
				cmds.connectAttr(f"{tw2}.output", f"{twist}.input2", force=True)

				# правая сторона зеркальна - твист тоже инвертируем (тот же rotYSign)
				twistSigned = cmds.createNode("multDoubleLinear", name=f"{jnt1}_twistSigned_multDoubleLinear")
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

				deltaY = cmds.createNode("plusMinusAverage", name=f"{jnt1}_locDeltaY_plusMinusAverage")
				cmds.setAttr(f"{deltaY}.operation", 2)  # subtract
				cmds.connectAttr(f"{loc}.translateY", f"{deltaY}.input1D[0]")
				cmds.setAttr(f"{deltaY}.input1D[1]", ty0)

				mdUp = cmds.createNode("multiplyDivide", name=f"{jnt1}_upWeight_multiplyDivide")
				cmds.setAttr(f"{mdUp}.operation", 2)  # divide
				cmds.connectAttr(f"{deltaY}.output1D", f"{mdUp}.input1X")
				cmds.connectAttr(f"{brow_ctrl}.upLimit", f"{mdUp}.input2X")
				clampUp = cmds.createNode("clamp", name=f"{jnt1}_upWeight_clamp")
				cmds.setAttr(f"{clampUp}.minR", 0)
				cmds.setAttr(f"{clampUp}.maxR", 1)
				cmds.connectAttr(f"{mdUp}.outputX", f"{clampUp}.inputR")

				mdDown = cmds.createNode("multiplyDivide", name=f"{jnt1}_downWeight_multiplyDivide")
				cmds.setAttr(f"{mdDown}.operation", 2)  # divide
				cmds.connectAttr(f"{deltaY}.output1D", f"{mdDown}.input1X")
				cmds.connectAttr(f"{brow_ctrl}.downLimit", f"{mdDown}.input2X")
				clampDown = cmds.createNode("clamp", name=f"{jnt1}_downWeight_clamp")
				cmds.setAttr(f"{clampDown}.minR", 0)
				cmds.setAttr(f"{clampDown}.maxR", 1)
				cmds.connectAttr(f"{mdDown}.outputX", f"{clampDown}.inputR")

				mulUp = cmds.createNode("multDoubleLinear", name=f"{jnt1}_upRotate_multDoubleLinear")
				cmds.connectAttr(f"{clampUp}.outputR", f"{mulUp}.input1")
				cmds.connectAttr(f"{brow_ctrl}.upRotateJoints", f"{mulUp}.input2")

				mulDown = cmds.createNode("multDoubleLinear", name=f"{jnt1}_downRotate_multDoubleLinear")
				cmds.connectAttr(f"{clampDown}.outputR", f"{mulDown}.input1")
				cmds.connectAttr(f"{brow_ctrl}.downRotateJoints", f"{mulDown}.input2")

				rotYOffset = cmds.createNode("addDoubleLinear", name=f"{jnt1}_rotYOffset_addDoubleLinear")
				cmds.connectAttr(f"{mulUp}.output", f"{rotYOffset}.input1")
				cmds.connectAttr(f"{mulDown}.output", f"{rotYOffset}.input2")

				rotYOffsetSigned = cmds.createNode("multDoubleLinear", name=f"{jnt1}_rotYOffsetSigned_multDoubleLinear")
				cmds.connectAttr(f"{rotYOffset}.output", f"{rotYOffsetSigned}.input1")
				cmds.setAttr(f"{rotYOffsetSigned}.input2", rotYSign)

				cmds.connectAttr(f"{rotYOffsetSigned}.output", f"{jnt1}.rotateY", force=True)

				cmds.select(clear=True)

				# --- Второй джоинт: ребёнок jnt1 ---
				jnt2 = cmds.joint(name=f"{side}_{self.name}_curveJnt_{i:02d}_end")
				cmds.parent(jnt2, jnt1, relative=True)
				cmds.setAttr(f"{jnt2}.jointOrient", 0, 0, 0)
				cmds.setAttr(f"{jnt2}.translate", 0.05, 0, 0)

				# --- Матрица офсета по Y (тот же rotYOffsetSigned, что и у jnt1) ---
				offsetMat = cmds.createNode("composeMatrix", name=f"{jnt2}_rotYOffsetMat_composeMatrix")
				cmds.connectAttr(f"{rotYOffsetSigned}.output", f"{offsetMat}.inputRotateY", force=True)

				# --- Вращение родителя БЕЗ scale: parentInverseMatrix несёт ещё и scale (у зеркальной
				# --- стороны отрицательный), из-за него цепочка перестаёт быть чистым поворотом,
				# --- decomposeMatrix даёт неточный Эйлер и флипает около 180 ---
				parentRot = cmds.createNode("pickMatrix", name=f"{jnt2}_parentRot_pickMatrix")
				cmds.connectAttr(f"{jnt1}.worldMatrix[0]", f"{parentRot}.inputMatrix", force=True)
				cmds.setAttr(f"{parentRot}.useTranslate", 0)
				cmds.setAttr(f"{parentRot}.useScale", 0)
				cmds.setAttr(f"{parentRot}.useShear", 0)
				parentRotInv = cmds.createNode("inverseMatrix", name=f"{jnt2}_parentRotInv_inverseMatrix")
				cmds.connectAttr(f"{parentRot}.outputMatrix", f"{parentRotInv}.inputMatrix", force=True)

				# --- rotate = офсет + mp.rotate, погашенный вращением родителя (root_connector) ---
				# --- вся цепочка - чистые повороты, разлагаем один раз ---
				mpRotMat = cmds.createNode("composeMatrix", name=f"{jnt2}_mpRot_composeMatrix")
				cmds.connectAttr(f"{mp}.rotate", f"{mpRotMat}.inputRotate", force=True)
				mm2 = cmds.createNode("multMatrix", name=f"{jnt2}_rot_multMatrix")
				cmds.connectAttr(f"{offsetMat}.outputMatrix", f"{mm2}.matrixIn[0]", force=True)
				cmds.connectAttr(f"{mpRotMat}.outputMatrix", f"{mm2}.matrixIn[1]", force=True)
				cmds.connectAttr(f"{parentRotInv}.outputMatrix", f"{mm2}.matrixIn[2]", force=True)
				dm2 = cmds.createNode("decomposeMatrix", name=f"{jnt2}_rot_decomposeMatrix")
				cmds.connectAttr(f"{mm2}.matrixSum", f"{dm2}.inputMatrix", force=True)
				cmds.connectAttr(f"{dm2}.outputRotate", f"{jnt2}.rotate", force=True)
				end_joints.append(jnt2)

			# --- Ноды generate() принадлежат модулю: по нему их удаляет module.delete(),
			# --- раньше в наборе были только кости из addSkinJoints ---
			for n in cmds.ls(f"{side}_{self.name}_curve*") or []:
				if not cmds.ls(n, shapes=True):
					utils.addToModuleSet(n, self.name)

			cmds.select(main_joints)
			# print(f"Готово! Создано {len(main_joints)} точек. Up-вектор блендится между двумя ближайшими контролами.")
			return main_joints, end_joints


		# Запуск
		create_joints_on_curve_from_selection("l")
		create_joints_on_curve_from_selection("r")

		self.addSkinJoints()

		# Кости на кривой появляются уже после сборки модуля, поэтому штатное скрытие
		# выходных костей (module.build) их не застаёт. В локальном режиме, наоборот,
		# показываем: скиновых там нет, и скинить геометрию не на что.
		self.setOutputVisible(self.isLocal())

	def addSkinJoints(self, m_name=None):
		if not m_name:
			m_name = self.name

		# в локальном режиме скиновых костей нет вовсе: геометрию скинят кости модуля
		if self.isLocal():
			return

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
		# relative везде: значения костей тут же перезаписываются связями, а без него Maya
		# компенсирует скейл родителя и вставляет между костями группы transform
		cmds.parent(root_skin_joint, 'skeleton', relative=True)
		cmds.setAttr(f"{root_skin_joint}.jointOrient", 0, 0, 0)
		cmds.setAttr(f"{root_skin_joint}.segmentScaleCompensate", 0)
		cmds.setAttr(f"{root_skin_joint}.radius", cmds.getAttr(root_out_joint+".radius")*jointsSize)
		utils.connectByMatrix(root_skin_joint, [root_out_joint, root_skin_joint],
							   ['worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=m_name)
		utils.addToModuleSet(root_skin_joint, m_name)
		# Maya удаляет сет, когда из него убрали последнего члена, а вслед за пустым
		# skinJointsSet исчезает и sets - поэтому создаём их штатной функцией, иначе
		# пересозданный здесь skinJointsSet оставался бы сам по себе, вне sets
		utils.create_default_sets()
		cmds.sets(root_skin_joint, e=1, forceElement='skinJointsSet')

		cmds.setAttr(f"{root_skin_joint}.drawStyle", 2)

		# --- Центральная кость на переносице: прямой ребёнок root_out_joint, поэтому,
		# --- как и с jnt2, хватает дешёвого connectTrandform без матриц ---
		center_out_joint = f"{m_name}_center_outJoint"
		if cmds.objExists(center_out_joint):
			center_skin_joint = center_out_joint.replace("outJoint", "skinJoint")
			cmds.select(clear=True)
			cmds.joint(name=center_skin_joint)
			cmds.parent(center_skin_joint, root_skin_joint, relative=True)
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
				cmds.parent(skin_jnt1, root_skin_joint, relative=True)
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
					cmds.parent(skin_jnt2, skin_jnt1, relative=True)
					cmds.setAttr(f"{skin_jnt2}.jointOrient", *cmds.getAttr(jnt2+".jointOrient")[0])
					cmds.setAttr(f"{skin_jnt2}.segmentScaleCompensate", 0)
					cmds.setAttr(f"{skin_jnt2}.radius", cmds.getAttr(jnt2+".radius")*jointsSize/2)
					utils.connectTrandform(jnt2, skin_jnt2)
					utils.addToModuleSet(skin_jnt2, m_name)
					cmds.sets(skin_jnt2, e=1, forceElement='skinJointsSet')

		# --- pos правой стороны ведёт левая: точка на кривой настраивается один раз,
		# --- стороны симметричны, и разъехаться им незачем ---
		for l_jnt in sorted(j for j in cmds.ls(f"l_{m_name}_curveJnt_*", type="joint") or []
							if not j.endswith("_end") and not j.endswith("_skinJoint")):
			l_pos = f"{l_jnt}_skinJoint.pos"
			r_pos = f"r{l_jnt[1:]}_skinJoint.pos"
			if cmds.objExists(l_pos) and cmds.objExists(r_pos):
				cmds.connectAttr(l_pos, r_pos, force=True)