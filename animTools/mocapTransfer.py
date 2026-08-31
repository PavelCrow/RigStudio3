# Transferring a MetaHuman mocap onto a Rig Studio rig.
#
#     import rigStudio3.animTools.mocapTransfer as mocapTransfer
#     mocapTransfer.window()
#
# Point it at a take, say which rig if the scene holds more than one,
# and press Transfer. What happens, in order:
#
#   1. the take is referenced under its own namespace.
#   2. every limb is switched to FK, which is what the mocap drives.
#   3. the timeline goes to the frame before the take's first key.
#   4. the take's skeleton is stood in the rig's pose.
#   5. the controls are constrained to it, offsets and all.
#   6. the legs go back to IK.
#   7. the animation is baked onto the controls.
#   8. the constraints and the take come back out.
#
# Step 4 is what step 5 depends on. A constraint with maintainOffset
# freezes whatever difference exists at the moment it is made, so the
# two skeletons have to agree at that moment or every frame afterwards
# carries the disagreement.
#
# That posing is done in world space, joint by joint, parents first -
# not by copying the channels. A joint's orientation is jointOrient and
# rotate together; the rig's skeleton carries a jointOrient and the
# mocap's does not, so the same rotate on each means two different
# directions. Asking for a world position and rotation leaves Maya to
# work out the local values that produce them.
#
# Nothing is keyed on the take and nothing is muted. An animation curve
# does not stop a channel being written - that is what makes dragging a
# keyed object work - and the value holds long enough to take the
# constraint offsets from.
#
# This file is self-contained on purpose: it needs Maya and nothing else
# from Rig Studio, so it can be handed to an animator on its own.

import os

import maya.cmds as cmds
import maya.OpenMayaUI as OpenMayaUI

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtCore, QtWidgets
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtCore, QtWidgets
    from shiboken6 import wrapInstance


# The set the rig's own MetaHuman binding lives in. It is the only thing
# in the scene that says which of two identical skeletons belongs to
# this rig, which is why it is looked at rather than the names.
BIND_SET = "metahuman_bindSet"

# Where this tool keeps what it makes, so it can take it all back out.
MOCAP_SET = "metahuman_mocapSet"

OBJECT_NAME = "metahumanMocapWindow"

# Which MetaHuman bone drives which control, keyed by the module type
# and the control's internalName - the rig's own rename-proof name for
# a control, which is its name inside the module with the module's
# prefix taken off: 'l_arm_fk' is 'fk_a', 'l_clav_root' is 'root'.
#
# Keying by both is what separates the collisions: 'fk_a' is the upper
# arm in an arm and the thigh in a leg, 'root' is the clavicle in a
# point module and the head in a head module.
#
# Which bone belongs to which control was measured on a fitted rig, not
# guessed: every one of these sits on its bone to within a thousandth of
# a unit, and the next-nearest bone is an order of magnitude away.
CONTROL_BINDS = {
    "spine": {
        "pelvis": "pelvis",
        "fk_1": "spine_02",
        "fk_2": "spine_03",
        "fk_3": "spine_04",
        "neck": "neck_01",
    },
    "head": {
        "root": "head",
    },
    "point": {
        "root": "clavicle",
    },
    "limb@arm": {
        "fk_a": "upperarm",
        "fk_b": "lowerarm",
        "fk_end": "hand",
        "ik_end": "hand",
        # The pole vector gets a frame of its own, built from the limb's
        # triangle - see _poleRig. 'offset' is where the control sits
        # inside that frame, and it is written down rather than measured
        # because at the rest pose the limb is straight and the frame is
        # degenerate. None means "straight out along X by however far it
        # already stood", which is a starting point to adjust from.
        "ik_aim": {"pole": ["upperarm", "lowerarm", "hand"],
                   "offset": None},
    },
    "limb@leg": {
        "fk_a": "thigh",
        "fk_b": "calf",
        # ik_end is the ankle and the foot module's ik_foot stands in
        # the same place; driving both would put two handles on one bone
        "ik_aim": {"pole": ["thigh", "calf", "foot"], "offset": None},
    },
    "foot": {
        # despite its name it stands at the ankle, not at the heel
        "fk_heel": "foot",
        "fk_toe": "ball",
        # These stand a couple of units off their bones. That gap is
        # what maintainOffset keeps, so they ride them correctly all
        # the same.
        "ik_foot": "foot",
        "ik_toe": "ball",
    },
    "fingers": {},
}

CONTROL_BINDS["footSimple"] = CONTROL_BINDS["foot"]

for _f in ("index", "middle", "ring", "pinky"):
    CONTROL_BINDS["fingers"]["%sFingerRoot" % _f] = "%s_metacarpal" % _f
for _f in ("thumb", "index", "middle", "ring", "pinky"):
    for _i in (1, 2, 3):
        CONTROL_BINDS["fingers"]["%sFinger_%s" % (_f, _i)] = "%s_0%s" % (_f, _i)


