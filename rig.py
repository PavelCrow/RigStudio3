import maya.cmds as cmds
import os
import importlib
import math
import sys
from . import main, utils

class Rig:
    def __init__(self, name='character'):
        self.name = name
        self.moduleNames = []
        self.modules = {}
        self.exists = False
        self.root = "main"
        self.main = None
        self.jointsSize = 1
        self.posersSize = 1
        self.jointsAxises = False
        self.jointsVis = True
        self.posersVis = True
        self.controlsVis = True
        self.jointsTemplate = True
        self.geoVis = True
        self.geoTemplate = False
        self.geoReference = False
        
        self.load()

    def load(self):
        print("rig load")
        self.exists = cmds.objExists(self.root) and cmds.objExists('rig') and cmds.objExists('geo')
        if self.exists:
            self.jointsSize = cmds.getAttr(self.root + ".jointsSize")
            self.posersSize = cmds.getAttr(self.root + ".posersSize")
            self.jointsAxises = cmds.getAttr(self.root + ".jointsAxises")
            try:
                self.posersVis = cmds.getAttr(self.root + ".posersVis")
                self.controlsVis = cmds.getAttr(self.root + ".controlsVis")
                self.jointsVis = cmds.getAttr(self.root + ".jointsVis")
                self.jointsTemplate = cmds.getAttr(self.root + ".jointsTemplate")                
            except:
                pass

            self.geoVis = cmds.getAttr('geo.v')
            self.geoTemplate = cmds.getAttr('geo.overrideEnabled') and cmds.getAttr('geo.overrideDisplayType') == 1
            self.geoReference = cmds.getAttr('geo.overrideEnabled') and cmds.getAttr('geo.overrideDisplayType') == 2

            # get rig name
            self.name = cmds.getAttr(self.root + ".name")

            # load modules
            self.load_modules()

    def create(self):
        if self.exists:
            pm.warning("Rig is already exists")
            return
        
        # create main group
        root = cmds.group(empty=True, n="main")

        # add attributes
        utils.setUserAttr(root, 'nodeType', 'rs_rig')
        utils.setUserAttr(root, 'name', self.name)
        utils.setUserAttr(root, 'rs_version', 2, type="float", lock=0)
        utils.setUserAttr(root, 'posersSize', 1, type="float", lock=0)
        utils.setUserAttr(root, 'jointsSize', 1, type="float", lock=0)
        utils.setUserAttr(root, 'posersAxises', 0, type="bool", lock=0)
        utils.setUserAttr(root, 'jointsAxises', 0, type="bool", lock=0)
        utils.setUserAttr(root, 'posersVis', 1, type="bool", lock=0)
        utils.setUserAttr(root, 'controlsVis', 1, type="bool", lock=0)
        utils.setUserAttr(root, 'jointsVis', 1, type="bool", lock=0)
        utils.setUserAttr(root, 'jointsTemplate', 1, type="bool", lock=0)

        # create groups
        cmds.group(empty=True, n="geo", p=root)
        rig = cmds.group(empty=True, n="rig", p=root)
        cmds.group(empty=True, n="modules", p=rig)
        cmds.group(empty=True, n="skeleton", p=rig)
        # cmds.group(empty=True, n="addControls", p=rig)
        cmds.group(empty=True, n="twists", p=rig)
        cmds.select(clear=True)

        cmds.setAttr("skeleton.overrideEnabled", 1)
        cmds.setAttr("skeleton.overrideColor", 29)
        cmds.setAttr("skeleton.template", True)

        cmds.sets(n='controlSet')
        cmds.sets(n='sets')
        cmds.sets('controlSet', e=1, forceElement='sets')
        cmds.sets(n='skinJointsSet')
        cmds.sets('skinJointsSet', e=1, forceElement='sets')
        cmds.sets(n='modules_sets')
        cmds.sets('modules_sets', e=1, forceElement='sets')

        self.exists = True
        
        self.main.rigPage_update()

    def delete(self):
        for m_name in self.modules:
            m = self.modules[m_name]
            m.delete()

        cmds.delete("main")

        allNodes = cmds.ls()
        for n in allNodes:
            if cmds.objExists(n + ".moduleName"):
                cmds.delete(n)

        if cmds.objExists('sets'):
            cmds.delete('sets')

        self.exists = False
        self.moduleNames = []
        self.modules = {}

        cmds.delete("red_rsMat")
        cmds.delete("green_rsMat")
        cmds.delete("black_rsMat")
        cmds.delete("blue_rsMat")
        cmds.delete("red_rsSG")
        cmds.delete("green_rsSG")
        cmds.delete("black_rsSG")
        cmds.delete("blue_rsSG")

    def rename(self, newName):
        self.name = newName
        utils.setUserAttr("main", "name", newName)


    def updateModuleNames(self):
        # get list deeps and names for sorting
        m_list = []
        for m_name in self.modules:
            m = self.modules[m_name]
            # print ("MODNAME", m.name, m.parent)
            deep = 0
            parent = m.parent

            while parent != "" and parent != None:
                if parent.split("_")[-1] == "joint": parent = parent.replace("joint", "outJoint")
                # print (22222, m.name, parent, utils.getModuleNameFromAttr(parent))
                parModName = utils.getModuleNameFromAttr(parent) or ""
                # print (1111, parent, parModName)
                if not parModName:
                    cmds.warning("Cannot find the parent")

                try:
                    par_mod = self.modules[parModName]
                    parent = par_mod.parent
                    deep += 1
                except:
                    parent = None

            m_list.append([deep, m_name])
        # if parent:
        # print (555, parent, parModName)

        # save sorted list
        self.moduleNames = []
        for deep, name in sorted(m_list):
            self.moduleNames.append(name)


    def isTemplate(self, type):

        if type == 'jointsT':
            obj = 'skeleton'
            if cmds.objExists(obj):
                v = cmds.getAttr(obj + '.template')
                return v

        elif type == 'geoT':
            obj = 'geo'
            if cmds.getAttr("geo.overrideEnabled") and cmds.getAttr("geo.overrideDisplayType") == 1:
                v = True
            else:
                v = False
            return v

        return None

    def isReference(self, type):

        if type == 'geoR':
            obj = 'geo'
            if cmds.getAttr("geo.overrideEnabled") and cmds.getAttr("geo.overrideDisplayType") == 2:
                v = True
            else:
                v = False
            return v

        return None

    def getControls(self):

        ctrls = utils.getSetObjects("controlSet")

        return ctrls

    def savePos(self, setDefaultValues=False):

        controls = self.getControls()

        sel = cmds.ls(sl=True)

        attrData = {}

        for ctrl in controls:
            cmds.select(ctrl)
            attrList = []
            attrListKeyable = cmds.listAttr(keyable=True)
            if type(attrListKeyable) != list:
                attrListKeyable = []
            attrListNonkeyable = cmds.listAttr(channelBox=True)
            if type(attrListNonkeyable) != list:
                attrListNonkeyable = []
            attrList = attrListKeyable + attrListNonkeyable
            for attr in attrList:
                attrVar = cmds.getAttr(ctrl + "." + attr)
                attrData[(ctrl + "." + attr)] = attrVar

                # Set default value for custom attr's
                if setDefaultValues:
                    try:
                        # print ctrl + "." + attr
                        cmds.addAttr((ctrl + "." + attr), e=True, dv=attrVar)
                    except:
                        pass

        # Save data to node
        objAttr = "main.pose"
        utils.pyToAttr(objAttr, attrData)

        if len(sel) > 0:
            cmds.select(sel)
        else:
            cmds.select(clear=1)
        cmds.select(objAttr)

    def loadPos(self):
        debugStart(traceback.extract_stack()[-1][2])

        controls = self.getControls()

        # on creating main
        if not cmds.attributeQuery('pose', node="main", exists=True):
            return

        objAttr = "main.pose"

        # Get data
        attrData = {}
        attrData = utils.attrToPy(objAttr)

        # Set control attributes
        # for attr in attrData:
        # cmds.setAttr( char + attr, attrData[attr] )

        # Reset selected objects
        for ctrl in controls:
            for attr in attrData:

                if (ctrl == attr.split(".")[0]):
                    # print attr, attrData[attr]
                    try:
                        cmds.setAttr(attr, attrData[attr])
                    except:
                        print("miss attr - ", attr)

        debugEnd(traceback.extract_stack()[-1][2])

    def resetPos(self):
        debugStart(traceback.extract_stack()[-1][2])

        sel = cmds.ls(sl=True)

        controls = self.getControls()

        for ctrl in controls:
            cmds.select(ctrl)
            attrList = []
            attrListKeyable = cmds.listAttr(keyable=True)
            if type(attrListKeyable) != list:
                attrListKeyable = []
            attrListNonkeyable = cmds.listAttr(channelBox=True)
            if type(attrListNonkeyable) != list:
                attrListNonkeyable = []
            attrList = attrListKeyable + attrListNonkeyable
            # print attrList
            for attr in attrList:
                try:
                    value = cmds.attributeQuery(attr, node=ctrl, listDefault=True)[0]
                    cmds.setAttr(ctrl + "." + attr, value)
                except:
                    pass
        # print "miss attr", attr, " with value =", value

        if len(sel) > 0:
            cmds.select(sel)
        else:
            cmds.select(clear=1)

        debugEnd(traceback.extract_stack()[-1][2])

    def getSkinJoints(self):
        debugStart(traceback.extract_stack()[-1][2], True)

        all_joints = []
        for m in self.moduleNames:
            if cmds.objExists(m + "_skinJoints"):
                joints = cmds.listRelatives(m + "_skinJoints", allDescendents=1, type='joint')
                if type(joints).__name__ != "NoneType":
                    all_joints += joints

    def toggleVis_posers(self, state=None):
        if not state:
            state = self.main.win.actionPosers.isChecked()

        for m_name in self.moduleNames:
            if state == 0:  # or self.rig.modules[m_name].opposite:
                cmds.hide(m_name + '_posers')
            else:
                cmds.showHidden(m_name + '_posers')
                
        cmds.setAttr(self.root + ".posersVis", state)
                
    def toggleVis_controls(self, state=None):
        if not state:
            state = self.main.win.actionControls.isChecked()

        for m in self.moduleNames:
            if state == 0:
                cmds.hide(m + '_controls')
            else:
                cmds.showHidden(m + '_controls')

        if cmds.objExists("twists"):
            tw_mods = cmds.listRelatives('twists', type='transform') or []
            for tw_mod in tw_mods:
                controls_gr = tw_mod.split("_mod")[0] + '_controls'
                if cmds.objExists(controls_gr):
                    if state == 0:
                        cmds.hide(controls_gr)
                    else:
                        cmds.showHidden(controls_gr)
                        
        cmds.setAttr(self.root + ".controlsVis", state)

    def toggleVis_joints(self, state=None):
        if not state:
            state = self.main.win.actionJoints.isChecked()

        if state == 0:
            cmds.hide('skeleton')
        else:
            cmds.showHidden('skeleton')
            
        cmds.setAttr(self.root + ".jointsVis", state)

    def toggleVis_geo(self, state=None):
        if not state:
            state = self.main.win.actionGeometry.isChecked()

        if state == 0:
            cmds.hide('geo')
        else:
            cmds.showHidden('geo')
            
    def toggleTemplate_joints(self, state=None):
        if not state:
            state = self.main.win.actionJoints_Template.isChecked()

        if state == 0:
            cmds.setAttr("skeleton.template", 0)
        else:
            cmds.setAttr("skeleton.template", 1)
            
        cmds.setAttr(self.root + ".jointsTemplate", state)

    def toggleTemplate_geo(self, state=None):
        if not state:
            state = self.main.win.actionGeometry_Template.isChecked()

        if state == 0:
            cmds.setAttr("geo.overrideDisplayType", 0)
        else:
            cmds.setAttr("geo.overrideEnabled", True)
            cmds.setAttr("geo.overrideDisplayType", 1)
            self.main.win.actionGeometry_Reference.setChecked(False)

    def toggleReference_geo(self, state=None):
        if not state:
            state = self.main.win.actionGeometry_Reference.isChecked()

        if state == 0:
            cmds.setAttr("geo.overrideDisplayType", 0)
        else:
            cmds.setAttr("geo.overrideEnabled", True)
            cmds.setAttr("geo.overrideDisplayType", 2)
            self.main.win.actionGeometry_Template.setChecked(False)
            
    def toggleVis_jointsAxises(self, state=None):
        if not state:
            state = self.main.win.actionSkeleton_LRA.isChecked()

        cmds.setAttr(self.root + ".jointsAxises", state)

        if len(self.modules) == 0:
            return

        joints = cmds.listRelatives('skeleton', allDescendents=1, type='joint') or []

        if len(joints) > 0:
            for j in joints:
                try:
                    cmds.setAttr(j + '.displayLocalAxis', state)
                except:
                    pass            
            
    def selectCurModMainPoser(self):
        cmds.select(self.main.curModuleName + "_mainPoser")

    def load_modules(self):
        modules_groups = cmds.listRelatives('modules') or []
        modules_files = utils.getModuleFiles()

        for f in modules_groups:
            if cmds.attributeQuery('moduleType', node=f, exists=True):
                moduleName = f[:-4]
                m = utils.getModuleInstance(moduleName)
                if not m:
                    continue
                self.modules[moduleName] = m
                
        # get ordered ModuleNames
        self.updateModuleNames()

    def create_module(self, moduleName, moduleType, options):
        moduleTypeCap = utils.capitalizeName(moduleType)

        # importlib.import_module('rigStudio3.modules.%s.%s' % (moduleType, moduleType))
        exec('from .modules.%s import %s' % (moduleType, moduleType)) 	# from .modules.moduleA import moduleA
        exec('importlib.reload(%s)' % (moduleType))						# importlib.reload(moduleA)
        m = eval('%s.%s(moduleName)' % (moduleType, moduleTypeCap))  	# m = modules.moduleA.moduleA.ModuleA(name)
        m.create(options)

        self.modules[moduleName] = m
        self.updateModuleNames()

        self.toggleVis_posers()
        self.toggleVis_controls()
        self.toggleVis_joints()

        return m