# -*- coding: utf-8 -*-

# Form implementation generated from reading ui file 'F:\Maya_Projects\pk_rigTools\pk_rig_ui\hand_widget.ui'
#
# Created: Mon Jan 02 20:36:52 2017
#      by: pyside-uic 0.2.14 running on PySide 1.1.1
#
# WARNING! All changes made in this file will be lost!

from PySide import QtCore, QtGui

class Ui_Dialog(object):
    def setupUi(self, Dialog):
        Dialog.setObjectName("Dialog")
        Dialog.resize(307, 220)
        self.verticalLayout = QtGui.QVBoxLayout(Dialog)
        self.verticalLayout.setObjectName("verticalLayout")
        self.checkBox_2 = QtGui.QCheckBox(Dialog)
        self.checkBox_2.setObjectName("checkBox_2")
        self.verticalLayout.addWidget(self.checkBox_2)
        self.frame_3 = QtGui.QFrame(Dialog)
        self.frame_3.setFrameShape(QtGui.QFrame.NoFrame)
        self.frame_3.setFrameShadow(QtGui.QFrame.Raised)
        self.frame_3.setObjectName("frame_3")
        self.horizontalLayout_5 = QtGui.QHBoxLayout(self.frame_3)
        self.horizontalLayout_5.setContentsMargins(8, -1, -1, -1)
        self.horizontalLayout_5.setObjectName("horizontalLayout_5")
        self.label_7 = QtGui.QLabel(self.frame_3)
        self.label_7.setObjectName("label_7")
        self.horizontalLayout_5.addWidget(self.label_7)
        self.radioButton_6 = QtGui.QRadioButton(self.frame_3)
        self.radioButton_6.setChecked(False)
        self.radioButton_6.setObjectName("radioButton_6")
        self.horizontalLayout_5.addWidget(self.radioButton_6)
        self.radioButton_5 = QtGui.QRadioButton(self.frame_3)
        self.radioButton_5.setObjectName("radioButton_5")
        self.horizontalLayout_5.addWidget(self.radioButton_5)
        self.radioButton_4 = QtGui.QRadioButton(self.frame_3)
        self.radioButton_4.setChecked(True)
        self.radioButton_4.setObjectName("radioButton_4")
        self.horizontalLayout_5.addWidget(self.radioButton_4)
        self.verticalLayout.addWidget(self.frame_3)
        spacerItem = QtGui.QSpacerItem(20, 40, QtGui.QSizePolicy.Minimum, QtGui.QSizePolicy.Expanding)
        self.verticalLayout.addItem(spacerItem)

        self.retranslateUi(Dialog)
        QtCore.QMetaObject.connectSlotsByName(Dialog)

    def retranslateUi(self, Dialog):
        Dialog.setWindowTitle(QtGui.QApplication.translate("Dialog", "Dialog", None, QtGui.QApplication.UnicodeUTF8))
        self.checkBox_2.setText(QtGui.QApplication.translate("Dialog", "Use Scale", None, QtGui.QApplication.UnicodeUTF8))
        self.label_7.setText(QtGui.QApplication.translate("Dialog", "Fingers      ", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButton_6.setText(QtGui.QApplication.translate("Dialog", "3", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButton_5.setText(QtGui.QApplication.translate("Dialog", "4", None, QtGui.QApplication.UnicodeUTF8))
        self.radioButton_4.setText(QtGui.QApplication.translate("Dialog", "5", None, QtGui.QApplication.UnicodeUTF8))

