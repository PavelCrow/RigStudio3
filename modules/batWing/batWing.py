import maya.cmds as cmds
import pymel.core as pm
import maya.api.OpenMaya as om

from ... import utils, module


class BatWing(module.Module) :
    def __init__(self, name):
        super(self.__class__, self).__init__()

        self.name = name
        self.type = __name__.split('.')[-1]
        self.unic = False

    def connectSignals(self, mainInstance, w): 
        self.mainInstance = mainInstance
        self.widget = w

        w.createJoints_btn.clicked.connect(self.create_joints)
        w.createFingerJoints_btn.clicked.connect(self.create_fingers_joints)

    def create_joints(self):
        sel = cmds.ls(sl=1, fl=1)

        m_name = self.name
        m_name_opp = utils.getOpposite(m_name)

        nurbs_shapes = []
        for i in range(1,5):
            nurbs_shapes.append(f'{m_name}_surf_Shape{i}')

        def find_closest_nurbs(point_pos=[0,0,0]):
            test_pt = om.MPoint(point_pos)
            closest_dist = float('inf')
            closest_nurbs = None
            
            for shape in nurbs_shapes:
                if cmds.getAttr(f"{shape}.visibility") == 0:
                    continue
                    
                sel_list = om.MSelectionList()
                sel_list.add(shape)
                dag_path = sel_list.getDagPath(0)
                fn_nurbs = om.MFnNurbsSurface(dag_path)
                
                closest_pt, u, v = fn_nurbs.closestPoint(test_pt, space=om.MSpace.kWorld)
                distance = test_pt.distanceTo(closest_pt)
                
                if distance < closest_dist:
                    closest_dist = distance
                    closest_nurbs = shape
            
            return closest_nurbs

        joints = []

        for obj in sel:
            if '.vtx[' in obj:
                point_pos = cmds.pointPosition(obj)
                surf = find_closest_nurbs(point_pos)
                
                i = int(surf[-1])
                uvPin = f"{m_name}_surf_{i}_uvPin"
                j_gr = f"{m_name}_surf_outJoint"
                clst_node = f"{m_name}_surf_{i}_closestPointOnSurface"
                
                cmds.setAttr(f"{clst_node}.inPosition", point_pos[0], point_pos[1], point_pos[2])
                uv_u = cmds.getAttr(f"{clst_node}.parameterU")
                uv_v = cmds.getAttr(f"{clst_node}.parameterV")

                # create joint
                cmds.select(clear=1)        
                j = cmds.joint(name=f"{m_name}_surf_{i}_outJoint_#")
                cmds.parent(j, j_gr)
                id = j.split("_")[-1]
                
                size = cmds.getAttr(f"{uvPin}.outputMatrix", size=True)
                cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateU", uv_u)
                cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateV", uv_v)
                cmds.connectAttr(f"{uvPin}.outputMatrix[{size}]", j+".offsetParentMatrix")
                utils.removeTransformParentJoint(j)
                cmds.setAttr(f"{j}.inheritsTransform", 0)
                
                # create skin joint
                cmds.select(clear=1) 
                sj = f"{m_name}_surf_{i}_skinJoint_{id}"
                cmds.joint(name=sj)
                cmds.parent(sj, j_gr.replace("outJoint", "skinJoint"))
                utils.resetAttrs(sj)
                utils.connectByMatrix(sj, [j, sj], ["worldMatrix[0]", "parentInverseMatrix"], module_name=m_name)
                utils.removeTransformParentJoint(sj)
                joints.append(sj)

                uvPin_opp = f"{m_name_opp}_surf_{i}_uvPin"
                j_gr_opp = f"{m_name_opp}_surf_outJoint"

                # create opp joint
                cmds.select(clear=1)        
                j_opp = f"{m_name_opp}_surf_{i}_outJoint_{id}"
                cmds.joint(name=j_opp)
                cmds.parent(j_opp, j_gr_opp)
                cmds.setAttr(f"{uvPin_opp}.coordinate[{size}].coordinateU", uv_u)
                cmds.setAttr(f"{uvPin_opp}.coordinate[{size}].coordinateV", uv_v)
                cmds.connectAttr(f"{uvPin_opp}.outputMatrix[{size}]", j_opp+".offsetParentMatrix")
                utils.removeTransformParentJoint(j_opp)
                cmds.setAttr(f"{j_opp}.inheritsTransform", 0)
                
                # create skin opp joint
                cmds.select(clear=1) 
                sj_opp = f"{m_name_opp}_surf_{i}_skinJoint_{id}"
                cmds.joint(name=sj_opp)
                cmds.parent(sj_opp, j_gr_opp.replace("outJoint", "skinJoint"))
                utils.resetAttrs(sj_opp)
                utils.removeTransformParentJoint(sj_opp)
                
                utils.connectByMatrix(sj_opp, [j_opp, sj_opp], ["worldMatrix[0]", "parentInverseMatrix"], module_name=m_name_opp)

                joints.append(sj_opp)


        cmds.select(joints)

    def create_fingers_joints(self, count=0):
        m_name = self.name
        m_name_opp = utils.getOpposite(m_name)
        opp = m_name_opp != m_name

        crv_ids = [1, 5, 7, 9, 11]
        if not count:
            count = self.widget.fingerJointsCount_spinBox.value()

        cmds.delete(cmds.listRelatives(f"{m_name}_crv_outJoint"))
        cmds.delete(cmds.listRelatives(f"{m_name}_crv_skinJoint"))
        if opp:
            cmds.delete(cmds.listRelatives(f"{m_name_opp}_crv_outJoint"))
            cmds.delete(cmds.listRelatives(f"{m_name_opp}_crv_skinJoint"))

        for id in crv_ids:
            crvS = f"{m_name}_crv_Shape{id}"
            crv = f"{m_name}_crv_{id}"
            crv_o = pm.PyNode(crvS)
            root_c = crv_o.controlPoints.inputs()[0].getParent()
            
            crvS_opp = f"{m_name_opp}_crv_Shape{id}"
            crv_opp = f"{m_name_opp}_crv_{id}"
            crv_o_opp = pm.PyNode(crvS_opp)
            root_c_opp = crv_o_opp.controlPoints.inputs()[0].getParent()
            
            for i in range(count):
                # create joint
                cmds.select(clear=True)
                jnt = cmds.joint(n=f"{crv}_jnt_{i}")
                cmds.select( jnt, crv )
                cmds.pathAnimation(fractionMode=True, follow=True, followAxis="x", upAxis="y", worldUpType="vector", worldUpVector=[0,1,0], inverseUp=False, inverseFront=False, bank=False)
                mpathNode = cmds.connectionInfo(jnt+".rx", sourceFromDestination=True).split(".")[0]
                mpath = crv+"_"+str(i)+"_mpath"
                cmds.rename(mpathNode, mpath)
                
                dl1 = cmds.connectionInfo(jnt+".tx", sourceFromDestination=True).split(".")[0]
                dl2 = cmds.connectionInfo(jnt+".ty", sourceFromDestination=True).split(".")[0]
                dl3 = cmds.connectionInfo(jnt+".tz", sourceFromDestination=True).split(".")[0]
                cmds.delete(dl1, dl2, dl3)
                
                cmds.connectAttr(mpath+".allCoordinates", jnt+".t")
                
                animPath = cmds.connectionInfo(mpath+".uValue", sourceFromDestination=True).split(".")[0]
                cmds.delete(animPath)
                
                value = 1.0/(count-1) * i
                
                cmds.setAttr(mpath+".uValue", value)
                cmds.setAttr(mpath+".worldUpType", 2)
                pm.connectAttr(root_c.worldMatrix, mpath+".worldUpMatrix")
                
                cmds.addAttr(jnt, ln="pos", min=0, max=1, dv=value, k=1)
                pm.connectAttr(f"{jnt}.pos", mpath+".uValue")
                cmds.parent(jnt, f"{m_name}_crv_outJoint")
                utils.removeTransformParentJoint(jnt)
                cmds.setAttr(jnt+".inheritsTransform", 0)
                pm.connectAttr(f"{m_name}_root_outJoint.s", jnt+".s")

                # create skin joint
                cmds.select(clear=1) 
                sj = f"{crv}_{i}_skinJoint"
                cmds.joint(name=sj)
                cmds.parent(sj, f"{m_name}_crv_skinJoint")
                utils.removeTransformParentJoint(sj)
                utils.resetAttrs(sj)
                utils.connectByMatrix(sj, [jnt, sj], ["worldMatrix[0]", "parentInverseMatrix"], module_name=m_name)

                # create opp joint
                if not opp:
                    continue
                cmds.select(clear=True)
                jnt_opp = cmds.joint(n=f"{crv_opp}_jnt_{i}")
                cmds.select( jnt_opp, crv_opp )
                cmds.pathAnimation(fractionMode=True, follow=True, followAxis="x", upAxis="y", worldUpType="vector", worldUpVector=[0,1,0], inverseUp=False, inverseFront=False, bank=False)
                mpathNode = cmds.connectionInfo(jnt_opp+".rx", sourceFromDestination=True).split(".")[0]
                mpath = crv_opp+"_"+str(i)+"_mpath"
                cmds.rename(mpathNode, mpath)
                
                dl1 = cmds.connectionInfo(jnt_opp+".tx", sourceFromDestination=True).split(".")[0]
                dl2 = cmds.connectionInfo(jnt_opp+".ty", sourceFromDestination=True).split(".")[0]
                dl3 = cmds.connectionInfo(jnt_opp+".tz", sourceFromDestination=True).split(".")[0]
                cmds.delete(dl1, dl2, dl3)
                
                cmds.connectAttr(mpath+".allCoordinates", jnt_opp+".t")
                
                animPath = cmds.connectionInfo(mpath+".uValue", sourceFromDestination=True).split(".")[0]
                cmds.delete(animPath)                        
                
                cmds.setAttr(mpath+".worldUpType", 2)
                pm.connectAttr(root_c_opp.worldMatrix, mpath+".worldUpMatrix")
                
                pm.connectAttr(f"{jnt}.pos", mpath+".uValue")
                cmds.parent(jnt_opp, f"{m_name_opp}_crv_outJoint")
                utils.removeTransformParentJoint(jnt_opp)
                cmds.setAttr(jnt_opp+".inheritsTransform", 0)
                pm.connectAttr(f"{m_name}_root_outJoint.s", jnt_opp+".s")

                # create skin opp joint
                cmds.select(clear=1) 
                sj = f"{crv_opp}_{i}_skinJoint"
                cmds.joint(name=sj)
                cmds.parent(sj, f"{m_name_opp}_crv_skinJoint")
                utils.removeTransformParentJoint(sj)
                utils.resetAttrs(sj)
                utils.connectByMatrix(sj, [jnt_opp, sj], ["worldMatrix[0]", "parentInverseMatrix"], module_name=m_name_opp)