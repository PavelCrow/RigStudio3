import maya.cmds as cmds
version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance

class GroupLabel(QtWidgets.QLabel):
    def __init__(self, label_widget, groupFrame, layout, win=None):
        super().__init__()

        self.on = True
        self.setText(label_widget.text())
        self.setAlignment(QtCore.Qt.AlignHCenter)
        self.groupFrame = groupFrame
        self.win = win

        layout.insertWidget(0, self)
        label_widget.setVisible(False)

    def mousePressEvent(self, QMouseEvent):
        self.on = not self.on
        self.groupFrame.setVisible(self.on)

        if self.groupFrame.objectName() == "controls_groupFrame":
            if self.on:
                self.win.moduleOptions_dummy_label.setVisible(False)
            else:
                self.win.moduleOptions_dummy_label.setVisible(True)