# The MetaHuman body skeleton, as far as this package needs to know it.
#
# Every MetaHuman shares these bone names, which is the whole reason the
# maps are worth writing: built once against a rig template, they fit any
# character built on that template.
#
# Only the main chain is listed. The body also carries a crowd of
# corrective bones (clavicle_out_l, upperarm_fwd_l, wrist_inner_l,
# calf_knee_l ...) and the twist bones; none of them get a poser of their
# own. They are handled by rule instead of by name - see role() below and
# bind.py, which hands an unmapped bone to whatever drives its nearest
# mapped ancestor, so the correctives keep riding the bone they belong to.

import hashlib
import json
import re


# slot -> the joint the rig grows there. Used to pair bones with posers.
SPINE = ["pelvis", "spine_01", "spine_02", "spine_03", "spine_04", "spine_05"]
NECK = ["neck_01", "neck_02", "head"]
ARM = ["clavicle", "upperarm", "lowerarm", "hand"]
LEG = ["thigh", "calf", "foot", "ball"]

FINGERS = ["thumb", "index", "middle", "ring", "pinky"]
TOES = ["bigtoe", "indextoe", "middletoe", "ringtoe", "littletoe"]

# Bones that exist in the scene but never take a poser.
TWIST_RE = re.compile(r"_twist_\d+_[lr]$")
IK_RE = re.compile(r"^ik_")

# The corrective bones are not enumerated - they are recognised by not
# being anything else, which is deliberate: MetaHuman keeps adding them.
#
# NO_POSER holds bones that are real animation joints but that no poser
# should ever land on. The toes are the case: the foot module stops at
# the ball, so offering bigtoe_01_l as a match would only tempt the
# nearest-bone pass into a wrong answer. They still count as main, so
# the report can say plainly that the rig does not reach them.
MAIN = set()
NO_POSER = set()
for b in SPINE + NECK:
    MAIN.add(b)
for side in ("l", "r"):
    for b in ARM + LEG:
        MAIN.add("%s_%s" % (b, side))
    for f in FINGERS:
        if f != "thumb":
            MAIN.add("%s_metacarpal_%s" % (f, side))
        for i in (1, 2, 3):
            MAIN.add("%s_0%s_%s" % (f, i, side))
    for t in TOES:
        for i in (1, 2):
            NO_POSER.add("%s_0%s_%s" % (t, i, side))
MAIN.add("root")
MAIN |= NO_POSER


def side(bone):  #
    """'l', 'r' or 'c' for a bone name."""
    if bone.endswith("_l"):
        return "l"
    if bone.endswith("_r"):
        return "r"
    return "c"


def role(bone):  #
    """What kind of bone this is: main, twist, ik or corrective."""
    if bone in MAIN:
        return "main"
    if TWIST_RE.search(bone):
        return "twist"
    if IK_RE.match(bone):
        return "ik"
    return "corrective"


def twistParent(bone):  #
    """upperarm_twist_01_l -> upperarm_l, or None if not a twist bone."""
    if not TWIST_RE.search(bone):
        return None

    return "%s_%s" % (bone.split("_twist_")[0], side(bone))


