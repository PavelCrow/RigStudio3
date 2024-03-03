import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import os
import math

from . import utils, main, twist, additionalControl, parents, inbetweens

rootPath = os.path.normpath(os.path.dirname(__file__))

#mel_scripts_path = rootPath + '/rigTools'
#if mel_scripts_path not in os.environ[ 'MAYA_SCRIPT_PATH' ]:
    #os.environ[ 'MAYA_SCRIPT_PATH' ] += ';' + mel_scripts_path
    ##print "ADDED path"
#mel.eval("source pk_makeControls")


class Module(object):
    def __init__(self): #
        self.main = None
        self.type = ""
        self.name = ""
        self.root = ""
        self.parent = None
        self.symmetrical = False
        self.opposite = False
        self.joints = []
        self.additionalControls = []

    def connectSignals(self, mainInstance, w): #
        pass

    def create(self, options={}):
        self.root = self.name + "_mod"

        # import
        template_path = os.path.join(rootPath, "modules", self.type, self.type+'.ma')
        utils.importFile(template_path, self.name)

        # sets update
        cmds.sets(self.name+'_sets', e=1, forceElement='modules_sets' )
        cmds.sets(self.name+'_nodesSet', e=1, forceElement=self.name+'_sets')

        def createControlSet(s):
            new_s = s.replace("moduleC", "c")
            cmds.select(clear=1)
            cmds.sets(n=new_s)
            objs = cmds.sets(s, q=1) or []
            for o in objs:
                if cmds.objectType(o) == 'objectSet':
                    sub_s = createControlSet(o)
                    cmds.sets(sub_s, e=1, forceElement=new_s)
                else:
                    cmds.sets(o, e=1, forceElement=new_s)
            return new_s

        control_set = self.name+'_moduleControlSet'

        control_set = createControlSet(self.name+'_moduleControlSet')
        cmds.sets(control_set, e=1, forceElement='controlSet' )
        
        # add types attr
        utils.setUserAttr(self.root, "moduleType", self.type)		
        controls = utils.getSetObjects(control_set)
        for c in controls:
            utils.setUserAttr(c, "type", "control")
            utils.setUserAttr(c, "internalName", c.replace(self.name+"_", ""))

        self.addSkinJoints()

        self.joints = self.getJoints()

        for o in ['_system', '_input']:
            if cmds.objExists(self.name+o):
                cmds.hide(self.name+o)

        # correct posers size
        # for p in pm.listRelatives(self.name + "_posers", allDescendents=1):
        #     if p.split("_")[-1] in ['poser', 'mainPoser']:
        #         try:
        #             size = p.size.get() * cmds.getAttr("main.posersSize")
        #             p.size.set(size)
        #         except:
        #             print("Cannot set size attr in the poser")

        cmds.parent(self.root, 'modules')

        cmds.refresh()

    def addSkinJoints(self, m_name=None):
        if not m_name:
            m_name = self.name

        joints = []
        if cmds.objExists(m_name+'_outJointsSet'):
            joints = cmds.sets(m_name+'_outJointsSet', q=1)

        # create skeleton grp
        joints_grp = m_name+'_outJoints'
        outJoints_grp = joints_grp+'_group'

        cmds.showHidden(joints_grp)
        cmds.duplicate(joints_grp, n=outJoints_grp)
        allJoints = pm.listRelatives(outJoints_grp, allDescendents=1)
        # utils.setUserAttr(outJoints_grp, "moduleName", m_name)	
        # utils.setUserAttr(outJoints_grp, "moduleType", self.type)			
        cmds.hide(joints_grp)

        # connect joints and delete all except joints
        for o in allJoints:
            # if "_volume_" in o.name():
            #     pm.delete(o)
            #     continue

            # delete if not joint or have not a joint
            if pm.objectType(o) != 'joint':
                childs = pm.listRelatives(o, allDescendents=1)
                childs_joints = []
                for ch in childs:
                    if pm.objectType(ch) == 'joint':
                        childs_joints.append(ch)
                if len(childs_joints) == 0:
                    pm.delete(o)
                    continue

            # connect
            srcName = o.name().split('|')[-1]
            o.rename(srcName.replace('outJoint', 'joint').replace('outRootJoint', 'rootJoint').replace('outGroup', 'group'))
            utils.connectTrandform(srcName, o.name())

            # correct scale joint
            # if utils.objectIsOpposite(m_name+"_mod"):
                # mult_s = cmds.createNode('multMatrix', n=m_name+"_globalScale_multMatrix")
                # comp = cmds.createNode('composeMatrix', n=m_name+"_globalScale_composeMatrix")
                # cmds.setAttr(comp+".inputScaleX", -1)
                # cmds.connectAttr(m_name+"_mainPoser.worldMatrix", mult_s+".matrixIn[0]")
                # cmds.connectAttr(comp+".outputMatrix", mult_s+".matrixIn[1]")
                # root_dec = cmds.createNode('decomposeMatrix', n=m_name+"_globalScale_decomposeMatrix")
                # cmds.connectAttr(mult_s+".matrixSum", root_dec+".inputMatrix")
            # else:	
            if not cmds.objExists(m_name+"_mainPoser_decomposeMatrix"):
                root_dec = cmds.createNode('decomposeMatrix', n=m_name+"_mainPoser_decomposeMatrix")
                cmds.connectAttr(m_name+"_mainPoser.worldMatrix[0]", root_dec+".inputMatrix")
                # cmds.warning("Module has not mainPoser_decomposeMatrix and was created")
            else:
                root_dec = m_name+"_mainPoser_decomposeMatrix"

            mult = cmds.createNode('multiplyDivide', n=o+"_invScale_multiplyDivide")
            cmds.connectAttr(srcName+".t", mult+".input1")
            cmds.connectAttr(root_dec+".outputScaleX", mult+".input2X") # set absolute scale
            cmds.connectAttr(root_dec+".outputScaleX", mult+".input2Y")
            cmds.connectAttr(root_dec+".outputScaleX", mult+".input2Z")
            cmds.connectAttr(mult+".outputX", o+".tx", f=1)
            cmds.connectAttr(mult+".outputY", o+".ty", f=1)
            cmds.connectAttr(mult+".outputZ", o+".tz", f=1)

            # correct joint size
            if o.split("_")[-1] == 'joint':

                cmds.setAttr(o+".segmentScaleCompensate", 0)

                r = o.radius.get() * cmds.getAttr("main.jointsSize")
                o.radius.set(r)
                if o.name() == m_name +"_root_joint":
                    # utils.resetJointOrient(o.name())
                    cmds.setAttr(o.name()+".jointOrient", 0,0,0)

        # connect root joints
        joints_ = cmds.listRelatives(outJoints_grp) or []
        for j in joints_:
            cmds.parent(j, 'skeleton')
            utils.connectByMatrix(j, [j.replace("joint", "outJoint"), j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], m_name)

            # correct scale joint
            mult = cmds.createNode('multiplyDivide', n=j+"_jointInvScale_multiplyDivide")
            utils.addModuleNameAttr(mult, m_name)
            cmds.connectAttr(root_dec+".outputScale", mult+".input2")
            cmds.connectAttr(m_name+"_root_joint_decMat.outputScale", mult+".input1")
            cmds.setAttr(mult+".operation", 2)

            cmds.connectAttr(mult+".outputX", j+".scaleX", f=1)
            cmds.connectAttr(mult+".outputY", j+".scaleY", f=1)
            cmds.connectAttr(mult+".outputZ", j+".scaleZ", f=1)

            if cmds.objExists(m_name+"_mirror_condition"):
                mult2 = cmds.createNode('multDoubleLinear', n=j+"_jointInvReverseScale_multDoubleLinear")
                utils.addModuleNameAttr(mult2, m_name)
                cmds.connectAttr(j+"_jointInvScale_multiplyDivide.outputZ", mult2+".input1", f=1)
                cmds.connectAttr(m_name+"_mirror_condition.outColorR", mult2+".input2", f=1)
                cmds.connectAttr(mult2+".output", j+".scaleZ", f=1)

            cmds.setAttr(j+".segmentScaleCompensate", 0)


        if not cmds.objExists('skinJointsSet'):
            cmds.sets(n='skinJointsSet')	
            cmds.sets('skinJointsSet', e=1, forceElement='sets' )

        for j in joints:
            sj = j.replace("outJoint", "joint")
            if cmds.objExists(sj):
                cmds.sets(sj, e=1, forceElement='skinJointsSet')

        cmds.delete(outJoints_grp)

    def getJoints(self):
        outJoints = cmds.listRelatives(self.name + '_outJoints', allDescendents=1) or []
        joints = []
        for j in outJoints:
            joints.append(j.replace("outJ", "j"))
        return joints

    def delete(self):
        cmds.delete(self.root)

        # remove another nodes
        nodes = cmds.sets(self.name+"_nodesSet", q=1)
        for n in nodes:
            if cmds.objExists(n):
                cmds.delete(n)

        if not cmds.objExists('sets'):
            utils.create_default_sets()
    
    def isSymmetrical(self): # 
        return self.name.split('_')[0] == "l" and cmds.objExists("r"+self.name[1:]+'_mod')
    
    def isOpposite(self): #
        return self.name.split('_')[0] == "r" and cmds.objExists("l"+self.name[1:]+'_mod')

    def load(self): #
        self.root = self.name + "_mod"
        self.type = cmds.getAttr(self.root+'.moduleType')
        self.parent = self.getParent()
        self.joints = self.getJoints()
        self.additionalControls = self.getAdditionalControls()
        self.symmetrical = self.isSymmetrical()
        self.opposite = self.isOpposite()

    def connect(self, target, opposite=False):
        # print ("Connect to", target)
        connector = self.name+"_root_connector"
        # root = self.name + "_root_poserOrient"
        root_poser = self.name + "_root_poser"
        targetType = target.split("_")[-1]
        
        targetMainPoser = utils.getModuleName(target) + "_mainPoser"
        targetInit = target[:-len(targetType)] + "initLoc"
        target_joint = target[:-len(targetType)] + "joint"
        target_outJoint = target[:-len(targetType)] + "outJoint"
        connector_parent = self.name + "_input"
        
        # save position
        initMatrix = cmds.xform(self.name+'_mainPoser', query=True, ws=True, m=True)

        # make connections
        utils.connectToOffsetParentMatrix(self.name+'_posers', [targetMainPoser])
        utils.connectToOffsetParentMatrix(connector, [root_poser, targetInit, target_outJoint, connector_parent], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'worldInverseMatrix[0]'])
        
        self.parent = target_joint
        # utils.setUserAttr(self.name+"_mod", "parent", self.parent)
        # Symmetry Module Add Connections
        # self.connectOpposite()

        # restore position
        cmds.xform(self.name+'_mainPoser', ws=True, m=initMatrix)		

        # add poser connection curve
        # curve = self.name+'_connectionLine'
        # cmds.curve(d=1, p=[(0,0,0),(1,0,0)], n=curve)
        # utils.setUserAttr(curve, "moduleName", self.name)	
        # cl1 = cmds.cluster(curve+'.cv[0]', relative=1)
        # cl2 = cmds.cluster(curve+'.cv[1]', relative=1)
        # gr = cmds.group(empty=1, n=curve+'_group')
        # utils.setUserAttr(gr, "moduleName", self.name)	
        # cmds.parent(curve, cl1[1], cl2[1], gr)
        # cmds.parent(gr, self.name+'_posers')
        # cmds.hide(cl1, cl2)
        # cmds.setAttr(curve+'.overrideEnabled', 1)
        # cmds.setAttr(curve+'.overrideDisplayType', 2)
        # cmds.pointConstraint(root_poser, cl1, mo=0)
        # cmds.pointConstraint(targetInit, cl2, mo=0)

        # reroot skin joints
        joints = cmds.listRelatives(self.name+"_outJoints") or []
        for j in joints:
            if cmds.objectType(j) != 'joint':
                continue
            root_j = j.replace("outJoint", "joint")
            cmds.parent(root_j, target_joint)
            utils.removeTransformParentJoint(root_j)
            utils.resetJointOrient(root_j)

        if opposite:
            self.opposite = True
            opp_name = utils.getOpposite(self.name)
            opp_mod = utils.getModuleInstance(opp_name)

            compMat = cmds.createNode('composeMatrix', n=self.name+"_mainPoser_compMat")
            cmds.setAttr(compMat+".inputScaleX", -1)

            cmds.setAttr(self.name+'_mainPoser.sx', lock=0)
            cmds.setAttr(self.name+'_mainPoser.sy', lock=0)
            cmds.setAttr(self.name+'_mainPoser.sz', lock=0)
            utils.connectByMatrix(self.name+'_mainPoser', [opp_name+"_mainPoser", compMat, self.name+"_mainPoser" ], ['worldMatrix[0]', 'outputMatrix', 'parentInverseMatrix[0]'], self.name)
            
            # set mirror attribute if exists
            if cmds.objExists(self.name+"_mod.mirror"):
                cmds.setAttr(self.name+"_mod.mirror", 1)

        cmds.select(target)

    def connectOpposite(self):
        # opp_name = utils.getOpposite(self.name)
        side = utils.getObjectSide(self.name)
        if side != 'r':# or not cmds.objExists(opp_name+'_mod'):
            return

        cmds.undoInfo(openChunk=True)

        mirror_moduleName = utils.getOpposite(self.name)
        opp_mod = utils.getModuleInstance(mirror_moduleName)

        target = opp_mod.parent

        if target != "":
            src_modName = utils.getModuleName(target)
            # print 333, target, target != "", opp_mod.name
            src_side = utils.getObjectSide(src_modName)

            # Symmetry Module Add Connections if parent module is symmetrical
            if (src_side == 'r' or src_side == 'l') and cmds.objExists(mirror_moduleName+'_mod'):
                if not cmds.isConnected(mirror_moduleName+'_mainPoser.translate', self.name+'_mainPoser.translate'):
                    cmds.connectAttr(mirror_moduleName+'_mainPoser.translate', self.name+'_mainPoser.translate')
                    cmds.connectAttr(mirror_moduleName+'_mainPoser.rotate', self.name+'_mainPoser.rotate')
                    cmds.connectAttr(mirror_moduleName+'_mainPoser.scale', self.name+'_mainPoser.scale')

            # if parent module is central 
            else:
                compMat = cmds.createNode('composeMatrix', n=self.name+"_mainPoser_compMat")
                cmds.setAttr(compMat+".inputScaleX", -1)

                cmds.setAttr(self.name+'_mainPoser.sx', lock=0)
                cmds.setAttr(self.name+'_mainPoser.sy', lock=0)
                cmds.setAttr(self.name+'_mainPoser.sz', lock=0)
                # utils.connectByMatrix(self.name+'_mainPoser', [mirror_moduleName+"_mainPoser", compMat, self.name+"_mainPoser"], ['worldMatrix[0]', 'outputMatrix', 'parentInverseMatrix[0]'], self.name)
                utils.connectByMatrix(self.name+'_mainPoser', [mirror_moduleName+"_mainPoser", compMat, self.name+"_mainPoser" ], ['worldMatrix[0]', 'outputMatrix', 'parentInverseMatrix[0]'], self.name)

        # if parent not exists
        else:
            compMat = cmds.createNode('composeMatrix', n=self.name+"_mainPoser_compMat")
            utils.addModuleNameAttr(compMat, self.name)
            cmds.setAttr(compMat+".inputScaleX", -1)

            utils.connectByMatrix(self.name+'_mainPoser', [mirror_moduleName+"_mainPoser", compMat, self.name+"_mainPoser"], ['worldMatrix[0]', 'outputMatrix', 'parentInverseMatrix[0]'], self.name)

        # connect sym posers
        tgt_posers = cmds.listRelatives(self.name+'_posers', type='transform', allDescendents=1)
        for t_p in tgt_posers:
            if t_p.split("_")[-1] in ['poser', 'mainPoser']:
                s_p = t_p.replace(self.name, mirror_moduleName)

                attrs = utils.getVisibleAttrs(t_p)

                for a in attrs:
                    if not cmds.isConnected(s_p+'.'+a, t_p+'.'+a):
                        try:
                            cmds.setAttr(t_p+'.'+a, lock=0)
                            cmds.connectAttr(s_p+'.'+a, t_p+'.'+a)
                        except: pass

                if cmds.objExists(t_p+"NurbsShape"):
                    cmds.sets(t_p+"NurbsShape", e=1, forceElement='black_rsSG')
                    # cmds.select(t_p+"NurbsShape")
                    # cmds.hyperShade(assign= "black_rsMat")

                if not cmds.isConnected( s_p+'.v', t_p+'.v' ):
                    cmds.setAttr(t_p+'.v', lock=0)
                    cmds.connectAttr(s_p+'.v', t_p+'.v')				

            elif t_p.split("_")[-1] == 'mainPoser':
                cmds.hide(t_p+"Shape")
        
        self.parent = utils.getOpposite(target)
        self.opposite = True

        # reroot skin joints
        joints = cmds.listRelatives(self.name+"_outJoints") or []
        for j in joints:
            if cmds.objectType(j) != 'joint':
                continue
            root_j = j.replace("outJoint", "joint")
            cmds.parent(root_j, target.replace("outJoint", "joint"))
            utils.removeTransformParentJoint(root_j)
            utils.resetJointOrient(root_j)

        # set mirror attribute if exists
        if cmds.objExists(self.name+"_mod.mirror"):
            cmds.setAttr(self.name+"_mod.mirror", 1)
        
        cmds.undoInfo(closeChunk=True)

    def setControlAttrs(self, data):
        for attr in data['controlsData']:
            intName, attrName = attr.split('.')
            cName = data['controlsNamesData'][intName]
            if cmds.objExists(cName+'.'+attrName):
                if not cmds.connectionInfo(cName+'.'+attrName, isDestination=1):
                    if not cmds.connectionInfo(cName+'.'+attrName, isLocked=1):
                        cmds.setAttr( cName+'.'+attrName, data['controlsData'][attr] )
                    else:
                        print ('Attribite %s is locked' %(cName+'.'+attrName))

    def updateOptionsPage(self, widget):
        pass

    def getControls(self):
        controls = utils.getSetObjects(self.name+'_moduleControlSet')

        controls_duplicatesFree = []
        for c in controls:
            if c not in controls_duplicatesFree:
                controls_duplicatesFree.append(c)

        return controls_duplicatesFree

    def getPosers(self):
        posers = {}
        for p in cmds.listRelatives(self.name+'_posers', allDescendents=1, type="transform"):
            path = cmds.ls(p, l=1)
            if p.split('_')[-1] == "poser":
                posers[str(len(str(path)))+p] = p
        posers_sorted = []
        for id in sorted(posers):
            posers_sorted.append(posers[id])

        return posers_sorted	

    def getParentGroups(self): #
        parents = []

        control_set = self.name+'_moduleControlSet'
        if cmds.objExists(control_set):
            # controls = cmds.sets(control_set, q=1)
            controls = utils.getSetObjects(control_set)
            for c in controls:
                if cmds.objExists(c+'_parentsGroup'):
                    parents.append(c+'_parentsGroup')

        return parents	

    def getData(self):
        data = {}

        # simple data
        data['name'] = self.name
        data['type'] = self.type
        data['parent'] = self.parent
        data['symmetrical'] = self.symmetrical
        data['opposite'] = self.opposite
        data['snapped'] = self.isSnapped()

        # parents
        par_list = []
        parentsObjs = self.getParentGroups()
        for p in parentsObjs:
            pData = parents.Parents.getDataFromNode(p)
            par_list.append(pData)
        data['parents'] = par_list

        # posers data
        # posersMatrixData = {}
        posersAttrsData = {}
        # posersParentData = {}
        posers = cmds.listRelatives(self.name+'_posers', allDescendents=1)
        for p in posers:
            if p.split("_")[-1] == 'poser' or p.split("_")[-1] == 'mainPoser':
                p_name = utils.getTemplatedNameFromReal(self.name, p)
                # posersMatrixData[p_name] = cmds.xform(p, q=1, m=1, ws=1)

                attrs_data = {}
                for attr in utils.getVisibleAttrs(p):
                    value = cmds.getAttr(p + "." + attr)
                    attrs_data[attr] = value
                posersAttrsData[p_name] = attrs_data
                
                # posersParentData[p_name] = utils.getTemplatedNameFromReal(self.name, cmds.listRelatives(p, p=1)[0])

        data['posersAttrsData'] = posersAttrsData
        # data['posersParentData'] = posersParentData
        # data['posersMatrixData'] = posersMatrixData
        # data['posersSizeData'] = posersSizeData

        # module options data
        if cmds.objExists(self.name+'_mod.options'):
            optionsData = utils.attrToPy(self.name+'_mod.options')
        else:
            optionsData = {}
        data['optionsData'] = optionsData

        # controls data
        controlsData = {}
        controlsNamesData = {}
        controlsVisData = {}
        controlsColorData = {}
        controlsShapeData = {}
        posersShapeData = {}

        posersNames = utils.getSetObjects(self.name+'_poserShapesForConnectSet')
        for pName in posersNames:
            poserInst = utils.getControlInstance(pName)
            name = pName.split(self.name+"_")[-1]
            posersShapeData[name] = poserInst.makePythonCommand(useInternalName=False)
        data['posersShapeData'] = posersShapeData	

        controlNames = utils.getSetObjects(self.name+'_moduleControlSet')
        for cName in controlNames:
            # name
            control = cmds.getAttr(cName + ".internalName")
            controlsNamesData[control] = utils.getTemplatedNameFromReal(self.name, cName)

            # attributes
            for attr in utils.getVisibleAttrs(cName):
                attrVar = cmds.getAttr(cName + "." + attr)
                controlsData[(control + "." + attr)] = attrVar

            # visibility
            shapes = cmds.listRelatives(cName, s=1)
            if shapes:
                vis = cmds.getAttr(shapes[0]+'.v')		
                controlsVisData[control] = vis

                # color
                if cmds.getAttr(shapes[0]+".overrideEnabled"):
                    color = cmds.getAttr(shapes[0]+'.overrideColor')
                else:
                    color = 0
                controlsColorData[control] = color
                # shape
                controlInst = utils.getControlInstance(cName)
                controlsShapeData[control] = controlInst.makePythonCommand(useInternalName=True)

        data['controlsNamesData'] = controlsNamesData	
        data['controlsData'] = controlsData	
        data['controlsVisData'] = controlsVisData	
        data['controlsColorData'] = controlsColorData	
        data['controlsShapeData'] = controlsShapeData	

        # get twists data
        twistsData = []
        twists = []
        if cmds.objExists("twists"):
            tw_mods = cmds.listRelatives('twists', type='transform') or []
            for tw_mod in tw_mods:
                moduleName = utils.getModuleName(tw_mod)
                if moduleName == self.name:
                    twists.append(tw_mod.split('_mod')[0])		
            for tw in twists:
                try:
                    twData = twist.Twist.getData(tw, self.name)
                    twistsData.append(twData)
                except: cmds.warning("Twist get data is skipped", tw)
        data['twistsData'] = twistsData	

        # get inbetweens
        ibData = []
        ibs = cmds.ls("*_ibRoot")
        for ib in ibs:		
            ibData = inbetweens.Inbetweens.getIbData(ib, self.name)

        # get additional controls data
        addCtrlsData = []
        for c in self.additionalControls:
            p = c.name+"_addPoser"
            if not cmds.objExists(p): continue			
            cData = c.getData()
            cData["parent"] = utils.getTemplatedNameFromReal(self.name, cData["parent"])
            cData["poserParent"] = utils.getTemplatedNameFromReal(self.name, cmds.listRelatives(p, p=1)[0])
            # print c.name, cData["colorId"] 

            # attrs_data = {}
            # for attr in utils.getVisibleAttrs(p):
                # value = cmds.getAttr(p + "." + attr)
                # attrs_data[attr] = value
            # cData["poserAttrsData"] = attrs_data			

            addCtrlsData.append(cData)

        data['additionalControlsData'] = addCtrlsData	

        # data['nodePosition'] = [self.node.pos().x(), self.node.pos().y()]

        # print( '-------------------')
        # for d in data:
        #     print (d, data[d])
        # print( '-------------------')
        return data

    def setData(self, data, sym=False, namingForce=False): 
        if not sym:
            pass
            # at first to set root main poser
            # for p in data['posersMatrixData']:
            #     if p == "MODNAME_mainPoser":
            #         mat = data['posersMatrixData'][p]
            #         p_name = utils.getRealNameFromTemplated(self.name, p)
            #         cmds.xform(p_name, m=mat, ws=1)
                    # print "set ", p

            # second to set another main posers
            # for p in data['posersMatrixData']:
            #     if p.split("_")[-1] == 'mainPoser':	
            #         mat = data['posersMatrixData'][p]
            #         p_name = utils.getRealNameFromTemplated(self.name, p)
            #         if cmds.objExists(p_name):
            #             cmds.xform(p_name, m=mat, ws=1)
                    # print "set 2 ", p

        # set posers parent
        # for p in sorted(data['posersParentData']):
        #     p_name = utils.getRealNameFromTemplated(self.name, p)
        #     parent = utils.getRealNameFromTemplated(self.name, data['posersParentData'][p])
        #     if cmds.objExists(p_name):
        #         if parent != cmds.listRelatives(p_name, p=1)[0]:
        #             cmds.parent(p_name, parent)

        if not sym:
            # set posers positions and size
            for p in sorted(data['posersAttrsData']):
                attrData = data['posersAttrsData'][p]
                # print (p, attrData)
                p_name = utils.getRealNameFromTemplated(self.name, p)				

                if cmds.objExists(p_name):
                    # if p.split("_")[-1] == 'mainPoser':
                    #     cmds.setAttr(p_name+'.size', attrData["size"])
                    #     continue

                    for attr in attrData:
                        value = attrData[attr]
                        # print (attr, value)
                        try:
                            cmds.setAttr(p_name+'.'+attr, value)
                        except: pass #print p_name+'.'+attr, "is locked"

                    # for a in ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ"]:
                    #     if a not in attrData:
                    #         cmds.setAttr(p_name+"."+a, l=1, k=0, cb=0)	

        # set control names
        # print "SET Control Names ----------------", self.name
        controlNames = utils.getSetObjects(self.name+'_moduleControlSet')
        # print sym, controlNames
        controls = []
        for cName in controlNames:
            controls.append(pm.PyNode(cName))
        for c in controls:
            cName = c.name()
            int_name = utils.getInternalNameFromControl(cName)
            # print "---", cName, int_name
            try:
                savedName_templated = data['controlsNamesData'][int_name]
                savedName = utils.getRealNameFromTemplated(self.name, savedName_templated)
                if sym and not "MODNAME" in savedName_templated:
                    savedName = utils.getOpposite(savedName)

                # print "READ", sym, self.name, "-----", cName, int_name, savedName_templated, savedName
                if cName != savedName:
                    if not namingForce: # if not need to increment name
                        if cmds.objExists(savedName):
                            savedName = utils.incrementNameIfExists(savedName)				
                    # print "RENAME", cName, savedName
                    utils.renameControl(cName, savedName)
            except: pass # control is not exists in saved data

        if not sym:
            # set controls shapes
            for ctrl in data['controlsShapeData']:
                # print ctrl, "---- > " , data['controlsShapeData'][ctrl]
                ctrlName = data['controlsNamesData'][ctrl]
                ctrlName = utils.getRealNameFromTemplated(self.name, ctrlName)
                # print ctrl, "---- > " , ctrlName
                if not cmds.objExists(ctrlName):
                    continue
                cmd = data['controlsShapeData'][ctrl]

                utils.setUserAttr(ctrlName, 'customShapeCommand', cmd, type="string")
                # print ctrlName, data['controlsShapeData'][ctrl]
                control = utils.getControlInstance(ctrlName)
                if control:
                    control.replaceShape(cmd)

            # set posers shapes
            if 'posersShapeData' in data:
                for p in data['posersShapeData']:
                    # print p, "---- > " , data['posersShapeData'][ctrl]
                    pName = self.name+"_"+p
                    if not cmds.objExists(pName):
                        continue
                    cmd = data['posersShapeData'][p]

                    utils.setUserAttr(pName, 'customShapeCommand', cmd, type="string")
                    control = utils.getControlInstance(pName)

                    # save out nodes from curve shape
                    poser = pm.PyNode(pName)
                    out_nodes = []
                    for node in poser.worldSpace[0].outputs():
                        out_nodes.append(node)
                        # print poser, node
                        try:
                            pm.disconnectAttr(poser.getShape().worldSpace[0], node.target[0].targetGeometry)
                        except: 
                            pm.disconnectAttr(poser.getShape().worldSpace[0], node.inputCurve)

                    # set shape
                    control.replaceShape(cmd)

                    # restore shape connections
                    for node in out_nodes:
                        try:
                            poser.getShape().worldSpace[0] >> node.target[0].targetGeometry
                        except:
                            poser.getShape().worldSpace[0] >> node.inputCurve

        # controls visibility and color
        controlNames = utils.getSetObjects(self.name+'_moduleControlSet')
        for cName in controlNames:
            try:
                intName = utils.getInternalNameFromControl(cName)
                savedName_templated = data['controlsNamesData'][intName]
                savedName = utils.getRealNameFromTemplated(self.name, savedName_templated)
                if sym and not "MODNAME" in savedName_templated:
                    savedName = utils.getOpposite(savedName)

                shapes = cmds.listRelatives(cName, s=1)

                for s in shapes:
                    try:
                        cmds.setAttr(s+'.v', data['controlsVisData'][intName])		
                    except: pass

                    if data['controlsColorData'][intName]:
                        cmds.setAttr(s+".overrideEnabled", 1)
                    else:
                        cmds.setAttr(s+".overrideEnabled", 1)
                    cmds.setAttr(s+'.overrideColor', data['controlsColorData'][intName])				
                # except: pass

                # attributes
                default_attrs = utils.getVisibleAttrs(cName)
                for a in default_attrs:
                    if intName+"."+a in data['controlsData']:
                        cmds.setAttr(cName+"."+a, data['controlsData'][intName+"."+a])
                    else:
                        cmds.setAttr(cName+"."+a, keyable=0, lock=1)

            except: pass # control is not exists in saved data

        if not sym:
            self.setOptions(data['optionsData'])

    def getParent(self): #
        conn = cmds.listConnections(self.name+'_root_connector.offsetParentMatrix', source=1, destination=0) or []
        if conn:
            mm = conn[0]
            parents = cmds.listConnections(mm+'.matrixIn[2]', source=1, destination=0) or []
            if parents: 
                parent = parents[0]
                # check another connection
                parentModule = utils.getModuleName(parent)
                in_nodes = cmds.listConnections(self.name+'_posers.offsetParentMatrix', source=1, destination=0) or []
                if in_nodes:
                    if in_nodes[0] == parentModule + "_mainPoser":
                        return parent
        return None

    def disconnect(self):
        target = self.parent
        if not target:
            return

        # save init mainPoser transforms
        initMatrix = cmds.xform(self.name+'_mainPoser', query=True, ws=True, m=True)

        # disconnect
        parentModule = utils.getModuleName(target)
        cmds.disconnectAttr(parentModule+'_mainPoser.worldMatrix', self.name+"_posers.offsetParentMatrix")
        cmds.delete(self.name+'_root_connector_multMat')

        # self.snapToParent(False)

        # delete line group
        # if cmds.objExists(self.name + "_connectionLine_group"):
        #     cmds.delete(self.name + "_connectionLine_group")

        # restore main poser position
        # if not self.opposite:
        #     utils.resetAttrs(self.name+"_posers")
        #     utils.resetAttrs(self.name+"_root_connector")
        #     cmds.xform(self.name+'_mainPoser', ws=True, m=initMatrix)

        # update attrs
        self.parent = ""
        # utils.setUserAttr(self.name+"_mod", 'parent', '')

        # reroot skin joints
        jointsRoot = self.name+'_root_joint'
        utils.parentTo(jointsRoot, 'skeleton')	
        utils.removeTransformParentJoint(jointsRoot)
        utils.resetJointOrient(jointsRoot)

        # fix viewport bug
        # p = cmds.listRelatives(target.replace("joint", "initLoc"), p=1)[0]
        # cmds.select(p)
        # cmds.refresh()	

    def snapToParent(self, state):
        # return if already snapped
        if self.isSnapped() == state:
            return

        parentModule = utils.getModuleName(self.parent.replace("joint", "outJoint"))
        parent_p = cmds.listRelatives(self.parent.replace("joint", "initLoc"), p=1)[0]
        if parent_p.split("_")[-1] == 'poserOrient':
            parent_p = cmds.listRelatives(parent_p, p=1)[0]
        root_j = self.name+"_root_joint"
        root_j_opp = utils.getOpposite(self.name+"_root_joint")
        parent_j_opp = utils.getOpposite(self.parent)

        # move and hide/unhide poser
        if not self.opposite:
            if state:
                # create additional nodes
                mMat = cmds.createNode('multMatrix', n=self.name+"_parentSnap_multMat")
                dMat = cmds.createNode('decomposeMatrix', n=self.name+"_parentSnap_decMat")		

                # set new nodes attrs
                utils.addModuleNameAttr(mMat, self.name)		
                utils.addModuleNameAttr(dMat, self.name)

                # make connections
                cmds.connectAttr(self.name+"_root_poser.worldMatrix[0]", mMat+'.matrixIn[0]')
                cmds.connectAttr(parentModule+"_mainPoser.worldInverseMatrix[0]", mMat+'.matrixIn[1]')
                cmds.connectAttr(mMat+".matrixSum", dMat+'.inputMatrix')
                cmds.connectAttr(dMat+".outputTranslateX", parent_p+'.translateX', f=1)
                cmds.connectAttr(dMat+".outputTranslateY", parent_p+'.translateY', f=1)
                cmds.connectAttr(dMat+".outputTranslateZ", parent_p+'.translateZ', f=1)
                # cmds.connectAttr(self.name+"_root_poser.lineWidth", parent_p+'.lineWidth', f=1)
                # cmds.connectAttr(self.name+"_root_poser.size", parent_p+'.size', f=1)

                cmds.hide(parent_p)

                cmds.connectAttr(self.name+"_root_poser.size", parent_p+".size")		
                cmds.connectAttr(self.name+"_root_poser.lineWidth", parent_p+".lineWidth")

                # change joints hierarchy
                if cmds.objExists(self.parent):
                    cmds.parent(root_j, cmds.listRelatives(self.parent,p=1)[0])
                    utils.resetJointOrient(root_j)
                    utils.removeTransformParentJoint(root_j)
                    cmds.delete(self.parent)

                if cmds.objExists(parent_j_opp) and cmds.objExists(root_j_opp) and root_j_opp != root_j:
                    utils.parentTo(root_j_opp, cmds.listRelatives(parent_j_opp,p=1)[0])
                    utils.resetJointOrient(root_j_opp)
                    cmds.delete(parent_j_opp)				

            else:
                if cmds.objExists(self.name+'_parentSnap_decMat'):
                    cmds.delete(self.name+'_parentSnap_decMat')
                # cmds.disconnectAttr(self.name+"_root_poser.lineWidth", parent_p+'.lineWidth')
                # cmds.disconnectAttr(self.name+"_root_poser.size", parent_p+'.size')
                cmds.showHidden(parent_p)

                # change joints hierarchy
                cmds.duplicate(self.parent.replace("joint", "outJoint"), n=self.parent)[0]
                pm.delete(pm.listRelatives(self.parent))
                par = cmds.listRelatives(self.parent.replace("joint", "outJoint"), p=1)[0]
                cmds.parent(self.parent, par.replace("outJoint", "joint"))
                utils.resetJointOrient(self.parent)
                utils.removeTransformParentJoint(self.parent)
                cmds.parent(root_j, self.parent)
                utils.resetJointOrient(root_j)
                utils.removeTransformParentJoint(root_j)
                utils.connectTrandform(self.parent.replace("_joint", "_outJoint"), self.parent)

                cmds.disconnectAttr(self.name+"_root_poser.size", parent_p+".size")
                cmds.disconnectAttr(self.name+"_root_poser.lineWidth", parent_p+".lineWidth")

                if cmds.objExists(root_j_opp) and root_j_opp != root_j:
                    cmds.duplicate(parent_j_opp.replace("joint", "outJoint"), n=parent_j_opp)[0]
                    utils.parentTo(parent_j_opp, utils.getOpposite(par.replace("outJoint", "joint")))
                    utils.resetJointOrient(parent_j_opp)
                    utils.parentTo(root_j_opp, parent_j_opp)
                    utils.resetJointOrient(root_j_opp)
                    utils.connectTrandform(parent_j_opp.replace("_joint", "_outJoint"), parent_j_opp)

    def isSnapped(self):
        return False
        # print 22, self.parent
        if self.parent and self.parent != "":
            # print (123, self.parent)
            parent_p = cmds.listRelatives(self.parent.replace("joint", "initLoc"), p=1)[0]
            if parent_p.split("_")[-1] == 'poserOrient':
                parent_p = cmds.listRelatives(parent_p, p=1)[0]			
            return not cmds.getAttr(parent_p+".v")
        else:
            return False

    def setOptions(self, options):
        pass

    def getOptions(self):
        return False

    def rename(self, new_name): #
        # rename all nodes
        allNodes = cmds.sets(self.name+"_nodesSet", q=1)
        allSets = utils.getSetsInSet(self.name+"_sets")
        allNodes += allSets
        allNodes.append(self.name + '_sets')

        for o in allNodes:
            if cmds.objExists(o):
                length_name = len(self.name)
                if o[:length_name] == self.name:
                    objWithoutName = o[length_name+1:]
                    cmds.rename(o, new_name + "_" + objWithoutName)

        # rename controlSet
        if cmds.objExists(self.name + '_controlSet'):
            cmds.rename(self.name + '_controlSet', new_name + '_controlSet')

        self.name = new_name
        self.root = self.name + "_mod"


    """ Additional Controls """

    def addAdditionalControl(self, name="", parent="", shape="", data={}):
        if name == "":
            ctrl = additionalControl.AdditionalControl(data=data)
            name = data["name"]
        else:
            # name = utils.incrementNameIfExists(name)
            # print 333, name, parent, shape
            ctrl = additionalControl.AdditionalControl(name, parent, shape)

        if cmds.objExists(self.name+'_controlSet'):
            cmds.sets(name, e=1, forceElement=self.name+'_controlSet' )
        cmds.sets(name, e=1, forceElement=self.name+'_moduleControlSet' )

        self.getAdditionalControls()

        return ctrl

    def getAdditionalControlInstance(self, controlName):
        for c in self.additionalControls:
            if c.name == controlName:
                return c
        return None

    def getAdditionalControls(self):
        additionalControls = []

        controls = utils.getSetObjects(self.name+'_moduleControlSet')
        for c_name in controls:
            if cmds.objExists(c_name+'.type'):
                if cmds.getAttr(c_name+'.type') == 'additionalControl':
                    c = utils.getAdditionalControlInstance(c_name)
                    additionalControls.append(c)

        unsorted_list = []
        for c in additionalControls:
            unsorted_list.append(c)
            # print 111, self.name, c.name	
        def getChildren(obj):
            childs = []
            for c in additionalControls:
                # print " - ", obj, c.name, c.parent
                if c.parent == obj:
                    childs.append(c)
            return childs

        check_controls = []
        for c in controls:
            # print c
            if cmds.objExists(c_name+'.type'):
                try:
                    if cmds.getAttr(c+'.type') == 'control':
                        # print self.name, c
                        for ch in getChildren(c):
                            # print self.name, c, ch.name
                            ch.deep = 0
                            unsorted_list.remove(ch)
                            check_controls.append(ch)
                except:
                    pass
        # print "------", self.name, check_controls, unsorted_list
        # for o in unsorted_list:
            # print 111, o.name
        # for o in check_controls:
            # print 222, o.name
        # update deep attribute
        deep = 1
        i = 0
        while len(unsorted_list) > 0 and i < 10:
            i += 1
            # print self.name, i
            check_list = []
            for root_c in check_controls:
                childs = getChildren(root_c.name)

                for ch in childs:
                    ch.deep = deep
                    check_list.append(ch)
                    unsorted_list.remove(ch)
            deep += 1
            check_controls = check_list
        if i == 10:
            cmds.warning("Additional controls wrong counting")

        # sort by deep
        sorted_list_raw = []
        for c in additionalControls:
            sorted_list_raw.append((c.deep, c.name, c))

        sorted_list_raw.sort(
            key = lambda l: (l[0], l[1])
        )		

        # save sorted list
        sorted_controls = []
        for deep, c_name, c in sorted(sorted_list_raw):
            # print deep, c.name
            sorted_controls.append(c)

        self.additionalControls = sorted_controls
        return sorted_controls

    def toggleLRA(self, v="None"):
        module_joints = []
        joints = cmds.listRelatives('skeleton', allDescendents=1, type='joint') or []
        for j in joints:
            if cmds.objExists(j+'.moduleName') and cmds.getAttr(j+'.moduleName') == self.name:
                module_joints.append(j)

        if v == "None" and module_joints:
            v = not cmds.getAttr(module_joints[0]+'.displayLocalAxis')

        for j in module_joints:
            cmds.setAttr(j+'.displayLocalAxis', v)

        if self.symmetrical:
            for j in module_joints:
                cmds.setAttr(utils.getOpposite(j)+'.displayLocalAxis', v)	

    def toggle_posersAxises(self, state=None):
        if state == None:
            v = not cmds.getAttr(self.getPosers()[0]+'.axises')
        else:
            v = state
        for p in self.getPosers():
            if cmds.objExists(p+'.axises'):
                try:
                    cmds.setAttr(p+'.axises', v)
                except: pass

    def getControlsParents(self):
        parented = []
        control_set = self.name+'_moduleControlSet'
        if cmds.objExists(control_set):
            controls = utils.getSetObjects(control_set)
            for c in controls:
                if cmds.objExists(c+'_parentsGroup'):
                    parented.append(c)

        return parented

    def getClosestInitLoc(self, src_object, mod_name=""):
        if mod_name == "":
            mod_name = self.name

        src_mod = utils.getModuleName(src_object)
        posers = cmds.listRelatives(mod_name+'_mainPoser', type='transform', allDescendents=1) or []

        closest_distance = 10000000
        closest = ""
        # print 6666, posers
        for p in posers:
            if p.split("_")[-1] == 'initLoc':
                # print 55, src_object, p
                pos1 = cmds.xform(src_object, query=True, translation=True, worldSpace=True)
                pos2 = cmds.xform(p, query=True, translation=True, worldSpace=True)
                distance = math.sqrt( math.pow((pos1[0]-pos2[0]),2) + math.pow((pos1[1]-pos2[1]),2) + math.pow((pos1[2]-pos2[2]),2))				

                if distance < closest_distance:
                    closest_distance = distance
                    closest = p

        return closest		

    def bake(self, addObjects=[], forceDelete=[]):
        list = []
        def disc(o):
            for c in cmds.listAttr( o, c=True):
                if "." in c:
                    continue
                conns = cmds.listConnections(o+'.'+c, plugs=1, d=1, s=0) or []
                if len(conns) == 0:
                    continue
                for conn in conns:
                    if conn.split(".")[0] == o:
                        continue
                    # print c, conn
                    out_node = conn.split(".")[0]
                    if cmds.objectType(out_node) in ["multMatrix", "aimConstraint", "blendColors"]:
                        disc(out_node)
                        continue
                    list.append([o+"."+c, conn])
                    pm.setAttr(conn, lock=False)
                    cmds.disconnectAttr(o+"."+c, conn)
                    # print "START", conn, o+"."+c

                    if c.split(".")[-1] == "scale":
                        v = cmds.getAttr(o+"."+c)
                        v = v[0]						
                        try:
                            cmds.setAttr( conn+"X", v[0] )
                            cmds.setAttr( conn+"Y", v[1] )
                            cmds.setAttr( conn+"Z", v[2] )
                        except: pass

        def discStright(s,t):
            try:
                pm.disconnectAttr(s,t)
            except: pass


        for name in forceDelete:
            o = pm.PyNode(name)

            # disconnect connections
            for a in o.listAttr():
                conns_out = cmds.listConnections(o.name(), plugs=1, connections=1, s=0, d=1) or []
                sources_out = conns_out[::2]
                targets_out = conns_out[1::2]
                # print 111, name, sources_out
                for i, s in enumerate(sources_out):    
                    try:
                        v = cmds.getAttr(targets_out[i])
                        pm.disconnectAttr(sources_out[i], targets_out[i])
                        cmds.setAttr(targets_out[i], v)
                    except: pass				

            pm.delete(o)

        # disonnect posers
        objects = [self.name+"_root_connector"] + addObjects

        for name in objects:
            o = pm.PyNode(name)
            # get input connections
            conns = pm.listConnections(o.parentInverseMatrix[0], plugs=1, d=1, s=0) or []
            if len(conns) > 0:
                conn = conns[0]
                if "Constraint" not in conn.name():
                    mm, a = conn.split(".")
                    # print conn
                    id = int(a.split("[")[-1][:-1])
                    in_node = pm.PyNode(mm+"."+a.replace(str(id), str(id-1))).inputs()[0]

                    dm = o.tx.inputs()[0]
                    discStright(dm.outputTranslateX, o.tx)
                    discStright(dm.outputTranslateY, o.ty)
                    discStright(dm.outputTranslateZ, o.tz)
                    discStright(dm.outputRotateX, o.rx)
                    discStright(dm.outputRotateY, o.ry)
                    discStright(dm.outputRotateZ, o.rz)
                    discStright(dm.outputScaleX, o.sx)
                    discStright(dm.outputScaleY, o.sy)
                    discStright(dm.outputScaleZ, o.sz)

                    pm.parentConstraint(in_node, o, mo=1)
                    pm.scaleConstraint(in_node, o, mo=1)

        # delete posers group
        p_group = pm.PyNode(self.name+"_posers")        

        for child in pm.listRelatives(p_group, allDescendents=1):
            disc(child.name())

        # print list
        pm.delete(p_group)				
