# Reading the scene: what posers the rig has, what bones the MetaHuman
# skeleton has, and how the two are laid out.
#
# Nothing here changes anything - place.py and bind.py do that.

import json
import os

import maya.cmds as cmds

from rigStudio3 import utils


POSER_SUFFIXES = ("poser", "mainPoser", "addPoser")

# The bone every MetaHuman skeleton starts from, in order of preference:
# 'root' is the real top, but a skeleton imported without it still has
# 'pelvis'.
SKELETON_ROOTS = ("root", "pelvis")


def short(node):  #
    return node.split("|")[-1]


def moduleOf(poserPath):  #
    """Module name a poser belongs to, read off its DAG path.

    Posers live under rig|modules|<module>_mod|<module>_posers|... , the
    same path utils.getModuleName walks for joints.
    """
    if "rig|modules|" not in poserPath:
        return ""

    tail = poserPath.split("rig|modules|")[-1]
    if "_mod|" not in tail:
        return ""

    return tail.split("_mod|")[0]


def moduleType(moduleName):  #
    root = moduleName + "_mod"
    if not cmds.objExists(root):
        return ""
    if not cmds.attributeQuery("moduleType", node=root, exists=True):
        return ""

    return cmds.getAttr(root + ".moduleType")


def poserLeaf(poserName, moduleName):  #
    """'l_arm_middle_poser' in module 'l_arm' -> 'middle'.

    The module name comes off the front and the poser suffix off the
    back, which is what bones.POSER_SLOTS is keyed by - the leaf is the
    part that is the same on every module of that type, whatever the
    module ended up being called.
    """
    name = poserName
    for suffix in POSER_SUFFIXES:
        if name.endswith("_" + suffix):
            name = name[:-(len(suffix) + 1)]
            break

    if moduleName and name == moduleName:
        # a module's own mainPoser: 'l_clav_mainPoser' would otherwise
        # come out as 'l_clav', which is the module name and therefore
        # different on every rig. 'main' is the same everywhere.
        return "main"

    if moduleName and name.startswith(moduleName + "_"):
        name = name[len(moduleName) + 1:]

    return name


def posers(moduleName=None):  #
    """Every poser in the scene, parents first.

    Placement has to follow that order: child posers ride their parents
    through offsetParentMatrix, so moving a parent afterwards would undo
    whatever was done to the child.
    """
    found = []
    for node in cmds.ls(type="transform", long=True):
        name = short(node)
        if name.split("_")[-1] not in POSER_SUFFIXES:
            continue
        if moduleName and moduleOf(node) != moduleName:
            continue
        found.append((node.count("|"), node))

    return [node for _, node in sorted(found)]


def modules():  #
    """{module name: module type} for every module that has posers."""
    if _modulesCache:
        return _modulesCache

    for p in posers():
        name = moduleOf(p)
        if name and name not in _modulesCache:
            _modulesCache[name] = moduleType(name)

    return _modulesCache


# Telling arms from legs asks the same questions about the same modules
# over and over: once per limb poser, each one otherwise a full scene
# walk plus a getModuleInstance, which re-imports the module class while
# Debug is on. So the answers are kept. clearCache() after building or
# reconnecting a module.
_parentCache = {}
_modulesCache = {}


def clearCache():  #
    _parentCache.clear()
    _modulesCache.clear()


def moduleParent(moduleName):  #
    """Module this one is connected to, or '' if it hangs off nothing."""
    if moduleName in _parentCache:
        return _parentCache[moduleName]

    parentName = ""
    m = utils.getModuleInstance(moduleName)
    if m:
        parent = m.getParent()
        if parent:
            parentName = utils.getModuleName(parent) or ""

    _parentCache[moduleName] = parentName

    return parentName


def moduleChildren(moduleName):  #
    out = []
    for name in modules():
        if name != moduleName and moduleParent(name) == moduleName:
            out.append(name)

    return out


def findSkeletonRoot(root=None):  #
    """The MetaHuman skeleton root: given, selected, or found by name."""
    if root:
        if cmds.objExists(root):
            return cmds.ls(root, l=True)[0]

        # Said out loud rather than quietly falling back: a root that
        # was named on purpose and then not found means the reference
        # was reloaded or renamed, and guessing from the selection
        # instead would look like it had worked.
        cmds.warning("metahuman: no '%s' in the scene - set the skeleton "
                     "root again" % root)

    sel = cmds.ls(sl=True, type="joint", long=True)
    if sel:
        return sel[0]

    for name in SKELETON_ROOTS:
        found = [j for j in cmds.ls("*" + name, type="joint", long=True)
                 if short(j).split(":")[-1] == name]
        if found:
            # the shallowest match, so 'root' wins over a nested 'pelvis'
            return sorted(found, key=lambda n: n.count("|"))[0]

    return ""


def skeleton(root=None):  #
    """[full path] of the skeleton root and everything under it."""
    root = findSkeletonRoot(root)
    if not root:
        return []

    below = cmds.listRelatives(root, allDescendents=True, type="joint",
                               fullPath=True) or []

    return [root] + sorted(below, key=lambda n: n.count("|"))


def boneName(jointPath):  #
    """Bone name with any namespace stripped, for matching against bones.py."""
    return short(jointPath).split(":")[-1]


def namespaceOf(jointPath):  #
    name = short(jointPath)

    return name.rsplit(":", 1)[0] + ":" if ":" in name else ""


def rigJoints():  #
    """Every skin joint the rig built, parents first.

    These are what drives the skeleton once the posers are placed:
    they are the joints the modules grew where the posers stood.
    """
    found = [(j.count("|"), j) for j in
             cmds.ls("*_skinJoint", "*_rootJoint", type="joint", long=True)]

    return [j for _, j in sorted(found)]


