# Rig Studio EXPORT
import shutil
import glob
import os, imp
import maya.cmds as cmds



def run(clearPy=False):
	result = cmds.confirmDialog( title='Confirm', message='Export Rig Sudio to files?', button=['Yes','No'], defaultButton='Yes', cancelButton='No', dismissString='No' )
	if result == "No":
		return
	
	rs_folder = os.path.dirname(os.path.abspath(__file__))	#F:\Maya_Projects\rigStudio3
	rs_out = r"F:\Maya_Projects\rigStudio3_out\temp\rigStudio3"
	temp_folder = r"F:\Maya_Projects\rigStudio3_out\temp"
	rs_free = r"F:\Maya_Projects\rigStudio3_out\free"
	rs_pro = r"F:\Maya_Projects\rigStudio3_out\pro"

	# Удаление временной папки
	if os.path.exists(rs_out):
		shutil.rmtree(rs_out)
	
	def copy_project(src, dst, exclude_patterns=None):
		# Создаем правило для `ignore_patterns`
		ignore = shutil.ignore_patterns(*(exclude_patterns or []))
		print(src, dst)
		# Копируем файлы, исключая ненужные папки
		shutil.copytree(src, dst, ignore=ignore)
		print(f"Проект успешно скопирован в: {dst}")

	# Исключаем ненужные файлы и папки
	exclude = ["__pycache__", ".idea", ".vscode", "_old", "licenses", "incrementalSave", ".mayaSwatches", 
			".git", "*.psd", "*.pyc",
			"rigStudio3.code-workspace", ".gitignore", "check.py", "main.py"]
	
	pro_modules = ["eyesGeometry", "wing", "birdFoot"]
	extra_modules = ["browsSimple", "eyes", "mouth", "eyelidsSimple"]

	copy_project(rs_folder, rs_out, exclude)

	os.makedirs(os.path.join(rs_out, "licenses"))

	s= os.path.join(rs_folder, "__pycache__")
	d= os.path.join(rs_out, "__pycache__")
	shutil.copytree(s , d)

	# Очистка modules folder  
	mod_folder = os.path.join(rs_out, "modules")
	files = os.listdir(mod_folder)
	for f in files:
		if not os.path.isfile(os.path.join(mod_folder, f)):
			if f[0] == '_':
				shutil.rmtree(os.path.join(mod_folder, f))


	# Удаление Pro-модулей  
	mod_folder = os.path.join(rs_out, "modules")
	files = os.listdir(mod_folder)
	for f in files:
		if f in pro_modules:
			shutil.rmtree(os.path.join(mod_folder, f))

	# Получение версии из versions.txt
	with open(rs_folder+'/versions.txt') as f:
		lines = f.readlines()
	versions = []
	for l in lines:
		if '---Version' in l:
			versions.append(l)
	lastVestion = versions[-1].split('---')[1].strip() 
	num = lastVestion.split("Version ")[1].split(" Beta")[0]
	
	# ✅ Создаём архив
	archive = os.path.join(rs_pro, f"rigStudio{num}Pro")
	shutil.make_archive(archive, 'zip', temp_folder)

	# Удаление Extra-модулей  
	mod_folder = os.path.join(rs_out, "modules")
	files = os.listdir(mod_folder)
	for f in files:
		if f in extra_modules:
			shutil.rmtree(os.path.join(mod_folder, f))
	
	# ✅ Создаём архив
	archive = os.path.join(rs_free, f"rigStudio{num}Free")
	shutil.make_archive(archive, 'zip', temp_folder)

	return
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
			print (m, "Advanced")
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
		print (file)
		if file.split('\\')[-1] == 'Qt.pyc':
			continue
		os.remove(file)

	filelist = glob.glob(rs_folder+"/rigStudio_picker/*.pyc")
	
	for file in filelist:
		print (file)
		if file.split('\\')[-1] == 'Qt.pyc':
			continue
		os.remove(file)
