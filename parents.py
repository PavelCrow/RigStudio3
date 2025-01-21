import maya.cmds as cmds
import pymel.core as pm
from functools import partial
import os

from .import main, utils

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

rootPath = os.path.normpath(os.path.dirname(__file__))

class Parents(object):
    def __init__(self, win, rig):

        self.win = win
        self.updateNiceNames = True		

        self.obj = ""
        self.control = ""
        self.attrName = ""
        self.attrVis = ""
        self.attrType = ""
        self.constrType = ""
        self.moduleName = ""
        self.niceNames = []
        self.intNames = []		
        self.targetModules = []
        self.targets = []
        self.rig = rig

        self.connect()

    def connect(self):
        self.win.parents_add_btn.clicked.connect(self.addParentObject)
        self.win.parents_objects_listWidget.currentItemChanged.connect(self.page_update)
        self.win.parents_objects_listWidget.itemDoubleClicked.connect(self.ossList_doubleClick)
        self.win.parents_addTarget_btn.clicked.connect(self.osTable_addTarget)
        self.win.parents_removeTarget_btn.clicked.connect(self.osTable_removeTarget)
        self.win.parents_update_btn.clicked.connect(self.os_makeConstraint)
        self.win.parents_remove_btn.clicked.connect(self.removeParentObject)
        self.win.parents_targetUp_btn.clicked.connect(partial(self.osTable_moveTarget, 'up'))
        self.win.parents_targetDown_btn.clicked.connect(partial(self.osTable_moveTarget, 'down'))	
        self.win.parents_controlSet_btn.clicked.connect(self.set_control)	

        self.win.parents_switcher_btn.clicked.connect(self.setAttrType)		
        self.win.parents_blend_btn.clicked.connect(self.setAttrType)		
        self.win.parents_attributes_btn.clicked.connect(self.setAttrType)	

        self.win.parents_visible_checkBox.stateChanged.connect(self.setVis)		
        self.win.parents_attrName_lineEdit.editingFinished.connect(self.setAttrName)	

        self.win.parents_translate_checkBox.stateChanged.connect(self.setConstraintType)		
        self.win.parents_rotate_checkBox.stateChanged.connect(self.setConstraintType)		

        self.win.parents_tableWidget.itemChanged.connect(self.setNiceName)	

        #self.win.test_btn.clicked.connect(self.removeParentObject)

    def resetUI(self):
        # clear table widget
        self.win.parents_tableWidget.setRowCount(0)
        self.win.parents_control_lineEdit.setText("")

        #self.win.parents_tableWidget.setEnabled(False)
        self.win.parents_mainButtons_frame.setEnabled(False)

        self.win.parents_attrName_lineEdit.setText("parent")		
        self.win.parents_translate_checkBox.setChecked(True)		
        self.win.parents_rotate_checkBox.setChecked(True)		
        self.win.parents_visible_checkBox.setChecked(True)		
        self.win.parents_blend_btn.setChecked(False)		
        self.win.parents_attributes_btn.setChecked(False)		
        self.win.parents_switcher_btn.setChecked(True)		

        self.win.parents_tableWidget.horizontalHeader().setVisible(True)	

    def updateDataFromUI(self):
        # get main attrs from ui
        self.control = self.win.parents_control_lineEdit.text()
        self.obj = self.win.parents_objects_listWidget.currentItem().text() + "_parentsGroup"

        self.moduleName = utils.getModuleName(self.obj)
        self.curModule = self.rig.modules[self.moduleName]

        if self.win.parents_translate_checkBox.isChecked() and self.win.parents_rotate_checkBox.isChecked() :
            self.constrType = 'parentConstraint'
        elif self.win.parents_translate_checkBox.isChecked() and not self.win.parents_rotate_checkBox.isChecked():
            self.constrType = 'pointConstraint'
        elif not self.win.parents_translate_checkBox.isChecked() and self.win.parents_rotate_checkBox.isChecked():
            self.constrType = 'orientConstraint'	

        self.attrVis = self.win.parents_visible_checkBox.isChecked()
        self.attrName = self.win.parents_attrName_lineEdit.text()

        if self.win.parents_switcher_btn.isChecked(): self.attrType = 'switcher'
        elif self.win.parents_attributes_btn.isChecked(): self.attrType = 'attributes'
        else: self.attrType = 'blend'		

        self.niceNames = []
        self.intNames = []
        self.targets = []
        self.targetModules = []
        count = self.win.parents_tableWidget.rowCount()
        for i in range (0, count):
            c = self.win.parents_tableWidget.item(i, 0).text()
            n = self.win.parents_tableWidget.item(i, 1).text()
            iN = self.win.parents_tableWidget.item(i, 2).text()
            m = self.win.parents_tableWidget.item(i, 3).text()
            self.targets.append(c)
            self.niceNames.append(n)
            self.intNames.append(iN)
            self.targetModules.append(m)		

    @staticmethod
    def getDataFromNode(obj):
        # define variables
        control = ""
        attrName = "parent"
        attrVis = True
        attrType = "switcher"
        constrType = "parentConstraint"
        moduleName = ""
        niceNames = []
        intNames = []		
        targetModules = []		
        targets = []		

        # get dynamic data
        moduleName = utils.getModuleName(obj)


        if cmds.objExists(obj):
            # if connections is exists
            contrType, constrObj = utils.getConstraint(obj)

            if constrObj:
                # get data from node
                attrName = cmds.getAttr(obj+".attrName")
                attrVis = cmds.getAttr(obj+".attrVis")
                attrType = cmds.getAttr(obj+".attrType")
                constrType = cmds.getAttr(obj+".constrType")		
                niceNames = utils.attrToPy(obj+".niceNames")
                intNames = utils.attrToPy(obj+".intNames")

                # get targetModules list
                constr_pm = pm.PyNode(constrObj)
                targets_pm = constr_pm.getTargetList()

                # get control
                try:
                    if attrType == 'switcher':
                        control_pm = constr_pm.getWeightAliasList()[0].inputs()[0].inputs()[0]
                    else:
                        control_pm = constr_pm.getWeightAliasList()[0].inputs()[0]

                    if control_pm.type() == "reverse":
                        control_pm = control_pm.inputX.inputs()[0]
                except: 
                    cmds.warning("Cannot find nodels connected to " + constr_pm)
                    return

                # get list of target modules
                targetModules = []
                targets = []
                #print constrObj, niceNames, targets_pm
                for i, niceName in enumerate(niceNames):
                    for t in targets_pm:
                        #print 111, t.name(), t.split('__')[1]
                        if t.split('__')[1] == niceName:
                            targetModule = utils.getModuleNameFromHierarhy(t.name())
                            p = t.getParent()
                            ctrl_target = p.getParent().name()
                            targets.append(utils.getInternalNameFromControl(ctrl_target))
                            targetModules.append(targetModule)
                            continue
                control = control_pm.name()
            else:
                control = obj.split("_parentsGroup")[0]	
                #print "!!", control
        #print  "AAAA",	targets, 	targetModules
        data = {}
        data['spaceObj'] = utils.getTemplatedNameFromReal(moduleName, obj)
        data['control'] = utils.getInternalNameFromControl(control)
        data['attrName'] = attrName
        data['attrVis'] = attrVis
        data['niceNames'] = niceNames
        data['intNames'] = intNames
        data['attrType'] = attrType
        data['constrType'] = constrType
        data['moduleName'] = moduleName
        data['targetModules'] = targetModules
        data['targets'] = targets	

        return data	

    def updateList(self):
        # fill os list
        self.win.parents_objects_listWidget.clear()

        self.win.parents_mainButtons_frame.setEnabled(False)

        if not cmds.objExists("modules"):
            return

        parentedControls = []
        #for m_name in modules:
        for m_name in self.rig.modules:
            m = self.rig.modules[m_name]
            parented = m.getControlsParents()
            for c in parented:
                parentedControls.append(c)

        for c in sorted(parentedControls):
            item = QtWidgets.QListWidgetItem(c)
            self.win.parents_objects_listWidget.addItem(item)

            if c.split('_')[0] == 'r':
                item.setForeground(QtGui.QBrush(QtGui.QColor("#6C6B6B")))

    def page_update(self):
        # clear table widget
        self.resetUI()

        # disable table if not os selected
        os_curItem = self.win.parents_objects_listWidget.currentItem()
        if type(os_curItem) != QtWidgets.QListWidgetItem:
            return

        #self.control = os_curItem.text()
        self.obj = os_curItem.text()+"_parentsGroup"

        # get os data from node
        data = self.getDataFromNode(self.obj)
        if not data:
            return
        #self.obj = data['spaceObj']
        self.moduleName = data['moduleName']
        self.control = utils.getControlNameFromInternal(self.moduleName, data['control'])
        if self.control == "": self.control = os_curItem.text()
        self.attrName = data['attrName']
        self.attrVis = data['attrVis']
        self.niceNames = data['niceNames']
        self.intNames = data['intNames']
        self.attrType = data['attrType']
        self.constrType = data['constrType']
        self.targetModules = data['targetModules']

        targets = []
        for t in data['targets']:
            targets.append(utils.getRealNameFromTemplated(self.moduleName, t))			
        self.targets = targets

        #print '------------------'
        #print "self.attrName", self.attrName
        #print "self.control", self.control
        #print "self.attrVis", self.attrVis
        #print "self.niceNames", self.niceNames
        #print "self.intNames", self.intNames
        #print "self.attrType", self.attrType
        #print "self.constrType", self.constrType
        #print "self.moduleName", self.moduleName
        #print "self.targetModules", self.targetModules
        #print "self.targets", self.targets
        #print '------------------'

        # enable ui frames
        self.win.parents_targets_frame.setEnabled(True)
        self.win.parents_control_lineEdit.setText(self.control)

        # update targets ui frames
        #if len(self.targets) == 0:
            #return
        if self.control.split("_")[0] == 'r':
            self.win.parents_attributes_frame.setEnabled(False)
            self.win.parents_mainButtons_frame.setEnabled(False)
        else:
            self.win.parents_attributes_frame.setEnabled(True)
            self.win.parents_mainButtons_frame.setEnabled(True)

        self.updateNiceNames = False


        # fill table widget
        for i in range (len(self.intNames)):
            # add control name
            ctrlName = utils.getControlNameFromInternal(self.targetModules[i], self.intNames[i])
            #print self.targetModules[i], self.intNames[i], ctrlName
            item = QtWidgets.QTableWidgetItem(ctrlName)
            # set item not editable
            item.setFlags(QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled)			
            #print "!", self.targetModules[i]#, self.intNames[i], ctrlName
            # add item to table
            count = self.win.parents_tableWidget.rowCount()
            self.win.parents_tableWidget.insertRow(count)
            self.win.parents_tableWidget.setItem(count, 0, item)

            # add nice name
            item = QtWidgets.QTableWidgetItem(self.niceNames[i])
            self.win.parents_tableWidget.setItem(count, 1, item)

            # add internal name
            item = QtWidgets.QTableWidgetItem(self.intNames[i])
            item.setFlags(QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled)
            self.win.parents_tableWidget.setItem(count, 2, item)

            # add target module name
            item = QtWidgets.QTableWidgetItem(self.targetModules[i])
            item.setFlags(QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled)
            self.win.parents_tableWidget.setItem(count, 3, item)

        # fill other widgets
        self.win.parents_attrName_lineEdit.setText(self.attrName)
        self.win.parents_visible_checkBox.setChecked(self.attrVis)

        if self.attrType == 'switcher':
            self.win.parents_switcher_btn.setChecked(True)
        elif self.attrType == 'blend':
            self.win.parents_blend_btn.setChecked(True)	
        else:
            self.win.parents_attributes_btn.setChecked(True)


        if self.constrType == 'pointConstraint' or self.constrType == 'parentConstraint':
            self.win.parents_translate_checkBox.setChecked(True)
        else:
            self.win.parents_translate_checkBox.setChecked(False)
        if self.constrType == 'orientConstraint' or self.constrType == 'parentConstraint':
            self.win.parents_rotate_checkBox.setChecked(True)
        else:
            self.win.parents_rotate_checkBox.setChecked(False)


        self.updateNiceNames = True

    def addParentObject(self):
        sel = cmds.ls(sl=1)
        if len(sel) != 1:
            cmds.warning("Select control")
            return

        obj = sel[0]
        if not utils.objectIsControl(obj) and not utils.objectIsAdditionalControl(obj):
            cmds.warning("Selected object is not control")
            return

        if cmds.objExists(obj+"_parentsGroup"):
            cmds.warning("control is already in list")
            return

        mod_name = utils.getModuleName(obj)
        m = utils.getModuleInstance(mod_name)
        if m.opposite:
            cmds.warning("Select left side control")
            return

        def addGroup(obj):
            mod_name = utils.getModuleName(obj)
            par = cmds.listRelatives(obj, p=1)[0]
            gr = cmds.group(empty=1, n=obj+"_parentsGroup")
            cmds.parent(gr, par)
            utils.resetAttrs(gr)
            cmds.parent(obj, gr)
            utils.addModuleNameAttr(gr, mod_name)

            # create variables
            utils.setUserAttr(gr, "attrName", "parent")
            utils.setUserAttr(gr, "attrType", "switcher")
            utils.setUserAttr(gr, "constrType", "parentConstraint")
            utils.setUserAttr(gr, "attrVis", True, 'bool')
            utils.setUserAttr(gr, "niceNames", [], 'data')
            utils.setUserAttr(gr, "intNames", [], 'data')				


        if not cmds.objExists(obj+"_parentsGroup"):
            addGroup(obj)

        # add item
        self.win.parents_objects_listWidget.addItem(obj)
        # select current module item
        try:
            item = self.win.modules_treeWidget.findItems(mod_name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
            self.win.modules_treeWidget.setCurrentItem(item, 0)
        except: pass
        # select current parent object item
        try:
            item = self.win.parents_objects_listWidget.findItems(obj, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
            self.win.parents_objects_listWidget.setCurrentItem(item)
        except: pass

        self.control = obj
        #self.win.parents_control_lineEdit.setText(self.control)

        # add mirrored group
        if utils.isSymmetrical(mod_name+"_mod"):
            addGroup(utils.getOpposite(obj))

        self.updateList()
        #self.page_update()

        # select current parent object item
        item = self.win.parents_objects_listWidget.findItems(self.control, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.parents_objects_listWidget.setCurrentItem(item)			

        #self.win.parents_mainButtons_frame.setEnabled(True)

        cmds.select(obj)

    def removeParentObject(self, curParentObj=""):
        if not curParentObj:
            curParentObj_item = self.win.parents_objects_listWidget.currentItem()
            if type(curParentObj_item) != QtWidgets.QListWidgetItem:
                return

            sel = cmds.ls(sl=1)

            curParentObj = curParentObj_item.text()

        par_gr = curParentObj + "_parentsGroup"
        if not cmds.objExists(par_gr):
            cmds.warning("Cannot find", par_gr)
            return

        self.os_deleteConstraint()

        # delete group
        par = cmds.listRelatives(par_gr, p=1)[0]
        cmds.parent(curParentObj, par)
        cmds.delete(par_gr)

        # delete mirrored group
        if utils.isSymmetrical(curParentObj):
            opp_obj = utils.getOpposite(curParentObj)
            par_gr = opp_obj + "_parentsGroup"
            if cmds.objExists(par_gr):
                par = cmds.listRelatives(par_gr, p=1)[0]
                cmds.parent(opp_obj, par)
                cmds.delete(par_gr)

        try: cmds.select(sel)
        except: pass

        self.updateList()

    def osTable_addTarget(self):
        # get selections
        sels = cmds.ls(sl=True, transforms=True)
        if len(sels) == 0:
            cmds.warning("Select target")
            return

        # add selected controls in table
        for ctrl in sels:
            mod_name = utils.getModuleName(ctrl)
            m = utils.getModuleInstance(mod_name)
            if m.opposite:
                cmds.warning("Select left side control")
                return		
        
        for ctrl in sels:
            if ctrl not in self.targets:
                # create item
                item = QtWidgets.QTableWidgetItem(ctrl)
                # set item not editable
                item.setFlags(QtCore.Qt.ItemIsSelectable |  QtCore.Qt.ItemIsEnabled)			

                # add item to table
                count = self.win.parents_tableWidget.rowCount()
                self.win.parents_tableWidget.insertRow(count)
                self.win.parents_tableWidget.setItem(count, 0, item)

                # add nice name
                name = ctrl
                item = QtWidgets.QTableWidgetItem(name)
                self.win.parents_tableWidget.setItem(count, 1, item)

                # add internal name
                if cmds.objExists(ctrl+".internalName"):
                    intName = cmds.getAttr(ctrl+".internalName")
                else: 
                    intName = ctrl
                item = QtWidgets.QTableWidgetItem(intName)
                self.win.parents_tableWidget.setItem(count, 2, item)

                # add module name
                t_mod_name = utils.getModuleNameFromHierarhy(ctrl)
                item = QtWidgets.QTableWidgetItem(t_mod_name)
                self.win.parents_tableWidget.setItem(count, 3, item)

                #canUpdated = self.win.parents_tableWidget.rowCount() > 0
                #self.win.parents_mainButtons_frame.setEnabled(canUpdated)
                #self.win.parents_attributes_frame.setEnabled(canUpdated)

            else:
                cmds.warning("This object is already in list")

        # update targets data
        self.updateDataFromUI()

        # update ui
        #self.win.parents_attributes_frame.setEnabled(True)

    def osTable_removeTarget(self):
        row = self.win.parents_tableWidget.currentRow()
        self.win.parents_tableWidget.removeRow(row)

        # update targets data
        self.updateDataFromUI()

        # update ui
        #self.win.parents_mainButtons_frame.setEnabled(self.win.parents_tableWidget.rowCount() > 0)
        #self.win.parents_attributes_frame.setEnabled(self.win.parents_tableWidget.rowCount() > 0)

    def osTable_moveTarget(self, direction):
        # swap rows
        currRow = self.win.parents_tableWidget.currentRow()
        count = self.win.parents_tableWidget.rowCount()

        # stop on edges of list
        if direction == "up" and currRow == 0:
            return
        if direction == "down" and currRow == count-1:
            return

        if direction == "up":
            targetRow = currRow - 1
        elif direction == "down":
            targetRow = currRow + 1

        objTop = self.win.parents_tableWidget.item(currRow, 0).text()
        nameTop = self.win.parents_tableWidget.item(currRow, 1).text()
        inTop = self.win.parents_tableWidget.item(currRow, 2).text()
        mTop = self.win.parents_tableWidget.item(currRow, 3).text()

        objTop_t = self.win.parents_tableWidget.item(targetRow, 0).text()
        nameTop_t = self.win.parents_tableWidget.item(targetRow, 1).text()		
        inTop_t = self.win.parents_tableWidget.item(targetRow, 2).text()
        mTop_t = self.win.parents_tableWidget.item(targetRow, 3).text()		

        self.win.parents_tableWidget.item(currRow, 0).setText(objTop_t)
        self.win.parents_tableWidget.item(currRow, 1).setText(nameTop_t)
        self.win.parents_tableWidget.item(currRow, 2).setText(inTop_t)
        self.win.parents_tableWidget.item(currRow, 3).setText(mTop_t)

        self.win.parents_tableWidget.item(targetRow, 0).setText(objTop)
        self.win.parents_tableWidget.item(targetRow, 1).setText(nameTop)
        self.win.parents_tableWidget.item(targetRow, 2).setText(inTop)
        self.win.parents_tableWidget.item(targetRow, 3).setText(mTop)

        # change selection
        self.win.parents_tableWidget.selectRow(targetRow)

    def ossList_doubleClick(self):
        cmds.select(self.obj)

    def setAttrType(self):
        if self.win.parents_switcher_btn.isChecked():
            self.constrType = 'switcher'
        elif self.win.parents_blend_btn.isChecked():
            self.constrType = 'blender'
        else:
            self.constrType = 'attributes'

    def setVis(self, state):
        if self.win.parents_visible_checkBox.isChecked():
            self.attrVis = True
        else:
            self.attrVis = False

    def setAttrName(self):
        self.attrName = self.win.parents_attrName_lineEdit.text()

    def setConstraintType(self):
        if self.win.parents_translate_checkBox.isChecked() and self.win.parents_rotate_checkBox.isChecked() :
            self.constrType = 'parentConstraint'
        elif self.win.parents_translate_checkBox.isChecked():
            self.constrType = 'pointConstraint'
        elif self.win.parents_rotate_checkBox.isChecked():
            self.constrType = 'orientConstraint'

    def setNiceName(self):
        if self.updateNiceNames:
            try:
                niceNames = []
                count = self.win.parents_tableWidget.rowCount()
                for i in range (0, count):
                    n = self.win.parents_tableWidget.item(i, 1).text()
                    niceNames.append(n)
                self.niceNames = niceNames
            except: pass

    def set_control(self):
        # get selections
        sels = cmds.ls(sl=True, transforms=True)
        if len(sels) == 0:
            cmds.warning("Select control")
            return	

        #self.control = sel[0]
        self.control = sels[0]
        self.win.parents_control_lineEdit.setText(self.control)

    def os_makeConstraint(self, inputData={}):
        sel = cmds.ls(sl=1)
        # get input data from ui
        if not inputData or inputData == {}:
            if len(self.targets) == 0:
                cmds.warning('No targets')
                return			
            if self.attrType == 'blend' and len(self.intNames) != 2:
                cmds.warning('set two targets')
                return
            self.updateDataFromUI()
            data = {}
            data['moduleName'] = self.moduleName
            data['spaceObj'] = utils.getTemplatedNameFromReal(self.moduleName, self.obj)
            data['control'] = utils.getInternalNameFromControl(self.control)
            data['attrName'] = self.attrName
            data['attrVis'] = self.attrVis
            data['niceNames'] = self.niceNames
            data['intNames'] = self.intNames
            data['attrType'] = self.attrType
            data['constrType'] = self.constrType
            data['targetModules'] = self.targetModules	

            targets = []
            for t in self.targets:
                targets.append(utils.getTemplatedNameFromReal(self.moduleName, t))		
            data['targets'] = targets	

        else:
            data = inputData
            self.obj = utils.getRealNameFromTemplated(data['moduleName'], data['spaceObj'])
            #moduleName = data['moduleName']
            #data['spaceObj'] = utils.getRealNameFromTemplated(moduleName, data['spaceObj'])
            #data['control'] = utils.getControlNameFromInternal(moduleName, data['control'])
            #targetModules = []
            #for t in data['targetModules']:
                #targetModules.append(utils.getRealNameFromTemplated(moduleName, t))			
            #data['targetModules'] = targetModules

        moduleName = data['moduleName']
        sym_moduleName = utils.getOpposite(moduleName)

        # add parent group
        #if moduleName.split('_')[0] == 'l' and cmds.objExists(sym_moduleName+'_mod'):
            #if not cmds.objExists(utils.getOpposite(self.obj)):
                #self.removeParentObject()		

        c = self.obj.split("_parentsGroup")[0]
        if not cmds.objExists(c):
            return
        if not cmds.objExists(self.obj):
            cmds.select(c)
            self.addParentObject()
        if cmds.objExists( utils.getOpposite(data['moduleName']+"_mod") ) and not cmds.objExists( utils.getOpposite(self.obj) ):
            self.removeParentObject(c)
            cmds.select(c)
            self.addParentObject()

        self.os_deleteConstraint(False)
        #print '-------------------'
        #for d in data:
            #print d , data[d]
        #print '-------------------'			

        # remove targets which is not exists
        existed_intNames = []
        existed_niceNames = []
        existed_targetModules = []
        for i, m_name in enumerate(data['targetModules']):
            target = utils.getControlNameFromInternal(m_name, data['intNames'][i])
            #print (333, m_name, data['intNames'])
            if cmds.objExists(target):
                existed_targetModules.append(m_name)
                existed_intNames.append(data['intNames'][i])
                existed_niceNames.append(data['niceNames'][i])
            else:
                cmds.warning("OS target is not exists - " + data['intNames'][i])
        #print existed_targetModules, data['targetModules']
        #print existed_intNames, data['intNames']
        if len(existed_targetModules) == 0:
            return

        if data["attrType"] == 'blend' and len(existed_targetModules) != 2:
            return

        data['targetModules'] = existed_targetModules
        data['intNames'] = existed_intNames
        data['niceNames'] = existed_niceNames

        self.create(data)

        # make os constraint for symmery module
        if moduleName.split('_')[0] == 'l' and cmds.objExists(sym_moduleName+'_mod'):
            sym_niceNames = []
            sym_targetModules = []
            for n in data['niceNames']:
                n = utils.getOpposite(n)
                sym_niceNames.append(n)
            for n in data['targetModules']:
                n = utils.getOpposite(n)
                sym_targetModules.append(n)

            sym_data = {}
            sym_data['spaceObj'] = utils.getOpposite(data['spaceObj']) 
            sym_data['control'] = utils.getOpposite(data['control']) 
            sym_data['attrName'] = data['attrName']
            sym_data['attrVis'] = data['attrVis']
            sym_data['niceNames'] = sym_niceNames
            sym_data['intNames'] = data['intNames']
            sym_data['attrType'] = data['attrType']
            sym_data['constrType'] = data['constrType']
            sym_data['moduleName'] = utils.getOpposite(data['moduleName']) 
            sym_data['targetModules'] = sym_targetModules
            #data['targets'] = 

            #print '------------------- SYM -----------------------'
            #for d in sym_data:
                #print d , sym_data[d]
            #print '-----------------------------------------------'	
            self.create(sym_data)

        self.page_update()

        try:
            cmds.select(sel)
        except: pass

        # select current parent object item
        item = self.win.parents_objects_listWidget.findItems(self.obj.split("_parentsGroup")[0], QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive)[0]
        self.win.parents_objects_listWidget.setCurrentItem(item)		

    def os_deleteConstraint(self, clearTable=True, obj="", data={}):
        if obj == "": obj = self.obj

        if not cmds.objExists(obj):
            return

        if data == {}:
            data = self.getDataFromNode(obj)
        if not data:
            return
        moduleName = data['moduleName']
        obj = utils.getRealNameFromTemplated(moduleName, data['spaceObj'])
        control = utils.getControlNameFromInternal(moduleName, data['control'])
        attrName = data['attrName']
        attrVis = data['attrVis']
        niceNames = data['niceNames']
        intNames = data['intNames']
        attrType = data['attrType']

        #print "DELETE OS", moduleName, obj
        #print attrName 
        #print attrVis
        #print niceNames
        #print intNames 
        #print attrType 
        #print 'control' , moduleName, data['control']
        #for d in data:
            #print d, data[d]

        targetModules = []
        for t in data['targetModules']:
            targetModules.append(utils.getRealNameFromTemplated(moduleName, t))

        constType, constrNode = utils.getConstraint(obj)

        if constType == None:
            return
        # get targets
        targets = []
        allTargets = cmds.listConnections( constrNode, d=False, s=True, plugs=1 )
        for t in allTargets:
            if t.split('.')[-1] == 'parentMatrix':
                targets.append(t.split('.')[0]+"_group")

        # delete
        cmds.delete(constrNode)
        cmds.delete(targets)

        # delete attributes on control
        #try:	

        if attrType == 'attributes':
            for n in self.niceNames:
                cmds.deleteAttr(control, attribute=n)
        else:
            attrName = cmds.getAttr(obj+".attrName")
            cmds.deleteAttr(control, attribute=attrName)				
            #print 111111111111, control, attrName

        #except: pass

        # reset os object
        utils.resetAttrs(obj)

        utils.setUserAttr(obj, "attrName", "parent")
        utils.setUserAttr(obj, "attrType", "switcher")
        utils.setUserAttr(obj, "constrType", "parentConstraint")
        utils.setUserAttr(obj, "attrVis", True, 'bool')
        utils.setUserAttr(obj, "niceNames", [], 'data')
        utils.setUserAttr(obj, "intNames", [], 'data')

        # delete os on mirrored module
        if moduleName.split('_')[0] == 'l' and cmds.objExists( utils.getOpposite(moduleName)+'_mod'):
            self.os_deleteConstraint(False, utils.getOpposite(obj))		

        if clearTable:
            self.win.parents_tableWidget.setRowCount(0)	
            #self.updateDataFromUI()

        self.updateList()
        self.page_update()

    def create(self, data):
        def getAngle(t1, t2):
            o1 = pm.spaceLocator()
            pm.parent(o1, t1)
            o1.t.set(0,0,0)
            o2 = pm.spaceLocator()
            pm.parent(o2, t2)
            o2.t.set(0,0,0)

            l1 = pm.spaceLocator()
            pm.parent(l1, t1)
            l1.t.set(0,1,0)
            l2 = pm.spaceLocator()
            pm.parent(l2, t2)
            l2.t.set(0,1,0)

            plus1 = pm.createNode('plusMinusAverage')
            plus2 = pm.createNode('plusMinusAverage')
            plus1.operation.set(2)
            plus2.operation.set(2)

            l1.worldPosition[0] >> plus1.input3D[0]
            o1.worldPosition[0] >> plus1.input3D[1]
            l2.worldPosition[0] >> plus2.input3D[0]
            o2.worldPosition[0] >> plus2.input3D[1]

            a = pm.createNode('angleBetween')
            plus1.output3D >> a.vector1
            plus2.output3D >> a.vector2

            angle = a.angle.get()
            #out = pm.spaceLocator()
            #a.angle >> out.rx
            #print out.rx.get()
            pm.delete(o1,o2, l1, l2)

            return angle

        moduleName = data['moduleName']
        obj = utils.getRealNameFromTemplated(moduleName, data['spaceObj'])
        control = utils.getControlNameFromInternal(moduleName, data['control'])
        attrName = data['attrName']
        attrVis = data['attrVis']
        niceNames = data['niceNames']
        intNames = data['intNames']
        attrType = data['attrType']
        targetModules = data['targetModules']
        constrType = data['constrType']
        set = moduleName + "_nodesSet"

        if not cmds.objExists(control): 
            return

        for i, intName in enumerate(intNames):
            n = utils.getControlNameFromInternal(targetModules[i], intName)
            if not cmds.objExists(n):
                cmds.warning("Target is not exists, object space is not created.", targetModules[i], intName)
                return

        m = utils.getModuleInstance(moduleName)

        ctrl_name = obj.split("_parentsGroup")[0]
        init_name = utils.getInternalNameFromControl(ctrl_name)
        ctrlInitLoc = "%s_%s_initLoc" %(m.name, init_name)

        #print "AAA", moduleName, data['control'], control
        if not cmds.objExists(ctrlInitLoc):
            cmds.warning("Missed initLoc", ctrlInitLoc)

        # create target locators 
        targets = []
        controlInternalName = utils.getInternalNameFromControl(ctrl_name)
        for i, intName in enumerate(intNames):
            n = utils.getControlNameFromInternal(targetModules[i], intName)# or intName

            t_name = moduleName+'__'+niceNames[i]+'__'+controlInternalName
            grp_name = t_name+"_group"
            if cmds.objExists(grp_name):
                cmds.delete(grp_name)
            t = cmds.spaceLocator(n=t_name)[0]
            utils.addToModuleSet(t, moduleName)
            t_gr = cmds.group(n=grp_name, empty=1)
            utils.addToModuleSet(t_gr, moduleName)
            cmds.parent(t, t_gr)

            targets.append(t)
            cmds.parent(t_gr, n)
            utils.resetAttrs(t_gr)
            cmds.hide(t_gr)

            t_ctrlInitLoc = "%s_%s_initLoc" %(targetModules[i], intName)			
            t_ctrlInitLocExists = cmds.objExists(t_ctrlInitLoc)

            if not t_ctrlInitLocExists:
                cmds.warning("Missed Init Loc!", t_ctrlInitLoc)

            mMat = utils.connectToOffsetParentMatrix(t_gr, [ctrlInitLoc, t_ctrlInitLoc], ['worldMatrix[0]', 'worldInverseMatrix[0]'], set=set)

        # create constraint
        if constrType == 'parentConstraint':
            const = cmds.parentConstraint(targets, obj, mo=0)[0]
        elif constrType == 'pointConstraint':
            const = cmds.pointConstraint(targets, obj, mo=0)[0]
        elif constrType == 'orientConstraint':
            const = cmds.orientConstraint(targets, obj, mo=0)[0]			
        utils.addToModuleSet(const, moduleName)

        # check right angles after constraints and correct if needed
        if m.opposite:
            for i, intName in enumerate(intNames):
                n = utils.getControlNameFromInternal(targetModules[i], intName)
                t_name = moduleName+'__'+niceNames[i]+'__'+controlInternalName
                grp_name = t_name+"_group"				
                angle = getAngle(grp_name, ctrl_name)
                if angle > 5:
                    cmds.setAttr(t_name+'.rx', 0)

        # make connections
        if attrType == 'switcher':
            # add attr
            try:
                cmds.addAttr(control, longName=attrName, attributeType='enum', keyable=attrVis, enumName=':'.join(niceNames) )			
            except: 
                cmds.warning("Parent attribute already ecists")
            # set draven keys
            for k in range (len(intNames)):
                # first set attr on control
                cmds.setAttr("%s.%s" %(control, attrName), k)
                # then foreach constraint attr
                for i in range (len(intNames)):
                    # set 1 or 0
                    if i == k:
                        cmds.setAttr("%s.%sW%i" %(const, targets[i], i), 1)
                    else:
                        cmds.setAttr("%s.%sW%i" %(const, targets[i], i), 0)
                    # and set key
                    cmds.setDrivenKeyframe("%s.%sW%i" %(const, targets[i], i), currentDriver="%s.%s" %(control, attrName))

        elif attrType == 'attributes':
            for i, n in enumerate(niceNames):
                cmds.addAttr(control, longName=n, attributeType='float', keyable=attrVis, minValue=0, maxValue=1 )
                cmds.connectAttr(control+'.'+n, const+'.'+targets[i]+"W"+str(i))

        else:
            if cmds.objExists(control+"."+attrName):
                cmds.deleteAttr(control, attribute=attrName)	
            cmds.addAttr(control, longName=attrName, attributeType='float', keyable=attrVis, minValue=0, maxValue=1 )
            cmds.connectAttr(control+'.'+attrName, const+'.'+targets[0]+"W0")
            rev = cmds.createNode('reverse', n=const+"_reverse")
            utils.addToModuleSet(rev, moduleName)
            cmds.connectAttr(control+'.'+attrName, rev+'.inputX')
            cmds.connectAttr(rev+'.outputX', const+'.'+targets[1]+"W1")
            if constrType != 'pointConstraint':
                cmds.setAttr(const+".interpType", 2)


        # save data in attributes
        utils.setUserAttr(obj, "attrName", attrName)
        utils.setUserAttr(obj, "attrType", attrType)
        utils.setUserAttr(obj, "constrType", constrType)
        utils.setUserAttr(obj, "attrVis", attrVis, 'bool')
        utils.setUserAttr(obj, "niceNames", niceNames, 'data')
        utils.setUserAttr(obj, "intNames", intNames, 'data')		

