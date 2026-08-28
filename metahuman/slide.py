# Sliding rig joints along their own parameter onto the bones.
#
# Placing the posers settles where a chain starts and ends, but not how
# the joints in between are spread along it. The spine is the case: its
# joints ride a surface, each pinned at its own U (the 'pos' attribute),
# and the rig spaces them evenly while MetaHuman does not. Evenly spaced
# is not wrong, but it means every spine bone is driven by a joint a
# little off from it, and the skinning shows it.
#
# So the parameter is solved for rather than derived: set it, measure
# how far the joint landed from the bone, and search for the value that
# makes that smallest. The parameter is one-dimensional and moves the
# joint monotonically along the chain, which is what makes a search the
# simple answer here - no need to know anything about the surface, the
# pin, or how the module builds either.
#
# Run this after placePosers and before bindSkeleton: it needs the rig
# already standing on the skeleton, and binding should measure its
# drivers after the joints have stopped moving.

import maya.cmds as cmds

from rigStudio3 import utils
from rigStudio3.metahuman import bones, guess, scene


# How the search is spent: a coarse sweep to find which part of the
# range holds the answer, then a narrowing search inside it. The sweep
# is what stops a local dip somewhere else in the range from being
# mistaken for the best one.
COARSE = 40
REFINE = 25


def _distance(a, b):
    return sum((a[i] - b[i]) ** 2 for i in range(3)) ** 0.5


def _range(plug):  #
    """The attribute's own limits, or 0..1 when it has none."""
    node, attr = plug.split(".")

    lo = cmds.attributeQuery(attr, node=node, minimum=True) \
        if cmds.attributeQuery(attr, node=node, minExists=True) else [0.0]
    hi = cmds.attributeQuery(attr, node=node, maximum=True) \
        if cmds.attributeQuery(attr, node=node, maxExists=True) else [1.0]

    return lo[0], hi[0]


def _at(joint, plug, value, target):  #
    cmds.setAttr(plug, value)

    return _distance(cmds.xform(joint, q=True, ws=True, t=True), target)


def _solve(joint, plug, target, lo, hi):  #
    """The value of plug that puts joint closest to target."""
    best, bestD = lo, None
    for i in range(COARSE + 1):
        v = lo + (hi - lo) * i / float(COARSE)
        d = _at(joint, plug, v, target)
        if bestD is None or d < bestD:
            best, bestD = v, d

    step = (hi - lo) / float(COARSE)
    a, b = max(lo, best - step), min(hi, best + step)

    for _ in range(REFINE):
        m1 = a + (b - a) / 3.0
        m2 = b - (b - a) / 3.0
        if _at(joint, plug, m1, target) < _at(joint, plug, m2, target):
            b = m2
        else:
            a = m1

    value = (a + b) / 2.0

    return value, _at(joint, plug, value, target)


def run(skeletonRoot=None, dryRun=False, name="metahuman"):  #
    """Slide every listed rig joint onto its bone.

        from rigStudio3 import metahuman
        metahuman.slideJoints(dryRun=True)   # say what would change
        metahuman.slideJoints()

    Between placePosers and bindSkeleton: the rig has to be standing on
    the skeleton already, and binding should come after the joints have
    settled.
    """
    data = guess.load(name) if isinstance(name, str) else name
    namespace = scene.resolveNamespace(data or {}, skeletonRoot)
    if not namespace:
        print("metahuman: nothing slid")
        return {}

    moved, missing, mirrored = [], [], []

    cmds.undoInfo(openChunk=True, chunkName="metahuman: slide joints")
    try:
        for module, mType in sorted(scene.modules().items()):
            table = bones.JOINT_SLIDES.get(scene.slotKey(module, mType))
            if not table:
                continue

            # The right side is driven from the left, the same way the
            # posers are: the twist attributes are connected across, so
            # setting the left one carries both.
            if utils.objectIsOpposite(module + "_mod"):
                mirrored.append(module)
                continue

            side = "l" if module.startswith("l_") else \
                   "r" if module.startswith("r_") else "c"

            for leaf in sorted(table):
                entry = table[leaf]
                joint = "%s_%s_%s" % (module, leaf,
                                      entry.get("joint", "outJoint"))
                plug = "%s.%s" % (joint, entry.get("attr", "pos"))
                bone = namespace + bones.sided(entry["bone"], side)

                if not cmds.objExists(joint) or not cmds.objExists(plug):
                    missing.append("%s (no joint or no attribute)" % joint)
                    continue
                if not cmds.objExists(bone):
                    missing.append("%s (no bone %s)" % (joint, bone))
                    continue
                if cmds.getAttr(plug, lock=True) or cmds.listConnections(
                        plug, source=True, destination=False):
                    missing.append("%s (%s is held)" % (joint, plug))
                    continue

                target = cmds.xform(bone, q=True, ws=True, t=True)
                before = cmds.getAttr(plug)
                wasAt = _distance(cmds.xform(joint, q=True, ws=True, t=True),
                                  target)

                lo, hi = _range(plug)
                value, after = _solve(joint, plug, target, lo, hi)

                if dryRun:
                    cmds.setAttr(plug, before)

                moved.append("%-34s %.4f -> %.4f   %6.3f -> %6.3f"
                             % (plug, before, value, wasAt, after))
    finally:
        cmds.undoInfo(closeChunk=True)

    print("\n--- metahuman: %s ---"
          % ("slide dry run" if dryRun else "joints slid"))
    print("%-34s %-18s %s" % ("attribute", "value", "distance to bone"))
    for line in moved:
        print("  " + line)
    if mirrored:
        print("mirrored, carried by the left side (%s): %s"
              % (len(mirrored), ", ".join(sorted(mirrored))))
    if missing:
        print("skipped (%s):" % len(missing))
        for line in missing:
            print("    " + line)
    print("---\n")

    return {"slid": moved, "skipped": missing,
            "mirrored": mirrored}
