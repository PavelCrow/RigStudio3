"""Bake selected Rig Studio limbs between FK and IK as a standalone Maya script.

Select a control on each limb, then run bakeFkToIk(). Defaults to the
playback range, sampling every frame (including both range endpoints).
Source control curves are retained. Destination keys inside the range are replaced.
Guard keys and preserved outside tangents keep the surrounding animation intact.
Pose matching uses the existing helpers as a starting pose, then solves against
the evaluated output joints. Reflections are handled without side-specific offsets.
FK to IK preserves joint positions and end-effector poses. Independent FK
segment roll cannot be reproduced by a rotate-plane IK chain.
Open the frame-range dialog with switchIkFkAnimation.window().
"""

import math
import maya.cmds as cmds
import maya.OpenMaya as om
import maya.api.OpenMaya as OpenMaya

# Rig Studio control lookup and initial pose matching (Pavel Korolyov).


def _getModuleName(obj):
    if obj == None or obj == '' or (not cmds.objExists(obj)):
        return None
    j = obj.replace('skinJoint', 'outJoint')
    path = cmds.ls(j, l=1) or []
    moduleName = path[0].split('modules|')[-1].split('_mod|')[0].split('_mod')[0].split(':')[-1]
    return moduleName


def _getInternalNameFromControl(controlName):
    if cmds.objExists(controlName + '.internalName'):
        return cmds.getAttr(controlName + '.internalName')
    else:
        return ''


def _getControlNameFromInternal(module_name, internalControlName):
    ctrls = _getSetObjects(module_name + '_moduleControlSet')
    for c in ctrls:
        try:
            int_name = cmds.getAttr(c + '.internalName')
            if int_name == internalControlName:
                return c
        except:
            pass
    return ''


def _getSetObjects(set):
    objects = []
    if cmds.sets(set, q=1) == None:
        return []
    for o in cmds.sets(set, q=1):
        if cmds.objectType(o) == 'objectSet':
            innerObjects = _getSetObjects(o)
            objects += innerObjects
        else:
            objects.append(o)
    return objects


def _getNS(ctrl):
    if ':' in ctrl:
        ctrl_name = ctrl.split(':')[-1]
        ns_ = ctrl.split(ctrl_name)[0]
        return ns_
    else:
        return ''


def _getInputNode(obj, attr):
    if cmds.connectionInfo(obj + '.' + attr, isDestination=True):
        inputAttr = cmds.connectionInfo(obj + '.' + attr, sourceFromDestination=True)
        inputNode = inputAttr.split('.')[0]
        return inputNode
    return None


def _getOutputNodes(obj, attr):
    """Возвращает узел, подключенный К атрибуту obj.attr (destination)"""
    if cmds.connectionInfo(obj + '.' + attr, isSource=True):
        outputAttrs = cmds.connectionInfo(obj + '.' + attr, destinationFromSource=True)
        outputNodes = []
        for a in outputAttrs:
            outputNodes.append(a.split('.')[0])
        return outputNodes
    return None


def _getConnectedFootModule(control):
    outputs = cmds.connectionInfo(control + '.ikFk', destinationFromSource=True)
    for attr in outputs:
        if attr.split('.')[-1] == 'ikFk':
            in_node = attr.split('.')[0]
            child_m_name = _getModuleName(in_node)
            ns = _getNS(control)
            return ns + child_m_name
    return False


def _objectType(node):
    type = cmds.objectType(node)
    version = int(cmds.about(v=True).split(' ')[0])
    if version >= 2026:
        if type == 'multDL':
            type = 'multDoubleLinear'
    return type


def _get_lengths(control, m_name):
    quad = cmds.objExists(control + '.length3')
    lengths = []

    def get_element_scale(part):
        out_nodes = _getOutputNodes(control, f'length{part}')
        for node in out_nodes:
            if _objectType(node) == 'multDoubleLinear':
                scale = cmds.getAttr(node + '.input1')
                return scale
    init_scale1 = get_element_scale(part=1)

    def get_local_length(j):
        vector = cmds.getAttr(j + '.t')[0]
        x, y, z = vector
        length = math.sqrt(x ** 2 + y ** 2 + z ** 2)
        return length
    if cmds.objExists(m_name + '_b_finalJoint'):
        local_length_1 = get_local_length(m_name + '_b_finalJoint')
        length_1 = local_length_1 / init_scale1
        if length_1 < 0:
            length_1 *= -1
        init_scale2 = get_element_scale(part=2)
        if quad:
            local_length_2 = get_local_length(m_name + '_c_finalJoint')
        else:
            local_length_2 = get_local_length(m_name + '_end_finalJoint')
        length_2 = local_length_2 / init_scale2
        if length_2 < 0:
            length_2 *= -1
        lengths = [length_1, length_2]
        if quad:
            local_length_3 = get_element_scale(part=3)
            cur_scale3 = get_local_length(m_name + '_end_finalJoint')
            length_3 = cur_scale3 / local_length_3
            if length_3 < 0:
                length_3 *= -1
            lengths.append(length_3)
    else:
        p0 = cmds.xform(m_name + '_root_outJoint', ws=1, q=1, t=1)
        p1 = cmds.xform(m_name + '_knee_outJoint', ws=1, q=1, t=1)
        v0 = OpenMaya.MVector(p0)
        v1 = OpenMaya.MVector(p1)
        v = v1 - v0
        l = v.length()
        scl = cmds.getAttr(m_name + '_root_connector_decomposeMatrix.outputScaleX')
        scl_converted = l / scl
        length_1 = scl_converted / init_scale1
        if not quad:
            p0 = cmds.xform(m_name + '_b_finalJoint', ws=1, q=1, t=1)
            p1 = cmds.xform(m_name + '_end_outJoint', ws=1, q=1, t=1)
            v0 = OpenMaya.MVector(p0)
            v1 = OpenMaya.MVector(p1)
            v = v1 - v0
            l = v.length()
            scl_converted = l / scl
            init_scale2 = cmds.getAttr(m_name + '_initScaleEnd_mult.input1')
            length_3 = scl_converted / init_scale2
        else:
            p0 = cmds.xform(m_name + '_knee_outJoint', ws=1, q=1, t=1)
            p1 = cmds.xform(m_name + '_ankle_outJoint', ws=1, q=1, t=1)
            v0 = OpenMaya.MVector(p0)
            v1 = OpenMaya.MVector(p1)
            v = v1 - v0
            l = v.length()
            scl_converted = l / scl
            init_scale2 = cmds.getAttr(m_name + '_initScale2_mult.input1')
            length_3 = scl_converted / init_scale2
            p0 = cmds.xform(m_name + '_ankle_outJoint', ws=1, q=1, t=1)
            p1 = cmds.xform(m_name + '_end_outJoint', ws=1, q=1, t=1)
            v0 = OpenMaya.MVector(p0)
            v1 = OpenMaya.MVector(p1)
            v = v1 - v0
            l = v.length()
            scl_converted = l / scl
            init_scale2 = cmds.getAttr(m_name + '_initScaleEnd_mult.input1')
            length_2 = scl_converted / init_scale2
    return lengths