# The body bones, which are the only ones posed. The correctives and the
# whole face are the take's own business: its RBF and RigLogic nodes own
# them, and writing to those channels is either refused or undone at
# once.
_SPINE = ["pelvis", "spine_01", "spine_02", "spine_03", "spine_04",
          "spine_05"]
_NECK = ["neck_01", "neck_02", "head"]
_ARM = ["clavicle", "upperarm", "lowerarm", "hand"]
_LEG = ["thigh", "calf", "foot", "ball"]
_FINGERS = ["thumb", "index", "middle", "ring", "pinky"]
_TOES = ["bigtoe", "indextoe", "middletoe", "ringtoe", "littletoe"]

BODY = set(_SPINE + _NECK + ["root"])
for _s in ("l", "r"):
    for _b in _ARM + _LEG:
        BODY.add("%s_%s" % (_b, _s))
    for _f in _FINGERS:
        if _f != "thumb":
            BODY.add("%s_metacarpal_%s" % (_f, _s))
        for _i in (1, 2, 3):
            BODY.add("%s_0%s_%s" % (_f, _i, _s))
    for _t in _TOES:
        for _i in (1, 2):
            BODY.add("%s_0%s_%s" % (_t, _i, _s))
    for _b in ("upperarm", "lowerarm", "thigh", "calf"):
        for _i in (1, 2):
            BODY.add("%s_twist_0%s_%s" % (_b, _i, _s))


# --------------------------------------------------------------------
# reading the scene


def short(node):  #
    return node.split("|")[-1]


def boneName(node):  #
    """The bone's name with any namespace taken off."""
    return short(node).split(":")[-1]


def namespaceOf(node):  #
    name = short(node)

    return name.rsplit(":", 1)[0] + ":" if ":" in name else ""


def setObjects(setName):  #
    """Members of a set, nested sets flattened out."""
    if not cmds.objExists(setName):
        return []
    if cmds.objectType(setName) != "objectSet":
        return []

    out = []
    for member in cmds.sets(setName, q=True) or []:
        if cmds.objectType(member) == "objectSet":
            out += setObjects(member)
        else:
            out.append(member)

    return out


def controls(rigNs=""):  #
    """Every animation control of the rig, parents first."""
    found = []
    for c in setObjects(rigNs + "controlSet"):
        for path in cmds.ls(c, long=True) or []:
            found.append((path.count("|"), path))

    return [c for _, c in sorted(found)]


def moduleOf(path):  #
    """The module a node belongs to, read off its DAG path.

    Rig Studio puts everything under rig|modules|<module>_mod|... The
    path is read a step at a time with the namespaces stripped, so a
    referenced rig - where every step carries a prefix - reads the same
    as one built in the scene.
    """
    steps = [boneName(p) for p in path.split("|") if p]
    if "modules" not in steps:
        return ""

    i = steps.index("modules")
    if i + 1 >= len(steps):
        return ""

    name = steps[i + 1]

    return name[:-4] if name.endswith("_mod") else ""


def moduleType(module, rigNs=""):  #
    root = rigNs + module + "_mod"
    if not cmds.objExists(root):
        return ""
    if not cmds.attributeQuery("moduleType", node=root, exists=True):
        return ""

    return cmds.getAttr(root + ".moduleType")


def sideOf(name):  #
    first = name.split("_")[0]

    return first if first in ("l", "r") else "c"


def slotKey(module, rigNs=""):  #
    """The key CONTROL_BINDS is written against.

    An arm and a leg share a module type but land on completely
    different bones, so limbs are split by name. The rig's own tools
    work this out from the module graph instead; here the name is
    enough, and it keeps this file free of the rest of Rig Studio.
    """
    mType = moduleType(module, rigNs)
    if mType not in ("limb", "limbCurved"):
        return mType

    lowered = module.lower()
    if "arm" in lowered or "hand" in lowered:
        return "limb@arm"

    return "limb@leg"


def internalName(control):  #
    plug = control + ".internalName"

    return cmds.getAttr(plug) if cmds.objExists(plug) else ""


def sided(slot, side):  #
    """'upperarm' + 'l' -> 'upperarm_l'. Centre slots are left alone."""
    if not slot:
        return slot
    if slot in _SPINE or slot in _NECK or slot == "root":
        return slot

    return "%s_%s" % (slot, side) if side in ("l", "r") else slot


def rigNamespace():  #
    """The namespace of whatever is selected, "" if it has none.

    A scene can hold several rigs, each referenced under its own
    prefix, and every name this tool looks for - controlSet, the bind
    set, the module nodes - sits inside one of them. Pointing at any
    object of a rig is the shortest way to say which.
    """
    sel = cmds.ls(sl=True, long=True)

    return namespaceOf(sel[0]) if sel else ""


