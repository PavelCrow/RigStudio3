# Building the poser -> bone map automatically.
#
# Two passes, and the second leans on the first:
#
#   1. by rule - module type plus poser leaf name, straight out of
#      bones.POSER_SLOTS. These are the entries worth trusting.
#   2. by position - the confident pairs from pass 1 are used to fit the
#      rig onto the skeleton (uniform scale and offset), and whatever is
#      left over takes the nearest bone on its own side of the body.
#
# Pass 2 is a suggestion, not an answer. Every entry carries how it was
# arrived at, and report() prints the doubtful ones first so they get
# looked at rather than trusted.

import json
import os

import maya.cmds as cmds

from rigStudio3 import utils
from rigStudio3.metahuman import bones, scene


MAPS_DIR = os.path.join(os.path.dirname(__file__), "maps")


def _fit(pairs):  #
    """Uniform scale and offset taking rig space onto skeleton space.

    Fitted from the pairs pass 1 is sure about, which is why pass 2 has
    to run after it. Rotation is deliberately not fitted: both are Y-up
    and facing the same way, and a fitted rotation would quietly hide a
    skeleton that is not.
    """
    if len(pairs) < 3:
        return 1.0, [0.0, 0.0, 0.0], 0.0

    n = float(len(pairs))
    pBar = [sum(p[0][i] for p in pairs) / n for i in range(3)]
    bBar = [sum(p[1][i] for p in pairs) / n for i in range(3)]

    num = 0.0
    den = 0.0
    for p, b in pairs:
        for i in range(3):
            num += (p[i] - pBar[i]) * (b[i] - bBar[i])
            den += (p[i] - pBar[i]) ** 2

    scale = num / den if den > 1e-9 else 1.0
    offset = [bBar[i] - scale * pBar[i] for i in range(3)]

    worst = 0.0
    for p, b in pairs:
        d = sum((scale * p[i] + offset[i] - b[i]) ** 2 for i in range(3)) ** 0.5
        worst = max(worst, d)

    return scale, offset, worst


def _nearest(pos, candidates):  #
    best = ""
    bestDist = None
    for name, bPos in candidates.items():
        d = sum((pos[i] - bPos[i]) ** 2 for i in range(3))
        if bestDist is None or d < bestDist:
            bestDist = d
            best = name

    return best, (bestDist ** 0.5 if bestDist is not None else 0.0)


def build(skeletonRoot=None):  #
    """Work out a poser -> bone map for the rig and skeleton in the scene.

    Returns the map; save() writes it out. Nothing in the scene is
    touched.
    """
    scene.clearCache()

    joints = scene.skeleton(skeletonRoot)
    if not joints:
        cmds.warning("metahuman: no skeleton found - select the MetaHuman root")
        return {}

    bonePos = {}
    boneRole = {}
    for j in joints:
        name = scene.boneName(j)
        bonePos[name] = cmds.xform(j, q=True, ws=True, t=True)
        boneRole[name] = bones.role(name)

    entries = {}
    pairs = []
    leftovers = []

    # pass 1 - by rule
    for p in scene.posers():
        name = scene.short(p)
        module = scene.moduleOf(p)
        if not module:
            continue

        mType = scene.moduleType(module)
        side = utils.getObjectSide(module)
        leaf = scene.poserLeaf(name, module)
        table = bones.POSER_SLOTS.get(scene.slotKey(module, mType))

        if table is None:
            # a module type nobody has written rules for - the only case
            # the nearest-bone pass is still for
            leftovers.append((p, name, side))
            continue

        if leaf not in table:
            # the table covers this module type and does not mention
            # this poser, so it is one nobody moves. Not guessed at: a
            # complete table is worth more than a hopeful suggestion.
            entries[name] = {"bone": "", "match": "t", "how": "unlisted"}
            continue

        e = bones.entry(table[leaf], side)
        e["how"] = "rule"
        e["order"] = bones.rank(scene.slotKey(module, mType), leaf)

        if e.get("extend"):
            # the table names them by leaf; only here is the module
            # known, so this is where they become real poser names
            e["extend"] = ["%s_%s_poser" % (module, ref)
                           for ref in e["extend"]]

        bone = e["bone"]
        if bone and bone not in bonePos:
            e["how"] = "bone missing"
        elif bone:
            pairs.append((cmds.xform(p, q=True, ws=True, t=True), bonePos[bone]))

        if e.get("aimGround") and e["aimGround"] not in bonePos:
            del e["aimGround"]

        entries[name] = e

    scale, offset, worst = _fit(pairs)

    # pass 2 - by position, for module types with no rules at all
    for p, name, side in leftovers:
        if name.split("_")[-1] in ("mainPoser", "addPoser"):
            # moving these moves a whole module or a hand-added branch;
            # too blunt to guess at, so they are left for a human
            entries[name] = {"bone": "", "match": "t", "how": "skipped"}
            continue

        pos = cmds.xform(p, q=True, ws=True, t=True)
        fitted = [scale * pos[i] + offset[i] for i in range(3)]

        candidates = {}
        for bone, bPos in bonePos.items():
            # main bones only, minus the ones no poser belongs on: a
            # suggestion that cannot be right only invites being accepted
            if boneRole[bone] != "main" or bone in bones.NO_POSER:
                continue
            if side in ("l", "r") and bones.side(bone) not in (side, "c"):
                continue
            candidates[bone] = bPos

        bone, dist = _nearest(fitted, candidates) if candidates else ("", 0.0)
        entries[name] = {"bone": bone, "match": "t", "how": "guess",
                         "distance": round(dist, 3)}

    used = set()
    for e in entries.values():
        if e["bone"]:
            used.add(e["bone"])

    return {
        "rules": bones.fingerprint(),
        "skeletonRoot": scene.boneName(joints[0]),
        "namespace": scene.namespaceOf(joints[0]),
        "modules": scene.modules(),
        "fit": {"scale": round(scale, 5),
                "offset": [round(o, 4) for o in offset],
                "worstResidual": round(worst, 4),
                "from": len(pairs)},
        "posers": entries,
        "unmappedBones": sorted(b for b in bonePos
                                if b not in used and boneRole[b] == "main"),
    }


