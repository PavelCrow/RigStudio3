import maya.cmds as cmds
import maya.mel as mel
import maya.api.OpenMaya as om
import os, math, copy
from functools import partial

from ... import utils, module, posers

rootPath = os.path.normpath(os.path.join(os.path.dirname(__file__), "..", ".."))

# birdTail.ma - готовый хвост, его правят в Maya, модуль импортирует как есть.
# Всё, что зависит от числа перьев и звеньев (перья, звенья, главные, их позеры и
# ноды), записано в сцене в набор generated_nodesSet. Если в опциях другие числа,
# create() снимает раскладку со сцены, пересчитывает её, удаляет этот набор и
# строит его заново здесь - контролы копирует с ближайших контролов сцены.

FEATHERS = 5        # перьев на сторону в сцене по умолчанию
SEGMENTS = 5        # звеньев в пере в сцене по умолчанию

# цвета для первой сборки сцены из образцов (build_scene); дальше цвет - из сцены
COLOR_L, COLOR_R = 6, 13

# что код ждёт в birdTail.ma: переименовал или удалил - сборка скажет, чего нет
BASE_NODES = [
	"mainPoser", "root_poser", "root_poserOrient", "root_initLoc", "posers", "r_initLocs",
	"r_mirror_composeMatrix", "lines_scale_multiplyDivide",
	"base", "main_controls", "feather_controls", "feathers_group", "feathers",
	"feathers_mid_rotation", "feathers_edge_rotation", "feathers_rootEdge_rotation",
	"feathers_spreadCoef_multiplyDivide", "feathers_bendCoef_multiplyDivide",
	"root_outJoint", "main_moduleControlSet", "feathers_moduleControlSet", "skinJointsSet",
	"generated_nodesSet",
]

# раскладка позеров для первой сборки сцены (5 перьев на сторону, 5 звеньев) -
# расстановка Павла 2026-09-28. Дальше раскладка по умолчанию - та, что в сцене.
# Перо 0 - среднее. Позеры звеньев - в системе mainPoser пера: x, y, z, size;
# последний - кончик
DEFAULT_LAYOUT = {
	"feathers": [
		{"t": [0.0, 0.42332, 0.11666], "r": [0.0, 90.0, 0.0], "size": 0.2,
		 "posers": [[x, 0.0, 0.0, 0.15] for x in (0.0, 1.30813, 2.61626, 3.9244, 5.23253, 6.08278)]},
		{"t": [0.17682, 0.40194, 0.08633], "r": [21.6428, 83.3795, -6.34852], "size": 0.2,
		 "posers": [[x, 0.0, 0.0, 0.12] for x in (0.0, 1.26652, 2.53304, 3.79956, 5.06608, 5.87472)]},
		{"t": [0.27052, 0.33467, 0.28125], "r": [33.12807, 78.22911, -8.89706], "size": 0.2,
		 "posers": [[x, 0.0, 0.0, 0.12] for x in (0.0, 1.26834, 2.53669, 3.80503, 5.07337, 5.88383)]},
		{"t": [0.3665, 0.2293, 0.28732], "r": [38.31301, 72.2768, -11.70639], "size": 0.2,
		 "posers": [[x, 0.0, 0.0, 0.12] for x in (0.0, 1.24987, 2.49973, 3.7496, 4.99946, 5.79145)]},
		{"t": [0.45169, 0.09972, 0.33745], "r": [43.90359, 68.03587, -17.61052], "size": 0.2,
		 "posers": [[x, 0.0, 0.0, 0.12] for x in (0.0, 1.2327, 2.46539, 3.69809, 4.93079, 5.7056)]},
		{"t": [0.49872, -0.01788, 0.39374], "r": [50.73323, 64.59158, -19.71274], "size": 0.2,
		 "posers": [[x, 0.0, 0.0, 0.12] for x in (0.0, 1.21145, 2.42291, 3.63436, 4.84581, 5.59939)]},
	],
	# смещения позеров главных от позера своего звена среднего пера и size;
	# None - главные на самом пере
	"mains": None,
}


# ============================================================================ names

def _prefix(m_name):
	# пустое имя - сама сцена модуля, без префикса
	return m_name + "_" if m_name else ""

def scene_counts(m_name):
	"""Число перьев на сторону и звеньев - по позерам в сцене."""
	P = _prefix(m_name)
	feathers = 0
	while cmds.objExists("%sl_feather_%d_mainPoser" % (P, feathers+1)):
		feathers += 1
	segments = 0
	while cmds.objExists("%sm_feather_%d_poser" % (P, segments+1)):
		segments += 1
	return feathers, segments

def feather_name(side, i):
	return "m_feather" if side == "m" else "%s_feather_%d" % (side, i)

def seg_names(pf, segs):
	return ["%s_%d" % (pf, j) for j in range(1, segs+1)] + [pf+"_end"]


# ============================================================================ layout

def _lerp(a, b, w):
	return [x + (y-x)*w for x, y in zip(a, b)]