def _from_fk_to_ik(control):

    def snapIkElbow(sourceA, sourceB, sourceC, target):
        aPos = cmds.xform(sourceA, t=1, q=1, worldSpace=1)
        bPos = cmds.xform(sourceB, t=1, q=1, worldSpace=1)
        cPos = cmds.xform(sourceC, t=1, q=1, worldSpace=1)
        a = OpenMaya.MVector(aPos)
        b = OpenMaya.MVector(bPos)
        c = OpenMaya.MVector(cPos)
        ab = OpenMaya.MVector(b - a)
        ac = OpenMaya.MVector(c - a)
        acLen = OpenMaya.MVector(ac).length()
        pr = ab * ac / acLen
        acNorm = OpenMaya.MVector(ac).normal()
        ce = acNorm * pr
        e = ce + a
        eb = b - e
        ebNorm = OpenMaya.MVector(eb).normal()
        if cmds.objExists(m_name + '_mod.aim_offset'):
            scale = cmds.getAttr(m_name + '_mainPoser_decomposeMatrix.outputScaleX')
            offset = cmds.getAttr(m_name + '_mod.aim_offset') * scale
        else:
            offset = 0.5
        elbowV = ebNorm * offset + b
        cmds.xform(target, t=elbowV, worldSpace=1)
    ns = _getNS(control)
    foot_m = _getConnectedFootModule(control)
    m_name = ns + _getModuleName(control)
    quad = cmds.objExists(control + '.length3')
    if quad:
        length_1, length_2, length_3 = _get_lengths(control, m_name)
    else:
        length_1, length_2 = _get_lengths(control, m_name)
    if cmds.objExists(m_name + '_a_finalJoint'):
        joint_1 = m_name + '_a_finalJoint'
        if quad:
            joint_2 = m_name + '_b_finalJoint'
            joint_3 = m_name + '_c_finalJoint'
        else:
            joint_2 = m_name + '_b_finalJoint'
        joint_last = m_name + '_end_finalJoint'
    else:
        joint_1 = m_name + '_root_outJoint'
        if quad:
            joint_2 = m_name + '_knee_outJoint'
            joint_3 = m_name + '_ankle_outJoint'
        else:
            joint_2 = m_name + '_knee_outJoint'
        joint_last = m_name + '_end_outJoint'
    root_ctrl = _getControlNameFromInternal(m_name, 'ik_root')
    end_ctrl = _getControlNameFromInternal(m_name, 'ik_end')
    aim_ctrl = _getControlNameFromInternal(m_name, 'ik_aim')
    ankle_ctrl = _getControlNameFromInternal(m_name, 'ik_ankle')
    _snap(root_ctrl)
    if foot_m:
        heel_ctrl = _getControlNameFromInternal(foot_m, 'ik_heel') or None
        foot_ctrl = _getControlNameFromInternal(foot_m, 'ik_foot')
        toe_ctrl = _getControlNameFromInternal(foot_m, 'ik_toe')
        try:
            if heel_ctrl:
                for a in ['.rx', '.ry', '.rz']:
                    cmds.setAttr(heel_ctrl + a, 0)
        except:
            pass
        try:
            cmds.setAttr(foot_ctrl + '.hill', 0)
            toeTip_ctrl = _getControlNameFromInternal(foot_m, 'toeTip')
            for a in ['.rx', '.ry', '.rz']:
                cmds.setAttr(toeTip_ctrl + a, 0)
        except:
            pass
        _snap(foot_ctrl)
        _snap(toe_ctrl)
    else:
        _snap(end_ctrl)
    if quad:
        snapIkElbow(joint_1, joint_2, joint_3, aim_ctrl)
        _snap(ankle_ctrl)
    else:
        snapIkElbow(joint_1, joint_2, joint_last, aim_ctrl)
    cmds.setAttr(control + '.ikFk', 1)
    cmds.setAttr(control + '.length1', length_1)
    if quad:
        cmds.setAttr(control + '.length2', length_2)
        cmds.setAttr(control + '.length3', length_3)
    else:
        cmds.setAttr(control + '.length2', length_2)