def boundSkeletonRoot(rigNs=""):  #
    """The root of the MetaHuman skeleton this rig drives.

    With a take in the scene there are two identical skeletons and no
    telling them apart by name. The rig's binding constraints know,
    though - they are the only thing that says which one this rig is
    holding - so the answer is read back out of them.
    """
    driven = []
    for node in setObjects(rigNs + BIND_SET):
        if not cmds.objExists(node):
            continue
        parent = cmds.listRelatives(node, parent=True, fullPath=True)
        if parent and cmds.objectType(parent[0]) == "joint":
            driven.append(parent[0])

    if not driven:
        return ""

    top = sorted(driven, key=lambda n: n.count("|"))[0]
    while True:
        above = cmds.listRelatives(top, parent=True, type="joint",
                                   fullPath=True)
        if not above:
            break
        top = above[0]

    return top


def _skeletonJoints(root):  #
    """{bone name: joint} for a skeleton root and everything under it."""
    if not root or not cmds.objExists(root):
        return {}

    below = cmds.listRelatives(root, allDescendents=True, type="joint",
                               fullPath=True) or []

    out = {}
    for j in [cmds.ls(root, long=True)[0]] + below:
        out[boneName(j)] = j

    return out


def _takeJoints(namespace):  #
    """{bone name: joint} for the skeleton under this namespace."""
    out = {}
    for j in cmds.ls(namespace + "*", type="joint", long=True) or []:
        if namespaceOf(j) == namespace:
            out[boneName(j)] = j

    return out


# --------------------------------------------------------------------
# bringing the take in


def reference(path, namespace=None):  #
    """Reference the take, and say what namespace it landed under.

    An already-referenced file is reused rather than brought in twice -
    pressing the button again should not quietly fill the scene with
    copies of the same take.
    """
    path = path.replace("\\", "/")
    if not os.path.exists(path):
        cmds.warning("mocap: no such file - %s" % path)
        return ""

    if not namespace:
        namespace = os.path.splitext(os.path.basename(path))[0]

    for ref in cmds.file(q=True, reference=True) or []:
        if ref.replace("\\", "/").split("{")[0].lower() == path.lower():
            existing = cmds.file(ref, q=True, namespace=True)
            print("mocap: already referenced as '%s:'" % existing)
            return existing + ":"

    # no type or options: Maya works the format out from the file, and a
    # take can arrive as .ma, .mb or .fbx
    cmds.file(path, reference=True, namespace=namespace)

    return namespace + ":"


def firstFrame(joints):  #
    keyed = [j for j in joints if cmds.keyframe(j, q=True, keyframeCount=True)]

    return cmds.findKeyframe(keyed, which="first") if keyed else None


def lastFrame(joints):  #
    keyed = [j for j in joints if cmds.keyframe(j, q=True, keyframeCount=True)]

    return cmds.findKeyframe(keyed, which="last") if keyed else None


# --------------------------------------------------------------------
# standing the two skeletons together


def _matchWorld(target, source):  #
    """Stand one joint exactly where another stands, in world space.

    In world space and not by copying the channels, because a joint's
    orientation is jointOrient and rotate together and the two skeletons
    do not agree on the orient. Returns "" when it worked, or why not.
    """
    try:
        cmds.xform(target, worldSpace=True,
                   translation=cmds.xform(source, q=True, worldSpace=True,
                                          translation=True))
        cmds.xform(target, worldSpace=True,
                   rotation=cmds.xform(source, q=True, worldSpace=True,
                                       rotation=True))
    except Exception as e:
        return str(e).strip().splitlines()[0]

    return ""


def poseToRig(take, rig):  #
    """Stand the take's skeleton in the rig's pose. (posed, failed).

    Parents first, and it matters: a world position is only meaningful
    once everything above it is already standing where it belongs.
    """
    posed, failed = [], []

    for bone, target in sorted(take.items(), key=lambda kv: kv[1].count("|")):
        source = rig.get(bone)
        if not source or bone not in BODY:
            continue

        why = _matchWorld(target, source)
        if why:
            failed.append("%s (%s)" % (short(target), why))
        else:
            posed.append(bone)

    return posed, failed


def worstGap(posed, rig, take):  #
    """How far apart the two skeletons still are, and where.

    Measured rather than assumed: everything after this rests on the two
    of them agreeing, so it is worth one number.
    """
    worst, where = 0.0, ""
    for bone in posed:
        a = cmds.xform(rig[bone], q=True, ws=True, t=True)
        b = cmds.xform(take[bone], q=True, ws=True, t=True)
        d = sum((a[i] - b[i]) ** 2 for i in range(3)) ** 0.5
        if d > worst:
            worst, where = d, bone

    return worst, where


# --------------------------------------------------------------------
# hanging the controls off it


def switchLimbs(value, kinds, rigNs=""):  #
    """Set ikFk on the limbs of these module kinds. Returns what changed.

    0 is FK and 1 is IK, the way the rig's own switcher reads it.
    """
    switched = []
    for control in controls(rigNs):
        plug = control + ".ikFk"
        if not cmds.objExists(plug):
            continue

        module = moduleOf(control)
        if not module or slotKey(module, rigNs) not in kinds:
            continue
        if cmds.getAttr(plug, lock=True):
            continue
        if cmds.listConnections(plug, source=True, destination=False):
            continue
        if abs(cmds.getAttr(plug) - value) < 1e-6:
            continue

        cmds.setAttr(plug, value)
        switched.append(short(control))

    return switched


