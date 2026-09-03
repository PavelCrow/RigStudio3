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
import webbrowser

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
        "fk_1": "spine_01",
        "fk_2": "spine_02",
        "fk_3": "spine_03",
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
        # The pole vector is solved from the limb's triangle on every
        # frame - see _poleRig. 'distance' is how far out from the
        # elbow to stand; None measures it from the rest pose.
        "ik_aim": {"pole": ["upperarm", "lowerarm", "hand"],
                   "distance": None},
    },
    "limb@leg": {
        "fk_a": "thigh",
        "fk_b": "calf",
        # ik_end is the ankle and the foot module's ik_foot stands in
        # the same place; driving both would put two handles on one bone
        "ik_aim": {"pole": ["thigh", "calf", "foot"], "distance": None},
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


def _chainLength(joints, names):  #
    """Total length along a chain of bones, 0 if any of it is missing."""
    total = 0.0
    for a, b in zip(names, names[1:]):
        if a not in joints or b not in joints:
            return 0.0
        total += _distance(cmds.xform(joints[a], q=True, ws=True, t=True),
                           cmds.xform(joints[b], q=True, ws=True, t=True))

    return total


def scaleFactor(rig, take):  #
    """How much bigger the rig is than the take. 1.0 if it cannot tell.

    Measured on the leg - thigh to knee to ankle - because the leg is
    what the mismatch shows up in. A shorter take puts the pelvis low
    and the feet where its own were; our longer legs can only reach
    between the two by bending, and the character walks on half-bent
    knees for the whole shot. A taller take does the same in reverse
    and lifts it onto its toes.

    One number for the whole body, which is an approximation: two
    MetaHumans differ in proportion and not only in height. It is the
    right approximation for locomotion, where the legs decide.
    """
    ours, theirs = legLengths(rig, take)
    if ours > 1e-4 and theirs > 1e-4:
        return ours / theirs

    return 1.0


def legLengths(rig, take):  #
    """(rig leg, take leg). Either is 0 when it could not be measured."""
    for side in ("l", "r"):
        chain = ["thigh_" + side, "calf_" + side, "foot_" + side]
        ours, theirs = _chainLength(rig, chain), _chainLength(take, chain)
        if ours > 1e-4 and theirs > 1e-4:
            return ours, theirs

    return 0.0, 0.0


def topNode(joint):  #
    """The transform at the very top of a joint's hierarchy."""
    top = joint
    while True:
        above = cmds.listRelatives(top, parent=True, fullPath=True)
        if not above:
            return top
        top = above[0]


SCALE_GROUP = "_mocapScale"


def _scaleGroupName(namespace):  #
    return namespace.strip(":").replace(":", "_") + SCALE_GROUP


def dropScaleGroups():  #
    """Delete the groups resize() made, once they are empty."""
    gone = 0
    for node in cmds.ls("*" + SCALE_GROUP, type="transform", long=True) or []:
        if cmds.listRelatives(node, children=True):
            continue
        cmds.delete(node)
        gone += 1

    return gone


def scaleGroup(take):  #
    """The group that carries the take's size and placing.

    Made here rather than found in the take, and the take's own top
    node parented under it. Two reasons.

    A file that arrives with nothing but a root joint on top has
    nowhere to put a scale: scaling a root joint does nothing to a
    MetaHuman, because segmentScaleCompensate on every joint below
    takes the parent's scale straight back out again - silently, the
    command works and the skeleton does not move.

    And a file that does arrive with a group has a referenced one,
    which is a poor thing to hand somebody to drag around. This group
    is ours, unlocked, named after the take, and it goes away with it.
    """
    root = take.get("root") or take.get("pelvis")
    if not root:
        return ""

    name = _scaleGroupName(namespaceOf(root))
    if cmds.objExists(name):
        return name

    top = topNode(root)
    group = cmds.group(empty=True, world=True, name=name)
    try:
        cmds.parent(top, group)
    except Exception as err:
        cmds.delete(group)
        cmds.warning("mocap: %s could not be grouped (%s)"
                     % (short(top), err))
        return ""

    return group


GEOMETRY_SUFFIX = "_mesh"


def freeGeometry(namespace):  #
    """Stop the take's geometry inheriting the scale group.

    The meshes that come in with a take are skinned, so the joints
    already carry them. Scaling the group above them adds the same
    scale a second time, on top of what the skin is doing - the body
    swells or shrinks around a skeleton that is the right size, which
    looks like the skinning broke rather than like a scale.

    Only what is named for it, by GEOMETRY_SUFFIX. A MetaHuman file
    carries meshes that are not the character - the rig's own interface
    is drawn with them - and those are nobody's business here.

    Returns how many were freed.
    """
    freed = 0
    shapes = []
    for kind in ("mesh", "nurbsSurface"):
        shapes += cmds.ls(namespace + "*", type=kind, long=True) or []

    seen = set()
    for shape in shapes:
        if cmds.getAttr(shape + ".intermediateObject"):
            continue

        above = cmds.listRelatives(shape, parent=True, fullPath=True)
        if not above or above[0] in seen:
            continue
        seen.add(above[0])

        name = short(above[0]).split(":")[-1]
        if not name.endswith(GEOMETRY_SUFFIX):
            continue

        plug = above[0] + ".inheritsTransform"
        if cmds.getAttr(plug, lock=True):
            continue
        if cmds.listConnections(plug, source=True, destination=False):
            continue
        if not cmds.getAttr(plug):
            continue

        cmds.setAttr(plug, 0)
        freed += 1

    return freed


def resize(take, factor):  #
    """Scale the take. Returns "" or why it could not."""
    group = scaleGroup(take)
    if not group:
        return "no root to scale"

    if abs(factor - 1.0) < 1e-4:
        return ""

    for axis in "XYZ":
        plug = "%s.scale%s" % (group, axis)
        if cmds.getAttr(plug, lock=True):
            return "%s is locked" % plug
        if cmds.listConnections(plug, source=True, destination=False):
            return "%s is driven" % plug

    cmds.setAttr(group + ".scale", factor, factor, factor)

    return ""


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


def _poleRig(control, chain, distance, setName):  #
    """The pole vector's own definition, built as nodes.

    Given the limb's three joints - root A, middle B, end C:

        drop B onto the line AC, giving the point on that line
        nearest the knee or the elbow,
        take the direction from that point out to B,
        and stand `distance` along it from B.

    Which is where a pole vector is, by definition. The first version
    of this stood the frame at the middle of the chord AC instead. The
    middle of the chord is the projection of B only when AB and BC are
    the same length, and a thigh and a shin are not - so it started off
    the mark and then wandered as the limb bent, which is exactly what
    a pole vector must not do.

    Nodes rather than a measurement, so it is solved on every frame
    from where the take actually is.

    The one place it has nothing to say is a perfectly straight limb:
    B lies on AC, the direction out to it is a zero vector, and there
    is no plane to speak of. Mocap does not hold a leg exactly straight
    for long, but a frame that does will put the pole on the knee.
    """
    a, b, c = chain

    # the colon of a namespace is not allowed in a node name, and two
    # rigs would otherwise both want 'l_knee_ik_mocapPole'
    name = short(control).replace(":", "_") + "_mocapPole"

    def node(kind, suffix):
        made = cmds.createNode(kind, n="%s_%s" % (name, suffix))
        cmds.sets(made, add=setName)

        return made

    def where(joint, suffix):
        found = node("decomposeMatrix", suffix)
        cmds.connectAttr(joint + ".worldMatrix[0]", found + ".inputMatrix")

        return found + ".outputTranslate"

    def sum3(x, y, suffix, operation):
        made = node("plusMinusAverage", suffix)
        cmds.setAttr(made + ".operation", operation)
        cmds.connectAttr(x, made + ".input3D[0]")
        cmds.connectAttr(y, made + ".input3D[1]")

        return made + ".output3D"

    def minus(x, y, suffix):
        return sum3(x, y, suffix, 2)

    def plus(x, y, suffix):
        return sum3(x, y, suffix, 1)

    atA, atB, atC = where(a, "root"), where(b, "mid"), where(c, "end")

    chord = minus(atC, atA, "chord")          # A -> C
    toMid = minus(atB, atA, "toMid")          # A -> B

    # how far along AC the projection of B falls, as a fraction of it:
    # (AB . AC) / (AC . AC)
    dot = node("vectorProduct", "dot")
    cmds.setAttr(dot + ".operation", 1)
    cmds.connectAttr(toMid, dot + ".input1")
    cmds.connectAttr(chord, dot + ".input2")

    span = node("vectorProduct", "span")
    cmds.setAttr(span + ".operation", 1)
    cmds.connectAttr(chord, span + ".input1")
    cmds.connectAttr(chord, span + ".input2")

    ratio = node("multiplyDivide", "ratio")
    cmds.setAttr(ratio + ".operation", 2)
    cmds.connectAttr(dot + ".outputX", ratio + ".input1X")
    cmds.connectAttr(span + ".outputX", ratio + ".input2X")

    along = node("multiplyDivide", "along")
    cmds.setAttr(along + ".operation", 1)
    cmds.connectAttr(chord, along + ".input1")
    for axis in "XYZ":
        cmds.connectAttr(ratio + ".outputX", along + ".input2" + axis)

    nearest = plus(atA, along + ".output", "nearest")
    out = minus(atB, nearest, "out")

    unit = node("vectorProduct", "unit")
    cmds.setAttr(unit + ".operation", 0)
    cmds.setAttr(unit + ".normalizeOutput", 1)
    cmds.connectAttr(out, unit + ".input1")

    push = node("multiplyDivide", "push")
    cmds.setAttr(push + ".operation", 1)
    cmds.connectAttr(unit + ".output", push + ".input1")

    place = plus(atB, push + ".output", "place")

    pole = cmds.spaceLocator(n=name)[0]
    cmds.sets(pole, add=setName)

    # How far out to stand. Measured from where the control sits at the
    # rest pose, which the rig is put back to before any of this - so
    # the pole keeps the distance the rig was built with.
    if not distance:
        distance = _distance(cmds.xform(control, q=True, ws=True, t=True),
                             cmds.xform(b, q=True, ws=True, t=True))

    # left as an attribute rather than a number set once: it is the one
    # thing here worth a human opinion, and it can be turned while the
    # take plays
    cmds.addAttr(pole, ln="poleDistance", at="double", dv=distance,
                 keyable=True)
    for axis in "XYZ":
        cmds.connectAttr(pole + ".poleDistance", push + ".input2" + axis)

    cmds.connectAttr(place, pole + ".translate")

    return pole, distance


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


def mayMove(leaf):  #
    """Whether this control carries position as well as rotation.

    Only two kinds do: the pelvis, which is where the character's
    travel through the world lives, and the IK controls, which are
    positions by definition.

    Everything else rotates and stays put. An FK control that is
    allowed to translate is dragged onto the take's bone, and since the
    take's bones are not spaced exactly like ours, the limb it belongs
    to is stretched or squashed to reach - the proportions go, and the
    rig stops being the rig. Rotation carries the whole of what FK has
    to say anyway; the length of the bone is the rig's own business.

    Locks are not a safe way to tell the two apart. A control that is
    not meant to translate is usually locked, but not always, and the
    unlocked ones are exactly the ones this goes wrong on.
    """
    return leaf == "pelvis" or leaf.startswith("ik_")


def _constrain(driver, control, keepOffset=True, move=True,
               rotate=True):  #
    """Hang a control off a driver, by whatever it may be moved.

    The constraint is chosen to fit what is free and what the control
    is for: both is a parent, rotation alone an orient, position alone
    a point, and a partly locked one takes the axes that are left.

    move=False keeps the control's position to itself - see mayMove.
    rotate=False the same for its rotation, which is what a pole vector
    wants: it is a point, and the locator marking it has no orientation
    worth copying.

    keepOffset=False puts the control exactly on the driver. That is
    what a pole vector wants: the locator is not near the pole, it IS
    the pole, solved for that frame. An offset would add whatever the
    limb happened to be doing when the constraint was made - and at the
    pre-roll frame the limb is straight, which is the one pose a pole
    vector cannot be read from.
    """
    freeT = _writable(control, "translate") if move else []
    freeR = _writable(control, "rotate") if rotate else []

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


def boundControls(rigNs=""):  #
    """The controls this tool drives: (control, leaf, slot, side).

    One list, so that resetting them and constraining them cannot come
    to different answers about which controls are in play.
    """
    out = []
    for control in controls(rigNs):
        module = moduleOf(control)
        if not module:
            continue

        table = CONTROL_BINDS.get(slotKey(module, rigNs), {})
        leaf = internalName(control) or short(control)
        slot = table.get(leaf)
        if slot:
            out.append((control, leaf, slot, sideOf(module)))

    return out


def restPose(rigNs=""):  #
    """Put the controls this tool drives back where the rig built them.

    Deleting a constraint does not put its target back - the control
    stays exactly where the constraint last left it, and the rig keeps
    the pose of a take that is no longer in the scene.

    Which is invisible until the next attach, and then arrives as a
    creeping offset on the knees and elbows. Their pole vectors are the
    one thing here placed relative to where the control already stands
    (see _poleRig), so a control left sitting on last time's pole is
    measured from there and the pole moves out again, once per attach.

    Returns how many controls had to be moved.
    """
    moved = 0
    for control, _, _, _ in boundControls(rigNs):
        clearAnimation(control)

        touched = False
        for attr in ("translate", "rotate"):
            for axis in _writable(control, attr):
                plug = "%s.%s%s" % (control, attr, axis.upper())
                default = cmds.attributeQuery(attr + axis.upper(),
                                              node=control, listDefault=True)
                value = default[0] if default else 0.0
                if abs(cmds.getAttr(plug) - value) > 1e-6:
                    cmds.setAttr(plug, value)
                    touched = True

        moved += 1 if touched else 0

    return moved


def attach(take, rigNs="", setName=MOCAP_SET):  #
    """Constrain every mapped control to its bone in the take."""
    made, missing, held = [], [], []
    cleared = 0

    for control, leaf, slot, side in boundControls(rigNs):
        name = short(control)

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
                pole, out = _poleRig(control, [take[b] for b in chain],
                                     slot.get("distance"), setName)
                con, how = _constrain(pole, control, keepOffset=False,
                                      move=True, rotate=False)
                how = "pole %.2f %s" % (out, how)
            else:
                con, how = _constrain(take[bone], control,
                                      move=mayMove(leaf))
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
         rigNs="", scale=None, progress=None):  #
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

    # Sizing goes first, before the skeletons are stood together:
    # posing writes the rig's own bone positions onto the take, and
    # after that the two skeletons measure the same and there is
    # nothing left to compare. Pass scale=1.0 to leave the take alone.
    ourLeg, theirLeg = legLengths(rig, take)
    if scale is None:
        scale = scaleFactor(rig, take)
    trouble = resize(take, scale)
    if trouble:
        cmds.warning("mocap: the take could not be scaled - %s" % trouble)
        scale = 1.0

    # Read again: sizing puts a group above the skeleton, and every one
    # of these is a full DAG path, so they all gained a step and the
    # ones taken a moment ago now name nothing.
    take = _takeJoints(namespace)

    freed = freeGeometry(namespace)

    first = firstFrame(list(take.values()))
    if frame is None:
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

        # before the take is posed to the rig, because it is posed to
        # whatever the rig is doing at that moment
        _say(progress, 0.2, "Putting the rig back to its rest pose")
        reset = restPose(rigNs)

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
    print("size      : take scaled by %.4f (leg: rig %.2f, take %.2f)"
          % (scale, ourLeg, theirLeg))
    print("adjust    : %s%s"
          % (_scaleGroupName(namespace) or "-",
             ", %s meshes freed of it" % freed if freed else ""))
    print("pre-roll  : frame %s, %s bones posed, worst gap %.4f on %s"
          % (frame, len(posed), worst, where or "-"))
    print("controls  : %s driven, %s reset, %s old curves removed"
          % (len(made), reset, cleared))
    _printList("no bone for it", missing)
    _printList("not driven", held)
    _printList("could not be posed", failed)
    print("---\n")

    # The pre-roll frame is scaffolding - it holds nothing but the
    # pose the offsets were taken from. What there is to look at is the
    # animation, so that is where this stops.
    if first is not None:
        cmds.currentTime(first)

    return {"namespace": namespace, "frame": frame, "first": first,
            "worst": worst, "scale": scale, "controls": made,
            "group": _scaleGroupName(namespace), "posed": posed,
            "missing": missing, "held": held}


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

    removed = ""
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
        # both of these were switched off for the bake, and leaving
        # them off is felt long after: no Auto Key, and every animation
        # layer deselected, with nothing to say why
        _layersBack(layers)
        _autoKeyBack(autoKey)
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


