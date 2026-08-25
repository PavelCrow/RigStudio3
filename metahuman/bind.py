# Driving the MetaHuman skeleton from the rig.
#
# Every bone gets a parentConstraint from the rig joint standing in its
# place, with maintainOffset on. The offset does real work: the rig and
# the MetaHuman skeleton do not share a joint orientation convention, and
# mo=True absorbs exactly that difference while leaving the skeleton's
# rest pose untouched - which is what matters if it is going back to
# Unreal.
#
# The drivers are found by measurement, not by name. Once the posers are
# placed, the modules have grown their joints where the posers stood, so
# each bone simply has a rig joint sitting on it - on the rig this was
# written for, 34 of 37 body bones matched to within a thousandth of a
# unit. Names would have to be maintained per template and would still
# be guesses; positions are the answer the rig itself gives. It does
# mean binding has to run AFTER the rig is fitted, and a rig that is not
# fitted shows up as a page of large distances rather than as a wrong
# result quietly applied.
#
# Three things keep the measurement honest:
#
#   one to one   a joint drives at most one bone, so a bone the rig has
#                no joint for cannot steal its neighbour's.
#   a limit      a match further off than LIMIT of the skeleton's height
#                is not a match. neck_01 is the case: the rig has one
#                neck joint, neck_02 takes it, and neck_01 stays free.
#   sides        a left bone only ever looks at left or centre joints.
#
# Scope is the main body. The twist bones, the hundreds of correctives
# and the whole face are left alone, because a plugin drives those. The
# twist rule is still written out, behind twists=True, because "the
# plugin does it" is a decision that may not hold forever.
#
# Everything created is collected in a set, so detach() can find and
# remove it without guessing.

import maya.cmds as cmds

from rigStudio3 import utils
from rigStudio3.metahuman import bones, guess, scene


BIND_SET = "metahuman_bindSet"

# How far a joint may be from a bone and still be taken for it, as a
# fraction of the skeleton's height. On the rig this was written for,
# real matches ran to 1.5% and the first false one to 12.9%, so 5% sits
# clear of both.
LIMIT = 0.05


def _distance(a, b):  #
    return sum((a[i] - b[i]) ** 2 for i in range(3)) ** 0.5


def _side(name):  #
    """'l', 'r' or 'c', for a bone name or a rig joint name.

    The two name their sides at opposite ends - 'upperarm_l' against
    'l_arm_root_skinJoint' - so both forms are read here.
    """
    if name.startswith("l_") or name.endswith("_l"):
        return "l"
    if name.startswith("r_") or name.endswith("_r"):
        return "r"

    return "c"


def _candidates(twists):  #
    """{rig joint: world position} for the joints that may drive a bone.

    The inbetween joints are never drivers - they are the rig's own
    corrective machinery, and MetaHuman has its own. The twist joints
    join in only when the twist bones do.
    """
    out = {}
    for j in scene.rigJoints():
        name = scene.short(j)
        if "_ibtw_" in name:
            continue
        if not twists and "_twist_" in name:
            continue
        out[name] = cmds.xform(j, q=True, ws=True, t=True)

    return out


def _targets(joints, twists):  #
    """{bone: world position} for the bones the rig is meant to drive."""
    out = {}
    for j in joints:
        bone = scene.boneName(j)
        role = bones.role(bone)

        if role == "main" and bone not in bones.NO_POSER:
            out[bone] = cmds.xform(j, q=True, ws=True, t=True)
        elif role == "twist" and twists:
            out[bone] = cmds.xform(j, q=True, ws=True, t=True)

    return out


def _height(positions):  #
    ys = [p[1] for p in positions]

    return (max(ys) - min(ys)) if ys else 0.0


def _match(targets, candidates, limit):  #
    """Pair each bone with a rig joint: nearest first, one joint each.

    Working from the closest pair outwards rather than bone by bone is
    what makes it safe. A bone with no joint of its own would otherwise
    take whatever was nearest and drag a neighbour's driver away with
    it; here the neighbour has already claimed it.
    """
    pairs = []
    for bone, bPos in targets.items():
        bSide = _side(bone)
        for joint, jPos in candidates.items():
            jSide = _side(joint)
            if bSide == "c" and jSide != "c":
                continue
            if bSide != "c" and jSide not in (bSide, "c"):
                continue

            d = _distance(bPos, jPos)
            if d <= limit:
                pairs.append((d, bone, joint))

    pairs.sort()

    out = {}
    used = set()
    for d, bone, joint in pairs:
        if bone in out or joint in used:
            continue
        out[bone] = (joint, d)
        used.add(joint)

    return out


def _isConstrained(node):  #
    """Already driven by a constraint?

    utils.getConstraint is not used here on purpose: it returns the
    tuple (None, None) when there is nothing, which reads as true, and
    it trips over a joint with no children at all - which every leaf
    bone of the skeleton is.
    """
    for child in cmds.listRelatives(node, children=True, fullPath=True) or []:
        if cmds.objectType(child).endswith("Constraint"):
            return True

    return False


