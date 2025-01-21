import maya.cmds as cmds

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
    from PySide2.QtWidgets import QAction
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance
    from PySide6.QtGui import QAction



class ActionClass(QAction):
    def __init__(self, win=None):
        super().__init__(win)

    # m = self.parentWidget()
    # print m

    # self.activate(QAction.Hover)

    # ev = EventFilterClass()
    # self.installEventFilter(ev)

# def hovered(self):
# super(ActionClass, self).hovered()
# print 111

# def eventFilter(self, widget, event):
# pos = QtGui.QCursor.pos()
# print event.type()
# def mouseMoveEvent(self, event):
# print event.type()

