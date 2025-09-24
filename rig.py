import maya.cmds as cmds
import os, importlib
from . import utils

modulePath = os.path.normpath(os.path.dirname(__file__))

class Rig:
    def __init__(self, main, name='character'): #
        self.name = name
        self.modules = {}
        self.exists = False
        self.root = "main"
        self.main = main
        self.singleHierarhy = True
        self.jointsSize = 1
        self.posersSize = 1
        self.jointsAxises = False
        self.jointsTemplate = False
        self.jointsVis = True
        self.posersVis = True
        self.controlsVis = True
        self.geoVis = True
        self.geoTemplate = False
        self.geoReference = False
        
        self.load()

    def load(self): #
        # print("rig load")

        self.exists = cmds.objExists('rig') and cmds.objExists('geo')
        
        if self.exists:
            self.root = cmds.listRelatives("rig", p=1)[0]
            if cmds.objExists(self.root + ".singleHierarhy"):
                self.singleHierarhy = cmds.getAttr(self.root + ".singleHierarhy")
            else:
                self.singleHierarhy = True
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

    def create(self, singleHierarhy=True): #
        if self.exists:
            cmds.warning("Rig is already exists")
            return
        
        # create main group
        root = cmds.group(empty=True, n=self.root)

        path = os.path.join(modulePath,'versions.txt')
        with open(path, mode='r') as f:
            lines = f.readlines()
        
        versions = []
        for l in lines:
            if '---Version' in l:
                versions.append(l)

        rs_version = versions[-1].split(' ')[1].split('\n')[0]

        # add attributes
        utils.setUserAttr(root, 'nodeType', 'rs_rig')
        utils.setUserAttr(root, 'name', self.name)
        utils.setUserAttr(root, 'rs_version', rs_version)
        utils.setUserAttr(root, 'singleHierarhy', singleHierarhy, type="bool", lock=0)
        utils.setUserAttr(root, 'posersSize', 1, type="float", lock=0)
        utils.setUserAttr(root, 'jointsSize', 1, type="float", lock=0)
        utils.setUserAttr(root, 'posersAxises', 0, type="bool", lock=0)
        utils.setUserAttr(root, 'jointsAxises', 0, type="bool", lock=0)
        utils.setUserAttr(root, 'posersVis', 1, type="bool", lock=0)
        utils.setUserAttr(root, 'controlsVis', 1, type="bool", lock=0)
        utils.setUserAttr(root, 'jointsVis', 1, type="bool", lock=0)
        utils.setUserAttr(root, 'jointsTemplate', 0, type="bool", lock=0)

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
        cmds.setAttr("skeleton.template", False)
        cmds.setAttr("skeleton.v", singleHierarhy)
        # cmds.setAttr("skeleton.v", lock=1)

        self.singleHierarhy = singleHierarhy

        utils.create_default_sets()

        self.exists = True
        
        self.main.rigPage_update()

    def delete(self): #
        # delete twists
        tw_mods = cmds.listRelatives("twists") or []
        for tw_mod in tw_mods:
            tw_name = tw_mod.split("_mod")[0]
            cmds.delete(tw_name+"_curveInfo")
        cmds.delete("twists")

        # delete modules
        for m_name in self.modules:
            m = self.modules[m_name]
            m.delete()

        # delete rig
        root = cmds.listRelatives("rig", p=1)[0]
        cmds.delete(root)
        
        # delete all sets
        for set in cmds.ls(type="objectSet"):
            if set not in ['defaultLightSet', 'defaultObjectSet', 'initialParticleSE', 'initialShadingGroup']:
                if cmds.objExists(set): 
                    cmds.delete(set)
        
        self.exists = False
        self.modules = {}
        self.main.curModule = None

    def rename(self, newName): #
        self.name = newName
        utils.setUserAttr(self.root, "name", newName)

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
        objAttr = self.root + ".pose"
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
        if not cmds.attributeQuery('pose', node=self.root, exists=True):
            return

        objAttr = self.root + ".pose"

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
        for m in self.modules:
            if cmds.objExists(m + "_skinJoints"):
                joints = cmds.listRelatives(m + "_skinJoints", allDescendents=1, type='joint')
                if type(joints).__name__ != "NoneType":
                    all_joints += joints

    def toggleVis_posers(self, state=None): #
        if not cmds.objExists(self.root + ".posersVis"):
            cmds.warning("Cannot find the "+self.root + ".posersVis")
            return
        
        if not state:
            state = self.main.win.actionPosers.isChecked()

        for m_name in self.modules:
            if state == 0 or self.modules[m_name].opposite:
                cmds.hide(m_name + '_posers')
            else:
                cmds.showHidden(m_name + '_posers')
        
        cmds.setAttr(self.root + ".posersVis", state)
                
    def toggleVis_controls(self, state=None):
        if not state:
            state = self.main.win.actionControls.isChecked()

        for m in self.modules:
            if state == 0:
                cmds.hide(m + '_controls')
                controlShapes = cmds.listRelatives(m+'_outJoints', type="nurbsCurve", allDescendents=1) or []
                for c in controlShapes:
                    try:
                        cmds.setAttr(c+'.lodVisibility', 0)
                    except: pass
            else:
                cmds.showHidden(m + '_controls')
                controlShapes = cmds.listRelatives(m+'_outJoints', type="nurbsCurve", allDescendents=1) or []
                for c in controlShapes:
                    try:
                        cmds.setAttr(c+'.lodVisibility', 1)
                    except: pass

        
        for tw_mod in cmds.listRelatives("twists") or []:
            tw_name = tw_mod[:-4]
            if not cmds.objExists(tw_name+'_connectors'):
                cmds.warning("Cannot find "+tw_name+'_connectors')
                continue
            if state:
                cmds.showHidden(tw_name+'_connectors')
            else:
                cmds.hide(tw_name+'_connectors')
        
        if not cmds.objExists(self.root + ".controlsVis"):
            cmds.warning("Cannot find "+self.root + ".controlsVis")
            return
        
        cmds.setAttr(self.root + ".controlsVis", state)

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
    
    def toggleVis_joints(self, state=None):
        if not state:
            state = self.main.win.actionJoints.isChecked()
        
        if state == 0:
            if self.singleHierarhy:
                cmds.hide('skeleton')
            else:
                for mod in self.modules:
                    joints = cmds.listRelatives(mod+"_outJoints", allDescendents=1, type="joint")
                    for j in joints:
                        cmds.setAttr(j+".drawStyle", 2)
        else:
            if self.singleHierarhy:
                cmds.showHidden('skeleton')
            else:
                cmds.hide('skeleton')
                for mod in self.modules:
                    joints = cmds.listRelatives(mod+"_outJoints", allDescendents=1, type="joint")
                    for j in joints:
                        cmds.setAttr(j+".drawStyle", 0)

        if cmds.listRelatives("twists"):
            if not self.singleHierarhy:
                for tw_name in cmds.listRelatives("twists"):
                    tw_j = tw_name.replace("mod", "outJoint")
                    cmds.setAttr(tw_j+".drawStyle", 2)
                    for j in cmds.listRelatives(tw_name.replace("mod", "joints"), allDescendents=1, type="joint"):
                        if state:
                            cmds.setAttr(j+".drawStyle", 0)
                        else:
                            cmds.setAttr(j+".drawStyle", 2)

        if cmds.objExists(self.root + ".jointsVis"):
            cmds.setAttr(self.root + ".jointsVis", state)
        
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

        tw_mods = cmds.listRelatives('twists') or []
        for tw_mod in tw_mods:
            tw_name = tw_mod[:-4]
            joints += cmds.listRelatives(tw_name+"_joints")

        if len(joints) > 0:
            for j in joints:
                try:
                    cmds.setAttr(j + '.displayLocalAxis', state)
                except:
                    pass            
                    
    def selectCurModMainPoser(self):
        cmds.select(self.main.curModule.name + "_mainPoser")



    # Modules

    def load_modules(self): #
        modules_groups = cmds.listRelatives('modules') or []
        self.modules = {}
        
        for f in modules_groups:
            if cmds.attributeQuery('moduleType', node=f, exists=True):
                moduleName = f[:-4]
                m = utils.getModuleInstance(moduleName)
                if not m:
                    continue
                m.main = self.main

                self.modules[moduleName] = m

    def create_module(self, moduleName, moduleType, options): #
        moduleTypeCap = utils.capitalizeName(moduleType)

        # importlib.import_module('rigStudio3.modules.%s.%s' % (moduleType, moduleType))
        exec('from .modules.%s import %s' % (moduleType, moduleType)) 	# from .modules.moduleA import moduleA
        exec('importlib.reload(%s)' % (moduleType))						# importlib.reload(moduleA)
        m = eval('%s.%s(moduleName)' % (moduleType, moduleTypeCap))  	# m = modules.moduleA.moduleA.ModuleA(name)
        m.main = self.main
        m.create(options)
        

        self.modules[moduleName] = m

        self.toggleVis_posers()
        self.toggleVis_controls()
        self.toggleVis_joints()

        return m
    
    def getMirroredModule(self, module):
        moduleName = module.name
        side = utils.getObjectSide(moduleName)

        if side == 'l' or side == "r": 
            for m_name in self.modules:
                if m_name == utils.getOpposite(moduleName):
                    m = self.modules[m_name]
                    return m

        return False

    def getModuleChildren(self, name):
        children = []
        for m_name in self.modules:
            m = self.modules[m_name]
            mPar_name = utils.getModuleName(m.parent)
            if mPar_name == name:
                children.append(m.name)
        #print children
        return children
