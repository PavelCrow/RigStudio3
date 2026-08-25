# Snapping the posers onto the MetaHuman bones.
#
# Order matters and is not negotiable, and it is not the hierarchy's:
# the ends of a chain are placed before its middle. The elbow follows
# the hand and the knee follows the foot, because the limb's end poser
# is point-constrained to the child module's root and has to be
# standing where it belongs before the middle can be judged against it.
# bones.PLACE_ORDER holds that order; hierarchy depth only breaks ties.
#
# Only the left side and the centre are placed. The right side is driven
# from the left by the rig's own mirroring - sometimes straight off the
# opposite poser, sometimes through a decomposeMatrix - so it arrives on
# its own and must not be forced.
#
# Position only, by default. The modules work out their own orientation
# from where the posers sit relative to each other, so a rotation is
# applied only where the map asks for one - the clavicle and the hands,
# where three points do not imply the roll.
#
# A channel that cannot be written is not a reason to skip a poser. The
# modules lock some on purpose - a finger poser may not leave its plane,
# a foot poser may not leave its line - and drive others, like the toe
# tip's height, which follows the toe. Those channels are left alone and
# the free ones are still written, which puts the poser as close to the
# bone as the module allows. That is the most that can be asked of it.

import math

import maya.cmds as cmds
import maya.api.OpenMaya as om

from rigStudio3 import utils
from rigStudio3.metahuman import bones, guess, scene


def _boneNode(bone, namespace):  #
    """Bone name from the map -> the actual joint in the scene."""
    for candidate in (namespace + bone, bone):
        if candidate and cmds.objExists(candidate):
            found = cmds.ls(candidate, type="joint", long=True)
            if found:
                return found[0]

    return ""


def _extended(refs):  #
    """Carry on past two posers: the second, plus the step between them.

    The finger tips. Measured from the posers rather than from the bones
    because by this point the posers have already been placed, and they
    sit where the module allows - in the plane it keeps the finger in.
    A tip derived from the bones would sit off that plane and the module
    would not follow it there.
    """
    first = cmds.xform(refs[0], q=True, ws=True, t=True)
    second = cmds.xform(refs[1], q=True, ws=True, t=True)

    return [second[i] + (second[i] - first[i]) for i in range(3)]


def _unavailable(poser, attr):  #
    """{axis: what is holding it} for channels that cannot be written.

    Locked and driven are the same thing here - both mean the module has
    already decided that channel - so they are collected together and
    the rest of the poser is placed regardless.
    """
    out = {}
    for axis in "XYZ":
        plug = "%s.%s%s" % (poser, attr, axis)
        if not cmds.objExists(plug):
            continue

        if cmds.getAttr(plug, lock=True):
            out[axis] = "locked"
            continue

        source = cmds.listConnections(plug, source=True, destination=False,
                                      plugs=True)
        if source:
            node = source[0].split(".")[0]
            out[axis] = "%s (%s)" % (node, cmds.objectType(node))

    return out


def _describe(poser, attr, held):  #
    channels = ", ".join(attr + axis for axis in "XYZ" if axis in held)

    sources = []
    for axis in "XYZ":
        if axis in held and held[axis] not in sources:
            sources.append(held[axis])

    return "%s: %s <- %s" % (poser, channels, ", ".join(sources))


def _note(attr, held):  #
    if not held:
        return ""

    return " (%s held)" % ", ".join(attr + axis for axis in "XYZ"
                                    if axis in held)


def _setWorldPosition(poser, pos, held):  #
    """Set the world position, writing only the channels that are free."""
    if not held:
        cmds.xform(poser, ws=True, t=pos)
        return

    # translate is expressed in the space of offsetParentMatrix times the
    # parent's world matrix, so that is what has to be undone to turn a
    # world position back into the numbers that go in the channels
    space = (om.MMatrix(cmds.getAttr(poser + ".offsetParentMatrix")) *
             om.MMatrix(cmds.getAttr(poser + ".parentMatrix[0]")))
    local = om.MPoint(pos[0], pos[1], pos[2]) * space.inverse()

    for i, axis in enumerate("XYZ"):
        if axis not in held:
            cmds.setAttr("%s.translate%s" % (poser, axis), local[i])


def _groundAxis(matrix, row):  #
    """One axis of a world matrix, flattened onto the ground plane."""
    v = om.MVector(matrix[row * 4], 0.0, matrix[row * 4 + 2])
    if v.length() < 1e-6:
        return None

    return v.normal()