def _from_ik_to_fk(control):
    ns = _getNS(control)
    m_name = ns + _getModuleName(control)
    foot_m = _getConnectedFootModule(control)
    quad = cmds.objExists(control + '.length3')
    if cmds.objExists(m_name + '_b_finalJoint'):
        if quad:
            length_1, length_2, length_3 = _get_lengths(control, m_name)
        else:
            length_1, length_2 = _get_lengths(control, m_name)
    else:

        def get_element_scale(part):
            out_nodes = _getOutputNodes(control, f'length{part}')
            for node in out_nodes:
                if _objectType(node) == 'multDoubleLinear':
                    scale = cmds.getAttr(node + '.input1')
                    return scale
        init_scale1 = get_element_scale(part=1)
        p0 = cmds.xform(m_name + '_root_outJoint', ws=1, q=1, t=1)
        p1 = cmds.xform(m_name + '_knee_outJoint', ws=1, q=1, t=1)
        v0 = OpenMaya.MVector(p0)
        v1 = OpenMaya.MVector(p1)
        v = v1 - v0
        l = v.length()
        scl = cmds.getAttr(m_name + '_root_connector_decomposeMatrix.outputScaleX')
        scl_converted = l / scl
        length_1 = scl_converted / init_scale1
        if not quad:
            p0 = cmds.xform(m_name + '_b_finalJoint', ws=1, q=1, t=1)
            p1 = cmds.xform(m_name + '_end_outJoint', ws=1, q=1, t=1)
            v0 = OpenMaya.MVector(p0)
            v1 = OpenMaya.MVector(p1)
            v = v1 - v0
            l = v.length()
            scl_converted = l / scl
            init_scale2 = cmds.getAttr(m_name + '_initScaleEnd_mult.input1')
            length_3 = scl_converted / init_scale2
        else:
            p0 = cmds.xform(m_name + '_knee_outJoint', ws=1, q=1, t=1)
            p1 = cmds.xform(m_name + '_ankle_outJoint', ws=1, q=1, t=1)
            v0 = OpenMaya.MVector(p0)
            v1 = OpenMaya.MVector(p1)
            v = v1 - v0
            l = v.length()
            scl_converted = l / scl
            init_scale2 = cmds.getAttr(m_name + '_initScale2_mult.input1')
            length_3 = scl_converted / init_scale2
            p0 = cmds.xform(m_name + '_ankle_outJoint', ws=1, q=1, t=1)
            p1 = cmds.xform(m_name + '_end_outJoint', ws=1, q=1, t=1)
            v0 = OpenMaya.MVector(p0)
            v1 = OpenMaya.MVector(p1)
            v = v1 - v0
            l = v.length()
            scl_converted = l / scl
            init_scale2 = cmds.getAttr(m_name + '_initScaleEnd_mult.input1')
            length_2 = scl_converted / init_scale2
    _snap(_getControlNameFromInternal(m_name, 'fk_a'))
    _snap(_getControlNameFromInternal(m_name, 'fk_b'))
    if quad:
        _snap(_getControlNameFromInternal(m_name, 'fk_c'))
    if foot_m:
        _snap(_getControlNameFromInternal(foot_m, 'fk_heel'))
        _snap(_getControlNameFromInternal(foot_m, 'fk_toe'))
    else:
        _snap(_getControlNameFromInternal(m_name, 'fk_end'))
    cmds.setAttr(control + '.length1', length_1)
    if quad:
        cmds.setAttr(control + '.length2', length_2)
        cmds.setAttr(control + '.length3', length_3)
    else:
        cmds.setAttr(control + '.length2', length_2)
    cmds.setAttr(control + '.ikFk', 0)


def _snap(target, rev=True):
    ns = _getNS(target)
    m_name = ns + _getModuleName(target)
    source = m_name + '_' + _getInternalNameFromControl(target) + '_ikFkSwitchHelper'
    if not cmds.objExists(source) or not cmds.objExists(target):
        return
    targetParent = cmds.listRelatives(target, parent=True)
    rotOrderTarget = cmds.getAttr('%s.rotateOrder' % target)
    matrixList = cmds.getAttr('%s.worldMatrix' % source)
    mMatrix = om.MMatrix()
    om.MScriptUtil.createMatrixFromList(matrixList, mMatrix)
    parent_floatList = cmds.xform(targetParent, q=True, matrix=1, worldSpace=1)
    parent_matrix = om.MMatrix()
    om.MScriptUtil.createMatrixFromList(parent_floatList, parent_matrix)
    invMatrixParent = parent_matrix.inverse()
    final_matrix = mMatrix * invMatrixParent
    mTransformMtx = om.MTransformationMatrix(final_matrix)
    rotOrderTarget = cmds.getAttr('%s.rotateOrder' % target)
    eulerRot = mTransformMtx.eulerRotation()
    eulerRot.reorderIt(rotOrderTarget)
    angles = [math.degrees(angle) for angle in (eulerRot.x, eulerRot.y, eulerRot.z)]
    cmds.rotate(angles[0], angles[1], angles[2], target, os=True)
    tr = cmds.xform(source, q=True, t=True, ws=True)
    cmds.move(tr[0], tr[1], tr[2], target, rotatePivotRelative=True)
    pass



def _match_name(node):
    # The existing matcher extracts namespaces from names, not DAG paths.
    name = node.rsplit("|", 1)[-1]
    if len(cmds.ls(name, long=True) or []) != 1:
        raise RuntimeError("Control name is ambiguous: " + name)
    return name


def _control(module, name, required=True):
    node = _getControlNameFromInternal(module, name)
    if required and not node:
        raise RuntimeError("Missing {} control in {}".format(name, module))
    return _match_name(node) if node else node


def _targets(switch, to_ik=True, include_auxiliary=True):
    module = _getNS(switch) + _getModuleName(switch)
    foot = _getConnectedFootModule(switch)
    if not to_ik:
        nodes = [_control(module, "fk_a"), _control(module, "fk_b")]
        if cmds.objExists(switch + ".length3"):
            nodes.append(_control(module, "fk_c"))
        if foot:
            nodes.extend(_control(foot, name) for name in ("fk_heel", "fk_toe"))
        else:
            nodes.append(_control(module, "fk_end"))
        snapped = list(nodes)
    else:
        nodes = [_control(module, "ik_root"), _control(module, "ik_aim")]
        snapped = [nodes[0]]
    if to_ik and foot:
        for name in ("ik_foot", "ik_toe"):
            node = _control(foot, name)
            nodes.append(node)
            snapped.append(node)
        if include_auxiliary:
            for name in ("ik_heel", "toeTip"):
                node = _control(foot, name, required=False)
                if node:
                    nodes.append(node)
    elif to_ik:
        node = _control(module, "ik_end")
        nodes.append(node)
        snapped.append(node)
    if to_ik and cmds.objExists(switch + ".length3"):
        node = _control(module, "ik_ankle")
        nodes.append(node)
        snapped.append(node)
    if foot:
        # Connecting a foot hides the limb's end control, but does not remove
        # it from the evaluation graph. Its transform still drives the limb's
        # end joint / the foot connector. The pose solver must be able to vary
        # and bake it together with the visible foot controls in either mode.
        end = _control(module, "ik_end" if to_ik else "fk_end", required=False)
        if end and end not in nodes:
            nodes.append(end)
    for node in snapped:
        owner = _getNS(node) + _getModuleName(node)
        helper = owner + "_" + _getInternalNameFromControl(node) + "_ikFkSwitchHelper"
        if not cmds.objExists(helper):
            raise RuntimeError("Missing pose helper: " + helper)
    plugs = []
    for node in nodes:
        for attr in ("tx", "ty", "tz", "rx", "ry", "rz", "hill"):
            if attr == "hill" and not include_auxiliary:
                continue
            plug = node + "." + attr
            if cmds.objExists(plug) and cmds.getAttr(plug, settable=True):
                plugs.append(plug)
    for attr in ("ikFk", "length1", "length2", "length3"):
        plug = switch + "." + attr
        if cmds.objExists(plug):
            if not cmds.getAttr(plug, settable=True):
                raise RuntimeError("Cannot write " + plug)
            plugs.append(plug)
    return plugs


