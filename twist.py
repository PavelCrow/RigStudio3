import maya.cmds as cmds
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
        self.win.rebuildTwist_btn.clicked.connect(self.rebuild)

        self.win.twists_listWidget.itemSelectionChanged.connect(self.selectItem)
        #self.win.twists_listWidget.itemClicked.connect(self.selectItem)
        self.win.twists_listWidget.itemDoubleClicked.connect(self.doubleClckItem)		

        self.win.twist_attachRootToParent_btn.clicked.connect(partial(self.attachRoot, attachRoot=True))
        self.win.twist_attachRoot_btn.clicked.connect(partial(self.attachRoot, attachRoot=True, selected=True))
        self.win.twist_attachEnd_btn.clicked.connect(partial(self.attachRoot, attachEnd=True, selected=True))
        self.win.twist_reset_btn.clicked.connect(self.attachRoot)
        self.win.alignToChild_checkBox.clicked.connect(partial(self.alignToChild, manual=True))

    def loadTwistsData(self):
        self.twists = {}

        if not cmds.objExists('twists'):
            return

        twists_gr = cmds.listRelatives('twists') or []
        for t_gr in twists_gr:
            twist = {}
            t_name = t_gr.split('_mod')[0]
            t_jnt = t_name + "_joint"


            twist['name'] = t_name
            twist['jnt'] = t_jnt
            twist['grp'] = t_gr

            self.twists[t_name] = twist

    def doubleClckItem(self):
        cmds.select(self.curTwist['grp'])

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
        #print "UPDATE FRAME", self.curTwistName
        if self.curTwistName == '':
            self.win.twist_frame.setEnabled(False)
            self.win.twistName_lineEdit.setText("")		
            self.win.twistRootJoint_lineEdit.setText("")		
            self.win.twistEndJoint_lineEdit.setText("")
            self.win.twistsJointsCount_spinBox.setValue(0)	
        else:
            if not cmds.objExists(self.curTwistName+"_mod"):
                return
            self.win.twist_frame.setEnabled(True)
            data = self.getData(self.curTwistName)

            self.win.twistName_lineEdit.setText(self.curTwist['jnt'])	
            self.win.twistsJointsCount_spinBox.setValue(data['jointsCount'])	

            # set attach root checkbox
            twist_connector = self.curTwistName + "_root_connector"
            start_connectorLoc = self.curTwistName + "_start_connectorLoc_mirrorGroup"
            par = cmds.listRelatives(start_connectorLoc, p=1)[0]

            twist_rootConnector = self.curTwistName + "_root_connectorLoc"
            twist_endConnector = self.curTwistName + "_end_connectorLoc"
            rootPar = cmds.listRelatives(twist_rootConnector, p=1)[0]
            endPar = cmds.listRelatives(twist_endConnector, p=1)[0]

            if par != twist_connector:
                rootPar = cmds.listRelatives(start_connectorLoc, p=1)[0]
            self.win.twistRootJoint_lineEdit.setText(rootPar)
            self.win.twistEndJoint_lineEdit.setText(endPar)

            if self.getAlignedConstraint():
                self.win.alignToChild_checkBox.setChecked(True)
            else:
                self.win.alignToChild_checkBox.setChecked(False)

        if self.curTwistName.split('_')[0] == 'r':
            self.win.twist_frame.setEnabled(False)

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
            sel = cmds.ls(sl=1)

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

            count = 4

            count = int(count)
            twist_startOffset = 0
            twist_startLocPos = 0
            twist_endLocPos = 0
            t_name = start_j.split('_joint')[0]
            aligned = False
        else:
            if module_name:
                t_name = utils.getRealNameFromTemplated(module_name, data['name'])
                start_j = utils.getRealNameFromTemplated(module_name, data['start_j'])
                end_j = utils.getRealNameFromTemplated(module_name, data['end_j'])
            else:
                t_name = data['name']
                start_j = data['start_j']
                end_j = data['end_j']

            count = data['jointsCount']
            twist_startOffset = data['startOffset']
            twist_startLocPos = data['startLocPos']
            twist_endLocPos = data['endLocPos']
            aligned = data['aligned']
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
            path = rootPath + '//modules//_twist.ma'
        else:
            path = rootPath + '//modules//_twistSimple.ma'
        cmds.file(path, pr=1, i=1, type="mayaAscii", namespace='_temp_', ra=True, mergeNamespacesOnClash=False,options="v=0;")

        # add attributes to all twist nodes
        nodes = cmds.ls('_temp_:*')
        moduleName = utils.getModuleName(t_name+"_joint")

        for n in nodes:
            if cmds.objExists(n):
                try:
                    utils.setUserAttr(n, 'moduleName', moduleName)
                except: 
                    utils.addModuleNameAttr(n, moduleName)
                cmds.rename(n, n.replace("_temp_:", t_name+"_"))
            else:
                pass

        # remove namespace
        cmds.namespace(removeNamespace='_temp_')		

        # connect root connector
        off_loc = cmds.spaceLocator(n=t_name+'_root_connectorLoc')[0]
        utils.addModuleNameAttr(off_loc, moduleName)
        cmds.setAttr(off_loc+'.overrideEnabled', 1)
        cmds.setAttr(off_loc+'.overrideColor', 13)
        cmds.parent(off_loc, t_name+"_outJoint")
        cmds.hide(off_loc)
        utils.resetAttrs(off_loc)
        con = cmds.aimConstraint(end_j, off_loc, worldUpType="none")
        #cmds.delete(con)

        # add controls to set
        if advanced:
            cmds.sets(t_name+"_twist", e=1, forceElement=moduleName+'_controlSet')
            cmds.sets(t_name+"_twist_1", e=1, forceElement=moduleName+'_controlSet')
            cmds.sets(t_name+"_twist_2", e=1, forceElement=moduleName+'_controlSet')
            cmds.sets(t_name+"_twist_3", e=1, forceElement=moduleName+'_controlSet')

        if utils.getObjectSide(t_name) == 'r':
            cmds.setAttr(off_loc+'.sz', -1)
            if advanced:
                cmds.setAttr(t_name+'_twistMiddle_offset.sy', -1)
            scl = -1
            cmds.setAttr(t_name+'_mod.mirror', 1)
        else:
            scl = 1
        comp = cmds.createNode('composeMatrix', n=t_name+'_flipRootCompMat')
        utils.connectByMatrix(t_name+'_root_connector', [comp, off_loc], ['outputMatrix', 'worldMatrix[0]'])
        cmds.setAttr(comp+'.inputScaleY', scl)

        # connect end connector
        endIn_loc = cmds.duplicate(t_name+'_end_connector', n=t_name+'_end_connectorLoc')[0]
        childs = pm.listRelatives(endIn_loc, type='transform')
        pm.delete(childs)			
        cmds.parent(endIn_loc, end_j.replace("_joint", "_outJoint"))

        utils.connectByMatrix(t_name+'_end_connector', [endIn_loc, t_name+'_end_connector'], ['worldMatrix[0]', 'parentInverseMatrix[0]'])
        cmds.setAttr(endIn_loc+'.tx', 0)
        cmds.setAttr(endIn_loc+'.ty', 0)
        cmds.setAttr(endIn_loc+'.tz', 0)



        # snap endLoc rotations
        def snapLoc(loc):
            for ax in ['x', 'y', 'z']:
                v = cmds.getAttr(loc+'.r'+ax)
                if v > -45 and v < 45:
                    cmds.setAttr(loc+'.r'+ax, 0)
                elif v > -135 and v < -45:
                    cmds.setAttr(loc+'.r'+ax, -90)
                elif v > 45 and v < 135:
                    cmds.setAttr(loc+'.r'+ax, 90)
                else: 
                    cmds.setAttr(loc+'.r'+ax, 180)

        if advanced:
            snapLoc(endIn_loc)
        snapLoc(off_loc)
        cmds.hide(endIn_loc)

        # connect start connector
        startIn_loc = cmds.spaceLocator(n=t_name+'_start_connectorLoc')[0]
        utils.addModuleNameAttr(startIn_loc, moduleName)
        g = cmds.group(startIn_loc, n=startIn_loc+"_mirrorGroup")
        utils.addModuleNameAttr(g, moduleName)

        if start_j == t_name + "_joint":
            cmds.parent(g, t_name+"_root_connector")
        else:
            cmds.parent(g, start_j.replace("_joint", "_outJoint"))
        utils.connectByMatrix(t_name+'_start_connector', [startIn_loc, t_name+'_start_connector'], ['worldMatrix[0]', 'parentInverseMatrix[0]'], attrs=['r'])
        cmds.hide(startIn_loc)
        startIn_aim = cmds.spaceLocator(n=startIn_loc+"Aim")[0]
        cmds.parent(startIn_aim, t_name+'_root_connector')
        utils.resetAttrs(startIn_aim)
        utils.addModuleNameAttr(startIn_aim, t_name)
        cmds.aimConstraint(startIn_aim, startIn_loc, mo=0, offset=(0,0,0), weight=1, aimVector=(1,0,0), upVector=(0,1,0), worldUpType="none")
        con = cmds.parentConstraint(t_name+'_root_connector', g, mo=0)
        cmds.delete(con)		

        cmds.setAttr(startIn_aim+".tx", 1)

        # parent twist mod
        if not cmds.objExists("twists"):
            cmds.group(n="twists", empty=1)
            cmds.parent("twists", "rig")
        cmds.parent(t_name+'_mod', 'twists')

        # create absolute scale multiplier
        mult = cmds.createNode('multiplyDivide', n=t_name+'_absScaleMult')
        cmds.connectAttr(t_name+'_root_connector.s', mult+'.input1')
        if cmds.getAttr(t_name+'_root_connector.sx') < 0: cmds.setAttr( mult+'.input2X', -1)
        if cmds.getAttr(t_name+'_root_connector.sy') < 0: cmds.setAttr( mult+'.input2Y', -1)
        if cmds.getAttr(t_name+'_root_connector.sz') < 0: cmds.setAttr( mult+'.input2Z', -1)

        # create joints
        for i in range(0, count+2):

            if advanced:
                # build follicle
                fS = cmds.createNode('follicle', n=t_name+'_follShape_'+str(i))
                fT = cmds.listRelatives(fS, parent=1)[0]
                utils.addModuleNameAttr(fT, moduleName)
                fT = cmds.rename(fT, t_name+'_foll_'+str(i))
                j = cmds.joint(n=t_name+'_twJnt_'+str(i))
                utils.addModuleNameAttr(j, moduleName)

                # connect follicle
                cmds.connectAttr(fS+'.outTranslate', fT+'.translate')
                cmds.connectAttr(fS+'.outRotate', fT+'.rotate')
                cmds.connectAttr(t_name+'_surf.worldSpace[0]', fS+'.inputSurface')

                # connect absolute scale 
                #cmds.connectAttr(mult+'.output', fT+'.s')
                #cmds.setAttr(mult+'.input1X', -1)

                # set U value
                cmds.setAttr(fS+'.parameterV', 0.5)
                cmds.setAttr(fS+'.parameterU', 1.0/(count+1)*i)

                cmds.parent(fT, t_name+'_system')

            # create skin joint
            sj = cmds.joint(n=t_name+'_twist_'+str(i)+'_joint')
            # correct joint size
            cmds.setAttr(sj+".radius", cmds.getAttr("main.jointsSize"))
            utils.addModuleNameAttr(sj, moduleName)
            cmds.sets(sj, e=1, forceElement='skinJointsSet' )	

            # parent skin joint
            if i == 0:
                par = t_name+'_joint'
                cmds.parent(sj, par)
                utils.resetAttrs(sj)
            else:
                par = t_name+'_twist_'+str(i-1)+'_joint'
                if advanced:
                    cmds.parent(sj, par)

            # reset transform nodes
            temp_par = cmds.listRelatives(sj, parent=1)[0]
            if cmds.objectType(temp_par) != 'joint':
                utils.resetAttrs(temp_par)
                cmds.parent(sj, par)
                cmds.delete(temp_par)

            # connect skin joints
            if advanced:
                utils.connectByMatrix(sj, [j, sj], ['worldMatrix[0]', 'parentInverseMatrix[0]'])

                # reset joint orients
                cmds.setAttr(sj+'.jointOrientX', 0)
                cmds.setAttr(sj+'.jointOrientY', 0)
                cmds.setAttr(sj+'.jointOrientZ', 0)
                cmds.disconnectAttr(t_name+'_twist_%s_joint_decMat.outputScaleX' %i, sj+'.scaleX')
                cmds.disconnectAttr(t_name+'_twist_%s_joint_decMat.outputScaleY' %i, sj+'.scaleY')
                cmds.disconnectAttr(t_name+'_twist_%s_joint_decMat.outputScaleZ' %i, sj+'.scaleZ')

            else:
                if i == 0:
                    dist = cmds.createNode('distanceBetween', n=t_name+"_distanceBetween")
                    cmds.connectAttr(end_j.replace("outJoint", "joint") +".t", dist+'.point2')
                if i > 0:
                    dist = t_name+"_distanceBetween"
                    mult = cmds.createNode('multDoubleLinear', n=sj+"_dist_multDoubleLinear")
                    mult2 = cmds.createNode('multDoubleLinear', n=sj+"_scaleCorrect_multDoubleLinear")
                    cmds.connectAttr(t_name+"_distanceBetween.distance", mult+'.input1')
                    cmds.setAttr(mult+'.input2', 1.0/(count+1))
                    cmds.connectAttr(mult+".output", mult2+'.input1')
                    cmds.connectAttr(start_j+".sx", mult2+'.input2')
                    cmds.connectAttr(mult2+".output", sj+'.tx')

                    mult3 = cmds.createNode('multDoubleLinear', n=sj+"_twist_multDoubleLinear")
                    cmds.connectAttr(t_name+"_endUp_loc.rx", mult3+'.input1')
                    cmds.setAttr(mult3+'.input2', 1.0/(count+1))
                    cmds.connectAttr(mult3+".output", sj+'.rx')

                # select joint for correct next joint creating
                cmds.select(sj)

            # connect to volume joint
            if cmds.objExists(t_name+'_volume_joint'):
                cmds.connectAttr(t_name+'_volume_joint.sx', sj+'.scaleX')
                cmds.connectAttr(t_name+'_volume_joint.sy', sj+'.scaleY')
                cmds.connectAttr(t_name+'_volume_joint.sz', sj+'.scaleZ')

        cmds.sets(start_j, e=1, rm='skinJointsSet' )	

        self.updateList()		
        cmds.setAttr(t_name+'_connectors.v', 0)

        # align to child
        if aligned:				
            self.alignToChild(name=t_name, force=True)		


        # orient fix for mirrored side end connector
        cmds.parent(endIn_loc, endIn_loc.replace("end_connectorLoc", "root_connector"))
        cmds.setAttr(endIn_loc+'.rx', 0)		
        cmds.setAttr(endIn_loc+'.ry', 0)		
        cmds.setAttr(endIn_loc+'.rz', 0)		
        cmds.parent(endIn_loc, end_j.replace("_joint", "_outJoint"))


        # create twist on mirrored joint
        if mirror:
            if t_name.split('_')[0] == 'l':
                if cmds.objExists(utils.getOppositeObject(t_name+"_joint")):
                    if data == {}:
                        data = self.getData(t_name)
                    reverseData = data
                    reverseData['name'] = utils.getOppositeObject(t_name)
                    reverseData['start_j'] = utils.getOppositeObject(start_j)
                    reverseData['end_j'] = utils.getOppositeObject(end_j)
                    self.twists_add(reverseData, setHelpers=False, advanced=advanced)
                    # connect control shapes
                    if cmds.objExists(moduleName+'_mod.mirror'):
                        mirrorShape = cmds.getAttr(utils.getOppositeObject(moduleName+'_mod.mirror'))
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
                                    utils.addModuleNameAttr(tg, moduleName)
                                    utils.addModuleNameAttr(c_mat, moduleName)
                                    cmds.setAttr(c_mat+'.inputScaleY', -1)
                                    #cmds.setAttr(c_mat+'.inputScaleZ', -1)

                                    cmds.connectAttr(s+'.worldSpace[0]', tg+'.inputGeometry')
                                    cmds.connectAttr(c_mat+'.outputMatrix', tg+'.transform')
                                    cmds.connectAttr(tg+'.outputGeometry', utils.getOppositeObject(s)+'.create')
                                else:
                                    cmds.connectAttr(s+'.worldSpace[0]', utils.getOppositeObject(s)+'.create')

                        else:						
                            shapes = cmds.listRelatives(c, s=1)
                            #print "1", c, shapes
                            for s in shapes:
                                try:	
                                    cmds.connectAttr(s+'.worldSpace[0]', utils.getOppositeObject(s)+'.create')
                                except: cmds.warning(" MISS CONTROL SHAPE " + utils.getOppositeObject(s))						
                    if aligned:
                        con = self.getAlignedConstraint()
                        cmds.setAttr(con+".aimVectorX", -1)
                        cmds.setAttr(con+".offsetY", 180)

        # add twist controls to control set
        if advanced:
            cmds.sets(t_name+'_twist_moduleControlSet', e=1, forceElement=moduleName+'_moduleControlSet' )

        # hide root joint
        cmds.setAttr(t_name+'_joint.drawStyle', 2)

        # select item in list
        item = self.win.twists_listWidget.findItems(t_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.twists_listWidget.setCurrentItem(item)

        # set scale
        global_scale = cmds.getAttr(t_name+"_end_connector.tx") / 2

        #global_scale = cmds.xform(moduleName+"_mainPoser", s=1, q=1, ws=1)[0]
        cmds.setAttr(off_loc+'.sx', cmds.getAttr(off_loc+'.sx') * global_scale)
        cmds.setAttr(off_loc+'.sy', cmds.getAttr(off_loc+'.sy') * global_scale)
        cmds.setAttr(off_loc+'.sz', cmds.getAttr(off_loc+'.sz') * global_scale)	
        #print global_scale, off_loc, cmds.getAttr(off_loc+'.sx')		

        m = utils.getModuleInstance(moduleName)
        m.toggleLRA(self.win.actionSkeleton_LRA.isChecked())

        # attach twist to limb module
        if m.type == "limb" or m.type == "limbQuadrupped":				
            m.addMiddleTwistOffsetControl()

        # aim to child
        if not advanced:
            child = cmds.listRelatives(t_name + "_end_connectorLoc", p=1)[0]
            #l = cmds.spaceLocator(n=t_name+"_twistUpVectorLoc")[0]
            #cmds.parent(l,start_j.replace("joint", "outJoint"))
            #utils.resetAttrs(l)
            #cmds.setAttr(l+".ty", 1)
            con = cmds.aimConstraint(child, t_name + "_twist_0_joint", worldUpType="objectrotation", offset=(0,0,0))[0]
            #cmds.connectAttr(l+".worldMatrix[0]", con+".worldUpMatrix")
            cmds.connectAttr(t_name+"_start_connectorLoc.worldMatrix[0]", con+".worldUpMatrix")
            if t_name.split("_")[0] == "r":
                cmds.setAttr(con+".aimVectorX", -1)
                cmds.setAttr(con+".offsetY", 180)					

        # finish 
        if len(sel) > 0:
            cmds.select(sel)

        self.updateFrame()

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

        #cmds.delete(item_name + '_start_connectorLoc')
        cmds.delete(item_name + '_start_connectorLoc_mirrorGroup')
        cmds.delete(item_name + '_end_connectorLoc')
        cmds.delete(item_name + '_root_connectorLoc')
        cmds.delete(item_name + '_twist_0_joint')
        cmds.delete(item_name + '_mod')		

        if cmds.objExists(item_name+"_distanceBetween"):
            cmds.delete(item_name + '_distanceBetween')
        if cmds.objExists(item_name+"_twistUpVectorLoc"):
            cmds.delete(item_name + '_twistUpVectorLoc')

        # remove twist on mirrored joint
        if item_name.split('_')[0] == 'l':
            oppName = utils.getOppositeObject(item_name)
            if cmds.objExists(oppName + '_mod'):
                self.twists_remove(oppName)

        self.curTwistName = ''

        self.updateList()
        #self.selectItem()

        # show root joint
        cmds.setAttr(item_name+'_joint.drawStyle', 0)

    def rebuild(self):
        self.loadTwistsData()
        self.curTwistName = self.win.twists_listWidget.currentItem().text()
        self.curTwist = self.twists[self.curTwistName]		

        sel = cmds.ls(sl=1)
        jnt = self.curTwist['jnt']
        name = jnt.split("_joint")[0]
        data = self.getData(name)
        data["jointsCount"] = self.win.twistsJointsCount_spinBox.value()

        self.twists_remove()
        #cmds.select(jnt)
        self.twists_add(data)

        #if self.curTwistName.split('_')[0] == 'l':
            #oppName = utils.getOppositeObject(self.curTwistName)
            #if cmds.objExists(oppName + '_mod'):
                #self.twists_add(data)

        try:
            cmds.select(sel)
        except: pass

    def attachRoot(self, attachRoot=False, attachEnd=False, selected=False):
        name = self.curTwistName
        sel = cmds.ls(sl=1)

        def attach(name, parent_j=""):
            start_j = name + "_joint"
            l = name + '_start_connectorLoc'
            if cmds.objExists(l+"_mirrorGroup"):
                l = l+"_mirrorGroup"

            if attachRoot:
                if selected:
                    sel_j = sel[0]
                    if cmds.objectType(parent_j) != 'joint':
                        cmds.warning("Select joint for attaching twist root")
                        return
                else:
                    m_name = utils.getModuleName(start_j)
                    m = utils.getModuleInstance(m_name)
                    if m.parent:
                        parent_j = cmds.listRelatives(start_j, p=1)[0]
                        while cmds.objectType(parent_j) != 'joint':
                            parent_j = cmds.listRelatives(parent_j, p=1)[0]
                    else:
                        return
                if cmds.listRelatives(l, p=1)[0] != parent_j:
                    cmds.parent(l, parent_j.replace("_joint", "_outJoint"))

            elif attachEnd:
                l = name + "_end_connectorLoc"
                if selected:
                    sel_j = sel[0]
                    if cmds.objectType(parent_j) != 'joint':
                        cmds.warning("Select joint for attaching twist end")
                        return	
                    if cmds.listRelatives(l, p=1)[0] != parent_j:
                        cmds.parent(l, parent_j.replace("_joint", "_outJoint"))
            else:
                l = name + '_start_connectorLoc'
                if cmds.objExists(l+"_mirrorGroup"):
                    l = l+"_mirrorGroup"				
                twist_connector = name + "_root_connector"
                if cmds.listRelatives(l, p=1)[0] != twist_connector:
                    cmds.parent(l, twist_connector)

                l = name + "_end_connectorLoc"
                childs = []
                for j in cmds.listRelatives(start_j):
                    if cmds.objectType(j) == "joint" and "_twist_" not in j and "_volume_" not in j:
                        childs.append(j)
                if len(childs) == 1:
                    parent_j = childs[0]
                    if cmds.listRelatives(l, p=1)[0] != parent_j.replace("_joint", "_outJoint"):
                        cmds.parent(l, parent_j.replace("_joint", "_outJoint"))
                elif len(childs) > 1:
                    cmds.warning("twist root joint have multiple child joints")
                    return		

            #con = pm.orientConstraint(name + '_root_connector', name + '_start_connectorLoc', mo=0)
            #pm.delete(con)

        # attach main twist
        if sel:
            attach(name, sel[0])
        else:
            attach(name)

        # attach opposite twist
        if name.split('_')[0] == 'l':
            oppName = utils.getOppositeObject(name)
            if cmds.objExists(oppName + '_mod'):
                attach(oppName,  utils.getOppositeObject(sel[0]))		

        self.updateFrame()

        if len(sel) > 0:
            cmds.select(sel)


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
            template_name = twName
        else:
            template_name = utils.getTemplatedNameFromReal(module_name, twName)
        twData['name'] = template_name

        if not cmds.objExists(twName+'_system'):
            return

        systemObjects = cmds.listRelatives(twName+'_system') or []

        if len(systemObjects) > 0:
            twData['advanced'] = True
            foll_list = []
            for o in cmds.listRelatives(twName+'_system'):
                if '_foll_' in o:
                    foll_list.append(o)

            follCount = len(foll_list)
            jointsCount = follCount - 2
            twData['jointsCount'] = jointsCount
        else:
            twData['advanced'] = False
            joints = cmds.listRelatives(twName+'_twist_0_joint', type="joint", allDescendents=1)
            twData['jointsCount'] = len(joints) - 1

        twData['startLocPos'] = cmds.xform(twName+'_start_connectorLoc', q=1, m=1, ws=1)
        twData['endLocPos'] = cmds.xform(twName+'_end_connectorLoc', q=1, m=1, ws=1)
        twData['startOffset'] = cmds.xform(twName+'_root_connectorLoc', q=1, m=1, ws=1)

        par = cmds.listRelatives(twName + "_start_connectorLoc_mirrorGroup", p=1)[0]	

        if par == twName + "_root_connector":
            twData['start_j'] = template_name + "_joint"
        else:
            p = cmds.listRelatives(twName + '_start_connectorLoc_mirrorGroup', p=1)[0]
            if module_name == "":
                twData['start_j'] = p
            else:
                twData['start_j'] = utils.getTemplatedNameFromReal(module_name, p)

        p = cmds.listRelatives(twName + '_end_connectorLoc', p=1)[0]
        if cmds.objectType(p) != "joint":
            joints = cmds.listRelatives('skeleton', type='joint', allDescendents=1) or []
            closest_distance = 10000000
            closest = ""
            for j in joints:
                if 'twist' not in j:
                    pos1 = cmds.xform(p, query=True, translation=True, worldSpace=True)
                    pos2 = cmds.xform(j, query=True, translation=True, worldSpace=True)
                    distance = math.sqrt( math.pow((pos1[0]-pos2[0]),2) + math.pow((pos1[1]-pos2[1]),2) + math.pow((pos1[2]-pos2[2]),2))				

                    if distance < closest_distance:
                        closest_distance = distance
                        closest = j
            p = closest
        if module_name == "":
            twData['end_j'] = p
        else:		
            twData['end_j'] = utils.getTemplatedNameFromReal(module_name, p)

        def getAlignedConstraint():
            childs = cmds.listRelatives(twName + "_root_connectorLoc") or []
            cons = []
            for ch in childs:
                if cmds.objectType(ch) == "aimConstraint":
                    cons.append(ch)
            if len(cons) == 1:
                con = cons[0]
                return con
            return False	

        if getAlignedConstraint():
            twData['aligned'] = True
        else:
            twData['aligned'] = False

        #print twData['name'], '--------------- GET Data'
        #print twData['startOffset']
        #print twData['endLocPos']

        return twData

    def mirrorPosition(self, source_floatList, target):
        # set float lists
        #print "AA", source_floatList, target

        vector_floatList = [-1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0, 1.0]

        # Make matrixes
        source_matrix = om.MMatrix()
        om.MScriptUtil.createMatrixFromList(source_floatList,source_matrix)

        vector_matrix = om.MMatrix()
        om.MScriptUtil.createMatrixFromList(vector_floatList,vector_matrix )

        # Solve
        final_matrix = source_matrix * vector_matrix
        final_transformMatrix = om.MTransformationMatrix(final_matrix)

        # Apply translate
        t = final_transformMatrix.translation(om.MSpace.kWorld)

        cmds.move( t.x, t.y, t.z, target, absolute=True, worldSpace=True )

        eulerRot1 = final_transformMatrix.eulerRotation()
        angles = [math.degrees(angle) for angle in (eulerRot1.x, eulerRot1.y, eulerRot1.z)]

        cmds.rotate( angles[0], angles[1], angles[2], target, absolute=True, worldSpace=True )

    def selectScaleObjects(self):
        objects = []

        objects.append(self.curTwistName+'_joint_end_connectorLoc')
        objects.append(self.curTwistName+'_joint_root_connectorLoc')
        objects.append(self.curTwistName+'_joint_start_connectorLoc')

        if cmds.objExists(utils.getOppositeObject(self.curTwistName+'_joint_end_connectorLoc')):
            objects.append(utils.getOppositeObject(self.curTwistName+'_joint_end_connectorLoc'))
        if cmds.objExists(utils.getOppositeObject(self.curTwistName+'_joint_root_connectorLoc')):
            objects.append(utils.getOppositeObject(self.curTwistName+'_joint_root_connectorLoc'))
        if cmds.objExists(utils.getOppositeObject(self.curTwistName+'_joint_start_connectorLoc')):
            objects.append(utils.getOppositeObject(self.curTwistName+'_joint_start_connectorLoc'))

        cmds.select(objects)

    def getAlignedConstraint(self):
        name = self.curTwist["name"]
        childs = cmds.listRelatives(name + "_root_connectorLoc") or []
        cons = []
        for ch in childs:
            if cmds.objectType(ch) == "aimConstraint":
                cons.append(ch)

        if len(cons) == 1:
            con = cons[0]
            return con

        return False

    def alignToChild(self, name=None, force=False, manual=False):
        if not name:
            name = self.curTwist["name"]

        if self.win.alignToChild_checkBox.isChecked() or force:
            child = cmds.listRelatives(name + "_end_connectorLoc", p=1)[0]
            cmds.aimConstraint(child, name + "_root_connectorLoc", worldUpType="none", offset=(0,0,0))
        else:
            con = self.getAlignedConstraint()
            if con:
                cmds.delete(con)
                cmds.setAttr(name + "_root_connectorLoc.r", 0,0,0)

        if manual:
            if name.split("_")[0] == "l":
                opp_name = "r" + name[1:]
                opp_conn = name + "_end_connectorLoc"
                if cmds.objExists(opp_conn):
                    if self.win.alignToChild_checkBox.isChecked():
                        child = cmds.listRelatives(opp_name + "_end_connectorLoc", p=1)[0]
                        con = cmds.aimConstraint(child, opp_name + "_root_connectorLoc", worldUpType="none", offset=(0,0,0))[0]
                        cmds.setAttr(con+".aimVectorX", -1)
                        cmds.setAttr(con+".offsetY", 180)						
                    else:
                        con = utils.getOppositeObject(con)
                        if con:
                            cmds.delete(con)
                            cmds.setAttr(opp_name + "_root_connectorLoc.r", 0,180,0)				