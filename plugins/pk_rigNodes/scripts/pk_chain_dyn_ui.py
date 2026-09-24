# -*- coding: utf-8 -*-
"""Окно для цепочек на pk_chainDynamics.

    import pk_chain_dyn_ui
    pk_chain_dyn_ui.show()

Окно всегда работает с одной цепочкой - той, что сейчас взята. Взять её можно
двумя способами: выделить любой её контрол или кость и нажать Pick, либо
собрать новую - из выделенных контролов или с нуля.

Слайдеры привязаны прямо к атрибутам корневого контрола, а кривые - к самой
ноде. Никаких «применить»: что двигаешь, то и меняется, и undo работает как
обычно.

Цилиндр со скином - чтобы сразу было видно, что делает цепочка: геометрия
садится на кости как они стоят, по одному сплиту на кость, и биндится к ним.
"""
import maya.cmds as cmds

import pk_chain_dyn as dyn


WIN = "pkChainDynWindow"
SUFFIX = "_chainDynamics"

# что показывать слайдером: атрибут контрола, подпись, границы слайдера и поля
SLIDERS = [
    ("stiffness",      u"Stiffness",       0.0, 1.0,   0.0, 1.0),
    ("damping",        u"Damping",         0.0, 1.0,   0.0, 1.0),
    ("stretch",        u"Stretch",         0.0, 3.0,   0.0, 1000.0),
    ("stretchDamping", u"Stretch damping", 0.0, 1.0,   0.0, 1.0),
    ("gravity",        u"Gravity",         0.0, 1000.0, 0.0, 100000.0),
    ("dynamicWeight",  u"Weight",          0.0, 1.0,   0.0, 1.0),
    ("localTranslate", u"Local translate", 0.0, 1.0,   0.0, 1.0),
    ("localRotate",    u"Local rotate",    0.0, 1.0,   0.0, 1.0),
]

# то, что настраивают редко - на самой ноде, обычными полями
NODE_ATTRS = ["maxBend", "bendSoftness", "dampingEven", "outputCount", "aimAxis",
              "substeps", "stretchLimit", "stretchSpeed", "stretchRelease"]

# атрибут контрола -> атрибут ноды, чтобы найти, кто его ведёт
NODE_OF = dict((attr, nodeAttr) for attr, nodeAttr, _dv, _mn, _mx in dyn.SETTINGS)

_state = {"name": None, "playback": None}

# на сколько кадров вперёд уводится диапазон в живом просмотре
LIVE_FRAMES = 100000


def use(module=None):
    """Переключить окно на другой сборщик - например pk_chain_dyn2 с
    экспериментальной нодой. Без аргумента просто возвращает текущий."""
    global dyn
    if module is not None:
        dyn = module
        _state["name"] = None
        if cmds.window(WIN, exists=True):
            _fill()
    return dyn


# --- поиск цепочки ----------------------------------------------------------

def solverFrom(obj):
    """Нода цепочки, к которой относится объект: сам контрол, его кость, шейп
    или что-то, что висит под контролом. Связи ищутся по типу ноды, а не по
    именам - переименованная цепочка находится так же."""
    if not obj or not cmds.objExists(obj):
        return None

    seen = set()
    walk = [obj]
    for _ in range(64):
        if not walk:
            break
        current = walk.pop(0)
        if current in seen:
            continue
        seen.add(current)

        found = cmds.listConnections(current, type=dyn.NODE) or []
        if found:
            return found[0]

        # шейпы контрола и вверх по иерархии - выделить могли что угодно
        walk += cmds.listRelatives(current, s=True, f=False) or []
        walk += cmds.listRelatives(current, p=True, f=False) or []

    return None