# Which MetaHuman bone a poser lands on, keyed by the module type it
# belongs to and the poser's own leaf name. Side is filled in from the
# module name, so 'upperarm' below becomes 'upperarm_l' on a left module.
#
# This table is the rigger's, not a guess: it says which posers are
# actually moved by hand when fitting this rig, and those turn out to be
# mostly the mainPosers rather than the root posers. A poser that is
# driven by the rig - a limb's end poser is point-constrained to the
# child module's root - is listed as "" so it is left alone knowingly
# rather than falling through to the nearest-bone pass.
#
# An entry is either a bone slot, or a dict for the awkward ones:
#
#   bone         the slot, before the side is added
#   match        "t" (default) places, "tr" places and orients to the bone
#   worldOrient  zero the world rotation instead: axes along the world's
#   turn         degrees about the poser's own axes, applied last of all
#                - after any orienting and aiming - for where the rig's
#                axis convention is a flip away from the bone's
#   extend       ["leafA", "leafB"] - carry on past two posers of the
#                same module: leafB plus the step from leafA to leafB.
#                For the finger tips, which belong on the end of the
#                chain the rig actually built rather than on anything
#                MetaHuman has. Measured from the posers, not the bones,
#                so the tip stays in the plane the module keeps the
#                finger in. Such an entry has no bone.
#   local        {"Z": 1.0} - translate channels set to a fixed number,
#                written after any bone placement and overriding it. For
#                posers that answer to the rig's own geometry rather
#                than to a bone; such an entry may have no bone at all
#   ground       put it on the floor: keep x and z, force world y to 0
#   aimGround    turn it around Y until its own Z axis lines up with that
#                bone's Y axis flattened onto the ground
POSER_SLOTS = {
    "root": {
        "main": "",
        "root": "",
    },
    "spine": {
        "main": "pelvis",
        "local_1": "spine_01",
        "local_2": "spine_02",
        "local_3": "spine_03",
        "end": "spine_04",
        "neck": "neck_01",
        "neck_2": "neck_02",
        "root": "",
    },
    "head": {
        "main": "head",
        "root": "",
    },
    "point": {
        "main": {"bone": "clavicle", "match": "tr", "turn": [90, 0, 0]},
        "root": "",
    },
    "limb@arm": {
        "main": {"bone": "upperarm", "worldOrient": True},
        "middle": "lowerarm",
        "root": "",
        # point-constrained to the fingers module's root poser
        "end": "",
    },
    "limb@leg": {
        "main": "thigh",
        "middle": "calf",
        "root": "",
        # point-constrained to the foot module's root poser
        "end": "",
    },
    # The foot's mainPoser is the odd one: it belongs under the ball but
    # standing on the ground, and turned to face the way the foot points.
    "foot": {
        # aiming lines Z up with the foot, but the wrong way round, so
        # the turn puts it back - it runs after the aim
        "main": {"bone": "ball", "ground": True, "aimGround": "foot",
                 "turn": [0, 180, 0]},
        "root": "foot",
        "toe": "ball",
        # its X and Y are the module's business - only Z is free, and a
        # fixed step forward is what it wants
        "toeTip": {"local": {"Z": 1.0}},
        "bankIn": "",
        "bankOut": "",
        "heelPoint": "",
    },
    "fingers": {
        # the hand poser's axes run the opposite way to the bone's
        "main": {"bone": "hand", "match": "tr", "turn": [180, 0, 0]},
        "root": "",
        # The thumb has no metacarpal in MetaHuman's chain, so its
        # mainPoser takes thumb_01 and there is no Root poser to place.
        "thumbFinger": {"bone": "thumb_01", "match": "tr",
                        "turn": [180, 0, 0]},
        "thumbFingerA": "",
        "thumbFingerB": "thumb_02",
        "thumbFingerC": "thumb_03",
        "thumbFingerD": {"extend": ["thumbFingerB", "thumbFingerC"]},
    },
}

# footSimple lays its posers out exactly like foot.
POSER_SLOTS["footSimple"] = POSER_SLOTS["foot"]

# The four fingers all work the same way: the Root poser takes the
# metacarpal, the finger's own mainPoser takes the first phalanx and
# carries its orientation, and A is left alone because the mainPoser
# already sits there.
for _f in ("index", "middle", "ring", "pinky"):
    _slots = POSER_SLOTS["fingers"]
    _slots["%sFingerRoot" % _f] = "%s_metacarpal" % _f
    _slots["%sFinger" % _f] = {"bone": "%s_01" % _f, "match": "tr",
                               "turn": [180, 0, 0]}
    _slots["%sFingerA" % _f] = ""
    _slots["%sFingerB" % _f] = "%s_02" % _f
    _slots["%sFingerC" % _f] = "%s_03" % _f
    _slots["%sFingerD" % _f] = {"extend": ["%sFingerB" % _f,
                                           "%sFingerC" % _f]}


def sided(slot, moduleSide):  #
    """'upperarm' + 'l' -> 'upperarm_l'. Centre slots are left alone."""
    if not slot:
        return slot

    prefix, _, bone = slot.partition(":")
    if not bone:
        prefix, bone = "", slot

    if bone in SPINE or bone in NECK or bone == "root":
        out = bone
    elif moduleSide in ("l", "r"):
        out = "%s_%s" % (bone, moduleSide)
    else:
        out = bone

    return "%s:%s" % (prefix, out) if prefix else out