def _distance(a, b):  #
    return sum((a[i] - b[i]) ** 2 for i in range(3)) ** 0.5


def _poleRig(control, chain, offset, setName):  #
    """A live frame for a pole vector, built from the limb's triangle.

        base    point-constrained to the root and the end bone, so it
                sits on the middle of the chord between them,
        aimed   at the middle bone, so its X axis runs across the
                triangle and out through the elbow or the knee,
        pole    a child of base, at `offset` in its space.

    The offset is given, not measured. At the rest pose a leg is
    straight: the knee lies on the chord, base lands on top of it, the
    vector it is meant to aim along is zero, and base's rotation at that
    one moment is arbitrary. Anything read out of that frame is
    arbitrary with it.
    """
    a, b, c = chain

    # the colon of a namespace is not allowed in a node name, and two
    # rigs would otherwise both want 'l_knee_ik_mocapPole'
    name = short(control).replace(":", "_") + "_mocapPole"
    base = cmds.spaceLocator(n=name + "_base")[0]

    cmds.pointConstraint(a, c, base)
    # no up vector: only the aim axis carries meaning here, and the roll
    # about it is settled once and then stays put
    cmds.aimConstraint(b, base, worldUpType="none")

    if not offset:
        offset = [_distance(cmds.xform(control, q=True, ws=True, t=True),
                            cmds.xform(base, q=True, ws=True, t=True)),
                  0.0, 0.0]

    pole = cmds.spaceLocator(n=name)[0]
    pole = cmds.parent(pole, base)[0]
    cmds.setAttr(pole + ".translate", *offset)

    cmds.sets(base, add=setName)

    return pole, offset


def _isConstrained(node):  #
    for child in cmds.listRelatives(node, children=True, fullPath=True) or []:
        if cmds.objectType(child).endswith("Constraint"):
            return True

    return False


# What can already be on a channel and still let a constraint on top.
# An animation curve is the usual case - a rig that has been through
# this before still carries the keys from last time - and Maya puts a
# pairBlend between the two rather than refusing. A pairBlend itself is
# there for the same reason, one layer down.
_BLENDABLE = ("animCurveTL", "animCurveTA", "animCurveTU", "animCurveTT",
              "pairBlend")


def _writable(node, attr):  #
    """The axes of translate or rotate that can actually be driven.

    A lock is what really stops a constraint - an FK control with its
    translate locked refuses one outright. Being animated does not: the
    first version of this treated any connection as a closed door, and
    on a rig that already had a take baked onto it that shut every
    channel of every control.
    """
    out = []
    for axis in "xyz":
        plug = "%s.%s%s" % (node, attr, axis.upper())
        if not cmds.objExists(plug):
            continue
        if cmds.getAttr(plug, lock=True):
            continue

        held = False
        for source in cmds.listConnections(plug, source=True,
                                           destination=False) or []:
            if cmds.objectType(source) not in _BLENDABLE:
                held = True
                break
        if held:
            continue

        out.append(axis)

    return out


def clearAnimation(control):  #
    """Take the keys off a control's translate and rotate.

    Every transfer starts from a clean control. Without this the old
    curves stay underneath, Maya blends the new constraint over them,
    and the bake only overwrites the range the new take covers - so a
    shorter take leaves a tail of the previous one hanging past its
    end, which is a hard thing to notice and a worse one to explain.

    Only curves that belong to this scene go: one that came in with the
    rig's own reference is not this tool's to delete.
    """
    curves = []
    for attr in ("translate", "rotate"):
        for axis in "XYZ":
            plug = "%s.%s%s" % (control, attr, axis)
            if not cmds.objExists(plug) or cmds.getAttr(plug, lock=True):
                continue

            for source in cmds.listConnections(plug, source=True,
                                               destination=False,
                                               type="animCurve") or []:
                if source not in curves and not cmds.referenceQuery(
                        source, isNodeReferenced=True):
                    curves.append(source)

    if curves:
        cmds.delete(curves)

    return len(curves)


def _constrain(driver, control, keepOffset=True):  #
    """Hang a control off a driver, by whatever it may be moved.

    The rig locks what a control is not meant to do, and an FK control
    is meant to rotate and nothing else - a parentConstraint on one
    fails outright on its locked translate. So the constraint is chosen
    to fit: both free is a parent, rotation alone is an orient, position
    alone is a point, and a partly locked one takes the axes that are
    left.

    keepOffset=False puts the control exactly on the driver. That is
    what a pole vector wants: its locator is meant to BE the control's
    position, so that nudging the locator moves the control one for one.
    With an offset baked in, the two drift apart by however wrong the
    frame was when the constraint was made, and no amount of moving the
    locator afterwards takes that back.
    """
    freeT = _writable(control, "translate")
    freeR = _writable(control, "rotate")

    skipT = [a for a in "xyz" if a not in freeT]
    skipR = [a for a in "xyz" if a not in freeR]

    if not freeT and not freeR:
        return None, "nothing writable"

    if not freeT:
        con = cmds.orientConstraint(driver, control, mo=keepOffset,
                                    skip=skipR or "none")[0]
        return con, "orient" + (" -%s" % "".join(skipR) if skipR else "")

    if not freeR:
        con = cmds.pointConstraint(driver, control, mo=keepOffset,
                                   skip=skipT or "none")[0]
        return con, "point" + (" -%s" % "".join(skipT) if skipT else "")

    con = cmds.parentConstraint(driver, control, mo=keepOffset,
                                skipTranslate=skipT or "none",
                                skipRotate=skipR or "none")[0]

    return con, "parent"


