# --------------------------------------------------------------
# Program Name: Rig Studio
# Description: A Python-based tool for Autodesk Maya designed to create procedural rigs.
#
# Author: Pavel Korolev
# Creation Date: 29.01.2022
# Last Updated: 02.12.2024
#
# License: Portions of the Rig Studio codebase are distributed under the MIT License and are freely available for use.
# However, access to closed modules and the full version of the program requires purchasing a commercial license.
# All rights to the proprietary part of the program are reserved by the author.
#
# Dependencies:
# - Python version 3.7.7
# - Autodesk Maya version 2022
# - Installed modules: PyMEL
#
# Usage:
# - The program is intended for creating procedural rigs in Maya.
# - Detailed documentation: rigstudio.ru (Currently unavailable).
#
# Contact for feedback:
# Email: pavel.crow@gmail.com
# Website: rigstudio.ru
#
# This software is licensed under the terms of the LICENSE file.
# © 2024 Pavel Korolev. All rights reserved.
#
# --------------------------------------------------------------
#
# Python commamd:
# import rigStudio3
# rigStudio3.run()

import os, json, sys
import maya.cmds as cmds
from importlib import reload
import maya.OpenMayaUI as OpenMayaUI

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance


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

