import maya.cmds as cmds
import json

# -------------------------------------------------
# Вспомогательные
# -------------------------------------------------

def get_all_controls(control_set):
    """Рекурсивно собирает все контролы из иерархического сета."""
    result = []
    
    def _collect(s):
        members = cmds.sets(s, q=True) or []
        for m in members:
            if cmds.nodeType(m) == "objectSet":
                _collect(m)                     # вложенный сет → идём глубже
            else:
                # это реальный контрол (transform / joint и т.д.)
                result.append(m)
    
    _collect(control_set)
    # убираем дубликаты, сохраняя порядок
    seen = set()
    unique = []
    for c in result:
        if c not in seen:
            seen.add(c)
            unique.append(c)
    return unique

def get_module_name(node):
    """Поднимаемся по иерархии, пока не найдём группу *_mod."""
    current = node
    while current:
        short = current.split("|")[-1].split(":")[-1]
        if short.endswith("_mod"):
            return short[:-4]
        parents = cmds.listRelatives(current, parent=True, fullPath=True)
        current = parents[0] if parents else None
    return None

def get_internal_name(node):
    if cmds.attributeQuery("internalName", node=node, exists=True):
        return cmds.getAttr(f"{node}.internalName")
    return None

def make_key(module, internal):
    return f"{module}|{internal}"
    

def addMirrorLoc():
	if cmds.objExists("mirror_loc"):
		return
     
	sel = cmds.ls(sl=True)
	if len(sel) != 2:
		cmds.warning("Select the root and the pelvis controls")
		return

	root, pelvis = sel

	l = cmds.spaceLocator(n="mirror_loc")[0]
	cmds.setAttr(l+".rotateOrder", 1)
	cmds.parent(l, root)
	cmds.setAttr(l+".t", 0,0,0)
	cmds.setAttr(l+".r", 0,0,0)
	cmds.setAttr(l+".s", 1,1,1)
	cmds.hide(l)
	cmds.pointConstraint(pelvis, l, mo=0, skip="y")
	cmds.orientConstraint(pelvis, l, mo=0, skip=["x", "z"])

def import_mirror_attrs(control_set="controlSet", input_path="C:/temp/mirror_attrs.json"):
    if not cmds.objExists(control_set):
        cmds.error(f"Set '{control_set}' не найден")
    
    with open(input_path, "r", encoding="utf-8") as f:
        data = json.load(f)
    
    controls = get_all_controls(control_set)
    print(f"Найдено контролов: {len(controls)}")
    
    enum_values = "None:x:y:z"
    matched = 0
    
    for ctrl in controls:
        module = get_module_name(ctrl)
        internal = get_internal_name(ctrl)
        
        if not module or not internal:
            # print(f"SKIP (нет module/internalName): {ctrl}")
            continue
        
        key = make_key(module, internal)
        
        if key not in data:
            # print(f"SKIP (нет данных): {key}  ←  {ctrl}")
            continue
        
        attrs = data[key]          # словарь только с теми атрибутами, что были
        
        # --- worldSpace (только если был) ---
        if "worldSpace" in attrs:
            if not cmds.attributeQuery("worldSpace", node=ctrl, exists=True):
                cmds.addAttr(ctrl, ln="worldSpace", at="bool", dv=False,
                             keyable=False)
            cmds.setAttr(f"{ctrl}.worldSpace", attrs["worldSpace"])
        
        # --- matrixMirror (только если был) ---
        if "matrixMirror" in attrs:
            if not cmds.attributeQuery("matrixMirror", node=ctrl, exists=True):
                cmds.addAttr(ctrl, ln="matrixMirror", at="bool", dv=False,
                             keyable=False)
            cmds.setAttr(f"{ctrl}.matrixMirror", attrs["matrixMirror"])
        
        # --- mirrorAxis (только если был) ---
        if "mirrorAxis" in attrs:
            if not cmds.attributeQuery("mirrorAxis", node=ctrl, exists=True):
                cmds.addAttr(ctrl, ln="mirrorAxis", at="enum", en=enum_values, dv=0,
                             keyable=False)
            
            val = attrs["mirrorAxis"]
            try:
                cmds.setAttr(f"{ctrl}.mirrorAxis", val)
            except:
                idx = {"None": 0, "x": 1, "y": 2, "z": 3}.get(val, 0)
                cmds.setAttr(f"{ctrl}.mirrorAxis", idx)
        
        print(f"OK: {key}  →  {ctrl}  |  attrs: {list(attrs.keys())}")
        matched += 1
    
    print(f"\nГотово. Обработано {matched} контролов")


def run():
	cmds.select("main", "pelvis")
	addMirrorLoc()
	import_mirror_attrs()	