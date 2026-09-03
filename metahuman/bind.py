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
# Not every bone is held the same way:
#
#   most         a parentConstraint, position and rotation together.
#   the spine    a point plus an aim, because the rig's spine joints
#                ride a surface and their axes are not the bones' -
#                see bones.AIM_BINDS.
#
# Scope is the main body. The twist bones, the hundreds of correctives
# and the whole face are left alone: a plugin drives those. The rig's
# own twist joints are kept out of the running for drivers too, so a
# twist joint cannot take a main bone by happening to sit nearer than
# the joint that belongs to it.
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


def _candidates():  #
    """{rig joint: world position} for the joints that may drive a bone.

    The inbetween and twist joints are never drivers - they are the
    rig's own machinery, and MetaHuman's equivalents are driven by a
    plugin rather than from here.
    """
    out = {}
    for j in scene.rigJoints():
        name = scene.short(j)
        if "_ibtw_" in name or "_twist_" in name:
            continue
        out[name] = cmds.xform(j, q=True, ws=True, t=True)

    return out


def _targets(joints):  #
    """{bone: world position} for the bones the rig is meant to drive."""
    out = {}
    for j in joints:
        bone = scene.boneName(j)
        if bones.role(bone) == "main" and bone not in bones.NO_POSER:
            out[bone] = cmds.xform(j, q=True, ws=True, t=True)

    return out


def _height(positions):  #
    ys = [p[1] for p in positions]

    return (max(ys) - min(ys)) if ys else 0.0


def _namedDriver(bone):  #
    """The joint bones.DRIVER_BINDS names for this bone, if it names one.

    The module is found by its type and side rather than by name, so the
    table stays independent of what the modules are called.
    """
    side = bones.side(bone)
    slot = bone[:-2] if side in ("l", "r") else bone

    entry = bones.DRIVER_BINDS.get(slot)
    if not entry:
        return ""

    # a plain name is a node, taken as it stands: the chest control is
    # not a skin joint and has no module prefix to build a name from
    if not isinstance(entry, tuple):
        return entry if cmds.objExists(entry) else ""

    wantType, leaf = entry
    for module, mType in scene.modules().items():
        if scene.slotKey(module, mType) != wantType:
            continue
        if utils.getObjectSide(module) != side:
            continue

        joint = "%s_%s_skinJoint" % (module, leaf)
        if cmds.objExists(joint):
            return joint

    return ""


def _match(targets, candidates, limit, fixed=None):  #
    """Pair each bone with a rig joint: nearest first, one joint each.

    Working from the closest pair outwards rather than bone by bone is
    what makes it safe. A bone with no joint of its own would otherwise
    take whatever was nearest and drag a neighbour's driver away with
    it; here the neighbour has already claimed it.

    fixed holds the pairs that were named rather than measured. They are
    settled before anything is measured, so a named driver cannot be
    taken by a bone that merely happens to sit nearer to it.
    """
    out = dict(fixed or {})
    claimed = {joint for joint, _ in out.values()}

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

    for d, bone, joint in pairs:
        if bone in out or joint in claimed:
            continue
        out[bone] = (joint, d)
        claimed.add(joint)

    return out


# Each constraint type is queried by its own command; there is no
# generic one that answers targetList.
_QUERIES = {
    "parentConstraint": cmds.parentConstraint,
    "pointConstraint": cmds.pointConstraint,
    "orientConstraint": cmds.orientConstraint,
    "aimConstraint": cmds.aimConstraint,
    "scaleConstraint": cmds.scaleConstraint,
}


def _moduleOfJoint(jointName, moduleNames):  #
    """Which module a rig joint came from - the longest name that fits.

    Joint names start with their module name, but modules can share a
    prefix ('l_arm' and 'l_armTwist'), so the longest match wins.
    """
    best = ""
    for m in moduleNames:
        if jointName.startswith(m + "_") and len(m) > len(best):
            best = m

    return best


def _aimTarget(entry, driver, moduleNames):  #
    """The joint an aim-bound bone looks at.

    A leaf name is resolved inside the module that owns the driver, so
    the table says 'local_2' and not 'spine_local_2_outJoint' and keeps
    working whatever the module is called.
    """
    aim = entry["aim"]
    if aim.endswith("_outJoint") or aim.endswith("_skinJoint"):
        return aim

    module = _moduleOfJoint(driver, moduleNames)
    if not module:
        return ""

    return "%s_%s_outJoint" % (module, aim)


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


