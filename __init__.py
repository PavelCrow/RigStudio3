import os, json, sys
from importlib import reload
import maya.OpenMayaUI as OpenMayaUI
from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

# fileName = __name__.split('.')[0]
# rootPath = os.path.abspath(imp.find_module(fileName)[1])
# script_path = rootPath + '/rigTools/pk_makeControls.mel'
# mel.eval( 'source "' + script_path.replace('\\', '/') + '"')
import sys
# print (sys.version)

# print("init")

from . import ui, main, utils, rig, module, parents, twist, tools, moduleBuilder, inbetweens, driver, template, attributes, sets, controller, additionalControl, posers
reload(ui)
reload(utils)
reload(module)
reload(rig)
reload(twist)
reload(inbetweens)
reload(parents)
reload(attributes)
reload(tools)
reload(sets)
reload(moduleBuilder)
reload(driver)
reload(template)
reload(controller)
reload(additionalControl)
reload(posers)
reload(main)

def run():
    global rs_win
    try:
        import rigStudio3
        rigStudio3.rs_win.win.close()
        rigStudio3.rs_win.win.deleteLater()
    except:
        pass
    rs_win = main.MainWindow()

