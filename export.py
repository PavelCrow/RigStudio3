# Rig Studio EXPORT
import shutil, os, subprocess
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
	rs_smf = r"F:\Maya_Projects\rigStudio3_out\smf"
	yd_folder = r"C:\Users\pavel\YandexDisk\RS\releases"
	dropbox_folder = r"C:\Users\pavel\Dropbox\Public\RS\releases"
	
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
			"rigStudio3.code-workspace", ".gitignore"] #, "check.py", "main.py"]
	

	copy_project(rs_folder, rs_out, exclude)

	pro_modules = []
	smf_modules = []
	wip_modules = []
	extra_modules = []
	
	# Удаление Pro-модулей  
	mod_folder = os.path.join(rs_out, "modules")
	files = os.listdir(mod_folder)
	for d in files:
		if os.path.isdir(os.path.join(mod_folder, d)):
			with open(os.path.join(mod_folder, d)+'/info.txt') as f:
				lines = f.readlines()
			for l in lines:
				if 'type=' in l:
					tp = l.split("=")[-1]
					if tp == "Pro":
						pro_modules.append(d)
					elif tp == "Smf":
						smf_modules.append(d)
					elif tp == "Wip":
						wip_modules.append(d)
					elif tp == "Extra":
						extra_modules.append(d)
                
	print("pro", pro_modules)
	print("smf", smf_modules)
	print("wip", wip_modules)
	print("extra", extra_modules)

	# os.makedirs(os.path.join(rs_out, "licenses"))
	# os.makedirs(os.path.join(rs_out, "__pycache__"))

	# copmpile_pyc( os.path.join(rs_out, "main.py"))
	# copmpile_pyc( os.path.join(rs_out, "check.py"))

	# os.remove(os.path.join(rs_out, "main.py"))
	os.remove(os.path.join(rs_out, "check.py"))

	# Удаление модулей с префиксом "_"
	for f in files:
		if not os.path.isfile(os.path.join(mod_folder, f)):
			if f[0] == '_':
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

	# Удаление Wip-модулей  
	for f in files:
		if f in wip_modules:
			shutil.rmtree(os.path.join(mod_folder, f))

	# Создаём SMF архив
	archive = os.path.join(rs_smf, f"rigStudio{num}SMF")
	shutil.make_archive(archive, 'zip', temp_folder)
	shutil.copy(archive+".zip", os.path.join(yd_folder, "rs 3 smf version"))

	# Удаление Smf-модулей  
	for f in files:
		if f in smf_modules:
			shutil.rmtree(os.path.join(mod_folder, f))

	# Удаление Extra-модулей  
	for f in files:
		if f in extra_modules:
			shutil.rmtree(os.path.join(mod_folder, f))

	# Создаём Pro архив
	archive = os.path.join(rs_pro, f"rigStudio{num}")
	shutil.make_archive(archive, 'zip', temp_folder)
	shutil.copy(archive+".zip", os.path.join(yd_folder, "rs 3 public version"))
	shutil.copy(archive+".zip", os.path.join(dropbox_folder, "rs 3 public version"))

	# # Удаление Pro-модулей  
	# for f in files:
	# 	if f in pro_modules:
	# 		shutil.rmtree(os.path.join(mod_folder, f))
	
	# # Создаём Free архив
	# archive = os.path.join(rs_free, f"rigStudio{num}Free")
	# shutil.make_archive(archive, 'zip', temp_folder)
	# shutil.copy(archive+".zip", os.path.join(yd_folder, "rs 3 free version"))

	print ("Export Done")




def find_maya_python_executables():
    """Находит пути к mayapy.exe для установленных версий Maya."""
    maya_versions = {
        "2022": "3.7",  # Python 3.7
        "2023": "3.7",  # Python 3.7
        "2024": "3.9",  # Python 3.9
        "2025": "3.11"  # Python 3.11
    }
    maya_paths = {}
    base_path = "C:/Program Files/Autodesk"

    for version, python_version in maya_versions.items():
        maya_path = os.path.join(base_path, f"Maya{version}", "bin", "mayapy.exe")
        if os.path.exists(maya_path):
            maya_paths[version] = (maya_path, python_version)
        else:
            print(f"Не найден mayapy.exe для Maya {version} по пути: {maya_path}")

    return maya_paths

def copmpile_pyc(source_file):
	# Находим mayapy.exe для установленных версий Maya
	maya_paths = find_maya_python_executables()

	# Компилируем для каждой версии
	for maya_version, (python_exe, python_version) in maya_paths.items():
		print(f"Компилируем {source_file} для Maya {maya_version} (Python {python_version})...")
		pyc_name = f"{os.path.splitext(os.path.basename(source_file))[0]}.cpython-{python_version.replace('.', '')}.pyc"
		subprocess.run([
			python_exe,
			"-m", "py_compile",
			source_file
		], check=True)