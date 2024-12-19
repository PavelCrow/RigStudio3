import maya.cmds as cmds
import pymel.core as pm
import os
from ..import utils

def check():
    # file checking
    path = cmds.file(q=1, sn=1)
    dir_name = os.path.basename(os.path.dirname(path))
    file_name = cmds.file(q=1, sn=1, shortName=1)
    name = file_name.split('.')[0]
    all = cmds.ls("*")
    
    if dir_name != name:
        cmds.warning("Wrong filename or path")

    # groups checking
    for gr in ["mod", "posers", "input", "controls", "system", "output", "outJoints"]:
        if not cmds.objExists(gr):
            cmds.warning("Group is not exists: "+gr)

    # objects checking
    for o in ["mainPoser", "root_poser", "root_connector", "root_outJoint"]:
        if not cmds.objExists(o):
            cmds.warning("Object is not exists: "+o)

    # sets
    for s in ["sets", "moduleControlSet", "skinJointsSet"]:
        if not cmds.objExists(s):
            cmds.warning("Set is not exists: "+s)

    # init locs checking
    for c in utils.getSetObjects('moduleControlSet'):
        if not cmds.objExists(c+"_initLoc"):
            cmds.warning("InitLoc is not exists: "+c+"_initLoc")
    for j in utils.getSetObjects('skinJointsSet'):
        if not cmds.objExists(j.replace("skinJoint","initLoc")):
            cmds.warning("InitLoc is not exists: "+j.replace("skinJoint","initLoc"))

    # namespaces
    if cmds.ls("*:*"):
        cmds.warning("Exists namespaces")
        
    # duplicates
    for o in all:
        if "|" in o:
            cmds.warning("Exists duplicates (%s)" %o)

    # animation
    anim = cmds.ls(type="animCurveTA") + cmds.ls(type="animCurveTL") + cmds.ls(type="animCurveTU")
    if anim:
        cmds.warning("Exists animation - %s" %anim)