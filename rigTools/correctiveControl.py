# Corrective controls on a skinned mesh.
#
# Select vertices/faces/edges of a skinned mesh and call create(). For the selected spot:
#   - one uvPin per mesh (<mesh>_corrective_uvPin), a new coordinate index per control;
#   - <name>_static_grp > <name>_static_ctrl > <name>_joint - static, at the rest position of the spot;
#   - <name>_pin_grp > <name>_pin_offset > <name>_ctrl - rides the uvPin. ctrl TRS drives static_ctrl
#     directly; pin_offset gets -translate/-rotate (and 1/scale) through multiplyDivide so the ctrl stays
#     on the surface while the corrective moves it;
#   - <mesh>_correctiveMesh - rest-pose copy of the mesh, skinned to statik_joint (all weights) and the
#     corrective joints (zero weights), plugged into <mesh>_corrective_blendShape on the original mesh
#     in front of the skinCluster.

import re

import maya.cmds as cmds
import maya.api.OpenMaya as om

ROOT_GRP = "correctives_grp"
STATIC_JOINT = "statik_joint"


def _shortName(node):
    return node.split("|")[-1].split(":")[-1]


def _meshShape(obj):
    if cmds.nodeType(obj) == "mesh":
        obj = cmds.listRelatives(obj, parent=True, fullPath=True)[0]
    shapes = cmds.listRelatives(obj, shapes=True, noIntermediate=True, type="mesh", fullPath=True)
    if not shapes:
        raise RuntimeError("%s has no mesh shape" % obj)
    return shapes[0]


def _origShape(shape):
    # input shape of the deformer chain
    try:
        plug = cmds.deformableShape(shape, originalGeometry=True)
        if plug and plug[0]:
            return cmds.ls(plug[0].split(".")[0], long=True)[0]
    except RuntimeError:
        pass
    raise RuntimeError("%s is not deformed - no Orig shape found" % shape)


def _selection():
    comps = cmds.filterExpand(cmds.ls(sl=True), selectionMask=(31, 32, 34), expand=True) or []
    if not comps:
        raise RuntimeError("Select vertices, edges or faces of a skinned mesh")
    objs = set(cmds.ls(cmds.ls(comps, objectsOnly=True), long=True))
    shapes = set(_meshShape(o) for o in objs)
    if len(shapes) != 1:
        raise RuntimeError("Select components of one mesh")
    verts = cmds.ls(cmds.polyListComponentConversion(comps, toVertex=True), flatten=True)
    ids = sorted(set(int(re.search(r"\[(\d+)\]$", v).group(1)) for v in verts))
    return shapes.pop(), ids


def _restPoint(orig, ids, uvSet):
    """Closest surface point to the centre of the vertices on the rest shape: (u, v)."""
    sl = om.MSelectionList()
    sl.add(orig)
    fn = om.MFnMesh(sl.getDagPath(0))
    pts = fn.getPoints(om.MSpace.kObject)
    centre = om.MPoint()
    for i in ids:
        centre += om.MVector(pts[i])
    centre = om.MPoint(om.MVector(centre) / len(ids))
    point = fn.getClosestPoint(centre, om.MSpace.kObject)[0]
    u, v = fn.getUVAtPoint(point, om.MSpace.kObject, uvSet)[:2]
    return u, v


def _setPinCoordinate(pin, idx, u, v):
    cmds.setAttr("%s.coordinate[%d].coordinateU" % (pin, idx), u)
    cmds.setAttr("%s.coordinate[%d].coordinateV" % (pin, idx), v)


def _restMatrix(pin, orig, meshTransform, u, v):
    """World matrix the pin gives at (u, v) on the rest shape."""
    tmp = cmds.createNode("uvPin", n="tmp_corrective_uvPin")
    try:
        for attr in ("normalAxis", "tangentAxis", "uvSetName"):
            if cmds.getAttr(pin + "." + attr, type=True) == "string":
                cmds.setAttr(tmp + "." + attr, cmds.getAttr(pin + "." + attr), type="string")
            else:
                cmds.setAttr(tmp + "." + attr, cmds.getAttr(pin + "." + attr))
        cmds.connectAttr(orig + ".outMesh", tmp + ".deformedGeometry")
        cmds.connectAttr(orig + ".outMesh", tmp + ".originalGeometry")
        _setPinCoordinate(tmp, 0, u, v)
        local = om.MMatrix(cmds.getAttr(tmp + ".outputMatrix[0]"))
    finally:
        cmds.delete(tmp)
    return local * om.MMatrix(cmds.getAttr(meshTransform + ".worldMatrix[0]"))


def _rootGroup():
    if not cmds.objExists(ROOT_GRP):
        cmds.createNode("transform", n=ROOT_GRP)
        for a in "trs":
            for ax in "xyz":
                cmds.setAttr("%s.%s%s" % (ROOT_GRP, a, ax), lock=True)
    return ROOT_GRP


def _uvPin(meshName, shape, orig, uvSet):
    pin = meshName + "_corrective_uvPin"
    if not cmds.objExists(pin):
        pin = cmds.createNode("uvPin", n=pin)
        cmds.setAttr(pin + ".uvSetName", uvSet, type="string")
        cmds.connectAttr(shape + ".worldMesh[0]", pin + ".deformedGeometry")
        cmds.connectAttr(orig + ".outMesh", pin + ".originalGeometry")
    return pin