def _pose_joints(switch):
    """The deformation output is the common reference for both control modes."""
    module = _getNS(switch) + _getModuleName(switch)
    suffixes = ("a_finalJoint", "b_finalJoint", "c_finalJoint", "end_finalJoint")
    joints = [module + "_" + suffix for suffix in suffixes
              if cmds.objExists(module + "_" + suffix)]
    if not joints:
        joints = [module + "_" + suffix for suffix in
                  ("root_outJoint", "knee_outJoint", "ankle_outJoint", "end_outJoint")
                  if cmds.objExists(module + "_" + suffix)]
    foot = _getConnectedFootModule(switch)
    if foot:
        joints.extend(foot + "_" + suffix for suffix in
                      ("root_outJoint", "toe_outJoint")
                      if cmds.objExists(foot + "_" + suffix))
    if not joints:
        raise RuntimeError("No output joints found for " + switch)
    return joints


def _fit_pose(joints, world_matrices, plugs, max_iterations=60, orientation_joints=None):
    """Solve editable channels against evaluated world poses using damped LS.

    Maya itself is the forward model, including mirrored parents, pivots,
    rotateAxis, rotate orders and offsetParentMatrix. Rotation errors are
    measured on the relative matrix, whose reflection cancels between the
    same output joint before and after the switch. No Euler decomposition
    of a reflected helper matrix is used as the final answer.
    """
    import numpy as np
    from maya.api import OpenMaya as om

    goal = [np.asarray(matrix, dtype=float).reshape(4, 4) for matrix in world_matrices]
    extent = max((np.linalg.norm(m[3, :3] - goal[0][3, :3]) for m in goal), default=0.0)
    extent = max(extent, float(np.linalg.norm(goal[0][0, :3])), 1e-6)
    inverse_basis = [np.linalg.inv(m[:3, :3]) for m in goal]
    # Solve in comparable units: translations relative to limb size, rotations
    # in radians, and dimensionless custom channels in their native units.
    units = np.array([180.0 / math.pi if p.rsplit('.', 1)[-1] in ('rx', 'ry', 'rz')
                      else extent if p.rsplit('.', 1)[-1] in ('tx', 'ty', 'tz')
                      else 1.0 for p in plugs])
    x = np.array([cmds.getAttr(p) for p in plugs], dtype=float) / units
    lower, upper = [], []
    for plug, unit in zip(plugs, units):
        node, attr = plug.rsplit('.', 1)
        lower.append(cmds.attributeQuery(attr, node=node, minimum=True)[0] / unit
                     if cmds.attributeQuery(attr, node=node, minExists=True) else -np.inf)
        upper.append(cmds.attributeQuery(attr, node=node, maximum=True)[0] / unit
                     if cmds.attributeQuery(attr, node=node, maxExists=True) else np.inf)
    lower, upper = np.asarray(lower), np.asarray(upper)
    orientation_joints = set(joints if orientation_joints is None else orientation_joints)

    def apply(values):
        for plug, value in zip(plugs, values * units):
            cmds.setAttr(plug, float(value))

    def residual():
        result = []
        for joint, wanted, inv in zip(joints, goal, inverse_basis):
            current = np.asarray(cmds.getAttr(joint + '.worldMatrix[0]')).reshape(4, 4)
            result.extend((current[3, :3] - wanted[3, :3]) / extent)
            delta = current[:3, :3] @ inv
            u, singular, vh = np.linalg.svd(delta)
            rotation = u @ vh
            if np.linalg.det(rotation) < 0:
                raise RuntimeError("Output handedness changed on " + joint)
            matrix = np.eye(4)
            matrix[:3, :3] = rotation
            q = om.MTransformationMatrix(om.MMatrix(matrix.ravel().tolist())).rotation(asQuaternion=True)
            if q.w < 0:
                q = om.MQuaternion(-q.x, -q.y, -q.z, -q.w)
            vector = np.array([q.x, q.y, q.z])
            length = np.linalg.norm(vector)
            result.extend(vector * (2.0 * math.atan2(length, q.w) / length if length > 1e-12 else 2.0)
                          if joint in orientation_joints else np.zeros(3))
            # Also preserve output stretch/shear, not just joint origins.
            result.extend((delta @ rotation.T - np.eye(3)).ravel())
        return np.asarray(result)

    error = residual()
    damping = 1e-4
    for iteration in range(max_iterations):
        if np.max(np.abs(error)) < 1e-5:
            return
        columns = []
        h = 1e-4
        for i in range(len(x)):
            shifted = x.copy()
            shifted[i] = min(x[i] + h, upper[i])
            if shifted[i] == x[i]:
                shifted[i] = max(x[i] - h, lower[i])
            distance = shifted[i] - x[i]
            apply(shifted)
            columns.append((residual() - error) / distance if distance else np.zeros_like(error))
        apply(x)
        jacobian = np.column_stack(columns)
        accepted = False
        for attempt in range(8):
            delta = np.linalg.lstsq(
                np.vstack((jacobian, math.sqrt(damping) * np.eye(len(x)))),
                np.concatenate((-error, np.zeros(len(x)))), rcond=None)[0]
            largest = np.max(np.abs(delta))
            if largest > 1.0:
                delta /= largest
            proposed = np.clip(x + delta, lower, upper)
            apply(proposed)
            candidate = residual()
            if np.dot(candidate, candidate) < np.dot(error, error):
                x = proposed
                error = candidate
                damping = max(damping * 0.3, 1e-10)
                accepted = True
                break
            damping *= 10.0
        if not accepted:
            apply(x)
            break
    if np.max(np.abs(error)) >= 1e-5:
        index = int(np.argmax(np.abs(error)))
        joint_index, component = divmod(index, 15)
        kind = "position" if component < 3 else "rotation" if component < 6 else "scale/shear"
        raise RuntimeError(
            "Cannot preserve output pose: {} residual {:.3g} on {} at frame {}".format(
                kind, float(abs(error[index])), joints[joint_index], cmds.currentTime(q=True)))


