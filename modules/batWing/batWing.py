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
        self.widget = None

    def connectSignals(self, mainInstance, w): 
        self.mainInstance = mainInstance
        self.widget = w

        w.createJoints_btn.clicked.connect(self.create_joints)
        w.deleteJoints_btn.clicked.connect(self.delete_joints)
        w.createFingerJoints_btn.clicked.connect(self.create_fingers_joints)
        w.generateGrid_btn.clicked.connect(self.generate_grid)
        w.aimDistance_spinBox.valueChanged.connect(self.update_aim_distance)

    def updateOptionsPage(self, w):
        self.widget = w
        w.aimDistance_spinBox.setValue(cmds.getAttr(self.name+"_mod.aim_offset"))

    def update_aim_distance(self, v=None):
        def setValue(v):
            cmds.setAttr(self.name+"_mod.aim_offset", v)
            if self.symmetrical:
                opp_mod = utils.getOpposite(self.name+"_mod")
                cmds.setAttr(opp_mod+".aim_offset", v)

        if v:
            setValue(v)
        else:
            try: # fix error "C++ object already deleted"
                if not self.widget:
                    return
                if not v:
                    v = self.widget.aimDistance_spinBox.value()
                    setValue(v)
            except:
                pass

    def getData(self):
        data = super(self.__class__, self).getData()
        data['optionsData'] = self.getOptions()
        return data

    def getOptions(self):
        optionsData = {}
        optionsData['aimDistance'] = cmds.getAttr(self.name+"_mod.aim_offset")
        return optionsData

    def setOptions(self, optionsData):
        # в темплейтах, сохранённых до появления этой опции, тут лежит False
        if not isinstance(optionsData, dict):
            return
        if 'aimDistance' in optionsData:
            self.update_aim_distance(optionsData['aimDistance'])

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
                clst_node = f"{m_name}_surf_{i}_closestPointOnSurface"
                
                cmds.setAttr(f"{clst_node}.inPosition", point_pos[0], point_pos[1], point_pos[2])
                uv_u = cmds.getAttr(f"{clst_node}.parameterU")
                uv_v = cmds.getAttr(f"{clst_node}.parameterV")

                joints += self.add_surface_joint(i, uv_u, uv_v)


        cmds.select(joints)

    def add_surface_joint(self, i, uv_u, uv_v):
        """Пара костей на поверхности i в точке (u, v) - своя и зеркальная.

        Место кости задаёт uvPin через offsetParentMatrix, поэтому собственные
        каналы обнуляются, а наследование родителя выключается: иначе положение
        учлось бы дважды.

        Возвращает созданные скиновые кости - их и выделяют после.
        """
        m_name = self.name
        m_name_opp = utils.getOpposite(m_name)

        uvPin = f"{m_name}_surf_{i}_uvPin"
        uvPin_opp = f"{m_name_opp}_surf_{i}_uvPin"
        j_gr = f"{m_name}_surf_outJoint"
        j_gr_opp = f"{m_name_opp}_surf_outJoint"

        opp = m_name_opp != m_name and cmds.objExists(uvPin_opp) and cmds.objExists(j_gr_opp)

        # Пределы для атрибутов - узловая область самой поверхности: за ней
        # uvPin места не знает, и кость улетела бы неизвестно куда
        shape = f"{m_name}_surf_Shape{i}"
        try:
            u_range = cmds.getAttr(f"{shape}.minMaxRangeU")[0]
            v_range = cmds.getAttr(f"{shape}.minMaxRangeV")[0]
        except Exception:
            u_range = v_range = None

        def addParam(obj, name, value, rng):
            kwargs = {"ln": name, "dv": value, "k": 1, "at": "double"}
            if rng:
                kwargs["min"] = rng[0]
                kwargs["max"] = rng[1]
            cmds.addAttr(obj, **kwargs)

        joints = []

        # create joint
        cmds.select(clear=1)
        j = cmds.joint(name=f"{m_name}_surf_{i}_outJoint_#")
        cmds.parent(j, j_gr)
        id = j.split("_")[-1]

        # индекс берётся по существующим элементам, а не по их количеству:
        # после удаления джоинта в середине количество уменьшается, и новый
        # элемент лёг бы поверх живого
        indices = list(cmds.getAttr(f"{uvPin}.coordinate", multiIndices=True) or [])
        if opp:
            indices += list(cmds.getAttr(f"{uvPin_opp}.coordinate", multiIndices=True) or [])
        size = max(indices) + 1 if indices else 0

        cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateU", uv_u)
        cmds.setAttr(f"{uvPin}.coordinate[{size}].coordinateV", uv_v)
        cmds.connectAttr(f"{uvPin}.outputMatrix[{size}]", j+".offsetParentMatrix")
        utils.removeTransformParentJoint(j)
        # cmds.parent сохраняет мировое положение и пишет разницу в каналы
        # джоинта. Место ему задаёт uvPin, поэтому свои каналы должны быть нулевые
        utils.resetAttrs(j, jointOrient=True)
        cmds.setAttr(f"{j}.inheritsTransform", 0)

        # create skin joint
        cmds.select(clear=1)
        sj = f"{m_name}_surf_{i}_skinJoint_{id}"
        cmds.joint(name=sj)
        cmds.parent(sj, j_gr.replace("outJoint", "skinJoint"))
        utils.resetAttrs(sj)
        utils.connectByMatrix(sj, [j, sj], ["worldMatrix[0]", "parentInverseMatrix"], attrs=['t', 'r'], module_name=m_name)
        utils.removeTransformParentJoint(sj)
        joints.append(sj)

        # Место кости по поверхности правится здесь, на скиновой кости: её и
        # выделяют. Отсюда параметры идут в uvPin, а тот двигает ведущую кость
        addParam(sj, "paramU", uv_u, u_range)
        addParam(sj, "paramV", uv_v, v_range)
        cmds.connectAttr(f"{sj}.paramU", f"{uvPin}.coordinate[{size}].coordinateU", f=1)
        cmds.connectAttr(f"{sj}.paramV", f"{uvPin}.coordinate[{size}].coordinateV", f=1)

        if not opp:
            return joints

        # create opp joint
        cmds.select(clear=1)
        j_opp = f"{m_name_opp}_surf_{i}_outJoint_{id}"
        cmds.joint(name=j_opp)
        cmds.parent(j_opp, j_gr_opp)
        cmds.setAttr(f"{uvPin_opp}.coordinate[{size}].coordinateU", uv_u)
        cmds.setAttr(f"{uvPin_opp}.coordinate[{size}].coordinateV", uv_v)
        cmds.connectAttr(f"{uvPin_opp}.outputMatrix[{size}]", j_opp+".offsetParentMatrix")
        utils.removeTransformParentJoint(j_opp)
        utils.resetAttrs(j_opp, jointOrient=True)
        cmds.setAttr(f"{j_opp}.inheritsTransform", 0)

        # create skin opp joint
        cmds.select(clear=1)
        sj_opp = f"{m_name_opp}_surf_{i}_skinJoint_{id}"
        cmds.joint(name=sj_opp)
        cmds.parent(sj_opp, j_gr_opp.replace("outJoint", "skinJoint"))
        utils.resetAttrs(sj_opp)
        utils.removeTransformParentJoint(sj_opp)
        utils.connectByMatrix(sj_opp, [j_opp, sj_opp], ["worldMatrix[0]", "parentInverseMatrix"], attrs=['t', 'r'], module_name=m_name_opp)
        joints.append(sj_opp)

        # Ведомые: обе стороны стоят на одном параметре, как и было при setAttr
        addParam(sj_opp, "paramU", uv_u, u_range)
        addParam(sj_opp, "paramV", uv_v, v_range)
        cmds.connectAttr(f"{sj}.paramU", f"{sj_opp}.paramU", f=1)
        cmds.connectAttr(f"{sj}.paramV", f"{sj_opp}.paramV", f=1)
        cmds.connectAttr(f"{sj_opp}.paramU", f"{uvPin_opp}.coordinate[{size}].coordinateU", f=1)
        cmds.connectAttr(f"{sj_opp}.paramV", f"{uvPin_opp}.coordinate[{size}].coordinateV", f=1)

        return joints

    def generate_grid(self, *args):
        """Кости сеткой по одной из поверхностей, count_u на count_v штук.

        Параметры берутся по узловой области самой поверхности, а не по 0..1:
        у nurbs она не обязана быть единичной, и равномерность по параметру
        считается именно в ней.
        """
        m_name = self.name

        surf_id = int(self.widget.gridSurface_comboBox.currentText())
        count_u = self.widget.gridCountU_spinBox.value()
        count_v = self.widget.gridCountV_spinBox.value()

        shape = f"{m_name}_surf_Shape{surf_id}"
        if not cmds.objExists(shape):
            cmds.warning("Missed " + shape)
            return

        sel_list = om.MSelectionList()
        sel_list.add(shape)
        fn = om.MFnNurbsSurface(sel_list.getDagPath(0))

        u0, u1 = fn.knotDomainInU
        v0, v1 = fn.knotDomainInV

        def params(a, b, count):
            # одна кость садится в середину, иначе от края до края
            if count < 2:
                return [(a + b) * 0.5]

            span = b - a
            step = span / float(count - 1)
            inset = span * 0.01

            out = []
            for n in range(count):
                value = a + step * n

                # с самого края кость не ставим: там поверхность заканчивается,
                # крайние ряды сдвигаются внутрь на процент от диапазона
                if n == 0:
                    value += inset
                elif n == count - 1:
                    value -= inset

                out.append(value)

            return out

        # сетка строится заново, поэтому всё, что стояло на этой поверхности,
        # сначала убирается - иначе кости легли бы поверх старых
        removed = self.delete_surface_joints(surf_id)

        joints = []
        for u in params(u0, u1, count_u):
            for v in params(v0, v1, count_v):
                joints += self.add_surface_joint(surf_id, u, v)

        if joints:
            cmds.select(joints)

        print("%s: surface %s, grid %sx%s, %s joints, %s removed"
              % (m_name, surf_id, count_u, count_v, len(joints), removed))

    def delete_joints(self, *args):
        """Удаляет выделенные джоинты поверхности - обе стороны сразу.

        Выделять можно любой из пары: и скиновый, и модульный. Кроме самих
        джоинтов убираются их ноды матриц и координата uvPin, которая их вела.
        """
        sel = cmds.ls(sl=1) or []
        if not sel:
            cmds.warning(" Select the joints to delete")
            return

        out_joints = []
        for obj in sel:
            out_j = obj.replace("_skinJoint_", "_outJoint_")
            if "_surf_" not in out_j or "_outJoint_" not in out_j:
                cmds.warning(f" {obj} is not a surface joint of the module")
                continue

            for j in (out_j, utils.getOpposite(out_j)):
                if j not in out_joints and cmds.objExists(j):
                    out_joints.append(j)

        for out_j in out_joints:
            self.delete_joint(out_j)

        cmds.select(clear=1)

    def delete_joint(self, out_j):
        """Один модульный джоинт поверхности со всем, что на нём висит."""
        skin_j = out_j.replace("_outJoint_", "_skinJoint_")

        # координата берётся из связи самого джоинта, а не по имени: только она
        # и говорит, каким элементом uvPin он ведётся
        plug = cmds.connectionInfo(out_j+".offsetParentMatrix", sourceFromDestination=True)
        if plug and ".outputMatrix[" in plug:
            uvPin = plug.split(".")[0]
            index = plug.split(".outputMatrix[")[1].split("]")[0]
            cmds.removeMultiInstance(f"{uvPin}.outputMatrix[{index}]", b=True)
            cmds.removeMultiInstance(f"{uvPin}.coordinate[{index}]", b=True)
        else:
            cmds.warning(f" {out_j} is not driven by a uvPin, only the joints are deleted")

        # ноды матриц скинового джоинта: имена им даёт connectByMatrix
        for n in (skin_j+"_decMat", skin_j+"_multMat", skin_j, out_j):
            if cmds.objExists(n):
                cmds.delete(n)

    def delete_surface_joints(self, i):
        """Все кости поверхности i - на обеих сторонах.

        Ищутся по имени группы и точному префиксу, а не по выделению: сетка
        пересобирается целиком, и брать надо ровно её кости.
        """
        m_name = self.name
        m_name_opp = utils.getOpposite(m_name)

        removed = 0
        for name in (m_name, m_name_opp):
            group = f"{name}_surf_outJoint"
            if not cmds.objExists(group):
                continue

            prefix = f"{name}_surf_{i}_outJoint_"
            for j in cmds.listRelatives(group, children=True) or []:
                if j.startswith(prefix):
                    self.delete_joint(j)
                    removed += 1

        return removed

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

                # Место косточки вдоль кривой правится здесь, на скиновой кости:
                # её и выделяют, и её значение уходит в темплейт. Дальше оно
                # идёт в pos ведущей кости, а оттуда в uValue пути, так что
                # зеркальная сторона подхватывается сама - её mpath и без того
                # ведётся левым jnt.pos.
                cmds.addAttr(sj, ln="pos", min=0, max=1, dv=value, k=1)
                pm.connectAttr(f"{sj}.pos", f"{jnt}.pos")

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
                sj_opp = f"{crv_opp}_{i}_skinJoint"
                cmds.joint(name=sj_opp)
                cmds.parent(sj_opp, f"{m_name_opp}_crv_skinJoint")
                utils.removeTransformParentJoint(sj_opp)
                utils.resetAttrs(sj_opp)
                utils.connectByMatrix(sj_opp, [jnt_opp, sj_opp], ["worldMatrix[0]", "parentInverseMatrix"], module_name=m_name_opp)

                # Ведомый: обе стороны стоят на одном значении, как и пути
                cmds.addAttr(sj_opp, ln="pos", min=0, max=1, dv=value, k=1)
                pm.connectAttr(f"{sj}.pos", f"{sj_opp}.pos")

    def connect(self, target, opposite=False, makeSeamless=False):
        super(self.__class__, self).connect(target, opposite=opposite, makeSeamless=makeSeamless)

        # the wing scales with the root joint of the parent module - scaling
        # the joint it is connected to must not scale the wing
        if self.parent:
            utils.scaleFromRoot(self.name, self.parent)

        if opposite:
            # these connections are module internal, disconnect() does not
            # break them - on reconnect they are already there, so make only
            # the missing ones
            for o in cmds.ls(f"{self.name}_*_closed"):
                for attr in [".t", ".r"]:
                    src, dst = "l"+o[1:]+attr, o+attr
                    if not cmds.isConnected(src, dst):
                        cmds.connectAttr(src, dst, f=True)

    def disconnect(self):
        super(self.__class__, self).disconnect()

        utils.removeScaleFromRoot(self.name)