def entry(slot, moduleSide):  #
    """One POSER_SLOTS value -> the dict the map stores.

    Accepts either form in the table, so the plain cases stay readable
    and only the awkward ones carry the extra keys.
    """
    if not slot:
        return {"bone": "", "match": "t"}

    if not isinstance(slot, dict):
        return {"bone": sided(slot, moduleSide), "match": "t"}

    out = {"bone": sided(slot.get("bone", ""), moduleSide),
           "match": slot.get("match", "t")}
    for flag in ("ground", "worldOrient"):
        if slot.get(flag):
            out[flag] = True
    if slot.get("aimGround"):
        out["aimGround"] = sided(slot["aimGround"], moduleSide)
    if slot.get("turn"):
        out["turn"] = list(slot["turn"])
    if slot.get("local"):
        out["local"] = dict(slot["local"])
    if slot.get("extend"):
        # leaf names, not bones - guess.py turns them into poser names,
        # since only it knows which module this entry came from
        out["extend"] = list(slot["extend"])

    return out


# The order posers have to be placed in, which is not the order they sit
# in the hierarchy: the ends of a chain go first and the middle after.
#
# The elbow follows the hand and the knee follows the foot because the
# limb's end poser is point-constrained to the child module's root, so
# the hand has to be standing where it belongs before the elbow can be
# judged. The lumbar posers follow spine_end for the same reason - they
# distribute themselves between the root and the end.
#
# Anything not listed keeps its hierarchy order, which is a safe default
# for a chain with no such crossing dependencies.
PLACE_ORDER = [
    ("spine", "main"),
    ("spine", "end"),
    ("spine", "local_1"),
    ("spine", "local_2"),
    ("spine", "local_3"),
    ("spine", "neck"),
    ("spine", "neck_2"),
    ("head", "main"),

    ("point", "main"),
    ("limb@arm", "main"),
    ("fingers", "main"),
    ("limb@arm", "middle"),

    ("limb@leg", "main"),
    ("foot", "main"),
    ("limb@leg", "middle"),

    ("foot", "root"),
    ("foot", "toe"),
    ("foot", "toeTip"),
]

# Each finger: its root, then its own mainPoser, then along the chain.
for _f in ("thumb", "index", "middle", "ring", "pinky"):
    if _f != "thumb":
        PLACE_ORDER.append(("fingers", "%sFingerRoot" % _f))
    PLACE_ORDER.append(("fingers", "%sFinger" % _f))
    for _p in ("B", "C", "D"):
        PLACE_ORDER.append(("fingers", "%sFinger%s" % (_f, _p)))

_RANKS = {pair: i for i, pair in enumerate(PLACE_ORDER)}

# A poser with no place in that list goes after everything that has one.
UNRANKED = len(PLACE_ORDER)


def tableKey(slotKey):  #
    """footSimple and foot share their table, and their order with it."""
    return "foot" if slotKey == "footSimple" else slotKey


def rank(slotKey, leaf):  #
    return _RANKS.get((tableKey(slotKey), leaf), UNRANKED)


def fingerprint():  #
    """A short hash of the rules above.

    Stored in every map and checked when one is used, so a map written
    before a rule changed says so instead of quietly placing posers by
    the old table - or, worse, by no order at all.
    """
    payload = json.dumps({"slots": POSER_SLOTS,
                          "order": [list(pair) for pair in PLACE_ORDER]},
                         sort_keys=True)

    return hashlib.md5(payload.encode("utf-8")).hexdigest()[:12]


# Rig joints that carry a parameter sliding them along their own chain,
# and the bone each should end up on. The spine is the case: its joints
# ride a surface, each pinned at its own U ('pos'), and the rig spaces
# them evenly while MetaHuman does not - so every spine bone ends up
# driven by a joint slightly off it, which the skinning shows.
#
# Keyed like POSER_SLOTS - module type, then the part of the joint name
# between the module and '_outJoint'. slide.py solves each parameter
# numerically, so nothing here needs to know how the module builds it.
#
# 'attr' defaults to 'pos'.
JOINT_SLIDES = {
    "spine": {
        "local_1": {"bone": "spine_01"},
        "local_2": {"bone": "spine_02"},
        "local_3": {"bone": "spine_03"},
    },
    # The twist joints carry 'pos' on their skinJoint, not an outJoint,
    # and it drives both where the joint sits on the curve and how much
    # of the twist it takes - so sliding one moves both together.
    #
    # Watch the numbering: MetaHuman counts the upper arm and the thigh
    # away from the body, but the forearm and the shin back from the
    # wrist and the ankle. Measured along the segment, lowerarm_twist_02
    # is the one near the elbow and _01 the one near the wrist, so those
    # two pair the other way round. Pairing by number instead of by
    # position would put every forearm twist on the wrong joint.
    "limb@arm": {
        "root_twist_0": {"bone": "upperarm_twist_01", "joint": "skinJoint"},
        "root_twist_1": {"bone": "upperarm_twist_02", "joint": "skinJoint"},
        "middle_twist_0": {"bone": "lowerarm_twist_02", "joint": "skinJoint"},
        "middle_twist_1": {"bone": "lowerarm_twist_01", "joint": "skinJoint"},
    },
    "limb@leg": {
        "root_twist_0": {"bone": "thigh_twist_01", "joint": "skinJoint"},
        "root_twist_1": {"bone": "thigh_twist_02", "joint": "skinJoint"},
        "middle_twist_0": {"bone": "calf_twist_02", "joint": "skinJoint"},
        "middle_twist_1": {"bone": "calf_twist_01", "joint": "skinJoint"},
    },
}