def attach(take, rigNs="", setName=MOCAP_SET):  #
    """Constrain every mapped control to its bone in the take."""
    made, missing, held = [], [], []
    cleared = 0

    for control in controls(rigNs):
        name = short(control)
        module = moduleOf(control)
        if not module:
            continue

        table = CONTROL_BINDS.get(slotKey(module, rigNs), {})
        slot = table.get(internalName(control) or name)
        if not slot:
            continue

        side = sideOf(module)

        chain = []
        if isinstance(slot, dict) and slot.get("pole"):
            chain = [sided(b, side) for b in slot["pole"]]
            bone = chain[1]
        else:
            bone = sided(slot, side)

        absent = [b for b in (chain or [bone]) if b not in take]
        if absent:
            missing.append("%s -> %s" % (name, ", ".join(absent)))
            continue

        if _isConstrained(control):
            held.append("%s (already constrained)" % name)
            continue

        cleared += clearAnimation(control)

        # one control that will not take a constraint should not cost
        # the other fifty-nine theirs
        try:
            if chain:
                pole, offset = _poleRig(control, [take[b] for b in chain],
                                        slot.get("offset"), setName)
                con, how = _constrain(pole, control, keepOffset=False)
                how = "pole (%s) %s" % (
                    ", ".join("%.2f" % v for v in offset), how)
            else:
                con, how = _constrain(take[bone], control)
        except Exception as e:
            held.append("%s (%s)" % (name, str(e).strip().splitlines()[0]))
            continue

        if not con:
            held.append("%s (%s)" % (name, how))
            continue

        cmds.sets(con, add=setName)
        made.append("%-26s <- %-22s %s" % (name, bone, how))

    return made, missing, held, cleared


# --------------------------------------------------------------------
# the three steps, and the one that runs them


def _remember(setName, path, namespace):  #
    """Write the take's file and namespace onto the set.

    So the take can be removed later without guessing which of the
    scene's references it is.
    """
    for attr, value in (("mocapFile", path), ("mocapNamespace", namespace)):
        if not cmds.attributeQuery(attr, node=setName, exists=True):
            cmds.addAttr(setName, ln=attr, dt="string")
        cmds.setAttr("%s.%s" % (setName, attr), value, type="string")


def _remembered(setName, attr):  #
    plug = "%s.%s" % (setName, attr)

    return cmds.getAttr(plug) if cmds.objExists(plug) else ""


def load(path, namespace=None, frame=None, skeletonRoot=None, fk=True,
         rigNs="", progress=None):  #
    """Bring the take in and hang the controls off it.

    Stops here on purpose when called directly: controls hanging off a
    take that is still in the scene is where anything wrong is visible.
    """
    if not skeletonRoot:
        skeletonRoot = boundSkeletonRoot(rigNs)
    if not skeletonRoot:
        cmds.warning("mocap: the rig is not bound to a MetaHuman skeleton - "
                     "connect it first")
        return {}

    rig = _skeletonJoints(skeletonRoot)
    if not rig:
        cmds.warning("mocap: no MetaHuman skeleton on the rig")
        return {}

    _say(progress, 0.05, "Referencing the take")
    namespace = reference(path, namespace)
    if not namespace:
        return {}

    take = _takeJoints(namespace)
    if not take:
        cmds.warning("mocap: nothing under '%s' - is that a skeleton?"
                     % namespace)
        return {}

    if frame is None:
        first = firstFrame(list(take.values()))
        frame = (first - 1) if first is not None else -1.0
    cmds.currentTime(frame)

    setName = rigNs + MOCAP_SET
    if not cmds.objExists(setName):
        cmds.sets(empty=True, n=setName)
    _remember(setName, path.replace("\\", "/"), namespace)

    cmds.undoInfo(openChunk=True, chunkName="mocap: load")
    autoKey = _autoKeyOff()
    try:
        # before the skeletons are stood together: switching moves the
        # rig, and the take has to be posed to where it ends up
        _say(progress, 0.15, "Switching the limbs to FK")
        switched = (switchLimbs(0, ("limb@arm", "limb@leg"), rigNs)
                    if fk else [])

        _say(progress, 0.25, "Standing the skeletons together")
        posed, failed = poseToRig(take, rig)
        worst, where = worstGap(posed, rig, take)

        _say(progress, 0.4, "Hanging the controls off the take")
        made, missing, held, cleared = attach(take, rigNs, setName)

        # back to IK on the legs once the constraints exist: both sets
        # of controls are driven, so the leg reads the same either way,
        # and IK is how a leg is normally worked with
        restored = switchLimbs(1, ("limb@leg",), rigNs) if fk else []
    finally:
        _autoKeyBack(autoKey)
        cmds.undoInfo(closeChunk=True)

    # The summary, and then only what went wrong. The roll-call of every
    # control that did work is seventy lines of nothing to act on, and
    # it buries the two or three that need reading.
    print("\n--- mocap: loaded ---")
    print("file      : %s" % path)
    print("namespace : %s" % namespace)
    print("pre-roll  : frame %s, %s bones posed, worst gap %.4f on %s"
          % (frame, len(posed), worst, where or "-"))
    print("controls  : %s driven, %s old curves removed"
          % (len(made), cleared))
    _printList("no bone for it", missing)
    _printList("not driven", held)
    _printList("could not be posed", failed)
    print("---\n")

    return {"namespace": namespace, "frame": frame, "posed": posed,
            "worst": worst, "controls": made, "missing": missing,
            "held": held}


