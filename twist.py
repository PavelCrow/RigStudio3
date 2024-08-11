import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import os, math

from .import main, utils


from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))


class Twist(object):
    def __init__(self, win):
        self.win = win
        self.twists = {}
        self.curTwistName = ""
        self.curTwist = {}

        self.connect()

        self.updateList()
        self.win.twist_frame.setEnabled(False)			

    def connect(self):
        self.win.addTwist_btn.clicked.connect(self.twists_add)
        self.win.addTwistSimple_btn.clicked.connect(partial(self.twists_add, advanced=False) )
        self.win.removeTwist_btn.clicked.connect(self.twists_remove)

        self.win.twists_listWidget.itemSelectionChanged.connect(self.selectItem)
        #self.win.twists_listWidget.itemClicked.connect(self.selectItem)
        self.win.twists_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		

        self.win.twist_attachRootToParent_btn.clicked.connect(self.attachToRoot)
        self.win.twist_attachEndToChild_btn.clicked.connect(self.attachToEnd)
        self.win.twist_attachRoot_btn.clicked.connect(partial(self.attach, socket="root"))
        self.win.twist_attachEnd_btn.clicked.connect(partial(self.attach, socket="end"))
        self.win.twist_reset_btn.clicked.connect(self.reset)
        self.win.changeJointsCount_btn.clicked.connect(self.changeJointsCount)
        self.win.twistToggleOffsetLocators_btn.clicked.connect(self.toggleOffsetLocators)

    def loadTwistsData(self):
        self.twists = {}

        if not cmds.objExists('twists'):
            return

        twists_gr = cmds.listRelatives('twists') or []
        for t_gr in twists_gr:
            twist = {}
            t_name = t_gr.split('_mod')[0]
            twist = self.getData(t_name)
            self.twists[t_name] = twist

    def doubleClckItem(self):
        if self.curTwistName: cmds.select(self.curTwistName+"_mod")

    def selectItem(self):
        # get current twist 
        try:
            self.curTwistName = self.win.twists_listWidget.currentItem().text()
            self.curTwist = self.twists[self.curTwistName]
        except:
            self.curTwistName = ''
            self.curTwist = {}

        # update cur twist frame
        self.updateFrame()

    def updateList(self):
        if not cmds.objExists('main'):
            return

        # update twists data
        self.loadTwistsData()

        twist_names = []
        for t in self.twists:
            twist_names.append(t)

        twist_names = sorted(twist_names)

        self.win.twists_listWidget.clear()
        for n in twist_names:
            item = QtWidgets.QListWidgetItem(n)
            self.win.twists_listWidget.addItem(item)

            if n.split('_')[0] == 'r':
                item.setForeground(QtGui.QBrush(QtGui.QColor("#6C6B6B")))		

    def updateFrame(self):
        if self.curTwistName == '':
            self.win.twist_frame.setEnabled(False)
            self.win.twistName_lineEdit.setText("")		
            self.win.twistRootJoint_lineEdit.setText("")		
            self.win.twistRootOrientJoint_lineEdit.setText("")
            self.win.twistEndJoint_lineEdit.setText("")
            self.win.twistsJointsCount_lineEdit.setText("")
        else:
            if not cmds.objExists(self.curTwistName+"_mod"):
                return
            self.win.twist_frame.setEnabled(True)
            data = self.getData(self.curTwistName)

            self.win.twistName_lineEdit.setText(self.curTwist['name'])	
            self.win.twistsJointsCount_lineEdit.setText(str(data['jointsCount']))

            self.win.twistRootJoint_lineEdit.setText(data['target'])
            self.win.twistRootOrientJoint_lineEdit.setText(data['rootOrientTarget'])
            self.win.twistEndJoint_lineEdit.setText(data['endOrientTarget'])

            self.curTwist = data
            
        if self.curTwistName.split('_')[0] == 'r':
            self.win.twist_frame.setEnabled(False)

    @utils.oneStepUndo
    def twists_add(self, data={}, module_name="", mirror=True, setHelpers=True, advanced=True):
        sel = cmds.ls(sl=1)

        def getChildJoint(root):

            def getChild(root_):
                childs = cmds.listRelatives(root_)
                joints = []
                for o in childs:
                    if cmds.objectType(o) == 'joint' and "_volume_joint" not in o:
                        joints.append(o)
                if len(joints) == 1:
                    child_joint = joints[0]
                    return child_joint
                else:
                    return False

            child_joint = getChild(root)
            if child_joint:
                return child_joint

            groups = []
            childs = cmds.listRelatives(root)
            for o in childs:
                if o.split("_")[-1] == "group":
                    groups.append(o)
            if len(groups) == 1:
                gr = groups[0]
                child_joint = getChild(gr)
                if child_joint:
                    return child_joint

            cmds.warning("Cannot find one child joint")
            return	False		

        def warning():
            cmds.warning(' Select skin joint with one child joint, or joint and child')

        if data == {}:
            # Check right selections
            if len(sel) == 1:
                start_j = sel[0]
                if cmds.objectType(start_j) != 'joint':
                    warning()
                    return			

                end_j = getChildJoint(start_j)

                if not end_j:
                    warning()
                    return
            elif len(sel) == 2:
                start_j = sel[0]
                if cmds.objectType(start_j) != 'joint':
                    warning()
                    return		
                end_j = sel[1]
                if cmds.objectType(end_j) != 'joint':
                    warning()
                    return	
            else:
                warning()
                return

            t_name = start_j.split('_joint')[0].split('_outJoint')[0]
        else:
            if module_name:
                t_name = utils.getRealNameFromTemplated(module_name, data['name'])
                start_j = utils.getRealNameFromTemplated(module_name, data['target'])
                end_j = utils.getRealNameFromTemplated(module_name, data['endTarget'])
            else:
                t_name = data['name']
                start_j = data['target']
                end_j = data['endTarget']

            if 'advanced' in data:
                advanced = data['advanced']
            else:
                advanced = False			

        # check this joint is have twist
        if t_name in self.twists:
            cmds.warning(' Selected joint have twist')
            return

        # import with namespace
        if advanced:
            path = os.path.join(rootPath, 'modules', '_twist.ma')
        else:
            path = os.path.join(rootPath, 'modules', '_twistSimple.ma')
        
        cmds.file(path, pr=1, i=1, type="mayaAscii", namespace='_temp_', ra=True, mergeNamespacesOnClash=False,options="v=0;")

        # rename and add all twist nodes to module set
        set = cmds.sets(name=t_name+'_twistNodesSet')
        nodes = cmds.ls('_temp_:*')
        moduleName = utils.getModuleName(t_name+"_joint")
        for n in nodes:
            if cmds.objExists(n):
                cmds.sets(n, e=1, forceElement=set)
                cmds.rename(n, n.replace("_temp_:", t_name+"_"))
        
        utils.addToModuleSet(set, moduleName)
        cmds.namespace(removeNamespace='_temp_')

        # add end target attribute
        utils.setUserAttr(t_name+"_mod", "endTarget", end_j.replace("joint", "outJoint"))
        
        # add controls to set
        if advanced:
            s = cmds.sets(n=moduleName+'_twist_controlSet')
            cmds.sets(t_name+"_twist", e=1, forceElement=s)
            cmds.sets(t_name+"_twist_1", e=1, forceElement=s)
            cmds.sets(t_name+"_twist_2", e=1, forceElement=s)
            cmds.sets(t_name+"_twist_3", e=1, forceElement=s)
            cmds.sets(s, e=1, forceElement=moduleName+"_controlSet")

            # set tag as controller
            cmds.select(moduleName+"_controlSet")
            mel.eval("TagAsController")
            cmds.select(clear=1)

        # root connector
        root_loc = cmds.spaceLocator(n=t_name+'_root_connectorLoc')[0]
        cmds.sets(root_loc, e=1, forceElement=set)
        cmds.setAttr(root_loc+'.overrideEnabled', 1)
        cmds.setAttr(root_loc+'.overrideColor', 13)
        cmds.setAttr(root_loc+".v", False)

        comp = cmds.createNode('composeMatrix', n=t_name+'_root_compMat')
        cmds.sets(comp, e=1, forceElement=set)
        
        utils.connectByMatrix(t_name+'_root_connector', [comp, root_loc], ['outputMatrix', 'worldMatrix[0]'], module_name=moduleName)

        # root up connector
        rootUpLoc = cmds.spaceLocator(n=t_name+'_rootUpLoc')[0]
        cmds.sets(rootUpLoc, e=1, forceElement=set)
        cmds.setAttr(rootUpLoc+".v", False)

        # end connector
        end_loc = cmds.spaceLocator(n=t_name+'_end_connectorLoc')[0]
        cmds.setAttr(end_loc+".localScale", 2,2,2)
        cmds.setAttr(end_loc+".v", False)
        cmds.sets(end_loc, e=1, forceElement=set)
        comp = cmds.createNode('composeMatrix', n=t_name+'_end_compMat')
        cmds.sets(comp, e=1, forceElement=set)
        # cmds.setAttr(comp+'.inputScaleX', -1)
        utils.connectByMatrix(t_name+'_end_connector', [comp, end_loc, t_name+'_root_connector'], ['outputMatrix', 'worldMatrix[0]', 'worldInverseMatrix[0]'], module_name=moduleName)

        # parent twist mod
        if not cmds.objExists("twists"):
            cmds.group(n="twists", empty=1)
            cmds.parent("twists", "rig")
        cmds.parent(t_name+'_mod', 'twists')

        # create absolute scale multiplier
        mult = cmds.createNode('multiplyDivide', n=t_name+'_absScaleMult')
        cmds.sets(mult, e=1, forceElement=set)
        cmds.connectAttr(t_name+'_root_connector.s', mult+'.input1')
        if cmds.getAttr(t_name+'_root_connector.sx') < 0: cmds.setAttr( mult+'.input2X', -1)
        if cmds.getAttr(t_name+'_root_connector.sy') < 0: cmds.setAttr( mult+'.input2Y', -1)
        if cmds.getAttr(t_name+'_root_connector.sz') < 0: cmds.setAttr( mult+'.input2Z', -1)

        cmds.hide(t_name+'_root_connectorShape', t_name+'_end_connector', t_name+'_start_connector')

        # make connections
        self.curTwistName = t_name
        cmds.parent(root_loc, rootUpLoc, start_j.replace("joint", "outJoint"))
        utils.resetAttrs(root_loc)
        utils.resetAttrs(rootUpLoc)
        cmds.parent(end_loc, end_j.replace("joint", "outJoint"))
        utils.resetAttrs(end_loc)
        
        if utils.objectIsOpposite(root_loc): # if mirrored
            comp = cmds.createNode('composeMatrix', n=t_name+'_aim_compMat')
            # cmds.setAttr(comp+".inputRotateY", 180)
            mult = cmds.createNode('multMatrix', n=t_name+'_aim_multMat')
            cmds.connectAttr(comp+".outputMatrix", mult+'.matrixIn[0]')
            cmds.connectAttr(rootUpLoc+".worldMatrix[0]", mult+'.matrixIn[1]')
            cmds.sets(comp, e=1, forceElement=set)
            cmds.sets(mult, e=1, forceElement=set)
            utils.aimToOffsetParentMatrix(root_loc, input=mult, primary=end_loc, secondary=rootUpLoc, attrs=["matrixSum", "worldMatrix[0]", "worldMatrix[0]"], set=set)

            end_loc_opp = utils.getOpposite(end_loc)
            comp = cmds.createNode('composeMatrix', n=t_name+'_offset_compMat')
            cmds.setAttr(comp+'.inputScaleX', -1)
            utils.connectByMatrix(end_loc, [end_loc_opp, comp], ['matrix', 'outputMatrix'], attrs=['r'], set=set)
        else:
            utils.aimToOffsetParentMatrix(root_loc, input=rootUpLoc, primary=end_loc, secondary=rootUpLoc, set=set)

        # hide root joint
        cmds.setAttr(t_name+'_joint.drawStyle', 2)

        # if opposite
        if utils.objectIsOpposite(root_loc): 
            cmds.setAttr(t_name+'_mod.mirror', True)
            # cmds.setAttr(comp+'.inputScaleX', -1)
            cmds.setAttr(rootUpLoc+'.ry', 180)
            # cmds.setAttr(end_loc+'.ry', 180)
        else:
            if data:
                off = data['endOffset']
                cmds.setAttr(end_loc + ".r", off[0], off[1], off[2])

        # set scale
        # global_scale = cmds.getAttr(t_name+"_end_connector.tx") / 2
        # cmds.setAttr(root_loc+'.sx', cmds.getAttr(root_loc+'.sx') * global_scale)
        # cmds.setAttr(root_loc+'.sy', cmds.getAttr(root_loc+'.sy') * global_scale)
        # cmds.setAttr(root_loc+'.sz', cmds.getAttr(root_loc+'.sz') * global_scale)	

        # create twist on mirrored joint    
        if mirror:
            if t_name.split('_')[0] == 'l':
                if cmds.objExists(utils.getOpposite(t_name+"_joint")):
                    if data == {}:
                        data = self.getData(t_name)
                    reverseData = data
                    reverseData['name'] = utils.getOpposite(t_name)
                    reverseData['target'] = utils.getOpposite(start_j)
                    reverseData['endTarget'] = utils.getOpposite(end_j)
                    self.twists_add(reverseData, setHelpers=False, advanced=advanced)
                    # connect control shapes
                    if cmds.objExists(moduleName+'_mod.mirror'):
                        mirrorShape = cmds.getAttr(utils.getOpposite(moduleName+'_mod.mirror'))
                    else:
                        mirrorShape = False
                    controls = utils.getSetObjects(t_name+'_twist_moduleControlSet')
                    for c in controls:
                        if mirrorShape:
                            shapes = cmds.listRelatives(c, s=1)
                            for s in shapes:	
                                if s == s.split("Shape")[0][-1].isdigit():
                                    tg = cmds.createNode('transformGeometry', n=s+'_TG')
                                    c_mat = cmds.createNode('composeMatrix', n=s+'_compMat')
                                    cmds.sets(tg, e=1, forceElement=set)
                                    cmds.sets(c_mat, e=1, forceElement=set)
                                    cmds.setAttr(c_mat+'.inputScaleY', -1)

                                    cmds.connectAttr(s+'.worldSpace[0]', tg+'.inputGeometry')
                                    cmds.connectAttr(c_mat+'.outputMatrix', tg+'.transform')
                                    cmds.connectAttr(tg+'.outputGeometry', utils.getOpposite(s)+'.create')
                                else:
                                    cmds.connectAttr(s+'.worldSpace[0]', utils.getOpposite(s)+'.create')

                        else:						
                            shapes = cmds.listRelatives(c, s=1)
                            for s in shapes:
                                try:	
                                    cmds.connectAttr(s+'.worldSpace[0]', utils.getOpposite(s)+'.create')
                                except: cmds.warning(" MISS CONTROL SHAPE " + utils.getOpposite(s))						

        # set joints count
        if data:
            if utils.getObjectSide(t_name) == "l":
                self.changeJointsCount(data["jointsCount"], moduleName=moduleName)
                for i, pos in enumerate(data['jointsPos']):
                    cmds.setAttr(t_name+"_twist_%s_twJoint.pos" %i, pos)

        # module override
        mod = utils.getModuleInstance(moduleName)
        mod.twistOverride(t_name)

        # select item in list
        self.updateList()

        item = self.win.twists_listWidget.findItems(t_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.twists_listWidget.setCurrentItem(item)

        # display axises
        mod.toggleLRA(self.win.actionSkeleton_LRA.isChecked())

        self.updateFrame()

    @utils.oneStepUndo
    def twists_remove(self, item_name=""):
        if self.win.twists_listWidget.count() == 0:
            return

        if item_name == "" or item_name == False:
            if item_name == None:
                return
            if not self.win.twists_listWidget.currentItem():
                return
            item_name = self.win.twists_listWidget.currentItem().text()

        item = self.win.twists_listWidget.findItems(item_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.twists_listWidget.removeItemWidget(item)

        cmds.sets(item_name+"_joint", e=1, forceElement='skinJointsSet' )

        # delete all twist nodes
        nodes = cmds.sets(item_name+'_twistNodesSet', q=1)
        for n in nodes:
            if cmds.objExists(n):
                cmds.delete(n)

        # remove twist on mirrored joint
        if item_name.split('_')[0] == 'l':
            oppName = utils.getOpposite(item_name)
            if cmds.objExists(oppName + '_mod'):
                self.twists_remove(oppName)

        self.curTwistName = ''

        self.updateList()
        #self.selectItem()

        # show root joint
        cmds.setAttr(item_name+'_joint.drawStyle', 0)

    @utils.oneStepUndo
    def attach(self, socket, target=None):
        if not target:
            sel = cmds.ls(sl=1) or []
            if not sel:
                cmds.warning("Select the control or joint")
                return
            
            target = sel[0]
            
        outJoint = target.replace("joint", "outJoint")
    
        if target.split("_")[-1] == "joint":      # target is joint
            if cmds.objExists(outJoint):
                target = outJoint
            else:
                cmds.warning("Wrong target. Cannot find the outJoint.")
                return
            
        elif target.split("_")[-1] == "outJoint": # target is outJoint
            pass
        else:                                     # target is control
            if cmds.objExists(target+"_outJoint"):
                target = target+"_outJoint"
            else:
                cmds.warning("Wrong target. Cannot find the outJoint.")
                return

        def attachTo(socket, target, opposite=False):
            set =t_name+'_twistNodesSet'
            
            if socket == "root":
                rootUpLoc = t_name + "_rootUpLoc"
                cmds.parent(rootUpLoc, target)

                if opposite: 
                    root_target = utils.getOpposite(self.curTwist['target'])
                    cmds.setAttr(t_name+'_aim_compMat.inputRotateY', 180)
                else:
                    root_target = self.curTwist['target']
                    
                root_initLoc = root_target.replace("joint", "initLoc").replace("outJoint", "initLoc")
                target_initLoc = target.replace("joint", "initLoc").replace("outJoint", "initLoc")

                if opposite and utils.isSymmetrical(target): # if target is in the mirrored module
                    # set = cmds.sets(name=t_name+'_twistNodesSet')
                    comp1 = cmds.createNode('composeMatrix', n=t_name+'_rootUpLocPre_compMat')
                    comp2 = cmds.createNode('composeMatrix', n=t_name+'_rootUpLocPost_compMat')
                    cmds.sets(comp1, e=1, forceElement=set)
                    cmds.sets(comp2, e=1, forceElement=set)
                    cmds.setAttr(comp1+'.inputScaleX', -1)
                    cmds.setAttr(comp2+'.inputScaleZ', -1)
                    utils.connectToOffsetParentMatrix(rootUpLoc, [comp1, root_initLoc, target_initLoc, comp2], ["outputMatrix", "worldMatrix[0]", "worldInverseMatrix[0]", "outputMatrix"], set=set)
                    cmds.setAttr(t_name+'_aim_compMat.inputRotateY', 0)
                    cmds.setAttr(t_name+'_aim_compMat.inputScaleZ', -1)
                    utils.resetAttrs(rootUpLoc)
                else:
                    utils.connectToOffsetParentMatrix(rootUpLoc, [root_initLoc, target_initLoc], ["worldMatrix[0]", "worldInverseMatrix[0]"], set=set)
                    utils.resetAttrs(rootUpLoc)

                    #### Hardcode Fix !!!!!!!!! ###
                    target_moduleType = utils.getModuleTypeFromAttr(t_name+"_outJoint")
                    if target_moduleType == "limbQuadrupped" and opposite:
                        cmds.setAttr(t_name+'_aim_compMat.inputScaleX', -1)


            elif socket == "end":
                endLoc = t_name + "_end_connectorLoc"
                
                cmds.parent(endLoc, target)

                end_target = self.curTwist['endOrientTarget']

                # if default end target
                if not end_target:
                    end_target = cmds.listRelatives(endLoc, p=1)[0]

                end_initLoc = end_target.replace("joint", "initLoc").replace("outJoint", "initLoc")
                target_initLoc = target.replace("joint", "initLoc").replace("outJoint", "initLoc")

                utils.resetAttrs(endLoc)

                # print("------------------")
                # print (target)
                # print (endLoc)
                # print (end_target)
                # print (end_initLoc)
                # print (target_initLoc)
                # print("------------------")

        t_name = self.curTwistName
        moduleName = utils.getModuleName(t_name+"_joint")
        
        # check if already connected
        if cmds.listRelatives(t_name + "_rootUpLoc", p=1)[0] == target:
            cmds.warning("Already connected to "+target)
            return
        
        if socket=="end" and cmds.listRelatives(t_name + "_end_connectorLoc", p=1)[0] == target:
            cmds.warning("Already connected to "+target)
            return
        
        # attach and update data
        attachTo(socket, target)
        self.twists[t_name] = self.getData(t_name)
        
        # attach opposite twist
        if t_name.split('_')[0] == 'l':
            t_name = utils.getOpposite(self.curTwistName)
            if cmds.objExists(t_name + '_mod'):
                # opposite attach and update data
                attachTo(socket, utils.getOpposite(target), opposite=True)	
                self.twists[t_name] = self.getData(t_name)
        
        self.updateFrame()

    @utils.oneStepUndo
    def attachToRoot(self):
        parents = cmds.listRelatives(self.curTwist["target"].replace("outJoint", "joint"), p=1)
        if len(parents) != 1:
            cmds.warning("Cannot find the parrent joint of the current target")
            return
        parent_j = parents[0]
        self.attach(socket="root", target=parent_j)

        self.updateFrame()

    @utils.oneStepUndo
    def attachToEnd(self):
        childs = cmds.listRelatives(self.curTwist["target"].replace("outJoint", "joint"))
        if len(childs) != 1:
            cmds.warning("Cannot find the single child joint of the current target")
            return
        child_j = childs[0]
        self.attach(socket="end", target=child_j)

        self.updateFrame()

    @utils.oneStepUndo
    def reset(self, resetRootOnly=False, resetEndOnly=False, t_name=None):
        if not t_name:
            t_name = self.curTwistName
        twist = self.twists[t_name]
        target_outJoint = twist['target']
        endTarget_outJoint = twist['endTarget']
    
        def resetRoot():
            # skip if target is default joint
            if twist['rootOrientTarget'] == target_outJoint:
                return

            rootUpLoc = t_name + "_rootUpLoc"
            cmds.parent(rootUpLoc, target_outJoint)
            cmds.delete(rootUpLoc+"_multMat")
            utils.resetAttrs(rootUpLoc, matrix=True)

            rootUpLoc_opp = utils.getOpposite(rootUpLoc)
            if cmds.objExists(rootUpLoc_opp):
                target_opp = utils.getOppositeIfExists(target_outJoint)
                cmds.parent(rootUpLoc_opp, target_opp)
                cmds.delete(rootUpLoc_opp+"_multMat")
                utils.resetAttrs(rootUpLoc_opp, matrix=True)
                cmds.setAttr(rootUpLoc_opp+'.ry', 180)

        def resetEnd():
            # skip if parent is default joint
            if cmds.listRelatives(twist['endOrientTarget'], p=1)[0] == target_outJoint:
                self.updateFrame()
                return 

            if twist['endOrientTarget'] == endTarget_outJoint:
                return

            endLoc = t_name + "_end_connectorLoc"
            cmds.parent(endLoc, endTarget_outJoint)
            utils.resetAttrs(endLoc)

            endLoc_opp = utils.getOpposite(endLoc)
            if cmds.objExists(endLoc_opp):
                endTarget_outJoint_opp = utils.getOppositeIfExists(endTarget_outJoint)
                cmds.parent(endLoc_opp, endTarget_outJoint_opp)
                utils.resetAttrs(endLoc_opp, matrix=True)
                # cmds.setAttr(endLoc_opp+'.ry', 180)

        if twist['rootOrientTarget'] != target_outJoint and not resetEndOnly:
            resetRoot()

        if cmds.listRelatives(twist['endOrientTarget'], p=1)[0] != target_outJoint and not resetRootOnly:
            resetEnd()

        self.updateFrame()

    @utils.oneStepUndo
    def changeJointsCount(self, count=None, moduleName=None):
        updateFrame = False
        if not count:
            updateFrame = True
            count, ok = QtWidgets.QInputDialog().getInt(self.win, 'Change joints count', 'Enter joints count:',
                                            value=self.curTwist['jointsCount'], minValue=1, maxValue=100)

        def generateJoints(twName, count, moduleName=None):
            # get values
            old_count = len(cmds.listRelatives(twName+'_joints'))
            count = int(count)
            
            if not moduleName:
                moduleName = utils.getModuleName(self.curTwist["target"])
            twSet = twName+'_twistNodesSet'
            quat = twName+"_quatToEuler_1"
            upLoc = twName+"_startUp_loc"
            rootConnector = twName+"_root_connector"
            curveS = twName+"_curveShape"

            # delete old joints
            for i in range(old_count):
                cmds.delete(twName+'_twist_%s_twJoint' %i)
                
                mp = twName+'_curve_%s_mpath' %i
                uc = utils.getInputNode(mp, "frontTwist")
                if uc: cmds.delete(uc)
                cmds.delete(mp)
                
                mult = twName+'_multDoubleLinear_%s' %i
                uc = utils.getInputNode(mult, "input1")
                if uc: cmds.delete(uc)
                cmds.delete(mult)
            
            # get cycle vars
            u = 0
            if count == 1:
                step = 0
                u = 0.5
            else:
                step = 1.0/(count-1)

            # generate joints
            cmds.select(clear=1)
            for i in range(count):
                j = cmds.joint(n=twName+'_twist_%s_twJoint' %i)
                utils.setUserAttr(j, "pos", u, "float", keyable=True, lock=False)
                utils.addToModuleSet(j, moduleName)
                cmds.sets(j, e=1, forceElement='skinJointsSet')
                cmds.sets(j, e=1, forceElement=twSet)
                cmds.parent(j, twName+"_joints")

                mp = cmds.createNode('motionPath', n=twName+'_curve_%s_mpath' %i)
                cmds.sets(mp, e=1, forceElement=twSet)
                cmds.setAttr(mp+'.worldUpType', 2)
                cmds.connectAttr(j+'.pos', mp+'.uValue')

                mult = cmds.createNode('multDoubleLinear', n=twName+'_multDoubleLinear_%s' %i)
                cmds.sets(mult, e=1, forceElement=twSet)
                cmds.connectAttr(quat+'.outputRotateX', mult+'.input1')
                cmds.connectAttr(j+'.pos', mult+'.input2')
                cmds.connectAttr(mult+'.output', mp+".frontTwist")

                cmds.connectAttr(upLoc+'.worldMatrix[0]', mp+".worldUpMatrix")
                cmds.connectAttr(curveS+'.worldSpace[0]', mp+".geometryPath")
                cmds.connectAttr(rootConnector+'.s', j+".s")
                cmds.connectAttr(mp+'.allCoordinates', j+".t")
                cmds.connectAttr(mp+'.rotate', j+".r")

                u += step
        
        twName = self.curTwistName
        twName_opp = utils.getOpposite(self.curTwistName)
        generateJoints(twName, count, moduleName)

        rootConnector_opp = twName_opp+"_root_connector"
        if cmds.objExists(rootConnector_opp):
            if moduleName:
                moduleName_opp = utils.getOpposite(moduleName)
            else:
                moduleName_opp = None

            generateJoints(twName_opp, count, moduleName_opp)
            for i in range(count):
                if utils.getObjectSide(twName) == "l":
                    cmds.connectAttr(twName+'_twist_%s_twJoint.pos' %i, twName_opp+'_twist_%s_twJoint.pos' %i)
                else:
                    cmds.connectAttr(twName_opp+'_twist_%s_twJoint.pos' %i, twName+'_twist_%s_twJoint.pos' %i)

        # update only if set count manually from button
        if updateFrame:
            self.updateFrame()

    def getTwists(self, moduleName):
        twists = []

        if cmds.objExists("twists"):
            tw_mods = cmds.listRelatives('twists', type='transform') or []
            for tw_mod in tw_mods:
                m_Name = utils.getModuleName(tw_mod)
                if m_Name == moduleName:
                    twists.append(tw_mod.split('_mod')[0])


        return twists		

    @staticmethod
    def getData(twName, module_name=""):
        # get twists data
        twData = {}
        if module_name == "":
            t_name = twName
        else:
            t_name = utils.getTemplatedNameFromReal(module_name, twName)
        twData['name'] = t_name

        if not cmds.objExists(twName+'_system'):
            return

        joints = cmds.listRelatives(twName+'_joints')
        twData['advanced'] = cmds.objExists(twName+"_twist")
        jointsCount = len(joints)
        twData['jointsCount'] = jointsCount
        twData['target'] = cmds.listRelatives(twName + "_root_connectorLoc", p=1)[0]
        twData['endTarget'] = cmds.getAttr(twName+"_mod.endTarget")
        twData['rootOrientTarget'] = cmds.listRelatives(twName + "_rootUpLoc", p=1)[0]
        twData['endOrientTarget'] = cmds.listRelatives(twName + "_end_connectorLoc", p=1)[0]
        twData['endOffset'] = cmds.getAttr(twName + "_end_connectorLoc.r")[0]
        
        jointsPos = []
        for i in range(jointsCount):
            pos = cmds.getAttr(twName+"_twist_%s_twJoint.pos" %i)
            jointsPos.append(pos)
        twData['jointsPos'] = jointsPos

        if module_name != "":
            twData['target'] = utils.getTemplatedNameFromReal(module_name, twData['target'])
            twData['endTarget'] = utils.getTemplatedNameFromReal(module_name, twData['endTarget'])
            twData['rootOrientTarget'] = utils.getTemplatedNameFromReal(module_name, twData['rootOrientTarget'])
            twData['endOrientTarget'] = utils.getTemplatedNameFromReal(module_name, twData['endOrientTarget'])

        return twData

    def toggleOffsetLocators(self):
        t_name = self.curTwistName
        v = not cmds.getAttr(t_name+"_end_connectorLoc.visibility")
        cmds.select(t_name+"_end_connectorLoc")

        # opp_t_name = utils.getOpposite(t_name)
        # if cmds.objExists(opp_t_name+"_mod"):
        #     cmds.select(opp_t_name+"_end_connectorLoc", add=1)

        if v:
            cmds.ShowSelectedObjects()
        else:
            cmds.hide()