def unload(path=None, namespace=None, setName=MOCAP_SET):  #
    """Take the mocap out of the scene. Returns what went, or "".

    Three ways, because one is not enough. Matching the file path is the
    obvious one, but Maya stores a reference's path with a copy number
    on the end and may have tidied it in other ways besides, so the
    namespace is tried next - it is what the take actually occupies. And
    a take that was imported rather than referenced has no reference to
    remove at all, so what is left is deleting the nodes.
    """
    path = path if path is not None else _remembered(setName, "mocapFile")
    namespace = (namespace if namespace is not None
                 else _remembered(setName, "mocapNamespace"))

    for ref in cmds.file(q=True, reference=True) or []:
        if path and ref.replace("\\", "/").split("{")[0].lower() == path.lower():
            cmds.file(ref, removeReference=True)
            dropScaleGroups()
            return ref

    if not namespace:
        return ""

    clean = namespace.rstrip(":")
    for ref in cmds.file(q=True, reference=True) or []:
        try:
            if cmds.file(ref, q=True, namespace=True) == clean:
                cmds.file(ref, removeReference=True)
                dropScaleGroups()
                return ref
        except Exception:
            continue

    nodes = [n for n in cmds.ls(namespace + "*", long=True) or []
             if cmds.objExists(n)]
    if nodes:
        cmds.delete(nodes)
    if cmds.namespace(exists=clean):
        cmds.namespace(removeNamespace=clean, deleteNamespaceContent=True)
    dropScaleGroups()

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