def _seed_orientations(plugs, helper_matrices, joints, goal_matrices, orientation_joints):
    """Resolve reflected helper frames by evaluating the destination outputs.

    A reflected basis has three possible single-axis reflection removals.
    Pick the one that reproduces the requested output pose, rather than
    assuming Maya's decomposition assigns the negative scale to the right axis.
    """
    import numpy as np
    from maya.api import OpenMaya as om

    goals = {j: np.asarray(m).reshape(4, 4) for j, m in zip(joints, goal_matrices)}
    orientations = set(orientation_joints)
    positions = [goals[j][3, :3] for j in joints]
    extent = max((np.linalg.norm(p - positions[0]) for p in positions), default=0.0)
    extent = max(extent, float(np.linalg.norm(goals[joints[0]][0, :3])), 1e-6)

    def score():
        value = 0.0
        for joint in joints:
            current = np.asarray(cmds.getAttr(joint + '.worldMatrix[0]')).reshape(4, 4)
            # Reflection candidates can have similar output orientations while
            # placing a child pivot on opposite sides of its parent. Evaluate
            # positions as well, in units relative to the captured limb size.
            value += float(np.sum(((current[3, :3] - goals[joint][3, :3]) / extent) ** 2))
            if joint in orientations:
                delta = current[:3, :3] @ np.linalg.inv(goals[joint][:3, :3])
                value += float(np.sum((delta - np.eye(3)) ** 2))
        return value

    nodes = sorted(helper_matrices, key=lambda n: (cmds.ls(n, long=True)[0].count('|'), n))
    for node in nodes:
        rotation_plugs = [node + '.' + attr for attr in ('rx', 'ry', 'rz')]
        if not all(p in plugs for p in rotation_plugs):
            continue
        parent_inverse = om.MMatrix(cmds.getAttr(node + '.parentInverseMatrix[0]'))
        local = om.MMatrix(helper_matrices[node]) * parent_inverse
        basis = np.asarray(list(local)).reshape(4, 4)[:3, :3]
        scale = np.asarray(cmds.getAttr(node + '.scale')[0])
        basis = np.diag(np.sign(scale)) @ basis
        u, _, vh = np.linalg.svd(basis)
        handedness = np.linalg.det(u @ vh)
        axis = cmds.getAttr(node + '.rotateAxis')[0]
        rotate_axis = om.MEulerRotation(*[math.radians(v) for v in axis]).asMatrix()
        order = cmds.getAttr(node + '.rotateOrder')
        reference = om.MEulerRotation(
            *[math.radians(cmds.getAttr(p)) for p in rotation_plugs], order)
        best = [cmds.getAttr(p) for p in rotation_plugs]
        best_score = score()
        corrections = [np.eye(3)] if handedness > 0 else [np.diag(s) for s in
                       ((-1, 1, 1), (1, -1, 1), (1, 1, -1))]
        for correction in corrections:
            matrix = np.eye(4)
            matrix[:3, :3] = correction @ u @ vh
            euler = om.MTransformationMatrix(
                rotate_axis.inverse() * om.MMatrix(matrix.ravel().tolist())).rotation()
            euler.reorderIt(order)
            euler = euler.closestSolution(reference)
            values = [math.degrees(v) for v in euler]
            for p, v in zip(rotation_plugs, values):
                cmds.setAttr(p, v)
            error = score()
            if error < best_score:
                best_score, best = error, values
        for p, v in zip(rotation_plugs, best):
            cmds.setAttr(p, v)


def matchPose(switch, to_ik=True):
    """Match one limb and return the maximum unrepresentable segment roll in degrees.

    The existing matcher supplies an initial guess only. A common numerical
    solve corrects it using the output joints, with no left/right conditions.
    On failure restore every destination channel and the original IK/FK mode.
    """
    switch = _match_name(switch)
    target_mode = 1 if to_ik else 0
    if abs(cmds.getAttr(switch + '.ikFk') - target_mode) < 1e-6:
        return 0.0
    plugs = _targets(switch, to_ik)
    original = {p: cmds.getAttr(p) for p in plugs}
    joints = _pose_joints(switch)
    matrices = [cmds.getAttr(j + '.worldMatrix[0]') for j in joints]
    helper_matrices = {}
    for node in set(p.rsplit('.', 1)[0] for p in plugs):
        internal = _getInternalNameFromControl(node)
        if not internal:
            continue
        helper = _getNS(node) + _getModuleName(node) + '_' + internal + '_ikFkSwitchHelper'
        if cmds.objExists(helper):
            helper_matrices[node] = cmds.getAttr(helper + '.worldMatrix[0]')
    try:
        seed = _from_fk_to_ik if to_ik else _from_ik_to_fk
        seed(switch)
        seed_positions = {node: cmds.xform(node, q=True, worldSpace=True, rotatePivot=True)
                          for node in set(p.rsplit('.', 1)[0] for p in plugs)
                          if all(node + '.' + a in plugs for a in ('tx', 'ty', 'tz'))}
        orientation_joints = joints
        if to_ik:
            # A rotate-plane IK chain determines the intermediate frames from
            # its joint positions. Arbitrary FK segment roll is not a degree
            # of freedom of that chain. Match all pivots, plus the full poses
            # of the end effector and the attached foot.
            module = _getNS(switch) + _getModuleName(switch)
            orientation_joints = [j for j in joints if j in
                                  (module + '_end_finalJoint', module + '_end_outJoint')
                                  or not j.startswith(module + '_')]
        # Heel / toe-tip roll controls are reset by the initial matcher. They
        # are baked, but remain neutral during fitting: letting them counter-
        # rotate the main foot creates many indistinguishable skeleton poses.
        solve_plugs = [p for p in _targets(switch, to_ik, include_auxiliary=False)
                       if not p.endswith('.ikFk')]
        _seed_orientations(solve_plugs, helper_matrices, joints, matrices, orientation_joints)
        # Dynamic parent spaces can move a pole/root when an end orientation
        # changes. Reapply the captured world positions after choosing rotations.
        for node in sorted(seed_positions, key=lambda n: cmds.ls(n, long=True)[0].count('|')):
            cmds.move(*seed_positions[node], node, worldSpace=True, rotatePivotRelative=True)
        _fit_pose(joints, matrices, solve_plugs,
                  orientation_joints=orientation_joints)
        roll = 0.0
        if to_ik:
            import numpy as np
            for joint, wanted in zip(joints, matrices):
                if joint in orientation_joints:
                    continue
                current = np.asarray(cmds.getAttr(joint + '.worldMatrix[0]')).reshape(4, 4)
                delta = current[:3, :3] @ np.linalg.inv(np.asarray(wanted).reshape(4, 4)[:3, :3])
                u, _, vh = np.linalg.svd(delta)
                angle = math.degrees(math.acos(float(np.clip((np.trace(u @ vh) - 1) * 0.5, -1, 1))))
                roll = max(roll, angle)
        return roll
    except Exception:
        for plug, value in original.items():
            cmds.setAttr(plug, value)
        raise


