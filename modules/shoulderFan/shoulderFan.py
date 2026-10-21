import maya.cmds as cmds
import os
import importlib
from functools import partial

from ... import utils, module
from ..shoulder.shoulder import Shoulder, LIMB_TYPES
# В debug студия перезагружает этот файл, но не fan.py и scheme.py - без этого
# после их правки здесь остались бы старые из памяти Maya. fan - до импорта
# scheme: тот при импорте читает константы fan
from . import fan
if utils.isDebug():
    importlib.reload(fan)
from . import scheme
if utils.isDebug():
    importlib.reload(scheme)

rootPath = os.path.normpath(os.path.dirname(__file__))

def _weights_text(w):
    """Веса по умолчанию одной строкой: только ненулевые."""
    return u", ".join(u"%s %g" % (a, v) for a, v in zip(fan.WEIGHTS, w) if v)


# Где ставить позеры (левая сторона, правая - зеркально). Ставить в позе покоя рига
POSERS = (
    u"Клик по точке на схеме выделяет позер, Shift+клик - добавляет к выделению, наведение "
    u"подсказывает, где его ставить.<br><br>"
    u"<b>Позеры</b> (левая сторона, правая - зеркально; ставить в позе покоя):<br>"
    u"<b>root</b> - грудино-ключичный сустав: у верха грудины, где в неё упирается ключица.<br>"
    u"<b>shoulder</b> - акромион, костяной верх плеча (не сам плечевой сустав, а над ним). "
    u"За ним едет лопатка.<br>"
    u"<b>scapulaTop</b> - верхний внутренний угол лопатки: сзади, у позвоночника, на уровне "
    u"верха лопатки.<br>"
    u"<b>ribcage</b> (каркасный эллипсоид) - грудная клетка. Двигайте, вращайте и масштабируйте так, "
    u"чтобы он повторял спину под лопаткой - по нему скользит лопатка. Касаться самой лопатки он не обязан.<br>"
    u"<b>fanCenter</b> - центр веера: в глубине грудной клетки, примерно посередине между грудиной и "
    u"позвоночником, на высоте середины груди. Все кости веера поворачиваются вокруг него: чем "
    u"глубже центр, тем ровнее кожа скользит по рёбрам; у самой кожи веер будет её мять.<br>"
    u"<b>spoke_1..N</b> - концы костей веера, на 1-3 см под кожей, там, где кость держит кожу "
    u"(скиновая кость стоит прямо в позере). Линия от fanCenter до позера - сама кость. "
    u"По умолчанию:<br>"
) + u"<br>".join(
    u"&nbsp;&nbsp;<b>%d</b> - %s: %s <i>(%s)</i>" % (i + 1, name, where, _weights_text(fan.DEFAULT_SPOKES[i][1]))
    for i, (name, where) in enumerate(fan.SPOKE_PLACES)
) + (u"<br>Кости сверх %d встают посередине между соседними по номеру - переставьте их сами. "
     u"Позеры костей стоит раскладывать равномерно: спереди, сверху и сзади, без пустых мест - "
     u"кожа между костями держится только скином.<br><br>" % len(fan.SPOKE_PLACES))

LEGEND = POSERS + (
          u"<b>Веер</b>: кость только поворачивается вокруг центра, длина постоянна - кожа "
          u"скользит по рёбрам. Скинить - на <b>spoke_N_skinJoint</b> (конец кости); "
          u"spoke_N_hub_skinJoint у центра только рисует линию.<br><br>"
          u"<b>chest / clav / scapula / arm</b> на кости - насколько точку под кожей несут грудь, "
          u"ключица, лопатка и плечевая кость. Кость смотрит на средневзвешенное, поэтому chest - "
          u"якорь: chest 1 - стоит, chest 0.5 + arm 0.5 - идёт за рукой наполовину.<br><br>"
          u"<b>Крайние положения</b>: у каждой кости шесть локаторов в её конце - вперёд / назад / "
          u"вверх от ключицы и то же от руки. Показ - <b>Show Clav… / Show Arm…</b> на кости ключицы "
          u"(root), сразу для всех костей. Поставьте ключицу или руку в крайнее положение и тащите "
          u"локатор: конец кости идёт за ним. Крайние углы - <b>Clav… / Arm… Angle</b> там же. "
          u"Ключица: поворот контрола (ry &lt; 0 вперёд, ry &gt; 0 назад, rz &gt; 0 вверх). Рука: "
          u"вверх - подъём плечевой кости над покоем, вперёд/назад - её поворот по горизонтали "
          u"(у вертикальной руки гаснет). Правая сторона берёт всё с левой.<br><br>"
          u"<b>scapula</b> - лопатка модуля: скользит по эллипсоиду <b>ribcage</b> за акромионом "
          u"(позер shoulder, scapulaFollow) и поворачивается от подъёма руки (scapulaUp/Down). "
          u"Своей скиновой кости у неё нет - её ведут кости веера.")


