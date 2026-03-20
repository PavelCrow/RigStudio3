import maya.cmds as cmds

from ... import utils, module


class BatWing(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False


	def create_joints(self):
		i = 4

		uvPin = f"l_wing_surf_{i}_uvPin"
		j_gr = "l_wing_surf_joints"
		clst_node = f"l_wing_surf_{i}_closestPointOnSurface"


		sel = cmds.ls(sl=1, fl=1)

		for obj in sel:
			if '.vtx[' in obj:
				point_pos = cmds.pointPosition(obj)
				cmds.setAttr(f"{clst_node}.inPosition", point_pos[0], point_pos[1], point_pos[2])
				uv_u = cmds.getAttr(f"{clst_node}.parameterU")
				uv_v = cmds.getAttr(f"{clst_node}.parameterV")

				cmds.select(clear=1)        
				j = cmds.joint(name=f"l_wing_surf_{i}_joint_#")
				cmds.parent(j, j_gr)
				cmds.setAttr(j+".radius", 30)
				
				size = cmds.getAttr(f"{uvPin}.outputMatrix", size=True)
				cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateU", uv_u)
				cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateV", uv_v)
				
				cmds.connectAttr(f"{uvPin}.outputMatrix[{size}]", j+".offsetParentMatrix")




sel = cmds.ls(sl=1, fl=1)

nurbs_shapes = []
for i in range(1,5):
    nurbs_shapes.append(f'l_wing_surf_Shape{i}')
    nurbs_shapes.append(f'r_wing_surf_Shape{i}')

for obj in sel:
    if '.vtx[' in obj:
        point_pos = cmds.pointPosition(obj)
        surf = find_closest_nurbs(point_pos)
        
        i = int(surf[-1])
        side = surf[0]
        uvPin = f"{side}_wing_surf_{i}_uvPin"
        j_gr = f"{side}_wing_surf_joints"
        clst_node = f"{side}_wing_surf_{i}_closestPointOnSurface"
        
        cmds.setAttr(f"{clst_node}.inPosition", point_pos[0], point_pos[1], point_pos[2])
        uv_u = cmds.getAttr(f"{clst_node}.parameterU")
        uv_v = cmds.getAttr(f"{clst_node}.parameterV")

        cmds.select(clear=1)        
        j = cmds.joint(name=f"{side}_wing_surf_{i}_joint_#")
        cmds.parent(j, j_gr)
        cmds.setAttr(j+".radius", 30)
        
        size = cmds.getAttr(f"{uvPin}.outputMatrix", size=True)
        cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateU", uv_u)
        cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateV", uv_v)
        
        cmds.connectAttr(f"{uvPin}.outputMatrix[{size}]", j+".offsetParentMatrix")





import maya.api.OpenMaya as om

def find_closest_nurbs(point_pos=[0,0,0]):
    test_pt = om.MPoint(point_pos)
    closest_dist = float('inf')
    closest_nurbs = None
    closest_pos = None
    closest_uv = None
    
    for shape in nurbs_shapes:
        if cmds.getAttr(f"{shape}.visibility") == 0:
            continue
            
        # DagPath
        sel_list = om.MSelectionList()
        sel_list.add(shape)
        dag_path = sel_list.getDagPath(0)
        fn_nurbs = om.MFnNurbsSurface(dag_path)
        
        # Ближайшая точка на поверхности
        try:
            closest_pt, u, v = fn_nurbs.closestPoint(test_pt, space=om.MSpace.kWorld)
            distance = test_pt.distanceTo(closest_pt)
            
            if distance < closest_dist:
                closest_dist = distance
                closest_nurbs = shape
                closest_pos = [closest_pt.x, closest_pt.y, closest_pt.z]
                closest_uv = (u, v)
        except:
            continue  # Проблемные поверхности
    
    if closest_nurbs:
        #print(f"Ближайшая NURBS: {closest_nurbs}")
        #print(f"Расстояние: {closest_dist:.3f}")
        #rint(f"Позиция: {closest_pos}")
        #print(f"UV параметры: U={closest_uv[0]:.3f}, V={closest_uv[1]:.3f}")
        return closest_nurbs
    return None