# Bones whose rotation is better derived than copied.
#
# A parentConstraint hands the bone its driver's rotation, offset and
# all. The rig's spine joints ride a surface and MetaHuman's do not, so
# their axes differ, and the difference gets frozen into the offset and
# shows up in the skinning as the spine bends. The spine is bound by a
# point plus an aim instead: the position from the same driver, the
# direction from the next joint along the rig's own chain, so the bone
# follows the chain rather than one joint's private orientation.
#
#   aim          what to look at. A leaf name is resolved inside the
#                module that owns the driver - 'local_2' on a driver of
#                spine_local_1_skinJoint becomes spine_local_2_outJoint
#                - so nothing here depends on the module being called
#                'spine'. A name that already ends in a joint suffix is
#                used as it stands.
#   aimVector    the bone's own axis that ends up pointing at it
#   upVector     the bone's axis lined up with the up direction
#   worldUp      the up direction, read in the driver's own space -
#                aimConstraint's worldUpType 2, "objectrotation". The up
#                object is always the joint doing the point, so it is
#                not listed here.
# Empty now. The spine used to be here: its joints ride a surface and
# their axes were not the bones', so a point plus an aim reproduced the
# chain better than a parentConstraint could. That stopped being true
# once each spine bone was paired with the joint one lower down - the
# joint it now has carries its own axes, and a plain parentConstraint
# says the same thing more simply. The mechanism is kept because the
# next awkward chain may want it.
AIM_BINDS = {}

AIM_DEFAULTS = {
    "aimVector": [1.0, 0.0, 0.0],
    "upVector": [0.0, 1.0, 0.0],
    "worldUp": [0.0, 1.0, 0.0],
}


def aimBind(bone):  #
    """The aim settings for a bone, or None if it binds the plain way."""
    entry = AIM_BINDS.get(bone)
    if not entry:
        return None

    out = dict(AIM_DEFAULTS)
    out.update(entry)

    return out


# The control-to-bone table for a mocap used to live here. It moved
# to animTools/mocapTransfer.py, which is self-contained so it can
# be handed to an animator on its own - and keeping a second copy
# here would only let the two drift apart.

# Bones whose driver is named outright instead of being measured.
#
# Measuring is right almost everywhere, but the wrist is crowded: the
# arm's own end joint and the fingers module's root joint both sit on
# hand_l, within a hair of each other, and which one the nearest-first
# pass hands out can differ between the two sides. The fingers root is
# the one that belongs there - the hand skins to it - so it is said
# rather than hoped for.
#
# Keyed by the unsided bone slot, valued by (module type, joint leaf).
# The side comes from the bone, and the module name from whichever
# module of that type sits on that side, so nothing here depends on
# what the modules are called.
# A value is either (module type, joint leaf), which becomes
# <module>_<leaf>_skinJoint on the bone's own side, or a plain node name
# taken as it stands - the chest control is not a skin joint and carries
# no module prefix, so nothing here could build its name for it.
DRIVER_BINDS = {
    "hand": ("fingers", "root"),

    # The spine is named rather than measured now that its module has
    # fewer joints than MetaHuman has bones: nearest-first would leave
    # one bone to take a neighbour's joint, and which one differs
    # between rigs.
    "spine_01": ("spine", "local_1"),
    "spine_02": ("spine", "local_2"),
    "spine_03": ("spine", "local_3"),
    "spine_04": "chest",
}
