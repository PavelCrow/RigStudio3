# Sleeve corrective joints.
#
# Builds a ring of driven joints around a bend: on the inner (compressed)
# side of the bend they slide outwards (local Y) and back towards the
# parent (local -X); joints on the outer side stay at rest.
#
# Two ways to read the bend, picked in the dialog:
#   Local - select the one bone that does the bending. Its own rotation
#           (relative to its actual Maya parent) drives the ring. Needs
#           that bone to actually have a parent in the outliner.
#   World - select the parent then the child (2 objects, in that order) when
#           they aren't directly parented in the DAG (constraints, IK, a
#           control driving a joint, etc). The bend is computed from their
#           world matrices instead of trusting the hierarchy.
# Either way, the ring itself (<name>_grp) sits somewhere between the bend
# reference's orientation and driverJoint's own, on all three axes (twist
# included) - see the "bisector" attribute below.
#
# Node names come straight from the base name typed in the dialog - e.g.
# base name "l_sleeve" makes "l_sleeve_grp" and joints "l_sleeve_1".."_8".
#
# The reaction (how hard the ring pushes out and slides back) is shared, on
# the <name>_grp node:
#     maxAngle - bend angle (deg) at which the spread reaches its maximum
#     radius   - default ring radius, used to seed new joints only
#     spread   - extra radial travel at full bend
#     slide    - travel towards the parent at full bend
#     bisector - 0..1, how much of the bend the ring's own frame shows: 0.5
#                (default) is the exact bisector, 1 disables the halving
#                trick (drags fully with driverJoint), 0 pins the ring to
#                the bend reference's orientation instead
#
# Placement and reaction are per joint, so each one can be nudged
# individually - on each sleeve joint itself:
#     ringAngle    - position around the ring (deg); also sets the spacing
#                    to its neighbours, since it's no longer forced to 360/count
#     ringRadius   - that joint's own rest distance from the bone axis
#     strength     - multiplier on the radial spread, 1 = the shared amount
#     slideOffset  - added on top of the shared slide for this joint only,
#                    since slide is usually 0 and only some joints need it
#
# Re-running on a joint that already has a sleeve replaces it with the new
# count and carries the shared calibration over (per-joint placement is not,
# since the joints themselves are rebuilt) - settle on a count before
# hand-tuning ringAngle/ringRadius/strength/slideOffset. Old joints are
# deleted, so skin weights on them are lost (undoable).
#
# Node cost is 6 DG nodes per joint plus 4 shared ones (6 in world mode),
# plus however many angle<->double bridge nodes Maya auto-inserts around
# the halving math - those are swept up and tracked too, not left orphaned.

import maya.cmds as cmds
import maya.OpenMayaUI as OpenMayaUI
import pymel.core as pm

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
	from PySide2 import QtWidgets
	from shiboken2 import wrapInstance
else:
	from PySide6 import QtWidgets
	from shiboken6 import wrapInstance

# live calibration attributes carried over when a sleeve is rebuilt
SLEEVE_SETTINGS = ("maxAngle", "radius", "spread", "slide", "bisector")


def _mayaMainWindow():
	ptr = OpenMayaUI.MQtUtil.mainWindow()
	if ptr is not None:
		return wrapInstance(int(ptr), QtWidgets.QWidget)
	return None


def run():
	sel = cmds.ls(sl=1, type="transform")
	if len(sel) not in (1, 2):
		cmds.warning("Select the bending bone (local), or its parent then child, in that order (world).")
		return
	driverJoint = sel[-1]
	parentJoint = sel[0] if len(sel) == 2 else None

	dialog = QtWidgets.QDialog(_mayaMainWindow())
	dialog.setWindowTitle("Sleeve joints")
	dialog.setFixedWidth(195)

	form = QtWidgets.QFormLayout(dialog)
	form.setFieldGrowthPolicy(QtWidgets.QFormLayout.AllNonFixedFieldsGrow)

	nameEdit = QtWidgets.QLineEdit(driverJoint)
	form.addRow("Base name", nameEdit)

	countSpin = QtWidgets.QSpinBox()
	countSpin.setRange(2, 64)
	countSpin.setValue(8)
	countSpin.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)
	form.addRow("Joints count", countSpin)

	localRadio = QtWidgets.QRadioButton("Local (%s's own rotation)" % driverJoint)
	worldRadio = QtWidgets.QRadioButton("World (%s)" % (
	    "%s -> %s" % (parentJoint, driverJoint) if parentJoint else "select parent + child"))
	worldRadio.setEnabled(parentJoint is not None)
	localRadio.setChecked(parentJoint is None)
	worldRadio.setChecked(parentJoint is not None)
	modeGroup = QtWidgets.QButtonGroup(dialog)
	modeGroup.addButton(localRadio)
	modeGroup.addButton(worldRadio)
	form.addRow(localRadio)
	form.addRow(worldRadio)

	buttons = QtWidgets.QDialogButtonBox(QtWidgets.QDialogButtonBox.Ok | QtWidgets.QDialogButtonBox.Cancel)
	buttons.accepted.connect(dialog.accept)
	buttons.rejected.connect(dialog.reject)
	form.addRow(buttons)

	if dialog.exec_() != QtWidgets.QDialog.Accepted:
		return

	name = nameEdit.text().strip()
	if not name:
		cmds.warning("Enter a base name.")
		return

	if worldRadio.isChecked():
		if parentJoint is None:
			cmds.warning("World mode needs 2 objects selected - parent then child.")
			return
		createSleeveJoints(driverJoint, parentJoint=parentJoint, name=name, count=countSpin.value())
	else:
		createSleeveJoints(driverJoint, name=name, count=countSpin.value())


