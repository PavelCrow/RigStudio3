# Move a pinned transform (locator) from one uvPin to another, keeping it where it is.
#
# The transform takes uvPin.outputMatrix[i] into offsetParentMatrix (Maya's UV Pin constraint and
# correctiveControl pin it this way). Select the transform(s), then the target uvPin - or the target
# mesh / NURBS surface if exactly one uvPin reads it - and call run().
#
# For each transform:
#   - new coordinate index on the target pin at the closest point of its current (deformed) surface;
#   - outputMatrix[new] -> offsetParentMatrix instead of the old pin;
#   - translate/rotate are recomputed so the world matrix does not change (the leftover offset from
#     the surface and the difference in pin frames go into them); scale is never touched, locked or
#     connected channels are kept as they are - with a warning if they would need another value
#     (e.g. a mirrored pin frame asks for a negative scale);
#   - the old coordinate index is removed if nothing else uses it.
# A transform that is not pinned yet is simply pinned to the target.

import maya.cmds as cmds
import maya.api.OpenMaya as om

GEO_TYPES = ("mesh", "nurbsSurface")


def _pinOf(node):
    if cmds.nodeType(node) == "uvPin":
        return node
    shapes = set(cmds.ls(node, long=True) if cmds.nodeType(node) in GEO_TYPES else
                 cmds.listRelatives(node, shapes=True, noIntermediate=True, fullPath=True) or [])
    # the pin may read the shape itself or a deformer output in front of it
    pins = [p for p in cmds.ls(type="uvPin") if cmds.listConnections(p + ".deformedGeometry", s=True, d=False)
            and _pinShape(p) in shapes]
    if len(pins) != 1:
        raise RuntimeError("%s: expected one uvPin reading it, found %d" % (node, len(pins)))
    return pins[0]


def _pinShape(pin):
    """Visible shape the pin rides (deformedGeometry may come from a deformer, not from the shape)."""
    src = cmds.listConnections(pin + ".deformedGeometry", s=True, d=False, shapes=True)
    if not src:
        raise RuntimeError("%s.deformedGeometry is not connected" % pin)
    src = src[0]
    if cmds.nodeType(src) in GEO_TYPES:
        return cmds.ls(src, long=True)[0]
    shapes = cmds.ls(cmds.listHistory(src, future=True) or [], type=GEO_TYPES, long=True)
    shapes = [s for s in shapes if not cmds.getAttr(s + ".intermediateObject")]
    if not shapes:
        raise RuntimeError("%s: no shape found downstream of %s" % (pin, src))
    return shapes[0]


def _pinToWorld(pin, path):
    """Matrix from the pin's output space to world.

    Measured: output = frame in geometry data space * inverse(M), M by relativeSpaceMode:
    World - identity, Local - the mesh world matrix when the pin reads worldMesh/worldSpace
    (identity for object-space data), Custom - relativeSpaceMatrix. Data from outMesh / a deformer
    is in the shape's object space."""
    src = cmds.listConnections(pin + ".deformedGeometry", s=True, d=False, plugs=True)[0]
    worldData = src.split(".")[-1].startswith(("worldMesh", "worldSpace"))
    shapeWorld = path.inclusiveMatrix()
    mode = cmds.getAttr(pin + ".relativeSpaceMode")
    if mode == 2:
        m = om.MMatrix(cmds.getAttr(pin + ".relativeSpaceMatrix"))
    elif mode == 1 and worldData:
        m = shapeWorld
    else:
        m = om.MMatrix()
    return m if worldData else m * shapeWorld


def _closestUV(pin, point):
    """Pin coordinate (u, v) of the surface point closest to a point in the pin's output space."""
    shape = _pinShape(pin)
    sl = om.MSelectionList()
    sl.add(shape)
    path = sl.getDagPath(0)
    point = point * _pinToWorld(pin, path)
    if cmds.nodeType(shape) == "mesh":
        fn = om.MFnMesh(path)
        closest = fn.getClosestPoint(point, om.MSpace.kWorld)[0]
        uvSet = cmds.getAttr(pin + ".uvSetName") or fn.currentUVSetName()
        return fn.getUVAtPoint(closest, om.MSpace.kWorld, uvSet)[:2]
    fn = om.MFnNurbsSurface(path)
    u, v = fn.closestPoint(point, space=om.MSpace.kWorld)[1:3]
    if cmds.getAttr(pin + ".normalizedIsoParms"):
        u0, u1 = fn.knotDomainInU
        v0, v1 = fn.knotDomainInV
        u = (u - u0) / (u1 - u0)
        v = (v - v0) / (v1 - v0)
    return u, v


