import maya.cmds as cmds
import os

from ... import utils, module
from . import poses

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
	from PySide2 import QtGui
else:
	from PySide6 import QtGui

rootPath = os.path.normpath(os.path.dirname(__file__))

# Подписи к картинкам страницы опций (рисует generate_help_images.py; номера
# и буквы там и здесь должны совпадать)
CLAV, SCAP, MUS = "#D85A30", "#1D9E75", "#9F97F0"


def _rows(rows):
	return "<br>".join("<b><span style='color:%s'>%s</span></b>&nbsp; %s" % r for r in rows)


POSERS_TITLE = u"<b>Позеры и кости</b> (левая сторона, правая - зеркально)"
POSERS_LEGEND = _rows([
	(CLAV, "1", u"<b>root</b> - грудино-ключичный сустав, у верха грудины"),
	(CLAV, "2", u"<b>shoulder</b> - акромион, костяной верх плеча (не плечевой сустав)"),
	(SCAP, "3", u"<b>scapulaTop</b> - внутренний верхний угол лопатки, начало ости"),
	(SCAP, "4", u"<b>scapulaTip</b> - нижний угол лопатки"),
	(SCAP, "- -", u"<b>ribcage</b> - эллипсоид грудной клетки: по нему скользит лопатка. "
				  u"Важна форма спины под лопаткой, касаться лопатки не нужно"),
	(MUS, "6", u"<b>pecUpperOrigin</b> - под ключицей, внутренняя половина (едет с ключицей)"),
	(MUS, "7", u"<b>pecLowerOrigin</b> - середина грудины"),
	(MUS, "8", u"<b>pecInsert</b> - перед плечевой кости у переднего края подмышки (едет с рукой)"),
	(MUS, "9", u"<b>latOrigin</b> - спина у позвоночника, нижние рёбра"),
	(MUS, "10", u"<b>latInsert</b> - плечевая кость у заднего края подмышки (едет с рукой)"),
	(MUS, "11", u"<b>trapOrigin</b> - основание шеи сзади, сбоку"),
	(MUS, "12", u"<b>trapInsert</b> - верх плеча сзади, у акромиона (едет с ключицей)"),
]) + u"<br><br>Позеры - на глубину кости или мышцы, чуть под кожей. Прикрепления на руке " \
	 u"ставить при руке в позе покоя. Ромбы - кости: ключица и лопатка стоят в своих позерах, " \
	 u"мышечные - между началом и прикреплением (сдвиг - <b>…Belly</b> на mainPoser).<br><br>" \
	 u"<b>Крайние положения ключицы</b>: у каждой кости модуля три локатора - вперёд, назад, " \
	 u"вверх. Поставьте ключицу в крайнее положение, включите на кости <b>Show Forward / Back / Up</b> " \
	 u"(на кости ключицы - сразу для всех костей) и тащите локатор: кость идёт за ним. Крайние углы " \
	 u"ключицы - <b>Forward / Back / Up Angle</b> на кости ключицы (root): ry &lt; 0 - вперёд, " \
	 u"ry &gt; 0 - назад, rz &gt; 0 - вверх. Правая сторона берёт всё с левой.<br><br>" \
	 u"<b>fiberHold / fiberHoldBelow</b> на mainPoser: когда мышца короче fiberHoldBelow от " \
	 u"длины покоя, её кость держит направление покоя с силой fiberHold - иначе при " \
	 u"схлопнувшейся мышце кость перекручивается."

SKIN_TITLE = u"<br><b>Зоны скина</b> (яркое - ядро, бледное - переход)"
SKIN_LEGEND = _rows([
	("#D85A30", u"К", u"<b>root</b> - полоса над ключицей от грудины до верха плеча"),
	("#BA7517", u"Т", u"<b>trap</b> - скат шея - плечо и верх спины у шеи"),
	("#D4537E", u"ГВ", u"<b>pecUpper</b> - верх груди под ключицей, к переду плеча"),
	("#7F77DD", u"ГН", u"<b>pecLower</b> - основная масса груди до переднего края подмышки"),
	("#378ADD", u"Ш", u"<b>lat</b> - бок под подмышкой и задний край подмышки"),
	("#1D9E75", u"Л", u"<b>scapula</b> - верхняя половина лопатки, ость"),
	("#639922", u"Н", u"<b>scapulaTip</b> - пятно вокруг нижнего угла лопатки"),
]) + u"<br><br>Серое - не модуль: середина груди (spine_end), позвоночник (spine). Пунктир на " \
	 u"плече - дельта и подмышка: кость плеча и инбетвины руки. Мышечные кости тянутся и " \
	 u"раздуваются - вес держать у брюшка мышцы, края плавно сводить."