def dumpScene(path=None, skeletonRoot=None):  #
    """Write posers and skeleton out to JSON, for authoring maps offline.

    Read-only. Select the skeleton root first, or pass its name.

        from rigStudio3 import metahuman
        metahuman.dumpScene("c:/temp/mh_dump.json")
    """
    joints = skeleton(skeletonRoot)

    poserData = []
    for p in posers():
        module = moduleOf(p)
        parent = cmds.listRelatives(p, parent=True, fullPath=True)
        poserData.append({
            "name": short(p),
            "module": module,
            "moduleType": moduleType(module),
            "leaf": poserLeaf(short(p), module),
            "parent": short(parent[0]) if parent else "",
            "worldPos": cmds.xform(p, q=True, ws=True, t=True),
        })

    jointData = []
    for j in joints:
        parent = cmds.listRelatives(j, parent=True, fullPath=True, type="joint")
        jointData.append({
            "name": boneName(j),
            "parent": boneName(parent[0]) if parent else "",
            "worldPos": cmds.xform(j, q=True, ws=True, t=True),
            "jointOrient": list(cmds.getAttr(j + ".jointOrient")[0]),
        })

    # The rig's own joints, which is what the binding step has to pick
    # its drivers from - the same job the poser map does for placement,
    # in the other direction.
    rigData = []
    for j in rigJoints():
        parent = cmds.listRelatives(j, parent=True, fullPath=True, type="joint")
        rigData.append({
            "name": short(j),
            "parent": short(parent[0]) if parent else "",
            "worldPos": cmds.xform(j, q=True, ws=True, t=True),
        })

    data = {
        "scene": cmds.file(q=True, sceneName=True),
        "upAxis": cmds.upAxis(q=True, axis=True),
        "linearUnit": cmds.currentUnit(q=True, linear=True),
        "skeletonRoot": boneName(joints[0]) if joints else "",
        "namespace": namespaceOf(joints[0]) if joints else "",
        "modules": modules(),
        "posers": poserData,
        "joints": jointData,
        "rigJoints": rigData,
    }

    if not path:
        path = os.path.join(os.path.expanduser("~"), "mh_dump.json")

    with open(path, "w") as f:
        json.dump(data, f, indent=2)

    print("metahuman: dumped %s posers, %s bones and %s rig joints -> %s"
          % (len(poserData), len(jointData), len(rigData), path))

    if not poserData:
        cmds.warning("metahuman: no posers in the scene - build the rig from "
                     "its template first, and note that a baked rig has none "
                     "left to place")
    if not jointData:
        cmds.warning("metahuman: no skeleton found - select the MetaHuman "
                     "root joint and run again")

    return path


def namespacesFor(bone):  #
    """Namespaces of every joint in the scene carrying this bone name.

    Walks the joints rather than matching a wildcard, because a name
    pattern would have to know how deeply the namespaces are nested and
    this does not care.
    """
    out = []
    for j in cmds.ls(type="joint", long=True):
        if boneName(j) == bone:
            ns = namespaceOf(j)
            if ns not in out:
                out.append(ns)

    return out


def sampleBone(data):  #
    """One bone the map actually names, for testing a namespace against.

    A MetaHuman bone name, so nothing in the rig answers to it - which
    is what makes it a usable probe.
    """
    for entry in sorted(data.get("posers", {}).values(),
                        key=lambda e: e.get("bone", "")):
        if entry.get("bone"):
            return entry["bone"]

    return ""


def resolveNamespace(data, skeletonRoot=None):  #
    """Which namespace this map's bones live under *now*.

    The namespace is the one thing about a MetaHuman that changes from
    character to character while the rig and the skeleton stay put - a
    new reference gets a new prefix - so it is looked up fresh rather
    than taken from the map, and a map written for one character keeps
    working for the next without being rebuilt.

    In order: whatever skeletonRoot names, then the selection, then a
    search of the scene.

    Returns "" when it cannot settle on one, and the callers stop there
    rather than carrying on. The MetaHuman is always referenced, so an
    empty namespace never means "the skeleton is in the root namespace"
    - it means the wrong thing was pointed at, and acting on it would
    place posers against bones that were never found.

    The selection is checked before it is believed. Reaching for it is
    natural - point at the character you mean - but the thing under the
    cursor while fitting a rig is as likely to be a poser, and a poser
    carries no namespace at all.
    """
    if skeletonRoot:
        joints = skeleton(skeletonRoot)
        if joints:
            return namespaceOf(joints[0])

    sample = sampleBone(data)
    if not sample:
        cmds.warning("metahuman: this map names no bones at all")
        return ""

    selection = cmds.ls(sl=True, long=True)
    if selection:
        chosen = namespaceOf(selection[0])
        if not chosen:
            cmds.warning("metahuman: '%s' has no namespace - select the "
                         "referenced MetaHuman, not the rig"
                         % short(selection[0]))
        elif cmds.objExists(chosen + sample):
            return chosen
        else:
            cmds.warning("metahuman: no '%s' under '%s' - the selected "
                         "object does not belong to a MetaHuman"
                         % (sample, chosen))

    found = [ns for ns in namespacesFor(sample) if ns]
    if not found:
        cmds.warning("metahuman: no namespace holds '%s' - reference the "
                     "MetaHuman, or name its root with skeletonRoot=" % sample)
        return ""

    if len(found) > 1:
        cmds.warning("metahuman: '%s' exists under %s namespaces (%s) - "
                     "using the first. Select the MetaHuman you mean, or "
                     "pass skeletonRoot=, to choose."
                     % (sample, len(found), ", ".join(found)))

    return found[0]