def _slerp_euler(a, b, w):
	qa = om.MEulerRotation(*[math.radians(x) for x in a]).asQuaternion()
	qb = om.MEulerRotation(*[math.radians(x) for x in b]).asQuaternion()
	e = om.MQuaternion.slerp(qa, qb, w).asEulerRotation()
	return [math.degrees(e.x), math.degrees(e.y), math.degrees(e.z)]

def _resample_polyline(pts, count):
	"""count точек по ломаной pts (x, y, z, size) по доле номера звена, не длины:
	при том же числе точки те же, при другом сохраняются пропорции звеньев
	(кончик у пера короче остальных звеньев)."""
	out = []
	for k in range(count):
		f = float(k) * (len(pts)-1) / (count-1)
		s = min(int(math.floor(f)), len(pts)-2)
		out.append(_lerp(pts[s], pts[s+1], f - s))
	return out

def resample_layout(layout, feathers, segments):
	"""Раскладка под другое число перьев и звеньев: новые перья - между соседними
	по номеру, звенья и главные - по доле номера звена вдоль пера."""
	old_n = len(layout["feathers"]) - 1
	old_s = len(layout["feathers"][0]["posers"]) - 1
	out = copy.deepcopy(layout)

	pts = [_resample_polyline(f["posers"], segments+1) for f in layout["feathers"]]

	def feather_at(f):
		i0 = int(math.floor(f))
		i1 = min(i0+1, old_n)
		w = f - i0
		a, b = layout["feathers"][i0], layout["feathers"][i1]
		return {
			"t": _lerp(a["t"], b["t"], w),
			"r": _slerp_euler(a["r"], b["r"], w),
			"size": a.get("size", 0.2) + (b.get("size", 0.2) - a.get("size", 0.2)) * w,
			"posers": [_lerp(p, q, w) for p, q in zip(pts[i0], pts[i1])],
		}

	out["feathers"] = [feather_at(0)]
	for i in range(1, feathers+1):
		out["feathers"].append(feather_at(float(i) * old_n / feathers))

	# главные: смещение от своего звена по доле номера звена (у основания - ноль)
	old = layout.get("mains")
	if old:
		offs = [[0.0, 0.0, 0.0, old[0][3]]] + old
		mains = []
		for k in range(1, segments):
			g = float(k) * (old_s-1) / (segments-1)
			i0 = int(math.floor(g))
			i1 = min(i0+1, old_s-1)
			mains.append(_lerp(offs[i0], offs[i1], g - i0))
		out["mains"] = mains
	return out

def get_layout(m_name, feathers, segments):
	"""Текущая раскладка позеров модуля в сцене."""
	P = _prefix(m_name)
	g = lambda n, a: cmds.getAttr(P+n+"."+a)
	lay = {
		"mainPoser": {a: g("mainPoser", a) for a in ("size", "globalSize", "lineSize")},
		"root_poser": {"t": list(g("root_poser", "t")[0]), "size": g("root_poser", "size")},
		"feathers": [],
		"mains": [],
	}
	for i in range(0, feathers+1):
		pf = feather_name("m" if i == 0 else "l", i)
		mp = pf+"_mainPoser"
		lay["feathers"].append({
			"t": list(g(mp, "t")[0]), "r": list(g(mp, "r")[0]), "size": g(mp, "size"),
			"posers": [list(g(n+"_poser", "t")[0]) + [g(n+"_poser", "size")] for n in seg_names(pf, segments)],
		})
	for k in range(1, segments):
		t = g("main_%d_poser" % k, "t")[0]
		s = g("m_feather_%d_poser" % (k+1), "t")[0]
		lay["mains"].append([t[i]-s[i] for i in range(3)] + [g("main_%d_poser" % k, "size")])
	return lay

def _set(plug, *v):
	# позеры могут быть закрыты или подключены - такие каналы пропускаем
	if cmds.getAttr(plug, lock=1) or cmds.listConnections(plug, s=1, d=0):
		if len(v) == 1:
			return
		for ax, x in zip("XYZ", v):
			child = plug+ax
			if not cmds.getAttr(child, lock=1) and not cmds.listConnections(child, s=1, d=0):
				cmds.setAttr(child, x)
		return
	cmds.setAttr(plug, *v)

def apply_layout(m_name, layout):
	P = _prefix(m_name)
	for a, v in layout.get("mainPoser", {}).items():
		_set(P+"mainPoser."+a, v)
	root = layout.get("root_poser", {})
	if "t" in root:
		_set(P+"root_poser.translate", *root["t"])
	if "size" in root:
		_set(P+"root_poser.size", root["size"])
	segments = len(layout["feathers"][0]["posers"]) - 1
	for i, f in enumerate(layout["feathers"]):
		pf = P + feather_name("m" if i == 0 else "l", i)
		_set(pf+"_mainPoser.translate", *f["t"])
		_set(pf+"_mainPoser.rotate", *f["r"])
		_set(pf+"_mainPoser.size", f["size"])
		for n, p in zip(seg_names(pf, segments), f["posers"]):
			_set(n+"_poser.translate", *p[:3])
			_set(n+"_poser.size", p[3])
	mains = layout.get("mains")
	for k in range(1, segments):
		s = cmds.getAttr(P+"m_feather_%d_poser.t" % (k+1))[0]
		o = mains[k-1] if mains else [0.0, 0.0, 0.0, 0.25]
		_set(P+"main_%d_poser.translate" % k, *[s[i]+o[i] for i in range(3)])
		_set(P+"main_%d_poser.size" % k, o[3])