def drivenControls(setName=MOCAP_SET):  #
    """The controls this tool's constraints are driving right now."""
    out = []
    for node in setObjects(setName):
        if not cmds.objExists(node):
            continue
        if not cmds.objectType(node).endswith("Constraint"):
            continue

        parent = cmds.listRelatives(node, parent=True, fullPath=True)
        if parent and parent[0] not in out:
            out.append(parent[0])

    return out


def bake(start=None, end=None, remove=True, rigNs="", progress=None):  #
    """Bake the take onto the controls, then take the scaffolding away.

    The range comes from the take's own keys unless it is given.
    remove=False keeps the take in the scene, for comparing the baked
    result against what it came from.
    """
    setName = rigNs + MOCAP_SET
    if not cmds.objExists(setName):
        cmds.warning("mocap: nothing is attached")
        return {}

    driven = drivenControls(setName)
    if not driven:
        cmds.warning("mocap: nothing is being driven")
        return {}

    # read before anything is taken apart: detach() deletes the set, and
    # these live on it
    namespace = _remembered(setName, "mocapNamespace")
    takeFile = _remembered(setName, "mocapFile")

    if start is None or end is None:
        joints = list(_takeJoints(namespace).values()) if namespace else []
        first, last = firstFrame(joints), lastFrame(joints)
        if first is None:
            first = cmds.playbackOptions(q=True, min=True)
            last = cmds.playbackOptions(q=True, max=True)
        start = first if start is None else start
        end = last if end is None else end

    cmds.undoInfo(openChunk=True, chunkName="mocap: bake")
    autoKey = _autoKeyOff()
    layers = _layersAside()
    try:
        # simulation=True steps the frames in order and lets the whole
        # rig settle at each one. Without it a control is sampled from a
        # graph its own parents have not caught up with yet.
        _say(progress, 0.6, "Baking %s frames" % int(end - start))

        # One call over the whole range, and it has to be one.
        #
        # Baking writes a curve onto a channel a constraint is already
        # driving; Maya blends the two and leaves the weight on the
        # curve. Split the bake into pieces and every piece after the
        # first reads that curve instead of the constraint - and beyond
        # the first piece's range the curve says nothing, so the rest
        # bakes a rig standing still. It was cut up to keep a progress
        # bar moving, which is not worth an animation that stops at
        # frame 40.
        #
        # disableImplicitControl switches the constraints off once the
        # values are safely on the curves, which is exactly right here.
        cmds.bakeResults(driven, time=(start, end), simulation=True,
                         sampleBy=1, disableImplicitControl=True,
                         preserveOutsideKeys=False,
                         sparseAnimCurveBake=False,
                         removeBakedAttributeFromLayer=False,
                         attribute=["tx", "ty", "tz", "rx", "ry", "rz"])

        _say(progress, 0.97, "Taking the mocap back out")
        detach(rigNs)

        removed = unload(takeFile, namespace) if remove else ""
    finally:
        cmds.undoInfo(closeChunk=True)

    print("\n--- mocap: baked ---")
    print("range     : %s to %s" % (start, end))
    print("controls  : %s" % len(driven))
    if removed:
        print("take      : removed (%s)" % removed)
    elif remove:
        print("take      : nothing to remove")
    print("---\n")

    return {"controls": driven, "start": start, "end": end,
            "removed": removed}


def unload(path=None, namespace=None):  #
    """Take the mocap out of the scene. Returns what went, or "".

    Three ways, because one is not enough. Matching the file path is the
    obvious one, but Maya stores a reference's path with a copy number
    on the end and may have tidied it in other ways besides, so the
    namespace is tried next - it is what the take actually occupies. And
    a take that was imported rather than referenced has no reference to
    remove at all, so what is left is deleting the nodes.
    """
    path = path if path is not None else _remembered("mocapFile")
    namespace = (namespace if namespace is not None
                 else _remembered("mocapNamespace"))

    for ref in cmds.file(q=True, reference=True) or []:
        if path and ref.replace("\\", "/").split("{")[0].lower() == path.lower():
            cmds.file(ref, removeReference=True)
            return ref

    if not namespace:
        return ""

    clean = namespace.rstrip(":")
    for ref in cmds.file(q=True, reference=True) or []:
        try:
            if cmds.file(ref, q=True, namespace=True) == clean:
                cmds.file(ref, removeReference=True)
                return ref
        except Exception:
            continue

    nodes = [n for n in cmds.ls(namespace + "*", long=True) or []
             if cmds.objExists(n)]
    if nodes:
        cmds.delete(nodes)
    if cmds.namespace(exists=clean):
        cmds.namespace(removeNamespace=clean, deleteNamespaceContent=True)

    return "%s (%s nodes)" % (namespace, len(nodes)) if nodes else ""