def createSleeveJoints(driverJoint=None, parentJoint=None, name=None, count=8, radius=None):
	if driverJoint is None:
		sel = cmds.ls(sl=1, type="transform")
		if len(sel) not in (1, 2):
			cmds.warning("Select the bending bone (local), or its parent then child, in that order (world).")
			return None
		driverJoint = sel[-1]
		parentJoint = sel[0] if len(sel) == 2 else None

	if not cmds.objExists(driverJoint) or not cmds.objectType(driverJoint, isAType="transform"):
		cmds.warning("%s is not a joint or transform." % driverJoint)
		return None

	if parentJoint is not None and (not cmds.objExists(parentJoint)
	                                 or not cmds.objectType(parentJoint, isAType="transform")):
		cmds.warning("%s is not a joint or transform." % parentJoint)
		return None

	if parentJoint is None and not cmds.listRelatives(driverJoint, p=1):
		cmds.warning("%s has no parent - pick a bone in the middle of a chain, "
		             "or pass parentJoint= for world mode." % driverJoint)
		return None

	if not name:
		name = driverJoint

	count = int(count)
	if count < 2:
		cmds.warning("count must be at least 2.")
		return None

	# replace an existing sleeve, keeping whatever calibration it carries
	grpName = name + "_grp"
	setName = name + "_sleeveSet"
	saved = None
	if cmds.objExists(grpName):
		# an older sleeve may predate some of these attributes - carry over
		# only what it actually has, new ones just take their addAttr default
		saved = dict((a, cmds.getAttr(grpName + "." + a)) for a in SLEEVE_SETTINGS
		             if cmds.attributeQuery(a, node=grpName, exists=True))
		oldJoints = cmds.listRelatives(grpName, ad=1, type="joint") or []
		skinned = [j for j in oldJoints if cmds.listConnections(j, type="skinCluster")]
		if skinned:
			cmds.warning("%d of the old sleeve joints are skinned - their weights "
			             "are lost on rebuild (Ctrl+Z to undo)." % len(skinned))
		deleteSleeveJoints(name)

	if radius is None:
		if saved:
			radius = saved["radius"]
		else:
			radius = 1.0
			childs = cmds.listRelatives(driverJoint, type="transform") or []
			if childs:
				tx = cmds.getAttr(childs[0] + ".tx")
				if abs(tx) > 0.0001:
					radius = abs(tx) * 0.25

	# tracks every node this build creates, so deleteSleeveJoints() can find
	# them all regardless of what the base name looks like
	nodeSet = cmds.sets(name=setName, empty=True)

	grp = pm.group(em=1, n=grpName)
	cmds.sets(grpName, e=1, forceElement=nodeSet)
	pm.parent(grp, driverJoint)
	grp.t.set(0, 0, 0)
	grp.r.set(0, 0, 0)
	grp.s.set(1, 1, 1)

	pm.addAttr(grp, ln="maxAngle", at="double", k=1, dv=60)
	pm.addAttr(grp, ln="radius", at="double", k=1, dv=radius)
	pm.addAttr(grp, ln="spread", at="double", k=1, dv=radius * 0.5)
	pm.addAttr(grp, ln="slide", at="double", k=1, dv=radius * 0.5)
	# 0.5 = exact bisector (default); 1 = no half-rotation, grp drags fully
	# with the bend; 0 = grp doesn't rotate with the bend at all
	pm.addAttr(grp, ln="bisector", at="double", k=1, dv=0.5, min=0, max=1)

	# build-time only: the DG cannot spawn nodes, so this just records what
	# was built. Re-run createSleeveJoints(joint, count=N) to change it.
	pm.addAttr(grp, ln="jointCount", at="long", dv=count)
	cmds.setAttr(grpName + ".jointCount", cb=1)
	cmds.setAttr(grpName + ".jointCount", l=1)

	if saved:
		for attr, value in saved.items():
			cmds.setAttr(grpName + "." + attr, value)

	if parentJoint is not None:
		# world mode: driverJoint's rotation relative to parentJoint, computed
		# from their world matrices instead of trusting the DAG hierarchy
		worldMult = pm.createNode("multMatrix", n=name + "_worldBend_multMatrix")
		pm.PyNode(driverJoint).worldMatrix[0] >> worldMult.matrixIn[0]
		pm.PyNode(parentJoint).worldInverseMatrix[0] >> worldMult.matrixIn[1]
		cmds.sets(worldMult.name(), e=1, forceElement=nodeSet)

		worldDM = pm.createNode("decomposeMatrix", n=name + "_worldBend_decomposeMatrix")
		worldMult.matrixSum >> worldDM.inputMatrix
		cmds.sets(worldDM.name(), e=1, forceElement=nodeSet)

		rxSource = worldDM.outputRotateX
		rzSource = worldDM.outputRotateZ
		rySource = worldDM.outputRotateY
	else:
		rxSource = pm.PyNode(driverJoint).rx
		rzSource = pm.PyNode(driverJoint).rz
		rySource = pm.PyNode(driverJoint).ry

	# grp sits somewhere between driverJoint's bend reference (its DAG parent
	# in local mode, parentJoint in world mode) and driverJoint itself, on
	# all three axes: grp's local rotation is -(1-bisector) of the bend, so
	# grp's world orientation ends up at (bisector * the bend) - 0.5 is the
	# exact bisector, same trick as the old _psdLocal.ma rig (extended here
	# to twist as well); 1 disables it (grp drags fully with the child); 0
	# pins grp to the bend reference's own orientation.
	bisectorFactor = pm.createNode("plusMinusAverage", n=name + "_bisectorFactor_plusMinusAverage")
	bisectorFactor.operation.set(2)  # subtract: bisector - 1
	grp.bisector >> bisectorFactor.input1D[0]
	bisectorFactor.input1D[1].set(1)
	cmds.sets(bisectorFactor.name(), e=1, forceElement=nodeSet)

	halfRot = pm.createNode("multiplyDivide", n=name + "_halfRotation_multiplyDivide")
	rzSource >> halfRot.input1X
	rySource >> halfRot.input1Y
	rxSource >> halfRot.input1Z
	bisectorFactor.output1D >> halfRot.input2X
	bisectorFactor.output1D >> halfRot.input2Y
	bisectorFactor.output1D >> halfRot.input2Z
	cmds.sets(halfRot.name(), e=1, forceElement=nodeSet)

	halfRot.outputX >> grp.rz
	halfRot.outputY >> grp.ry
	halfRot.outputZ >> grp.rx

	# multiplyDivide's ports are plain doubles, so each angle<->double hop
	# above got Maya's automatic unitConversion bridging (in on the way in,
	# out on the way back) - those two bridges are exact inverses of each
	# other so the math is unaffected, but the bridge nodes themselves are
	# not ours to track by name. Sweep them up so deleteSleeveJoints() still
	# finds everything.
	for n in cmds.listConnections(halfRot.name(), type="unitConversion") or []:
		cmds.sets(n, e=1, forceElement=nodeSet)

	# bend vector, in degrees: (0, rz, -ry), read from grp's own (halved)
	# rotation so it stays in the same frame as dirVec below, which is also
	# expressed relative to grp.
	# rz bends the child towards +Y, ry bends it towards -Z, so this vector
	# points at the inner (folding) side of the bend and its length is the angle.
	ucY = pm.createNode("unitConversion", n=name + "_bendY_unitConversion")
	ucY.conversionFactor.set(57.295779513082323)
	grp.rz >> ucY.input
	cmds.sets(ucY.name(), e=1, forceElement=nodeSet)

	ucZ = pm.createNode("unitConversion", n=name + "_bendZ_unitConversion")
	ucZ.conversionFactor.set(-57.295779513082323)
	grp.ry >> ucZ.input
	cmds.sets(ucZ.name(), e=1, forceElement=nodeSet)

	joints = []
	for i in range(count):
		angle = 360.0 / count * i
		jName = "%s_%d" % (name, i + 1)

		# local +Y of dirGrp is the joint's radial direction in the ring;
		# its rotateX is driven live by the joint's own ringAngle below.
		dirGrp = pm.group(em=1, n=jName + "_dirGrp")
		cmds.sets(dirGrp.name(), e=1, forceElement=nodeSet)
		pm.parent(dirGrp, grp)
		dirGrp.t.set(0, 0, 0)
		dirGrp.r.set(0, 0, 0)

		pm.select(dirGrp)
		j = pm.joint(n=jName)
		cmds.sets(j.name(), e=1, forceElement=nodeSet)
		j.r.set(0, 0, 0)
		j.jointOrient.set(0, 0, 0)

		pm.addAttr(j, ln="ringAngle", at="doubleAngle", k=1, dv=angle)
		pm.addAttr(j, ln="ringRadius", at="double", k=1, dv=radius)
		pm.addAttr(j, ln="strength", at="double", k=1, dv=1)
		pm.addAttr(j, ln="slideOffset", at="double", k=1, dv=0)
		j.ringAngle >> dirGrp.rotateX

		# radial push direction = dirGrp's local Y axis, read back through its
		# matrix so it stays in sync as ringAngle is tweaked afterwards.
		dirVec = pm.createNode("vectorProduct", n=jName + "_dir_vectorProduct")
		dirVec.operation.set(3)  # vector-matrix product, ignores translate
		dirVec.input1.set(0, 1, 0)
		dirGrp.matrix >> dirVec.matrix
		cmds.sets(dirVec.name(), e=1, forceElement=nodeSet)

		dot = pm.createNode("vectorProduct", n=jName + "_dot_vectorProduct")
		dot.operation.set(1)
		ucY.output >> dot.input1Y
		ucZ.output >> dot.input1Z
		dirVec.output >> dot.input2
		cmds.sets(dot.name(), e=1, forceElement=nodeSet)

		# strength scales the radial spread, so it changes how hard the joint
		# pushes out without touching its placement
		strengthScale = pm.createNode("multiplyDivide", n=jName + "_strength_multiplyDivide")
		grp.spread >> strengthScale.input1X
		j.strength >> strengthScale.input2X
		cmds.sets(strengthScale.name(), e=1, forceElement=nodeSet)

		jointSpreadMax = pm.createNode("plusMinusAverage", n=jName + "_spreadMax_plusMinusAverage")
		j.ringRadius >> jointSpreadMax.input1D[0]
		strengthScale.outputX >> jointSpreadMax.input1D[1]
		cmds.sets(jointSpreadMax.name(), e=1, forceElement=nodeSet)

		# slideOffset adds on top of the shared slide instead of scaling it,
		# since slide is usually 0 and only a few joints need it turned on
		jointSlideMax = pm.createNode("plusMinusAverage", n=jName + "_slideMax_plusMinusAverage")
		jointSlideMax.operation.set(2)  # subtract: 0 - slide - slideOffset
		jointSlideMax.input1D[0].set(0)
		grp.slide >> jointSlideMax.input1D[1]
		j.slideOffset >> jointSlideMax.input1D[2]
		cmds.sets(jointSlideMax.name(), e=1, forceElement=nodeSet)

		sr = pm.createNode("setRange", n=jName + "_setRange")
		grp.maxAngle >> sr.oldMaxX
		grp.maxAngle >> sr.oldMaxY
		j.ringRadius >> sr.minX
		jointSpreadMax.output1D >> sr.maxX
		jointSlideMax.output1D >> sr.maxY
		dot.outputX >> sr.valueX
		dot.outputX >> sr.valueY
		cmds.sets(sr.name(), e=1, forceElement=nodeSet)

		sr.outValueX >> j.translateY
		sr.outValueY >> j.translateX

		joints.append(j)

	pm.select(joints)
	return joints


