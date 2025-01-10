import maya.cmds as cmds
import maya.mel as mel
import os, imp
		   
# update shelf icons ---------------------- 

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1]).split(fileName+".py")[0]
		
def onMayaDroppedPythonFile(self):
	pass
	
mel.eval('global string $gShelfTopLevel;')
shelf = mel.eval('string $currentShelf = `tabLayout -query -selectTab $gShelfTopLevel`;')
mel.eval('setParent $currentShelf;')

s_name = "RigStudio3"
name = "RigStudio3"
com = "import rigStudio3; rigStudio3.run();"

cmds.shelfButton(style='iconAndTextVertical', command=com, image1=rootPath+'/icons/rs_icon.png', annotation=s_name,  sourceType="python", commandRepeatable=True, parent=shelf)