def attachedRig():  #
    """The namespace of the rig a take is hanging off, None if none.

    Read from the scene rather than remembered in the window: the two
    steps are separate button presses, and between them the window can
    be closed, the module reloaded, or the scene simply left alone
    until tomorrow.
    """
    for node in cmds.ls(type="objectSet") or []:
        if short(node).split(":")[-1] == MOCAP_SET:
            return namespaceOf(node)

    return None


def transfer(path, namespace=None, skeletonRoot=None, rigNs="",
             scale=None, progress=None):  #
    """The whole job: take in, animation on the controls, take out.

    rigNs names the rig when the scene holds more than one - the prefix
    every one of its nodes carries.

    scale sizes the take to the rig, and is measured from the two
    skeletons unless it is given. 1.0 leaves the take as it comes.
    """
    loaded = load(path, namespace=namespace, skeletonRoot=skeletonRoot,
                  rigNs=rigNs, scale=scale, progress=progress)
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

# Transferring a mocap, shown rather than described. A constant rather
# than a line buried in the handler: this file is handed to animators
# on its own, and whoever hands it over may well want it pointing
# somewhere else.
TUTORIAL_URL = "https://disk.yandex.ru/i/WrlSbtqInk8brQ"

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

        # Two presses, not one. Everything worth correcting - the
        # size, where the take stands, a pelvis that does not line up -
        # is only visible once the controls are hanging off the take,
        # and by the time a single button reaches the bake it is too
        # late to correct any of it.
        self.attachButton = QtWidgets.QPushButton("Attach Mocap")
        self.attachButton.setToolTip(
            "Reference the take and hang the controls off it")
        self.attachButton.clicked.connect(self.onAttach)

        self.bakeButton = QtWidgets.QPushButton("Bake Animation")
        self.bakeButton.setToolTip(
            "Bake the take onto the controls and take the mocap out")
        self.bakeButton.clicked.connect(self.onBake)

        self.tutorialButton = QtWidgets.QPushButton("?")
        self.tutorialButton.setFixedWidth(28)
        self.tutorialButton.setToolTip("Watch the tutorial")
        self.tutorialButton.clicked.connect(self.onTutorial)

        self.cancelButton = QtWidgets.QPushButton("Cancel")
        self.cancelButton.setFixedWidth(70)
        self.cancelButton.setToolTip(
            "Take the controls off the take and remove it, baking nothing")
        self.cancelButton.clicked.connect(self.onCancel)

        buttons = QtWidgets.QHBoxLayout()
        buttons.addWidget(self.attachButton)
        buttons.addWidget(self.bakeButton)
        buttons.addWidget(self.cancelButton)
        buttons.addWidget(self.tutorialButton)
        form.addRow(buttons)

        self.sync()

    def sync(self):  #
        """Offer whichever of the two steps comes next."""
        rigNs = attachedRig()
        attached = rigNs is not None

        self.attachButton.setEnabled(not attached)
        self.bakeButton.setEnabled(attached)
        self.cancelButton.setEnabled(attached)

        if attached:
            group = _scaleGroupName(
                _remembered(rigNs + MOCAP_SET, "mocapNamespace") or "")
            where = group if group and cmds.objExists(group) else "the take"
            self.idle("Adjust %s if needed, then bake" % where)
        else:
            self.idle()

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

    def onTutorial(self):  #
        webbrowser.open(TUTORIAL_URL, new=0, autoraise=True)

    def _busy(self, busy):  #
        # the tutorial is not in here: it is the one thing worth
        # reaching for while wondering why a step did not work
        for button in (self.attachButton, self.bakeButton,
                       self.cancelButton):
            button.setEnabled(not busy)

    def onAttach(self):  #
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

        self._busy(True)
        try:
            loaded = load(path, rigNs=rigNs, progress=self.report)
        finally:
            self._busy(False)
            self._refresh(rememberFile(path))
            self.sync()

        # left selected so it can be dragged straight away: it is the
        # one node that moves the whole take, rig and all, because the
        # constraints keep their offsets
        group = (loaded or {}).get("group")
        if group and cmds.objExists(group):
            cmds.select(group)

    def onBake(self):  #
        rigNs = attachedRig()
        if rigNs is None:
            self.sync()
            return

        self._busy(True)
        try:
            bake(rigNs=rigNs, progress=self.report)
        finally:
            self._busy(False)
            self.sync()

    def onCancel(self):  #
        rigNs = attachedRig()
        if rigNs is None:
            self.sync()
            return

        # the file and the namespace live on the set, so they are read
        # before detach() takes the set away
        setName = rigNs + MOCAP_SET
        path = _remembered(setName, "mocapFile")
        namespace = _remembered(setName, "mocapNamespace")

        self._busy(True)
        try:
            detach(rigNs)
            unload(path, namespace)
            # so the rig is not left standing in the pose of a take
            # that is no longer in the scene
            restPose(rigNs)
        finally:
            self._busy(False)
            self.sync()


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
