# Rig Studio EXPORT
import shutil
import glob
import os, imp
import maya.cmds as cmds



def run(clearPy=False):
	result = cmds.confirmDialog( title='Confirm', message='Export Rig Sudio to files?', button=['Yes','No'], defaultButton='Yes', cancelButton='No', dismissString='No' )
	if result == "No":
		return
	
	fileName = __name__.split('.')[0] 								#rigStudio2
	rs_folder = os.path.abspath(imp.find_module(fileName)[1])	 	#'C:\Users\Pavel\Dropbox\mayaScripts/rigStudio'
	rs_out_folder = rs_folder + '_out' 	#rigStudio_out
	rs_out_tool = rs_folder + '_out/rigStudio2'
	
	addFiles = ["install.txt", "versions.txt", "license.txt"]
	
	if os.path.exists(rs_out_folder):
		shutil.rmtree(rs_out_folder)
	
	os.makedirs(rs_out_folder)
	
	# Duplicate folder
	def copytree(src, dst, symlinks=False, ignore=None):
		if not os.path.exists(dst):
			os.makedirs(dst)    
	
		for item in os.listdir(src):
			s = os.path.join(src, item)
			d = os.path.join(dst, item)
			if os.path.isdir(s):
				shutil.copytree(s, d, symlinks, ignore)
			else:
				shutil.copy2(s, d)
	
	copytree(rs_folder, rs_out_tool)

	shutil.rmtree(rs_out_tool+"/.hg")
	os.remove(rs_out_tool+'/.hgignore')

	# Picker Folder
	os.makedirs(rs_out_folder+"/rigStudio_picker")
	for f in ['animTools', 'picker' ]:
		copytree(rs_folder+"/"+f, rs_out_folder+"/rigStudio_picker/"+f)
	os.makedirs(rs_out_folder+"/rigStudio_picker/ui/icons")
	
	for f in ['arrowsCircle.png', 'selector.png', 'zoomReset.png']:
		shutil.copyfile(rs_folder+'/ui/icons/'+f, rs_out_folder+'/rigStudio_picker/ui/icons/'+f)
	
	for f in ['aboutWindow.ui']:
		shutil.copyfile(rs_folder+'/ui/'+f, rs_out_folder+'/rigStudio_picker/ui/'+f)
	
	for f in ['rs_logo_about.png']:
		shutil.copyfile(rs_folder+'/icons/'+f, rs_out_folder+'/rigStudio_picker/ui/icons/'+f)
	
	for f in ['utils.py', 'picker_icon.py', 'versions.txt']:
		shutil.copyfile(rs_folder+'/'+f, rs_out_folder+'/rigStudio_picker/'+f)
	
	shutil.copyfile(rs_folder+'/picker/__init__exp.py', rs_out_folder+'/rigStudio_picker/__init__.py')
	shutil.copyfile(rs_folder+'/picker/__init__exp2.py', rs_out_folder+'/rigStudio_picker/picker/__init__.py')
	os.remove(rs_out_folder+'/rigStudio_picker/picker/__init__exp.py')
	os.remove(rs_out_folder+'/rigStudio_picker/picker/__init__exp2.py')
	shutil.copyfile(rs_out_tool+"/full", rs_out_folder+'/rigStudio_picker/picker/full')

	# remove RS links from main.py
	# new_lines = []
	# with open(rs_out_folder+'/rigStudio_picker/picker/main.py') as f:
	# 	lines = f.readlines()	
	# for l in lines:
	# 	if 'rigStudio2' in l:
	# 		l = l.replace('rigStudio2', 'rigStudio_picker')
	# 	new_lines.append(l)
	# f.close()
	# my_file = open(rs_out_folder+'/rigStudio_picker/picker/main.py', "w")
	# my_file.writelines(new_lines)
	# my_file.close()	


	for f in addFiles:
		shutil.copyfile(rs_folder+'/'+f, rs_out_folder+'/'+f)
		
	# Remove .py files
	def removeFiles(folder, ext):
		filelist = glob.glob(folder+"/*."+ext)
		for file in filelist:
			print file
			if "install.py" in file:
				continue
			os.remove(file)
	
	if clearPy:
		removeFiles(rs_out_tool,'py')
		removeFiles(os.path.join(rs_out_tool, "picker"),'py')
		removeFiles(os.path.join(rs_out_tool, "matchRig"),'py')
		removeFiles(rs_folder + '_out/rigStudio_picker/picker','py')
		
	removeFiles(rs_out_tool,'wpr')
	removeFiles(rs_out_tool,'wpu')
	removeFiles(os.path.join(rs_out_tool, "matchRig"),'psd')
	#removeFiles(rs_folder + '_out/rigStudio_picker/picker/images','png')

	# clear modules folder  
	files = os.listdir(rs_out_tool+"/modules")
	for f in files:
		if not os.path.isfile(rs_out_tool+"/modules/"+f):
			if f[0] == '_':
				shutil.rmtree(rs_out_tool+"/modules/"+f)

	folders = [x[0] for x in os.walk(rs_out_folder)]
	#print 3333, folders
	for f in folders:
		if f.split("\\")[-1] in ['.mayaSwatches', 'incrementalSave', "_old", "psd"]:
			if os.path.exists(f):
				shutil.rmtree(f)

	shutil.rmtree(rs_out_tool+"/_map")
				
	# get version
	with open(rs_folder+'/versions.txt') as f:
		lines = f.readlines()
	versions = []
	for l in lines:
		if '---Version' in l:
			versions.append(l)
	lastVestion = versions[-1].split('---')[1]
	num = lastVestion.split("Version ")[1].split(" Beta")[0]
	
	# archive full file
	out_file = rs_folder.split("mayaScripts")[0] + '/Public/rigStudio'+num+"Full"
	shutil.make_archive(out_file, 'zip', rs_out_folder)

	os.remove(rs_out_tool+"/full")
	os.remove(rs_out_folder+'/rigStudio_picker/picker/full')
	
	# remove advanced modules
	def moduleIsAdvanced(m_name):
		with open(rs_out_tool+'/modules/'+m_name+'/info.txt') as f:
			lines = f.readlines()	
		if lines[3].split('\r')[0].split('=')[1] == "True":
			return True
		else:
			return False
		
	files = os.listdir(rs_out_tool+"/modules")
	modules = []
	for f in files:
		if not os.path.isfile(rs_out_tool+"/modules/"+f):
			modules.append(f)
	for m in modules:
		if moduleIsAdvanced(m):
			print m, "Advanced"
			dir = rs_out_tool+"/modules/"+m
			if os.path.exists(dir):
				shutil.rmtree(dir)		
				
	shutil.rmtree(rs_out_tool+"/matchRig")	
	
	# archive lite file
	out_file = rs_folder.split("mayaScripts")[0] + '/Public/rigStudio'+num
	shutil.make_archive(out_file, 'zip', rs_out_folder)	

	print ("Export Done")

def clear():
	fileName = __name__.split('.')[0]
	rs_folder = os.path.abspath(imp.find_module(fileName)[1])

	# Remove .pyc files

	filelist = glob.glob(rs_folder+"/*.pyc")
	
	for file in filelist:
		print file
		if file.split('\\')[-1] == 'Qt.pyc':
			continue
		os.remove(file)

	filelist = glob.glob(rs_folder+"/rigStudio_picker/*.pyc")
	
	for file in filelist:
		print file
		if file.split('\\')[-1] == 'Qt.pyc':
			continue
		os.remove(file)