def _findSleeveSet(obj):
	# walk up from obj (a ring joint, dirGrp, the grp itself, ...) looking
	# for the tracking set that owns it - names carry no "sleeve" marker to
	# search for, so membership is the only reliable way to find it.
	while obj:
		for s in cmds.listSets(object=obj) or []:
			if s.endswith("_sleeveSet"):
				return s
		parents = cmds.listRelatives(obj, parent=True) or []
		if not parents:
			return None
		obj = parents[0]
	return None


def deleteSleeveJoints(name=None):
	# removes everything createSleeveJoints() made under the given base
	# name (or the selected object's sleeve), so it can be re-run with
	# different settings.
	if name is not None:
		setName = name + "_sleeveSet"
	else:
		sel = cmds.ls(sl=1)
		if len(sel) != 1:
			cmds.warning("Select the driver joint (or a sleeve joint) whose sleeve should be removed.")
			return
		setName = _findSleeveSet(sel[0])

	if not setName or not cmds.objExists(setName):
		cmds.warning("No sleeve found.")
		return

	nodes = cmds.sets(setName, q=1) or []
	nodes.append(setName)

	for n in nodes:
		if not cmds.objExists(n):
			continue
		try:
			cmds.lockNode(n, l=0)
		except Exception:
			pass
		try:
			cmds.delete(n)
		except Exception as e:
			cmds.warning("Could not delete %s: %s" % (n, e))