def detach(rigNs=""):  #
    """Take the controls off the take, leaving it in the scene."""
    setName = rigNs + MOCAP_SET
    if not cmds.objExists(setName):
        print("mocap: nothing to detach")
        return 0

    nodes = [n for n in setObjects(setName) if cmds.objExists(n)]
    if nodes:
        cmds.delete(nodes)
    if cmds.objExists(setName):
        cmds.delete(setName)

    return len(nodes)


def transfer(path, namespace=None, skeletonRoot=None, rigNs="",
             progress=None):  #
    """The whole job: take in, animation on the controls, take out.

    rigNs names the rig when the scene holds more than one - the prefix
    every one of its nodes carries.
    """
    loaded = load(path, namespace=namespace, skeletonRoot=skeletonRoot,
                  rigNs=rigNs, progress=progress)
    if not loaded:
        _say(progress, 0.0, "Nothing was transferred")
        return {}

    baked = bake(rigNs=rigNs, progress=progress)

    # no closing message: the window puts its opening line back when it
    # is done, and what was transferred is printed in full below anyway

    return {"loaded": loaded, "baked": baked}


def _layersAside():  #
    """Deselect every animation layer, and say which had been selected.

    Baked keys go into whatever layer is selected. A MetaHuman scene
    arrives with layers of its own - the rig's reference brings some,
    the take brings more - and if one of those is selected the keys
    land in a layer the controls are not members of. They exist, they
    are simply somewhere that does not drive anything.
    """
    layers = cmds.ls(type="animLayer") or []
    if not layers:
        return []

    was = []
    for layer in layers:
        try:
            if cmds.animLayer(layer, q=True, selected=True):
                was.append(layer)
                cmds.animLayer(layer, e=True, selected=False)
        except Exception:
            continue

    root = cmds.animLayer(q=True, root=True)
    if root:
        try:
            cmds.animLayer(root, e=True, preferred=True)
        except Exception:
            pass

    return was


def _layersBack(was):  #
    for layer in was:
        try:
            if cmds.objExists(layer):
                cmds.animLayer(layer, e=True, selected=True)
        except Exception:
            continue


def _autoKeyOff():  #
    """Turn Auto Key off, and say whether it had been on.

    This tool writes a great many values - a hundred bones posed, sixty
    constraints made - and with Auto Key on Maya answers every one of
    them with a key of its own, on whatever frame happens to be current.
    None of those keys are wanted and some would land on the take.
    """
    was = cmds.autoKeyframe(q=True, state=True)
    if was:
        cmds.autoKeyframe(state=False)

    return was


def _autoKeyBack(was):  #
    if was:
        cmds.autoKeyframe(state=True)


def _say(progress, fraction, message):  #
    """Tell the window where we are, if there is one listening.

    A plain callable rather than anything cleverer, so every step below
    reads the same whether it is run from a button or from a script.
    """
    if progress:
        progress(fraction, message)


def _printList(title, lines):  #
    if not lines:
        return

    print("%s (%s):" % (title, len(lines)))
    for line in lines[:20]:
        print("    " + line)
    if len(lines) > 20:
        print("    ... and %s more" % (len(lines) - 20))


# --------------------------------------------------------------------
# the window


def _mayaMainWindow():  #
    ptr = OpenMayaUI.MQtUtil.mainWindow()

    return wrapInstance(int(ptr), QtWidgets.QWidget) if ptr else None


READY = "Select any control of the rig and push button"

# Where the recent takes are kept. An optionVar rather than a variable
# in this module: an animator loading takes one after another wants the
# list to still be there tomorrow, and Maya carries optionVars across
# sessions on its own.
RECENT_VAR = "metahumanMocapRecent"
RECENT_MAX = 10


def recentFiles():  #
    """The takes used before, newest first."""
    found = cmds.optionVar(q=RECENT_VAR)

    return [f for f in found if f] if isinstance(found, list) else []


def rememberFile(path):  #
    """Put a take at the top of the list, keeping it to RECENT_MAX."""
    path = path.replace("\\", "/")

    keep = [path] + [f for f in recentFiles() if f != path]
    keep = keep[:RECENT_MAX]

    cmds.optionVar(clearArray=RECENT_VAR)
    for f in keep:
        cmds.optionVar(stringValueAppend=(RECENT_VAR, f))

    return keep
_window = None


