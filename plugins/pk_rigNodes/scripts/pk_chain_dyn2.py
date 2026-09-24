# -*- coding: utf-8 -*-
"""Тот же сборщик цепочек, но на ноде pk_chainDynamics2 из плагина
pk_dynamics2 - там пробуется коллизия, а рабочий pk_dynamics не трогается.

    import pk_chain_dyn2 as dyn2
    dyn2.build("test", count=4, joints=10)
    dyn2.collider("test", "plane")        - пол под цепочкой, с формой
    dyn2.collider("test", "sphere", size=2.0)
    dyn2.reshape("test")                  - дать форму коллайдерам-локаторам

    import pk_chain_dyn_ui as ui
    ui.use(dyn2)                          - окно на экспериментальную ноду
    ui.use(__import__("pk_chain_dyn"))    - и обратно на рабочую

Это не копия скрипта, а он же, загруженный вторым экземпляром: правки в
pk_chain_dyn.py доходят сюда сами, расходиться им негде.
"""
import importlib.util as _util
import os as _os

import maya.cmds as cmds

_path = _os.path.join(_os.path.dirname(_os.path.abspath(__file__)), "pk_chain_dyn.py")
_spec = _util.spec_from_file_location("pk_chain_dyn_experimental", _path)
_twin = _util.module_from_spec(_spec)
_spec.loader.exec_module(_twin)

_twin.PLUGIN = "pk_dynamics2"
_twin.NODE = "pk_chainDynamics2"

globals().update({k: v for k, v in vars(_twin).items()
                  if not (k.startswith("__") and k.endswith("__"))})

TYPES = {"plane": 0, "sphere": 1, "capsule": 2}
KINDS = dict((v, k) for k, v in TYPES.items())

# цвет каркаса, чтобы коллайдер не путался с контролами - один на все формы
COLOR = 14

# плоскость сеткой, а не одним квадратом - по ней видно, куда она наклонена;
# у капсулы шапки в четыре доли, иначе они читаются гранёными
SUBDIV = {"polyPlane": (("subdivisionsWidth", 5), ("subdivisionsHeight", 5)),
          "polyCylinder": (("subdivisionsCaps", 4),),
          "polySphere": ()}


def _shape(loc, kind):
    """Форма коллайдера - примитив под самим коллайдером, а размеры приходят
    связями в его construction history.

    Примитивы выбраны так, чтобы картинка была ровно тем, что считает солвер, а
    не похожим на него: polySphere radius это тот же радиус, а polyCylinder с
    круглыми шапками это и есть капсула - отрезок длиной height, обтянутый
    радиусом, и в габарит он даёт length + 2 * radius. Проверено замером.

    Рисуются они каркасом (overrideShading 0): сквозь коллайдер видно цепочку,
    ради которой он и стоит. Хочется плотный - выключить оверрайд на шейпе. И
    не рендерятся: это оснастка, а не геометрия."""
    if kind == "plane":
        made = cmds.polyPlane(w=1.0, h=1.0, sx=5, sy=5, ax=(0, 1, 0), ch=True)
        cmds.connectAttr(loc + ".size", made[1] + ".width")
        cmds.connectAttr(loc + ".size", made[1] + ".height")
    elif kind == "sphere":
        made = cmds.polySphere(r=1.0, sx=16, sy=10, ch=True)
        cmds.connectAttr(loc + ".radius", made[1] + ".radius")
    else:
        made = cmds.polyCylinder(r=1.0, h=1.0, sx=16, sy=1, sz=4, rcp=True,
                                 ax=(0, 1, 0), ch=True)
        cmds.connectAttr(loc + ".radius", made[1] + ".radius")
        cmds.connectAttr(loc + ".length", made[1] + ".height")

    shape = cmds.listRelatives(made[0], s=True, f=True)[0]
    shape = cmds.parent(shape, loc, r=True, s=True)[0]
    cmds.delete(made[0])
    shape = cmds.rename(shape, loc + "Shape")

    _look(shape)
    return shape


def _look(shape):
    """Вид коллайдера: зелёный каркас, в рендер не идёт, доли примитива такие,
    по которым форму видно. Отдельно от сборки, чтобы тем же кодом привести к
    этому виду и те коллайдеры, что стоят в сцене с прошлых версий."""
    cmds.setAttr(shape + ".overrideEnabled", 1)
    cmds.setAttr(shape + ".overrideShading", 0)
    cmds.setAttr(shape + ".overrideColor", COLOR)
    for a in ("castsShadows", "receiveShadows", "primaryVisibility",
              "visibleInReflections", "visibleInRefractions"):
        cmds.setAttr(shape + "." + a, 0)

    for made in cmds.listConnections(shape + ".inMesh", s=True, d=False) or []:
        for attr, value in SUBDIV.get(cmds.nodeType(made), ()):
            if cmds.attributeQuery(attr, node=made, exists=True):
                cmds.setAttr(made + "." + attr, value)
    return shape