# ============================================================================ build

class _Builder(object):
	"""Строит перья, звенья и главные на неразмножаемой части хвоста.
	Имена без префикса модуля, префикс ставит n(). Всё построенное попадает в
	generated_nodesSet.

	protos(kind, side, i, j) -> (узел-образец, цвет или None, растянуть ли по
	ширине веера): kind "feather" (side, перо i, звено j) или "main" (главный i)."""

	def __init__(self, m_name, feathers, segments):
		self.P = _prefix(m_name)
		self.N = feathers
		self.S = segments
		self.mains_segs = list(range(2, segments+1))

	def n(self, name):
		return self.P + name

	# ---------------------------------------------------------------- nodes

	def mult_matrix(self, name, plugs):
		mm = cmds.createNode("multMatrix", n=self.n(name))
		for i, p in enumerate(plugs):
			cmds.connectAttr(self.n(p), "%s.matrixIn[%d]" % (mm, i))
		return mm

	def decompose(self, name, src_plug):
		d = cmds.createNode("decomposeMatrix", n=self.n(name))
		cmds.connectAttr(self.n(src_plug), d+".inputMatrix")
		return d

	def group(self, name, parent):
		return cmds.createNode("transform", n=self.n(name), p=self.n(parent))

	def connect(self, src, dst, f=False):
		cmds.connectAttr(self.n(src), self.n(dst), f=f)

	def control(self, proto, name, parent, color=None, width=None):
		"""Контрол - копия образца: форма, цвет, атрибуты, замки."""
		c = cmds.duplicate(proto, n=self.n(name), rr=1)[0]
		# образец мог быть сдвинут или повёрнут - контрол встаёт в ноль своей группы
		for a in ("tx", "ty", "tz", "rx", "ry", "rz"):
			if not cmds.getAttr(c+"."+a, lock=1):
				cmds.setAttr(c+"."+a, 0)
		for i, s in enumerate(cmds.listRelatives(c, s=1, path=1) or []):
			s = cmds.rename(s, self.n(name)+"Shape"+(str(i) if i else ""))
			if color is not None:
				cmds.setAttr(s+".overrideEnabled", 1)
				cmds.setAttr(s+".overrideColor", color)
			if width is not None:
				# в системе самой формы: растяжка поперёк, по Z контрола
				cvs = s+".cv[*]"
				pts = cmds.xform(cvs, q=1, os=1, t=1)
				for k in range(len(pts)//3):
					cmds.xform("%s.cv[%d]" % (s, k), os=1, t=(pts[3*k], pts[3*k+1], pts[3*k+2]*width))
		# относительно: под группой с отрицательным скейлом обычный parent вставил
		# бы компенсацию
		return cmds.parent(c, self.n(parent), r=1)[0]

	# ---------------------------------------------------------------- posers

	def _import(self, file_name, name):
		utils.importFile(os.path.join(rootPath, "rigTools", file_name), self.n(name))
		# importFile заводит свой набор нод - модуль собирает их сам
		for s in (self.n(name)+"_nodesSet", self.n(name)+"_sceneConfigurationScriptNode"):
			if cmds.objExists(s):
				cmds.delete(s)

	def make_sub_main_poser(self, name):
		self._import("mainPoser.ma", name)
		mp = self.n(name+"_mainPoser")
		cmds.parent(mp, self.n("mainPoser"))
		cmds.connectAttr(self.n("mainPoser.globalSize"), mp+".globalSize", f=1)
		return mp

	def make_poser(self, name, parent):
		self._import("poser.ma", name)
		ps = self.n(name+"_poser")
		cmds.parent(ps, self.n(parent))
		mult = utils.createNode("multDoubleLinear", n=self.n(name+"_size_multDoubleLinear"))
		cmds.connectAttr(ps+".size", mult+".input1")
		cmds.connectAttr(self.n("mainPoser.globalSize"), mult+".input2")
		cmds.connectAttr(mult+".output", self.n(name+"_makeNurbSphere.radius"), f=1)
		cmds.setAttr(ps+".r", 0, 0, 0)
		# поворот позера ни на что не влияет: ориентацию даёт aim на соседа
		for a in ("rx", "ry", "rz"):
			cmds.setAttr(ps+"."+a, lock=True, keyable=False, channelBox=False)
		return ps

	# ---------------------------------------------------------------- build

	def build(self, layout, protos):
		N, S = self.N, self.S
		sides = [("m", 0)] + [("l", i) for i in range(1, N+1)]
		before = set(cmds.ls())

		# ------------------------------------------------ posers
		for side, i in sides:
			pf = feather_name(side, i)
			sub = self.make_sub_main_poser(pf)
			names = seg_names(pf, S)
			plist = [self.make_poser(nm, pf+"_mainPoser") for nm in names]
			for k, nm in enumerate(names):
				if k < len(names)-1:
					tgt, aim = plist[k+1], (1, 0, 0)
				else:
					tgt, aim = plist[k-1], (-1, 0, 0)
				cmds.aimConstraint(tgt, self.n(nm+"_poserOrient"), aim=aim, u=(0, 1, 0),
								   wut="objectrotation", wu=(0, 1, 0), wuo=sub)

		# позеры главных: под mainPoser среднего пера, ориентация - от пера на своём звене
		for k, seg in enumerate(self.mains_segs, 1):
			self.make_poser("main_%d" % k, "m_feather_mainPoser")
			cmds.orientConstraint(self.n("m_feather_%d_initLoc" % seg), self.n("main_%d_poserOrient" % k))

		apply_layout(self.P[:-1], layout)

		# линии: после раскладки, кривые строятся по мировым точкам позеров
		for side, i in sides:
			cmds.select([self.n(nm+"_poser") for nm in seg_names(feather_name(side, i), S)])
			posers.connectPosers(name_m=self.P)
		# толщина: мировой масштаб mainPoser (lines_scale_multiplyDivide в сцене) *
		# lineSize * globalSize. Без префикса (сборка самой сцены) connectPosers
		# этот множитель не заводит
		if not cmds.objExists(self.n("lines_size_multDoubleLinear")):
			mult = utils.createNode("multDoubleLinear", n=self.n("lines_size_multDoubleLinear"))
			cmds.connectAttr(self.n("mainPoser.lineSize"), mult+".input1")
			cmds.connectAttr(self.n("mainPoser.globalSize"), mult+".input2")
		self.connect("lines_size_multDoubleLinear.output", "lines_scale_multiplyDivide.input2X", f=True)
		self.connect("lines_scale_multiplyDivide.outputX", "lines_sweepMeshCreator.scaleProfileX", f=True)
		# root_poserOrient не трогаем: его ориентация задана в сцене

		# веерные системы звеньев боковых перьев: X по перу, Z - от среднего пера
		# того же звена, Y - нормаль веера. В них крутятся spread и bend, чтобы
		# крен пера (вращение его mainPoser) не уводил перья из веера. Крен
		# добавляется группой перед контролом
		for side, i in sides[1:]:
			names = seg_names(feather_name(side, i), S)
			for k, nm in enumerate(names):
				fl = cmds.spaceLocator(n=self.n(nm+"_fanLoc"))[0]
				cmds.parent(fl, self.n(nm+"_poser"), r=1)
				cmds.setAttr(fl+".v", 0)
				mid = self.n("m_feather_%s_poser" % nm.split("_")[-1])
				if k < len(names)-1:
					tgt, aim = self.n(names[k+1]+"_poser"), (1, 0, 0)
				else:
					tgt, aim = self.n(names[k-1]+"_poser"), (-1, 0, 0)
				cmds.aimConstraint(tgt, fl, aim=aim, u=(0, 0, -1), wut="object", wuo=mid)

		# ------------------------------------------------ right side init locators (mirrored)
		def mirror_loc(src, rn):
			loc = cmds.spaceLocator(n=self.n(rn))[0]
			cmds.parent(loc, self.n("r_initLocs"))
			self.mult_matrix(rn+"_multMat", [src+".worldMatrix[0]", "root_poser.worldInverseMatrix[0]",
											 "r_mirror_composeMatrix.outputMatrix", "root_poser.worldMatrix[0]",
											 "r_initLocs.worldInverseMatrix[0]"])
			self.connect(rn+"_multMat.matrixSum", rn+".offsetParentMatrix")

		for side, i in sides[1:]:
			pf = feather_name(side, i)
			for nm in seg_names(pf, S):
				mirror_loc(nm+"_initLoc", "r"+nm[1:]+"_initLoc")
			# правому перу своя веерная система нужна только у корня, дальше
			# локальные матрицы общие с левым
			mirror_loc(pf+"_1_fanLoc", "r"+pf[1:]+"_1_fanLoc")

		# ------------------------------------------------ spread / bend
		# сеть в сцене считает углы на звено: делим на число звеньев
		cmds.setAttr(self.n("feathers_spreadCoef_multiplyDivide.input2"), -0.5/S, 0.5/S, -1.0/S)
		cmds.setAttr(self.n("feathers_bendCoef_multiplyDivide.input2"), 0.5/(S-1), 0.5/(S-1), -0.5/(S-1))

		# перо с весом t = i/N (0 - середина, 1 - крайнее): одна нода на номер, общая для l/r
		mid_rot, edge_rot = "feathers_mid_rotation", "feathers_edge_rotation"
		feather_rot = {0: mid_rot}
		for i in range(1, N+1):
			t = float(i) / N
			b = cmds.createNode("animBlendNodeAdditiveRotation", n=self.n("feather_%d_rotation" % i))
			self.connect(mid_rot+".output", "feather_%d_rotation.inputA" % i)
			self.connect(edge_rot+".output", "feather_%d_rotation.inputB" % i)
			cmds.setAttr(b+".weightA", 1-t)
			cmds.setAttr(b+".weightB", t)
			feather_rot[i] = "feather_%d_rotation" % i

		# spreadRoot - поворот корня пера (угол всего пера, перо прямое); у среднего пера нет
		root_rot = {}
		for i in range(1, N+1):
			b = cmds.createNode("animBlendNodeAdditiveRotation", n=self.n("feather_%d_rootRotation" % i))
			self.connect("feathers_rootEdge_rotation.output", "feather_%d_rootRotation.inputB" % i)
			cmds.setAttr(b+".weightA", 0)
			cmds.setAttr(b+".weightB", float(i) / N)
			root_rot[i] = "feather_%d_rootRotation" % i

		# ------------------------------------------------ main controls
		# сначала сами контролы (их поворот нужен перьям), место - после перьев
		mains = {}
		main_of_seg = {}
		for k, seg in enumerate(self.mains_segs, 1):
			self.group("main_%d_group" % k, "main_controls")
			# ширина формы - до крайнего пера на этом звене
			a = cmds.xform(self.n("main_%d_poser" % k), q=1, ws=1, t=1)
			b = cmds.xform(self.n("l_feather_%d_%d_poser" % (N, seg)), q=1, ws=1, t=1)
			scale = cmds.xform(self.n("root_poser"), q=1, ws=1, s=1)[0] or 1.0
			w = math.sqrt(sum((a[x]-b[x])**2 for x in range(3))) / scale
			proto, color, stretch = protos("main", None, k, None)
			mains[k] = self.control(proto, "main_%d" % k, "main_%d_group" % k, color=color,
									width=(max(w, 0.3) + 0.35) if stretch else None)
			main_of_seg[seg] = "main_%d" % k

		# контрол атрибутов - на последнем главном
		cmds.parent(self.n("feathers_group"), self.n("main_%d" % len(self.mains_segs)), r=1)

		# ------------------------------------------------ feathers
		skin = []
		ctrl_sets = {}
		all_feathers = [("m", 0)] + [("l", i) for i in range(1, N+1)] + [("r", i) for i in range(1, N+1)]

		for side, i in all_feathers:
			pf = feather_name(side, i)
			src = pf if side != "r" else "l"+pf[1:]   # левое перо, от которого берутся локальные матрицы
			parent_c, parent_j = "feather_controls", "root_outJoint"
			ctrls = []
			for j in range(1, S+1):
				nm = "%s_%d" % (pf, j)
				sn = "%s_%d" % (src, j)
				self.group(nm+"_group", parent_c)
				# группа звена стоит в веерной системе (fanLoc), у среднего пера веерная
				# система - его собственная. Родитель - контрол прошлого звена, то есть initLoc
				frame = nm+"_initLoc" if side == "m" else nm+"_fanLoc"
				if j == 1:
					# у правой стороны - зеркальный локатор
					self.mult_matrix(nm+"_group_multMat", [frame+".worldMatrix[0]", "root_initLoc.worldInverseMatrix[0]"])
					self.connect(nm+"_group_multMat.matrixSum", nm+"_group.offsetParentMatrix")
				elif side != "r":
					self.mult_matrix(nm+"_group_multMat", [frame+".worldMatrix[0]", "%s_%d_initLoc.worldInverseMatrix[0]" % (pf, j-1)])
					self.connect(nm+"_group_multMat.matrixSum", nm+"_group.offsetParentMatrix")
				else:
					self.connect(sn+"_group_multMat.matrixSum", nm+"_group.offsetParentMatrix")
				chain = [nm+"_group"]
				if side != "m" and j == 1:
					self.group(nm+"_spreadRootGroup", chain[-1])
					self.connect(root_rot[i]+".outputY", nm+"_spreadRootGroup.rotateY")
					chain.append(nm+"_spreadRootGroup")
				if side != "m":
					self.group(nm+"_spreadGroup", chain[-1])
					self.connect(feather_rot[i]+".outputX", nm+"_spreadGroup.rotateY")
					self.connect(feather_rot[i]+".outputY", nm+"_spreadGroup.rotateZ")
					chain.append(nm+"_spreadGroup")
				if j >= 2:
					self.group(nm+"_bendGroup", chain[-1])
					self.connect(feather_rot[i]+".outputZ", nm+"_bendGroup.rotateZ")
					chain.append(nm+"_bendGroup")
				if j in main_of_seg:
					# главный крутит перья жёстко - вокруг своей оси и точки, как будто
					# они к нему прикреплены (вокруг собственной кости перо отставало бы,
					# а локальные оси правой стороны на отрицательном скейле давали
					# зеркальное качание): L = F * Mpre^-1 * R * Mpre * F^-1, F - мировая
					# матрица родителя группы, Mpre - группы главного, R - main.matrix
					parent = chain[-1]
					mc = main_of_seg[j]
					self.group(nm+"_mainGroup", parent)
					self.mult_matrix(nm+"_mainGroup_multMat", [parent+".worldMatrix[0]", mc+"_group.worldInverseMatrix[0]",
															   mc+".matrix",
															   mc+"_group.worldMatrix[0]", parent+".worldInverseMatrix[0]"])
					self.connect(nm+"_mainGroup_multMat.matrixSum", nm+"_mainGroup.offsetParentMatrix")
					chain.append(nm+"_mainGroup")
				# крен пера: от веерной системы к ориентации пера (initLoc)
				roll = None
				if side != "m":
					roll = nm+"_rollGroup"
					self.group(roll, chain[-1])
					if side == "l":
						self.mult_matrix(nm+"_rollGroup_multMat", [nm+"_initLoc.worldMatrix[0]", nm+"_fanLoc.worldInverseMatrix[0]"])
					self.connect(sn+"_rollGroup_multMat.matrixSum", roll+".offsetParentMatrix")
				proto, color, _ = protos("feather", side, i, j)
				c = self.control(proto, nm, roll or chain[-1], color=color)
				ctrls.append(c)

				# out joint: локальная матрица от группы до контрола. createNode с
				# родителем: cmds.parent под кость с отрицательным скейлом вставил бы
				# компенсирующий transform
				jn = cmds.createNode("joint", n=self.n(nm+"_outJoint"), p=self.n(parent_j))
				plugs = [nm+".matrix"] + ([roll+".offsetParentMatrix"] if roll else [])
				for t in reversed(chain[1:]):
					plugs.append(t+(".offsetParentMatrix" if t.endswith("_mainGroup") else ".matrix"))
				plugs.append(nm+"_group.offsetParentMatrix")
				self.mult_matrix(nm+"_outJoint_multMat", plugs)
				dj = self.decompose(nm+"_outJoint_decMat", nm+"_outJoint_multMat.matrixSum")
				for a in ("Translate", "Rotate", "Scale"):
					cmds.connectAttr(dj+".output"+a, jn+"."+a.lower())
				cmds.setAttr(jn+".jointOrient", 0, 0, 0)
				cmds.setAttr(jn+".radius", 0.2)
				skin.append(jn)
				parent_c, parent_j = nm, nm+"_outJoint"

			# кончик
			je = cmds.createNode("joint", n=self.n(pf+"_end_outJoint"), p=self.n(parent_j))
			if side != "r":
				self.mult_matrix(pf+"_end_multMat", [pf+"_end_initLoc.worldMatrix[0]", "%s_%d_initLoc.worldInverseMatrix[0]" % (pf, S)])
				self.decompose(pf+"_end_decMat", pf+"_end_multMat.matrixSum")
			cmds.connectAttr(self.n(src+"_end_decMat.outputTranslate"), je+".translate")
			cmds.setAttr(je+".jointOrient", 0, 0, 0)
			cmds.setAttr(je+".radius", 0.2)

			cmds.select(clear=1)
			ctrl_sets[pf] = cmds.sets(ctrls, n=self.n(pf+"_moduleControlSet"))

		# ------------------------------------------------ main controls placement
		def m_local(j, with_main):
			nm = "m_feather_%d" % j
			plugs = []
			if with_main and j in main_of_seg:
				plugs.append(nm+"_mainGroup.offsetParentMatrix")
			if j >= 2:
				plugs.append(nm+"_bendGroup.matrix")
			plugs.append(nm+"_group.offsetParentMatrix")
			return plugs

		for k, c in enumerate(self.mains_segs, 1):
			# главный едет по среднему перу (bend двигает и его), смещён к своему позеру
			plugs = ["main_%d_initLoc.worldMatrix[0]" % k, "m_feather_%d_initLoc.worldInverseMatrix[0]" % c]
			plugs += m_local(c, False)
			for j in range(c-1, 0, -1):
				plugs += m_local(j, True)
			self.mult_matrix("main_%d_group_multMat" % k, plugs)
			self.connect("main_%d_group_multMat.matrixSum" % k, "main_%d_group.offsetParentMatrix" % k)

		self.mult_matrix("feathers_group_multMat", ["m_feather_end_initLoc.worldMatrix[0]",
													"main_%d_initLoc.worldInverseMatrix[0]" % len(self.mains_segs)])
		self.connect("feathers_group_multMat.matrixSum", "feathers_group.offsetParentMatrix")

		# ------------------------------------------------ sets
		cmds.sets([mains[k] for k in sorted(mains)], e=1, forceElement=self.n("main_moduleControlSet"))
		order = [feather_name(s, i) for s, i in all_feathers]
		cmds.sets([ctrl_sets[pf] for pf in order], e=1, forceElement=self.n("feathers_moduleControlSet"))
		cmds.sets(skin, e=1, forceElement=self.n("skinJointsSet"))
		cmds.select(clear=1)

		# импорт позеров в mayapy оставляет копии менеджеров сцены
		for s in cmds.ls(type=["poseInterpolatorManager", "shapeEditorManager"]):
			if s not in before and s not in ("poseInterpolatorManager", "shapeEditorManager"):
				cmds.lockNode(s, lock=False)
				cmds.delete(s)
		# всё построенное - в generated_nodesSet: по нему create() удалит это,
		# если в опциях другие числа
		gen = self.n("generated_nodesSet")
		new = [n for n in set(cmds.ls()) - before if cmds.objExists(n) and n != gen]
		cmds.sets(new, e=1, forceElement=gen)
		return new


# ============================================================================ module

class BirdTail(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.feathers = FEATHERS
		self.segments = SEGMENTS

	# ---------------------------------------------------------------- options

	def connectSignals(self, mainInstance, w):
		w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))

	def updateOptionsPage(self, widget):
		self.getOptions()
		widget.feathers_spinBox.setValue(self.feathers)
		widget.segments_spinBox.setValue(self.segments)

	def getOptions(self):
		# считаем по сцене, а не по памяти: модуль мог прийти из шаблона
		feathers = 0
		while cmds.objExists("%s_l_feather_%d_mainPoser" % (self.name, feathers+1)):
			feathers += 1
		segments = 0
		while cmds.objExists("%s_m_feather_%d_poser" % (self.name, segments+1)):
			segments += 1
		if feathers:
			self.feathers = feathers
		if segments:
			self.segments = segments
		return {"feathers": self.feathers, "segments": self.segments}

	def getData(self):
		data = super(self.__class__, self).getData()
		data['optionsData'] = self.getOptions()
		return data

	def rebuildWithNewOptions(self, mainInstance, widget):
		feathers = widget.feathers_spinBox.value()
		segments = widget.segments_spinBox.value()
		old = self.getOptions()

		# раскладку снимаем до пересборки и пересчитываем под новые числа: rebuildModule
		# вернёт позеры по именам, а при другом числе перьев они разъехались бы
		layout = resample_layout(get_layout(self.name, old["feathers"], old["segments"]), feathers, segments)

		cmds.undoInfo(openChunk=True)
		try:
			mainInstance.rebuildModule({"feathers": feathers, "segments": segments, "layout": layout})
			apply_layout(self.name, layout)
		finally:
			cmds.undoInfo(closeChunk=True)

	# ---------------------------------------------------------------- create

	def create(self, options={}):
		self.root = self.name + "_mod"
		options = options or {}
		self.feathers = int(options.get("feathers", FEATHERS))
		self.segments = int(options.get("segments", SEGMENTS))
		if self.feathers < 1 or self.segments < 2:
			cmds.warning("birdTail - нужно хотя бы 1 перо на сторону и 2 звена, беру значения по умолчанию")
			self.feathers, self.segments = FEATHERS, SEGMENTS
		layout = options.get("layout")

		if not cmds.pluginInfo("sweep", q=1, loaded=1):
			cmds.loadPlugin("sweep", quiet=True)

		utils.importFile(os.path.join(rootPath, "modules", self.type, self.type+".ma"), self.name)
		missing = [n for n in BASE_NODES if not cmds.objExists(self.name+"_"+n)]
		if missing:
			cmds.error("birdTail - в birdTail.ma нет нод, нужных для сборки: " + ", ".join(missing))
		old_n, old_s = scene_counts(self.name)
		if (self.feathers, self.segments) != (old_n, old_s):
			# раскладка по умолчанию - та, что в сцене, под новые числа
			if not layout:
				layout = resample_layout(get_layout(self.name, old_n, old_s), self.feathers, self.segments)
			new = self.regenerate(old_n, old_s, layout)
			# перестроенное - в набор нод модуля (как делает importFile). Список
			# от сборщика, не разница имён: новые ноды носят имена удалённых
			nodes = [n for n in new if cmds.objExists(n) and cmds.objectType(n) != "objectSet"]
			cmds.sets(nodes, e=1, forceElement=self.name+"_nodesSet")
		elif layout:
			apply_layout(self.name, layout)

		self.finishCreate()

	def regenerate(self, old_n, old_s, layout):
		"""Перья, звенья и главные сцены - под другое число. Контролы копируются с
		ближайших по положению контролов сцены: перо - с соседнего той же стороны,
		звено - с того, что на той же доле длины пера. С пустым именем модуля
		перестраивает саму сцену birdTail.ma."""
		P = _prefix(self.name)
		N, S = self.feathers, self.segments

		# образцы - копии контролов сцены, пока та цела
		keep = cmds.createNode("transform", n=P+"regenerate_protos")
		cache = {}

		def copy_of(node):
			if node not in cache:
				d = cmds.duplicate(P+node, n=P+node+"_proto", rr=1)[0]
				# у контрола под ним следующее звено - оно не нужно
				kids = cmds.listRelatives(d, c=1, type="transform", path=1) or []
				if kids:
					cmds.delete(kids)
				# duplicate кладёт копию в наборы оригинала (и в generated_nodesSet -
				# тогда она ушла бы вместе со старыми перьями)
				for o in [d] + (cmds.listRelatives(d, s=1, path=1) or []):
					for s in cmds.listSets(object=o) or []:
						cmds.sets(o, rm=s)
				# относительно: под отрицательным скейлом обычный parent поменял бы форму
				cache[node] = cmds.parent(d, keep, r=1)[0]
			return cache[node]

		def nearest(k, old_count, new_count, first=1):
			if new_count == 1 or old_count == 1:
				return first
			return first + int(round(float(k-first) * (old_count-1) / (new_count-1)))

		def protos(kind, side, i, j):
			if kind == "main":
				return copy_of("main_%d" % nearest(i, old_s-1, S-1)), None, False
			i0 = 0 if side == "m" else min(max(int(round(float(i) * old_n / N)), 1), old_n)
			j0 = nearest(j, old_s, S)
			return copy_of("%s_%d" % (feather_name(side, i0), j0)), None, False

		# копируем всё нужное заранее: после удаления копировать будет не с чего
		protos("main", None, 1, None)
		for k in range(1, S):
			protos("main", None, k, None)
		for side, count in (("m", 0), ("l", N), ("r", N)):
			for i in ([0] if side == "m" else range(1, count+1)):
				for j in range(1, S+1):
					protos("feather", side, i, j)

		# контрол атрибутов висит на последнем главном - уносим его до удаления
		cmds.parent(P+"feathers_group", P+"main_controls", r=1)
		gen = P+"generated_nodesSet"
		short = set(cmds.sets(gen, q=1) or [])
		# Maya удаляет вместе с нодой и её историю - входные ноды, которые больше
		# никуда не ведут. Без этого ушла бы сеть spread/bend из сцены, поэтому
		# связи из неперестраиваемой части сначала отключаем
		for n in short:
			if not cmds.objExists(n):
				continue
			conns = cmds.listConnections(n, s=1, d=0, c=1, p=1) or []
			for dst, src in zip(conns[::2], conns[1::2]):
				if src.split(".")[0] not in short:
					cmds.disconnectAttr(src, dst)
		members = set(cmds.ls(list(short), l=1))
		# удаляем только верхние: вложенные уйдут с родителем
		top = [n for n in members if not any(n.startswith(m+"|") for m in members)]
		cmds.delete([n for n in top if cmds.objExists(n)])
		# сет, оставшийся без членов, Maya удаляет - заводим заново
		for s, parent in ((gen, None), (P+"feathers_moduleControlSet", P+"moduleControlSet")):
			if not cmds.objExists(s):
				cmds.select(clear=1)
				cmds.sets(empty=True, n=s)
				if parent:
					cmds.sets(s, e=1, forceElement=parent)

		new = _Builder(self.name, N, S).build(layout, protos)
		cmds.delete(keep)
		return new

	def finishCreate(self):
		# то же, что Module.create делает после импорта своей сцены
		cmds.sets(self.name+'_sets', e=1, forceElement='modules_sets')
		cmds.sets(self.name+'_nodesSet', e=1, forceElement=self.name+'_sets')

		def createControlSet(s):
			new_s = s.replace("moduleC", "c")
			cmds.select(clear=1)
			cmds.sets(n=new_s)
			for o in cmds.sets(s, q=1) or []:
				if cmds.objectType(o) == 'objectSet':
					cmds.sets(createControlSet(o), e=1, forceElement=new_s)
				else:
					cmds.sets(o, e=1, forceElement=new_s)
			return new_s

		control_set = createControlSet(self.name+'_moduleControlSet')
		cmds.sets(control_set, e=1, forceElement='controlSet')

		utils.setUserAttr(self.root, "moduleType", self.type)
		for c in utils.getSetObjects(control_set):
			utils.setUserAttr(c, "type", "control")
			utils.setUserAttr(c, "internalName", c.replace(self.name+"_", ""))

		cmds.select(control_set)
		mel.eval("TagAsController")
		cmds.select(clear=1)

		cmds.parent(self.root, 'modules')

		self.addSkinJoints()
		self.joints = self.getJoints()

		for o in ['_system', '_input']:
			if cmds.objExists(self.name+o):
				cmds.hide(self.name+o)

		# кости в output не рисуются - строго после addSkinJoints, см. Module.create
		out_grp = self.name + "_output"
		if cmds.objExists(out_grp):
			for j in cmds.listRelatives(out_grp, allDescendents=1, type="joint") or []:
				try:
					cmds.setAttr(j+".drawStyle", 2)
				except Exception as e:
					cmds.warning("Cannot hide %s (%s)" % (j, e))

		cmds.refresh()