# руки, у которых есть всё, что читает модуль: initLoc и outJoint плеча и локтя
LIMB_TYPES = ('limb', 'limbMll', 'limbCurved', 'limbQuadrupped', 'limbQuadruppedExtra',
			  'limbQuadruppedExtraMiddle', 'limbQuadrupped2', 'limbCurvedQuadrupped')


class Shoulder(module.Module) :
	"""Плечевой пояс: ключица, лопатка по рёбрам, мышцы груди и спины.

	Сеть нод собрана в shoulder.ma (generate_shoulder.py). Здесь - только
	подключение руки: лопатка и мышцы читают её плечевую кость и локоть. Пока
	руки нет, сеть берёт плечо с позера shoulder и заглушку локтя под ним, а
	ритм лопатки выключен. Сеть только читает руку - цикла здесь нет.
	"""
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False

	def create(self, options={}):
		super(self.__class__, self).create(options)
		# крайние положения forward/back/up - на скиновых костях (poses.py)
		poses.connect_skin(self.name)

	def connect(self, target, opposite=False):
		super(self.__class__, self).connect(target, opposite)
		if opposite:
			poses.link_settings(self.name)

	# Крайние положения (углы на кости ключицы и положения локаторов) студия в
	# шаблон не пишет - она сохраняет только контролы и позеры; сохраняем сами
	def getData(self):
		data = super(self.__class__, self).getData()
		data['jointPoses'] = poses.get_values(self.name)
		return data

	def setData(self, data, sym=False, namingForce=False, load="all"):
		super(self.__class__, self).setData(data, sym, namingForce, load)
		if load == "all":
			poses.set_values(self.name, data.get('jointPoses'))

	def updateOptionsPage(self, w):
		for label, image in ((w.image_label, "helpImage.png"), (w.image_label_2, "helpImage2.png")):
			pixmap = QtGui.QPixmap(os.path.join(rootPath, image))
			pixmap.setDevicePixelRatio(2)          # картинки нарисованы в 2x
			label.setPixmap(pixmap)
		w.posers_title_label.setText(POSERS_TITLE)
		w.posers_legend_label.setText(POSERS_LEGEND)
		w.skin_title_label.setText(SKIN_TITLE)
		w.skin_legend_label.setText(SKIN_LEGEND)

	# ------------------------------------------------------------------ рука
	def _armInputs(self):
		"""Входы сети, которые переключаются на руку: (плаг, по умолчанию)."""
		n = self.name
		return [
			(n+"_humerusRest_multMatrix.matrixIn[0]", n+"_shoulder_poser.worldMatrix[0]"),
			(n+"_elbowRest_multMatrix.matrixIn[0]", n+"_elbowRest_loc.worldMatrix[0]"),
			(n+"_humerus_multMatrix.matrixIn[0]", n+"_humerusRest_multMatrix.matrixSum"),
			(n+"_humerus_multMatrix.matrixIn[1]", n+"_clav_multMatrix.matrixSum"),
			(n+"_elbow_multMatrix.matrixIn[0]", n+"_elbowRest_multMatrix.matrixSum"),
			(n+"_elbow_multMatrix.matrixIn[1]", n+"_clav_multMatrix.matrixSum"),
		]

	def connectedArm(self):
		plug = self.name+"_humerus_multMatrix.matrixIn[0]"
		if not cmds.objExists(plug):
			return None
		src = cmds.listConnections(plug, s=1, d=0) or []
		if not src or src[0] == self.name+"_humerusRest_multMatrix":
			return None
		return utils.getModuleName(src[0])

	def childConnected(self, child):
		if child.type not in LIMB_TYPES or child.parent != self.name+"_root_outJoint":
			return

		arm = child.name
		current = self.connectedArm()
		if current and current != arm:
			cmds.warning("%s: arm %s is already connected, %s is not followed by the scapula"
						 % (self.name, current, arm))
			return

		needed = [arm+"_root_initLoc", arm+"_middle_initLoc", arm+"_root_outJoint", arm+"_middle_outJoint"]
		missed = [o for o in needed if not cmds.objExists(o)]
		if missed:
			cmds.warning("%s: %s has no %s, arm is not connected to the shoulder" % (self.name, arm, missed))
			return

		inv = self.name+"_controls.worldInverseMatrix[0]"
		arm_plugs = [
			arm+"_root_initLoc.worldMatrix[0]",
			arm+"_middle_initLoc.worldMatrix[0]",
			arm+"_root_outJoint.worldMatrix[0]", inv,
			arm+"_middle_outJoint.worldMatrix[0]", inv,
		]
		for (dst, _), src in zip(self._armInputs(), arm_plugs):
			cmds.connectAttr(src, dst, f=1)
		cmds.setAttr(self.name+"_mod.armConnected", 1)

	def childDisconnected(self, child):
		if child.name != self.connectedArm():
			return

		for dst, default in self._armInputs():
			cmds.connectAttr(default, dst, f=1)
		cmds.setAttr(self.name+"_mod.armConnected", 0)