class MocapWindow(QtWidgets.QDialog):  #

    def __init__(self, parent=None):
        super(MocapWindow, self).__init__(parent or _mayaMainWindow())

        # Named so a new window can find the old one and close it: a
        # handle in a module variable does not survive the module being
        # reloaded, and the window is left standing.
        self.setObjectName(OBJECT_NAME)
        self.setWindowTitle("MetaHuman mocap")
        self.setMinimumWidth(460)

        form = QtWidgets.QFormLayout(self)
        form.setFieldGrowthPolicy(
            QtWidgets.QFormLayout.AllNonFixedFieldsGrow)

        # A dropdown rather than a plain field: takes come in batches
        # from the same folder, and retyping the path each time is the
        # part of this that would actually be felt.
        self.pathEdit = QtWidgets.QComboBox()
        self.pathEdit.setEditable(True)
        self.pathEdit.addItems(recentFiles())
        self.pathEdit.setCurrentText("")
        self.pathEdit.lineEdit().setPlaceholderText(
            "path to the mocap file")

        browse = QtWidgets.QPushButton("...")
        browse.setFixedWidth(28)
        browse.clicked.connect(self.browse)

        row = QtWidgets.QHBoxLayout()
        row.addWidget(self.pathEdit)
        row.addWidget(browse)
        form.addRow("Mocap file", row)

        # Two widgets in one place, only ever one of them showing: a
        # plain line while there is nothing to report, and the bar with
        # the step written across it while there is. A bar sitting at
        # zero says "stuck" to anyone glancing at it, so at rest there
        # is no bar at all.
        self.hint = QtWidgets.QLabel(READY)
        self.hint.setAlignment(QtCore.Qt.AlignCenter)
        self.hint.setFixedHeight(20)

        self.status = QtWidgets.QProgressBar()
        self.status.setRange(0, 100)
        self.status.setTextVisible(True)
        self.status.setFixedHeight(20)
        self.status.hide()

        line = QtWidgets.QVBoxLayout()
        line.setContentsMargins(0, 0, 0, 0)
        line.addWidget(self.hint)
        line.addWidget(self.status)
        form.addRow(line)

        self.button = QtWidgets.QPushButton("Transfer Animation")
        self.button.setToolTip("Reference the take, hang the controls off "
                               "it, bake, and take the mocap back out")
        self.button.clicked.connect(self.onTransfer)
        form.addRow(self.button)

    def browse(self):  #
        # Qt's dialog rather than cmds.fileDialog2, which draws Maya's
        # own: on Windows this is the Explorer window everyone knows.
        start = os.path.dirname(self.pathEdit.currentText()) or \
            cmds.workspace(q=True, rootDirectory=True)

        found, _ = QtWidgets.QFileDialog.getOpenFileName(
            self, "Mocap file", start,
            "Scenes (*.ma *.mb *.fbx);;All files (*.*)")

        if found:
            self.pathEdit.setCurrentText(found.replace("\\", "/"))

    def _refresh(self, recent):  #
        """Redraw the dropdown with the take just used at the top."""
        current = self.pathEdit.currentText()
        self.pathEdit.clear()
        self.pathEdit.addItems(recent)
        self.pathEdit.setCurrentText(current)

    def idle(self, message=None):  #
        """Back to a line of text with no bar under it."""
        self.hint.setText(message or READY)
        self.hint.show()
        self.status.hide()
        self.hint.repaint()

    def report(self, fraction, message):  #
        """Show where we are, and give Qt a moment to actually draw it.

        processEvents is what makes the bar move at all: Maya holds the
        thread through each step, and without it the window would only
        repaint once everything was already over.
        """
        self.hint.hide()
        self.status.show()
        self.status.setValue(int(round(fraction * 100)))
        self.status.setFormat(message)
        # repaint, not just processEvents: Maya holds the thread through
        # each step and an event queue that is never reached paints
        # nothing. repaint draws there and then.
        self.status.repaint()
        QtWidgets.QApplication.processEvents()

    def onTransfer(self):  #
        # not called transfer(): the module function of that name is
        # what it calls, and one hiding the other reads like recursion
        path = self.pathEdit.currentText().strip()
        if not path:
            cmds.warning("mocap: no file given")
            self.idle("No mocap file given")
            return

        # Which rig, when the scene holds several, is answered by the
        # selection: any one of its nodes carries its namespace.
        if not cmds.ls(sl=True):
            cmds.warning("mocap: select any control of the rig first")
            self.idle()
            return

        rigNs = rigNamespace()

        self.button.setEnabled(False)
        try:
            transfer(path, rigNs=rigNs, progress=self.report)
        finally:
            self.button.setEnabled(True)
            self._refresh(rememberFile(path))
            # back to where it started, ready for the next rig
            self.idle()


def window():  #
    """Open the window, closing any that is already up."""
    global _window

    parent = _mayaMainWindow()
    if parent:
        for old in parent.findChildren(QtWidgets.QDialog, OBJECT_NAME):
            try:
                old.close()
                old.deleteLater()
            except Exception:
                pass

    _window = MocapWindow()
    _window.show()

    return _window