def _attrs(loc, kind, size, length):
    """Размеры живут на самом коллайдере: их видно в канал боксе, они же идут
    в ноду и они же задают форму."""
    if kind == "plane":
        if not cmds.attributeQuery("size", node=loc, exists=True):
            cmds.addAttr(loc, ln="size", at="double", min=0.01, dv=float(size), k=True)
        return

    if not cmds.attributeQuery("radius", node=loc, exists=True):
        cmds.addAttr(loc, ln="radius", at="double", min=0.0, dv=float(size), k=True)
    if kind == "capsule" and not cmds.attributeQuery("length", node=loc, exists=True):
        cmds.addAttr(loc, ln="length", at="double", min=0.0, dv=float(length), k=True)


def _hasShape(loc):
    return bool(cmds.listRelatives(loc, ad=True, type="mesh") or
                cmds.listRelatives(loc, ad=True, type="nurbsCurve") or [])


def collider(name="chain", kind="plane", size=1.0, length=4.0, at=None):
    """Коллайдер цепочке - трансформ с формой, чей worldMatrix идёт в очередной
    элемент collider.

    Плоскость смотрит своим Y и считается бесконечной, квадрат нарисован только
    чтобы её было видно; sphere берёт radius, capsule ещё и length по своему Y.
    Размеры стоят атрибутами на самом коллайдере: они же идут в ноду, они же
    задают форму - картинка и расчёт это одно число. Масштаб коллайдера солвер
    читает из матрицы, поэтому увеличенный трансформ это и правда больший
    коллайдер, а не только большая картинка."""
    if kind not in TYPES:
        cmds.error("collider: kind is one of %s" % ", ".join(sorted(TYPES)))

    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    used = cmds.getAttr(node + ".collider", mi=True) or []
    i = (max(used) + 1) if used else 0

    loc = cmds.createNode("transform", n="%s_%s_%d_collider" % (name, kind, i + 1))
    if at:
        cmds.xform(loc, ws=True, t=at)
    if kind == "plane" and size <= 1.0:
        size = 10.0                      # пол размером в пол, а не в кулак

    _attrs(loc, kind, size, length)
    _shape(loc, kind)

    top = _names(name)["top"]
    if cmds.objExists(top):
        cmds.parent(loc, top)

    cmds.connectAttr(loc + ".worldMatrix[0]", "%s.collider[%d].colliderMatrix" % (node, i))
    cmds.setAttr("%s.collider[%d].colliderType" % (node, i), TYPES[kind])
    if kind == "plane":
        cmds.setAttr("%s.collider[%d].colliderRadius" % (node, i), 0.0)
    else:
        cmds.connectAttr(loc + ".radius", "%s.collider[%d].colliderRadius" % (node, i))
        if kind == "capsule":
            cmds.connectAttr(loc + ".length", "%s.collider[%d].colliderLength" % (node, i))

    if cmds.getAttr(node + ".collide") <= 0.0:
        cmds.setAttr(node + ".collide", 1.0)

    cmds.select(loc)
    print("pk_chainDynamics2: %s collider[%d] = %s" % (kind, i, loc))
    return loc


def reshape(name="chain"):
    """Дать форму коллайдерам, собранным прежней версией - они были локаторами.
    Размеры снимаются с ноды и переезжают на сам коллайдер.

    У кого форма уже есть, тому обновляется вид - цвет и доли примитива, если
    они с тех пор менялись. Ничего не пересобирается, так что звать можно
    сколько угодно."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    done = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        plug = "%s.collider[%d]" % (node, i)
        src = cmds.listConnections(plug + ".colliderMatrix", s=True, d=False) or []
        if not src:
            continue

        loc = src[0]
        if _hasShape(loc):
            # форма есть - просто привести к нынешнему виду
            for shape in cmds.listRelatives(loc, ad=True, type="mesh", f=True) or []:
                _look(shape)
            continue

        kind = KINDS.get(cmds.getAttr(plug + ".colliderType"), "plane")
        size = cmds.getAttr(plug + ".colliderRadius")
        length = cmds.getAttr(plug + ".colliderLength")

        for shape in cmds.listRelatives(loc, s=True, type="locator") or []:
            cmds.delete(shape)

        _attrs(loc, kind, size if size > 0.0 else 10.0, length if length > 0.0 else 4.0)
        _shape(loc, kind)

        if kind != "plane":
            cmds.connectAttr(loc + ".radius", plug + ".colliderRadius", f=True)
            if kind == "capsule":
                cmds.connectAttr(loc + ".length", plug + ".colliderLength", f=True)

        done.append(loc)

    print("pk_chainDynamics2: %d colliders got a shape, the rest brought up to date%s"
          % (len(done), (": " + ", ".join(done)) if done else ""))
    return done
