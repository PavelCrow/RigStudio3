import maya.cmds as cmds
import os
from functools import partial

from ... import utils, module
from ..shoulder.shoulder import Shoulder, LIMB_TYPES
from . import fan

rootPath = os.path.normpath(os.path.dirname(__file__))

LEGEND = (u"<b>Веер</b>: из центра (позер <b>fanCenter</b>, в глубине грудной клетки) идут кости к "
          u"позерам <b>spoke_1..N</b> под кожей. Кость только поворачивается вокруг центра - кожа "
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
          u"Своей скиновой кости у неё нет - её ведут кости веера.<br><br>"
          u"Кости по умолчанию: ") + u", ".join(u"%d - %s" % (i + 1, n) for i, n in enumerate(fan.SPOKE_NAMES)) + u"."


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