def _aimGround(poser, boneNode):  #
    """Turn the poser around Y until its Z axis points along the foot.

    The bone's Y axis flattened onto the ground is the way the foot
    points; the poser's own Z is what has to end up there. Done as a
    relative turn about world Y rather than by writing a rotation, so
    whatever the poser was already carrying on its other axes survives.
    """
    target = _groundAxis(cmds.getAttr(boneNode + ".worldMatrix[0]"), 1)
    current = _groundAxis(cmds.getAttr(poser + ".worldMatrix[0]"), 2)
    if target is None or current is None:
        return 0.0

    angle = math.degrees(math.atan2((current ^ target).y, current * target))
    cmds.rotate(0, angle, 0, poser, relative=True, worldSpace=True)

    return angle


def _place(entries, namespace, dryRun, only=None):  #
    """The placement itself. run() wraps it; this only does the work.

    only=[names] narrows it to those posers, for checking the map one
    entry at a time. Everything else is passed over silently rather
    than reported as skipped - it was never asked for.
    """
    moved, skipped, missing, driven, mirrored = [], [], [], [], []

    # The map carries the order, and it is not the hierarchy's: the ends
    # of a chain go before its middle, because the middle posers are
    # judged against ends that have to be standing in place already.
    # Hierarchy order breaks the tie for anything the map does not rank.
    order = []
    unranked = 0
    for depth, poserPath in enumerate(scene.posers()):
        poser = scene.short(poserPath)
        entry = entries.get(poser) or {}
        if "order" not in entry and (entry.get("bone") or entry.get("local")
                                     or entry.get("extend")):
            unranked += 1
        order.append((entry.get("order", bones.UNRANKED), depth, poser))
    order.sort()

    # A map written before the order existed would silently fall back to
    # hierarchy order, which places the middle of a chain before its
    # ends and puts the whole rig subtly wrong. Worth saying out loud
    # rather than leaving someone to wonder why the result differs from
    # placing the same posers by hand.
    if unranked:
        cmds.warning("metahuman: %s posers in this map carry no placement "
                     "order - it was written by an older version. Run "
                     "guessMap() again before placing." % unranked)

    for _, _, poser in order:
        if only is not None and poser not in only:
            continue

        # The right side is the rig's business, not ours: placing the
        # left one carries it, whether the mirror runs straight off the
        # opposite poser or through a decomposeMatrix.
        if utils.objectIsOpposite(poser):
            mirrored.append(poser)
            continue

        entry = entries.get(poser)
        local = entry.get("local") if entry else None
        extend = entry.get("extend") if entry else None
        if not entry or not (entry.get("bone") or local or extend):
            skipped.append(poser)
            continue

        bone = entry.get("bone", "")
        boneNode = ""
        if bone:
            boneNode = _boneNode(bone, namespace)
            if not boneNode:
                missing.append("%s -> %s" % (poser, bone))
                continue

        absent = [ref for ref in (extend or []) if not cmds.objExists(ref)]
        if absent:
            missing.append("%s -> extend from %s" % (poser, ", ".join(absent)))
            continue

        heldT = _unavailable(poser, "translate")
        if len(heldT) == 3:
            driven.append(_describe(poser, "translate", heldT))
            continue

        pos = None
        if boneNode:
            pos = cmds.xform(boneNode, q=True, ws=True, t=True)
        elif extend:
            pos = _extended(extend)

        if pos is not None and entry.get("ground"):
            pos = [pos[0], 0.0, pos[2]]

        note = _note("translate", heldT)
        if extend:
            note += " +extend(%s)" % " -> ".join(extend)
        if entry.get("ground"):
            note += " +ground"
        if local:
            note += " +local(%s)" % ", ".join(
                "%s=%s" % (a, local[a]) for a in sorted(local)
                if a not in heldT)

        # Two ways to orient: take the bone's rotation, or line the poser
        # up with the world. They are alternatives, not a sequence.
        toBone = entry.get("match", "t") == "tr"
        toWorld = bool(entry.get("worldOrient"))
        turn = entry.get("turn")
        heldR = (_unavailable(poser, "rotate")
                 if (toBone or toWorld or turn) else {})
        if toBone or toWorld:
            what = " +rotation" if toBone else " +world orientation"
            note += (what if not heldR
                     else _note("rotate", heldR) + ", not oriented")
        if turn and not heldR:
            note += " +turn(%s)" % ", ".join(str(v) for v in turn)

        aim = entry.get("aimGround")
        aimNode = _boneNode(aim, namespace) if aim else ""

        if not dryRun:
            if pos is not None:
                _setWorldPosition(poser, pos, heldT)

            for axis in sorted(local or {}):
                if axis not in heldT:
                    cmds.setAttr("%s.translate%s" % (poser, axis),
                                 local[axis])

            if not heldR:
                if toBone:
                    cmds.xform(poser, ws=True, ro=cmds.xform(
                        boneNode, q=True, ws=True, ro=True))
                elif toWorld:
                    cmds.xform(poser, ws=True, ro=(0, 0, 0))

                if aimNode:
                    note += " +aimed %.1f deg" % _aimGround(poser, aimNode)

                # Last, and deliberately so: a turn is a correction on
                # top of whatever the orienting and the aiming settled
                # on. Applied any earlier, aiming would wipe it out -
                # it points the Z axis wherever it likes regardless of
                # where the poser was already facing.
                if turn:
                    cmds.rotate(turn[0], turn[1], turn[2], poser,
                                relative=True, objectSpace=True)

            # Settle the scene before moving on. Every poser after this
            # one is placed against world matrices that this one has
            # just changed - its own parentMatrix, the positions a tip
            # is extended from, the axis the foot aims along - and those
            # travel through offsetParentMatrix chains and constraints
            # that do not catch up on their own inside a tight loop.
            # Running the placements by hand one at a time works only
            # because Maya settles between commands; this is that pause,
            # made deliberate.
            cmds.refresh()

        elif aim:
            note += " +aim(%s)" % (aim if aimNode else aim + " NOT FOUND")

        moved.append("%s -> %s%s" % (poser, bone or "(no bone)", note))

    return {"placed": moved, "skipped": skipped, "missing": missing,
            "driven": driven, "mirrored": mirrored}


