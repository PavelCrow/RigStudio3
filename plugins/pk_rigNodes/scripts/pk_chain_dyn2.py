# -*- coding: utf-8 -*-
"""Тот же сборщик цепочек, но на ноде pk_chainDynamics2 из плагина
pk_dynamics2 - там пробуется коллизия, а рабочий pk_dynamics не трогается.

    import pk_chain_dyn2 as dyn2
    dyn2.build("test", count=4, joints=10)
    dyn2.collider("test", "plane")        - пол под цепочкой
    dyn2.collider("test", "sphere", size=2.0)

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


def collider(name="chain", kind="plane", size=1.0, length=4.0, at=None):
    """Коллайдер цепочке: локатор, чей worldMatrix идёт в очередной элемент
    collider. Плоскость смотрит своим Y, сфера и капсула берут size радиусом,
    капсула вытягивается по своему Y на length. at - куда поставить."""
    if kind not in TYPES:
        cmds.error("collider: kind is one of %s" % ", ".join(sorted(TYPES)))

    node = _names(name)["node"]
    if not cmds.objExists(node):
        cmds.error("%s not found" % node)

    used = cmds.getAttr(node + ".collider", mi=True) or []
    i = (max(used) + 1) if used else 0

    loc = cmds.spaceLocator(n="%s_%s_%d_collider" % (name, kind, i + 1))[0]
    if at:
        cmds.xform(loc, ws=True, t=at)
    top = _names(name)["top"]
    if cmds.objExists(top):
        cmds.parent(loc, top)

    cmds.connectAttr(loc + ".worldMatrix[0]", "%s.collider[%d].colliderMatrix" % (node, i))
    cmds.setAttr("%s.collider[%d].colliderType" % (node, i), TYPES[kind])
    cmds.setAttr("%s.collider[%d].colliderRadius" % (node, i), float(size))
    cmds.setAttr("%s.collider[%d].colliderLength" % (node, i), float(length))

    if cmds.getAttr(node + ".collide") <= 0.0:
        cmds.setAttr(node + ".collide", 1.0)

    cmds.select(loc)
    print("pk_chainDynamics2: %s collider[%d] = %s" % (kind, i, loc))
    return loc
