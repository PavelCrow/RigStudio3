import maya.cmds as cmds
import maya.OpenMayaUI as OpenMayaUI
import os, sys, importlib, json
from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

from functools import partial

from .import utils, parents, twist, inbetweens, rig, tools
from .ui.action import ActionClass as Action
from .ui.groupLabel import GroupLabel

def get_maya_window():
    ptr = OpenMayaUI.MQtUtil.mainWindow()
    if ptr is not None:
        return wrapInstance(int(ptr), QtWidgets.QWidget)


def load_ui_widget(uifilename, parent=get_maya_window()):
    loader = QtUiTools.QUiLoader()
    uifile = QtCore.QFile(uifilename)

    uifile.open(QtCore.QFile.ReadOnly)
    ui = loader.load(uifile, parent)
    uifile.close()

    return ui


class MainWindow:
    def __init__(self):
        self.rootPath = os.path.normpath(os.path.dirname(__file__))

        # load data from file
        with open(os.path.join(self.rootPath, "config.json"), mode='r') as f:
            self.configData = json.load(f)

        widgets_path = os.path.join(self.rootPath, "ui", "designer")

        self.uiFilePath = os.path.join(widgets_path, "mainWindow.ui")
        self.aboutUiFilePath = os.path.join(widgets_path, "aboutWindow.ui")
        self.setsUiFilePath = os.path.join(widgets_path, "setsWindow.ui")
        self.humanIkUiFilePath = os.path.join(widgets_path, "humanIkWindow.ui")
        self.moduleBuilderUiFilePath = os.path.join(widgets_path, "moduleBuilderWindow.ui")
        self.attributesUiFilePath = os.path.join(widgets_path, "attributesWindow.ui")
        self.driverUiFilePath = os.path.join(widgets_path, "driver.ui")

        # app = QtWidgets.QApplication.instance()
        self.win = load_ui_widget(self.uiFilePath)
        # app.exec_()

        self.help_widget = load_ui_widget(os.path.join(widgets_path, "help_widget.ui"))

        # modules options widgets
        self.moduleOption_widgets = {}
        moduleNames = utils.getModuleFiles()
        for m in moduleNames:
            path = os.path.join(self.rootPath, "modules", m, m+"_widget.ui")
            if os.path.isfile(path):
                w = load_ui_widget(path)
                self.moduleOption_widgets[m] = w

        # public variables
        self.rig = None
        self.curModule = None
        self.curControlItemName = None
        self.curAddControlName = None
        self.sets = None
        self.humanIk = None
        self.color_list = [
            (30, 30, 60),
            (0, 0, 0),
            (64, 64, 64),
            (128, 128, 128),
            (155, 0, 40),
            (0, 4, 96),
            (0, 0, 255),
            (0, 70, 25),
            (38, 0, 67),
            (200, 0, 200),
            (138, 72, 51),
            (63, 35, 31),
            (153, 38, 0),
            (255, 0, 0),
            (0, 255, 0),
            (0, 65, 153),
            (255, 255, 255),
            (255, 255, 0),
            (100, 220, 255),
            (67, 255, 163),
            (255, 176, 176),
            (228, 172, 121),
            (255, 255, 99),
            (0, 153, 84),
            (161, 105, 48),
            (159, 161, 48),
            (104, 161, 48),
            (48, 161, 93),
            (48, 161, 161),
            (48, 103, 161),
            (111, 48, 161),
            (161, 48, 105)]
        self.posersSizeData = {}
        self.jointsSizeData = {}
        self.jointsSizeGlobal = 0
        self.posersSizeGlobal = 0
        self.twistClass = twist.Twist(self.win)
        self.ibtwClass = inbetweens.Inbetweens(self.win)
        self.controlShapes_data = []
        self.helpEvent = None
        self.menuActions = {}
        self.rigBrushEvent = None
        self.currentMenuItem = None
        self.init_cursor_pos = []
        self.catch = False
        self.mWin = get_maya_window()
        self.moveMode = False
        self.full = True# full

        self.initUi()

        self.rig = rig.Rig()
        self.rig.main = self
        self.curParents = parents.Parents(self.win, self.rig)
        
        self.rigPage_update()
        
        self.connectSignals()
        
        #
        # self.curParents.rig = self.rig
        # self.curParents.updateList()
        # self.addControls_updateTree()
        #
        # # color buttons
        # for i, color in enumerate(self.color_list):
        #     try:
        #         exec("self.win.color_btn_%d.setStyleSheet('QPushButton {background-color: rgb%s;}')" % (i, color))
        #         exec('self.win.color_btn_%d.clicked.connect(partial(self.controls_setColor, %d))' % (i, i))
        #     except:
        #         pass

        # self.win.splitter.setSizes([200, 400])
        self.win.show()

    def initUi(self):
        def setMenu():
            menu = QtWidgets.QMenu(self.win)
            replace_menu = QtWidgets.QMenu(self.win)
            # get sections
            sections = utils.getModuleSections()

            # add module names in sections
            for sectionListName in sorted(sections):
                sub_menu = menu.addMenu('&%s' % sectionListName)
                replace_sub_menu = replace_menu.addMenu('&%s' % sectionListName)
                for m in sections[sectionListName]:
                    name = utils.formatName(m)
                    m_action = Action(self.win)
                    m_action.setText(name)
                    m_action.setToolTip(name.upper())
                    m_action.triggered.connect(partial(self.addModule, m))
                    #m_action.triggered.connect(partial(module.Module, m_type=m, main=self, create=True))
                    sub_menu.addAction(m_action)
                    self.menuActions[name] = m_action

                    replace_m_action = QtWidgets.QAction(self.win)
                    replace_m_action.setText(utils.formatName(m))
                    replace_m_action.triggered.connect(partial(self.replaceModule, m))
                    replace_sub_menu.addAction(replace_m_action)

            font = menu.font()
            font.setPixelSize(12)
            menu.setFont(font)

            self.win.addModule_btn.setMenu(menu)

            # templates menu
            self.compoundModules_menu = QtWidgets.QMenu(self.win)
            # self.compoundModuleMenuUpdate()
            self.win.addTemplate_btn.setMenu(self.compoundModules_menu)

            # replace menu
            self.win.replaceModule_but.setMenu(replace_menu)

        def setToolbar():
            
            self.win.actionPosers.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "posers.svg")))
            self.win.actionControls.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "controls.png")))
            self.win.actionJoints.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "joints.png")))
            self.win.actionGeometry.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "geometry.png")))
            self.win.actionJoints_Template.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "joints_template.png")))
            self.win.actionGeometry_Template.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "geometry_template.png")))
            self.win.actionGeometry_Reference.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "geometry_reference.png")))
            self.win.actionSkeleton_LRA.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "axises2.png")))
            self.win.actionPosers_Axises.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "axises.png")))
            self.win.actionHelp_Mode.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "helpBig_icon.png")))
            #self.win.actionMove_Tool.setIcon(QtGui.QIcon(os.path.join(self.rootPath, "ui", "icons", "moveTool.png")))
            #self.win.actionAdvanced.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/map.png'))
            #self.win.actionPosers_Hierarhy.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/posers_hier_on.png'))


            self.win.toolBar.setStyleSheet(  # "color: blue;"
                # "background-color: yellow;"
                # "selection-color: yellow;"
                # "selection-background-color: grey;")
                "selection-background-color: rgb(90, 90, 90);")
            self.win.modules_treeWidget.setStyleSheet("selection-background-color: grey;")

            spacer=QtWidgets.QWidget()
            self.win.toolBar.insertWidget(self.win.actionHelp_Mode, spacer)
            spacer.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Preferred)
            
        def setGroupLabels():
            # pose common Options label
            GroupLabel(self.win.commonOptions_label, self.win.commonOptions_groupFrame, self.win.verticalLayout_24)

            # pose group label
            g = GroupLabel(self.win.info_label, self.win.info_groupFrame, self.win.verticalLayout_14)
            g.off = False
            g.mousePressEvent(1)

            # Module Options group label
            g = GroupLabel(self.win.moduleOptions_label, self.win.moduleOptions_groupFrame, self.win.verticalLayout_18)
            ### g.off = False
            ### g.mousePressEvent(1)

            # Input Connections group label
            GroupLabel(self.win.inputConnections_label, self.win.inputConnections_groupFrame,
                       self.win.verticalLayout_12)

            # Tools group label
            GroupLabel(self.win.skinTools_label, self.win.skinTools_groupFrame, self.win.verticalLayout_66)
            g = GroupLabel(self.win.parentSwitcher_label, self.win.parentSwitcher_groupFrame,
                           self.win.verticalLayout_58)
            self.win.frame_28.setEnabled(False)
            g.off = False
            g.mousePressEvent(1)

            # Input Connections group label
            ### g = GroupLabel(self.win.moduleIcon_label_2, self.win.moduleIcon_groupFrame, self.win.verticalLayout_16)
            ### g.off = False
            ### g.mousePressEvent(1)

            ### g = GroupLabel(self.win.controls_label, self.win.controls_groupFrame, self.win.verticalLayout_22, self.win)
            ### g.off = False
            ### g.mousePressEvent(1)

            g = GroupLabel(self.win.twistConnections_label, self.win.twistConnections_groupFrame,
                           self.win.verticalLayout_10, self.win)
            g.off = False
            g.mousePressEvent(1)

            g = GroupLabel(self.win.ibInfo_label, self.win.ibInfo_groupFrame, self.win.verticalLayout_83, self.win)
            g.off = False
            g.mousePressEvent(1)

            g = GroupLabel(self.win.smf_label, self.win.smf_groupFrame, self.win.verticalLayout_97, self.win)
            g.off = False
            g.mousePressEvent(1)

            g = GroupLabel(self.win.channels_label, self.win.channels_groupFrame, self.win.verticalLayout_75, self.win)
            g.off = False
            g.mousePressEvent(1)

            g = GroupLabel(self.win.commands_label, self.win.commands_groupFrame, self.win.verticalLayout_84, self.win)
            g.off = False
            g.mousePressEvent(1)

        def setUI():
            # ?
            # self.win.center_tabWidget.setTabIcon(0, QtGui.QIcon(self.rootPath + '/ui/icons/dummy_32.png'))

            # modules tab
            self.win.splitter.setStretchFactor(0, 0)
            self.win.splitter.setStretchFactor(1, 1)
            self.win.temp_btn.setVisible(False)

            # modules tree widget hide icons column
            # self.win.modules_treeWidget.setColumnWidth(0, 200)
            # self.win.modules_treeWidget.setColumnWidth(1, 30)
            # modules tree widget stretch first column
            header = self.win.modules_treeWidget.header()
            try:
                header.setStretchLastSection(False)
                header.setSectionResizeMode(0, QtWidgets.QHeaderView.Stretch)
            except:
                pass

            # remove tabs
            for page_name in ["map",
                              "connections",
                              # "tools",
                              "face",
                              # "driven_tab",
                              # "modules_tab",
                              "attributes"
                              ]:
                page = self.win.tabWidget.findChild(QtWidgets.QWidget, page_name)
                i = self.win.tabWidget.indexOf(page)
                self.win.tabWidget.removeTab(i)
            page = self.win.center_tabWidget.findChild(QtWidgets.QWidget, "info")

            # remove move tool
            # self.win.actionMove_Tool.setVisible(False)
            i = self.win.center_tabWidget.indexOf(page)
            # self.win.center_tabWidget.removeTab(i)
            self.win.center_tabWidget.setCurrentIndex(0)

            # set toolbal states
            self.win.actionDebug.setChecked(self.configData['debug'])
            self.win.actionAdvanced.setChecked(self.configData['advanced'])
            self.win.actionPosers_Hierarhy.setChecked(self.configData['posersHierarhy'])

            # set controls widget on modules tab
            self.win.controls_tableWidget.setColumnWidth(0, 60)
            self.win.controls_tableWidget.horizontalHeader().setVisible(True)
            self.win.controls_tableWidget.verticalHeader().setVisible(False)
            # self.win.controls_tableWidget.setColumnHidden(3, 1)
            # self.win.controls_tableWidget.setColumnHidden(4, 1)
            self.win.controls_tableWidget.setColumnWidth(2, 40)
            self.win.controls_tableWidget.horizontalHeader().setSectionResizeMode(1, QtWidgets.QHeaderView.Stretch)

            # Additional Controls tab
            self.win.createCtrlCircle_btn.setIcon(QtGui.QIcon(self.rootPath + '/icons/control_circle_icon.png'))
            self.win.createCtrlCircle_btn.setIconSize(QtCore.QSize(50, 50))
            self.win.createCtrlSquare_btn.setIcon(QtGui.QIcon(self.rootPath + '/icons/control_square_icon.png'))
            self.win.createCtrlSquare_btn.setIconSize(QtCore.QSize(50, 50))
            self.win.createCtrlBox_btn.setIcon(QtGui.QIcon(self.rootPath + '/icons/control_box_icon.png'))
            self.win.createCtrlBox_btn.setIconSize(QtCore.QSize(50, 50))
            self.win.createCtrlSphere_btn.setIcon(QtGui.QIcon(self.rootPath + '/icons/control_sphere_icon.png'))
            self.win.createCtrlSphere_btn.setIconSize(QtCore.QSize(50, 50))
            self.win.deleteAddControl_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/delete.png'))
            self.win.deleteAddControl_btn.setIconSize(QtCore.QSize(20, 20))
            self.win.copyAsChild_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/copyChild.png'))
            self.win.copyAsChild_btn.setIconSize(QtCore.QSize(20, 20))
            self.win.copySide_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/copySide.png'))
            self.win.copySide_btn.setIconSize(QtCore.QSize(20, 20))

            # first tab
            self.win.loadRig_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/char.png'))
            self.win.loadRig_btn.setIconSize(QtCore.QSize(32, 32))

            # modules tab
            self.win.addModule_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/add_module2.png'))
            self.win.addModule_btn.setIconSize(QtCore.QSize(20, 20))
            self.win.addTemplate_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/add_template.png'))
            self.win.addTemplate_btn.setIconSize(QtCore.QSize(20, 20))
            self.win.duplicateModule_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/duplicate_icon.png'))
            self.win.duplicateModule_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.delete_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/delete.png'))
            self.win.delete_btn.setIconSize(QtCore.QSize(20, 20))

            self.win.moduleTemplate_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/save.png'))
            self.win.moduleTemplate_but.setIconSize(QtCore.QSize(20, 20))
            self.win.replaceModule_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/reload.png'))
            self.win.replaceModule_but.setIconSize(QtCore.QSize(20, 20))
            self.win.selectPoser_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/select_poser.png'))
            self.win.selectPoser_but.setIconSize(QtCore.QSize(20, 20))
            self.win.module_axises_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/axises2.png'))
            self.win.module_axises_but.setIconSize(QtCore.QSize(20, 20))
            self.win.module_vis_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/eye.png'))
            self.win.module_vis_but.setIconSize(QtCore.QSize(20, 20))
            self.win.module_solo_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/solo.png'))
            self.win.module_solo_but.setIconSize(QtCore.QSize(20, 20))
            self.win.module_poser_axises_but.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/axises.png'))
            self.win.module_poser_axises_but.setIconSize(QtCore.QSize(20, 20))

            # object spaces
            self.win.parents_add_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_plus.png'))
            self.win.parents_add_btn.setIconSize(QtCore.QSize(24, 20))
            self.win.parents_remove_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/delete.png'))
            self.win.parents_remove_btn.setIconSize(QtCore.QSize(24, 20))
            self.win.parents_addTarget_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_plus.png'))
            self.win.parents_addTarget_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.parents_removeTarget_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_minus.png'))
            self.win.parents_removeTarget_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.parents_targetUp_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_up.png'))
            self.win.parents_targetUp_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.parents_targetDown_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_down.png'))
            self.win.parents_targetDown_btn.setIconSize(QtCore.QSize(30, 20))

            self.win.parentSwitcher_addTarget_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_plus.png'))
            self.win.parentSwitcher_addTarget_btn.setIconSize(QtCore.QSize(30, 30))
            self.win.parentSwitcher_removeTarget_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_minus.png'))
            self.win.parentSwitcher_removeTarget_btn.setIconSize(QtCore.QSize(30, 30))
            self.win.parentSwitcher_targetUp_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_up.png'))
            self.win.parentSwitcher_targetUp_btn.setIconSize(QtCore.QSize(30, 30))
            self.win.parentSwitcher_targetDown_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/os_target_down.png'))
            self.win.parentSwitcher_targetDown_btn.setIconSize(QtCore.QSize(30, 30))

            # Twists
            self.win.addTwist_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/twist_add.png'))
            self.win.addTwist_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.addTwistSimple_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/twistSimple_add.png'))
            self.win.addTwistSimple_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.removeTwist_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/delete.png'))
            self.win.removeTwist_btn.setIconSize(QtCore.QSize(24, 20))

            # Inbetweens
            self.win.inbetweenJoints_image_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/images/inbetweenJoints.png'))
            self.win.inbetweenJoints_image_btn.setIconSize(QtCore.QSize(300, 160))
            # self.win.inbetweenJoints_image_btn.setAutoRaise(False)
            self.win.rotateWeightImage_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/images/inbetweenJoints2.png'))
            self.win.rotateWeightImage_btn.setIconSize(QtCore.QSize(300, 154))

            self.win.ib_switchOffsetLocators_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/lamp.png'))
            self.win.ib_switchOffsetLocators_btn.setIconSize(QtCore.QSize(24, 20))

            self.win.ibtw_add_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/ib_plus.png'))
            self.win.ibtw_add_btn.setIconSize(QtCore.QSize(30, 20))
            self.win.ibtw_remove_btn.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/delete.png'))
            self.win.ibtw_remove_btn.setIconSize(QtCore.QSize(24, 20))

        # posers color menu
        def posers_color():
            self.color_menu = QtWidgets.QMenu(self.win)
            m_action = QtWidgets.QWidgetAction(self.win)
            frameH = QtWidgets.QFrame()
            layH = QtWidgets.QVBoxLayout(frameH)
            layH.setSpacing(1)
            m_action.setDefaultWidget(frameH)

            for i, col in enumerate(self.color_list):

                b = QtWidgets.QPushButton("    ")
                # b.clicked.connect(partial(self.colorPosers, col, i))
                b.setStyleSheet("background-color: rgb" + str(col))

                if i % 8 == 0:
                    lay = QtWidgets.QHBoxLayout()
                    lay.setSpacing(1)
                    layH.addLayout(lay)

                lay.addWidget(b)

            self.color_menu.addAction(m_action)
            self.win.posersColor_btn.setMenu(self.color_menu)
            self.win.posersColor_btn.setVisible(1)
            self.win.poserColor_label.setVisible(1)

        self.controlShapesUpdate()
        self.rigTemplatesMenuUpdate()

        setMenu()
        setToolbar()
        setGroupLabels()
        setUI()

        def tests():
            # Tooltips
            ### menu.hovered.connect(self.currentMenuItemActivate)
            ### menu.hovered.connect(currentMenuItemActivate)

            ### def toQtObject(mayaName):
            ### ptr = OpenMayaUI.MQtUtil.findControl(mayaName)
            ### if ptr is None:
            ### ptr = OpenMayaUI.MQtUtil.findLayout(mayaName)
            ### if ptr is None:
            ### ptr = OpenMayaUI.MQtUtil.findMenuItem(mayaName)
            ### if ptr is not None:
            ### return wrapInstance(long(ptr), QtCore.QObject)

            ### self.helpLine = None
            # self.helpLine = cmds.helpLine()
            # hl_w = toQtObject(self.helpLine)
            # hl_w.setParent(self.win.frame_31)
            # print toQtObject(self.helpLine)

            # face
            # font = QtGui.QFont()
            # font.setPixelSize(16)
            #
            # for name in ["Global Options", 'Eyes', 'Lids', 'Nose', 'Cheeks', "Mouth", "Lips"]:
            #     item = QtWidgets.QListWidgetItem(name)
            #     item.setFont(font)
            #     item.setIcon(QtGui.QIcon(self.rootPath + '/ui/icons/module_item_selected2.png'))
            #     self.win.sections_listWidget.addItem(item)
            pass

        self.win.tabWidget.setCurrentIndex(0)
        self.win.tabWidget.setCurrentIndex(0)

    def rigTemplatesMenuUpdate(self):
        menu = QtWidgets.QMenu(self.win)

        saveRigTepl_action = QtWidgets.QAction(self.win)
        saveRigTepl_action.setText("Save Template")
        menu.addAction(saveRigTepl_action)
        saveRigTepl_action.triggered.connect(partial(self.template_actions, 'rig_save'))

        menu.addSeparator()

        def getTemplateFiles():
            templfilesList = os.listdir(self.rootPath + '/templates/rigs')
            templFiles = []
            # if file is template file, make menu item
            for f in templfilesList:
                fileName = f.split('.')[0]
                fileExt = f.split('.')[-1]
                if fileExt == 'tmpl':
                    templFiles.append(fileName)
            return templFiles

        # load saved data
        templateNames = getTemplateFiles()
        for t in templateNames:
            # read data
            t_action = QtWidgets.QAction(self.win)
            t_action.setText(t)
            t_action.triggered.connect(partial(self.template_actions, 'rig_load', t))
            menu.addAction(t_action)

        if len(templateNames) > 0:
            menu.addSeparator()
            delete_menu = menu.addMenu('&Delete')
            for t in templateNames:
                m_action = QtWidgets.QAction(self.win)
                m_action.setText("Delete " + utils.formatName(t.split(".")[0].split("/")[-1]))
                m_action.triggered.connect(partial(self.template_actions, "delete_rig", t))
                delete_menu.addAction(m_action)

        # add menu to button
        self.win.loadRig_btn.setMenu(menu)

    def controlShapesUpdate(self):
        with open(self.rootPath + '/controlShapes.cmds', mode='r') as f:
            self.controlShapes_data = json.load(f)

        menu = QtWidgets.QMenu(self.win)

        save_action = QtWidgets.QAction(self.win)
        save_action.setText("Save Current Shape")
        menu.addAction(save_action)
        save_action.triggered.connect(self.saveControlShape)

        menu.addSeparator()

        # buttons
        standartButtons = ['root', 'box', 'square', 'sphere',
                           'circle', 'triangle', 'pin', 'cross', 'flag', 'piramid',
                           'house', 'T_pin', 'rounded_triangle', 'half_circle', 'arrow_double', 'ark',
                           'ellipse', 'rounded_square', 'cylindr', 'arrow_four', 'gear', 'foot',
                           'locator', 'drop', 'arrow', 'star', 'moon']

        for name in self.controlShapes_data:
            if name in standartButtons:
                continue
            ctrlShape_action = QtWidgets.QAction(self.win)
            ctrlShape_action.setText(name)
            ctrlShape_action.triggered.connect(partial(self.controls_setShape, self.controlShapes_data[name]))
            menu.addAction(ctrlShape_action)

        if len(self.controlShapes_data) > 0:
            menu.addSeparator()
            delete_menu = menu.addMenu('&Delete')
            for name in self.controlShapes_data:
                if name in standartButtons:
                    continue
                m_action = QtWidgets.QAction(self.win)
                m_action.setText("Delete " + utils.formatName(name.split(".")[0].split("/")[-1]))
                m_action.triggered.connect(partial(self.template_actions, "delete_shape", name))
                delete_menu.addAction(m_action)

        self.win.controlShape_btn.setMenu(menu)

        # add control create buttons
        i = 0
        controlNames = []
        for name in self.controlShapes_data:
            controlNames.append(name)

        for row in range(3):
            for column in range(9):
                if i < len(standartButtons):
                    b = QtWidgets.QPushButton()
                    icon = QtGui.QPixmap(self.rootPath + '/icons/control_' + standartButtons[i] + ".png")
                    b.setIcon(QtGui.QIcon(icon))
                    b.setIconSize(QtCore.QSize(40, 40))
                    b.setStyleSheet("background-color: rgb(50, 50, 50)")
                    b.setMaximumWidth(60)
                    b.setMinimumHeight(58)
                    self.win.controlIcons_gridLayout.addWidget(b, row, column)
                    b.clicked.connect(partial(self.controls_setShape, self.controlShapes_data[standartButtons[i]]))
                i += 1

    def connectSignals(self):
        # rig page
        self.win.newCharacter_btn.clicked.connect(self.rig.create)
        self.win.deleteCharacter_btn.clicked.connect(self.delete_rig)
        self.win.selectSkinJoints_btn.clicked.connect(self.selectSkinJoints)
        # self.win.renameCharacter_btn.clicked.connect(self.rename_rig)		
        self.win.posersSize_slider.valueChanged.connect(self.posersSize_update)
        self.win.posersSize_slider.sliderPressed.connect(self.posersSize_startUpdate)
        self.win.posersSize_slider.sliderReleased.connect(self.posersSize_resetUi)
        self.win.posersSize_lineEdit.editingFinished.connect(partial(self.posersSize_startUpdate, manual=True))
        self.win.jointsSize_slider.valueChanged.connect(self.jointsSize_update)
        self.win.jointsSize_slider.sliderPressed.connect(self.jointsSize_startUpdate)
        self.win.jointsSize_slider.sliderReleased.connect(self.jointsSize_resetUi)
        self.win.jointsSize_lineEdit.editingFinished.connect(partial(self.jointsSize_startUpdate, manual=True))
        self.win.savePose_btn.clicked.connect(utils.savePos)
        self.win.resetPose_btn.clicked.connect(utils.loadPos)
        self.win.publishRig_btn.clicked.connect(self.publishRig)

        # menu
        self.win.actionDebug.triggered.connect(self.action_debug)
        self.win.actionAbout.triggered.connect(self.action_about)
        self.win.actionSets.triggered.connect(self.action_sets)
        self.win.actionHumanIk.triggered.connect(self.action_humanIk)
        self.win.action_moduleBuilder.triggered.connect(self.action_moduleBuilder)
        self.win.actionPosers.triggered.connect(self.rig.toggleVis_posers)
        self.win.actionControls.triggered.connect(self.rig.toggleVis_controls)
        self.win.actionJoints.triggered.connect(self.rig.toggleVis_joints)
        self.win.actionGeometry.triggered.connect(self.rig.toggleVis_geo)
        self.win.actionGeometry_Template.triggered.connect(self.rig.toggleTemplate_geo)
        self.win.actionGeometry_Reference.triggered.connect(self.rig.toggleReference_geo)
        self.win.actionJoints_Template.triggered.connect(self.rig.toggleTemplate_joints)
        self.win.actionSkeleton_LRA.triggered.connect(self.rig.toggleVis_jointsAxises)
        self.win.actionHelp_Mode.triggered.connect(self.helpMode)
        self.win.actionMove_Tool.triggered.connect(self.moveTool)
        self.win.actionHomePage.triggered.connect(self.homePage)
        self.win.actionTutorials.triggered.connect(self.tutorialsPage)
        self.win.actionAttributes_Window.triggered.connect(self.action_attributes)
        self.win.actionDriven_Groups.triggered.connect(self.actionDriven_Groups)
        self.win.actionAdd_Attribute.triggered.connect(self.actionAdd_Attribute)

        # Modules Tree
        self.win.delete_btn.clicked.connect(self.deleteModule)
        self.win.duplicateModule_btn.clicked.connect(self.duplicateModule)
        self.win.renameModule_btn.clicked.connect(self.renameModule)
        self.win.snapToParent_checkBox.clicked.connect(self.snapToParent)
        self.win.modules_treeWidget.currentItemChanged.connect(self.updateModulePage)
        self.win.modules_treeWidget.itemDoubleClicked.connect(self.rig.selectCurModMainPoser)
        # self.win.test_btn.clicked.connect(partial(self.makeSymmetryModule, test=1))

        # Modules page
        self.win.connectModule_btn.clicked.connect(self.connectModule)
        self.win.disconnectModule_btn.clicked.connect(self.disconnectModule)
        self.win.rebuildModule_btn.clicked.connect(self.rebuildModule)
        self.win.makeSymmetryModule_btn.clicked.connect(self.makeSymmetryModule)
        self.win.controls_tableWidget.currentItemChanged.connect(self.controls_selectItem)
        self.win.controls_tableWidget.itemChanged.connect(self.controls_changeName)

        self.win.selectPoser_but.clicked.connect(self.rig.selectCurModMainPoser)
        self.win.module_axises_but.clicked.connect(self.moduleToggleLRA)
        self.win.module_vis_but.clicked.connect(self.moduleToggleVis)
        self.win.module_solo_but.clicked.connect(self.moduleSolo)
        self.win.module_poser_axises_but.clicked.connect(self.moduleToggle_posersAxises)

        self.win.sections_listWidget.currentItemChanged.connect(self.updateFacePage)

        # Additional Controls page
        self.win.createCtrlCircle_btn.clicked.connect(partial(self.additionalControl_add, shape='circle'))
        self.win.createCtrlSquare_btn.clicked.connect(partial(self.additionalControl_add, shape='square'))
        self.win.createCtrlBox_btn.clicked.connect(partial(self.additionalControl_add, shape='box'))
        self.win.createCtrlSphere_btn.clicked.connect(partial(self.additionalControl_add, shape='sphere'))
        self.win.deleteAddControl_btn.clicked.connect(self.addControls_deleteControl)
        self.win.copySide_btn.clicked.connect(self.addControls_duplicate)
        self.win.copyAsChild_btn.clicked.connect(partial(self.addControls_duplicate, child=True))

        self.win.additionalControls_treeWidget.currentItemChanged.connect(self.addControls_updatePage)
        self.win.additionalControls_treeWidget.itemDoubleClicked.connect(self.addControls_selectRoot)
        self.win.renameAddControl_btn.clicked.connect(self.addControls_renameControl)
        self.win.addControlSetParent_btn.clicked.connect(self.addControls_setParent)

        self.win.addControlSymmetry_btn.clicked.connect(self.addControls_mirrorControl)
        self.win.addFlipOpposite_btn.clicked.connect(self.addControls_flipOpposite)

        # Tools
        self.win.testAnimate_btn.clicked.connect(partial(tools.makeTestAnimation, self.win))
        self.win.clearAnim_btn.clicked.connect(tools.clearTestAnimation)
        self.win.mult_doubleSpinBox.valueChanged.connect(partial(tools.multAnim_spinBoxChange, self.win))
        self.win.mult_horizontalSlider.valueChanged.connect(partial(tools.multAnim_sliderChange, self.win))

        self.win.parentSwitcher_set_btn.clicked.connect(partial(tools.ps_setObject, self.win))
        self.win.parentSwitcher_addTarget_btn.clicked.connect(partial(tools.ps_addTarget, self.win))
        self.win.parentSwitcher_removeTarget_btn.clicked.connect(partial(tools.ps_removeTarget, self.win))
        self.win.parentSwitcher_targetUp_btn.clicked.connect(partial(tools.ps_moveTarget, self.win, "up"))
        self.win.parentSwitcher_targetDown_btn.clicked.connect(partial(tools.ps_moveTarget, self.win, "down"))
        self.win.parentSwitcher_create_btn.clicked.connect(partial(tools.ps_createUpdate, self.win))
        self.win.parentSwitcher_detele_btn.clicked.connect(partial(tools.ps_delete, self.win))

        self.win.addRotateOrder_btn.clicked.connect(tools.addRotateOrder)
        self.win.addWorldSpaceAttr_btn.clicked.connect(tools.addWorldSpaceAttr)
        self.win.addMirrorLoc_btn.clicked.connect(tools.addMirrorLoc)
        self.win.addMirrorAxisAttr_btn.clicked.connect(tools.addMirrorAxisAttr)
        self.win.createControlGroup_btn.clicked.connect(tools.addControlGroup)
        self.win.connectByMultMatrix_btn.clicked.connect(tools.connectByMultMatrix)
        self.win.connectByBlendMatrix_btn.clicked.connect(tools.connectByBlendMatrix)

        self.win.smf_baseRigPostScript_btn.clicked.connect(tools.smf_baseRigPostScript)

        # Controller 
        self.win.rotateShapeX_btn.clicked.connect(partial(self.controls_rotateShape, "x"))
        self.win.rotateShapeY_btn.clicked.connect(partial(self.controls_rotateShape, "y"))
        self.win.rotateShapeZ_btn.clicked.connect(partial(self.controls_rotateShape, "z"))

        self.win.makeControl_btn.clicked.connect(self.makeControl)
        self.win.duplicateControl_btn.clicked.connect(self.duplicate)
        self.win.duplicateChildControl_btn.clicked.connect(self.addChildControl)





    """ UI """

    def moduleTemplatesMenuUpdate(self):

        # Set Module Template Menu --------------------------------------------------
        menu = QtWidgets.QMenu(self.win)

        saveModTepl_action = QtWidgets.QAction(self.win)
        saveModTepl_action.setText("Save Template")
        menu.addAction(saveModTepl_action)
        saveModTepl_action.triggered.connect(partial(self.template_actions, 'save'))

        saveCompModTepl_action = QtWidgets.QAction(self.win)
        saveCompModTepl_action.setText("Save as Compound Module")
        menu.addAction(saveCompModTepl_action)
        saveCompModTepl_action.triggered.connect(partial(self.template_actions, 'compound_save'))

        # resetModTepl_action = QtWidgets.QAction(self.win)
        # resetModTepl_action.setText("Reset to Default")
        # menu.addAction(resetModTepl_action)	

        menu.addSeparator()

        def getTemplateFiles():
            templfilesList = os.listdir(self.rootPath + '/templates/modules')
            templFiles = []
            # if file is template file for current module, add it to list
            for f in templfilesList:
                if f.split('.')[-1] == 'tmpl':
                    file_name = f.split(".")[0]
                    templ_type = file_name.split('_')[0]
                    if templ_type == self.curModule.type:
                        name = file_name[len(templ_type) + 1:]
                        templFiles.append(name)
            return templFiles

        # build template menu for current module
        templateNames = getTemplateFiles()

        for t in templateNames:
            t_action = QtWidgets.QAction(self.win)
            t_action.setText(t)
            t_action.triggered.connect(partial(self.template_actions, 'load', t))
            menu.addAction(t_action)

        if len(templateNames) > 0:
            menu.addSeparator()
            delete_menu = menu.addMenu('&Delete')
            for t in templateNames:
                m_action = QtWidgets.QAction(self.win)
                m_action.setText("Delete " + utils.formatName(t.split(".")[0].split("/")[-1]))
                m_action.triggered.connect(partial(self.template_actions, "delete", t))
                delete_menu.addAction(m_action)

        # add menu to button
        self.win.moduleTemplate_but.setMenu(menu)

    def compoundModuleMenuUpdate(self):
        self.compoundModules_menu.clear()
        m_path = self.rootPath + '/templates/compoundModules'
        t_files = os.listdir(m_path)

        templates = {}
        templates["root"] = []
        templates_folders = []
        for f in t_files:
            if '.' not in f and f[0] != '_':
                templates_folders.append(f)

            if f.split('.')[-1] == "ctmpl":
                templates["root"].append(m_path + '/' + f)

        for folder in templates_folders:
            templates[folder] = []
            for f in os.listdir(m_path + '/' + folder):
                if f.split('.')[-1] == "ctmpl":
                    templates[folder].append(m_path + '/' + folder + '/' + f)

        for t in templates:
            if t == "root":
                continue
            sub_menu = self.compoundModules_menu.addMenu('&%s' % t)
            for f in templates[t]:
                m_action = QtWidgets.QAction(self.win)
                # text = utils.formatName(f.split(".")[0].split("/")[-1])
                # m_action = ButtonAction(self.win, text)
                m_action.setText(utils.formatName(f.split(".")[0].split("/")[-1]))
                m_action.triggered.connect(partial(self.template_actions, "compound_load", f))
                sub_menu.addAction(m_action)

        for f in templates["root"]:
            m_action = QtWidgets.QAction(self.win)
            m_action.setText(utils.formatName(f.split(".")[0].split("/")[-1]))
            m_action.triggered.connect(partial(self.template_actions, "compound_load", f))
            self.compoundModules_menu.addAction(m_action)

        self.compoundModules_menu.addSeparator()

        delete_menu = self.compoundModules_menu.addMenu('&Delete')
        for t in templates:
            sub_menu = delete_menu.addMenu('&%s' % t)
            for f in templates[t]:
                m_action = QtWidgets.QAction(self.win)
                m_action.setText("Delete " + utils.formatName(f.split(".")[0].split("/")[-1]))
                m_action.triggered.connect(partial(self.template_actions, "compound_delete", f))
                sub_menu.addAction(m_action)

    def setAddControlsData(self, mData, curMod_name=""):
        # increment data
        datas = mData['additionalControlsData']
        # for d in datas:
        # print "------------------------", mData['name']
        # print d["name"]
        # print d["parent"]
        # print "------------------------", mData['name']
        # for d in mData["twistsData"]:
        # for dd in d:
        # print dd, d[dd]

        new_names = []
        for data in datas:
            name = data['name']
            if cmds.objExists(name):
                new_name = utils.incrementNameIfExists(name)
                while new_name in new_names:
                    new_name = utils.incrementName(new_name)
                data["name"] = new_name
                new_names.append(new_name)
                # print "Need to REPLACE", name, new_name, new_names
                for d in datas:
                    par = d["parent"]
                    if par == name:
                        # print "REPLACE", name, new_name
                        d["parent"] = new_name

                        twData = mData["twistsData"]
                        for tw_d in twData:
                            s_j = tw_d["start_j"]
                            e_j = tw_d["end_j"]
                            if s_j.split("_joint")[0] == name:
                                tw_d["start_j"] = new_name + "_joint"
                            if e_j.split("_joint")[0] == name:
                                tw_d["end_j"] = new_name + "_joint"

                    # print twData

        # print "-------NEW----------"				
        # for d in datas:
        # print "------------------------", mData['name']
        # print d["name"]
        # print d["parent"]

        if curMod_name:
            m_name = curMod_name  # for load module 
        else:
            m_name = mData['name']  # for load full rig
        # print m_name
        # add addCtrls without mirrored controls
        for cData in mData['additionalControlsData']:
            if not cData['mirrored']:
                m = self.rig.modules[m_name]
                # print 000, m_name
                # mod_name = utils.getRealNameFromTemplated(mData["name"], cData["parent"])
                par = utils.getRealNameFromTemplated(m_name, cData["parent"])
                # print "------------------------- - - - ---- -", mData["name"], cData["parent"], par
                m.addAdditionalControl(cData['name'], par, shape='circle')
        # print "ADD Control", cData['name'], cData['mirrored']
        # self.addControlsUtils.fixJointsParents()
        for cData in mData['additionalControlsData']:
            if not cData['mirrored']:
                par = utils.getRealNameFromTemplated(m_name, cData["poserParent"])
                # print m_name, cData["poserParent"], par
                p = utils.getRealNameFromTemplated(m_name, cData['name'] + "_addPoser")
                if cmds.listRelatives(p, p=1)[0] != par:
                    cmds.parent(p, par)
                cmds.xform(p, m=cData['pos'], ws=1)

                attrData = cData['poserAttrsData']
                for attr in attrData:
                    value = attrData[attr]
                    # print attr, value
                    try:
                        cmds.setAttr(p + '.' + attr, value)
                    except:
                        pass  # print p+'.'+attr, "is locked"

                for a in ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ"]:
                    if a not in attrData:
                        cmds.setAttr(p + "." + a, l=1, k=0, cb=0)

        for cData in mData['additionalControlsData']:
            if not cData['mirrored']:
                c = utils.getControlInstance(cData['name'])
                c.replaceShape(cData['shape'])
                c.setColor(cData['colorId'])

        # add mirrored controls
        for cData in mData['additionalControlsData']:
            if cData['mirrored']:
                c = utils.getControlInstance(utils.getOppositeObject(cData['name']))
                self.addControls_mirrorControl(c)

        # hide "hidden" controls
        # print "------------------------"
        for cData in mData['additionalControlsData']:
            if not cData['mirrored']:
                for c_int_name in mData['controlsVisData']:
                    # print 1111, c_int_name
                    c_name = utils.getControlNameFromInternal(m_name, c_int_name)
                    # print 444, c_int_name, c_name, mData['controlsVisData'], mData['controlsVisData'][c_int_name]
                    if not mData['controlsVisData'][c_int_name]:
                        c = utils.getControlInstance(c_name)
                        # print 444, c_int_name, c_name, mData['controlsVisData'], c
                        if c:
                            c.toggleVisible(manual=True, value=False)
                        else:
                            print("!!!!!!", c_name)

        # set attributes
        for cData in mData['additionalControlsData']:
            # print 333, cData
            c = utils.getControlInstance(cData['name'])
            if not c:
                continue
            intName = utils.getInternalNameFromControl(c.name)
            default_attrs = utils.getVisibleAttrs(c.name)
            for a in default_attrs:
                if intName + "." + a in mData['controlsData']:
                    cmds.setAttr(c.name + "." + a, mData['controlsData'][intName + "." + a])
                else:
                    cmds.setAttr(c.name + "." + a, keyable=0, lock=1)

    def incrementData(self, moduleName, input_data):
        datas = input_data['additionalControlsData']
        new_names = []
        for data in datas:
            name = data['name']
            if cmds.objExists(name):
                new_name = utils.incrementNameIfExists(name)
                while new_name in new_names:
                    new_name = utils.incrementName(new_name)
                data["name"] = new_name
                new_names.append(new_name)
                # print "Need to REPLACE", name, new_name, new_names
                for d in datas:
                    par = d["parent"]
                    if par == name:
                        # print "REPLACE", name, new_name
                        d["parent"] = new_name

    def template_actions(self, action, tName="", forceData=None):


        sel = cmds.ls(sl=1)

        print_main_messages = 0
        renamedModules = {}

        def incrementData(mData):
            add_data = mData['additionalControlsData']
            print("------------------------", mData['name'])
            # print d["name"]
            # print d["parent"]
            # print "------------------------", mData['name']
            # for d in mData["twistsData"]:
            # for dd in d:
            # print dd, d[dd]

            new_names = []
            for data in add_data:
                name = data['name']
                if cmds.objExists(name):
                    new_name = utils.incrementNameIfExists(name)
                    while new_name in new_names:
                        new_name = utils.incrementName(new_name)
                    data["name"] = new_name
                    new_names.append(new_name)

            # print mData["parents"]

            ##print "Need to REPLACE", name, new_name, new_names
            # for d in add_data:
            # par = d["parent"]
            # if par == name:
            ##print "REPLACE", name, new_name
            # d["parent"] = new_name

            # twData = mData["twistsData"]
            # for tw_d in twData:
            # print "AAAAAAAAAAAAAAAAAAAAAA"
            # s_j = tw_d["start_j"]
            # e_j = tw_d["end_j"]
            # if s_j.split("_joint")[0] == name:
            # tw_d["start_j"] = new_name + "_joint"
            # if e_j.split("_joint")[0] == name:
            # tw_d["end_j"] = new_name + "_joint"	
            pass

        def connectToParent(mData):

            if mData['parent'] != None:
                if mData['name'] in renamedModules:
                    mod_name = renamedModules[mData['name']]
                # print "old ", mData['name'], "new", mod_name
                else:
                    mod_name = mData['name']

                old_par_mod_name = mData['parent'].split("_")[0]
                if old_par_mod_name in renamedModules:
                    newParMod_name = renamedModules[old_par_mod_name]
                    parent = utils.getRealNameFromDataName(mData['parent'], newParMod_name)
                else:
                    parent = mData['parent']

                if parent:
                    # print 'connect', mod_name, ' to ', parent
                    self.connectModule(parent, mod_name, updateUI=False)

        def loadParents(mData):
            # make oss
            for snapped in mData['parents']:
                if snapped:
                    for d in mData['parents']:
                        self.curParents.os_makeConstraint(d)

        def snapToParentsEnd(mData):
            # make oss
            if mData['snapped']:
                self.curModule.snapToParent(True)

        def haveParent(parent_name, module_name):
            m = self.rig.modules[module_name]
            p_moduleName = None
            # print "checking", module_name, '------------- '
            while m.parent != None:
                p_moduleName = utils.getModuleName(m.parent)
                if p_moduleName == parent_name:
                    return True
                m = self.rig.modules[p_moduleName]

            return False

        def setAddAttributes(mData):
            # set attributes
            for cData in mData['additionalControlsData']:
                c = utils.getControlInstance(cData['name'])
                intName = utils.getInternalNameFromControl(c.name)
                default_attrs = utils.getVisibleAttrs(c.name)
                for a in default_attrs:
                    if intName + "." + a in mData['controlsData']:
                        cmds.setAttr(c.name + "." + a, mData['controlsData'][intName + "." + a])
                    else:
                        cmds.setAttr(c.name + "." + a, keyable=0, lock=1)

        if action == 'save':
            name, ok = QtWidgets.QInputDialog().getText(self.win, 'Save Module Template', 'Enter template name:',
                                                        QtWidgets.QLineEdit.Normal, self.curModule.name)

            if ok and name != "":
                name = name.replace(" ", "_")
            else:
                return

            mData = self.curModule.getData()

            fullPath = self.rootPath + '/templates/modules/' + self.curModule.type + '_' + name + ".tmpl"
            print("Saved to:", fullPath)
            # format data 
            json_string = json.dumps(mData, indent=4)
            # save data to file					
            with open(fullPath, 'w') as f:
                f.write(json_string)

            self.moduleTemplatesMenuUpdate()

            try:
                cmds.select(sel)
            except:
                cmds.select(clear=1)

        elif action == 'load':
            # read data
            with open(self.rootPath + '/templates/modules/' + self.curModule.type + '_' + tName + '.tmpl', mode='r') as f:
                mData = json.load(f)

                # skip if any add control is exists
                curAddControlsNames = []
                for c in self.curModule.additionalControls:
                    curAddControlsNames.append(c.name)

                # for m in mData['additionalControlsData']:
                # if cmds.objExists(m['name']) and m['name'] not in curAddControlsNames:
                # QtWidgets.QMessageBox.information(self.win, "Warning", 'Object with name "%s" is exist.' %m['name'])
                # return		

                # skip if module name is exists
                # if mData['name'] in self.rig.moduleNames and mData['name'] != self.curModule.name:
                # QtWidgets.QMessageBox.information(self.win, "Warning", 'Module name "%s" is exist.' %mData['name'])
                # return

                # turn off hierarhy connections
                # hierarhy_state = self.win.actionPosers_Hierarhy.isChecked()
                # self.action_posersHierarhy(False)	

                # rename for use template names
                # oldName = self.curModule.name
                # if mData['name'] != self.curModule.name:
                # self.renameModule(mData['name'])

                # remove opposite module
                sym = False
                if self.curModule.symmetrical:
                    cur_m = self.curModule
                    sym = True
                    oppMod = self.rig.getMirroredModule(self.curModule)
                    self.deleteModule(oppMod.name)

                    self.curModule = cur_m
                    oldCurItem = \
                    self.win.modules_treeWidget.findItems(cur_m.name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                          0)[0]
                    self.win.modules_treeWidget.setCurrentItem(oldCurItem)
                    self.curModule.symmetrical = False

                # remove twists
                twists = self.twistClass.getTwists(self.curModule.name)
                for tw in twists:
                    self.twistClass.twists_remove(tw)

                # remove add controls
                for c in self.curModule.additionalControls:
                    c.delete()

                # set module paraneters
                self.curModule.setData(mData)

                # set options
                opt = mData['optionsData']
                if opt != {}:
                    self.rebuildModule(options=opt)

                self.curModule.setData(mData)
                # rename to original name
                # self.renameModule(oldName)

                self.updateModulesTree()
                self.updateModulePage(self.curModule.name)

                # make symmetry module if needed
                if sym:
                    self.makeSymmetryModule()

                self.setAddControlsData(mData, self.curModule.name)
                self.addControls_updateTree()

                # twists
                for twData in mData['twistsData']:
                    real_data = []
                    real_data = twData
                    m_name = self.curModule.name
                    real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
                    real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
                    real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
                    twist.Twist(self.win).twists_add(real_data)

                self.twistClass.updateList()

                # restore hierarhy connections
                # self.action_posersHierarhy(hierarhy_state)

                try:
                    cmds.select(sel)
                except:
                    cmds.select(clear=1)

        elif action == 'rig_save':

            if not self.full:
                QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
                return
            print(self.full)
            data = {}
            modulesData = []

            t_name, ok = QtWidgets.QInputDialog().getText(self.win, 'Save Rig Template', 'Enter template name:',
                                                          QtWidgets.QLineEdit.Normal, self.rig.name)

            if ok and t_name != "":
                t_name = t_name.replace(" ", "_")
            else:
                return

            if len(self.rig.modules) == 0:
                cmds.warning("No modules")
                return

            # create progress window
            window = cmds.window(t='Save modules')
            cmds.columnLayout()
            if len(self.rig.modules) > 1:
                progressControl = cmds.progressBar(maxValue=len(self.rig.modules) - 1, width=300)
            else:
                progressControl = cmds.progressBar(maxValue=1, width=300)
            cmds.showWindow(window)

            for name in self.rig.modules:
                m = self.rig.modules[name]

                mData = m.getData()
                modulesData.append(mData)

                cmds.progressBar(progressControl, edit=True, step=1)

            # delete progress window
            cmds.deleteUI(window)

            data['type'] = 'rs_rig'
            data['name'] = self.rig.name
            data['modulesData'] = modulesData
            # data['sets'] = self.sets.getData()

            fullPath = self.rootPath + '/templates/rigs/' + t_name + ".tmpl"
            print(fullPath)
            # format data 
            json_string = json.dumps(data, indent=4)
            # save data to file					
            with open(fullPath, 'w') as f:
                f.write(json_string)

            self.rigTemplatesMenuUpdate()

        elif action == 'rig_load':
            # read data
            with open(self.rootPath + '/templates/rigs/' + tName + '.tmpl', mode='r') as f:
                data = json.load(f)

                if forceData:
                    data = forceData

                # create progress window
                window = cmds.window(t='Import modules')
                cmds.columnLayout()
                if len(data['modulesData']) > 1:
                    progressControl2 = cmds.progressBar(maxValue=8, width=300)
                    progressControl = cmds.progressBar(maxValue=len(data['modulesData']) - 1, width=300)
                else:
                    progressControl2 = cmds.progressBar(maxValue=1, width=300)
                    progressControl = cmds.progressBar(maxValue=1, width=300)
                cmds.showWindow(window)

                try:
                    self.rig.delete()
                except:
                    pass

                self.twistClass.twists = {}
                self.win.twists_listWidget.clear()

                rigName = self.rig.name
                self.create_rig(data['name'])

                # create modules
                if print_main_messages: print(
                    " -------------------------------- LOAD MODULES ------------------------------------------------ ")
                modulesData = []
                mirroredModulesData = []
                for mData in data['modulesData']:
                    if mData['opposite']:
                        mirroredModulesData.append([m, mData])
                    else:
                        m = self.addModule(mData['type'], name=mData['name'], options=mData['optionsData'],
                                           updateUI=False)
                        for p in mData['posersMatrixData']:
                            if p == "MODNAME_mainPoser":
                                mat = mData['posersMatrixData'][p]
                                p_name = utils.getRealNameFromTemplated(m.name, p)
                                cmds.xform(p_name, m=mat, ws=1)
                        modulesData.append([m, mData])
                    cmds.progressBar(progressControl, edit=True, step=1)
                # moduleLoad(mData)
                cmds.progressBar(progressControl2, edit=True, step=1)

                # turn off hierarhy connections
                # hierarhy_state = self.win.actionPosers_Hierarhy.isChecked()
                # self.action_posersHierarhy(False)					

                if print_main_messages: print(
                    " -------------------------------- SET MODULES ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load modules data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    # print 22222, self.curModule.name
                    self.curModule.setData(mData[1], sym=False, namingForce=True)
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- SET ADD CONTROLS DATA ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load add controls data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in data['modulesData']:
                    self.setAddControlsData(mData)
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- CONNECT MODULES ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load modules data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    connectToParent(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- MIRROR MODULES ------------------------------------------------ ")
                cmds.window(window, e=1, t='Create mirror modules')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in data['modulesData']:
                    if mData['symmetrical']:
                        # print 1000, mData['name']
                        # if mData['name'] != "l_leg":
                        # continue
                        self.makeSymmetryModule(mData['name'], updateUI=False)
                        cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- SET Parents DATA ------------------------------------------------ ")
                # load oss data
                cmds.window(window, e=1, t='Load parents data')
                cmds.progressBar(progressControl, e=1, progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    loadParents(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- Snap To Parents End Joint DATA ------------------------------------------------ ")
                # load oss data
                cmds.window(window, e=1, t='Load snap to parents ends data')
                cmds.progressBar(progressControl, e=1, progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    snapToParentsEnd(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                # restore hierarhy connections
                # self.action_posersHierarhy(hierarhy_state)

                # update joints placement
                cmds.refresh()

                if print_main_messages: print(
                    " -------------------------------- TWISTS ------------------------------------------------ ")
                cmds.window(window, e=1, t='Load twists data')
                cmds.progressBar(progressControl, e=1, progress=0)

                # for mData in data['modulesData']:	
                for mData in modulesData:
                    m = mData[0]
                    for twData in mData[1]['twistsData']:
                        # print "Rig load ADD TWIST Start ------------" , twData['name']
                        real_data = []
                        real_data = twData
                        m_name = m.name
                        real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
                        real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
                        real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
                        # print real_data['name'], real_data['start_j']
                        self.twistClass.twists_add(real_data)
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- SET ATTRIBUTES ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load modules data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    setAddAttributes(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)
                cmds.progressBar(progressControl2, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- END ------------------------------------------------ ")

                # delete progress window
                cmds.deleteUI(window)

                # sets
                # self.sets.templActions('clear')
                # self.sets.templActions('load', data=data['sets'])

                cmds.select(clear=1)

            # fix joints placement (update)
            for m_name in self.rig.modules:
                m = self.rig.modules[m_name]
                # if m.type == 'bend':
                # cmds.setAttr(m_name+'_0_skinJoint.tz', 0)

                c = utils.getControlNameFromInternal(m_name, 'posCtrl')
                if c != None and cmds.objExists(c):
                    cmds.setAttr(c + '.tx', 0)
                # break

            # return rig name
            self.rig.rename(rigName)
            self.rigPage_update()

            # update ui
            self.updateModulePage(self.curModule.name)

            cmds.select(clear=1)

        elif action == 'compound_save':

            if not self.full:
                QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
                return

            t_name = QtWidgets.QFileDialog.getSaveFileName(self.win, "Save compound module",
                                                           self.rootPath + '/templates/compoundModules', "*.ctmpl")[0]

            if t_name == "":
                return

            data = {}
            modulesData = []

            if len(self.rig.modules) == 0:
                cmds.warning("No modules")
                return

            # create progress window
            # window = cmds.window(t='Save modules')
            # cmds.columnLayout()
            # progressControl = cmds.progressBar(maxValue=len(self.rig.moduleNames)-1, width=300)		
            # cmds.showWindow( window )

            # collect data for current module and his children
            for name in self.rig.modules:
                m = self.rig.modules[name]

                # print name, m.parent
                if haveParent(self.curModule.name, m.name) or name == self.curModule.name:
                    mData = m.getData()
                    modulesData.append(mData)

                # cmds.progressBar(progressControl, edit=True, step=1)

            # delete progress window
            # cmds.deleteUI(window)

            data['type'] = 'compound_module'
            data['name'] = self.curModule.name
            data['modulesData'] = modulesData
            # data['sets'] = self.sets.getData()

            # print t_name
            # format data 
            json_string = json.dumps(data, indent=4)
            # save data to file					
            with open(t_name, 'w') as f:
                f.write(json_string)

            self.compoundModuleMenuUpdate()

        elif action == 'compound_load':
            # read data
            with open(tName, mode='r') as f:
                data = json.load(f)

                # for mData in data['modulesData']:
                # incrementData(mData)
                # return				

                # create progress window
                window = cmds.window(t='Import modules')
                cmds.columnLayout()
                if len(data['modulesData']) > 1:
                    progressControl = cmds.progressBar(maxValue=len(data['modulesData']) - 1, width=300)
                else:
                    progressControl = cmds.progressBar(maxValue=1, width=300)
                cmds.showWindow(window)

                # self.twistClass.twists = {}
                # self.win.twists_listWidget.clear()

                # create modules
                if print_main_messages:    print(
                    " -------------------------------- LOAD MODULES ------------------------------------------------ ")
                modulesData = []
                root_module_name = None
                mirroredModulesData = []
                for mData in data['modulesData']:
                    if mData['opposite']:
                        mirroredModulesData.append([m, mData])
                    else:
                        name = mData['name']
                        old_name = name
                        while cmds.objExists(name + '_mod'):
                            name = utils.incrementName(name)
                        new_name = name
                        renamedModules[old_name] = new_name
                        m = self.addModule(mData['type'], name=name, options=mData['optionsData'])
                        modulesData.append([m, mData])
                        # correct moduleName in data
                        mData["name"] = new_name

                        if mData['parent'] == None:
                            root_module_name = name

                    cmds.progressBar(progressControl, edit=True, step=1)
                # moduleLoad(mData)

                # turn off hierarhy connections
                # hierarhy_state = self.win.actionPosers_Hierarhy.isChecked()
                # self.action_posersHierarhy(False)					

                if print_main_messages: print(
                    " -------------------------------- SET ADD CONTROLS DATA ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load add controls data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in modulesData:
                    self.setAddControlsData(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- SET MODULES ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load modules data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    connectToParent(mData[1])
                    self.curModule.setData(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- MIRROR MODULES ------------------------------------------------ ")
                for mData in data['modulesData']:
                    if mData['symmetrical']:
                        # print 000, mData['name']
                        self.makeSymmetryModule(mData['name'])

                if print_main_messages: print(
                    " -------------------------------- SET Parents DATA ------------------------------------------------ ")
                # load oss data
                cmds.window(window, e=1, t='Load parents data')
                cmds.progressBar(progressControl, e=1, progress=0)
                for mData in modulesData:
                    m = mData[0]
                    os_data = mData[1]["parents"]
                    for d in os_data:
                        # print " ------------------------"
                        if d["moduleName"] in renamedModules:
                            new_name = renamedModules[d["moduleName"]]
                            # print "!!!", d["moduleName"], new_name
                            d["moduleName"] = new_name
                        # for t in d["targetModules"]:
                        for i, t in enumerate(d["targetModules"]):
                            if t in renamedModules:
                                new_name = renamedModules[t]
                                # print "!!!", t, new_name
                                d["targetModules"][i] = new_name
                    # for dd in d:
                    # print dd, d[dd]
                    loadParents(mData[1])
                    cmds.progressBar(progressControl, edit=True, step=1)

                if print_main_messages: print(
                    " -------------------------------- Last SET Data MODULES ------------------------------------------------ ")
                # load modules data
                cmds.window(window, e=1, t='Load modules data')
                cmds.progressBar(progressControl, e=1, maxValue=len(modulesData), progress=0)
                for mData in modulesData:
                    self.curModule = mData[0]
                    self.curModule.setData(mData[1])

                if print_main_messages: print(
                    " -------------------------------- END ------------------------------------------------ ")

                # restore hierarhy connections
                # self.action_posersHierarhy(hierarhy_state)

                # update joints placement
                cmds.refresh()

                cmds.window(window, e=1, t='Load twists data')
                cmds.progressBar(progressControl, e=1, progress=0)

                # add twists !!!!!!!!!!!!!!!!! NEED TO ADD SET TWISTS CONTROLS ATTR
                for mData in modulesData:
                    m = mData[0]
                    for twData in mData[1]['twistsData']:
                        # print "Rig load ADD TWIST Start ------------" , twData['name']
                        real_data = []
                        real_data = twData
                        m_name = m.name
                        real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
                        real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
                        real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
                        # print real_data['name'], real_data['start_j']
                        self.twistClass.twists_add(real_data)

                    # for mData in data['modulesData']:	
                    # for twData in mData['twistsData']:
                    # print "Rig load ADD TWIST Start ------------" , twData['name']
                    # tw = self.twistClass.twists_add(twData, mirror=False)		
                    # print "Rig load ADD TWIST End" 
                    cmds.progressBar(progressControl, edit=True, step=1)

                # delete progress window
                cmds.deleteUI(window)

                # sets
                # self.sets.templActions('clear')
                # self.sets.templActions('load', data=data['sets'])

                if root_module_name:
                    cmds.select(root_module_name + "_mainPoser")

            # fix joints placement (update)
            for m_name in self.rig.modules:
                m = self.rig.modules[m_name]
                # if m.type == 'bend':
                # cmds.setAttr(m_name+'_0_skinJoint.tz', 0)

                c = utils.getControlNameFromInternal(m_name, 'posCtrl')
                if c != None and cmds.objExists(c):
                    cmds.setAttr(c + '.tx', 0)
                # break

            # update ui
            self.updateModulesTree()
            self.updateModulePage(self.curModule.name)
            self.addControls_updateTree()

        elif action == 'compound_delete':
            # print tName
            os.remove(tName)
            self.compoundModuleMenuUpdate()

            print("Template file %s was deleted" % tName)

        elif action == 'delete':
            path = self.rootPath + '/templates/modules/' + self.curModule.type + '_' + tName + '.tmpl'
            os.remove(path)
            self.moduleTemplatesMenuUpdate()

            print("Template file %s was deleted" % tName)

        elif action == 'delete_rig':
            path = self.rootPath + '/templates/rigs/' + tName + '.tmpl'
            os.remove(path)
            self.rigTemplatesMenuUpdate()

            print("Template file %s was deleted" % tName)

        elif action == 'delete_shape':
            del self.controlShapes_data[tName]

            json_string = json.dumps(self.controlShapes_data, indent=4)
            with open(self.rootPath + '/controlShapes.cmds', 'w') as f:
                f.write(json_string)

            self.controlShapesUpdate()

            print("Template file %s was deleted" % tName)

    def colorPosers(self, color, id):
        self.win.posersColor_btn.setStyleSheet("background-color: rgb" + str(color))
        self.color_menu.close()
        self.updatePosersColor(id)

    def helpMode(self):

        on = self.win.actionHelp_Mode.isChecked()

        if on:
            self.helpEvent = EventClass(self.win.verticalLayout_11, self.win, self.help_widget)
            self.helpEvent.helpMode = True
        else:
            self.helpEvent.helpMode = False
            self.helpEvent.curTooltip.close()
            self.helpEvent.close()
        # if self.helpEvent.helpMode:
        # self.win.menubar.setStyleSheet("background-color: rgb(30, 50, 70);")		
        # else:
        # self.win.menubar.setStyleSheet("background-color:")
        pass

    def moveTool(self):
        # print "moveTool start"
        ctx = 'pickShapeCtx'

        def getHitPoser(anchorPoint=True):
            if anchorPoint:
                vpX, vpY, _ = cmds.draggerContext(ctx, query=True, anchorPoint=True)
            else:
                vpX, vpY, _ = cmds.draggerContext(ctx, query=True, dragPoint=True)
            poser = None
            pos = om.MPoint()  # camera point
            dir = om.MVector()
            hitpoint = om.MFloatPoint()
            OpenMayaUI.M3dView().active3dView().viewToWorld(int(vpX), int(vpY), pos, dir)

            floatHitPoint = om.MFloatPoint()
            floatHitPoint.setCast(pos)  # camera MFloatPoint

            distances = []
            objects = []

            pos2 = om.MFloatPoint(pos.x, pos.y, pos.z)
            for mesh in cmds.ls(type='mesh'):
                selectionList = om.MSelectionList()
                selectionList.add(mesh)
                dagPath = om.MDagPath()
                selectionList.getDagPath(0, dagPath)
                fnMesh = om.MFnMesh(dagPath)

                # ray casting
                intersection = fnMesh.closestIntersection(
                    om.MFloatPoint(pos2),
                    om.MFloatVector(dir),
                    None,
                    None,
                    False,
                    om.MSpace.kWorld,
                    99999,
                    False,
                    None,
                    hitpoint,
                    None,
                    None,
                    None,
                    None,
                    None)

                # if hitting
                if intersection:
                    # get object
                    o = pm.PyNode(fnMesh.name())
                    if not o.isIntermediate() and o.isVisible() and o.name().split("_")[-1] == "catcherShape":
                        # get distance to hit and save to list for comparing
                        dist = hitpoint.distanceTo(floatHitPoint)
                        distances.append(dist)
                        objects.append(o)

            # get closest object and add to geolist
            if len(objects) > 0:
                closestDist = distances[0]
                closestId = 0
                for d_id, d in enumerate(distances):
                    if d < closestDist:
                        closestDist = d
                        closestId = d_id
                poser = objects[closestId].split("_catcher")[0]

            return poser

        def catch():
            print("Catch")

            # imagemap = QtGui.QPixmap(self.rootPath+'/modules/%s/screen.png' %self.curModule.type)
            # open_hand_px = QtGui.QPixmap('open_hand.png')
            # open_hand_px.setMask(open_hand_px.mask())
            # open_hand_cursor = QtGui.QCursor(imagemap)

            cmds.undoInfo(chunkName='renameChunk', openChunk=True)
            QtWidgets.QApplication.setOverrideCursor(QtGui.QCursor(QtCore.Qt.CursorShape(2)))
            # QtWidgets.QApplication.setOverrideCursor(open_hand_cursor)
            self.init_cursor_pos = cmds.draggerContext(ctx, query=True, anchorPoint=True)

            # self.moveMode = True 

            # print "Init pos", pos

            mod = cmds.draggerContext(ctx, query=True, modifier=True)
            but = cmds.draggerContext(ctx, query=True, button=True)
            # print mod, but
            if mod == "none" and but == 2:
                return None

            poser = getHitPoser()

            # print but

            if poser:
                addPoser = poser.split("_")[-1] == "addPoser"
                if addPoser:
                    self.curAddControlName = poser.split("_addPoser")[0]
                    # print poser, self.curAddControlName
                    item = self.win.additionalControls_treeWidget.findItems(self.curAddControlName,
                                                                            QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                                            0)[0]
                    self.win.additionalControls_treeWidget.setCurrentItem(item)

                if but == 1:
                    # select mainPoser
                    if mod == "shift" and cmds.objExists(poser + ".moduleName"):
                        m_name = cmds.getAttr(poser + ".moduleName")
                        pm.select(m_name + "_mainPoser")
                    # duplicate	
                    elif mod == "ctrl" and addPoser:  # and not self.catch:
                        # self.curAddControlName = poser.split("_addPoser")[0]
                        # item = self.win.additionalControls_treeWidget.findItems(self.curAddControlName,QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
                        # self.win.additionalControls_treeWidget.setCurrentItem(item)						
                        self.addControls_duplicate()
                        pm.select(self.curAddControlName + "_addPoser")
                        cmds.refresh()

                    # select
                    else:
                        pm.select(poser)
                elif but == 2:
                    # remove
                    if mod == "ctrl" and addPoser:
                        # self.curAddControlName = poser.split("_addPoser")[0]
                        # item = self.win.additionalControls_treeWidget.findItems(self.curAddControlName,QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
                        # self.win.additionalControls_treeWidget.setCurrentItem(item)	
                        self.addControls_deleteControl()
                    elif mod == "shift" and addPoser:
                        # self.curAddControlName = poser.split("_addPoser")[0]
                        pm.select(clear=1)

            else:
                cmds.select(clear=1)

        def drop():
            # print "drop"
            cmds.undoInfo(closeChunk=True)
            self.catch = False
            mod = cmds.draggerContext(ctx, query=True, modifier=True)
            but = cmds.draggerContext(ctx, query=True, button=True)

            # connect
            if mod == "shift" and but == 2:
                poser = getHitPoser(False)
                if poser and poser.split("_")[-1] == "addPoser":
                    name = poser.split("_addPoser")[0]
                    cmds.select(name)
                    self.addControls_setParent()

            # self.moveMode = False
            QtWidgets.QApplication.restoreOverrideCursor()

        def moving():
            # print "moving"
            pos = cmds.draggerContext(ctx, query=True, dragPoint=True)
            x = pos[0] - self.init_cursor_pos[0]
            y = pos[1] - self.init_cursor_pos[1]
            # print self.init_cursor_pos, x, y
            if x != 0: cmds.pixelMove(x, 0)
            if y != 0: cmds.pixelMove(0, y)
            cmds.refresh()
            self.init_cursor_pos = pos

        # QtWidgets.QApplication.setOverrideCursor(QtGui.QCursor(QtCore.Qt.CursorShape(3)))

        if cmds.draggerContext(ctx, exists=True):
            cmds.deleteUI(ctx)

        self.moveMode = True
        # if self.rigBrushEvent:
        # self.rigBrushEvent.close()
        self.mWin.removeEventFilter(self.rigBrushEvent)
        # print "moveTool 0"
        cmds.draggerContext(ctx, pressCommand=catch, dragCommand=moving, releaseCommand=drop, name=ctx,
                            cursor='crossHair')
        cmds.setToolTo(ctx)
        # print "moveTool 1"
        self.rigBrushEvent = RigBrushEventClass(self)
        self.mWin.installEventFilter(self.rigBrushEvent)

    def homePage(self):
        webbrowser.open('http://rigstudiomaya.com', new=0, autoraise=True)

    def tutorialsPage(self):
        webbrowser.open('http://rigstudiomaya.com/tutorials', new=0, autoraise=True)





    """ Controllers Tab """

    def controls_setShape(self, shapeCreateCommand):


        sel = cmds.ls(sl=1)
        if len(sel) != 0:
            controls = sel
        else:
            cmds.warning("Select controls")
            return

        # set shape
        for ctrlName in sel:
            # change control name if selected root
            if ctrlName.split('_')[-1] == 'group':
                ctrlName = ctrlName.split('_group')[0]

            control = utils.getControlInstance(ctrlName)
            control.replaceShape(shapeCreateCommand)

            opp_ctrlName = utils.getOppositeObject(ctrlName)
            if ctrlName.split('_')[0] == 'l' and cmds.objExists(opp_ctrlName):
                opp_control = utils.getControlInstance(opp_ctrlName)
                opp_control.replaceShape(shapeCreateCommand)

                if cmds.objExists(ctrlName + '.mirrorShape') and cmds.getAttr(ctrlName + '.mirrorShape') == True:
                    shapes = cmds.listRelatives(ctrlName, s=1)
                    for s in shapes:
                        tg = cmds.createNode('transformGeometry', n=s + '_TG')
                        c_mat = cmds.createNode('composeMatrix', n=s + '_compMat')
                        modName = utils.getModuleName(ctrlName)
                        utils.addModuleNameAttr(tg, modName)
                        utils.addModuleNameAttr(c_mat, modName)
                        cmds.setAttr(c_mat + '.inputScaleX', -1)

                        cmds.connectAttr(s + '.worldSpace[0]', tg + '.inputGeometry')
                        cmds.connectAttr(c_mat + '.outputMatrix', tg + '.transform')
                        cmds.connectAttr(tg + '.outputGeometry', utils.getOppositeObject(s) + '.create')

            # else:
            # shapes = cmds.listRelatives(ctrlName, s=1)
            # for s in shapes:
            # try:	
            # cmds.connectAttr(s+'.worldSpace[0]', utils.getOppositeObject(s)+'.create')
            # except: cmds.warning(" MISS CONTROL SHAPE " + utils.getOppositeObject(s))				

        if len(sel) != 0:
            cmds.select(sel)
        # self.controls_setCustomShape()

    def controls_setCustomShape(self):


        self.modulePageUpdated = False

        # get selected controls
        sel = cmds.ls(sl=1)
        if len(sel) != 0:
            self.coloringControls = sel

        cmds.select(clear=1)
        # set shape
        for ctrlName in self.coloringControls:
            control = utils.getControlInstance(ctrlName)

            utils.setUserAttr(ctrlName, 'customShape', 1, type="bool")

            customShapeCommand = control.makePythonCommand()
            utils.setUserAttr(ctrlName, 'customShapeCommand', customShapeCommand, type="string")

        self.modulePageUpdated = True

    def saveControlShape(self):


        sel = cmds.ls(sl=1)
        if len(sel) != 1:
            cmds.warning('Select one curve object')
            return

        name, ok = QtWidgets.QInputDialog().getText(self.win, 'Save Control Shape', 'Enter shape name:',
                                                    QtWidgets.QLineEdit.Normal, sel[0])

        if ok and name != "":
            name = name.replace(" ", "_")
        else:
            return

        control = utils.getControlInstance(sel[0])
        cmd = control.makePythonCommand()

        self.controlShapes_data[name] = cmd

        json_string = json.dumps(self.controlShapes_data, indent=4)
        with open(self.rootPath + '/controlShapes.cmds', 'w') as f:
            f.write(json_string)

        self.controlShapesUpdate()

    def controls_rotateShape(self, axis):

        sels = cmds.ls(sl=1)
        if len(sels) == 0:
            return

        for crv in sels:
            try:
                form = cmds.getAttr(crv + ".form")
                deg = cmds.getAttr(crv + ".degree")
                spans = cmds.getAttr(crv + ".spans")
                if form != 2:
                    spans += deg

                cmds.select(crv + '.cv[0:%s]' % spans)

                if axis == 'x':
                    cmds.rotate(90, 0, 0, r=1, os=1)
                elif axis == 'y':
                    cmds.rotate(0, 90, 0, r=1, os=1)
                elif axis == 'z':
                    cmds.rotate(0, 0, 90, r=1, os=1)
            except:
                pass

        cmds.select(sels)

    def controls_setColor(self, colorId):


        self.modulePageUpdated = False

        # get selected rows
        # sel_rows =  self.controls_getSelectedIndexes()
        sel = cmds.ls(sl=1)
        if len(sel) != 0:
            self.coloringControls = sel

        cmds.select(clear=1)

        # set color
        for ctrl in self.coloringControls:
            # change control name if selected root
            if ctrl.split('_')[-1] == 'tuner':
                ctrl = ctrl.split('_tuner')[0]
            elif ctrl.split('_')[-1] == 'offset':
                ctrl = ctrl.split('_offset')[0]
            if not cmds.objExists(ctrl):
                continue
            try:
                control = utils.getControlInstance(ctrl)
                control.setColor(colorId)
                if ctrl.split('_')[0] == 'l':
                    opp_ctrl = utils.getOppositeObject(ctrl)
                    if cmds.objExists(opp_ctrl):
                        opp_control = utils.getControlInstance(opp_ctrl)
                        opp_control.setColor(colorId)
            except:
                pass

        self.modulePageUpdated = True

    def addChildControl(self):
        logger.debug(traceback.extract_stack()[-1][2])

        # get parent if selected
        sel = pm.ls(sl=1)
        if len(sel) == 1:
            parent = self.getFreeControl(sel[0])
            if not parent:
                return

            name = self.win.controlName_lineEdit.text()
            self.makeControl(name)
            ctrl = cmds.ls(sl=1)[0]
            cmds.parent(ctrl, parent)
        else:
            return

    def getNewName(self):
        name = self.win.controlName_lineEdit.text()

        sel = pm.ls(sl=1) or []

        if name == "":
            if len(sel) > 0:
                name = sel[0]
            else:
                name = 'ctrl'

        name = name.split('|')[-1]
        name = name.split('.')[0]
        name = utils.getLastName(name)
        # print name
        return name

    def makeControl(self, name=""):
        logger.debug(traceback.extract_stack()[-1][2])

        # get name
        if name == "":
            name = self.win.controlName_lineEdit.text()
            if name == "":
                name = 'ctrl'
        name = utils.getLastName(name)

        # create control
        control = name
        c_comm = self.controlShapes_data["circle"]
        exec(c_comm)
        ctrl = pm.ls(sl=1)[0]
        pm.rename(ctrl, name)
        pm.rename(ctrl.getShape(), name + 'Shape')
        pm.setAttr(ctrl + '.v', lock=1, keyable=0, channelBox=0)
        self.controls_setColor(18)

        root = control

        # add group
        if self.win.group_checkBox.isChecked():
            group = cmds.group(n=name + '_group', empty=1)
            cmds.parent(root, group)
            root = group

        # add joint
        if self.win.joints_checkBox.isChecked():
            cmds.select(control)
            j = cmds.joint(n=name + '_joint')

        cmds.select(root)

        return name

    def getFreeControl(self, sel):

        def isCurve(o):
            shapes = pm.listRelatives(o, shapes=True) or []
            for s in shapes:
                # print s
                if pm.objectType(s) == 'nurbsCurve':
                    return True
            return False

        ctrl = ''
        if pm.objectType(sel) == 'joint':
            par = pm.listRelatives(sel, parent=True)[0]
            if isCurve(par):
                ctrl = par.name()
            else:
                return False
        elif isCurve(sel):
            ctrl = sel.name()
        elif sel.split('_')[-1] == "group":
            childs = pm.listRelatives(sel)
            ctrlName = sel.split('_group')[0]
            if ctrlName in childs:
                ctrl = ctrlName
            else:
                return False
        else:
            return False

        return ctrl

    def duplicate(self):

        def getRoot(ctrl_name):
            parents = pm.listRelatives(ctrl_name, parent=True) or []
            if len(parents) == 0:
                return ctrl_name
            par = parents[0]
            if par.name() == ctrl_name + "_group":
                return par.name()

        sel = pm.ls(sl=1)
        if len(sel) != 1:
            pm.warning('Select one control')
            return

        sel = sel[0]

        # get control
        ctrl = self.getFreeControl(sel)
        if not ctrl:
            return

        oldRoot = getRoot(ctrl)

        oldName = ctrl

        # get name
        newName = self.win.controlName_lineEdit.text()
        if newName == "":
            newName = oldName
        newName = utils.getLastName(newName)

        # duplicate control group
        newRoot = oldRoot.replace(oldName, newName)
        pm.duplicate(oldRoot, n=newRoot)

        childs = pm.listRelatives(newRoot, allDescendents=1)
        for ch in childs:
            if pm.objExists(ch):
                name = ch.name().replace(oldName, newName)
                pm.rename(ch, name)

        pm.select(newRoot)



    """ Rig """

    def rigPage_update(self):
        charExist = self.rig.exists
        # print('rigPage_update')

        # if main is exists
        if charExist:
            self.updateModulesTree()
            self.win.tabWidget.setCurrentIndex(1)
            
            self.win.jointsSize_lineEdit.setText(str(round(self.rig.jointsSize, 3)))
            self.win.posersSize_lineEdit.setText(str(round(self.rig.posersSize, 3)))
            self.win.actionSkeleton_LRA.setChecked(self.rig.jointsAxises)
        else:
            self.win.tabWidget.setCurrentIndex(0)

        # enable/disable ui widgets
        self.win.rigPage_frame.setEnabled(charExist)
        self.win.posers_frame.setEnabled(charExist)
        self.win.newCharacter_btn.setEnabled(not charExist)
        self.win.deleteCharacter_btn.setEnabled(charExist)
        self.win.moduleOptions_tab.setEnabled(charExist)
        self.win.left_frame.setEnabled(charExist)

        self.win.actionPosers.setEnabled(charExist)
        self.win.actionControls.setEnabled(charExist)
        self.win.actionJoints.setEnabled(charExist)
        self.win.actionGeometry.setEnabled(charExist)
        self.win.actionJoints_Template.setEnabled(charExist)
        self.win.actionGeometry_Template.setEnabled(charExist)
        self.win.actionGeometry_Reference.setEnabled(charExist)
        self.win.actionAdvanced.setEnabled(charExist)
        self.win.actionPosers_Hierarhy.setEnabled(charExist)
        self.win.actionSkeleton_LRA.setEnabled(charExist)
        self.win.actionPosers_Axises.setEnabled(charExist)

        self.win.module_frame.setEnabled(False)

        if charExist:
            # init toolbar
            if len(self.rig.modules) > 0:
                self.win.actionPosers.setChecked(self.rig.posersVis)
                self.win.actionControls.setChecked(self.rig.controlsVis)

            self.win.actionJoints.setChecked(self.rig.jointsVis)
            self.win.actionJoints_Template.setChecked(self.rig.jointsTemplate)
            self.win.actionGeometry.setChecked(self.rig.geoVis)
            self.win.actionGeometry_Template.setChecked(self.rig.geoTemplate)
            self.win.actionGeometry_Reference.setChecked(self.rig.geoReference)

        self.win.modules_tab.setEnabled(charExist)
        self.win.addControls_tab.setEnabled(charExist)
        self.win.twists_tab.setEnabled(charExist)
        self.win.inbetweens_tab.setEnabled(charExist)
        self.win.os_tab.setEnabled(charExist)

        #if charExist and len(self.rig.modules) > 0:
            #color_id = cmds.getAttr(self.rig.moduleNames[0] + '_root_poser.overrideColor')
            #self.win.posersColor_btn.setStyleSheet("background-color: rgb" + str(self.color_list[color_id]))
        #else:
            #self.win.posersColor_btn.setStyleSheet("background-color: rgb" + str(self.color_list[4]))

        self.twistClass.updateList()
        self.win.twist_frame.setEnabled(False)

        self.ibtwClass.updateList()

    def delete_rig(self):
        self.rig.delete()
        run()

    def rename_rig(self):
        oldName = self.rig.name
        newName, ok = QtWidgets.QInputDialog().getText(self.win, 'Rename Rig', 'Enter rig name:',
                                                       QtWidgets.QLineEdit.Normal, oldName)

        if ok and oldName != "":
            name = newName.replace(" ", "_")
        else:
            return

        self.rig.rename(newName)
        self.rigPage_update()

    def posersSize_startUpdate(self, manual=False):
        # save init size data
        self.posersSizeData = {}
        posers = []
        for m_name in self.rig.modules:
            for p in cmds.listRelatives(m_name + '_posers', type='transform', allDescendents=1) or []:
                if p.split('_')[-1] in ['poser', 'mainPoser']:
                    posers.append(p)
        for p in posers:
            self.posersSizeData[p] = cmds.getAttr(p + '.size')
        self.posersSizeGlobal = cmds.getAttr(self.rig.root_group + '.posersSize')
        # update size
        # self.posersSize_update(update=True, manual=manual)
        self.posersSize_update(update=True)

    def posersSize_update(self, update=True, manual=False):
        # if self.posersSizeData == {}:
        # return

        # get value
        if manual:
            v = float(self.win.posersSize_lineEdit.text())
        else:
            v = self.win.posersSize_slider.value() * 0.01

        # update size
        if update:
            if v != 1:
                for p in self.posersSizeData:
                    # print "update", v, p, self.posersSizeData[p]
                    init_value = self.posersSizeData[p]
                    value = v * init_value
                    if value < 0.01:
                        value = 0.01
                    try:
                        cmds.setAttr(p + '.size', value)
                    except:
                        pass
            self.win.posersSize_lineEdit.setText(str(round(self.posersSizeGlobal * v, 3)))
        else:
            # save global size value
            cmds.setAttr(self.rig.root_group + '.posersSize', round(self.posersSizeGlobal * v, 3))
            # reset slider
            # print "reset"
            self.win.posersSize_slider.setValue(100)
            self.posersSizeData = {}
            self.win.posersSize_lineEdit.setText(str(round(cmds.getAttr(self.rig.root_group + '.posersSize'), 3)))

        # manual setting
        if manual:
            self.win.posersSize_lineEdit.setText("1.00")
            self.posersSize_startUpdate()

    def posersSize_resetUi(self):
        self.posersSize_update(False)

    def jointsSize_startUpdate(self):
        # save init size data
        self.jointsSizeData = {}
        for j in cmds.listRelatives('skeleton', type='joint', allDescendents=1) or []:
            self.jointsSizeData[j] = cmds.getAttr(j + '.radius')
        self.jointsSizeGlobal = cmds.getAttr(self.rig.root_group + '.jointsSize')
        # update size
        self.jointsSize_update(update=True)

    def jointsSize_update(self, update=True):
        # if self.jointsSizeData == {}:
        # return
        v = self.win.jointsSize_slider.value() * 0.01
        # update size
        if update:
            if v != 1:  # and self.jointsSizeGlobal != 0:
                for p in self.jointsSizeData:
                    init_value = self.jointsSizeData[p]
                    value = v * init_value
                    if value < 0.01:
                        value = 0.01
                    cmds.setAttr(p + '.radius', value)
            self.win.jointsSize_lineEdit.setText(str(round(self.jointsSizeGlobal * v, 3)))
        else:
            # save global size value
            cmds.setAttr(self.rig.root_group + '.jointsSize', self.jointsSizeGlobal * v)
            # reset slider
            self.win.jointsSize_slider.setValue(100)
            self.jointsSizeData = {}
            self.win.jointsSize_lineEdit.setText(str(round(cmds.getAttr(self.rig.root_group + '.jointsSize'), 3)))

    def jointsSize_resetUi(self):
        self.jointsSize_update(False)

    def selectSkinJoints(self):
        skin_joints = []
        all_joints = cmds.listRelatives("skeleton", allDescendents=1) or []
        for j in all_joints:
            if cmds.objectType(j) != "joint":
                continue
            childs = cmds.listRelatives(j) or []
            if len(childs) > 0:
                skin_joints.append(j)

        for j in skin_joints:
            childs = cmds.listRelatives(j) or []
            for ch in childs:
                if utils.isClose(ch, j):
                    skin_joints.remove(j)

        for j in skin_joints:
            if cmds.objExists(j.replace('joint', 'outJoint')):
                if utils.getModuleTypeFromAttr(j.replace('joint', 'outJoint')) == 'root':
                    skin_joints.remove(j)

        cmds.select(skin_joints)

    def publishRig(self):

        # disconnect controls shapes
        # controls = self.rig.getControls()
        # for c_name in controls:
        # if utils.objectIsOpposite(c_name):
        # c = pm.PyNode(c_name)
        # for s in c.getShapes():
        # s.create.disconnect()

        window = cmds.window(t='Bake rig')
        cmds.columnLayout()
        lenght = len(self.rig.modules)
        if lenght > 1:
            progressControl = cmds.progressBar(maxValue=lenght - 1, width=300)
        else:
            progressControl = cmds.progressBar(maxValue=1, width=300)
        cmds.showWindow(window)

        cmds.progressBar(progressControl, e=1, maxValue=lenght, progress=0)
        for m_name in self.rig.modules:
            m = self.rig.modules[m_name]
            m.bake()
            cmds.progressBar(progressControl, edit=True, step=1)

        cmds.deleteUI(window)

        self.rig.modules = []

        self.rigPage_update()






    """ Modules """

    def updateModulesTree(self):
        # get modules
        if not self.rig.exists:
            return

        # clear old data
        self.win.modules_treeWidget.clear()
        self.win.modules_treeWidget.setColumnCount(2)
        
        if self.rig.modules:
            # create modules items
            items = {}
            for name in sorted(self.rig.modules):
                item = QtWidgets.QTreeWidgetItem([name])
                items[name] = item
            
            # fill modules list
            for name in sorted(self.rig.modules):
                m = self.rig.modules[name]

                if not m.parent:
                    #if cmds.getAttr(m.name + "_mod.v"):
                        #item.setIcon(1, QtGui.QIcon(self.rootPath + '/ui/icons/module_item_selected2.png'))
                    self.win.modules_treeWidget.addTopLevelItem(items[name])
                else:
                    parentModuleName = utils.getModuleName(m.parent)
                    # if cmds.getAttr(m.name + "_mod.v"):
                    #     item.setIcon(1, QtGui.QIcon(self.rootPath + '/ui/icons/module_item_selected2.png'))
                    parent = items[parentModuleName]
                    parent.addChild(items[name])

                # set module Icon
                # item.setIcon(0, QtGui.QIcon(self.rootPath + '/ui/icons/module_%s.png' % m.type))
                    
                if m.opposite:
                    item.setForeground(0, QtGui.QBrush(QtGui.QColor("#6C6B6B")))

        # if self.curModule: 
        #     self.selectModuleInList(self.curModule.name)

        # expand modules tree
        self.win.modules_treeWidget.expandAll()

    def updateModulePage(self, moduleNameOrItem, prevItem="", updateMap=False):
        if type(moduleNameOrItem).__name__ == "NoneType":
            self.win.moduleType_lineEdit.setText("")
            self.win.moduleName_lineEdit.setText("")
            self.win.controls_tableWidget.setRowCount(0)
            self.win.module_frame.setEnabled(0)
            # modules options widgets
            for x in range(self.win.options_lay.count()):
                w = self.win.options_lay.itemAt(x).widget()
                w.deleteLater()
            return

        self.win.module_frame.setEnabled(1)

        self.modulePageUpdated = False

        # name
        if type(moduleNameOrItem) is QtWidgets.QTreeWidgetItem:
            moduleName = moduleNameOrItem.text(0)
        else:
            moduleName = moduleNameOrItem

        self.curModule = self.rig.modules[moduleName]

        m = self.curModule

        # update attrs
        if self.curModule.opposite:
            self.win.moduleType_lineEdit.setText(m.type + " (Mirrored)")
        else:
            self.win.moduleType_lineEdit.setText(m.type)
        self.win.moduleName_lineEdit.setText(m.name)
        self.win.parent_lineEdit.setText(m.parent)
        
        # Info
        self.win.info_textEdit.setPlainText(utils.readInfo(m.type))

        # mirror
        self.win.center_frame.setEnabled(not self.curModule.opposite)

        self.win.makeSymmetryModule_btn.setEnabled(not self.curModule.symmetrical)

        # attach end poser
        self.win.snapToParent_checkBox.setChecked(self.curModule.isSnapped())

        if self.curModule.parent == None or self.curModule.parent == "":
            self.win.snapToParent_checkBox.setEnabled(False)
            self.win.disconnectModule_btn.setEnabled(False)
        else:
            self.win.snapToParent_checkBox.setEnabled(True)
            self.win.disconnectModule_btn.setEnabled(True)

        # controls
        controls = sorted(self.curModule.getControls())
        self.win.controls_tableWidget.setRowCount(0)

        def get_duplicates(array):
            unique = {}
            for c in array:
                value = c.split('|')[-1]
                if value in unique and unique[value]:
                    unique[value] = False
                    yield value
                else:
                    unique[value] = True

        dup = list(get_duplicates(controls))
        if len(dup) > 0:
            QtWidgets.QMessageBox.information(self.win, "Warning", "Duplicates in controls: %s" % dup)
            return

        for i in range(len(controls)):
            # set item not editable
            control = controls[i]

            # add row to table
            count = self.win.controls_tableWidget.rowCount()
            self.win.controls_tableWidget.insertRow(count)

            # add internal name
            int_name = utils.getInternalNameFromControl(control)
            item = QtWidgets.QTableWidgetItem(int_name)
            self.win.controls_tableWidget.setItem(count, 3, item)

            # add control name
            item = QtWidgets.QTableWidgetItem(control)
            self.win.controls_tableWidget.setItem(count, 1, item)

            # add visible button
            vis_btn = QtWidgets.QPushButton(self.win)
            self.win.controls_tableWidget.setCellWidget(i, 0, vis_btn)
            vis_btn.clicked.connect(partial(self.controls_switchVis, vis_btn, item))
            vis = utils.getControlVis(control)
            if vis:
                vis_btn.setText('On')
                item = self.win.controls_tableWidget.item(i, 1)
                item.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsEditable)
            else:
                vis_btn.setText('Off')
                item = self.win.controls_tableWidget.item(i, 1)
                item.setFlags(QtCore.Qt.NoItemFlags)

            # add color
            colorId = utils.getControlColor(control)
            item = QtWidgets.QTableWidgetItem()
            self.win.controls_tableWidget.setItem(count, 2, item)
            item.setFlags(QtCore.Qt.ItemIsSelectable)

            if type(colorId) == list:
                colorId = colorId[0]
            col = self.color_list[colorId]
            color = QtGui.QColor(col[0], col[1], col[2])
            item.setBackground(color)

        # modules options widgets
        for x in range(self.win.options_lay.count()):
            w = self.win.options_lay.itemAt(x).widget()
            w.deleteLater()
        path = os.path.join(self.rootPath, "modules", m.type, m.type + "_widget.ui")

        if os.path.exists(path):
            w = load_ui_widget(path)
            w.delete_frame.deleteLater()
            self.win.options_lay.insertWidget(0, w)
            m.connectSignals(self, w)
            m.updateOptionsPage(w)

        self.moduleTemplatesMenuUpdate()
        self.modulePageUpdated = True

        # print(111, self.curModule.name)

    def selectModuleInList(self, name): #
        try:
            item = self.win.modules_treeWidget.findItems(name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
            self.win.modules_treeWidget.setCurrentItem(item)
        except:
            print("Cannot find the module in list")

    def inputModuleName(self, defaultValue):
        # get new name
        newName, ok = QtWidgets.QInputDialog().getText(self.win, 'Rename Module', 'Enter module name:',
                                                        QtWidgets.QLineEdit.Normal, defaultValue)

        if ok:
            if not utils.nameIsOk(newName):
                QtWidgets.QMessageBox.information(self.win, "Warning", "Wrong Name.")
                return
            
            if newName in self.rig.modules:
                QtWidgets.QMessageBox.information(self.win, "Warning", "Module with this name is exists")
                return
            return newName
        else:
            return

    def addModule(self, moduleType, name="", options={}, updateUI=True, nodePosition=""): #
        if name == "":
            name = self.inputModuleName(moduleType)
            if not name:
                return

        m = self.rig.create_module(name, moduleType, options)

        self.curModule = m
        
        if updateUI:
            self.updateModulesTree()
            self.selectModuleInList(name)
            self.rig.selectCurModMainPoser()

        self.curModule.toggle_posersAxises(self.win.actionPosers_Axises.isChecked())
        self.curModule.toggleLRA(self.win.actionSkeleton_LRA.isChecked())

        return m

    def duplicateModule(self, module=""):

        if not module:
            module = self.curModule
            if not self.curModule:
                return

        name = utils.incrementName(module.name)
        while name in self.rig.modules:
            name = utils.incrementName(name)
        
        data = module.getData()

        self.addModule(module.type, name=name, options=data['optionsData'], updateUI=True)
        
        self.curModule.setData(data)

        # set options
        opt = data['optionsData']
        # if opt != {}:
        #     self.rebuildModule(options=opt)
        self.updateModulePage(self.curModule.name)
        self.setAddControlsData(data, self.curModule.name)
        self.addControls_updateTree()


        # twists
        # for twData in data['twistsData']:
        #     real_data = []
        #     real_data = twData
        #     m_name = self.curModule.name
        #     real_data['name'] = utils.getRealNameFromTemplated(m_name, twData['name'])
        #     real_data['start_j'] = utils.getRealNameFromTemplated(m_name, twData['start_j'])
        #     real_data['end_j'] = utils.getRealNameFromTemplated(m_name, twData['end_j'])
        #     twist.Twist(self.win).twists_add(real_data)

        self.rig.selectCurModMainPoser()

    def deleteModule(self, moduleName="", updateUI=True):
        # print("Delete module")
        if self.curModule.name == None:
            return

        # get vars
        if moduleName == "":
            moduleName = self.curModule.name
            m = self.curModule
        else:
            m = self.rig.modules[moduleName]

        # save os data which current module is connected
        parentedControls = []
        # for m_name in modules:
        for m_name in self.rig.modules:
            mod = self.rig.modules[m_name]
            parented = mod.getControlsParents()
            for c in parented:
                parentedControls.append(c)

        os_update_data = []
        for c in parentedControls:
            obj = c + "_parentsGroup"
            os_data = self.curParents.getDataFromNode(obj)
            for t_mName in os_data['targetModules']:
                if t_mName == moduleName:
                    if os_data not in os_update_data:
                        os_update_data.append(os_data)

        # delete os 
        for os_data in os_update_data:
            self.curParents.os_deleteConstraint(data=os_data)

        # disconnect children
        for m_name in self.rig.modules:
            child_m = self.rig.modules[m_name]
            if moduleName == utils.getModuleName(child_m.parent):
                self.disconnectModule(child_m.name)

        # disconnect twists
        for tw in cmds.listRelatives('twists', type='transform') or []:
            t_name = tw.split("_mod")[0]

            t_mod_name = utils.getModuleName(tw)
            if t_mod_name == moduleName:
                continue
            t_data = self.twistClass.getData(t_name)

            if not t_data:
                continue

            for j in ['start_j', 'end_j']:
                m_name = utils.getModuleName(t_data[j])
                if m_name == moduleName:
                    if j == 'start_j':
                        cmds.select(t_name + "_joint")
                        cmds.parent(t_name + "_start_connectorLoc", t_name + "_root_connector")
                    elif j == 'end_j':
                        for possible_end_joint in cmds.listRelatives(t_name + "_joint"):
                            if cmds.objectType(possible_end_joint) == "joint":
                                cmds.parent(t_name + "_end_connectorLoc", possible_end_joint)

        # remove mirrored module
        if m.symmetrical:
            oppModule = self.rig.getMirroredModule(m)
            self.deleteModule(oppModule.name, updateUI=False)

        # save snapping state and disable it
        opp = m.opposite
        if m.opposite:
            leftModule = self.rig.getMirroredModule(m)
            snapped = leftModule.isSnapped()
            if snapped:
                leftModule.snapToParent(False)
        
        # remove module from data list
        del self.rig.modules[moduleName]

        # disconnect
        if m.parent:
            m.disconnect()

        if m.opposite:
            opp_m = self.rig.getMirroredModule(m)
            opp_m.symmetrical = False

        # delete
        m.delete()

        # restore snapping in left side
        if opp:
            if snapped:
                leftModule.snapToParent(True)

        # restore os 
        for os_data in os_update_data:
            self.curParents.os_makeConstraint(os_data)

        # update current module
        if len(self.rig.modules) > 0:
            first_module_name = list(self.rig.modules)[0]
            self.curModule = self.rig.modules[first_module_name]
        else:
            self.curModule = None

        if updateUI:
            self.updateModulesTree()

        self.twistClass.updateList()
        self.curParents.updateList()
        self.addControls_updateTree()

    def connectModule(self, target="", moduleName="", updateUI=True):
        # get module
        if moduleName == "":
            moduleName = self.curModule.name
            m = self.curModule
        else:
            m = self.rig.modules[moduleName]
        
        # get target
        if target == "":
            sel = cmds.ls(sl=1)
            if len(sel) != 1:
                cmds.warning("Select one poser or joint")
                return

            target = sel[0]

            if target.split("_")[-1] not in ["poser", "mainPoser", "point", "joint", "addPoser", "outJoint"]:
                cmds.warning("Selected object is not poser or joint")
                return

        # replace mainPoser on root poser
        if target.split("_")[-1] == "mainPoser":
            target = target.replace("mainPoser", "root_poser")

        if not cmds.objExists(target):
            return

        # get target module
        target_modName = utils.getModuleName(target)
        if target_modName == moduleName:
            cmds.warning("Selected target is belong current module")
            return

        cmds.undoInfo(openChunk=True)
        
        # disconnect
        if m.parent:
            m.disconnect()

        m.connect(target)
        # Connect mirrored module
        # if not m.opposite:
        #     oppModule = self.rig.getMirroredModule(m)

        #     if oppModule:
        #         if oppModule.parent:
        #             oppModule.disconnect()

        #         if target.split("_")[0] == 'l':
        #             oppTarget = utils.flipSide(target)
        #             if cmds.objExists(oppTarget):
        #                 oppModule.connect(oppTarget)
        #         else:
        #             oppModule.connect(target)

        # add connection line
        # if not target_modName+'.'+target.split(target_modName+'_')[-1]+'.'+moduleName+".parent" in self.worldScene.lines:
        # self.worldScene.addLine(target_modName, target, moduleName, "parent")

        # restore selection
        utils.restoreSelection(sel)

        cmds.undoInfo(closeChunk=True)

        if updateUI:
            self.updateModulesTree()
            self.selectModuleInList(self.curModule.name)

    def disconnectModule(self, moduleName=""):
        sel = cmds.ls(sl=1)

        # get vars
        if not moduleName or moduleName == "":
            moduleName = self.curModule.name
            m = self.curModule
        else:
            m = self.rig.modules[moduleName]

        # if m.symmetrical: 
        # QtWidgets.QMessageBox.information(self.win, "Warning", "Symmetrical module cannot be disconnected. Remove opposide side first or connect module to another parent.")
        # return

        # disconnect
        m.disconnect()

        # delete opposite module on disconnecting 
        # if m.symmetrical:
        #     oppModule = self.rig.getMirroredModule(m)
        #     oppModule.disconnect()

        # restore selection
        utils.restoreSelection(sel)

        self.updateModulesTree()
        self.selectModuleInList(self.curModule.name)

    def snapToParent(self):


        if not self.curModule.parent:
            return

        sel = cmds.ls(sl=1)

        # attach
        state = self.win.snapToParent_checkBox.isChecked()
        self.curModule.snapToParent(state)

        # attach for mirrored module
        # oppModule = self.rig.getMirroredModule(self.curModule)
        # if oppModule:
        # oppModule.snapToParent(state)

        # restore selection
        try:
            cmds.select(sel)
        except:
            pass

    def makeSymmetryModule(self, moduleName="", updateUI=True, test=False):


        if moduleName != "":
            m = self.rig.modules[moduleName]
        else:
            m = self.curModule

        parent = m.parent
        addControls = m.getAdditionalControls()

        if not parent:
            QtWidgets.QMessageBox.information(self.win, "Warning", "Set parent first")
            return

        for o in cmds.listRelatives('twists') or []:
            if utils.getModuleName(o) == m.name:
                QtWidgets.QMessageBox.information(self.win, "Warning", "Remove twists on this module first")
                return

        oldModule = m

        # set names
        side = utils.getObjectSide(m.name)
        l_new_name = m.name
        if side != "l":
            l_new_name = "l_" + m.name
        newModuleName = utils.flipSide(l_new_name)

        if cmds.objExists(newModuleName + "_mod"):
            QtWidgets.QMessageBox.information(self.win, "Warning", "Module %s is exists" % newModuleName)
            return

        # set names
        if side != "l":
            self.renameModule("l_" + m.name)
        newModuleName = utils.flipSide(m.name)

        # get data
        data = m.getData()
        m.symmetrical = True

        m.snapToParent(False)

        # print "!!!!", data['optionsData']
        # add new module
        opp_m = self.addModule(m.type, newModuleName, data['optionsData'], updateUI=updateUI)
        # cmds.hide(newModuleName+'_posers')
        opp_m.setData(data, sym=True, namingForce=True)
        opp_m.opposite = True

        # conntect to parent
        if parent == '':
            opp_m.connectOpposite()
        else:
            if utils.getObjectSide(parent) == "l" and cmds.objExists(utils.flipSide(parent)):
                parent = utils.flipSide(parent)
            self.connectModule(target=parent, moduleName=newModuleName, updateUI=False)

        # add twists
        for twData in data['twistsData']:
            name = utils.getRealNameFromTemplated(oldModule.name, twData['name'])
            self.twistClass.twists_remove(name)
            tw = self.twistClass.twists_add(twData, oldModule.name)

        if data['snapped']:
            m.snapToParent(True)
        # add os
        for d in data['parents']:
            if len(d['intNames']) > 0:
                self.curParents.os_makeConstraint(d)

        # add add controls
        addControls = oldModule.getAdditionalControls()
        for c in addControls:
            self.addControls_mirrorControl(c)

        # controls shapes connections
        controls = utils.getSetObjects(newModuleName + '_moduleControlSet')
        poserShapes = utils.getSetObjects(newModuleName + '_poserShapesForConnectSet')
        controls += poserShapes
        for c in controls:
            l_control = utils.getControlInstance(utils.getOppositeObject(c))
            r_control = utils.getControlInstance(c)
            # print "REPLACE SHAPE", c
            # print "REPLACE SHAPE", c, pm.PyNode(c).worldSpace[0].outputs()
            if len(pm.PyNode(c).worldSpace[0].outputs()) == 0:
                # print "---- RECreate SHAPE", l_control.name
                shape_cmd = l_control.makePythonCommand()
                r_control.replaceShape(shape_cmd)
            shapes = cmds.listRelatives(c, s=1)

            if cmds.objExists(c + '.mirrorShape') and cmds.getAttr(c + '.mirrorShape') == True:
                # print ' -----------', c, shapes
                for s in shapes:
                    tg = cmds.createNode('transformGeometry', n=s + '_TG')
                    c_mat = cmds.createNode('composeMatrix', n=s + '_compMat')
                    utils.addModuleNameAttr(tg, newModuleName)
                    utils.addModuleNameAttr(c_mat, newModuleName)
                    cmds.setAttr(c_mat + '.inputScaleX', -1)

                    cmds.connectAttr(utils.getOppositeObject(s) + '.worldSpace[0]', tg + '.inputGeometry')
                    cmds.connectAttr(c_mat + '.outputMatrix', tg + '.transform')
                    cmds.connectAttr(tg + '.outputGeometry', s + '.create', f=1)

            else:
                # print "111", c, shapes
                for s in shapes:
                    # print utils.getOppositeObject(s), s
                    if not cmds.isConnected(utils.getOppositeObject(s) + '.worldSpace[0]', s + '.create'):
                        cmds.connectAttr(utils.getOppositeObject(s) + '.worldSpace[0]', s + '.create', f=1)

            for s in shapes:
                v = cmds.getAttr("l" + s[1:] + '.v')
                try:
                    cmds.setAttr(s + '.v', v)
                except:
                    pass

        if updateUI:
            # select left module in modules tree 
            try:
                newCurItem = self.win.modules_treeWidget.findItems(utils.getOppositeObject(newModuleName),
                                                                   QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                                   0)[0]
                self.win.modules_treeWidget.setCurrentItem(newCurItem)
            except:
                pass

        # update joint position (maya bug)
        v = cmds.getAttr(oldModule.name + '_root_poser.tx')
        try:  # if attribute is not connected
            cmds.setAttr(oldModule.name + '_root_poser.tx', v)
        except:
            pass

        if updateUI:
            self.updateModulesTree()
        # self.curParents.updateList()

    def renameModule(self, name="", moduleName=""):
        # get new name
        if name == "":
            name = self.inputModuleName(self.curModule.name)
            if not name:
                return
        
        # get current module name
        if moduleName == "":
            moduleName = self.curModule.name
            module = self.curModule
        else:
            module = self.rig.modules[moduleName]

        # set 'l' for symmetry module if not exists
        sym = False
        if module.symmetrical:
            sym = True
            if name.split('_')[0] != 'l':
                name = 'l_' + name

        # rename all nodes
        self.curModule.rename(name)

        # update modules
        self.rig.load_modules()

        # del self.rig.modules[moduleName]
        # self.rig.modules[name] = self.curModule

        # # update parents
        # for m_name in self.rig.modules:
        #     if m_name == self.curModule.name:
        #         continue
        #     m = self.rig.modules[m_name]
        #     p = m.getParent()

        #     if p and moduleName in p:
        #         if moduleName == p[:len(moduleName)]:  # if module name in the start of the word
        #             new_p = p.replace(moduleName, name)
        #             utils.setUserAttr(m.name + "_mod", "parent", new_p)
        #     m.parent = m.getParent()

        # update ui
        self.updateModulesTree()
        self.updateModulePage(name)
        self.addControls_updateTree()
        self.twistClass.updateList()
        self.curParents.updateList()

        self.selectModuleInList(name)

        # rename mirrored module for manual renaming
        if sym:
            self.renameModule('r' + name[1:], 'r' + moduleName[1:])
            # self.selectModuleInList(utils.getOppositeObject(self.curModule.name))

    def rebuildModule(self, options={}, moduleType=""):
        sel = cmds.ls(sl=1)

        # get children
        children = {}
        for m_name in self.rig.modules:
            m = self.rig.modules[m_name]
            if self.curModule.name == utils.getModuleName(m.parent):
                children[m_name] = [m.parent, m, m.isSnapped()]

        # save data
        curModuleData = self.curModule.getData()
        m_name = self.curModule.name

        if moduleType != "":
            curModuleData['type'] = moduleType

        # get oss data from every module
        connectedParentsData = []
        for mod_name in self.rig.modules:
            mod = self.rig.modules[mod_name]
            # if not current module
            if mod.name != self.curModule.name:
                # check oss data
                mData = mod.getData()
                for pData in mData['parents']:
                    for mod_target in pData['targetModules']:
                        # if any target from current module
                        if mod_target == self.curModule.name:
                            # add os data to list
                            connectedParentsData.append(pData)

        # get options data from every module
        connectedOptions = []
        for mod_name in self.rig.modules:
            mod = self.rig.modules[mod_name]
            # if not current module
            if mod.name != self.curModule.name:
                # check oss data
                mData = mod.getOptions()
                if mData:
                    for d in mData:
                        obj = mData[d]
                        if cmds.objExists(obj):
                            if utils.getModuleName(obj) == self.curModule.name:
                                connectedOptions.append([mod.name, d, mData[d]])

        # delete connected oss
        for data in connectedParentsData:
            # print "need to remove data", data
            self.curParents.os_deleteConstraint(data=data)

        # delete module
        self.deleteModule(updateUI=False)

        # create module
        if options == {}:
            options = curModuleData['optionsData']

        self.addModule(curModuleData['type'], m_name, options,
                       updateUI=False)  # , nodePosition=curModuleData['nodePosition'])

        # connect module root
        if curModuleData['parent']:
            parent = utils.getRealNameFromTemplated(m_name, curModuleData['parent'])
            self.connectModule(parent, updateUI=False)

        # set snapParent attribute
        if curModuleData['snapped']:
            self.curModule.snapToParent(True)

        # set module paraneters
        # hier = self.win.actionPosers_Hierarhy.isChecked()
        # self.action_posersHierarhy(False)
        self.curModule.setData(curModuleData)
        # self.action_posersHierarhy(hier)

        self.setAddControlsData(curModuleData)

        # make symmetry module if needed
        if curModuleData['symmetrical']:
            self.makeSymmetryModule()

        # reconnect children
        for m_name in children:
            if utils.getObjectSide(m_name) != 'r':
                self.connectModule(children[m_name][0], m_name)
                # snapping
                if children[m_name][2]:
                    m = children[m_name][1]
                    m.snapToParent(True)

        # make parents
        for data in curModuleData['parents']:
            if len(data['intNames']) > 0:
                self.curParents.os_makeConstraint(data)

        # remake parents in modules, where exists targets from current module
        for data in connectedParentsData:
            self.curParents.os_makeConstraint(data)

        # twists
        for twData in curModuleData['twistsData']:
            twist.Twist(self.win).twists_add(twData, self.curModule.name)

        # set to old seleted mudule and update ui
        self.curModule = self.rig.modules[self.curModule.name]
        self.updateModulesTree()
        self.addControls_updateTree()

        # self.curModule.node.switch_joints(True)

        # if not self.curModule.node.jointsOn:
        # self.curModule.node.switch_joints(False)

        # reselect
        if len(sel) > 0:
            try:
                cmds.select(sel)
            except:
                cmds.select(clear=1)
        else:
            cmds.select(clear=1)

    def replaceModule(self, moduleType):


        sel = cmds.ls(sl=1)

        # get children
        children = {}
        for m_name in self.rig.modules:
            m = self.rig.modules[m_name]
            if self.curModule.name == utils.getModuleName(m.parent):
                children[m_name] = [m.parent, m, m.isSnapped()]

        # save data
        curModuleData = self.curModule.getData()
        m_name = self.curModule.name

        # get oss data from every module
        connectedParentsData = []
        for mod_name in self.rig.modules:
            mod = self.rig.modules[mod_name]
            # if not current module
            if mod.name != self.curModule.name:
                # check oss data
                mData = mod.getData()
                for pData in mData['parents']:
                    for mod_target in pData['targetModules']:
                        # if any target from current module
                        if mod_target == self.curModule.name:
                            # add os data to list
                            connectedParentsData.append(pData)

        # get options data from every module
        connectedOptions = []
        for mod_name in self.rig.modules:
            mod = self.rig.modules[mod_name]
            # if not current module
            if mod.name != self.curModule.name:
                # check oss data
                mData = mod.getOptions()
                if mData:
                    for d in mData:
                        obj = mData[d]
                        if cmds.objExists(obj):
                            if utils.getModuleName(obj) == self.curModule.name:
                                connectedOptions.append([mod.name, d, mData[d]])

        # delete connected oss
        for data in connectedParentsData:
            # print "need to remove data", data
            self.curParents.os_deleteConstraint(data=data)

        # save curModule name for returning to it
        oldCurModuleName = self.curModule.name

        # delete module
        self.deleteModule(updateUI=False)

        # create module
        self.addModule(moduleType, m_name)

        # connect module root
        if curModuleData['parent']:
            parent = utils.getRealNameFromTemplated(m_name, curModuleData['parent'])
            self.connectModule(parent, updateUI=False)

        # set snapParent attribute
        if curModuleData['snapped']:
            self.curModule.snapToParent(True)

        # set module paraneters
        self.curModule.setData(curModuleData)

        self.setAddControlsData(curModuleData)

        # make symmetry module if needed
        if curModuleData['symmetrical']:
            self.makeSymmetryModule()

        # reconnect children
        for m_name in children:
            if utils.getObjectSide(m_name) != 'r':
                self.connectModule(children[m_name][0], m_name)
                # snapping
                if children[m_name][2]:
                    m = children[m_name][1]
                    m.snapToParent(True)

        # make parents
        for data in curModuleData['parents']:
            if len(data['intNames']) > 0:
                self.curParents.os_makeConstraint(data)

        # remake parents in modules, where exists targets from current module
        for data in connectedParentsData:
            self.curParents.os_makeConstraint(data)

        # twists
        for twData in curModuleData['twistsData']:
            twist.Twist(self.win).twists_add(twData, self.curModule.name)

        # set to old seleted mudule and update ui
        self.curModule = self.rig.modules[self.curModule.name]
        self.updateModulesTree()
        self.addControls_updateTree()

        # reselect
        if len(sel) > 0:
            try:
                cmds.select(sel)
            except:
                cmds.select(clear=1)
        else:
            cmds.select(clear=1)

    def moduleToggleLRA(self):
        self.curModule.toggleLRA()

    def moduleToggleVis(self):


        state = cmds.getAttr(self.curModule.name + "_mod.v")

        cmds.setAttr(self.curModule.name + "_mod.v", not state)

        opp_mod = utils.getOppositeObject(self.curModule.name + "_mod")
        if cmds.objExists(opp_mod):
            cmds.setAttr(opp_mod + ".v", not state)

        self.updateModulesTree()

    def moduleSolo(self):


        state = cmds.getAttr(self.curModule.name + "_mod.v")

        otherVis = False
        for m_name in self.rig.modules:
            if m_name == self.curModule.name:
                continue
            if cmds.getAttr(m_name + "_mod.v"):
                otherVis = True
                break

        if state:
            if otherVis:
                for m_name in self.rig.modules:
                    cmds.setAttr(m_name + "_mod.v", 0)
                cmds.setAttr(self.curModule.name + "_mod.v", 1)

            else:
                for m_name in self.rig.modules:
                    cmds.setAttr(m_name + "_mod.v", 1)
                cmds.setAttr(self.curModule.name + "_mod.v", 0)

        else:
            for m_name in self.rig.modules:
                cmds.setAttr(m_name + "_mod.v", 0)
            cmds.setAttr(self.curModule.name + "_mod.v", 1)

        # opp_mod = utils.getOppositeObject(self.curModule.name+"_mod")
        # if cmds.objExists(opp_mod):
        # cmds.setAttr(opp_mod+".v", not state)

        self.updateModulesTree()

    def moduleToggle_posersAxises(self, module=None, state=None):
        if module:
            module.toggle_posersAxises(state)
        else:
            self.curModule.toggle_posersAxises()

    def updateFacePage(self):
        i = self.win.sections_listWidget.currentRow()
        self.win.face_stackedWidget.setCurrentIndex(i)




    """ Additional Controls """

    def additionalControl_add(self, shape, name=""):
        sel = cmds.ls(sl=1)

        if len(sel) != 1:
            cmds.warning("Select one control")
            return

        parent = sel[0]
        if not utils.objectIsControl(parent) and not utils.objectIsAdditionalControl(parent):
            cmds.warning("Select one control")
            return

        if name == "":
            name, ok = QtWidgets.QInputDialog().getText(self.win, 'Create Additional Control', 'Enter control name:',
                                                        QtWidgets.QLineEdit.Normal, 'ctrl')

            # remove spaces
            if ok and name != "":
                if " " in name or "-" in name or name[0].isdigit():
                    QtWidgets.QMessageBox.information(self.win, "Warning", "Wrong Name.")
                    return
                if cmds.objExists(name):
                    QtWidgets.QMessageBox.information(self.win, "Warning", "Object with this name is exist.")
                    return
            else:
                return

        # get module of the target and add control to it
        m = self.rig.modules[utils.getModuleName(parent)]

        m.addAdditionalControl(name, parent, shape)

        self.curModule = m

        self.addControls_updateTree()
        self.updateModulePage(self.curModule.name)

        # select item
        item = \
        self.win.additionalControls_treeWidget.findItems(name, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
        self.win.additionalControls_treeWidget.setCurrentItem(item)

    def addControls_updateTree(self):


        # clear old data
        self.win.additionalControls_treeWidget.clear()
        # self.curModule.getAdditionalControls()
        # print self.curModule.getAdditionalControls()

        # if self.curModule.additionalControls == []: return

        # update and sort add controls list
        # self.curModule.getAdditionalControls()

        # fill modules list widget
        for m_name in self.rig.modules:
            m = self.rig.modules[m_name]
            for c in m.getAdditionalControls():
                name = c.name
                # print name, c.parent
                if c.parent == "":
                    item = QtWidgets.QTreeWidgetItem([name])
                    self.win.additionalControls_treeWidget.addTopLevelItem(item)

                elif int(c.deep) == 0:
                    parents = self.win.additionalControls_treeWidget.findItems(c.parent,
                                                                               QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                                               0) or []
                    if len(parents) > 0:
                        parent_item = parents[0]
                    else:
                        parent_item = QtWidgets.QTreeWidgetItem([c.parent])
                        self.win.additionalControls_treeWidget.addTopLevelItem(parent_item)
                        parent_item.setForeground(0, QtGui.QBrush(QtGui.QColor("#6C6B6B")))

                    item = QtWidgets.QTreeWidgetItem([name])
                    parent_item.addChild(item)

                else:
                    parents = self.win.additionalControls_treeWidget.findItems(c.parent,
                                                                               QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                                               0) or []
                    if len(parents) > 0:
                        parent = parents[0]
                        item = QtWidgets.QTreeWidgetItem([name])
                        parent.addChild(item)

                if c.isMirrored():
                    item.setForeground(0, QtGui.QBrush(QtGui.QColor("#6C6B6B")))

        # if current module is exist, get this item and select it, or disable module page
        # self.curAddControlName = tempName
        # try:
        # oldCurItem = self.win.additionalControls_treeWidget.findItems(self.curAddControlName,QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
        # self.win.additionalControls_treeWidget.setCurrentItem(oldCurItem)
        # except: pass #self.win.module_frame.setEnabled(False)

        self.win.additionalControls_treeWidget.expandAll()

    def addControls_updatePage(self, nameOrItem, reset=False):


        if type(nameOrItem).__name__ == "NoneType":
            return

        # name
        if type(nameOrItem) is QtWidgets.QTreeWidgetItem:
            self.curAddControlName = nameOrItem.text(0)
        else:
            self.curAddControlName = nameOrItem

        cur_m_name = utils.getModuleName(self.curAddControlName)
        cur_m = self.rig.modules[cur_m_name]
        self.curAddControl = cur_m.getAdditionalControlInstance(self.curAddControlName)

        # update attrs
        if self.curAddControl == None:
            self.win.addControl_frame.setEnabled(False)
            self.win.addControlName_lineEdit.setText("")
            self.win.addControlParent_lineEdit.setText("")
        elif self.curAddControl.isMirrored():
            self.win.addControl_frame.setEnabled(False)
            self.win.addControlName_lineEdit.setText(self.curAddControl.name)
            self.win.addControlParent_lineEdit.setText(self.curAddControl.parent)
        else:
            self.win.addControl_frame.setEnabled(True)
            self.win.addControlName_lineEdit.setText(self.curAddControl.name)
            self.win.addControlParent_lineEdit.setText(self.curAddControl.parent)
            self.win.addControlSymmetry_btn.setEnabled(not self.curAddControl.symmetrical)

        # if cmds.objExists(self.curAddControlName):
        # cmds.select(self.curAddControlName)

    def addControls_selectRoot(self):


        if self.curAddControl != None:
            cmds.select(self.curAddControl.name + '_addPoser')

    def addControls_renameControl(self, newName="", moduleName=""):


        if newName == "":
            newName, ok = QtWidgets.QInputDialog().getText(self.win, 'Rename Add Control', 'Enter control name:',
                                                           QtWidgets.QLineEdit.Normal, self.curAddControl.name)

        # remove spaces
        if ok and newName != "":
            newName = newName.replace(" ", "_")
        else:
            return

        # add left side prefix
        if self.curAddControl.symmetrical:
            if newName.split('_')[0] != 'l':
                newName = 'l_' + newName

        if cmds.objExists(newName):
            QtWidgets.QMessageBox.information(self.win, "Warning", "Object with this name is exist.")
            cmds.select(newName)
            return

        # rename
        self.curAddControl.rename(newName)
        self.addControls_updateTree()

        # select in tree
        newCurItem = \
        self.win.additionalControls_treeWidget.findItems(newName, QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[
            0]
        self.win.additionalControls_treeWidget.setCurrentItem(newCurItem)

    def addControls_deleteControl(self):


        if not self.curAddControlName:
            # cmds.warning("Select addtional control from list")
            return

        cur_m_name = utils.getModuleName(self.curAddControlName)
        cur_m = self.rig.modules[cur_m_name]
        curAddControl = cur_m.getAdditionalControlInstance(self.curAddControlName)

        # curAddControl = self.curModule.getAdditionalControlInstance(self.curAddControlName)
        if curAddControl.symmetrical:
            opp_module = self.rig.getMirroredModule(cur_m)
            if opp_module:
                oppAddControl = opp_module.getAdditionalControlInstance(utils.getOppositeObject(self.curAddControlName))
            else:
                oppAddControl = cur_m.getAdditionalControlInstance(utils.getOppositeObject(self.curAddControlName))
            oppAddControl.delete()
        curAddControl.delete()

        self.addControls_updateTree()
        self.updateModulePage(self.curModule.name)
        self.win.addControl_frame.setEnabled(False)
        self.win.addControlName_lineEdit.setText("")
        self.win.addControlParent_lineEdit.setText("")

    def addControls_duplicate(self, child=False, inputName=None):
        if not self.curAddControlName:
            cmds.warning("Select addtional control from list")
            return
        cur_m_name = utils.getModuleName(self.curAddControlName)
        cur_m = self.rig.modules[cur_m_name]

        curAddControl = cur_m.getAdditionalControlInstance(self.curAddControlName)

        # if curAddControl.symmetrical:
        # opp_module = self.rig.getMirroredModule(self.curModule)
        # oppAddControl = opp_module.getAdditionalControlInstance(utils.getOppositeObject(self.curAddControlName))
        # oppAddControl.delete()

        # print curAddControl.parent, curAddControl.mirrored, curAddControl.symmetrical

        def getChildren(ctrl):
            children = ctrl.getChildrenConrollers()
            all_children = children
            for child_name in children:
                child = cur_m.getAdditionalControlInstance(child_name)
                for c in getChildren(child):
                    if c not in all_children:
                        all_children.append(c)

            return children

        def duplicate(source_control, parent):
            pos = cmds.xform(source_control.name, q=1, m=1, ws=1)
            shape_cmd = source_control.makePythonCommand()
            source_p = source_control.name + '_addPoser'
            p = self.curAddControlName + '_addPoser'

            if inputName:
                name = inputName
            else:
                name = utils.incrementNameIfExists(source_control.name)
            # print source_control.name, name

            # get module of the target and add control to it
            m = self.rig.modules[utils.getModuleName(source_control.parent)]

            # create new add control
            ctrl = m.addAdditionalControl(name, parent)

            ctrl.replaceShape(shape_cmd)
            ctrl.setColor(source_control.colorId)
            # ctrl.setParent(parent)

            self.curAddControlName = ctrl.name

            # correct parent for addPoser
            if utils.objectIsAdditionalControl(parent):
                if cmds.listRelatives(ctrl.name + "_addPoser", p=1)[0] != parent + "_addPoser":
                    cmds.parent(ctrl.name + "_addPoser", parent + "_addPoser")
            else:
                if cmds.listRelatives(ctrl.name + "_addPoser", p=1)[0] != m.name + "_mainPoser":
                    cmds.parent(ctrl.name + "_addPoser", m.name + "_mainPoser")

            # set position
            cmds.xform(self.curAddControlName + '_addPoser', m=pos, ws=1)

            # set attributes
            for attr in utils.getVisibleAttrs(source_p):
                if attr in ["translateX", "translateY", "translateZ", "rotateX", "rotateY", "rotateZ"]:
                    continue
                value = cmds.getAttr(source_p + "." + attr)
                try:
                    cmds.setAttr(self.curAddControlName + '_addPoser.' + attr, value)
                # print "set", p+'.'+attr, value
                except:
                    pass

            return ctrl

        controls = []
        controls.append(self.curAddControlName)
        controls += getChildren(curAddControl)

        if len(controls) > 1:
            child = False

        new_controls = []
        for i, c_name in enumerate(controls):
            c = cur_m.getAdditionalControlInstance(c_name)
            # print c, c.parent		
            if i == 0:
                # print c.name, c.parent
                if child:
                    new_c = duplicate(c, c.name)
                    cmds.setAttr(new_c.name + "_addPoser.s", 1, 1, 1)
                else:
                    new_c = duplicate(c, c.parent)
            else:
                # print c.name, new_controls[i-1]
                new_c = duplicate(c, new_controls[i - 1])
            cmds.setAttr(new_c.name + "_joint.radius", cmds.getAttr(c.name + "_joint.radius"))
            new_controls.append(new_c.name)

        self.addControls_updateTree()
        self.updateModulePage(self.curModule.name)

        # select item
        self.curAddControlName = new_controls[0]
        item = self.win.additionalControls_treeWidget.findItems(self.curAddControlName,
                                                                QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive, 0)[0]
        self.win.additionalControls_treeWidget.setCurrentItem(item)

    def addControls_mirrorControl(self, curAddControl=None):
        sel = cmds.ls(sl=1)

        if curAddControl:
            m_name = utils.getModuleName(curAddControl.name)
            m = self.rig.modules[m_name]
        else:
            # curAddControl = self.curModule.getAdditionalControlInstance(self.curAddControlName)
            # m = self.curModule

            cur_m_name = utils.getModuleName(self.curAddControlName)
            m = self.rig.modules[cur_m_name]
            curAddControl = m.getAdditionalControlInstance(self.curAddControlName)

        # get parent symmetry add control
        opp_par = utils.getOppositeObject(curAddControl.parent)
        if curAddControl.parent == opp_par:
            commonParent = True
        else:
            commonParent = False

        if not cmds.objExists(opp_par):
            cmds.warning("Opposite parent is not exists")
            return

        # rename if needed
        if curAddControl.name.split('_')[0] != 'l':
            newName = 'l_' + curAddControl.name
            while cmds.objExists(newName):
                newName = utils.incrementName(newName)

            for c in m.additionalControls:
                if c != curAddControl:
                    if c.parent == curAddControl.name:
                        c.parent = newName

            curAddControl.rename(newName)

        # get cur addControl data 
        data = curAddControl.getData()
        # source_root = data['root']

        parentIsMirroredControl = data['parent'].split("_")[0] == 'l' and cmds.objExists("r" + data['parent'][1:])

        # set opp data
        # print 00000, data['name'], data['root'], data['parent']
        data['name'] = utils.getOppositeObject(data['name'])
        # data['root'] = utils.getOppositeObject(data['root'])
        data['parent'] = utils.getOppositeObject(data['parent'])
        data['poserParent'] = utils.getOppositeObject(data['poserParent'])
        # print 111111, data['name'], data['root'], data['parent'], data['poserParent']

        # add opp add control
        mirrored_module = self.rig.getMirroredModule(m)

        if mirrored_module:
            mirroredControl = mirrored_module.addAdditionalControl(data=data)

            # set shape
            mirroredControl.replaceShape(data['shape'])

            # connect posers
            # comp = cmds.createNode('composeMatrix', n=mirroredControl.root+'_compMat')
            # cmds.setAttr(comp+'.inputScaleX', -1)
            # utils.connectByMatrix(mirroredControl.name+'_addPoser', [curAddControl.name+'_addPoser', curAddControl.name+'_addPoser', comp], ['worldMatrix[0]', 'parentInverseMatrix[0]', 'outputMatrix'])
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.tx', mirroredControl.name + '_addPoser.tx')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.ty', mirroredControl.name + '_addPoser.ty')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.tz', mirroredControl.name + '_addPoser.tz')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.rx', mirroredControl.name + '_addPoser.rx')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.ry', mirroredControl.name + '_addPoser.ry')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.rz', mirroredControl.name + '_addPoser.rz')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.sx', mirroredControl.name + '_addPoser.sx')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.sy', mirroredControl.name + '_addPoser.sy')
            except:
                pass
            try:
                cmds.connectAttr(curAddControl.name + '_addPoser.sz', mirroredControl.name + '_addPoser.sz')
            except:
                pass

        # if not commonParent:
        # cmds.connectAttr(curAddControl.name+'_group.tx', mirroredControl.name+'_group.tx', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.ty', mirroredControl.name+'_group.ty', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.tz', mirroredControl.name+'_group.tz', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.rx', mirroredControl.name+'_group.rx', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.ry', mirroredControl.name+'_group.ry', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.rz', mirroredControl.name+'_group.rz', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.sx', mirroredControl.name+'_group.sx', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.sy', mirroredControl.name+'_group.sy', f=1)
        # cmds.connectAttr(curAddControl.name+'_group.sz', mirroredControl.name+'_group.sz', f=1)
        else:
            mirroredControl = m.addAdditionalControl(data=data)
            # set shape
            mirroredControl.replaceShape(data['shape'])

            # connect opposite poser
            comp = cmds.createNode('composeMatrix', n=curAddControl.name + '_mirror_compMat')
            if commonParent:
                cmds.setAttr(comp + '.inputScaleX', -1)
            comp2 = cmds.createNode('composeMatrix', n=curAddControl.name + '_pre_mirror_compMat')
            if parentIsMirroredControl and m.symmetrical:
                cmds.setAttr(comp2 + '.inputScaleX', -1)
            # print 111, comp, cmds.getAttr(comp+'.inputScaleX')
            utils.connectByMatrix(mirroredControl.name + '_addPoser', [comp2, curAddControl.name + '_addPoser', comp],
                                  ['outputMatrix', 'matrix', 'outputMatrix'], m.name)

        # if cmds.getAttr(mirroredControl.name+'_addPoser.sz') < 0:
        # mult = cmds.createNode("multDoubleLinear", n=mirroredControl.name+'_addPoserPositiveScaleMult')
        # cmds.setAttr(mult+".input2", -1)
        # cmds.connectAttr(mirroredControl.name+'_addPoser_decMat.outputScaleZ', mult+".input1")
        # cmds.connectAttr(mult+".output", mirroredControl.name+'_addPoser.sz', f=1)

        # set mirror attr 
        # if utils.objectIsAdditionalControl(data['parent']):
        # if parentIsMirroredControl:
        # cmds.setAttr(curAddControl.name+"_mirror_compMat.inputScaleX", 1)	

        # else:
        # cmds.setAttr(curAddControl.name+"_mirror_compMat.inputScaleX", -1)				

        cmds.hide(mirroredControl.name + '_addPoser')

        cmds.setAttr(mirroredControl.name + "_joint.radius", cmds.getAttr(curAddControl.name + "_joint.radius"))

        # connect shapes
        curveShapes = cmds.listRelatives(mirroredControl.name, children=True, path=True, type='nurbsCurve')

        for c in curveShapes:
            opp_c = utils.getOppositeObject(c)
            if not cmds.isConnected(opp_c + ".worldSpace[0]", c + ".create"):
                cmds.connectAttr(opp_c + ".worldSpace[0]", c + ".create")

        self.addControls_updateTree()
        self.updateModulePage(self.curModule.name)

        # select left control in addControls tree
        try:
            newCurItem = self.win.additionalControls_treeWidget.findItems(utils.getOppositeObject(mirroredControl.name),
                                                                          QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                                          0)[0]
            self.win.additionalControls_treeWidget.setCurrentItem(newCurItem)
        except:
            pass

        # reselect
        try:
            cmds.select(sel)
        except:
            pass

    def addControls_setParent(self):

        sel = cmds.ls(sl=1)

        if len(sel) == 1:
            target = sel[0]
        else:
            cmds.warning("Select one control")
            return

        if not utils.objectIsControl(target) and not utils.objectIsAdditionalControl(target):
            cmds.warning("Select one control")
            return

        if target == self.curAddControlName:
            cmds.warning("Selected target and control is the same object")
            return

        m_name = utils.getModuleName(self.curAddControlName)
        m = utils.getModuleInstance(m_name)
        curAddControl = m.getAdditionalControlInstance(self.curAddControlName)
        curAddControl.setParent(target)

        # parent addPoser
        if utils.objectIsAdditionalControl(target):
            if cmds.listRelatives(self.curAddControlName + "_addPoser", p=1)[0] != target + "_addPoser":
                cmds.parent(self.curAddControlName + "_addPoser", target + "_addPoser")
        else:
            if cmds.listRelatives(self.curAddControlName + "_addPoser", p=1)[0] != m_name + "_mainPoser":
                cmds.parent(self.curAddControlName + "_addPoser", m_name + "_mainPoser")

        # for opposite control
        if curAddControl.symmetrical:
            oppAddControl = utils.getAdditionalControlInstance(utils.getOppositeObject(self.curAddControlName))
            oppAddControl.setParent(utils.getOppositeObject(target))
            oppositeControl_name = oppAddControl.name
            oppositeTarget_name = utils.getOppositeObject(target)

            # parent addPoser
            if utils.objectIsAdditionalControl(target):
                # print (1111, self.curAddControlName)
                cmds.setAttr(self.curAddControlName + "_mirror_compMat.inputScaleX", 1)
                if cmds.listRelatives(oppositeControl_name + "_addPoser", p=1)[0] != oppositeTarget_name:
                    cmds.parent(oppositeControl_name + "_addPoser", oppositeTarget_name)
            else:
                cmds.setAttr(self.curAddControlName + "_mirror_compMat.inputScaleX", -1)
                if cmds.listRelatives(oppositeControl_name + "_addPoser", p=1)[0] != m_name + "_mainPoser":
                    cmds.parent(oppositeControl_name + "_addPoser", m_name + "_mainPoser")

        self.addControls_updateTree()

        # select table item
        newCurItem = self.win.additionalControls_treeWidget.findItems(self.curAddControlName,
                                                                      QtCore.Qt.MatchExactly | QtCore.Qt.MatchRecursive,
                                                                      0)[0]
        self.win.additionalControls_treeWidget.setCurrentItem(newCurItem)

        cmds.select(sel)

    def addControls_flipOpposite(self, curAddControl=None):
        sel = cmds.ls(sl=1)

        if curAddControl:
            m_name = utils.getModuleName(curAddControl.name)
            m = self.rig.modules[m_name]
        else:
            cur_m_name = utils.getModuleName(self.curAddControlName)
            m = self.rig.modules[cur_m_name]
            curAddControl = m.getAdditionalControlInstance(self.curAddControlName)

        opp_control = utils.getOppositeObject(curAddControl.name)

        if not cmds.objExists(opp_control) or curAddControl.name == opp_control:
            cmds.warning("Opposite parent is not exists")
            return

        p = pm.PyNode(opp_control + '_addPoser')
        dec = p.tx.inputs()[0]
        mm = dec.inputMatrix.inputs()[0]
        mir_mat = mm.matrixIn[2].inputs()[0]

        v = mir_mat.inputScaleX.get()
        if v == 1:
            v = -1
        elif v == -1:
            v = 1

        mir_mat.inputScaleX.set(v)




    """ Module Controls """

    def controls_switchVis(self, btn, item, sym=False):


        self.modulePageUpdated = False

        ctrl = item.text()

        control = utils.getControlInstance(ctrl)
        control.toggleVisible()

        shapes = cmds.listRelatives(ctrl, shapes=True)

        vis = cmds.getAttr(shapes[0] + '.v')

        if not vis:
            btn.setText('Off')
            item.setFlags(QtCore.Qt.NoItemFlags)
        else:
            btn.setText('On')
            item.setFlags(QtCore.Qt.ItemIsSelectable | QtCore.Qt.ItemIsEnabled | QtCore.Qt.ItemIsEditable)

        if self.curModule.symmetrical:
            ctrl = utils.getOppositeObject(ctrl)
            control = utils.getControlInstance(ctrl)
            control.toggleVisible(manual=True, value=vis)

        self.modulePageUpdated = True

    def controls_selectItem(self, cur, prev):
        try:
            self.curControlItemName = cur.text()
            cmds.select(self.curControlItemName)
        except:
            self.curControlItemName = None

    def controls_changeName(self, item):
        if self.modulePageUpdated:
            self.modulePageUpdated = False

            newCtrlName = item.text()
            oldCtrlName = self.curControlItemName

            if oldCtrlName == newCtrlName:
                self.modulePageUpdated = True
                return

            # correct input name if needed
            if self.curModule.symmetrical and newCtrlName.split('_')[0] != 'l':
                newCtrlName = 'l_' + newCtrlName

            # exit if name is not unique
            if cmds.objExists(newCtrlName):
                cmds.warning("Object with this name is exists")
                item.setText(oldCtrlName)
                self.modulePageUpdated = True
                return

            newCtrlName = newCtrlName.replace(" ", "_")

            if newCtrlName[0].isdigit():
                cmds.warning("Wrong name")
                item.setText(oldCtrlName)
                self.modulePageUpdated = True
                return

            # rename 
            # print "REN", oldCtrlName, newCtrlName
            if cmds.getAttr(oldCtrlName + ".type") == "additionalControl":
                c = utils.getAdditionalControlInstance(oldCtrlName)
                c.rename(newCtrlName)
            else:
                utils.renameControl(oldCtrlName, newCtrlName)

            # rename mirrored moudule control
            if self.curModule.symmetrical:
                utils.renameControl(utils.getOppositeObject(oldCtrlName), utils.getOppositeObject(newCtrlName))

            # update current name in table
            item.setText(newCtrlName)
            self.curControlItemName = newCtrlName

            self.twistClass.updateList()
            self.addControls_updateTree()
            # self.curParents.updateList()
            self.curParents.page_update()

            # rename parents attributes all modules
            # for m in self.rig.modules:
            # if m.parent == oldCtrlName:
            # m.parent = m.parent.replace(oldCtrlName, newCtrlName)
            # m.save()
            # print "END"

            self.modulePageUpdated = True
    



    """ Menu Actions """

    def action_debug(self):
        global configData

        configData['debug'] = self.win.actionDebug.isChecked()

        # save data to file	
        json_string = json.dumps(configData, indent=4)
        with open(self.rootPath + '/config.json', 'w') as f:
            f.write(json_string)

    def action_createNew(self):


        name, ok = QtWidgets.QInputDialog.getText(self.win, "Create Module", "Please enter new module name",
                                                  QtWidgets.QLineEdit.Normal, "")

        if ok:
            name = utils.nameLower(name)
            name = name.replace(' ', '_')
            modules = utils.getModuleFiles()

            if name in modules:
                QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
                return

        else:
            return

        dir_path = self.rootPath + '/modules/' + name

        # create new scene
        mel.eval('NewScene;')
        cmds.file(self.rootPath + '//modules//_template.ma', o=1)
        cmds.file(rename=dir_path + '/' + name + '.ma')

        # create directory and save
        os.makedirs(dir_path)
        cmds.file(save=True, type='mayaAscii')

        # copy needed files
        shutil.copy2(self.rootPath + '/modules/_template.py', dir_path + '/%s.py' % name)
        shutil.copy2(self.rootPath + '/modules/__init__.py', dir_path)
        shutil.copy2(self.rootPath + '/modules/_info.txt', dir_path + '/info.txt')

        # Read class py file
        with open(dir_path + '/%s.py' % name) as file:
            filedata = file.read()

        filedata = filedata.replace('class Template', 'class ' + utils.capitalizeName(name))

        # Write class py file
        with open(dir_path + '/%s.py' % name, 'w') as file:
            file.write(filedata)

        sys.stdout.write("Created new module " + name)

    def action_duplicate(self, sourceName):


        name, ok = QtWidgets.QInputDialog.getText(self.win, "Create Module", "Please enter new module name",
                                                  QtWidgets.QLineEdit.Normal, sourceName)

        if ok:
            name = utils.nameLower(name)
            name = name.replace(' ', '_')
            modules = utils.getModuleFiles()

            if name in modules:
                QtWidgets.QMessageBox.information(self.win, "Warning", "This module is exist.")
                return

        else:
            return

        source_dir_path = self.rootPath + '//modules//' + sourceName
        dir_path = self.rootPath + '/modules/' + name

        # create new scene
        mel.eval('NewScene;')
        m_file = source_dir_path + '//' + sourceName + '.ma'
        cmds.file(m_file, o=1)
        cmds.file(rename=dir_path + '/' + name + '.ma')

        # create directory and save
        os.makedirs(dir_path)
        cmds.file(save=True, type='mayaAscii')

        # copy needed files
        shutil.copy2(source_dir_path + '/' + sourceName + '.py', dir_path + '/' + name + '.py')
        shutil.copy2(self.rootPath + '/modules/__init__.py', dir_path)
        shutil.copy2(self.rootPath + '/modules/_info.txt', dir_path + '/info.txt')

        # Read class py file
        with open(dir_path + '/%s.py' % name) as file:
            filedata = file.read()

        filedata = filedata.replace('class ' + utils.capitalizeName(sourceName), 'class ' + utils.capitalizeName(name))

        # Write class py file
        with open(dir_path + '/%s.py' % name, 'w') as file:
            file.write(filedata)

        sys.stdout.write("Created new module " + name)

    def action_module_edit(self, name):


        mel.eval('NewScene;')
        m_file = self.rootPath + '//modules//' + name + '//' + name + '.ma'
        cmds.file(m_file, o=1)
        # cmds.file( rename=name+'.ma' )
        # cmds.file( save=True, type='mayaAscii' )		

        sys.stdout.write("Created new module " + name)

    def action_about(self):


        def aboutClose():
            self.aboutWin.close()

        self.aboutWin = self.loadUiWidget(self.aboutUiFilePath, parent=self.win)
        self.aboutWin.pushButton.clicked.connect(aboutClose)

        # get version
        with open(self.rootPath + '/versions.txt') as f:
            lines = f.readlines()

        versions = []
        for l in lines:
            if '---Version' in l:
                versions.append(l)

        lastVestion = versions[-1].split('---')[1]

        if not self.full:
            lastVestion += "(trainig version)"

        # write version to ui
        self.aboutWin.label_5.setText(lastVestion)

        # logo
        imagemap = QtGui.QPixmap(self.rootPath + '/icons/rs_logo_about.png')
        self.aboutWin.logo_label.setPixmap(imagemap)

        self.aboutWin.show()

    def action_sets(self):


        global setsWin
        try:
            setsWin.close()
        except:
            pass

        setsWin = self.loadUiWidget(self.setsUiFilePath, parent=self.win)
        self.sets = sets.Sets(setsWin)

        setsWin.show()

    def action_humanIk(self):


        if not self.full:
            QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
            return

        try:
            self.humanIkWin.close()
        except:
            pass

        self.humanIkWin = self.loadUiWidget(self.humanIkUiFilePath, parent=self.win)
        # self.setsWin.pushButton.clicked.connect(aboutClose)
        self.humanIk = humanIk.HumanIk(self)

        self.humanIkWin.show()

    def action_moduleBuilder(self):


        if not self.full:
            QtWidgets.QMessageBox.information(self.win, "Sorry", "This feature is available in full version only.")
            return

        if sys.version[0] == "2":
            import moduleBuilder
            reload(moduleBuilder)
        else:
            import importlib
            import rigStudio3.moduleBuilder as moduleBuilder
            importlib.reload(moduleBuilder)

        try:
            self.moduleBuilderWin.close()
        except:
            pass

        self.moduleBuilderWin = self.loadUiWidget(self.moduleBuilderUiFilePath, parent=self.win)
        self.moduleBuilder = moduleBuilder.ModuleBuilder(self)

        self.moduleBuilderWin.show()

    def action_documentation(self):


        webbrowser.open('https://www.rigstudiomaya.com/documentation')

    def action_tutorials(self):


        webbrowser.open('https://www.rigstudiomaya.com/tutorials')


    #def action_posersAxisesToggle(self):
        #state = self.win.actionPosers_Axises.isChecked()

        #utils.setUserAttr("main", "posersAxises", state, type="bool", lock=True, keyable=False, cb=False)

        #if len(self.rig.modules) == 0:
            #return

        ## state = not cmds.getAttr(self.rig.modules[self.rig.moduleNames[0]].name+'_root_poser.axises')
        #for m_name in self.rig.modules:
            #m = self.rig.modules[m_name]
            #self.moduleToggle_posersAxises(m, state)

    def action_attributes(self):


        if sys.version[0] == "2":
            import rigStudio3.attributes as attributes
            reload(attributes)
        else:
            import importlib
            import rigStudio3.attributes as attributes
            importlib.reload(attributes)

        try:
            self.attributesWin.win.close()
        except:
            pass

        self.attributesWin = attributes.Attributes(self)

    def actionDriven_Groups(self):


        if sys.version[0] == "2":
            import rigStudio3.driver as driver
            reload(driver)
        else:
            import importlib
            import rigStudio3.driver as driver
            importlib.reload(driver)

        try:
            self.driverWin.close()
        except:
            pass

        self.driverWin = self.loadUiWidget(self.driverUiFilePath, parent=self.win)
        self.driver = driver.Driver(self)
        self.driverWin.show()

    def actionAdd_Attribute(self):


        if sys.version[0] == "2":
            import rigStudio3.attributes as attributes
            reload(attributes)
        else:
            import importlib
            import rigStudio3.attributes as attributes
            importlib.reload(attributes)

        try:
            self.addAttrWin.close()
        except:
            pass

        self.addAttrWin = attributes.AddAttribute(self)