def _freeIndex(pin):
    return max(cmds.getAttr(pin + ".coordinate", multiIndices=True) or [-1]) + 1


def _releaseIndex(pin, idx):
    out = "%s.outputMatrix[%d]" % (pin, idx)
    coord = "%s.coordinate[%d]" % (pin, idx)
    if cmds.listConnections(out, s=False, d=True) or cmds.listConnections(coord, s=True, d=False):
        return
    cmds.removeMultiInstance(coord, b=True)
    cmds.removeMultiInstance(out, b=True)


def _isFree(node, attr, axis):
    for plug in (attr, attr + axis):
        full = node + "." + plug
        if cmds.getAttr(full, lock=True) or cmds.listConnections(full, s=True, d=False):
            return False
    return True


def _setLocal(node, local):
    """Put a local matrix into translate/rotate (zero pivots / rotateAxis assumed). Scale is never
    touched, locked or connected channels are left alone; returns those that needed another value."""
    tm = om.MTransformationMatrix(local)
    rot = tm.rotation().reorder(cmds.getAttr(node + ".rotateOrder"))
    values = {"translate": tm.translation(om.MSpace.kTransform),
              "rotate": [om.MAngle(a).asUnits(om.MAngle.uiUnit()) for a in (rot.x, rot.y, rot.z)],
              "scale": tm.scale(om.MSpace.kTransform)}
    skipped = []
    for attr, vals in values.items():
        for axis, val in zip("XYZ", vals):
            plug = node + "." + attr + axis
            if attr != "scale" and _isFree(node, attr, axis):
                cmds.setAttr(plug, val)
            elif abs(cmds.getAttr(plug) - val) > 1e-4:
                skipped.append("%s%s (needs %.4f)" % (attr, axis, val))
    return skipped


def repin(node, target):
    """Move node from its current uvPin to target (uvPin or geometry), keeping its world matrix."""
    pin = _pinOf(target)
    opm = node + ".offsetParentMatrix"

    old = cmds.listConnections(opm, s=True, d=False, plugs=True) or []
    oldPin = oldIdx = None
    if old:
        oldPin, attr = old[0].split(".", 1)
        if cmds.nodeType(oldPin) != "uvPin":
            raise RuntimeError("%s is driven by %s, not by a uvPin" % (opm, old[0]))
        oldIdx = int(attr[attr.index("[") + 1:-1])
        if oldPin == pin:
            print("%s is already on %s" % (node, pin))
            return

    world = cmds.xform(node, q=True, worldSpace=True, matrix=True)
    # the pin output is multiplied by the parent, so look for the point in the pin's output space
    # (parentInverseMatrix already includes offsetParentMatrix - take the parent itself)
    point = om.MPoint(world[12:15])
    parent = cmds.listRelatives(node, parent=True, fullPath=True)
    if parent and cmds.getAttr(node + ".inheritsTransform"):
        point *= om.MMatrix(cmds.getAttr(parent[0] + ".worldInverseMatrix[0]"))
    u, v = _closestUV(pin, point)
    idx = _freeIndex(pin)
    cmds.setAttr("%s.coordinate[%d].coordinateU" % (pin, idx), u)
    cmds.setAttr("%s.coordinate[%d].coordinateV" % (pin, idx), v)

    cmds.connectAttr("%s.outputMatrix[%d]" % (pin, idx), opm, force=True)
    base = om.MMatrix(cmds.getAttr("%s.outputMatrix[%d]" % (pin, idx)))
    if parent and cmds.getAttr(node + ".inheritsTransform"):
        base *= om.MMatrix(cmds.getAttr(parent[0] + ".worldMatrix[0]"))
    skipped = _setLocal(node, om.MMatrix(world) * base.inverse())

    if oldPin:
        _releaseIndex(oldPin, oldIdx)
    print("%s: %s -> %s.coordinate[%d] (u %.4f, v %.4f)" % (
        node, "%s[%d]" % (oldPin, oldIdx) if oldPin else "free", pin, idx, u, v))
    now = cmds.xform(node, q=True, worldSpace=True, matrix=True)
    drift = max(abs(a - b) for a, b in zip(world, now))
    if skipped or drift > 1e-4:
        cmds.warning("%s: world matrix changed by %.4f; kept channels (scale / locked / connected): %s" % (
            node, drift, ", ".join(skipped) or "-"))


def run():
    sel = cmds.ls(sl=True)
    if len(sel) < 2:
        raise RuntimeError("Select pinned transform(s), then the target uvPin or its geometry")
    for node in sel[:-1]:
        repin(node, sel[-1])
    cmds.select(sel[:-1])