class ShoulderFan(module.Module):
    """Плечевой пояс с веером костей (fan.py): ключица, лопатка по рёбрам как
    ведущий, веер из центра грудной клетки. Число костей - в опциях."""

    # рука подключается так же, как к shoulder: те же имена входов сети
    _armInputs = Shoulder._armInputs
    connectedArm = Shoulder.connectedArm
    childConnected = Shoulder.childConnected
    childDisconnected = Shoulder.childDisconnected

    def __init__(self, name):
        super(self.__class__, self).__init__()
        self.name = name
        self.type = __name__.split('.')[-1]
        self.unic = False
        self.spokes = fan.DEFAULT_COUNT

    def create(self, options={}):
        self.root = self.name + "_mod"
        options = options or {}
        self.spokes = int(options.get("spokes", fan.DEFAULT_COUNT))
        if self.spokes < 1:
            cmds.warning("shoulderFan: нужна хотя бы одна кость, беру %d" % fan.DEFAULT_COUNT)
            self.spokes = fan.DEFAULT_COUNT
        utils.importFile(os.path.join(rootPath, self.type + ".ma"), self.name)
        fan.set_count(self.name + "_", self.spokes)
        self.finishCreate()
        fan.connect_skin(self.name)
        # addSkinJoints кладёт в skinJointsSet все кости модуля; корни веера у
        # центра только рисуют линию - их не скинят
        hubs = [j for j in cmds.ls(self.name + "_spoke_*_hub_skinJoint") or []]
        if hubs and cmds.objExists("skinJointsSet"):
            cmds.sets(hubs, rm="skinJointsSet")

    def connect(self, target, opposite=False):
        super(self.__class__, self).connect(target, opposite)
        if opposite:
            fan.link_settings(self.name)

    # ---------------------------------------------------------------- options
    def connectSignals(self, mainInstance, w):
        w.rebuild_btn.clicked.connect(partial(self.rebuildWithNewOptions, mainInstance, w))

    def updateOptionsPage(self, w):
        w.spokes_spinBox.setValue(self.getOptions()["spokes"])
        w.scheme_layout.addWidget(scheme.FanScheme(self.name))
        w.legend_label.setText(LEGEND)

    def getOptions(self):
        # по сцене, а не по памяти: модуль мог прийти из шаблона
        count = fan.scene_count(self.name + "_")
        if count:
            self.spokes = count
        return {"spokes": self.spokes}

    def rebuildWithNewOptions(self, mainInstance, w):
        cmds.undoInfo(openChunk=True)
        try:
            mainInstance.rebuildModule({"spokes": w.spokes_spinBox.value()})
        finally:
            cmds.undoInfo(closeChunk=True)

    # Веса, углы и положения локаторов студия в шаблон не пишет (только
    # контролы и позеры) - сохраняем сами
    def getData(self):
        data = super(self.__class__, self).getData()
        data['fanData'] = fan.get_values(self.name)
        return data

    def setData(self, data, sym=False, namingForce=False, load="all"):
        super(self.__class__, self).setData(data, sym, namingForce, load)
        if load == "all" and not sym:
            fan.set_values(self.name, data.get('fanData'))