def _correctiveMesh(meshName, meshTransform, orig):
    dup = meshName + "_correctiveMesh"
    if cmds.objExists(dup):
        return dup, False
    dup = cmds.createNode("transform", n=dup, p=_rootGroup())
    dupShape = cmds.createNode("mesh", n=dup + "Shape", p=dup)
    cmds.connectAttr(orig + ".outMesh", dupShape + ".inMesh")
    cmds.polyEvaluate(dupShape, vertex=True)  # pull the data before cutting the connection
    cmds.disconnectAttr(orig + ".outMesh", dupShape + ".inMesh")
    cmds.sets(dupShape, edit=True, forceElement="initialShadingGroup")
    cmds.xform(dup, worldSpace=True, matrix=cmds.getAttr(meshTransform + ".worldMatrix[0]"))
    cmds.setAttr(dup + ".visibility", 0)
    return dup, True


def _staticJoint():
    if not cmds.objExists(STATIC_JOINT):
        cmds.createNode("joint", n=STATIC_JOINT, p=_rootGroup())
        cmds.setAttr(STATIC_JOINT + ".visibility", 0)
    return STATIC_JOINT


def _skin(meshName, dup, joint):
    skin = meshName + "_corrective_skinCluster"
    if not cmds.objExists(skin):
        skin = cmds.skinCluster(_staticJoint(), dup, toSelectedBones=True, n=skin)[0]
    cmds.skinCluster(skin, edit=True, addInfluence=joint, weight=0.0)
    return skin


def _blendShape(meshName, dup, meshTransform):
    bs = meshName + "_corrective_blendShape"
    if not cmds.objExists(bs):
        bs = cmds.blendShape(dup, meshTransform, frontOfChain=True, n=bs)[0]
        cmds.setAttr(bs + ".weight[0]", 1.0)
    return bs


def _circle(name, parent, radius, normalAxis):
    normal = [0, 0, 0]
    normal[normalAxis % 3] = 1
    ctrl = cmds.circle(n=name, normal=normal, radius=radius, constructionHistory=False)[0]
    return cmds.parent(ctrl, parent, relative=True)[0]


def _freeName(meshName):
    i = 1
    while cmds.objExists("%s_corrective%d_ctrl" % (meshName, i)):
        i += 1
    return "%s_corrective%d" % (meshName, i)


def create(name=None, radius=None):
    shape, ids = _selection()
    meshTransform = cmds.listRelatives(shape, parent=True, fullPath=True)[0]
    meshName = _shortName(meshTransform)
    orig = _origShape(shape)
    uvSet = cmds.polyUVSet(shape, query=True, currentUVSet=True)[0]
    name = name or _freeName(meshName)
    if radius is None:
        bb = cmds.exactWorldBoundingBox(meshTransform)
        radius = max(bb[3] - bb[0], bb[4] - bb[1], bb[5] - bb[2]) * 0.03

    root = _rootGroup()
    pin = _uvPin(meshName, shape, orig, uvSet)
    idx = max(cmds.getAttr(pin + ".coordinate", multiIndices=True) or [-1]) + 1
    u, v = _restPoint(orig, ids, uvSet)
    _setPinCoordinate(pin, idx, u, v)
    normalAxis = cmds.getAttr(pin + ".normalAxis")

    # static branch
    staticGrp = cmds.createNode("transform", n=name + "_static_grp", p=root)
    cmds.xform(staticGrp, worldSpace=True, matrix=list(_restMatrix(pin, orig, meshTransform, u, v)))
    staticCtrl = _circle(name + "_static_ctrl", staticGrp, radius, normalAxis)
    joint = cmds.createNode("joint", n=name + "_joint", p=staticCtrl)
    cmds.setAttr(joint + ".radius", radius * 0.5)
    cmds.setAttr(staticGrp + ".visibility", 0)

    # pinned branch
    pinGrp = cmds.createNode("transform", n=name + "_pin_grp", p=root)
    cmds.setAttr(pinGrp + ".inheritsTransform", 0)
    cmds.connectAttr("%s.outputMatrix[%d]" % (pin, idx), pinGrp + ".offsetParentMatrix")
    offset = cmds.createNode("transform", n=name + "_pin_offset", p=pinGrp)
    ctrl = _circle(name + "_ctrl", offset, radius, normalAxis)

    for a in "trs":
        cmds.connectAttr("%s.%s" % (ctrl, a), "%s.%s" % (staticCtrl, a))
    for a in "tr":
        md = cmds.createNode("multiplyDivide", n="%s_%sNeg_multiplyDivide" % (name, a))
        cmds.connectAttr("%s.%s" % (ctrl, a), md + ".input1")
        cmds.setAttr(md + ".input2", -1, -1, -1)
        cmds.connectAttr(md + ".output", "%s.%s" % (offset, a))
    md = cmds.createNode("multiplyDivide", n="%s_sInv_multiplyDivide" % name)
    cmds.setAttr(md + ".operation", 2)
    cmds.setAttr(md + ".input1", 1, 1, 1)
    cmds.connectAttr(ctrl + ".s", md + ".input2")
    cmds.connectAttr(md + ".output", offset + ".s")

    # rest copy + skin + blendShape
    dup, isNew = _correctiveMesh(meshName, meshTransform, orig)
    _skin(meshName, dup, joint)
    if isNew:
        _blendShape(meshName, dup, meshTransform)

    cmds.select(ctrl)
    return ctrl


def run():
    try:
        create()
    except RuntimeError as e:
        cmds.warning(str(e))