def _continuous_rotations(values, reference):
    """Choose equivalent Euler values near the preceding sample, in rotateOrder.

    Only the stored representation changes; the solved local rotation is kept.
    Respect channel limits even when they prevent using the closest solution.
    """
    from maya.api import OpenMaya as om

    nodes = sorted({p.rsplit('.', 1)[0] for p in values})
    for node in nodes:
        plugs = [node + '.' + a for a in ('rx', 'ry', 'rz')]
        if not all(p in values and p in reference for p in plugs):
            continue
        order = cmds.getAttr(node + '.rotateOrder')
        rotation = om.MEulerRotation(*[math.radians(values[p]) for p in plugs], order)
        previous = om.MEulerRotation(*[math.radians(reference[p]) for p in plugs], order)
        closest = [math.degrees(v) for v in rotation.closestSolution(previous)]
        allowed = True
        for plug, value in zip(plugs, closest):
            attr = plug.rsplit('.', 1)[1]
            if (cmds.attributeQuery(attr, node=node, minExists=True)
                    and value < cmds.attributeQuery(attr, node=node, minimum=True)[0]):
                allowed = False
            if (cmds.attributeQuery(attr, node=node, maxExists=True)
                    and value > cmds.attributeQuery(attr, node=node, maximum=True)[0]):
                allowed = False
        if allowed:
            values.update(zip(plugs, closest))


def _animation_curve(plug):
    """Resolve the direct curve explicitly; active Graph Editor keys are irrelevant."""
    curves = cmds.listConnections(plug, source=True, destination=False, type='animCurve') or []
    if len(curves) > 1:
        raise RuntimeError("Multiple animation curves drive " + plug)
    return curves[0] if curves else None


def _can_edit_animation(switches, plugs, to_ik):
    """Reject referenced source/destination animation before any scene mutation.

    Referenced rig controls with local animation remain supported. Reference
    ownership is checked on the animation curves, not on the controls.
    """
    source_plugs = {p for switch in switches for p in _targets(switch, not to_ik)}
    for plug in sorted(set(plugs) | source_plugs):
        curve = _animation_curve(plug)
        if curve and cmds.referenceQuery(curve, isNodeReferenced=True):
            cmds.warning("Анимация референсная и не может быть изменена.")
            return False
    for plug in plugs:
        curve = _animation_curve(plug)
        if curve and any(cmds.lockNode(curve, q=True, lock=True) or []):
            cmds.warning("Кривая анимации заблокирована. Перенос отменён: " + curve)
            return False
    return True


def _can_use_animation_layers(switches):
    """Unrelated scene layers must not block the selected limbs."""
    layers = cmds.ls(type='animLayer') or []
    if not layers:
        return True
    root_layer = cmds.animLayer(q=True, root=True)
    controls = set()
    for switch in switches:
        modules = [_getNS(switch) + _getModuleName(switch)]
        foot = _getConnectedFootModule(switch)
        if foot:
            modules.append(foot)
        for module in modules:
            control_set = module + '_moduleControlSet'
            if cmds.objExists(control_set):
                controls.update(node.rsplit('|', 1)[-1] for node in _getSetObjects(control_set))
    for layer in layers:
        if layer == root_layer:
            continue
        attributes = cmds.animLayer(layer, q=True, attribute=True) or []
        if not any(p.split('.', 1)[0].rsplit('|', 1)[-1] in controls for p in attributes):
            continue
        if cmds.referenceQuery(layer, isNodeReferenced=True):
            cmds.warning("Анимация референсная и не может быть изменена.")
            return False
        raise RuntimeError(
            "Выбранные конечности используют дополнительные анимационные слои. "
            "Перед переносом объедините их с базовым слоем.")
    return True


def _range_guard_values(plugs, start, end, step):
    """Capture the original channels just outside the replaced sample interval."""
    result = {}
    for plug in plugs:
        curve = _animation_curve(plug)
        times = (cmds.keyframe(curve, q=True, timeChange=True) or []) if curve else []
        before = max([start - step] + [t for t in times if start - step < t < start])
        after = min([end + step] + [t for t in times if end < t < end + step])
        result[plug] = {t: cmds.getAttr(plug, time=t) for t in (before, after)}
    return result


