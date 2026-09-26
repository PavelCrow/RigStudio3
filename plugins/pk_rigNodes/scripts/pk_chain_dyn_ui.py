# -*- coding: utf-8 -*-
"""Окно динамики: цепочки на pk_chainDynamics и тряска на pk_jiggle.

    import pk_chain_dyn_ui
    pk_chain_dyn_ui.show()

Две закладки, потому что это разные вещи: у цепочки есть имя и один солвер, а
тряска висит на каждой кости своей нодой. Кнопка Pick одна на обе - она смотрит
на выделенное и сама открывает нужную закладку.

Слайдеры привязаны прямо к атрибутам контрола, а кривые - к самой ноде. Никаких
«применить»: что двигаешь, то и меняется, и undo работает как обычно.

Весь текст в окне английский - инструментом пользуются не только у нас.
"""
import maya.cmds as cmds

import pk_chain_dyn as dyn
import pk_jiggle as jig


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

# то же для тряски
JSLIDERS = [
    ("jiggleStiffness", u"Stiffness", 0.0, 1.0,    0.0, 1.0),
    ("jiggleDamping",   u"Damping",   0.0, 1.0,    0.0, 1.0),
    ("jiggleGravity",   u"Gravity",   0.0, 1000.0, 0.0, 100000.0),
    ("jiggleWeight",    u"Weight",    0.0, 1.0,    0.0, 1.0),
    ("jiggleTranslate", u"Translate", 0.0, 1.0,    0.0, 1.0),
    ("jiggleRotate",    u"Rotate",    0.0, 1.0,    0.0, 1.0),
]

# то, что настраивают редко - на самой ноде, обычными полями. outputCount тут
# нет нарочно: число точек ставит сборщик вместе с числом костей, и менять его
# врозь незачем - для этого есть поле Bones
NODE_ATTRS = ["maxBend", "bendSoftness", "substeps", "stretchLimit"]
JNODE_ATTRS = ["axisScale", "limit", "substeps"]

# атрибут контрола -> атрибут ноды, чтобы найти, кто его ведёт
NODE_OF = dict((attr, nodeAttr) for attr, nodeAttr, _dv, _mn, _mx in dyn.SETTINGS)
JNODE_OF = dict((attr, nodeAttr) for attr, nodeAttr, _dv, _mn, _mx in jig.SETTINGS)

_state = {"name": None, "jiggle": None, "playback": None}

# на сколько кадров вперёд уводится диапазон в живом просмотре
LIVE_FRAMES = 100000


# --- поиск ------------------------------------------------------------------

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


def _driver(node, nodeAttr, has=None):
    """Плаг контрола, который правда ведёт эту настройку этой ноды. Настройки
    могли перенести на кастомный контрол, связать с общим, а на одной из них
    связь разорвать - слайдер должен менять того, кого он и меняет."""
    has = has or dyn.hasSettings
    src = cmds.listConnections("%s.%s" % (node, nodeAttr), s=True, d=False, p=True) or []
    if not src:
        return None

    plug = src[0]
    for _ in range(8):
        up = cmds.listConnections(plug, s=True, d=False, p=True) or []
        # выше может быть и анимация - у неё настроек нет, и мы остаёмся здесь
        if not up or not has(up[0].split(".")[0]):
            break
        plug = up[0]
    return plug


def nameOf(node):
    """Имя цепочки по имени ноды - его ждут функции скрипта."""
    if node and node.endswith(SUFFIX):
        return node[:-len(SUFFIX)]
    return node


def pick(quiet=False):
    """Взять по выделению то, что там есть - цепочку или тряску, - и открыть
    закладку, которой это принадлежит."""
    for obj in cmds.ls(sl=True, o=True) or []:
        node = solverFrom(obj)
        if node:
            attach(nameOf(node))
            _tab(0)
            return nameOf(node)

    for obj in cmds.ls(sl=True, o=True) or []:
        node = jig.nodeFrom(obj)
        if node:
            attachJiggle(node)
            _tab(1)
            return node

    if not quiet:
        cmds.warning(u"pk dynamics: select a control or a bone of a chain, "
                     u"or a bone that has jiggle")
    return None