def report(data):  #
    """Print the map so the guesses can be checked before anything moves."""
    if not data:
        return

    print("\n--- metahuman poser map ---")

    # Worst first: a rule pointing at a bone that is not in the scene
    # means the map and the skeleton disagree and everything below it is
    # beside the point. The posers nobody moves come last.
    order = {"bone missing": 0, "skipped": 1, "guess": 2, "manual": 3,
             "rule": 4, "unlisted": 5}
    entries = sorted(data["posers"].items(),
                     key=lambda kv: (order.get(kv[1]["how"], 9), kv[0]))

    # The fit only ever feeds the nearest-bone pass, so it is worth
    # reading only when that pass produced something. Printed
    # unconditionally it just invites worry about a residual that
    # nothing depends on.
    if any(e["how"] == "guess" for _, e in entries):
        fit = data.get("fit", {})
        print("fit: scale %s, offset %s, worst residual %s (from %s rule pairs)"
              % (fit.get("scale"), fit.get("offset"), fit.get("worstResidual"),
                 fit.get("from")))

    # The posers nobody moves are counted rather than listed - on a full
    # body that is half of them, and a wall of dashes hides the entries
    # that do need reading.
    unlisted = 0
    for name, e in entries:
        if e["how"] == "unlisted":
            unlisted += 1
            continue

        note = ""
        if e["how"] == "guess":
            note = "   <- check (%s away)" % e.get("distance")
        elif e["how"] == "bone missing":
            note = "   <- the rule names a bone this skeleton has not got"
        elif e["how"] == "skipped":
            note = "   <- no rule, left alone"
        elif not e["bone"] and not e.get("local") and not e.get("extend"):
            note = "   <- left alone on purpose"

        extra = ""
        if e.get("ground"):
            extra += " +ground"
        if e.get("aimGround"):
            extra += " +aim(%s)" % e["aimGround"]
        if e.get("match") == "tr":
            extra += " +rotation"
        if e.get("worldOrient"):
            extra += " +world orientation"
        if e.get("turn"):
            extra += " +turn(%s)" % ", ".join(str(v) for v in e["turn"])
        if e.get("local"):
            extra += " +local(%s)" % ", ".join(
                "%s=%s" % (a, e["local"][a]) for a in sorted(e["local"]))
        if e.get("extend"):
            extra += " +extend(%s)" % " -> ".join(e["extend"])

        print("  %-40s %-24s %s%s%s"
              % (name, e["bone"] or "-", e["how"], extra, note))

    if unlisted:
        print("  ... plus %s posers the table does not move" % unlisted)

    missing = data.get("unmappedBones", [])
    if missing:
        print("\nbones with no poser (%s) - not driven by the rig; they "
              "ride their parent bone as they stand:" % len(missing))
        print("  " + ", ".join(missing))
    print("--- %s posers ---\n" % len(data["posers"]))


def path(name="metahuman"):  #
    return os.path.join(MAPS_DIR, name + ".json")


def save(data, name="metahuman"):  #
    if not os.path.isdir(MAPS_DIR):
        os.makedirs(MAPS_DIR)

    out = path(name)
    with open(out, "w") as f:
        json.dump(data, f, indent=2, sort_keys=True)

    print("metahuman: map saved -> %s" % out)

    return out


def load(name="metahuman"):  #
    src = path(name)
    if not os.path.exists(src):
        cmds.warning("metahuman: no map called '%s' in %s" % (name, MAPS_DIR))
        return {}

    with open(src) as f:
        return json.load(f)


def pick(name="metahuman", match=None):  #
    """Fix one entry by hand: select the poser and the bone, run this.

    Either order - the poser is the one whose name ends in 'poser'. Pass
    match="tr" to place that poser by rotation as well as position.

    Selecting a poser on its own clears its entry, which is how a poser
    is told to stay where it is.
    """
    sel = cmds.ls(sl=True, long=True)
    if not sel or len(sel) > 2:
        cmds.warning("metahuman: select a poser, and the bone it belongs on")
        return {}

    poser = ""
    bone = ""
    for node in sel:
        if scene.short(node).split("_")[-1] in scene.POSER_SUFFIXES:
            poser = scene.short(node)
        else:
            bone = scene.boneName(node)

    if not poser:
        cmds.warning("metahuman: no poser in the selection")
        return {}

    data = load(name)
    if not data:
        return {}

    entry = data["posers"].setdefault(poser, {"bone": "", "match": "t"})
    entry["bone"] = bone
    entry["how"] = "manual"
    entry.pop("distance", None)
    if match:
        entry["match"] = match

    save(data, name)
    print("metahuman: %s -> %s" % (poser, bone or "(cleared)"))

    return data


def run(name="metahuman", skeletonRoot=None):  #
    """Guess the map, print it, save it. Nothing in the scene moves.

        from rigStudio3 import metahuman
        metahuman.guessMap()
    """
    data = build(skeletonRoot)
    if not data:
        return {}

    report(data)
    save(data, name)

    return data
