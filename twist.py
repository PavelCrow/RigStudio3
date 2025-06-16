import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import os, math

from .import utils

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))


class Twist(object):
    def __init__(self, win, main):
        self.win = win
        self.main = main
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
        self.win.twist_rootFlipped_checkBox.clicked.connect(self.setRootFlipped)
        self.win.twist_flippedX_checkBox.clicked.connect(partial(self.setEndFlipped, dir="x"))
        self.win.twist_endOffsetFlippedX_checkBox.clicked.connect(partial(self.setEndOffsetFlipped, side="x"))
        self.win.twist_endOffsetFlippedY_checkBox.clicked.connect(partial(self.setEndOffsetFlipped, side="y"))

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
            self.win.twist_flippedX_checkBox.setChecked(False)
            self.win.twist_endOffsetFlippedX_checkBox.setChecked(False)
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

            self.win.twist_rootFlipped_checkBox.setChecked(data['rootFlipped'])
            self.win.twist_flippedX_checkBox.setChecked(data['flippedX'])
            self.win.twist_endOffsetFlippedX_checkBox.setChecked(data['endOffsetFlippedX'])
            self.win.twist_endOffsetFlippedY_checkBox.setChecked(data['endOffsetFlippedY'])

            self.curTwist = data
            
        # set check state for offsetLocs button
        self.win.twistToggleOffsetLocators_btn.setChecked(cmds.getAttr(self.curTwistName+"_end_connectorLoc.visibility"))

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

            t_name = start_j.split('_skinJoint')[0].split('_outJoint')[0]
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

        # check if this joint is have twist
        if t_name in self.twists:
            cmds.warning(' Selected joint have twist')
            return

        # check if joint is twist
        if "_twist_" in start_j:
            cmds.warning(' Selected joint is twist joint')
            return
        if "_twist_" in end_j:
            cmds.warning(' Selected joint is twist joint')
            return

        # import with namespace
        if advanced:
            path = os.path.join(rootPath, 'modules', '_twist.ma')
        else:
            path = os.path.join(rootPath, 'modules', '_twistSimple.ma')
        
        cmds.file(path, pr=1, i=1, type="mayaAscii", namespace='_temp_', ra=True, mergeNamespacesOnClash=False, options="v=0;")

        # rename and add all twist nodes to module set
        set = cmds.sets(name=t_name+'_twistNodesSet')
        nodes = cmds.ls('_temp_:*')
        moduleName = utils.getModuleName(t_name+"_skinJoint")

        for n in nodes:
            if cmds.objExists(n):
                cmds.sets(n, e=1, forceElement=set)
                cmds.rename(n, n.replace("_temp_:", t_name+"_"))

        utils.addToModuleSet(set, moduleName)
        cmds.namespace(removeNamespace='_temp_')
        
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
        # if mirror:
        #     cmds.setAttr(comp+".inputScaleZ", -1)
        
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
        root_outJoint = start_j.replace("skinJoint", "outJoint")
        end_outJoint = end_j.replace("skinJoint", "outJoint")
        cmds.parent(root_loc, rootUpLoc, root_outJoint)
        utils.resetAttrs(root_loc)
        utils.resetAttrs(rootUpLoc)
        cmds.parent(end_loc, end_outJoint)
        utils.resetAttrs(end_loc)
        cmds.setAttr(root_outJoint+".drawStyle", 2)

        # root aim matrix
        aimm = cmds.createNode('aimMatrix', n=t_name+'_aimMatrix')
        mm = cmds.createNode('multMatrix', n=t_name+'_aimMultMatrix')
        cmds.connectAttr(root_outJoint+".worldMatrix[0]", aimm+".inputMatrix")
        cmds.connectAttr(end_outJoint+".worldMatrix[0]", aimm+".primaryTargetMatrix")
        cmds.connectAttr(aimm+".outputMatrix", mm+".matrixIn[0]")
        cmds.connectAttr(root_outJoint+".worldInverseMatrix[0]", mm+".matrixIn[1]")
        cmds.connectAttr(mm+".matrixSum", root_loc+".offsetParentMatrix")

        # stretch volume
        db = cmds.createNode('distanceBetween', n=t_name+'_distanceBetween')
        cmds.sets(db, e=1, forceElement=set)
        root_initLoc = utils.getInitLocFromJoint(root_outJoint)
        end_initLoc = utils.getInitLocFromJoint(end_outJoint)
        cmds.connectAttr(end_initLoc+".worldMatrix[0]", db+".inMatrix1")
        cmds.connectAttr(root_initLoc+".worldMatrix[0]", db+".inMatrix2")
        cmds.connectAttr(db+".distance", t_name+"_length_multDoubleLinear.input2")

        # save data
        utils.setUserAttr(t_name+"_mod", "endTarget", end_outJoint)
        utils.setUserAttr(t_name+"_mod", "target", start_j)
        utils.setUserAttr(t_name+"_mod", "rootOrientTarget", root_outJoint)
        utils.setUserAttr(t_name+"_mod", "endOrientTarget", end_outJoint)

        # utils.aimToOffsetParentMatrix(root_loc, input=root_outJoint, primary=end_loc, secondary=rootUpLoc, set=set)
        # cmds.setAttr(root_loc+"_aimMat.secondaryTargetVectorY", 1)
        # cmds.setAttr(root_loc+"_aimMat.secondaryMode", 2)

        if utils.objectIsOpposite(root_loc): # if mirrored
            end_loc_opp = utils.getOpposite(end_loc)
            comp = cmds.createNode('composeMatrix', n=t_name+'_offset_compMat')
            utils.connectByMatrix(end_loc, [end_loc_opp, comp], ['matrix', 'outputMatrix'], attrs=['r'], set=set)

        # hide root joint
        cmds.setAttr(t_name+'_skinJoint.drawStyle', 2)

        # if opposite
        if utils.objectIsOpposite(root_loc): 
            cmds.setAttr(t_name+'_mod.mirror', True)
            cmds.setAttr(rootUpLoc+'.ry', 180)
            cmds.setAttr(root_loc+'.ry', 180)
        else:
            if data:
                if 'rootOffset' in data:
                    off = data['rootOffset']
                    cmds.setAttr(root_loc + ".r", off[0], off[1], off[2])
                if 'rootUpOffset' in data:
                    off = data['rootUpOffset']
                    cmds.setAttr(rootUpLoc + ".r", off[0], off[1], off[2])
                if 'endOffset' in data:
                    off = data['endOffset']
                    cmds.setAttr(end_loc + ".r", off[0], off[1], off[2])

        # create twist on mirrored joint    
        if mirror:
            if t_name.split('_')[0] == 'l':
                if cmds.objExists(utils.getOpposite(t_name+"_skinJoint")):
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
        if utils.getObjectSide(t_name) != "r":
            if data:
                self.changeJointsCount(data["jointsCount"], moduleName=moduleName)
                for i, pos in enumerate(data['jointsPos']):
                    cmds.setAttr(t_name+"_twist_%s_skinJoint.pos" %i, pos)

                # Безопасно получаем список, по умолчанию пустой
                twist_multipliers = data.get('jointsTwistMultiplier', [])
                for i, twistMultiplier in enumerate(twist_multipliers):
                    cmds.setAttr(t_name+"_twist_%s_skinJoint.twistMultiplier" %i, twistMultiplier)
            
                if utils.getObjectSide(t_name) == "l":
                    if cmds.objExists(utils.getOpposite(root_loc)):
                        if 'rootFlipped' in data: self.setRootFlipped(name=t_name, state=data['rootFlipped'])
                        if 'flippedX' in data: self.setEndFlipped(name=t_name, dir="x", state=data['flippedX'])
                        if 'endOffsetFlippedX' in data: self.setEndOffsetFlipped(name=t_name, state=data['endOffsetFlippedX'], side="x")
                        if 'endOffsetFlippedY' in data: self.setEndOffsetFlipped(name=t_name, state=data['endOffsetFlippedY'], side="y")
            else:
                self.changeJointsCount(5, moduleName=moduleName)

        # module override
        mod = utils.getModuleInstance(moduleName)
        mod.twistOverride(t_name, data)
        
        # select item in list
        self.updateList()

        item = self.win.twists_listWidget.findItems(t_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.twists_listWidget.setCurrentItem(item)

        # display axises
        mod.toggleLRA(self.win.actionSkeleton_LRA.isChecked())

        cmds.setAttr(t_name+"_joints.v", True)

        self.updateFrame()

    @utils.oneStepUndo
    def twists_remove(self, item_name=""):
        if self.win.twists_listWidget.count() == 0:
            return

        # get name
        if item_name == "" or item_name == False:
            if item_name == None:
                return
            if not self.win.twists_listWidget.currentItem():
                return
            item_name = self.win.twists_listWidget.currentItem().text()

        # delete ibtws
        ibtws_data = self.main.ibtwClass.getIbtwsData()
        for ibtwData in ibtws_data:
            if ibtwData["child_j"].split("_twist")[0] == item_name or ibtwData["parent_j"].split("_twist")[0] == item_name:
                self.main.ibtwClass.remove(ibtwData["name"])
        
        # delete item
        item = self.win.twists_listWidget.findItems(item_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.twists_listWidget.removeItemWidget(item)

        cmds.sets(item_name+"_skinJoint", e=1, forceElement='skinJointsSet' )

        # delete all twist nodes
        cmds.delete(item_name+"_curveInfo")
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
        cmds.setAttr(item_name+'_skinJoint.drawStyle', 0)

    @utils.oneStepUndo
    def attach(self, socket, target=None):
        # print(2222, "Attach to", socket, target)
        if not target:
            sel = cmds.ls(sl=1) or []
            if not sel:
                cmds.warning("Select the control or joint")
                return
            
            target = sel[0]
            
        outJoint = target.replace("skinJoint", "outJoint")
    
        if target.split("_")[-1] == "skinJoint":      # target is skinJoint
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
                utils.resetAttrs(rootUpLoc)

                if opposite: 
                    root_target = utils.getOpposite(self.curTwist['target'])
                    # cmds.setAttr(rootUpLoc+'.sx', -1)
                else:
                    root_target = self.curTwist['target']
                    
                root_initLoc = root_target.replace("skinJoint", "initLoc").replace("outJoint", "initLoc")
                target_initLoc = target.replace("skinJoint", "initLoc").replace("outJoint", "initLoc")
                
                utils.connectToOffsetParentMatrix(rootUpLoc, [root_initLoc, target_initLoc], ["worldMatrix[0]", "worldInverseMatrix[0]"], set=set)

                utils.connectByMatrix(t_name+"_start_connector", [rootUpLoc, t_name+"_root_connector"], ["worldMatrix[0]", "worldInverseMatrix[0]"], set=set)

                # save data
                utils.setUserAttr(t_name+"_mod", "rootOrientTarget", target)

            elif socket == "end":
                endLoc = t_name + "_end_connectorLoc"
                
                cmds.parent(endLoc, target)

                # end_target = self.curTwist['endOrientTarget']

                # # if default end target
                # if not end_target:
                #     end_target = cmds.listRelatives(endLoc, p=1)[0]

                # end_initLoc = end_target.replace("skinJoint", "initLoc").replace("outJoint", "initLoc")
                # target_initLoc = target.replace("skinJoint", "initLoc").replace("outJoint", "initLoc")

                utils.resetAttrs(endLoc)

                # save data
                utils.setUserAttr(t_name+"_mod", "endOrientTarget", target)

        t_name = self.curTwistName
        moduleName = utils.getModuleName(t_name+"_skinJoint")
        
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
        parents = cmds.listRelatives(self.curTwist["target"].replace("outJoint", "skinJoint"), p=1)
        if len(parents) != 1:
            cmds.warning("Cannot find the parrent joint of the current target")
            return
        parent_j = parents[0]
        self.attach(socket="root", target=parent_j)

        self.updateFrame()

    @utils.oneStepUndo
    def attachToEnd(self):
        childs = cmds.listRelatives(self.curTwist["target"].replace("outJoint", "skinJoint"))
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
                utils.setUserAttr(j, "pos", u, "float", keyable=True, lock=False, min=0, max=1)
                cmds.addAttr(j, ln="twistMultiplier", at="double", min=0, max=1, dv=1, keyable=True)
                # cmds.sets(j, e=1, forceElement='skinJointsSet')
                cmds.sets(j, e=1, forceElement=twSet)
                cmds.parent(j, twName+"_joints")

                mp = cmds.createNode('motionPath', n=twName+'_curve_%s_mpath' %i)
                cmds.sets(mp, e=1, forceElement=twSet)
                cmds.setAttr(mp+'.worldUpType', 2)
                cmds.setAttr(mp+'.frontAxis', 0)
                cmds.connectAttr(j+'.pos', mp+'.uValue')

                mult = cmds.createNode('multDoubleLinear', n=twName+'_multDoubleLinear_%s' %i)
                cmds.sets(mult, e=1, forceElement=twSet)
                cmds.connectAttr(quat+'.outputRotateX', mult+'.input1')
                cmds.connectAttr(j+'.pos', mult+'.input2')

                mult2 = cmds.createNode('multDoubleLinear', n=twName+'_twistMultDoubleLinear_%s' %i)
                cmds.sets(mult2, e=1, forceElement=twSet)
                cmds.connectAttr(mult+'.output', mult2+'.input1')
                cmds.connectAttr(j+'.twistMultiplier', mult2+'.input2')
                cmds.connectAttr(mult2+'.output', mp+".frontTwist")

                cmds.connectAttr(upLoc+'.worldMatrix[0]', mp+".worldUpMatrix")
                cmds.connectAttr(curveS+'.worldSpace[0]', mp+".geometryPath")
                cmds.connectAttr(twName+'_scale_multiplyDivide.output', j+".s")
                cmds.connectAttr(mp+'.allCoordinates', j+".t")
                cmds.connectAttr(mp+'.rotate', j+".r")

                u += step

            self.addSkinJoints(twName)
        
        twName = self.curTwistName
        twName_opp = utils.getOpposite(self.curTwistName)
        
        generateJoints(twName, count, moduleName)
        
        rootConnector_opp = twName_opp+"_root_connector"
        
        if twName != twName_opp and cmds.objExists(rootConnector_opp):
            if moduleName:
                moduleName_opp = utils.getOpposite(moduleName)
            else:
                moduleName_opp = None

            generateJoints(twName_opp, count, moduleName_opp)
            for i in range(count):
                if utils.getObjectSide(twName) == "l":
                    cmds.connectAttr(twName+'_twist_%s_twJoint.pos' %i, twName_opp+'_twist_%s_twJoint.pos' %i)
                    cmds.connectAttr(twName+'_twist_%s_twJoint.twistMultiplier' %i, twName_opp+'_twist_%s_twJoint.twistMultiplier' %i)
                else:
                    cmds.connectAttr(twName_opp+'_twist_%s_twJoint.pos' %i, twName+'_twist_%s_twJoint.pos' %i, f=1)
                    cmds.connectAttr(twName_opp+'_twist_%s_twJoint.twistMultiplier' %i, twName+'_twist_%s_twJoint.twistMultiplier' %i, f=1)

        # update only if set count manually from button
        if updateFrame:
            self.updateFrame()

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

        if not cmds.objExists(twName + "_root_connectorLoc") or not cmds.objExists(twName + "_rootUpLoc") or not cmds.objExists(twName + "_end_connectorLoc"):
            cmds.warning("Cannot find the "+twName+"_root_connectorLoc, "+twName + "_rootUpLoc and "+twName + "_end_connectorLoc")
            return

        joints = cmds.listRelatives(twName+'_joints')
        twData['advanced'] = cmds.objExists(twName+"_twist")
        jointsCount = len(joints)
        twData['jointsCount'] = jointsCount
        try: # fix for old characters without this attrs
            twData['target'] = cmds.getAttr(twName+"_mod.target")
            twData['endTarget'] = cmds.getAttr(twName+"_mod.endTarget")
            twData['rootOrientTarget'] = cmds.getAttr(twName+"_mod.rootOrientTarget")
            twData['endOrientTarget'] = cmds.getAttr(twName+"_mod.endOrientTarget")
        except: pass
        twData['rootUpOffset'] = cmds.getAttr(twName + "_rootUpLoc.r")[0]
        twData['rootOffset'] = cmds.getAttr(twName + "_root_connectorLoc.r")[0]
        twData['endOffset'] = cmds.getAttr(twName + "_end_connectorLoc.r")[0]
        
        twData["rootFlipped"] = False
        twData["flippedX"] = False
        twData["endOffsetFlippedX"] = False
        twData["endOffsetFlippedY"] = False
        root = twName+"_root_connector"
        if utils.isSymmetrical(root):
            if not utils.objectIsOpposite(root):
                opp_twName = utils.getOpposite(twName)
                twData['rootFlipped'] = cmds.getAttr(opp_twName + "_rootUpLoc.sx") == -1
                twData['flippedX'] = cmds.getAttr(opp_twName + "_end_compMat.inputScaleX") == -1
                twData['endOffsetFlippedX'] = cmds.getAttr(opp_twName + "_offset_compMat.inputScaleX") == -1
                twData['endOffsetFlippedY'] = cmds.getAttr(opp_twName + "_offset_compMat.inputScaleY") == -1
        
        jointsPos = []
        for i in range(jointsCount):
            pos = cmds.getAttr(twName+"_twist_%s_twJoint.pos" %i)
            jointsPos.append(pos)
        twData['jointsPos'] = jointsPos
        
        jointsTwistMultiplier = []
        for i in range(jointsCount):
            twistMultiplier = cmds.getAttr(twName+"_twist_%s_twJoint.twistMultiplier" %i)
            jointsTwistMultiplier.append(twistMultiplier)
        twData['jointsTwistMultiplier'] = jointsTwistMultiplier

        if module_name != "":
            twData['target'] = utils.getTemplatedNameFromReal(module_name, twData['target'])
            twData['endTarget'] = utils.getTemplatedNameFromReal(module_name, twData['endTarget'])
            twData['rootOrientTarget'] = utils.getTemplatedNameFromReal(module_name, twData['rootOrientTarget'])
            twData['endOrientTarget'] = utils.getTemplatedNameFromReal(module_name, twData['endOrientTarget'])
        
        return twData

    def toggleOffsetLocators(self):
        t_name = self.curTwistName
        v = not cmds.getAttr(t_name+"_end_connectorLoc.visibility")
        cmds.select(t_name+"_end_connectorLoc", t_name+"_root_connectorLoc", t_name+"_rootUpLoc")

        # opp_t_name = utils.getOpposite(t_name)
        # if cmds.objExists(opp_t_name+"_mod"):
        #     cmds.select(opp_t_name+"_end_connectorLoc", add=1)

        if v:
            cmds.ShowSelectedObjects()
        else:
            cmds.hide()

    def setRootFlipped(self, name=None, state=None):
        if not state:
            state = self.win.twist_rootFlipped_checkBox.isChecked()
        
        if state:
            v = -1
        else:
            v = 1

        if not name:
            name = self.curTwistName
            
        opp_name = utils.getOpposite(name)
        rootUpLoc = opp_name + "_rootUpLoc"
        cmds.setAttr(rootUpLoc+'.sx', v)
        self.curTwist["rootFlipped"] = state

    def setEndFlipped(self, name=None, dir="x", state=None, solo=True):
        if not state:
            if dir == "x":
                state = self.win.twist_flippedX_checkBox.isChecked()
        
        if state:
            v = -1
        else:
            v = 1

        if not name:
            name = self.curTwistName
            
        opp_name = utils.getOpposite(name)
        if dir == "x":
            cmds.setAttr(opp_name+"_end_compMat.inputScaleX", v)
            self.curTwist["flippedX"] = state

    def setEndOffsetFlipped(self, name=None, state=None, side="x"):
        if not state:
            if side == "x":
                state = self.win.twist_endOffsetFlippedX_checkBox.isChecked()
            elif side == "y":
                state = self.win.twist_endOffsetFlippedY_checkBox.isChecked()
        
        if state:
            v = -1
        else:
            v = 1

        if not name:
            name = self.curTwistName
            
        opp_name = utils.getOpposite(name)

        if side == "x":
            cmds.setAttr(opp_name+"_offset_compMat.inputScaleX", v)
            self.curTwist["endOffsetFlippedX"] = state
        elif side == "y":
            cmds.setAttr(opp_name+"_offset_compMat.inputScaleY", v)
            self.curTwist["endOffsetFlippedY"] = state

    def addSkinJoints(self, twName):
        moduleName = utils.getModuleName(twName+"_outJoint")
        # delete old twist skinJoints
        if cmds.objExists(f"{twName}_twist_0_skinJoint"):
            cmds.delete(f"{twName}_twist_0_skinJoint")

        cmds.hide(twName+"_joints")
        for i in range(len(cmds.listRelatives(twName+"_joints"))):
            tw_j = f"{twName}_twist_{i}_twJoint"
            j = cmds.duplicate(tw_j , n=tw_j.replace("twJoint", "skinJoint"))[0]
            cmds.setAttr(j+".segmentScaleCompensate", 0)
            cmds.setAttr(tw_j+".drawStyle", 2)
            if i == 0:
                cmds.parent(j, f"{twName}_skinJoint")
            else:
                cmds.parent(j, f"{twName}_twist_{i-1}_skinJoint")
            utils.removeTransformParentJoint(j)
            utils.resetAttrs(j, matrix=True, jointOrient=True)
            utils.connectByMatrix(j, [tw_j, j], ['worldMatrix[0]', 'parentInverseMatrix[0]'], module_name=moduleName)

            cmds.connectAttr(j+".pos", tw_j+".pos")
            cmds.connectAttr(j+".twistMultiplier", tw_j+".twistMultiplier")

            cmds.sets(j, e=1, forceElement=moduleName+"_skinJointsSet")

    def getTwistsData(self, moduleNames=[]):

        twistsData = []
        twists_names = []

        if cmds.objExists("twists"):
            tw_mods = cmds.listRelatives('twists', type='transform') or []
            for tw_mod in tw_mods:

                if utils.getObjectSide(tw_mod) == "r" and cmds.objExists(utils.getOpposite(tw_mod)):
                    continue
        
                tw_m_Name = utils.getModuleName(tw_mod).split("|")[-1]
                j_name = tw_m_Name[:-4] + "_skinJoint"
                m_Name = utils.getModuleName(j_name)
                if moduleNames and m_Name not in moduleNames:
                    continue
                
                twists_names.append(tw_mod.split('_mod')[0])

        for tw_name in twists_names:
            tw_data = self.getData(tw_name)
            twistsData.append(tw_data)
        
        return twistsData	

    def getTwistsFromModule(self, module_name):
        twistsData = self.getTwistsData()

        twists = []

        for tw_data in twistsData:
            tw_name = tw_data["name"]
            for attr in ["target", "endTarget", "rootOrientTarget", "endOrientTarget"]:
                obj = tw_data[attr]
                obj_m_name = utils.getModuleName(obj)
                if module_name == obj_m_name:
                    if tw_name not in twists:
                        twists.append(tw_name)

        return twists

    def renameData(self, data, names_dict):
        
        def rename_module_in_data(tw_data, value, old_name, new_name):
            if old_name == value[:len(old_name)]:
                value = new_name + value[len(old_name):]
                tw_data[attr] = value
                # print("REN", old_name, new_name, value)

        for old_name in names_dict:
            new_name = names_dict[old_name]

            if old_name == new_name:
                continue
            # print("-----------------------------", old_name)
            for attr in ["name", "target", "endTarget", "rootOrientTarget", "endOrientTarget"]:
                for tw_data in data:
                    value = tw_data[attr]
                    # print("666", attr, value, old_name, new_name)
                    rename_module_in_data(tw_data, value, old_name, new_name)
                    # print(777, tw_data)

        return data