def _tab(index):
    tabs = WIN + "_tabs"
    if cmds.control(tabs, exists=True):
        cmds.tabLayout(tabs, e=True, sti=index + 1)


# --- цепочка ----------------------------------------------------------------

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


def _clear(body):
    for child in cmds.columnLayout(body, q=True, childArray=True) or []:
        cmds.deleteUI(body + "|" + child)
    cmds.setParent(body)


def _fill():
    body = WIN + "_body"
    if not cmds.control(body, exists=True):
        return
    _clear(body)

    name = _state["name"]
    node = dyn._names(name)["node"] if name else None
    host = _host(name) if name else None

    if not host or not cmds.objExists(node):
        cmds.text(l=u"   no chain taken", al="left", h=28)
        cmds.text(l=u"   select one of its controls and press Pick, or build a new one",
                  al="left", h=20)
        return

    goals = len(cmds.getAttr(node + ".goalMatrix", mi=True) or [])
    bones = len(cmds.listConnections(node + ".outMatrix", s=False, d=True) or [])
    where = u"" if host == _root(name) else (u", settings on %s" % host)
    cmds.text(l=u"   %s: %d controls, %d bones%s" % (name, goals, bones, where),
              al="left", h=26)

    cmds.frameLayout(l=u"Settings", cll=True, cl=False, mw=4, mh=4)
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
    cmds.button(l=u"Move the settings onto the selected control", h=26,
                c=lambda *a: _moveSettings(),
                ann=u"Select the control that has the settings and the one to "
                    u"move them to")
    cmds.button(l=u"Link settings: the first drives the second", h=26,
                c=lambda *a: _linkSettings(),
                ann=u"Select two controls with settings - the second will follow "
                    u"the first. That is how several chains go under one control")
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"Dynamics weight along the chain", cll=True, cl=False, mw=4, mh=4)
    cmds.gradientControl(at=node + ".weightRamp", h=110)
    cmds.setParent("..")

    # раздела нет, если плагин старой сборки, без коллизии
    if cmds.attributeQuery("collide", node=node, exists=True):
        made = len(cmds.getAttr(node + ".collider", mi=True) or [])
        cmds.frameLayout(l=u"Collision%s" % (u": %d" % made if made else u""),
                         cll=True, cl=False, mw=4, mh=4)
        cmds.columnLayout(adj=True)
        for attr, label, hi in ((u"collide", u"Collide", 1.0),
                                (u"thickness", u"Thickness", 3.0),
                                (u"bounce", u"Bounce", 1.0),
                                (u"friction", u"Friction", 1.0)):
            cmds.attrFieldSliderGrp(at=node + "." + attr, l=label, min=0.0, max=hi,
                                    fmn=0.0, fmx=1000.0, pre=3, cw3=(110, 60, 180))
        if cmds.attributeQuery("thicknessRamp", node=node, exists=True):
            cmds.text(l=u"   thickness along the chain", al="left", h=18)
            cmds.gradientControl(at=node + ".thicknessRamp", h=90)
        cmds.checkBox(WIN + "_guide", l=u"Show the thickness in the viewport",
                      v=dyn.hasGuides(name),
                      cc=lambda on: _guide(on),
                      ann=u"A ball around every bone - that is the gap the chain "
                          u"keeps. Changed the curve? Toggle this again")
        cmds.optionMenu(WIN + "_colliderKind", l=u"Shape")
        for kind in ("plane", "sphere", "capsule", "box"):
            cmds.menuItem(l=kind)
        cmds.floatFieldGrp(WIN + "_colliderSize", nf=2, l=u"Radius / length",
                           v1=1.0, v2=4.0, cw3=(110, 60, 60), pre=2,
                           ann=u"For a plane and a box the radius is their size; "
                               u"the length is the capsule's only. A plane is "
                               u"endless until its infinite is turned off")
        cmds.button(l=u"Add a collider", h=26, c=lambda *a: _collider(),
                    ann=u"It appears at the middle of the chain - drag it from there")
        cmds.button(l=u"Give the colliders to the selected chains", h=26,
                    c=lambda *a: _shareColliders(),
                    ann=u"Select controls or bones of other chains - every collider "
                        u"of this one becomes theirs too, and stays one object")
        cmds.button(l=u"Take the selected colliders off", h=26,
                    c=lambda *a: _dropColliders(),
                    ann=u"Select colliders - they leave this chain's list but stay "
                        u"in the scene and on the other chains. To switch the whole "
                        u"collision off without unhooking anything, set Collide to 0")
        cmds.setParent("..")
        cmds.setParent("..")

    cmds.frameLayout(l=u"Chain", cll=True, cl=True, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    cmds.rowLayout(nc=2, cw2=(150, 190))
    cmds.intFieldGrp(WIN + "_bones", v1=bones, l=u"Bones", cw2=(70, 60),
                     cc=lambda *a: _setJoints())
    cmds.button(l=u"Apply", c=lambda *a: _setJoints())
    cmds.setParent("..")
    cmds.button(l=u"Reread the controls (rebuild)", h=26, c=lambda *a: _rebuild(),
                ann=u"When controls were added, removed or reordered")
    cmds.rowLayout(nc=3, cw3=(150, 130, 60))
    cmds.floatFieldGrp(WIN + "_radius", l=u"Radius", v1=0.5, cw2=(70, 60), pre=3,
                       ann=u"0 - by the length of the chain")
    cmds.intFieldGrp(WIN + "_sides", l=u"Sides", v1=8, cw2=(60, 50))
    cmds.setParent("..")
    cmds.button(l=u"Cylinder with skin", h=26, c=lambda *a: _cylinder(),
                ann=u"A cylinder on the bones, one split per bone")
    cmds.button(l=u"Delete the chain", h=26, c=lambda *a: _delete())
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"Node", cll=True, cl=True, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    for attr in NODE_ATTRS:
        if cmds.attributeQuery(attr, node=node, exists=True):
            cmds.attrControlGrp(a=node + "." + attr)
    cmds.setParent("..")
    cmds.setParent("..")


# --- тряска -----------------------------------------------------------------

def attachJiggle(node):
    """Перестроить вторую закладку под эту тряску."""
    _state["jiggle"] = node
    if cmds.window(WIN, exists=True):
        _jfill()


def _jfill():
    body = WIN + "_jbody"
    if not cmds.control(body, exists=True):
        return
    _clear(body)

    node = _state["jiggle"]
    if not node or not cmds.objExists(node):
        cmds.text(l=u"   no jiggle taken", al="left", h=28)
        cmds.text(l=u"   select a bone that has jiggle and press Pick, or make one",
                  al="left", h=20)
        return

    joint = jig.jointOf(node)
    host = jig.hostOf(node)
    family = jig.nodes(host)
    more = u"" if len(family) < 2 else (u", with %d more bones" % (len(family) - 1))
    cmds.text(l=u"   %s: settings on %s%s" % (joint or node, host or u"?", more),
              al="left", h=26)

    cmds.frameLayout(l=u"Settings", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True)

    def plugOf(attr):
        got = _driver(node, JNODE_OF.get(attr, attr), jig.hasSettings)
        if got:
            return got
        return (host + "." + attr) if host and cmds.attributeQuery(
            attr, node=host, exists=True) else None

    plug = plugOf(u"jiggle")
    if plug:
        cmds.attrControlGrp(a=plug, l=u"Jiggle")
    # startFrame у тряски не выносится на контрол - он на самой ноде
    cmds.attrControlGrp(a=node + ".startFrame", l=u"Start frame")

    for attr, label, lo, hi, flo, fhi in JSLIDERS:
        plug = plugOf(attr)
        if not plug:
            continue
        cmds.attrFieldSliderGrp(at=plug, l=label, min=lo, max=hi,
                                fmn=flo, fmx=fhi, pre=3, cw3=(110, 60, 180))
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.frameLayout(l=u"This bone", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True)
    for attr in JNODE_ATTRS:
        if cmds.attributeQuery(attr, node=node, exists=True):
            cmds.attrControlGrp(a=node + "." + attr)
    cmds.button(l=u"Select the driver", h=26, c=lambda *a: _jiggleDriver(),
                ann=u"The transform that remembers where the bone belongs with no "
                    u"jiggle at all. It rides the rig; the bone follows it late")
    cmds.button(l=u"Remove the jiggle from the selected bones", h=26,
                c=lambda *a: _jiggleRemove(),
                ann=u"The bone stays exactly where it is now")
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


# --- действия: цепочка ------------------------------------------------------

def _need():
    name = _state["name"]
    if not name or not cmds.objExists(dyn._names(name)["node"]):
        cmds.warning(u"pk chain: no chain taken")
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
        cmds.warning(u"pk chain: select exactly two controls - %s" % what)
        return None, None
    return sel[0], sel[1]


def _moveSettings():
    """Настройки уезжают на второй выделенный. Порядок можно не соблюдать:
    источник тот, на котором они есть."""
    a, b = _twoSelected(u"the one that has the settings and the one to move them to")
    if not a:
        return

    if not dyn.hasSettings(a) and dyn.hasSettings(b):
        a, b = b, a
    if not dyn.hasSettings(a):
        cmds.warning(u"pk chain: neither of the selected controls has dynamic settings")
        return
    if dyn.hasSettings(b):
        cmds.warning(u"pk chain: %s already has settings - for two masters there is "
                     u"the other button, the linking one" % b)
        return

    dyn.moveSettings(a, b)
    _fill()


def _linkSettings():
    """Второй выделенный идёт за первым."""
    a, b = _twoSelected(u"the driving one and the driven one")
    if not a:
        return
    if not dyn.hasSettings(a):
        cmds.warning(u"pk chain: %s has no dynamic settings" % a)
        return

    dyn.linkSettings(a, b)
    _fill()


def _later(fn):
    """Перестроить окно не из коллбэка кнопки, а следующим делом: иначе кнопка
    сносит те самые контролы, из которых её и нажали."""
    cmds.evalDeferred(fn, lowestPriority=True)


def _guide(on):
    name = _need()
    if not name:
        return
    dyn.thicknessGuide(name, bool(on))


def _collider():
    name = _need()
    if not name:
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
    if not name:
        return

    if not dyn.colliders(name):
        cmds.warning(u"pk chain: %s has no colliders to give" % name)
        return

    others = _otherChains(name)
    if not others:
        cmds.warning(u"pk chain: select controls or bones of the chains "
                     u"to give the colliders to")
        return

    dyn.shareColliders(name, *others)
    _later(_fill)


def _dropColliders():
    name = _need()
    if not name:
        return

    mine = dyn.colliders(name)
    picked = [o for o in cmds.ls(sl=True, o=True) or [] if o in mine]
    if not picked:
        cmds.warning(u"pk chain: select colliders of this chain - "
                     u"there is nothing to take off")
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
    if cmds.confirmDialog(t=u"Delete the chain", m=u"Delete %s?" % name,
                          b=[u"Delete", u"Cancel"], db=u"Cancel",
                          cb=u"Cancel") != u"Delete":
        return
    dyn.delete(name)
    _state["name"] = None
    _fill()


def _fromSelection():
    name = cmds.textFieldGrp(WIN + "_name", q=True, tx=True).strip() or "chain"
    if cmds.objExists(dyn._names(name)["node"]):
        cmds.warning(u"pk chain: %s already exists - take it with Pick "
                     u"or give another name" % name)
        return
    r = dyn.fromSelection(name, joints=cmds.intFieldGrp(WIN + "_new", q=True, v2=True))
    if r:
        attach(name)
        _tab(0)


def _build():
    name = cmds.textFieldGrp(WIN + "_name", q=True, tx=True).strip() or "chain"
    if cmds.objExists(dyn._names(name)["top"]):
        cmds.warning(u"pk chain: %s already exists - take it with Pick "
                     u"or give another name" % name)
        return
    count = cmds.intFieldGrp(WIN + "_new", q=True, v1=True)
    joints = cmds.intFieldGrp(WIN + "_new", q=True, v2=True)
    length = cmds.floatFieldGrp(WIN + "_len", q=True, v1=True)
    axis = cmds.optionMenu(WIN + "_axis", q=True, v=True)
    r = dyn.build(name, count=count, length=length, axis=axis, joints=joints)
    if r:
        attach(name)
        _tab(0)


# --- действия: тряска -------------------------------------------------------

def _needJiggle():
    node = _state["jiggle"]
    if not node or not cmds.objExists(node):
        cmds.warning(u"pk jiggle: no jiggle taken")
        return None
    return node


def _jiggleHost():
    """Контрол из поля, если он там есть и существует."""
    host = cmds.textFieldGrp(WIN + "_jhost", q=True, tx=True).strip()
    if not host:
        return None
    if not cmds.objExists(host):
        cmds.warning(u"pk jiggle: %s not found - leave the field empty to put the "
                     u"settings on the bones themselves" % host)
        return False
    return host


def _jiggleGrab():
    """Взять выделенное в поле контрола."""
    sel = cmds.ls(sl=True, o=True) or []
    if sel:
        cmds.textFieldGrp(WIN + "_jhost", e=True, tx=sel[0])


def _jiggleBuild():
    host = _jiggleHost()
    if host is False:
        return

    made = jig.fromSelection(host=host)
    if made:
        attachJiggle(made[-1]["node"])
        _later(_jfill)


def _jiggleControl():
    """Кубик с костью: если что-то выделено - на его месте и под ним."""
    sel = cmds.ls(sl=True, o=True, type="transform") or []
    where = sel[0] if sel else None
    size = cmds.floatFieldGrp(WIN + "_jsize", q=True, v1=True)

    made = jig.buildControl(size=size, at=where, parent=where)
    if made:
        attachJiggle(made["node"])
        _later(_jfill)


def _jiggleRemove():
    """Снять тряску с выделенных костей - или с той, что взята в окне."""
    picked = []
    for obj in cmds.ls(sl=True, o=True) or []:
        node = jig.nodeFrom(obj)
        if node and node not in picked:
            picked.append(node)
    if not picked:
        node = _needJiggle()
        if not node:
            return
        picked = [node]

    cmds.undoInfo(openChunk=True, chunkName="pk jiggle: remove")
    try:
        for node in picked:
            joint = jig.jointOf(node)
            if joint:
                jig.delete(joint)
    finally:
        cmds.undoInfo(closeChunk=True)

    if _state["jiggle"] in picked:
        _state["jiggle"] = None
    _later(_jfill)


def _jiggleDriver():
    node = _needJiggle()
    if not node:
        return
    src = cmds.listConnections(node + ".inMatrix", s=True, d=False) or []
    if src:
        cmds.select(src[0])


# --- сборка окна ------------------------------------------------------------

def show():
    if not dyn.loadPlugin():
        return

    if cmds.window(WIN, exists=True):
        cmds.deleteUI(WIN)

    cmds.window(WIN, t=u"pk dynamics", wh=(420, 700), mnb=True, mxb=False)
    cmds.columnLayout(adj=True, rs=2)

    cmds.rowLayout(nc=2, adj=1, cw2=(300, 100))
    cmds.textFieldGrp(WIN + "_name", l=u"Name", tx="chain", cw2=(40, 250))
    cmds.button(l=u"Pick", h=26, c=lambda *a: pick(),
                ann=u"Take whatever is selected - a chain's control or bone, "
                    u"or a bone that has jiggle")
    cmds.setParent("..")

    cmds.checkBox(WIN + "_live", l=u"Live preview - move the controls and watch",
                  v=False, onc=lambda *a: live(True), ofc=lambda *a: live(False),
                  ann=u"Playback runs forward while this is on: standing still the "
                      u"node does not move, so the time has to. Turn it off and the "
                      u"time and the range come back where they were")

    cmds.tabLayout(WIN + "_tabs", innerMarginWidth=4, innerMarginHeight=4)

    # --- закладка цепочек
    chain = cmds.columnLayout(adj=True, rs=2)
    cmds.frameLayout(l=u"Create", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True, rs=2)
    cmds.intFieldGrp(WIN + "_new", nf=2, l=u"Controls / bones", v1=5, v2=10,
                     cw3=(120, 60, 60),
                     ann=u"0 bones - one per control")
    cmds.rowLayout(nc=2, cw2=(230, 150))
    cmds.floatFieldGrp(WIN + "_len", l=u"Length", v1=10.0, cw2=(60, 70), pre=2)
    cmds.optionMenu(WIN + "_axis", l=u"Axis")
    for a in ("x", "y", "z", "-x", "-y", "-z"):
        cmds.menuItem(l=a)
    cmds.setParent("..")
    cmds.button(l=u"Chain from scratch", h=28, c=lambda *a: _build(),
                ann=u"Controls, the node and the bones, from the origin")
    cmds.button(l=u"From the selected controls", h=28, c=lambda *a: _fromSelection(),
                ann=u"Select the root of the chain and the rest is found down the "
                    u"hierarchy; or select every control in order")
    cmds.setParent("..")
    cmds.setParent("..")
    cmds.columnLayout(WIN + "_body", adj=True, rs=2)
    cmds.setParent("..")
    cmds.setParent("..")

    # --- закладка тряски
    shake = cmds.columnLayout(adj=True, rs=2)
    cmds.frameLayout(l=u"Create", cll=True, cl=False, mw=4, mh=4)
    cmds.columnLayout(adj=True, rs=2)
    cmds.rowLayout(nc=2, adj=1, cw2=(300, 60))
    cmds.textFieldGrp(WIN + "_jhost", l=u"Settings on", tx="", cw2=(80, 210),
                      ann=u"A control to gather the settings on. Empty - they go "
                          u"on the bones themselves")
    cmds.button(l=u"<<", h=26, c=lambda *a: _jiggleGrab(),
                ann=u"Take the selected object")
    cmds.setParent("..")
    cmds.button(l=u"Jiggle on the selected bones", h=28, c=lambda *a: _jiggleBuild(),
                ann=u"A belly, a cheek, a jaw of fat: the bone follows the rig with "
                    u"weight of its own. It stays where it is in the skeleton")
    cmds.rowLayout(nc=2, adj=1, cw2=(240, 120))
    cmds.floatFieldGrp(WIN + "_jsize", l=u"Size", v1=1.0, cw2=(80, 60), pre=2)
    cmds.setParent("..")
    cmds.button(l=u"Control with a bone", h=28, c=lambda *a: _jiggleControl(),
                ann=u"A cube control, a bone under it and the jiggle on that bone - "
                    u"something to try it on. Select a transform first and it lands "
                    u"there, under it, so it rides the rig")
    cmds.setParent("..")
    cmds.setParent("..")
    cmds.columnLayout(WIN + "_jbody", adj=True, rs=2)
    cmds.setParent("..")
    cmds.setParent("..")

    cmds.tabLayout(WIN + "_tabs", e=True,
                   tabLabel=((chain, u"Chains"), (shake, u"Jiggle")))
    cmds.setParent("..")

    cmds.showWindow(WIN)

    # закрыли окно или сменили сцену, не сняв галку - вернуть проигрывание
    cmds.scriptJob(uiDeleted=[WIN, _liveOff], protected=False)
    cmds.scriptJob(event=["NewSceneOpened", _liveOff], parent=WIN)

    # если что-то выделено - сразу взять это
    pick(quiet=True)
    _fill()
    _jfill()
