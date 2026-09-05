import maya.cmds as cmds
import maya.mel as mel
import pymel.core as pm
import maya.OpenMaya as om
from functools import partial
import os, math

from .import utils, controller

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
        self.win.addTwistMll_btn.clicked.connect(self.twists_addMll)
        self.win.removeTwist_btn.clicked.connect(self.twists_remove)

        self.win.twists_listWidget.currentItemChanged.connect(self.selectItem)
        self.win.twists_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		

        self.win.twist_attachRoot_btn.clicked.connect(partial(self.attach, socket="root"))
        self.win.twist_attachEnd_btn.clicked.connect(partial(self.attach, socket="end"))
        self.win.twist_reset_btn.clicked.connect(self.reset)
        self.win.changeJointsCount_btn.clicked.connect(self.changeJointsCount)
        self.win.twistToggleOffsetLocators_btn.clicked.connect(self.toggleOffsetLocators)

    def loadTwistsData(self):
        # Populate the twist cache with names only (cheap). The expensive
        # per-twist getData() is deferred to getTwist() on first access, so
        # opening a window / refreshing the list no longer reads every twist.
        self.twists = {}

        if cmds.objExists('twists'):
            twists_gr = cmds.listRelatives('twists') or []
            for t_gr in twists_gr:
                self.twists[t_gr.split('_mod')[0]] = {}

        # плагинный вариант живёт прямо на кости и группы _mod не заводит,
        # поэтому находится по своему солверу
        for solver in cmds.ls("*_twist_solver") or []:
            self.twists[solver.split("_twist_solver")[0]] = {}

    def isMll(self, t_name): #
        """Вариант, собранный на ноде pk_twist."""
        return bool(t_name) and cmds.objExists(t_name+"_twist_solver")

    def getTwist(self, t_name):
        """Return twist data, loading and caching it on first access."""
        if not self.twists.get(t_name):
            self.twists[t_name] = self.getData(t_name)
        return self.twists[t_name]

    def getFrameData(self, twName):
        """Cheap subset of getData for the UI frame (no curve/shape reads).

        Used when selecting a twist in the list so switching is instant; the
        full getData (which reconstructs control curves) is only needed for
        saving templates and reset().
        """
        data = {'name': twName}

        if self.isMll(twName):
            solver = twName + "_twist_solver"
            data['mode'] = 'mll'
            data['jointsCount'] = len(cmds.getAttr(solver+".joint", multiIndices=True) or [])
            data['target'] = self.getMllRoot(twName)
            data['endTarget'] = ''

            drivers = self.getMllDrivers(twName)
            data['drivers'] = drivers
            data['rootOrientTarget'] = drivers.get(0, '')
            data['endOrientTarget'] = drivers.get(1, '')
            return data

        data['jointsCount'] = len(cmds.listRelatives(twName+'_joints') or [])
        try:  # old characters may lack these attrs
            data['target'] = cmds.getAttr(twName+"_mod.target")
            data['endTarget'] = cmds.getAttr(twName+"_mod.endTarget")
            data['rootOrientTarget'] = cmds.getAttr(twName+"_mod.rootOrientTarget")
            data['endOrientTarget'] = cmds.getAttr(twName+"_mod.endOrientTarget")
        except:
            data['target'] = data['endTarget'] = ''
            data['rootOrientTarget'] = data['endOrientTarget'] = ''
        return data

    def doubleClckItem(self):
        if not self.curTwistName:
            return
        if self.isMll(self.curTwistName):
            cmds.select(self.curTwistName+"_twistCtrl")
        else:
            cmds.select(self.curTwistName+"_mod")

    def selectItem(self):
        # get current twist 
        try:
            self.curTwistName = self.win.twists_listWidget.currentItem().text()
        except:
            self.curTwistName = ''
        self.curTwist = {}

        # update cur twist frame
        self.updateFrame()

    def updateList(self):
        if not cmds.objExists(self.main.rig.root):
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

            self.win.twistToggleOffsetLocators_btn.setChecked(False)
        else:
            is_mll = self.isMll(self.curTwistName)
            if not cmds.objExists(self.curTwistName+"_mod") and not is_mll:
                return

            # у плагинного варианта нет ни коннекторов, ни оффсетных локаторов,
            # ни пересчёта количества костей - эти кнопки ему не адресованы.
            # Attach остаётся: им указывается кость, которая крутит цепочку
            for w in ("twist_reset_btn", "changeJointsCount_btn",
                      "twistToggleOffsetLocators_btn"):
                getattr(self.win, w).setEnabled(not is_mll)
            for w in ("twist_attachRoot_btn", "twist_attachEnd_btn"):
                getattr(self.win, w).setEnabled(True)

            self.win.twist_frame.setEnabled(True)
            data = self.getFrameData(self.curTwistName)

            if is_mll:
                self.win.twistName_lineEdit.setText(data['name'])
                self.win.twistsJointsCount_lineEdit.setText(str(data['jointsCount']))
                self.win.twistRootJoint_lineEdit.setText(data['target'])
                self.win.twistRootOrientJoint_lineEdit.setText(data['rootOrientTarget'])
                self.win.twistEndJoint_lineEdit.setText(data['endOrientTarget'])
                self.curTwist = data

                if self.curTwistName.split('_')[0] == 'r':
                    self.win.twist_frame.setEnabled(False)
                return

            self.win.twistName_lineEdit.setText(data['name'])
            self.win.twistsJointsCount_lineEdit.setText(str(data['jointsCount']))

            self.win.twistRootJoint_lineEdit.setText(data['target'])
            self.win.twistRootOrientJoint_lineEdit.setText(data['rootOrientTarget'])
            self.win.twistEndJoint_lineEdit.setText(data['endOrientTarget'])

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

            if utils.getObjectSide(start_j) == "r" or utils.getObjectSide(end_j) == "r":
                cmds.warning("Select left side joints")
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
        root_loc = cmds.duplicate(t_name+"_start_connector", n=t_name+'_root_connectorLoc')[0]
        cmds.setAttr(root_loc+".s", 2,2,2)
        cmds.setAttr(root_loc+"Shape.overrideColor", 14)
        cmds.makeIdentity(root_loc, apply=1, t=0, r=0, s=1)
        cmds.sets(root_loc, e=1, forceElement=set)
        cmds.setAttr(root_loc+'.overrideEnabled', 1)
        cmds.setAttr(root_loc+'.overrideColor', 13)
        cmds.setAttr(root_loc+".v", False)

        comp = cmds.createNode('composeMatrix', n=t_name+'_root_compMat')
        cmds.sets(comp, e=1, forceElement=set)

        utils.connectByMatrix(t_name+'_root_connector', [comp, root_loc], ['outputMatrix', 'worldMatrix[0]'], module_name=moduleName)

        # root up connector
        rootUpLoc = cmds.duplicate(t_name+"_start_connector", n=t_name+'_rootUpLoc')[0]
        cmds.sets(rootUpLoc, e=1, forceElement=set)
        cmds.setAttr(rootUpLoc+".v", False)

        # end connector
        end_loc = cmds.duplicate(t_name+"_start_connector", n=t_name+'_end_connectorLoc')[0]
        cmds.setAttr(end_loc+"Shape.overrideColor", 13)
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

        # start orient 
        utils.connectByMatrix(t_name+'_start_connector', [rootUpLoc, t_name+'_root_connector'], ['worldMatrix[0]', 'worldInverseMatrix[0]'], module_name=moduleName, attrs=['r'])

        # stretch volume
        db = cmds.createNode('distanceBetween', n=t_name+'_distanceBetween')
        cmds.sets(db, e=1, forceElement=set)
        root_initLoc = utils.getInitLocFromJoint(root_outJoint)
        end_initLoc = utils.getInitLocFromJoint(end_outJoint)
        cmds.connectAttr(end_initLoc+".worldMatrix[0]", db+".inMatrix1")
        cmds.connectAttr(root_initLoc+".worldMatrix[0]", db+".inMatrix2")
        cmds.connectAttr(db+".distance", t_name+"_length_multDoubleLinear.input2")

        cmds.connectAttr(moduleName+"_mainPoser_decomposeMatrix.outputScaleX", t_name+"_global_scale_multiplyDivide.input2X")

        # save data
        utils.setUserAttr(t_name+"_mod", "endTarget", end_outJoint)
        utils.setUserAttr(t_name+"_mod", "target", start_j)
        utils.setUserAttr(t_name+"_mod", "rootOrientTarget", root_outJoint)
        utils.setUserAttr(t_name+"_mod", "endOrientTarget", end_outJoint)

        # hide root joint
        cmds.setAttr(t_name+'_skinJoint.drawStyle', 2)

        # mirror flag. the saved offsets are applied later, after twistOverride()
        if utils.objectIsOpposite(root_loc):
            cmds.setAttr(t_name+'_mod.mirror', True)

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
                                # print(4444, s)
                                # if s == s.split("Shape")[0][-1].isdigit():
                                #     tg = cmds.createNode('transformGeometry', n=s+'_TG')
                                #     c_mat = cmds.createNode('composeMatrix', n=s+'_compMat')
                                #     cmds.sets(tg, e=1, forceElement=set)
                                #     cmds.sets(c_mat, e=1, forceElement=set)
                                #     cmds.setAttr(c_mat+'.inputScaleY', -1)

                                #     cmds.connectAttr(s+'.worldSpace[0]', tg+'.inputGeometry')
                                #     cmds.connectAttr(c_mat+'.outputMatrix', tg+'.transform')
                                #     cmds.connectAttr(tg+'.outputGeometry', utils.getOpposite(s)+'.create')

                                #     if cmds.objExists(moduleName+"_mod.ikSymmetryBehaviour"):
                                #         cmds.connectAttr(moduleName+"_ikSymmetryBehaviour_condition.outColorB", c_mat + '.inputScaleX')                                    
                                # else:
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
            else:
                self.changeJointsCount(5, moduleName=moduleName)

        # module override
        mod = utils.getModuleInstance(moduleName)
        mod.twistOverride(t_name, data)

        # offsets. after the module override, so the values saved in the template
        # win over the default orientation the override sets
        self.applyOffsets(t_name, data)

        if data and "controlsShapeData" in data:
            # set controls shapes
            for ctrl in data['controlsShapeData']:
                # print (ctrl, "---- > " , data['controlsShapeData'][ctrl])
                ctrlName = data['controlsNamesData'][ctrl]
                ctrlName = utils.getRealNameFromTemplated(t_name, ctrlName)
                # print (ctrl, "---- > " , ctrlName)
                if not cmds.objExists(ctrlName):
                    continue
                cmd = data['controlsShapeData'][ctrl]
                
                utils.setUserAttr(ctrlName, 'customShapeCommand', cmd, type="string")
                
                control = utils.getControlInstance(ctrlName)
                if control:
                    control.setShape(cmd)


            # controls visibility and color
            controlNames = [t_name+"_twist", t_name+"_twist_1", t_name+"_twist_2", t_name+"_twist_3"]
            for cName in controlNames:
                # try:
                intName = utils.getInternalNameFromControl(cName)
                
                if intName not in data['controlsNamesData']:
                    # cmds.warning("Missed control data to load "+ cName)
                    continue

                savedName_templated = data['controlsNamesData'][intName]
                savedName = utils.getRealNameFromTemplated(t_name, savedName_templated)
                # if sym and not "MODNAME" in savedName_templated:
                #     savedName = utils.getOpposite(savedName)

                shapes = cmds.listRelatives(cName, s=1)

                for s in shapes:
                    try:
                        if not cmds.listConnections(s+'.v'):
                            cmds.setAttr(s+'.v', data['controlsVisData'][intName])		
                    except: 
                        cmds.warning(s+" shape cannot change visibility")

                    if data['controlsColorData'][intName]:
                        cmds.setAttr(s+".overrideEnabled", 1)
                    else:
                        cmds.setAttr(s+".overrideEnabled", 0)
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

        
        # select item in list
        self.updateList()

        item = self.win.twists_listWidget.findItems(t_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.twists_listWidget.setCurrentItem(item)

        # display axises
        mod.toggleLRA(self.win.actionSkeleton_LRA.isChecked())

        cmds.setAttr(t_name+"_joints.v", True)

        # fix init scale
        scl = cmds.getAttr(f"{self.curTwistName}_root_connector.sx")
        cmds.setAttr(f"{self.curTwistName}_root_connectorLoc.sx", 1/scl)
        cmds.setAttr(f"{self.curTwistName}_root_connectorLoc.sy", 1/scl)
        cmds.setAttr(f"{self.curTwistName}_root_connectorLoc.sz", 1/scl)

        self.updateFrame()

    # ------------------------------------------------------------- pk_twist

    def loadRigNodesPlugin(self): #
        """Загружает pk_rigNodes.mll, собранный под текущую версию Maya."""
        if "pk_rigNodes" not in (cmds.pluginInfo(q=1, listPlugins=1) or []):
            mayaVersion = cmds.about(v=True).split(" ")[0]
            path = os.path.join(rootPath, "plugins", "plug-ins", mayaVersion, "pk_rigNodes.mll")

            if not os.path.isfile(path):
                cmds.warning("pk_rigNodes.mll is not built for Maya %s - %s" %(mayaVersion, path))
                return False

            cmds.loadPlugin(path)
            if "pk_rigNodes" not in (cmds.pluginInfo(q=1, listPlugins=1) or []):
                return False

        # та же ловушка, что и у pk_ibtw: выгрузка плагина при живых
        # нодах оставляет тип пустой заглушкой, и createNode отдаёт ноду без
        # единого атрибута вместо ошибки
        try:
            healthy = cmds.attributeQuery("ctrlTranslate", type="pk_twist", exists=True)
        except RuntimeError:
            healthy = False

        if not healthy:
            cmds.warning(" pk_twist is registered without its attributes - restart Maya. "
                         "The plugin was unloaded while its nodes were still in the scene.")
            return False

        return True

    def getMllEndJoint(self, start_j): #
        """Дочерний джоинт, до которого тянется цепочка."""
        childs = cmds.listRelatives(start_j, type="joint") or []
        joints = [o for o in childs if "_volume_joint" not in o and "_twist_" not in o]

        if len(joints) == 1:
            return joints[0]

        cmds.warning(" %s must have exactly one child joint, found %s"
                     %(start_j, len(joints)))
        return ""

    @utils.oneStepUndo
    def twists_addMll(self, *args): #
        """Твист на ноде pk_twist.

        Кости вложенной цепочкой прямо под выделенной костью, один контрол
        посередине - он живёт в модуле, а не в скелете. Старые режимы это не
        трогает, у них своя сборка из кривой и motionPath.
        """
        if not self.loadRigNodesPlugin():
            return

        sel = cmds.ls(sl=1) or []
        if len(sel) != 1 or cmds.objectType(sel[0]) != "joint":
            cmds.warning(" Select one joint")
            return
        start_j = sel[0]

        if utils.getObjectSide(start_j) == "r" and cmds.objExists(utils.getOpposite(start_j)):
            cmds.warning(" Select left side joints")
            return

        if not self.getMllEndJoint(start_j):
            return

        t_name = self.mllName(start_j)
        if cmds.objExists(t_name+"_twist_solver") or t_name in self.twists:
            cmds.warning(" This joint already has a twist")
            return

        count, ok = QtWidgets.QInputDialog().getInt(self.win, "Add twist",
                                                   "Enter joints count:",
                                                   value=5, minValue=2, maxValue=100)
        if not ok:
            return

        if not self.buildMll(start_j, count):
            return

        # правая сторона
        opp_j = utils.getOpposite(start_j)
        if opp_j != start_j and cmds.objExists(opp_j):
            opp_name = self.mllName(opp_j)
            if cmds.objExists(opp_name+"_twist_solver"):
                cmds.warning(" %s_twist_solver already exists, the right side is left as it is" %opp_name)
            elif not self.getMllEndJoint(opp_j):
                cmds.warning(" The right side is not built")
            elif self.buildMll(opp_j, count):
                self.connectMllMirror(t_name)

        self.updateList()
        self.selectListItemMll(t_name)
        cmds.select(t_name+"_twistCtrl")

    def mllName(self, joint): #
        """Имя твиста по кости, на которой он строится."""
        return joint.split("_skinJoint")[0].split("_outJoint")[0].split("_twJoint")[0]

    def selectListItemMll(self, name): #
        try:
            item = self.win.twists_listWidget.findItems(name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
            self.win.twists_listWidget.setCurrentItem(item)
        except: pass

    def buildMll(self, start_j, count): #
        """Одна сторона: солвер, цепочка костей и контрол посередине."""
        end_j = self.getMllEndJoint(start_j)
        if not end_j:
            return ""

        t_name = self.mllName(start_j)
        solver = t_name + "_twist_solver"
        moduleName = utils.getModuleName(start_j)

        nodes_set = t_name + "_twistNodesSet"
        if not cmds.objExists(nodes_set):
            # empty: иначе сет забирает текущее выделение, то есть саму кость
            cmds.sets(n=nodes_set, empty=True)
        utils.addToModuleSet(nodes_set, moduleName)

        cmds.createNode("pk_twist", n=solver)
        cmds.sets(solver, e=1, forceElement=nodes_set)

        # кость целиком: ноде этого хватает, чтобы разложить цепочку. Связь
        # живая, поэтому растяжение кости растягивает цепочку равномерно
        cmds.connectAttr(end_j+".translate", solver+".boneTranslate")

        # кости
        step = 1.0 / (count - 1)
        parent = start_j
        joints = []

        for i in range(count):
            cmds.select(parent)
            j = cmds.joint(n="%s_twist_%s_twJoint" %(t_name, i))
            # положение задаёт нода, от кости требуется только чистая система
            # координат - без своего вращения и без jointOrient
            utils.resetAttrs(j, jointOrient=True)
            cmds.setAttr(j+".segmentScaleCompensate", 0)
            cmds.sets(j, e=1, forceElement=nodes_set)

            utils.setUserAttr(j, "pos", i * step, "float", keyable=True, lock=False, min=0, max=1)

            element = "%s.joint[%s]" %(solver, i)
            cmds.connectAttr(j+".pos", element+".position")
            cmds.connectAttr("%s.out[%s].outTranslate" %(solver, i), j+".translate")
            cmds.connectAttr("%s.out[%s].outRotate" %(solver, i), j+".rotate")

            joints.append(j)
            parent = j

        # Цепочка занимает место исходной кости: она уходит из набора для скина,
        # а вместо неё туда идут косточки. Кость 0 стоит там же, где исходная,
        # так что в покое ничего не теряется, зато веса не надо делить между
        # костью и цепочкой. При удалении твиста всё возвращается.
        if cmds.objExists("skinJointsSet") and start_j in (cmds.sets("skinJointsSet", q=1) or []):
            cmds.sets(joints, e=1, forceElement="skinJointsSet")
            cmds.sets(start_j, e=1, remove="skinJointsSet")

        # и сама кость убирается с глаз: в скелете её больше не видно
        try:
            cmds.setAttr(start_j+".drawStyle", 2)
        except: pass

        # оси у новых костей включаются, если они сейчас включены в риге
        if self.jointsAxisesOn():
            for j in joints:
                try:
                    cmds.setAttr(j+".displayLocalAxis", 1)
                except: pass

        self.buildMllControl(t_name, start_j, end_j, moduleName, nodes_set)

        return t_name

    def buildMllControl(self, t_name, start_j, end_j, moduleName, nodes_set): #
        """Контрол твиста: живёт в модуле, стоит на середине кости.

        Модуль и скелет мерят длину по-разному: у модуля своя иерархия, и
        масштаб главного позера в неё входит, а скелет живёт в мировых
        единицах - module.py поэтому и домножает трансляцию скиновых костей на
        <модуль>_mainPoser_decomposeMatrix.outputScaleX. Здесь то же самое, в ту
        же сторону: контрол стоит в модуле, а нода считает в скелете.
        """
        solver = t_name + "_twist_solver"
        ctrl_name = t_name + "_twistCtrl"

        # контролу не место в скелете: он вешается на ту же кость, но модульную
        ctrl_parent = t_name + "_outJoint"
        in_module = cmds.objExists(ctrl_parent)

        if not in_module:
            # модульной пары нет: контрол остаётся там же, где цепочка, и
            # никакого пересчёта единиц не нужно
            ctrl_parent = start_j

        bone = cmds.getAttr(end_j+".t")[0]
        length = math.sqrt(sum([v*v for v in bone]))

        ctrl = controller.Control()
        ctrl.create(ctrl_name, "circle", colorId=17, offset=True, joint=False)

        # кольцо вокруг кости, а не поперёк неё
        cmds.rotate(0, 0, 90, ctrl_name+".cv[*]", r=1, os=1)
        if length:
            r = length * 0.25
            cmds.scale(r, r, r, ctrl_name+".cv[*]", r=1)

        group = ctrl_name + "_group"
        cmds.parent(group, ctrl_parent)
        utils.resetAttrs(group)
        cmds.sets(group, e=1, forceElement=nodes_set)

        # Середина кости, а не запомненная точка: растянется кость - контрол
        # уедет вместе с цепочкой. Вектор берётся тот же, по которому строится
        # цепочка, то есть из скелета. С модульной дочерней кости брать нельзя:
        # её родитель в модуле не обязан совпадать со скелетным, и тогда это
        # совсем другой вектор - контрол уезжает вбок.
        mid = cmds.createNode("multiplyDivide", n=ctrl_name+"_mid_multiplyDivide")
        cmds.sets(mid, e=1, forceElement=nodes_set)
        cmds.connectAttr(end_j+".translate", mid+".input1")
        cmds.connectAttr(mid+".output", group+".translate")

        root_dec = self.moduleScaleNode(moduleName) if in_module else ""

        if root_dec:
            # вектор скелетный, а контрол живёт в модуле: половина длины делится
            # на масштаб модуля, чтобы попасть в его единицы
            half = cmds.createNode("multiplyDivide", n=ctrl_name+"_midScale_multiplyDivide")
            cmds.sets(half, e=1, forceElement=nodes_set)
            cmds.setAttr(half+".operation", 2)
            cmds.setAttr(half+".input1X", 0.5)
            cmds.connectAttr(root_dec+".outputScaleX", half+".input2X")
            for axis in "XYZ":
                cmds.connectAttr(half+".outputX", mid+".input2"+axis)
        else:
            cmds.setAttr(mid+".input2", 0.5, 0.5, 0.5, type="double3")

        utils.setUserAttr(ctrl_name, "type", "control")
        cmds.sets(ctrl_name, e=1, forceElement=nodes_set)

        ctrl_set = moduleName + "_twist_controlSet"
        if not cmds.objExists(ctrl_set):
            cmds.sets(n=ctrl_set, empty=True)
            if cmds.objExists(moduleName+"_controlSet"):
                cmds.sets(ctrl_set, e=1, forceElement=moduleName+"_controlSet")
        cmds.sets(ctrl_name, e=1, forceElement=ctrl_set)

        # вращение от масштаба не зависит, а трансляция - да
        cmds.connectAttr(ctrl_name+".rotate", solver+".ctrlRotate")
        cmds.connectAttr(ctrl_name+".rotateOrder", solver+".ctrlRotateOrder")

        if root_dec:
            scl = cmds.createNode("multiplyDivide", n=ctrl_name+"_scale_multiplyDivide")
            cmds.sets(scl, e=1, forceElement=nodes_set)
            cmds.connectAttr(ctrl_name+".translate", scl+".input1")
            for axis in "XYZ":
                cmds.connectAttr(root_dec+".outputScaleX", scl+".input2"+axis)
            cmds.connectAttr(scl+".output", solver+".ctrlTranslate")
        else:
            cmds.connectAttr(ctrl_name+".translate", solver+".ctrlTranslate")

        return ctrl_name

    def moduleScaleNode(self, moduleName): #
        """decomposeMatrix главного позера модуля - тот же, что у module.py."""
        poser = moduleName + "_mainPoser"
        if not cmds.objExists(poser):
            return ""

        dec = moduleName + "_mainPoser_decomposeMatrix"
        if not cmds.objExists(dec):
            dec = cmds.createNode("decomposeMatrix", n=dec)
            cmds.connectAttr(poser+".worldMatrix[0]", dec+".inputMatrix")
            utils.addToModuleSet(dec, moduleName)

        return dec

    def connectMllMirror(self, t_name): #
        """Настройка левой стороны ведёт правую, анимация у каждой своя."""
        opp_name = utils.getOpposite(t_name)
        solver = t_name + "_twist_solver"
        opp_solver = opp_name + "_twist_solver"

        if not cmds.objExists(opp_solver):
            return

        cmds.connectAttr(solver+".falloff", opp_solver+".falloff", f=1)

        for i in cmds.getAttr(solver+".joint", multiIndices=True) or []:
            j = "%s_twist_%s_twJoint" %(t_name, i)
            opp_j = "%s_twist_%s_twJoint" %(opp_name, i)
            if cmds.objExists(j) and cmds.objExists(opp_j):
                cmds.connectAttr(j+".pos", opp_j+".pos", f=1)

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
        
        if self.isMll(item_name):
            self.twists_removeMll(item_name)
            return

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

    def attachMll(self, socket, target): #
        """Соседняя кость, которая скручивает цепочку.

        Обе кнопки дают один профиль: у корня цепочки скручивания нет, к концу
        оно полное. Различаются они только тем, какую кость указывают - свою
        (её поворот цепочка уже наследует, и он гасится) или дочернюю (её
        поворот добавляется). Берётся только составляющая вокруг оси кости,
        изгиб в твист не попадает.
        """
        name = self.curTwistName
        solver = name + "_twist_solver"

        if not cmds.objExists(solver):
            cmds.warning(" Missed " + solver)
            return
        if cmds.objectType(target) != "joint":
            cmds.warning(" Select one joint")
            return

        def attachTo(tw_name, target, socket):
            solver = tw_name + "_twist_solver"
            root = self.getMllRoot(tw_name)

            # Что именно мерить. Скручивает не сам по себе поворот указанной
            # кости, а поворот одной относительно другой:
            #   родитель указан - берём поворот своей кости относительно него,
            #                     то есть локальный rotate корня цепочки;
            #   ребёнок указан  - берём его собственный локальный rotate, он и
            #                     есть поворот относительно нашей кости.
            # Локальный rotate ключицы, например, меряется от позвоночника и к
            # руке отношения не имеет - подключать его бессмысленно.
            if self.isAboveInChain(target, root):
                src = root
                parents = cmds.listRelatives(root, p=1) or []
                if target != root and (not parents or target != parents[0]):
                    cmds.warning(" %s is not the parent of %s - the twist is "
                                 "measured against %s"
                                 %(target, root, parents[0] if parents else "nothing"))
            else:
                src = target

            # у каждой кнопки свой слот: Attach Root - кость сверху, Attach End -
            # снизу. Оба живут одновременно и складываются
            element = "%s.driver[%s]" %(solver, 0 if socket == "root" else 1)

            cmds.connectAttr(src+".rotate", element+".driverRotate", f=1)
            cmds.connectAttr(src+".rotateOrder", element+".driverRotateOrder", f=1)

            # поза покоя запоминается: дальше в счёт идёт только изменение с
            # этого момента, и риг в дефолте остаётся нескрученным
            rest = cmds.getAttr(src+".rotate")[0]
            cmds.setAttr(element+".driverRest", rest[0], rest[1], rest[2], type="double3")

            # jointOrient драйвера: его канал rotate крутится вокруг собственных
            # осей кости, а они отличаются от осей нашей ровно на него
            orient = cmds.getAttr(src+".jointOrient")[0] \
                     if cmds.attributeQuery("jointOrient", n=src, exists=True) else (0, 0, 0)
            cmds.setAttr(element+".driverOrient", orient[0], orient[1], orient[2], type="double3")
            # Профиль один для обоих случаев: у корня цепочки скручивания нет,
            # к её концу оно полное. Кисть крутит предплечье - локоть стоит,
            # запястье идёт целиком; плечо крутит само себя - плечо стоит,
            # локоть идёт целиком. Разница между этими двумя только в том,
            # наследуется ли поворот драйвера, и это отдельный флаг.
            cmds.setAttr(element+".driverPosition", 1.0)

            # Драйвер выше цепочки - значит его поворот все кости уже получили
            # по иерархии, и гасить его надо в минус, от корня к концу.
            cmds.setAttr(element+".driverInherited",
                         self.isAboveInChain(target, self.getMllRoot(tw_name)))

        attachTo(name, target, socket)

        opp_name = utils.getOpposite(name)
        opp_target = utils.getOpposite(target)

        if opp_name != name and cmds.objExists(opp_name+"_twist_solver") and cmds.objExists(opp_target):
            attachTo(opp_name, opp_target, socket)

        self.updateFrame()

    def jointsAxisesOn(self): #
        """Включено ли сейчас отображение осей костей в риге."""
        try:
            return bool(cmds.getAttr(self.main.rig.root + ".jointsAxises"))
        except:
            return False

    def isAboveInChain(self, node, joint): #
        """Лежит ли node выше joint по иерархии - или это он сам."""
        if not node or not joint or not cmds.objExists(joint):
            return False

        cur = joint
        while cur:
            if cur == node:
                return True
            parents = cmds.listRelatives(cur, p=1) or []
            cur = parents[0] if parents else ""

        return False

    def getMllDrivers(self, twName): #
        """Кости, скручивающие цепочку, по слотам: 0 - сверху, 1 - снизу."""
        solver = twName + "_twist_solver"
        drivers = {}

        if not cmds.objExists(solver):
            return drivers

        for i in cmds.getAttr(solver+".driver", multiIndices=True) or []:
            src = cmds.listConnections("%s.driver[%s].driverRotate" %(solver, i),
                                       source=1, destination=0) or []
            if src:
                drivers[i] = src[0]

        return drivers

    def twists_removeMll(self, name): #
        """Удаление плагинного твиста - обе стороны."""
        # запоминается до удаления: после него ни цепочки, ни её связей уже нет
        root = self.getMllRoot(name)
        j0 = name + "_twist_0_twJoint"
        wasSkin = cmds.objExists("skinJointsSet") and cmds.objExists(j0) \
                  and j0 in (cmds.sets("skinJointsSet", q=1) or [])

        for n in (cmds.sets(name+"_twistNodesSet", q=1) or []):
            if cmds.objExists(n):
                cmds.delete(n)

        if cmds.objExists(name+"_twistNodesSet"):
            cmds.delete(name+"_twistNodesSet")

        # исходная кость возвращается в скелет - снова видима и снова в наборе
        if root and cmds.objExists(root):
            try:
                cmds.setAttr(root+".drawStyle", 0)
            except: pass

            if wasSkin:
                cmds.sets(root, e=1, forceElement="skinJointsSet")

        opp_name = utils.getOpposite(name)
        if opp_name != name and cmds.objExists(opp_name+"_twist_solver"):
            self.twists_removeMll(opp_name)

        self.curTwistName = ''
        self.updateList()

    @utils.oneStepUndo
    def attach(self, socket, target=None):
        # print(2222, "Attach to", socket, target)
        if not target:
            sel = cmds.ls(sl=1) or []
            if not sel:
                cmds.warning("Select the control or joint")
                return
            
            target = sel[0]
            
        if self.isMll(self.curTwistName):
            # у плагинного варианта драйвером служит сама кость, без подмены на
            # модульную: цепочка живёт там же, где выделенная
            return self.attachMll(socket, target)

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
                for a in [".tx", ".ty", ".tz"]:
                    cmds.setAttr(rootUpLoc+a, 0)

                # save data
                utils.setUserAttr(t_name+"_mod", "rootOrientTarget", target)

            elif socket == "end":
                endLoc = t_name + "_end_connectorLoc"
                cmds.parent(endLoc, target)
                for a in [".tx", ".ty", ".tz"]:
                    cmds.setAttr(endLoc+a, 0)

                # save data
                utils.setUserAttr(t_name+"_mod", "endOrientTarget", target)

        t_name = self.curTwistName
        
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
        twist = self.getTwist(t_name)
        target_outJoint = twist['target']
        endTarget_outJoint = twist['endTarget']
    
        def resetRoot():
            # skip if target is default joint
            if twist['rootOrientTarget'] == target_outJoint:
                return

            rootUpLoc = t_name + "_rootUpLoc"
            try: cmds.parent(rootUpLoc, target_outJoint)
            except: pass
            utils.resetAttrs(rootUpLoc, matrix=True)

            rootUpLoc_opp = utils.getOpposite(rootUpLoc)
            if cmds.objExists(rootUpLoc_opp):
                target_opp = utils.getOppositeIfExists(target_outJoint)
                try:
                    cmds.parent(rootUpLoc_opp, target_opp)
                except: pass
                utils.resetAttrs(rootUpLoc_opp, matrix=True)

        def resetEnd():
            # skip if parent is default joint
            if cmds.listRelatives(twist['endOrientTarget'], p=1)[0] == target_outJoint:
                self.updateFrame()
                return 

            if twist['endOrientTarget'] == endTarget_outJoint:
                return

            endLoc = t_name + "_end_connectorLoc"
            try:
                cmds.parent(endLoc, endTarget_outJoint)
            except: pass
            utils.resetAttrs(endLoc)

            endLoc_opp = utils.getOpposite(endLoc)
            if cmds.objExists(endLoc_opp):
                endTarget_outJoint_opp = utils.getOppositeIfExists(endTarget_outJoint)
                try:
                    cmds.parent(endLoc_opp, endTarget_outJoint_opp)
                except: pass
                utils.resetAttrs(endLoc_opp, matrix=True)

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
            if not ok:
                return
        
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
                utils.removeTransformParentJoint(j)

                mp = cmds.createNode('motionPath', n=twName+'_curve_%s_mpath' %i)
                cmds.sets(mp, e=1, forceElement=twSet)
                cmds.setAttr(mp+'.worldUpType', 2)
                cmds.setAttr(mp+'.frontAxis', 0)
                cmds.connectAttr(j+'.pos', mp+'.uValue')

                mult = utils.createNode('multDoubleLinear', n=twName+'_multDoubleLinear_%s' %i)
                cmds.sets(mult, e=1, forceElement=twSet)
                cmds.connectAttr(quat+'.outputRotateX', mult+'.input1')
                cmds.connectAttr(j+'.pos', mult+'.input2')

                mult2 = utils.createNode('multDoubleLinear', n=twName+'_twistMultDoubleLinear_%s' %i)
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
                # force: addSkinJoints() has already connected skinJoint.pos to
                # twJoint.pos, so the destination is taken - without force
                # connectAttr raises and the rest of the method never runs
                if utils.getObjectSide(twName) == "l":
                    cmds.connectAttr(twName+'_twist_%s_twJoint.pos' %i, twName_opp+'_twist_%s_twJoint.pos' %i, f=1)
                    cmds.connectAttr(twName+'_twist_%s_twJoint.twistMultiplier' %i, twName_opp+'_twist_%s_twJoint.twistMultiplier' %i, f=1)
                else:
                    cmds.connectAttr(twName_opp+'_twist_%s_twJoint.pos' %i, twName+'_twist_%s_twJoint.pos' %i, f=1)
                    cmds.connectAttr(twName_opp+'_twist_%s_twJoint.twistMultiplier' %i, twName+'_twist_%s_twJoint.twistMultiplier' %i, f=1)

        # update only if set count manually from button
        if updateFrame:
            self.updateFrame()

    @staticmethod
    def getDataMll(twName): #
        """Данные плагинного твиста - того, что нужно интерфейсу и удалению."""
        solver = twName + "_twist_solver"
        joints = cmds.listConnections(solver+".ctrlTranslate", source=1, destination=0) or []

        twData = {}
        twData['name'] = twName
        twData['mode'] = 'mll'
        twData['jointsCount'] = len(cmds.getAttr(solver+".joint", multiIndices=True) or [])
        twData['falloff'] = cmds.getAttr(solver+".falloff")
        twData['target'] = Twist.getMllRoot(twName)
        twData['endTarget'] = ''

        driversData = []
        for i in cmds.getAttr(solver+".driver", multiIndices=True) or []:
            element = "%s.driver[%s]" %(solver, i)
            src = cmds.listConnections(element+".driverRotate", source=1, destination=0) or []
            driversData.append({
                'index': i,
                'driver': src[0] if src else '',
                'rest': cmds.getAttr(element+".driverRest")[0],
                'position': cmds.getAttr(element+".driverPosition"),
                'amount': cmds.getAttr(element+".driverAmount"),
                'inherited': cmds.getAttr(element+".driverInherited"),
            })
        twData['driversData'] = driversData
        return twData

    @staticmethod
    def getMllRoot(twName): #
        """Кость, под которой висит цепочка."""
        j = twName + "_twist_0_twJoint"
        if not cmds.objExists(j):
            return ""
        parents = cmds.listRelatives(j, p=1) or []
        return parents[0] if parents else ""

    @staticmethod
    def getData(twName, module_name=""):
        if cmds.objExists(twName+"_twist_solver"):
            return Twist.getDataMll(twName)

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
        twData['rootOffset'] = cmds.xform(twName + "_rootUpLoc", query=True, worldSpace=True, rotation=True)
        twData['endOffset'] = cmds.xform(twName + "_end_connectorLoc", query=True, worldSpace=True, rotation=True)
        twData['rootScale'] = list(cmds.getAttr(twName + "_rootUpLoc.scale")[0])
        twData['endScale'] = list(cmds.getAttr(twName + "_end_connectorLoc.scale")[0])
        twData['rootRotate'] = list(cmds.getAttr(twName + "_rootUpLoc.rotate")[0])
        twData['endRotate'] = list(cmds.getAttr(twName + "_end_connectorLoc.rotate")[0])

        opp = utils.getOpposite(twName)
        if cmds.objExists(opp+"_mod") and opp!=twName:
            if not cmds.objExists(opp + "_rootUpLoc"):
                cmds.warning("Missed "+ opp + "_rootUpLoc")
                return
            twData['rootOffsetR'] = cmds.xform(opp + "_rootUpLoc", query=True, worldSpace=True, rotation=True)
            twData['rootScaleR'] = list(cmds.getAttr(opp + "_rootUpLoc.scale")[0])
            twData['rootRotateR'] = list(cmds.getAttr(opp + "_rootUpLoc.rotate")[0])
            if cmds.objExists(opp + "_end_connectorLoc"):
                twData['endOffsetR'] = cmds.xform(opp + "_end_connectorLoc", query=True, worldSpace=True, rotation=True)
                twData['endScaleR'] = list(cmds.getAttr(opp + "_end_connectorLoc.scale")[0])
                twData['endRotateR'] = list(cmds.getAttr(opp + "_end_connectorLoc.rotate")[0])
            else:
                print ("Missed ", opp + "_end_connectorLoc")


        jointsPos = []
        for i in range(jointsCount):
            pos = cmds.getAttr(twName+"_twist_%s_twJoint.pos" %i)
            jointsPos.append(pos)
        twData['jointsPos'] = jointsPos
        
        jointsTwistMultiplier = []
        for i in range(jointsCount):
            if cmds.objExists(twName+"_twist_%s_twJoint.twistMultiplier" %i):
                twistMultiplier = cmds.getAttr(twName+"_twist_%s_twJoint.twistMultiplier" %i)
            else: 
                twistMultiplier = 1
            jointsTwistMultiplier.append(twistMultiplier)
        twData['jointsTwistMultiplier'] = jointsTwistMultiplier

        if module_name != "":
            twData['target'] = utils.getTemplatedNameFromReal(module_name, twData['target'])
            twData['endTarget'] = utils.getTemplatedNameFromReal(module_name, twData['endTarget'])
            twData['rootOrientTarget'] = utils.getTemplatedNameFromReal(module_name, twData['rootOrientTarget'])
            twData['endOrientTarget'] = utils.getTemplatedNameFromReal(module_name, twData['endOrientTarget'])

        def getControlsShapeData():
            controlsAttrData = {}
            controlsNamesData = {}
            controlsVisData = {}
            controlsColorData = {}
            controlsShapeData = {}

            controlNames = [twName+"_twist", twName+"_twist_1", twName+"_twist_2", twName+"_twist_3"]
            for cName in controlNames:
                # name
                control = cmds.getAttr(cName + ".internalName")
                controlsNamesData[control] = utils.getTemplatedNameFromReal(twName, cName)
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
        
        controlsData = getControlsShapeData()
        twData['controlsAttrData'] = controlsData[0]	
        twData['controlsNamesData'] = controlsData[1]	
        twData['controlsVisData'] = controlsData[2]
        twData['controlsColorData'] = controlsData[3]	
        twData['controlsShapeData'] = controlsData[4]	
        
        return twData

    def toggleOffsetLocators(self):
        t_name = self.curTwistName
        v = not cmds.getAttr(t_name+"_end_connectorLoc.visibility")
        cmds.select(t_name+"_end_connectorLoc", t_name+"_rootUpLoc")

        opp_t_name = utils.getOpposite(t_name)
        if cmds.objExists(opp_t_name+"_mod"):
            cmds.select(opp_t_name+"_end_connectorLoc", opp_t_name+"_rootUpLoc", add=1)

        if v:
            cmds.ShowSelectedObjects()
        else:
            cmds.hide()
            name = t_name.split("_")[-1]
            m_name = t_name.split(name)[0]
            cmds.hide(m_name+"output")
            opp = utils.getOppositeIfExists(m_name+"output")
            cmds.hide(opp)

    def addSkinJoints(self, twName):
        moduleName = utils.getModuleName(twName+"_outJoint")
        # delete old twist skinJoints
        if cmds.objExists(f"{twName}_twist_0_skinJoint"):
            cmds.delete(f"{twName}_twist_0_skinJoint")

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

    def applyOffsets(self, t_name, data):
        """Restore the saved rotation and scale of the twist offset locators.

        The saved values are local, not world. Through a mirrored (negative
        determinant) parent a world rotation does not round trip - the reflection
        does not fit into euler angles and Maya lands 180 degrees off. Templates
        saved before this keep only the world rotation, it is used as a fallback.

        Call it when the locators are already under their final parent.
        """
        if not data:
            return

        if utils.objectIsOpposite(t_name + "_root_connectorLoc"):
            side = "R"
        else:
            side = ""

        for loc, key in ((t_name + "_rootUpLoc", "root"), (t_name + "_end_connectorLoc", "end")):
            if not cmds.objExists(loc):
                continue

            scale = data.get(key + "Scale" + side)
            if scale:
                cmds.setAttr(loc + ".scale", *scale)

            rotate = data.get(key + "Rotate" + side)
            if rotate:
                cmds.setAttr(loc + ".rotate", *rotate)
            else:
                offset = data.get(key + "Offset" + side)
                if offset:
                    cmds.xform(loc, worldSpace=True, rotation=offset)

    def getTwistsData(self, moduleNames=[]):

        twistsData = []
        twists_names = []

        if cmds.objExists("twists"):
            tw_mods = cmds.listRelatives('twists', type='transform') or []
            for tw_mod in tw_mods:

                if utils.getObjectSide(tw_mod) == "r" and cmds.objExists(utils.getOpposite(tw_mod)):
                    continue
        
                tw_m_Name = utils.getModuleName(tw_mod).split("|")[-1]
                tw_Name = tw_m_Name.split("_mod")[0]

                if moduleNames:
                    save = False
                    modules_names = self.modulesInTwist(tw_Name)
                    for m_name in modules_names:
                        if m_name in moduleNames:
                            save = True
                    if save:
                        twists_names.append(tw_Name)
                else:
                    twists_names.append(tw_Name)

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
    
    def modulesInTwist(self, tw_name):
        data = self.getData(tw_name)
        modules = []
        if data:
            for d in data:
                if d in ["name", "target", "endTarget", "rootOrientTarget", "endOrientTarget"]:
                    if d == "name": tgt = data[d] + "_skinJoint"
                    else: tgt = data[d]
                    m_name = utils.getModuleName(tgt)
                    modules.append(m_name)
        
        return modules