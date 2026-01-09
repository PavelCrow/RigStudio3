# --------------------------------------------------------------
# Program Name: Rig Studio
# Description: A Python-based tool for Autodesk Maya designed to create procedural rigs.
#
# Author: Pavel Korolev
# Creation Date: 29.01.2022
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
# Course: https://boosty.to/pavelcrow
#
# This software is licensed under the terms of the LICENSE file.
# © 2024 Pavel Korolev. All rights reserved.
#
# --------------------------------------------------------------
#
# Python commamd:
# import rigStudio3
# rigStudio3.run()

import os
from importlib import reload

rootPath = os.path.normpath(os.path.dirname(__file__))
# if os.path.exists(os.path.join(rootPath, "main.py")):
from . import ui, utils, main, rig, module, parents, twist, tools, moduleBuilder, inbetweens, driver, template, attributes, sets, controller, additionalControl, posers
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
# reload(check)

# else:
#     from rigStudio3 import utils
#     main = utils.import_pyc("main")


def run():
    global rs_win
    try:
        import rigStudio3
        rigStudio3.rs_win.win.close()
        rigStudio3.rs_win.win.deleteLater()
    except:
        pass
    rs_win = main.MainWindow()

