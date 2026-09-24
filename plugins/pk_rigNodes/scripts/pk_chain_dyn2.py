# -*- coding: utf-8 -*-
"""Тот же сборщик цепочек, но на ноде pk_chainDynamics2 из плагина
pk_dynamics2 - там пробуется коллизия, а рабочий pk_dynamics не трогается.

    import pk_chain_dyn2 as dyn2
    dyn2.build("test", count=4, joints=10)
    dyn2.collider("test", "plane")        - пол под цепочкой, с формой
    dyn2.collider("test", "sphere", size=2.0)
    dyn2.reshape("test")                  - дать форму коллайдерам-локаторам
    dyn2.addCollider("other", floor)      - тот же коллайдер другой цепочке
    dyn2.shareColliders("test", "a", "b") - все коллайдеры цепочки - остальным
    dyn2.removeCollider("test", floor)    - снять коллайдер с цепочки
    dyn2.clearColliders("test")           - снять все

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


def _free(node):
    """Следующий свободный элемент списка коллайдеров ноды."""
    used = cmds.getAttr(node + ".collider", mi=True) or []
    return (max(used) + 1) if used else 0


def kindOf(obj):
    """Какой это коллайдер - по той цепочке, где он уже стоит."""
    for plug in cmds.listConnections(obj + ".worldMatrix[0]", p=True,
                                     s=False, d=True) or []:
        if plug.endswith(".colliderMatrix"):
            return KINDS.get(cmds.getAttr(plug.replace(".colliderMatrix",
                                                       ".colliderType")))
    return None


def addCollider(name, obj, kind=None):
    """Тот же коллайдер ещё одной цепочке.

    Список коллайдеров живёт на ноде, то есть у каждой цепочки свой. Сам
    коллайдер при этом один: его worldMatrix уходит во все цепочки, которые
    должны о него биться. Пол так и делается - одна плоскость на весь риг, а не
    по своей на каждый хвост."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)
    if not cmds.objExists(obj):
        cmds.error("%s not found" % obj)

    for plug in cmds.listConnections(obj + ".worldMatrix[0]", p=True,
                                     s=False, d=True) or []:
        if plug.startswith(node + "."):
            print("pk_chainDynamics2: %s is already on %s" % (obj, node))
            return plug.split("[")[1].split("]")[0]

    kind = kind or kindOf(obj)
    if kind not in TYPES:
        cmds.error("addCollider: %s is on no chain yet - say which kind it is" % obj)

    i = _free(node)
    plug = "%s.collider[%d]" % (node, i)
    cmds.connectAttr(obj + ".worldMatrix[0]", plug + ".colliderMatrix")
    cmds.setAttr(plug + ".colliderType", TYPES[kind])

    # размеры берутся с самого коллайдера, поэтому у всех цепочек они те же
    if cmds.attributeQuery("radius", node=obj, exists=True):
        cmds.connectAttr(obj + ".radius", plug + ".colliderRadius", f=True)
    if kind == "capsule" and cmds.attributeQuery("length", node=obj, exists=True):
        cmds.connectAttr(obj + ".length", plug + ".colliderLength", f=True)

    if cmds.getAttr(node + ".collide") <= 0.0:
        cmds.setAttr(node + ".collide", 1.0)

    print("pk_chainDynamics2: %s (%s) added to %s as collider[%d]"
          % (obj, kind, node, i))
    return i


def shareColliders(source, *names):
    """Все коллайдеры одной цепочки - остальным названным. Удобно, когда риг
    собран и надо, чтобы весь он знал про пол и про голову."""
    node = _names(source)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    objs = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        src = cmds.listConnections("%s.collider[%d].colliderMatrix" % (node, i),
                                   s=True, d=False) or []
        if src:
            objs.append(src[0])

    for name in names:
        for obj in objs:
            addCollider(name, obj)

    print("pk_chainDynamics2: %d colliders of %s shared with %s"
          % (len(objs), source, ", ".join(names)))
    return objs


def colliders(name="chain"):
    """Коллайдеры цепочки по порядку элементов."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    out = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        src = cmds.listConnections("%s.collider[%d].colliderMatrix" % (node, i),
                                   s=True, d=False) or []
        if src:
            out.append(src[0])
    return out


def removeCollider(name, obj):
    """Снять коллайдер с цепочки. Сам он остаётся в сцене и на других цепочках -
    уходит только элемент списка у этой.

    Удалить коллайдер целиком можно и просто удалив объект: элемент уходит за
    ним следом, у colliderMatrix для этого стоит kDelete. А выключить всю
    коллизию цепочки, ничего не отцепляя, это collide 0."""
    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    gone = []
    for i in cmds.getAttr(node + ".collider", mi=True) or []:
        plug = "%s.collider[%d]" % (node, i)
        src = cmds.listConnections(plug + ".colliderMatrix", s=True, d=False) or []
        if not src or src[0] != obj:
            continue

        for child in ("colliderMatrix", "colliderRadius", "colliderLength"):
            for source in cmds.listConnections(plug + "." + child, p=True,
                                               s=True, d=False) or []:
                cmds.disconnectAttr(source, plug + "." + child)
        # у colliderMatrix стоит kDelete, поэтому элемент обычно уходит сам
        if i in (cmds.getAttr(node + ".collider", mi=True) or []):
            cmds.removeMultiInstance(plug, b=True)
        gone.append(i)

    if not gone:
        cmds.warning("%s: %s is not a collider of this chain" % (name, obj))
    else:
        print("pk_chainDynamics2: %s taken off %s (element %s)"
              % (obj, node, ", ".join(str(i) for i in gone)))
    return gone


def clearColliders(name="chain"):
    """Снять с цепочки все коллайдеры. Сами они остаются в сцене."""
    gone = []
    for obj in colliders(name):
        gone += removeCollider(name, obj)
    print("pk_chainDynamics2: %s has no colliders now, %d taken off"
          % (_names(name)["node"], len(gone)))
    return gone


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