def _driver(node, nodeAttr):
    """Плаг контрола, который правда ведёт эту настройку этой ноды. Настройки
    могли перенести на кастомный контрол, связать с общим, а на одной из них
    связь разорвать - слайдер должен менять того, кого он и меняет."""
    src = cmds.listConnections("%s.%s" % (node, nodeAttr), s=True, d=False, p=True) or []
    if not src:
        return None

    plug = src[0]
    for _ in range(8):
        up = cmds.listConnections(plug, s=True, d=False, p=True) or []
        # выше может быть и анимация - у неё настроек нет, и мы остаёмся здесь
        if not up or not dyn.hasSettings(up[0].split(".")[0]):
            break
        plug = up[0]
    return plug


def nameOf(node):
    """Имя цепочки по имени ноды - его ждут функции скрипта."""
    if node and node.endswith(SUFFIX):
        return node[:-len(SUFFIX)]
    return node


def pick(quiet=False):
    """Взять цепочку по выделению."""
    for obj in cmds.ls(sl=True) or []:
        node = solverFrom(obj)
        if node:
            attach(nameOf(node))
            return nameOf(node)

    if not quiet:
        cmds.warning(u"pk chain: выдели контрол или кость цепочки")
    return None


# --- окно -------------------------------------------------------------------

def attach(name):
    """Перестроить содержимое окна под цепочку name."""
    _state["name"] = name
    if cmds.window(WIN, exists=True):
        _fill()


def _root(name):
    """Корневой контрол цепочки - первая цель ноды."""
    node = dyn._names(name)["node"]
    src = cmds.listConnections(node + ".goalMatrix[0]", s=True, d=False) or []
    return src[0] if src else None


def _host(name):
    """Контрол, на котором живут настройки. Это не обязательно корень цепочки:
    ручки могли перенести на кастомный контрол, а могли и связать с общим -
    тогда идём по связям до того, кто их правда ведёт, чтобы слайдеры в окне
    были рабочими, а не заблокированными."""
    node = dyn._names(name)["node"]
    if not cmds.objExists(node):
        return None

    first = dyn.SETTINGS[0][0]
    src = cmds.listConnections(node + "." + dyn.SETTINGS[0][1],
                               s=True, d=False, p=True) or []
    host = src[0].split(".")[0] if src else None
    if not host:
        root = cmds.listConnections(node + ".goalMatrix[0]", s=True, d=False) or []
        return root[0] if root else None

    for _ in range(8):
        up = cmds.listConnections("%s.%s" % (host, first), s=True, d=False, p=True) or []
        if not up:
            break
        above = up[0].split(".")[0]
        # выше может оказаться анимация или что-то ещё, что настройкой не
        # является - тогда остаёмся здесь
        if not dyn.hasSettings(above):
            break
        host = above

    return host