def _protect_range_edges(guards, start, end):
    """Bracket the edit and capture outside tangents after shape-preserving inserts.

    A new curve otherwise extrapolates its last baked value forever. On an
    existing curve, keeping key values alone does not preserve outside motion:
    automatic tangents can change when neighbouring keys are replaced.
    """
    tangents = {}
    for plug, values in guards.items():
        curve = _animation_curve(plug)
        times = (cmds.keyframe(curve, q=True, timeChange=True) or []) if curve else []
        animated = bool(times)
        for frame, value in values.items():
            if frame not in times:
                if animated:
                    cmds.setKeyframe(plug, time=frame, insert=True)
                else:
                    cmds.setKeyframe(plug, time=frame, value=value,
                                     inTangentType='linear', outTangentType='linear')
            if plug.endswith('.ikFk') and frame < start:
                cmds.keyTangent(_animation_curve(plug), animation='objects', time=(frame, frame), outTangentType='step')
        curve = _animation_curve(plug)
        times = (cmds.keyframe(curve, q=True, timeChange=True) or []) if curve else []
        fields = ('inAngle', 'outAngle', 'inWeight', 'outWeight',
                  'inTangentType', 'outTangentType', 'lock', 'weightLock')
        weighted = bool((cmds.keyTangent(curve, q=True, weightedTangents=True) or [False])[0])
        # Only the guard and its outside neighbour on each side can change.
        # Distant outside keys retain the same neighbours and need no edits.
        groups = ([i for i, frame in enumerate(times) if frame < start][-2:],
                  [i for i, frame in enumerate(times) if frame > end][:2])
        keys = []
        for indices in groups:
            if not indices:
                continue
            interval = (indices[0], indices[-1])
            data = {field: cmds.keyTangent(curve, q=True, index=interval, **{field: True})
                    for field in fields}
            keys.extend((times[i], {field: data[field][j] for field in fields})
                        for j, i in enumerate(indices))
        tangents[curve] = (weighted, keys)
    return tangents


def _restore_outside_tangents(tangents):
    """Keep the original outside curve segments, including weighted tangents."""
    for curve, (weighted, keys) in tangents.items():
        for frame, saved in keys:
            interval = (frame, frame)
            cmds.keyTangent(curve, animation='objects', time=interval, lock=False)
            if weighted:
                cmds.keyTangent(curve, animation='objects', time=interval, weightLock=False)
            for side in ('in', 'out'):
                kind = saved[side + 'TangentType']
                if kind in ('step', 'stepnext'):
                    args = {side + 'TangentType': kind}
                else:
                    args = {side + 'TangentType': 'fixed', side + 'Angle': saved[side + 'Angle']}
                    if weighted:
                        args[side + 'Weight'] = saved[side + 'Weight']
                cmds.keyTangent(curve, animation='objects', time=interval, **args)
            cmds.keyTangent(curve, animation='objects', time=interval, lock=saved['lock'])
            if weighted:
                cmds.keyTangent(curve, animation='objects', time=interval, weightLock=saved['weightLock'])


def bakeFkToIk(start=None, end=None, step=1.0):
    """Bake selected FK limbs to IK. Retained for existing shelf commands."""
    return bake(start=start, end=end, step=step, direction="fk_to_ik")


def bakeIkToFk(start=None, end=None, step=1.0):
    """Bake selected IK limbs to FK."""
    return bake(start=start, end=end, step=step, direction="ik_to_fk")


def bake(start=None, end=None, step=1.0, direction="fk_to_ik"):
    """Bake selected limbs; return sampled frame count. One Undo reverts the bake.

    Additional animation layers and driven destination channels are unsupported.
    Explicit start/end/step may be fractional. Sampling always includes end.
    Original values are restored on adjacent samples outside the selected range.
    Selected controls without an IK/FK switch are ignored.
    Limbs already in the target mode throughout the sampled range are left untouched.
    Returns zero without editing the scene when no selected limb needs transfer.
    """
    if direction not in ("fk_to_ik", "ik_to_fk"):
        raise ValueError("Expected direction 'fk_to_ik' or 'ik_to_fk'")
    to_ik = direction == "fk_to_ik"
    target_mode = 1 if to_ik else 0
    label = "FK to IK" if to_ik else "IK to FK"
    start = float(cmds.playbackOptions(q=True, minTime=True) if start is None else start)
    end = float(cmds.playbackOptions(q=True, maxTime=True) if end is None else end)
    step = float(step)
    if not all(math.isfinite(v) for v in (start, end, step)) or step <= 0 or end < start:
        raise ValueError("Expected finite start <= end and step > 0")
    selection = cmds.ls(sl=True, long=True) or []
    if not selection:
        raise RuntimeError("Select a control on each limb to bake")
    switches = []
    for node in selection:
        node = _match_name(node)
        module_name = _getModuleName(node)
        if not module_name:
            continue
        module = _getNS(node) + module_name
        switch = (_getInputNode(module + "_mod", "ikFk")
                  if cmds.objExists(module + "_mod.ikFk")
                  else _control(module, "control", required=False)
                  if cmds.objExists(module + "_moduleControlSet") else None)
        if not switch or not cmds.objExists(switch + ".ikFk"):
            continue
        switch = _match_name(switch)
        if switch not in switches:
            switches.append(switch)
    if not switches:
        cmds.warning("В выделении нет контроллов с переключением FK/IK.")
        return 0
    frames = [start + i * step for i in range(int(math.floor((end - start) / step)) + 1)]
    if end - frames[-1] > 1e-8:
        frames.append(end)
    # A limb may already be in the target mode now, but require transfer on
    # other samples. Inspect the requested range without moving the timeline
    # or opening an Undo chunk; skip only limbs that need no transfer anywhere.
    switches = [switch for switch in switches
                if any(abs(cmds.getAttr(switch + ".ikFk", time=frame) - target_mode) > 1e-6
                       for frame in frames)]
    if not switches:
        cmds.warning(
            "Выбранные конечности уже в режиме {} во всём выбранном диапазоне. "
            "Перенос не требуется.".format("IK" if to_ik else "FK"))
        return 0
    if not cmds.undoInfo(q=True, state=True):
        raise RuntimeError("Enable Maya Undo before baking")
    if not _can_use_animation_layers(switches):
        return 0
    plugs = sorted(set(plug for switch in switches for plug in _targets(switch, to_ik)))
    # Direct animation curves are editable; constraints/expressions are not.
    for plug in plugs:
        sources = cmds.listConnections(plug, source=True, destination=False) or []
        if any(not cmds.nodeType(source).startswith("animCurve") for source in sources):
            raise RuntimeError("Unsupported driven destination: " + plug)
    if not _can_edit_animation(switches, plugs, to_ik):
        return 0
    current = cmds.currentTime(q=True)
    auto_key = cmds.autoKeyframe(q=True, state=True)
    samples = []
    failed = False
    cmds.undoInfo(openChunk=True, chunkName="Bake " + label)
    try:
        cmds.autoKeyframe(state=False)
        guards = _range_guard_values(plugs, start, end, step)
        # Capture all poses before creating keys, so shared length attributes and
        # newly baked parents cannot change the source of later samples.
        for frame in frames:
            cmds.currentTime(frame, update=True)
            original = {plug: cmds.getAttr(plug) for plug in plugs}
            try:
                # Preserve the visible pose. Never activate inactive source
                # controls: their stored pose may be unrelated to this frame.
                for switch in switches:
                    mode = original[switch + ".ikFk"]
                    if min(abs(mode), abs(mode - 1)) > 1e-6:
                        raise RuntimeError(
                            "{}: кадр {} имеет смешанный IK/FK ({:g}). "
                            "Перенос смешанной позы пока не поддерживается.".format(
                                switch, frame, mode))
                for switch in switches:
                    if abs(original[switch + ".ikFk"] - target_mode) > 1e-6:
                        matchPose(switch, to_ik)
                values = {plug: cmds.getAttr(plug) for plug in plugs}
                _continuous_rotations(values, samples[-1] if samples else original)
                samples.append(values)
            finally:
                for plug, value in original.items():
                    cmds.setAttr(plug, value)
        tangents = _protect_range_edges(guards, start, end)
        for plug in plugs:
            cmds.cutKey(_animation_curve(plug), animation='objects', time=(start, end), clear=True)
        for frame, values in zip(frames, samples):
            for plug, value in values.items():
                if plug.endswith(".ikFk"):
                    cmds.setKeyframe(plug, time=frame, value=target_mode, outTangentType="step")
                else:
                    cmds.setKeyframe(plug, time=frame, value=value,
                                     inTangentType="linear", outTangentType="linear")
        _restore_outside_tangents(tangents)
    except Exception:
        failed = True
        raise
    finally:
        try:
            cmds.autoKeyframe(state=auto_key)
            cmds.currentTime(current, update=True)
            cmds.select(selection, replace=True)
        finally:
            cmds.undoInfo(closeChunk=True)
            if failed:
                cmds.undo()
    return len(frames)


