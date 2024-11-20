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
        self.seamless = False
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
        
        # set tag as controller
        cmds.select(control_set)
        mel.eval("TagAsController")
        cmds.select(clear=1)
        
        cmds.parent(self.root, 'modules')

        self.addSkinJoints()

        self.joints = self.getJoints()

        for o in ['_system', '_input']:
            if cmds.objExists(self.name+o):
                cmds.hide(self.name+o)
        cmds.showHidden(self.name+"_outJoints")

        # correct posers size
        # for p in pm.listRelatives(self.name + "_posers", allDescendents=1):
        #     if p.split("_")[-1] in ['poser', 'mainPoser']:
        #         try:
        #             size = p.size.get() * cmds.getAttr("main.posersSize")
        #             p.size.set(size)
        #         except:
        #             print("Cannot set size attr in the poser")

        cmds.refresh()

    def addSkinJoints(self, m_name=None):
        if not m_name:
            m_name = self.name

        # joints = cmds.ls(m_name+'*_outJoint')
        skin_joints = cmds.sets(m_name+'_skinJointsSet', q=1)

        # create skeleton grp
        out_joints_grp = m_name+'_outJoints'
        joints_grp = out_joints_grp+'_group'
        
        cmds.duplicate(out_joints_grp, n=joints_grp)
        joints = pm.listRelatives(joints_grp, allDescendents=1)
        
        # connect joints and delete all except joints
        for o in joints:
            # connect
            srcName = o.name().split('|')[-1]

            # if not srcName in skin_joints:
            if pm.objectType(o) != "joint":
                pm.delete(o)
                continue

            o.rename(srcName.replace('outJoint', 'joint').replace('outRootJoint', 'rootJoint').replace('outGroup', 'group'))
            utils.connectTrandform(srcName, o.name())
            
            if not cmds.objExists(m_name+"_mainPoser_decomposeMatrix"):
                root_dec = cmds.createNode('decomposeMatrix', n=m_name+"_mainPoser_decomposeMatrix")
                cmds.connectAttr(m_name+"_mainPoser.worldMatrix[0]", root_dec+".inputMatrix")
                utils.addToModuleSet(root_dec, self.name)
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
            utils.addToModuleSet(mult, self.name)

            # correct joint size
            if o.split("_")[-1] == 'joint':

                cmds.setAttr(o+".segmentScaleCompensate", 0)

                r = o.radius.get() * cmds.getAttr("main.jointsSize")
                o.radius.set(r)
                if o.name() == m_name +"_root_joint":
                    # utils.resetJointOrient(o.name())
                    cmds.setAttr(o.name()+".jointOrient", 0,0,0)
        
        # connect root joints
        joints_ = cmds.listRelatives(joints_grp) or []
        
        for j in joints_:
            cmds.parent(j, 'skeleton')
            utils.removeTransformParentJoint(j)
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
            if not pm.objExists(j):
                continue
            sj = j.name()
            cmds.sets(sj, e=1, forceElement='skinJointsSet')
            cmds.sets(sj, e=1, rm=self.name+'_skinJointsSet')
            
            # if cmds.getAttr(sj+".drawStyle", settable=1):
            #     cmds.setAttr(sj+".drawStyle", 0)

        cmds.delete(joints_grp)

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

        utils.create_default_sets()
    
    def isSymmetrical(self): # 
        return self.name.split('_')[0] == "l" and cmds.objExists("r"+self.name[1:]+'_mod')
    
    def isOpposite(self): #
        return self.name.split('_')[0] == "r" and cmds.objExists("l"+self.name[1:]+'_mod')

    def load(self): #
        self.root = self.name + "_mod"
        self.type = cmds.getAttr(self.root+'.moduleType')
        self.opposite = self.isOpposite()
        self.parent = self.getParent()
        self.joints = self.getJoints()
        self.additionalControls = self.getAdditionalControls()
        self.symmetrical = self.isSymmetrical()
        self.seamless = self.isSeamless()

    def connect(self, target, opposite=False, makeSeamless=False):
        # print ("Connect to", target)    
        connector = self.name+"_root_connector"
        # root = self.name + "_root_poserOrient"
        root_poser = self.name + "_root_poser"
        targetType = target.split("_")[-1]
        
        target_module_name = utils.getModuleName(target)
        targetMainPoser = target_module_name + "_mainPoser"
        target_poser = target[:-len(targetType)] + "poser"
        target_add_poser = target[:-len(targetType)] + "addPoser"
        target_joint = target[:-len(targetType)] + "joint"
        target_outJoint = target[:-len(targetType)] + "outJoint"
        target_initLoc = target[:-len(targetType)] + "initLoc"
        connector_parent = cmds.listRelatives(connector, p=1)[0]

        if cmds.objExists(target_add_poser):
            target_poser = target_add_poser

        if not cmds.objExists(target_poser):
            target_poser = utils.getClosestPoser(target_module_name, target_joint)
        
        if not cmds.objExists(target_outJoint):
            target_outJoint = utils.getClosestOutJoint(target_module_name, target)
            target_initLoc = target_outJoint.replace("outJoint", "initLoc")
            target_joint = target_outJoint.replace("outJoint", "joint")
        
        # save position
        initMatrix = cmds.xform(self.name+'_mainPoser', query=True, ws=True, m=True)
        
        # make connections
        utils.connectToOffsetParentMatrix(self.name+'_posers', [targetMainPoser])

        # if opposite:
        #     # mirror composematrix
        #     mirror_compMat1 = cmds.createNode('composeMatrix', n=self.name+"_connector_compMat")
        #     utils.addToModuleSet(mirror_compMat1, self.name)
        #     # connect to mirrored condition if target module is symmetrical and negate composematrix
        #     # else not negate composematrix
        #     if cmds.objExists(target_module_name+"_mirror_condition"):
        #         cmds.connectAttr(target_module_name+"_mirror_condition.outColorR", mirror_compMat1+".inputScaleZ")

        #     utils.connectToOffsetParentMatrix(connector, [root_poser, target_initLoc, mirror_compMat1, target_outJoint, connector_parent], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'outputMatrix', 'worldMatrix[0]', 'worldInverseMatrix[0]'])
        # else:

        utils.connectToOffsetParentMatrix(connector, [root_poser, target_initLoc, target_outJoint, connector_parent], ['worldMatrix[0]', 'worldInverseMatrix[0]', 'worldMatrix[0]', 'worldInverseMatrix[0]'])
        
        self.parent = target_outJoint

        # restore position
        cmds.xform(self.name+'_mainPoser', ws=True, m=initMatrix)		

        # add poser connection curve
        curve = self.name+'_connectionLine'
        cmds.curve(d=1, p=[(0,0,0),(1,0,0)], n=curve)
        cl1 = cmds.cluster(curve+'.cv[0]', relative=1)
        cl2 = cmds.cluster(curve+'.cv[1]', relative=1)
        gr = cmds.group(empty=1, n=curve+'_group')
        cmds.parent(curve, cl1[1], cl2[1], gr)
        cmds.parent(gr, self.name+'_posers')
        cmds.hide(cl1, cl2)
        cmds.setAttr(curve+'.overrideEnabled', 1)
        cmds.setAttr(curve+'.overrideDisplayType', 2)
        cmds.pointConstraint(root_poser, cl1, mo=0)
        cmds.pointConstraint(target_poser, cl2, mo=0)

        for o in [curve, gr, cl1, cl2 ]:
            utils.addToModuleSet(o, self.name)

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
            
            # mirror composematrix
            mirror_compMat2 = cmds.createNode('composeMatrix', n=self.name+"_mainPoser_compMat")
            cmds.setAttr(mirror_compMat2+".inputScaleX", -1)
            utils.addToModuleSet(mirror_compMat2, self.name)

            # connect main poser
            cmds.setAttr(self.name+'_mainPoser.sx', lock=0)
            cmds.setAttr(self.name+'_mainPoser.sy', lock=0)
            cmds.setAttr(self.name+'_mainPoser.sz', lock=0)
            utils.connectByMatrix(self.name+'_mainPoser', [opp_name+"_mainPoser", mirror_compMat2, self.name+"_mainPoser" ], ['worldMatrix[0]', 'outputMatrix', 'parentInverseMatrix[0]'], self.name)
            
            # connect posers
            for p in self.getPosers():
                utils.connectTrandform(utils.getOpposite(p), p)

            # set mirror attribute if exists
            if cmds.objExists(self.name+"_mod.mirror"):
                cmds.setAttr(self.name+"_mod.mirror", 1)

            cmds.hide(self.name+"_posers")

        if makeSeamless:
            self.makeSeamless(True)

        cmds.select(target)

    def disconnect(self): #
        target = self.parent
        if not target:
            return
        
        # disconnect
        parentModule = utils.getModuleName(target)
        cmds.disconnectAttr(parentModule+'_mainPoser.worldMatrix', self.name+"_posers.offsetParentMatrix")
        cmds.delete(self.name+'_root_connector_multMat')

        # reset connector matrix
        def_mat = [1,0,0,0,0,1,0,0,0,0,1,0,0,0,0,1]
        cmds.setAttr(self.name+'_root_connector.offsetParentMatrix', def_mat, type = "matrix")

        # delete line group
        if cmds.objExists(self.name + "_connectionLine_group"):
            cmds.delete(self.name + "_connectionLine_group")

        # update attrs
        self.parent = ""

        # reroot skin joints
        jointsRoot = self.name+'_root_joint'
        utils.parentTo(jointsRoot, 'skeleton')	
        utils.removeTransformParentJoint(jointsRoot)
        utils.resetJointOrient(jointsRoot)

    def setControlAttrs(self, data):
        for attr in data['controlsAttrData']:
            intName, attrName = attr.split('.')
            cName = data['controlsNamesData'][intName]
            if cmds.objExists(cName+'.'+attrName):
                if not cmds.connectionInfo(cName+'.'+attrName, isDestination=1):
                    if not cmds.connectionInfo(cName+'.'+attrName, isLocked=1):
                        cmds.setAttr( cName+'.'+attrName, data['controlsAttrData'][attr] )
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

    def getData(self): #

        def getOSParents():
            def getParentGroups(): #
                parents = []
                control_set = self.name+'_moduleControlSet'
                if cmds.objExists(control_set):
                    # controls = cmds.sets(control_set, q=1)
                    controls = utils.getSetObjects(control_set)
                    for c in controls:
                        if cmds.objExists(c+'_parentsGroup'):
                            parents.append(c+'_parentsGroup')
                return parents	
            
            par_list = []
            parentsObjs = getParentGroups()
            for p in parentsObjs:
                pData = parents.Parents.getDataFromNode(p)
                par_list.append(pData)
            return par_list

        def getPosersAttrData():
            posersAttrsData = {}
            posers = cmds.listRelatives(self.name+'_posers', allDescendents=1)
            for p in posers:
                if p.split("_")[-1] == 'poser' or p.split("_")[-1] == 'mainPoser':
                    p_name = utils.getTemplatedNameFromReal(self.name, p)
                    attrs_data = {}
                    for attr in utils.getVisibleAttrs(p):
                        value = cmds.getAttr(p + "." + attr)
                        attrs_data[attr] = value
                    posersAttrsData[p_name] = attrs_data
            return posersAttrsData

        def getPosersShapesData():
            posersShapeData = {}
            posersNames = utils.getSetObjects(self.name+'_poserShapesForConnectSet')
            for pName in posersNames:
                name = pName.split(self.name+"_")[-1]
                posersShapeData[name] = utils.curveShapeToCommand(pName)
            return posersShapeData	
    
        def getControlsShapeData():
            controlsAttrData = {}
            controlsNamesData = {}
            controlsVisData = {}
            controlsColorData = {}
            controlsShapeData = {}

            controlNames = utils.getSetObjects(self.name+'_moduleControlSet')
            for cName in controlNames:
                # name
                control = cmds.getAttr(cName + ".internalName")
                controlsNamesData[control] = utils.getTemplatedNameFromReal(self.name, cName)
                # attributes
                for attr in utils.getVisibleAttrs(cName):
                    attrVar = cmds.getAttr(cName + "." + attr)
                    controlsAttrData[(control + "." + attr)] = attrVar
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
                    controlsShapeData[control] = utils.curveShapeToCommand(cName)

            return controlsAttrData, controlsNamesData, controlsVisData, controlsColorData, controlsShapeData

        def getAddControlsData():
            addCtrlsData = []
            for c in self.additionalControls:
                p = c.name+"_addPoser"
                if not cmds.objExists(p): continue			
                cData = c.getData()
                cData["parent"] = cData["parent"]
                cData["poserParent"] = cmds.listRelatives(p, p=1)[0]
                # print c.name, cData["colorId"] 

                # attrs_data = {}
                # for attr in utils.getVisibleAttrs(p):
                    # value = cmds.getAttr(p + "." + attr)
                    # attrs_data[attr] = value
                # cData["poserAttrsData"] = attrs_data			

                addCtrlsData.append(cData)

            return addCtrlsData
        
        def getTwistsData():
            # get twists data
            twistsData = []
            twists = []
            if cmds.objExists("twists"):
                tw_mods = cmds.listRelatives('twists', type='transform') or []
                for tw_mod in tw_mods:
                    tw_joint = tw_mod[:-4] + "_joint"
                    moduleName = utils.getModuleName(tw_joint)
                    if moduleName == self.name:
                        twists.append(tw_mod[:-4])
                for tw in twists:
                    twData = twist.Twist.getData(tw, self.name)
                    twistsData.append(twData)
            return twistsData
        
        data = {}
        data['name'] = self.name
        data['type'] = self.type
        data['parent'] = self.parent
        data['symmetrical'] = self.symmetrical
        data['opposite'] = self.opposite
        data['seamless'] = self.seamless
        data['parents'] = getOSParents()
        data['posersAttrsData'] = getPosersAttrData()
        data['posersShapeData'] = getPosersShapesData()
        data['optionsData'] = self.getOptions()
        controlsData = getControlsShapeData()
        data['controlsAttrData'] = controlsData[0]	
        data['controlsNamesData'] = controlsData[1]	
        data['controlsVisData'] = controlsData[2]
        data['controlsColorData'] = controlsData[3]	
        data['controlsShapeData'] = controlsData[4]	
        data['additionalControlsData'] = getAddControlsData()	
        data['twistsData'] = getTwistsData()	

        # print( '-------------------')
        # for d in data:
        #     print (d, data[d])
        # print (111111, data["twistsData"])
        # print( '-------------------')
        return data

    def setData(self, data, sym=False, namingForce=False, load="all"): 
        # set posers
        if load == "posers" or load == "all":
            if not sym:
                for p in sorted(data['posersAttrsData']):
                    attrData = data['posersAttrsData'][p]
                    p_name = utils.getRealNameFromTemplated(self.name, p)				
                    if cmds.objExists(p_name):
                        for attr in attrData:
                            value = attrData[attr]
                            if not cmds.objExists(p_name+'.'+attr):
                                cmds.warning("Missed attr " + p_name+'.'+attr)
                                continue
                            # if not (cmds.listConnections(p_name+'.'+attr, d=False, s=True) or []) and not cmds.getAttr(p_name+'.'+attr, lock=1): # only not connections and not locked
                            try:
                                cmds.setAttr(p_name+'.'+attr, value)
                            except: pass
        
        # set control names
        if load == "controlNames" or load == "all":
            controlNames = utils.getSetObjects(self.name+'_moduleControlSet')
            controls = []
            for cName in controlNames:
                controls.append(pm.PyNode(cName))
            for c in controls:
                cName = c.name()
                int_name = utils.getInternalNameFromControl(cName)
                try:
                    savedName_templated = data['controlsNamesData'][int_name]
                    savedName = utils.getRealNameFromTemplated(self.name, savedName_templated)
                    if sym and not "MODNAME" in savedName_templated:
                        savedName = utils.getOpposite(savedName)
                    if cName != savedName:
                        if not namingForce: # if not need to increment name
                            if cmds.objExists(savedName):
                                savedName = utils.incrementNameIfExists(savedName)				
                        utils.renameControl(cName, savedName)
                except: print ("Skipped setting control name", int_name)

        # set controls shapes
        if load == "controlShapes" or load == "all":
            if not sym:
                for ctrl in data['controlsShapeData']:
                    # print (ctrl, "---- > " , data['controlsShapeData'][ctrl])
                    ctrlName = data['controlsNamesData'][ctrl]
                    ctrlName = utils.getRealNameFromTemplated(self.name, ctrlName)
                    # print (ctrl, "---- > " , ctrlName)
                    if not cmds.objExists(ctrlName):
                        continue
                    cmd = data['controlsShapeData'][ctrl]
                    utils.setUserAttr(ctrlName, 'customShapeCommand', cmd, type="string")
                    control = utils.getControlInstance(ctrlName)
                    if control:
                        control.setShape(cmd)
            
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
                    control.setShape(cmd)

                    # restore shape connections
                    for node in out_nodes:
                        try:
                            poser.getShape().worldSpace[0] >> node.target[0].targetGeometry
                        except:
                            poser.getShape().worldSpace[0] >> node.inputCurve

        # controls visibility and color
        if load == "controlVis" or load == "all":
            controlNames = utils.getSetObjects(self.name+'_moduleControlSet')
            for cName in controlNames:
                # try:
                intName = utils.getInternalNameFromControl(cName)
                
                if intName not in data['controlsNamesData']:
                    cmds.warning("Missed control data to load "+ cName)
                    continue

                savedName_templated = data['controlsNamesData'][intName]
                savedName = utils.getRealNameFromTemplated(self.name, savedName_templated)
                if sym and not "MODNAME" in savedName_templated:
                    savedName = utils.getOpposite(savedName)

                shapes = cmds.listRelatives(cName, s=1)

                for s in shapes:
                    try:
                        cmds.setAttr(s+'.v', data['controlsVisData'][intName])		
                    except: cmds.warning(s+" shape cannot change visibility")

                    if data['controlsColorData'][intName]:
                        cmds.setAttr(s+".overrideEnabled", 1)
                    else:
                        cmds.setAttr(s+".overrideEnabled", 1)
                    cmds.setAttr(s+'.overrideColor', data['controlsColorData'][intName])				

                # attributes
                default_attrs = utils.getVisibleAttrs(cName)
                for a in default_attrs:
                    if intName+"."+a in data['controlsAttrData']:
                        try:
                            cmds.setAttr(cName+"."+a, data['controlsAttrData'][intName+"."+a])
                        except: 
                            cmds.warning(cName+"."+a+" is cannot set data "+str(data['controlsAttrData'][intName+"."+a]))
                    else:
                        cmds.setAttr(cName+"."+a, keyable=0, lock=1)

                # except: cmds.warning(cName+" control is not exists in saved data")
        
        # set options
        if load == "options" or load == "all":
            if not sym:
                if data["seamless"] and not self.isSeamless(): 
                    self.makeSeamless(True)
                self.setOptions(data['optionsData'])

    def getIbtwsData(self):
        # get twists data
        ibtwsData = []
        roots = cmds.ls("*_ibtw_root")
        
        for root in roots:
            if utils.getObjectSide(root) == "r" and cmds.objExists(utils.getOpposite(root)):
                continue
            
            if root[:(len(self.name))] == self.name: # if start of the ibts name == module name
                ibtw = root.split("_ibtw_root")[0]
                ibtwData = self.main.ibtwClass.getData(ibtw)
                ibtwsData.append(ibtwData)
                
        return ibtwsData

    def setMirroredNames():
        pass

    def getParent(self): #
        # get multmatrix of the connector
        conn = cmds.listConnections(self.name+'_root_connector.offsetParentMatrix', source=1, destination=0) or []
        if conn:
            mm = conn[0]
            # get taget node from multmatrix
            # if self.opposite:
            #     parents = cmds.listConnections(mm+'.matrixIn[3]', source=1, destination=0) or []
            # else:
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

    def makeSeamless(self, state): #
        if not self.parent:
            cmds.warning("Has not parent")
            return
        
        # return if already seamless
        if self.isSeamless() == state:
            cmds.warning("Allready have this seamless state")
            return
        
        if self.opposite:
            return
        
        parentModule_name = utils.getModuleName(self.parent)
        parent_module = self.main.rig.modules[parentModule_name]
        parent_p = self.parent.replace("outJoint", "poser")
        self_root_j = self.name+"_root_joint"
        parent_j = self.parent.replace("outJoint", "joint")

        # return if several children
        children = self.main.rig.getModuleChildren(parentModule_name)
        if len(children) > 1:
            cmds.warning("Module cannot be seamless with several children")
            return
        
        if not cmds.objExists(parent_p):
            parent_p = utils.getClosestPoser(parentModule_name, self.parent)

        self.seamless = state

        if state:
            # if module connected not to root, match the parent poser to root poser
            if self.parent.split("_")[-2] != "root":
                cmds.pointConstraint(self.name+"_root_poser", parent_p, mo=0)
                cmds.orientConstraint(self.name+"_root_poser", parent_p, mo=0)

            # change parent of the joint to parent of parent
            p_j = cmds.listRelatives(self_root_j, p=1)[0] # end_joint
            pp_j = cmds.listRelatives(p_j, p=1)[0] # parent of the end_joint
            cmds.parent(self_root_j, pp_j)

            # move the useless joint to output group and hide it
            # print(3333, self.name, p_j, parentModule_name+"_output")
            cmds.parent(p_j, parentModule_name+"_output")
            cmds.hide(p_j)

            # hide poser
            cmds.setAttr(parent_p+'.lodVisibility', 0)

            if self.symmetrical:
                self_root_j_opp = utils.getOpposite(self_root_j)
                p_j_opp = cmds.listRelatives(self_root_j_opp, p=1)[0] # end_joint
                pp_j_opp = cmds.listRelatives(p_j_opp, p=1)[0] # parent of the end_joint
                # print("--------------- check--", self_root_j_opp, p_j_opp, pp_j_opp)
                cmds.parent(self_root_j_opp, pp_j_opp)
                if parent_module.symmetrical:
                    cmds.parent(utils.getOpposite(p_j), utils.getOpposite(parentModule_name+"_output"))
                    cmds.hide(utils.getOpposite(p_j))
                    cmds.setAttr(utils.getOpposite(parent_p)+'.lodVisibility', 0)

        else:
            if not self.isSeamless():
                cmds.warning("Not seamless")
                return

            # restore parent joint position to skeleton
            # if parent module is the root
            if parent_j.split("_")[-2] == "root":
                if parent_module.parent:
                    pp_j = parent_module.parent.replace("outJoint", "joint")
                else:
                    pp_j = "skeleton"
                cmds.parent(parent_j, pp_j)
                
                if self.symmetrical and parent_module.symmetrical:
                    cmds.parent(utils.getOpposite(parent_j), utils.getOpposite(pp_j))
            else:
                p_j = cmds.listRelatives(self.parent, p=1)[0].replace("outJoint", "joint")
                cmds.parent(parent_j, p_j)

                if self.symmetrical:
                    if not cmds.listRelatives(utils.getOpposite(parent_j), p=1)[0] == utils.getOpposite(p_j):
                        cmds.parent(utils.getOpposite(parent_j), utils.getOpposite(p_j))

                # delete poser constraint
                con = cmds.listRelatives(parent_p, type="pointConstraint")[0]
                cmds.delete(con)

            # restore poser visibity
            cmds.setAttr(parent_p+'.lodVisibility', 1)

            # show root joint in skeleton
            cmds.showHidden(parent_j)

            # restore root joint
            cmds.parent(self_root_j, parent_j)

            if self.symmetrical:
                cmds.parent(utils.getOpposite(self_root_j), utils.getOpposite(parent_j))
                cmds.showHidden(utils.getOpposite(parent_j))
                cmds.setAttr(utils.getOpposite(parent_p)+'.lodVisibility', 1)

        # reset joint orients
        utils.resetJointOrient(self_root_j)
        if self.symmetrical:
            utils.resetJointOrient(utils.getOpposite(self_root_j))

    def isSeamless(self): #
        if not self.parent:
            return False
        
        parent_p = self.parent.replace("outJoint", "poser")
        parent_add_p = self.parent.replace("outJoint", "addPoser")
        if cmds.objExists(parent_add_p):
            parent_p = parent_add_p

        if not cmds.objExists(parent_p):
            target_module_name = utils.getModuleName(self.parent)
            parent_p = utils.getClosestPoser(target_module_name, self.parent)
        seamless = not cmds.getAttr(parent_p+'.lodVisibility')
        return seamless

    def setOptions(self, options):
        pass

    def getOptions(self): #
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
    # @ utils.oneStepUndo
    def addAdditionalControl(self, name="", parent="", shape="", data={}, updateData=True):
        if name == "":
            ctrl = additionalControl.AdditionalControl(data=data)
            name = data["name"]
        else:
            ctrl = additionalControl.AdditionalControl(name, parent, shape)

        if cmds.objExists(self.name+'_controlSet'):
            cmds.sets(name, e=1, forceElement=self.name+'_controlSet' )
        cmds.sets(name, e=1, forceElement=self.name+'_moduleControlSet' )

        if updateData:
            self.getAdditionalControls()

        return ctrl

    def getAdditionalControlInstance(self, controlName):
        for c in self.additionalControls:
            if c.name == controlName:
                return c
        return None

    def getAdditionalControls(self): #
        # get additional controls
        additionalControls = []
        controls = utils.getSetObjects(self.name+'_moduleControlSet')
        for c_name in controls:
            if utils.objectIsAdditionalControl(c_name):
                c = utils.getAdditionalControlInstance(c_name)
                additionalControls.append(c)

        # get list of the all add controls
        unsorted_list_raw = []
        for c in additionalControls:
            unsorted_list_raw.append((c.name, c))

        # get sorted list by name
        sorted_controls = []
        for c_name, c in sorted(unsorted_list_raw):
            sorted_controls.append(c)

        self.additionalControls = sorted_controls
        return sorted_controls

    def deleteAllAdditionalControls(self): #
        # get additional controls
        additionalControls = []
        controls = utils.getSetObjects(self.name+'_moduleControlSet')
        for c_name in controls:
            if utils.objectIsAdditionalControl(c_name):
                c = utils.getAdditionalControlInstance(c_name)
                additionalControls.append(c)
        
        for c in additionalControls:
            if cmds.objExists(c.name):
                c.delete()

    def setAddControlsData(self, mData, curMod_name=""):
        # increment names
        datas = mData['additionalControlsData']
        new_names = []
        for data in datas:
            name = data['name']
            if cmds.objExists(name):
                new_name = utils.incrementNameIfExists(name)
                while new_name in new_names:
                    new_name = utils.incrementName(new_name)
                data["name"] = new_name
                new_names.append(new_name)
                for d in datas:
                    par = d["parent"]
                    if par == name:
                        d["parent"] = new_name
                        # edit twist data
                        twData = mData["twistsData"]
                        for tw_d in twData:
                            s_j = tw_d["start_j"]
                            e_j = tw_d["end_j"]
                            if s_j.split("_joint")[0] == name:
                                tw_d["start_j"] = new_name + "_joint"
                            if e_j.split("_joint")[0] == name:
                                tw_d["end_j"] = new_name + "_joint"

        if curMod_name:
            m_name = curMod_name  # for load module 
        else:
            m_name = mData['name']  # for load full rig
        
        # add not mirrored addCtrls 
        addControls = []
        for cData in mData['additionalControlsData']:
            if not cData['opposite']:
                m = self.main.rig.modules[m_name]
                # parent add control to root joint
                c = m.addAdditionalControl(cData['name'], parent=m_name+"_root_joint", shape='circle', updateData=False)
                addControls.append(c)

        # parent add control to control from data
        for cData in mData['additionalControlsData']:
            if not cData['opposite']:
                par = utils.getRealNameFromTemplated(m_name, cData["parent"])
                for c in addControls:
                    if c.name == cData['name']:
                        c.setParent(par)

        self.getAdditionalControls()
        
        # set posers
        for cData in mData['additionalControlsData']:
            if not cData['opposite']:
                par = utils.getRealNameFromTemplated(m_name, cData["poserParent"])
                p = utils.getRealNameFromTemplated(m_name, cData['name'] + "_addPoser")
                if cmds.listRelatives(p, p=1)[0] != par:
                    cmds.parent(p, par)
                cmds.xform(p, m=cData['pos'], ws=1)

                attrData = cData['poserAttrsData']
                for attr in attrData:
                    value = attrData[attr]
                    try:
                        cmds.setAttr(p + '.' + attr, value)
                    except:
                        cmds.warning(p+'.'+attr+ " is locked")

                for a in ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ"]:
                    if a not in attrData:
                        cmds.setAttr(p + "." + a, l=1, k=0, cb=0)

        # set shapes and colors
        for cData in mData['additionalControlsData']:
            if not cData['opposite']:
                c = utils.getControlInstance(cData['name'])
                c.setShape(cData['shape'])
                c.setColor(cData['colorId'])

        # add opposite controls
        for cData in mData['additionalControlsData']:
            if cData['opposite']:
                c = utils.getControlInstance(utils.getOpposite(cData['name']))
                self.main.addControls_mirrorControl(c)

        # hide "hidden" controls
        for cData in mData['additionalControlsData']:
            if not cData['opposite']:
                for c_int_name in mData['controlsVisData']:
                    c_name = utils.getControlNameFromInternal(m_name, c_int_name)
                    if not mData['controlsVisData'][c_int_name]:
                        c = utils.getControlInstance(c_name)
                        # if c:
                        c.toggleVisible(manual=True, value=False)
                        # else:
                        #     print("!!!!!!", c_name)

        # set attributes
        for cData in mData['additionalControlsData']:
            c = utils.getControlInstance(cData['name'])
            if not c:
                cmds.warning("Missed add controls in "+cData['name'])
            intName = utils.getInternalNameFromControl(c.name)
            default_attrs = utils.getVisibleAttrs(c.name)
            for a in default_attrs:
                if intName + "." + a in mData['controlsAttrData']:
                    cmds.setAttr(c.name + "." + a, mData['controlsAttrData'][intName + "." + a])
                else:
                    cmds.setAttr(c.name + "." + a, keyable=0, lock=1)






    def toggleLRA(self, v="None"):
        module_joints = []
        
        if not self.main:
            return
        
        joints_vis = self.main.win.actionJoints.isChecked()
        if not joints_vis:
            return
        
        module_joints =  cmds.listRelatives(self.name+'_outJoints', type="joint", allDescendents=1) or []
        
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

    def twistOverride(self, t_name, data):
        pass

    def ibtwOverride(self, ibtw_name):
        pass