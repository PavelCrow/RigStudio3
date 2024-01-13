import maya.cmds as cmds
import maya.mel as mel
import os, imp, sys

# key - script name, value - start function
scripts = [
			{
			"script_name" : "rigStudio2",
			"function" : "main.run()",
			"icon" : "rs",
			"icon_name" : "RS"
		   },			
		   {
			"script_name" : "rigStudio_picker.picker",
			"function" : "main.run(edit=True)",
			"icon" : "rs",
			"icon_name" : "Pkr E"
		   },
		   {
			"script_name" : "rigStudio_picker.picker",
			"function" : "main.run()",
			"icon" : "rs",
			"icon_name" : "Pkr A"
		   }
          ]

		   
# update shelf icons ---------------------- 

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1]).split(fileName+".py")[0]

# get version
with open(rootPath+'/versions.txt') as f:
	lines = f.readlines()

versions = []
for l in lines:
	if '---Version' in l:
		versions.append(l)

lastVestion = versions[-1].split('---')[1].split(" ")[1]
		
def onMayaDroppedPythonFile(self):
	pass
	
mel.eval('global string $gShelfTopLevel;')
shelf = mel.eval('string $currentShelf = `tabLayout -query -selectTab $gShelfTopLevel`;')
mel.eval('setParent $currentShelf;')

existed_buttons = cmds.shelfLayout(shelf, q=1, ca=1) or []
for s in scripts:
	s_name = s["script_name"]
	function = s["function"]
	name = s["icon_name"]
	com = "import {0}; reload({0}); {0}.{1}".format(s_name, function)
	
	'''exists = False
	for b in existed_buttons:
		b_com = cmds.shelfButton(b, c=1, q=1)
		if com == b_com:
			exists = True
			continue
	
	if not exists:'''
	
	#print lastVestion
	#label = lastVestion
	cmds.shelfButton(style='iconAndTextVertical', imageOverlayLabel=name, command=com, image1=rootPath+'/icons/rs_icon.png', annotation=s_name,  sourceType="python", commandRepeatable=True, parent=shelf)