def _report(result, dryRun):  #
    print("\n--- metahuman: %s ---" % ("dry run" if dryRun else "posers placed"))
    print("placed:  %s" % len(result["placed"]))
    for line in result["placed"]:
        print("    " + line)

    if result["mirrored"]:
        print("mirrored, carried by the left side (%s)"
              % len(result["mirrored"]))
    if result["skipped"]:
        print("not moved by the map (%s)" % len(result["skipped"]))
    if result["missing"]:
        print("bone not in the scene (%s):" % len(result["missing"]))
        for line in result["missing"]:
            print("    " + line)
    if result["driven"]:
        print("every channel held, nothing to do (%s):" % len(result["driven"]))
        for line in result["driven"]:
            print("    " + line)
    print("---\n")


def run(name="metahuman", dryRun=False, skeletonRoot=None, only=None):  #
    """Place every mapped poser on its bone.

        from rigStudio3 import metahuman
        metahuman.placePosers(dryRun=True)   # just say what would happen
        metahuman.placePosers()              # do it

    A real run is one undo step: forty-odd posers is not something
    anyone wants to walk back one at a time.
    """
    data = guess.load(name) if isinstance(name, str) else name
    if not data:
        return {}

    # Looked up in the scene, not taken from the map: a new character is
    # a new reference under a new prefix, and that is the only thing
    # about it the map cannot be reused across.
    namespace = scene.resolveNamespace(data, skeletonRoot)
    if not namespace:
        # resolveNamespace has already said what went wrong; carrying on
        # would only look for bones that are not there
        print("metahuman: nothing placed")
        return {}

    if namespace != data.get("namespace", ""):
        print("metahuman: bones found under '%s', the map was written "
              "against '%s'" % (namespace or "(no namespace)",
                                data.get("namespace") or "(no namespace)"))

    entries = data.get("posers", {})

    # The map is derived from the rules in bones.py; if those have moved
    # on since it was written, it is describing something that no longer
    # exists. Cheaper to say so than to leave someone comparing a bad
    # result against a table that has already been corrected.
    if data.get("rules") != bones.fingerprint():
        cmds.warning("metahuman: this map was written against different "
                     "rules - run guessMap() again before placing")

    if dryRun:
        result = _place(entries, namespace, True, only)
    else:
        # try/finally rather than utils.oneStepUndo, which drops the
        # return value and would leave the chunk open if this raised
        cmds.undoInfo(openChunk=True, chunkName="metahuman: place posers")
        try:
            result = _place(entries, namespace, False, only)
        finally:
            cmds.undoInfo(closeChunk=True)

    _report(result, dryRun)

    return result


def one(poser, name="metahuman", dryRun=False):  #
    """Place a single poser, by name.

        metahuman.placePoser("l_clav_mainPoser")

    For working through the map one entry at a time. Keep to the order
    run() uses - parents before children - or a parent placed later will
    drag an already-checked child off its bone.
    """
    return run(name, dryRun=dryRun, only=[poser])