def plan(skeletonRoot=None):  #
    """Work out which rig joint drives which bone. Touches nothing.

    Returns {bone: (driver, distance)} and the list of bones that found
    nothing close enough, so the whole thing can be read before a single
    constraint exists.
    """
    joints = scene.skeleton(skeletonRoot)
    if not joints:
        cmds.warning("metahuman: no skeleton found - select the MetaHuman")
        return {}, []

    targets = _targets(joints)
    candidates = _candidates()
    if not candidates:
        cmds.warning("metahuman: the rig has no skin joints - build it first")
        return {}, []

    # Settled first, so a named driver is never taken by a bone that
    # merely sits a little nearer to it.
    fixed = {}
    for bone in targets:
        joint = _namedDriver(bone)
        if not joint:
            continue

        # a named driver need not be a skin joint - the chest control is
        # not one - so its position is read from the scene rather than
        # looked up among the candidates
        where = candidates.get(joint)
        if where is None:
            where = cmds.xform(joint, q=True, ws=True, t=True)

        fixed[bone] = (joint, _distance(targets[bone], where))

    limit = _height(list(targets.values())) * LIMIT
    matched = _match(targets, candidates, limit, fixed)
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


def run(skeletonRoot=None, dryRun=False, scaleToo=False,
        name="metahuman"):  #
    """Constrain the MetaHuman skeleton to the rig.

        from rigStudio3 import metahuman
        metahuman.bindSkeleton(dryRun=True)   # read the plan first
        metahuman.bindSkeleton()

    Run this after the posers are placed and slid: the drivers are found
    from where things are standing at the time, and the offsets are
    measured from there too.

    The correctives and the face are left free - a plugin drives those.
    """
    data = guess.load(name) if isinstance(name, str) else name
    namespace = scene.resolveNamespace(data or {}, skeletonRoot)
    if not namespace:
        print("metahuman: nothing constrained")
        return {}

    matched, missed = plan(skeletonRoot)
    if not matched:
        return {}

    report(matched, missed)
    if dryRun:
        return {"matched": matched, "missed": missed}

    if not cmds.objExists(BIND_SET):
        cmds.sets(empty=True, n=BIND_SET)

    made, already, failed, aimed = [], [], [], []
    moduleNames = list(scene.modules())

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
                aim = bones.aimBind(bone)
                aimAt = _aimTarget(aim, driver, moduleNames) if aim else ""
                if aim and not (aimAt and cmds.objExists(aimAt)):
                    failed.append("%s (no aim target %s)"
                                  % (bone, aimAt or aim["aim"]))
                    continue

                if aim:
                    # position from the driver, direction from further
                    # along the rig - see bones.AIM_BINDS for why
                    for con in (
                            cmds.pointConstraint(driver, target, mo=True)[0],
                            cmds.aimConstraint(
                                aimAt, target, mo=True,
                                aimVector=aim["aimVector"],
                                upVector=aim["upVector"],
                                worldUpType="objectrotation",
                                worldUpVector=aim["worldUp"],
                                worldUpObject=driver)[0]):
                        cmds.sets(con, add=BIND_SET)
                    aimed.append("%s: point %s, aim %s"
                                 % (bone, driver, aimAt))
                else:
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
    if already:
        # Silence here reads as success, and the bones keep whatever
        # they were bound with last time - which is exactly wrong after
        # the rules have changed.
        cmds.warning("metahuman: %s bones were left as they were because "
                     "something already drives them - detach() first to "
                     "rebind them" % len(already))
    if aimed:
        print("point plus aim, not parent (%s):" % len(aimed))
        for line in aimed:
            print("    " + line)
    if failed:
        print("failed (%s):" % len(failed))
        for line in failed:
            print("    " + line)

    return {"constrained": made, "already": already, "failed": failed,
            "missed": missed, "aimed": aimed}


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

        # A bone may carry more than one constraint now - the aim-bound
        # ones are held by a point and an aim together - so all of them
        # are read, and each is named by the kind of hold it has.
        held = []
        for child in cmds.listRelatives(j, children=True, fullPath=True) or []:
            kind = cmds.objectType(child)
            query = _QUERIES.get(kind)
            if not query:
                continue

            targets = query(child, q=True, targetList=True) or []
            held.append("%s %s" % (kind.replace("Constraint", ""),
                                   targets[0] if targets else "?"))

        driver = ", ".join(held)

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


def boundSkeletonRoot():  #
    """The root of the MetaHuman skeleton this rig actually drives.

    With a mocap in the scene there are two identical skeletons and no
    way to tell them apart by name. The constraints know, though: they
    are the only thing that says which one this rig is holding. So the
    answer is read back out of them rather than asked for.
    """
    if not cmds.objExists(BIND_SET):
        return ""

    driven = []
    for node in utils.getSetObjects(BIND_SET):
        if not cmds.objExists(node):
            continue
        parent = cmds.listRelatives(node, parent=True, fullPath=True)
        if parent and cmds.objectType(parent[0]) == "joint":
            driven.append(parent[0])

    if not driven:
        return ""

    # any constrained bone will do - climb from it to the top of its chain
    top = sorted(driven, key=lambda n: n.count("|"))[0]
    while True:
        above = cmds.listRelatives(top, parent=True, type="joint",
                                   fullPath=True)
        if not above:
            break
        top = above[0]

    return top
