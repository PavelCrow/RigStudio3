import maya.mel as mel
import maya.cmds as cmds
import pymel.core as pm

import os, imp, json, logging, traceback, webbrowser, sys

from importlib import reload
from functools import partial

import maya.OpenMayaUI as OpenMayaUI
import maya.OpenMaya as om

from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
from shiboken2 import wrapInstance

# fileName = __name__.split('.')[0]
# rootPath = os.path.abspath(imp.find_module(fileName)[1])

# script_path = rootPath + '/rigTools/pk_makeControls.mel'
# mel.eval( 'source "' + script_path.replace('\\', '/') + '"')
print("init")

debug = False

from . import main#, module, utils, rig, parents, twist, sets, attributes, tools, moduleBuilder, inbetweens, driver


# reload(module)
# reload(utils)
# reload(rig)
# reload(twist)
# reload(inbetweens)
# # reload(additionalControl)
# # reload(controller)
# reload(parents)
# reload(attributes)
# reload(tools)
# # reload(rigTools)
# reload(sets)
# # reload(humanIk)
# reload(moduleBuilder)
# reload(driver)
reload(main)

main.run()