def _fill():
    body = WIN + "_body"
    if not cmds.control(body, exists=True):
        return

    for child in cmds.columnLayout(body, q=True, childArray=True) or []:
        cmds.deleteUI(body + "|" + child)

    cmds.setParent(body)

    name = _state["name"]
    node = dyn._names(name)["node"] if name else None
    host = _host(name) if name else None

    if not host or not cmds.objExists(node):
        cmds.text(l=u"   цепочка не взята", al="left", h=28)
        cmds.text(l=u"   выдели её контрол и нажми Pick, или собери новую",
                  al="left", h=20)
        return

    goals = len(cmds.getAttr(node + ".goalMatrix", mi=True) or [])
    bones = len(cmds.listConnections(node + ".outMatrix", s=False, d=True) or [])
    where = u"" if host == _root(name) else (u", настройки на %s" % host)
    cmds.text(l=u"   %s: контролов %d, костей %d%s" % (name, goals, bones, where),
              al="left", h=26)

    cmds.frameLayout(l=u"Настройки", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    def plugOf(attr):
        got = _driver(node, NODE_OF.get(attr, attr))
        if got:
            return got
        return (host + "." + attr) if cmds.attributeQuery(attr, node=host,
                                                          exists=True) else None

    for attr, label in ((u"dynamic", u"Dynamic"), (u"startFrame", u"Start frame")):
        plug = plugOf(attr)
        if plug:
            cmds.attrControlGrp(a=plug, l=label)

    for attr, label, lo, hi, flo, fhi in SLIDERS:
        plug = plugOf(attr)
        if not plug:
            continue
        cmds.attrFieldSliderGrp(at=plug, l=label, min=lo, max=hi,
                                fmn=flo, fmx=fhi, pre=3, cw3=(110, 60, 180))
    cmds.button(l=u"Перенести настройки на выделенный контрол", h=26,
                c=lambda *a: _moveSettings(),
                ann=u"Выдели контрол с настройками и тот, на который их перенести")
    cmds.button(l=u"Связать настройки: первый ведёт второго", h=26,
                c=lambda *a: _linkSettings(),
                ann=u"Выдели два контрола с настройками - второй пойдёт за первым. "
                    u"Так несколько цепочек собираются под одним управлением")
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"Вес динамики по цепочке", cll=True, cl=False, mw=4, mh=4)
    cmds.gradientControl(at=node + ".weightRamp", h=110)
    cmds.setParent("..")

    cmds.frameLayout(l=u"Жёсткость по цепочке", cll=True, cl=True, mw=4, mh=4)
    cmds.gradientControl(at=node + ".stiffnessRamp", h=110)
    cmds.setParent("..")

    # коллизия есть только у экспериментальной ноды - у рабочей этого раздела
    # просто нет, и окно одинаково годится для обеих
    if hasattr(dyn, "collider") and cmds.attributeQuery("collide", node=node, exists=True):
        made = len(cmds.getAttr(node + ".collider", mi=True) or [])
        cmds.frameLayout(l=u"Коллизия%s" % (u": %d" % made if made else u""),
                         cll=True, cl=False, mw=4, mh=4)
        cmds.columnLayout(adj=True)
        for attr, label, hi in ((u"collide", u"Collide", 1.0),
                                (u"thickness", u"Thickness", 3.0),
                                (u"bounce", u"Bounce", 1.0),
                                (u"friction", u"Friction", 1.0)):
            cmds.attrFieldSliderGrp(at=node + "." + attr, l=label, min=0.0, max=hi,
                                    fmn=0.0, fmx=1000.0, pre=3, cw3=(110, 60, 180))
        cmds.optionMenu(WIN + "_colliderKind", l=u"Форма")
        for kind in ("plane", "sphere", "capsule"):
            cmds.menuItem(l=kind)
        cmds.floatFieldGrp(WIN + "_colliderSize", nf=2, l=u"Радиус / длина",
                           v1=1.0, v2=4.0, cw3=(110, 60, 60), pre=2,
                           ann=u"У плоскости радиус это размер квадрата, "
                               u"длина только у капсулы")
        cmds.button(l=u"Добавить коллайдер", h=26, c=lambda *a: _collider(),
                    ann=u"Появится у середины цепочки - оттуда его и двигать")
        cmds.button(l=u"Отдать коллайдеры выделенным цепочкам", h=26,
                    c=lambda *a: _shareColliders(),
                    ann=u"Выдели контролы или кости других цепочек - все коллайдеры "
                        u"этой станут и их. Коллайдер при этом один на всех")
        cmds.button(l=u"Снять выделенные коллайдеры", h=26,
                    c=lambda *a: _dropColliders(),
                    ann=u"Выдели коллайдеры - уйдут из списка этой цепочки, но "
                        u"останутся в сцене и на других. Выключить всю коллизию, "
                        u"ничего не отцепляя - ползунок Collide в ноль")
        cmds.setParent("..")
        cmds.setParent("..")

    cmds.frameLayout(l=u"Цепочка", cll=True, cl=True, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    cmds.rowLayout(nc=2, cw2=(150, 190))
    cmds.intFieldGrp(WIN + "_bones", v1=bones, l=u"Костей", cw2=(70, 60),
                     cc=lambda *a: _setJoints())
    cmds.button(l=u"Применить", c=lambda *a: _setJoints())
    cmds.setParent("..")
    cmds.button(l=u"Перечитать контролы (rebuild)", h=26, c=lambda *a: _rebuild(),
                ann=u"Когда контролы добавили, убрали или переставили")
    cmds.rowLayout(nc=3, cw3=(150, 130, 60))
    cmds.floatFieldGrp(WIN + "_radius", l=u"Радиус", v1=0.5, cw2=(70, 60), pre=3,
                       ann=u"0 - по длине цепочки")
    cmds.intFieldGrp(WIN + "_sides", l=u"Граней", v1=8, cw2=(60, 50))
    cmds.setParent("..")
    cmds.button(l=u"Цилиндр со скином", h=26, c=lambda *a: _cylinder(),
                ann=u"Цилиндр по костям, сплитов по длине - по одному на кость")
    cmds.button(l=u"Удалить цепочку", h=26, c=lambda *a: _delete())
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"Нода", cll=True, cl=True, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    for attr in NODE_ATTRS:
        if cmds.attributeQuery(attr, node=node, exists=True):
            cmds.attrControlGrp(a=node + "." + attr)
    cmds.setParent("..")
    cmds.setParent("..")


# --- живой просмотр ---------------------------------------------------------

def live(on):
    """Проигрывание вперёд, пока его не выключат: контролы во время него
    двигаются, а нода на каждом кадре делает свой шаг - это и есть живой
    просмотр динамики.

    Стоя на месте нода нарочно не шевелится: тот же кадр всегда считается
    одинаково, иначе ни сцраб, ни кеш не были бы предсказуемы. Поэтому время
    должно идти.

    Диапазон уводится далеко вперёд, а не зацикливается: на возврате к началу
    время идёт назад, и цепочка честно сбрасывается - дёргалась бы на каждом
    круге. Что изменено, то и возвращается на место при выключении."""
    if on:
        if _state["playback"] is not None:
            return
        now = cmds.currentTime(q=True)
        _state["playback"] = {
            "time": now,
            "min": cmds.playbackOptions(q=True, min=True),
            "max": cmds.playbackOptions(q=True, max=True),
            "ast": cmds.playbackOptions(q=True, ast=True),
            "aet": cmds.playbackOptions(q=True, aet=True),
            "loop": cmds.playbackOptions(q=True, loop=True),
        }
        cmds.playbackOptions(ast=now, aet=now + LIVE_FRAMES,
                             min=now, max=now + LIVE_FRAMES, loop="once")
        cmds.play(state=True, forward=True)
        return

    was = _state["playback"]
    _state["playback"] = None
    cmds.play(state=False)
    if was:
        cmds.playbackOptions(ast=was["ast"], aet=was["aet"],
                             min=was["min"], max=was["max"], loop=was["loop"])
        cmds.currentTime(was["time"])


def _liveOff():
    """Выключить, если окно закрыли или сцену сменили, не сняв галку."""
    if _state["playback"] is not None:
        live(False)


# --- действия ---------------------------------------------------------------

def _need():
    name = _state["name"]
    if not name or not cmds.objExists(dyn._names(name)["node"]):
        cmds.warning(u"pk chain: цепочка не взята")
        return None
    return name


def _setJoints():
    name = _need()
    if name:
        dyn.setJoints(name, cmds.intFieldGrp(WIN + "_bones", q=True, v1=True))
        _fill()


def _twoSelected(what):
    sel = cmds.ls(sl=True, o=True) or []
    if len(sel) != 2:
        cmds.warning(u"pk chain: выдели ровно два контрола - %s" % what)
        return None, None
    return sel[0], sel[1]


def _moveSettings():
    """Настройки уезжают на второй выделенный. Порядок можно не соблюдать:
    источник тот, на котором они есть."""
    a, b = _twoSelected(u"откуда и куда")
    if not a:
        return

    if not dyn.hasSettings(a) and dyn.hasSettings(b):
        a, b = b, a
    if not dyn.hasSettings(a):
        cmds.warning(u"pk chain: ни на одном из выделенных нет настроек динамики")
        return
    if dyn.hasSettings(b):
        cmds.warning(u"pk chain: на %s настройки уже есть - для двух мастеров "
                     u"есть вторая кнопка, связать" % b)
        return

    dyn.moveSettings(a, b)
    _fill()


def _linkSettings():
    """Второй выделенный идёт за первым."""
    a, b = _twoSelected(u"ведущий и ведомый")
    if not a:
        return
    if not dyn.hasSettings(a):
        cmds.warning(u"pk chain: на %s нет настроек динамики" % a)
        return

    dyn.linkSettings(a, b)
    _fill()


def _later(fn):
    """Перестроить окно не из коллбэка кнопки, а следующим делом: иначе кнопка
    сносит те самые контролы, из которых её и нажали."""
    cmds.evalDeferred(fn, lowestPriority=True)


def _collider():
    name = _need()
    if not name:
        return
    if not hasattr(dyn, "collider"):
        cmds.warning(u"pk chain: коллайдеры есть только у экспериментальной ноды - "
                     u"переключи окно через ui.use(pk_chain_dyn2)")
        return

    kind = cmds.optionMenu(WIN + "_colliderKind", q=True, v=True)
    size = cmds.floatFieldGrp(WIN + "_colliderSize", q=True, v1=True)
    length = cmds.floatFieldGrp(WIN + "_colliderSize", q=True, v2=True)

    # у середины цепочки, а не в начале координат: оттуда его видно и оттуда
    # удобно тащить туда, где он нужен
    at = None
    bones = dyn.bones(name)
    if bones:
        at = cmds.xform(bones[len(bones) // 2], q=True, ws=True, t=True)

    dyn.collider(name, kind, size=size, length=length, at=at)
    _later(_fill)


def _otherChains(name):
    """Цепочки выделенных объектов, кроме той, с которой окно работает."""
    out = []
    for obj in cmds.ls(sl=True, o=True) or []:
        node = solverFrom(obj)
        if not node:
            continue
        other = nameOf(node)
        if other != name and other not in out:
            out.append(other)
    return out


def _shareColliders():
    name = _need()
    if not name or not hasattr(dyn, "shareColliders"):
        return

    if not dyn.colliders(name):
        cmds.warning(u"pk chain: у %s нет коллайдеров, отдавать нечего" % name)
        return

    others = _otherChains(name)
    if not others:
        cmds.warning(u"pk chain: выдели контролы или кости тех цепочек, "
                     u"которым отдать коллайдеры")
        return

    dyn.shareColliders(name, *others)
    _later(_fill)


def _dropColliders():
    name = _need()
    if not name or not hasattr(dyn, "removeCollider"):
        return

    mine = dyn.colliders(name)
    picked = [o for o in cmds.ls(sl=True, o=True) or [] if o in mine]
    if not picked:
        cmds.warning(u"pk chain: выдели коллайдеры этой цепочки - снимать нечего")
        return

    cmds.undoInfo(openChunk=True, chunkName="pk chain: drop colliders")
    try:
        for obj in picked:
            dyn.removeCollider(name, obj)
    finally:
        cmds.undoInfo(closeChunk=True)
    _later(_fill)


def _rebuild():
    name = _need()
    if name:
        dyn.rebuild(name)
        _fill()


def _cylinder():
    name = _need()
    if not name:
        return
    radius = cmds.floatFieldGrp(WIN + "_radius", q=True, v1=True)
    sides = cmds.intFieldGrp(WIN + "_sides", q=True, v1=True)
    dyn.cylinder(name, radius=(radius if radius > 0 else None), sides=max(3, sides))


def _delete():
    name = _need()
    if not name:
        return
    if cmds.confirmDialog(t=u"Удалить цепочку", m=u"Удалить %s?" % name,
                          b=[u"Удалить", u"Отмена"], db=u"Отмена",
                          cb=u"Отмена") != u"Удалить":
        return
    dyn.delete(name)
    _state["name"] = None
    _fill()


def _fromSelection():
    name = cmds.textFieldGrp(WIN + "_name", q=True, tx=True).strip() or "chain"
    if cmds.objExists(dyn._names(name)["node"]):
        cmds.warning(u"pk chain: %s уже есть - возьми её через Pick или дай другое имя" % name)
        return
    r = dyn.fromSelection(name, joints=cmds.intFieldGrp(WIN + "_new", q=True, v2=True))
    if r:
        attach(name)


def _build():
    name = cmds.textFieldGrp(WIN + "_name", q=True, tx=True).strip() or "chain"
    if cmds.objExists(dyn._names(name)["top"]):
        cmds.warning(u"pk chain: %s уже есть - возьми её через Pick или дай другое имя" % name)
        return
    count = cmds.intFieldGrp(WIN + "_new", q=True, v1=True)
    joints = cmds.intFieldGrp(WIN + "_new", q=True, v2=True)
    length = cmds.floatFieldGrp(WIN + "_len", q=True, v1=True)
    axis = cmds.optionMenu(WIN + "_axis", q=True, v=True)
    r = dyn.build(name, count=count, length=length, axis=axis, joints=joints)
    if r:
        attach(name)


# --- сборка окна ------------------------------------------------------------

def show():
    if not dyn.loadPlugin():
        return

    if cmds.window(WIN, exists=True):
        cmds.deleteUI(WIN)

    cmds.window(WIN, t=u"pk chain dynamics", wh=(400, 640), mnb=True, mxb=False)
    cmds.columnLayout(adj=True, rs=2)

    cmds.rowLayout(nc=2, adj=1, cw2=(280, 100))
    cmds.textFieldGrp(WIN + "_name", l=u"Имя", tx="chain", cw2=(40, 230))
    cmds.button(l=u"Pick", h=26, c=lambda *a: pick(),
                ann=u"Взять цепочку выделенного контрола или кости")
    cmds.setParent("..")

    cmds.checkBox(WIN + "_live", l=u"Живой просмотр - двигать контролы и видеть динамику",
                  v=False, onc=lambda *a: live(True), ofc=lambda *a: live(False),
                  ann=u"Проигрывание идёт вперёд, пока галка стоит. Снимешь - "
                      u"время и диапазон вернутся туда, где были")

    cmds.frameLayout(l=u"Создать", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True, rs=2)
    cmds.intFieldGrp(WIN + "_new", nf=2, l=u"Контролов / костей", v1=5, v2=10,
                     cw3=(120, 60, 60),
                     ann=u"Костей 0 - по одной на контрол")
    cmds.rowLayout(nc=2, cw2=(230, 150))
    cmds.floatFieldGrp(WIN + "_len", l=u"Длина", v1=10.0, cw2=(60, 70), pre=2)
    cmds.optionMenu(WIN + "_axis", l=u"Ось")
    for a in ("x", "y", "z", "-x", "-y", "-z"):
        cmds.menuItem(l=a)
    cmds.setParent("..")
    cmds.button(l=u"Цепочка с нуля", h=28, c=lambda *a: _build(),
                ann=u"Контролы, нода и кости от начала координат")
    cmds.button(l=u"Из выделенных контролов", h=28, c=lambda *a: _fromSelection(),
                ann=u"Выдели корень цепочки - остальные найдутся по иерархии; "
                    u"или выдели все контролы по порядку")
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.columnLayout(WIN + "_body", adj=True, rs=2)
    cmds.setParent("..")

    cmds.showWindow(WIN)

    # закрыли окно или сменили сцену, не сняв галку - вернуть проигрывание
    cmds.scriptJob(uiDeleted=[WIN, _liveOff], protected=False)
    cmds.scriptJob(event=["NewSceneOpened", _liveOff], parent=WIN)

    # если что-то выделено - сразу взять эту цепочку
    pick(quiet=True)
    _fill()
