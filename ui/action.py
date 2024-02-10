from PySide2 import QtWidgets

class ActionClass(QtWidgets.QAction):
    def __init__(self, win=None):
        super().__init__(win)

    # m = self.parentWidget()
    # print m

    # self.activate(QtWidgets.QAction.Hover)

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