def plan(skeletonRoot=None, twists=False):  #
    """Work out which rig joint drives which bone. Touches nothing.

    Returns {bone: (driver, distance)} and the list of bones that found
    nothing close enough, so the whole thing can be read before a single
    constraint exists.
    """
    joints = scene.skeleton(skeletonRoot)
    if not joints:
        cmds.warning("metahuman: no skeleton found - select the MetaHuman")
        return {}, []

    targets = _targets(joints, twists)
    candidates = _candidates(twists)
    if not candidates:
        cmds.warning("metahuman: the rig has no skin joints - build it first")
        return {}, []

    limit = _height(list(targets.values())) * LIMIT
    matched = _match(targets, candidates, limit)
    missed = sorted(b for b in targets if b not in matched)

    return matched, missed


def report(matched, missed):  #
    """Print the plan, the least certain matches first."""
    print("\n--- metahuman bind plan ---")

    for bone in sorted(matched, key=lambda b: -matched[b][1]):
        joint, d = matched[bone]
        print("  %-24s <- %-40s %6.3f" % (bone, joint, d))

    if missed:
        print("\nno joint close enough (%s) - left free, they ride their "
              "parent bone as they stand:" % len(missed))
        print("  " + ", ".join(missed))

    print("--- %s bones driven ---\n" % len(matched))


def run(skeletonRoot=None, dryRun=False, twists=False, scaleToo=False,
        name="metahuman"):  #
    """Constrain the main body bones of the MetaHuman skeleton to the rig.

        from rigStudio3 import metahuman
        metahuman.bindSkeleton(dryRun=True)   # read the plan first
        metahuman.bindSkeleton()

    Run this after the posers are placed and the rig is built: the
    drivers are found from where things are standing at the time, and
    the offsets are measured from there too.

    The twist and corrective bones are left free - a plugin drives
    those. twists=True takes the twists back.
    """
    data = guess.load(name) if isinstance(name, str) else name
    namespace = scene.resolveNamespace(data or {}, skeletonRoot)
    if not namespace:
        print("metahuman: nothing constrained")
        return {}

    matched, missed = plan(skeletonRoot, twists)
    if not matched:
        return {}

    report(matched, missed)
    if dryRun:
        return {"matched": matched, "missed": missed}

    if not cmds.objExists(BIND_SET):
        cmds.sets(empty=True, n=BIND_SET)

    made, already, failed = [], [], []

    cmds.undoInfo(openChunk=True, chunkName="metahuman: bind skeleton")
    try:
        for bone in sorted(matched):
            driver = matched[bone][0]
            target = namespace + bone
            if not cmds.objExists(target):
                failed.append("%s (not in the scene)" % bone)
                continue

            if _isConstrained(target):
                already.append(bone)
                continue

            try:
                con = cmds.parentConstraint(driver, target, mo=True)[0]
                cmds.sets(con, add=BIND_SET)
                if scaleToo:
                    sCon = cmds.scaleConstraint(driver, target, mo=True)[0]
                    cmds.sets(sCon, add=BIND_SET)
                made.append(bone)
            except Exception as e:
                failed.append("%s (%s)" % (bone, e))
    finally:
        cmds.undoInfo(closeChunk=True)

    print("metahuman: constrained %s bones, %s already had a constraint"
          % (len(made), len(already)))
    if failed:
        print("failed (%s):" % len(failed))
        for line in failed:
            print("    " + line)

    return {"constrained": made, "already": already, "failed": failed,
            "missed": missed}


def status(skeletonRoot=None):  #
    """What is driving each main body bone right now, in the scene.

        metahuman.bindStatus()

    Reads the constraints themselves rather than the last plan, so it
    answers the question that matters after a run: what actually stuck.
    """
    joints = scene.skeleton(skeletonRoot)
    if not joints:
        cmds.warning("metahuman: no skeleton found - select the MetaHuman")
        return {}

    out = {}
    free = []
    for j in joints:
        bone = scene.boneName(j)
        if bones.role(bone) != "main" or bone in bones.NO_POSER:
            continue

        driver = ""
        for child in cmds.listRelatives(j, children=True, fullPath=True) or []:
            if not cmds.objectType(child).endswith("Constraint"):
                continue
            targets = cmds.parentConstraint(child, q=True, targetList=True) or []
            driver = targets[0] if targets else scene.short(child)
            break

        out[bone] = driver
        if not driver:
            free.append(bone)

    print("\n--- metahuman bind status ---")
    for bone in sorted(out):
        print("  %-24s %s" % (bone, out[bone] or "FREE"))
    print("driven %s, free %s" % (len(out) - len(free), len(free)))
    if free:
        print("free: " + ", ".join(free))
    print("---\n")

    return out


def detach():  #
    """Remove everything run() created, leaving the skeleton free again."""
    if not cmds.objExists(BIND_SET):
        print("metahuman: nothing to detach")
        return 0

    nodes = [n for n in utils.getSetObjects(BIND_SET) if cmds.objExists(n)]
    if nodes:
        cmds.delete(nodes)

    # Checked again rather than assumed: Maya takes the set away with
    # its last member, so by now it may well be gone already.
    if cmds.objExists(BIND_SET):
        cmds.delete(BIND_SET)

    print("metahuman: detached %s constraints" % len(nodes))

    return len(nodes)