_window = None
_WINDOW_NAME = "rigStudioBakeFkToIkWindow"


def window():
    """Show a compact Maya-parented dialog, using the current playback range."""
    global _window
    import maya.OpenMayaUI as OpenMayaUI
    if int(cmds.about(v=True).split(" ")[0]) <= 2024:
        from PySide2 import QtCore, QtWidgets
        from shiboken2 import wrapInstance
    else:
        from PySide6 import QtCore, QtWidgets
        from shiboken6 import wrapInstance

    ptr = OpenMayaUI.MQtUtil.mainWindow()
    parent = wrapInstance(int(ptr), QtWidgets.QWidget) if ptr else None
    if parent:
        for old in parent.findChildren(QtWidgets.QDialog, _WINDOW_NAME):
            old.close()
            old.deleteLater()
    elif _window is not None:
        _window.close()
        _window.deleteLater()

    class FrameEdit(QtWidgets.QDoubleSpinBox):
        def textFromValue(self, value):
            return "{:.6f}".format(value).rstrip("0").rstrip(".")

    class BakeWindow(QtWidgets.QDialog):
        def __init__(self):
            super(BakeWindow, self).__init__(parent)
            self.setObjectName(_WINDOW_NAME)
            self.setWindowTitle("IkFk Animation Switcher")
            self.setFixedWidth(320)
            layout = QtWidgets.QVBoxLayout(self)
            layout.setContentsMargins(18, 16, 18, 16)
            layout.setSpacing(12)
            self.startEdit = FrameEdit()
            self.endEdit = FrameEdit()
            frames = QtWidgets.QHBoxLayout()
            frames.setSpacing(12)
            for label, edit in (("Первый кадр", self.startEdit),
                                ("Последний кадр", self.endEdit)):
                edit.setDecimals(6)
                edit.setRange(-1000000000, 1000000000)
                edit.setSingleStep(1)
                edit.setMinimumHeight(32)
                edit.setAlignment(QtCore.Qt.AlignCenter)
                edit.setKeyboardTracking(False)
                column = QtWidgets.QVBoxLayout()
                column.setSpacing(5)
                column.addWidget(QtWidgets.QLabel(label))
                column.addWidget(edit)
                frames.addLayout(column, 1)
            layout.addLayout(frames)
            instruction = QtWidgets.QLabel("Выделите контроллы нужных конечностей.")
            instruction.setWordWrap(True)
            layout.addWidget(instruction)
            self.fkToIkButton = QtWidgets.QPushButton("FK → IK")
            self.ikToFkButton = QtWidgets.QPushButton("IK → FK")
            buttonStyle = (
                "QPushButton {background: #3676a6; color: white; border: none;"
                "border-radius: 4px; font-weight: 600;}"
                "QPushButton:hover {background: #4085b8;}"
                "QPushButton:pressed {background: #2c618a;}"
                "QPushButton:disabled {background: #555; color: #aaa;}")
            buttons = QtWidgets.QHBoxLayout()
            buttons.setSpacing(12)
            for button in (self.fkToIkButton, self.ikToFkButton):
                button.setMinimumHeight(36)
                button.setStyleSheet(buttonStyle)
                buttons.addWidget(button, 1)
            self.fkToIkButton.clicked.connect(lambda checked=False: self.transfer("fk_to_ik"))
            self.ikToFkButton.clicked.connect(lambda checked=False: self.transfer("ik_to_fk"))
            layout.addLayout(buttons)
            self.sceneRange()

        def sceneRange(self):
            self.startEdit.setValue(cmds.playbackOptions(q=True, minTime=True))
            self.endEdit.setValue(cmds.playbackOptions(q=True, maxTime=True))

        def transfer(self, direction):
            self.startEdit.interpretText()
            self.endEdit.interpretText()
            start, end = self.startEdit.value(), self.endEdit.value()
            if start > end:
                cmds.warning("Первый кадр должен быть не позже последнего.")
                return
            for widget in (self.startEdit, self.endEdit, self.fkToIkButton, self.ikToFkButton):
                widget.setEnabled(False)
            try:
                bake(start=start, end=end, direction=direction)
            except Exception as error:
                cmds.warning(str(error))
            finally:
                for widget in (self.startEdit, self.endEdit, self.fkToIkButton, self.ikToFkButton):
                    widget.setEnabled(True)

    _window = BakeWindow()
    _window.show()
    return _window
