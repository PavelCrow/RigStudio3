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
#     maxAngle    - bend angle (deg) at which the spread reaches its maximum
#     falloff     - exponent shaping how many joints around the ring react at
#                   once: 1 is a plain half-cosine taper across the whole
#                   ring, higher sharpens it towards just the joint(s)
#                   nearest the bend direction, lower widens it towards the
#                   whole ring reacting together (the exact opposite side
#                   always stays at rest, regardless of this)
#     moveFactor  - extra radial travel at full bend
#     slide       - travel towards the parent at full bend
#     bisector    - 0..1, how much of the bend the ring's own frame shows: 0.5
#                   (default) is the exact bisector, 1 disables the halving
#                   trick (drags fully with driverJoint), 0 pins the ring to
#                   the bend reference's orientation instead
#
# Placement and reaction are per joint, so each one can be nudged
# individually - on each sleeve joint itself:
#     posAngle     - position around the ring (deg); also sets the spacing
#                    to its neighbours, since it's no longer forced to 360/count
#     initPos      - that joint's own rest distance from the bone axis
#     moveMult     - multiplier on the radial spread, 1 = the shared amount
#     slideOffset  - added on top of the shared slide for this joint only,
#                    since slide is usually 0 and only some joints need it
#
# Re-running on a joint that already has a sleeve replaces it with the new
# count and carries the shared calibration over (per-joint placement is not,
# since the joints themselves are rebuilt) - settle on a count before
# hand-tuning posAngle/initPos/moveMult/slideOffset. Old joints are
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
SLEEVE_SETTINGS = ("maxAngle", "falloff", "moveFactor", "slide", "bisector")


def _ensureQuatNodes():
	# quatSlerp/quatInvert/quatToEuler/quatToAxisAngle ship with Maya but
	# aren't autoloaded like matrixNodes is
	if not cmds.pluginInfo("quatNodes", q=1, loaded=1):
		cmds.loadPlugin("quatNodes")


def _mirrorJointName(objName):
	# only a prefix match - "l_" / "r_" anywhere else in the name (e.g. a
	# word that happens to start with those letters) is left alone
	if objName.startswith("l_"):
		return "r_" + objName[2:]
	if objName.startswith("r_"):
		return "l_" + objName[2:]
	return None


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

	falloffCheck = QtWidgets.QCheckBox("Falloff shaping")
	falloffCheck.setChecked(True)
	falloffCheck.setToolTip("Extra per-joint nodes so falloff can widen/sharpen how many\n"
	                        "joints react (grp.falloff). Off builds the plain, cheaper\n"
	                        "dot-product reaction with no falloff attribute at all.")
	form.addRow(falloffCheck)

	mirrorCheck = QtWidgets.QCheckBox("Mirror (l_/r_)")
	mirrorCheck.setToolTip("Also build a matching ring on the opposite side, found by\n"
	                       "swapping the l_/r_ prefix on the selected joint(s). No effect\n"
	                       "if the selection has no such prefix, or the mirrored joint(s)\n"
	                       "don't exist in the scene - just the one ring gets built then.")
	form.addRow(mirrorCheck)

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

	if worldRadio.isChecked() and parentJoint is None:
		cmds.warning("World mode needs 2 objects selected - parent then child.")
		return

	# (driverJoint, parentJoint, name) for each ring to build - starts with
	# just the selected one, mirror below adds a second if it finds one
	builds = [(driverJoint, parentJoint if worldRadio.isChecked() else None, name)]

	if mirrorCheck.isChecked():
		mirroredDriver = _mirrorJointName(driverJoint)
		if not mirroredDriver or not cmds.objExists(mirroredDriver):
			cmds.warning("Mirror: no l_/r_ match for %s - building one ring only." % driverJoint)
		else:
			mirroredParent = None
			parentOk = True
			if worldRadio.isChecked():
				mirroredParent = _mirrorJointName(parentJoint)
				parentOk = mirroredParent is not None and cmds.objExists(mirroredParent)
			if not parentOk:
				cmds.warning("Mirror: no l_/r_ match for %s - building one ring only." % parentJoint)
			else:
				# name usually shares driverJoint's prefix (it's the dialog's
				# own default) - falls back to the mirrored joint's own name
				# if it was typed as something without a matching prefix
				mirroredName = _mirrorJointName(name) or mirroredDriver
				builds.append((mirroredDriver, mirroredParent, mirroredName))

	for buildDriver, buildParent, buildName in builds:
		if buildParent is not None:
			createSleeveJoints(buildDriver, parentJoint=buildParent, name=buildName, count=countSpin.value(),
			                    useFalloff=falloffCheck.isChecked())
		else:
			createSleeveJoints(buildDriver, name=buildName, count=countSpin.value(),
			                    useFalloff=falloffCheck.isChecked())

	if len(builds) == 2:
		# side is decided by the actual joint prefix, not build order - Pavel
		# always dials in the left side, so the connection always runs
		# left -> right regardless of which one was selected/typed
		leftBuild = next((b for b in builds if b[0].startswith("l_")), None)
		rightBuild = next((b for b in builds if b[0].startswith("r_")), None)
		if leftBuild and rightBuild:
			_connectMirror(leftBuild[2], rightBuild[2], countSpin.value())


def _connectMirror(leftName, rightName, count):
	# drives every tunable attribute on the right ring from the left one, so
	# Pavel only ever has to dial in the left side by hand
	leftGrp = leftName + "_grp"
	rightGrp = rightName + "_grp"
	if not cmds.objExists(leftGrp) or not cmds.objExists(rightGrp):
		return

	for attr in SLEEVE_SETTINGS:
		if (cmds.attributeQuery(attr, node=leftGrp, exists=True)
		        and cmds.attributeQuery(attr, node=rightGrp, exists=True)):
			cmds.connectAttr(leftGrp + "." + attr, rightGrp + "." + attr, force=True)

	# grp's only direct child is the manual offset control (everything else
	# hangs off that control, not grp itself) - full paths, since the
	# control's own name can collide with the driver joint's (it's named
	# from the same base name typed in the dialog, no _ctrl suffix)
	leftChildren = cmds.listRelatives(leftGrp, children=True, type="transform", fullPath=True) or []
	rightChildren = cmds.listRelatives(rightGrp, children=True, type="transform", fullPath=True) or []
	if leftChildren and rightChildren:
		cmds.connectAttr(leftChildren[0] + ".translate", rightChildren[0] + ".translate", force=True)
		cmds.connectAttr(leftChildren[0] + ".rotate", rightChildren[0] + ".rotate", force=True)

	for i in range(1, count + 1):
		leftJoint = "%s_%d" % (leftName, i)
		rightJoint = "%s_%d" % (rightName, i)
		if not (cmds.objExists(leftJoint) and cmds.objExists(rightJoint)):
			continue
		for attr in ("posAngle", "initPos", "moveMult", "slideOffset"):
			cmds.connectAttr(leftJoint + "." + attr, rightJoint + "." + attr, force=True)


def createSleeveJoints(driverJoint=None, parentJoint=None, name=None, count=8, radius=None, useFalloff=True):
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
	oldRadius = None
	if cmds.objExists(grpName):
		# an older sleeve may predate some of these attributes - carry over
		# only what it actually has, new ones just take their addAttr default
		saved = dict((a, cmds.getAttr(grpName + "." + a)) for a in SLEEVE_SETTINGS
		             if cmds.attributeQuery(a, node=grpName, exists=True))
		oldJoints = cmds.listRelatives(grpName, ad=1, type="joint") or []
		# the old ring radius used to live in a dead "falloff" attribute on
		# grp that nothing ever read back (see initPos below); now that
		# falloff is a live attribute with its own meaning, the radius seed
		# for a rebuild comes from an existing joint's own initPos instead
		if oldJoints and cmds.attributeQuery("initPos", node=oldJoints[0], exists=True):
			oldRadius = cmds.getAttr(oldJoints[0] + ".initPos")
		skinned = [j for j in oldJoints if cmds.listConnections(j, type="skinCluster")]
		if skinned:
			cmds.warning("%d of the old sleeve joints are skinned - their weights "
			             "are lost on rebuild (Ctrl+Z to undo)." % len(skinned))
		deleteSleeveJoints(name)

	if radius is None:
		if oldRadius is not None:
			radius = oldRadius
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
	if useFalloff:
		# exponent shaping how many joints around the ring actually react: 1
		# is a plain half-cosine taper across the whole ring; raising it
		# sharpens the reaction down towards only the joint(s) nearest the
		# bend direction (minimum - just one), lowering it towards 0 widens
		# it until the whole ring reacts together (maximum - all of them).
		# The joint(s) on the exact opposite side of the ring always stay at
		# rest regardless of falloff - that point is the reference "unbent"
		# side, not shaped by the exponent. Costs ~7 extra nodes per joint
		# (see useFalloff below) - off skips all of it, plain dot reaction.
		pm.addAttr(grp, ln="falloff", at="double", k=1, dv=1, min=0.01)
	pm.addAttr(grp, ln="moveFactor", at="double", k=1, dv=radius * 0.5)
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
			# e.g. "falloff" only exists if useFalloff was on for the build
			# being replaced - toggling it off this time means grp never
			# gets that attribute at all, so there's nothing to carry over
			if cmds.attributeQuery(attr, node=grpName, exists=True):
				cmds.setAttr(grpName + "." + attr, value)

	_ensureQuatNodes()

	if parentJoint is not None:
		# world mode: driverJoint's rotation relative to parentJoint, computed
		# from their world matrices instead of trusting the DAG hierarchy.
		# parentJoint and driverJoint don't have to agree on axis conventions
		# at all (that's the whole reason world mode exists) - their relative
		# orientation right now, at build time, is whatever it is and is
		# treated as the "unbent" rest state; matrixIn[2] holds that rest
		# relative matrix's inverse as a captured constant (not a live
		# connection), so matrixSum ends up being only the *change* since
		# build time, regardless of how the two hierarchies' axes are set up.
		worldMult = pm.createNode("multMatrix", n=name + "_worldBend_multMatrix")
		pm.PyNode(driverJoint).worldMatrix[0] >> worldMult.matrixIn[0]
		pm.PyNode(parentJoint).worldInverseMatrix[0] >> worldMult.matrixIn[1]
		cmds.sets(worldMult.name(), e=1, forceElement=nodeSet)

		restRelative = pm.dt.Matrix(cmds.getAttr(worldMult.matrixSum.name()))
		worldMult.matrixIn[2].set(restRelative.inverse())

		bendDM = pm.createNode("decomposeMatrix", n=name + "_bend_decomposeMatrix")
		worldMult.matrixSum >> bendDM.inputMatrix
		cmds.sets(bendDM.name(), e=1, forceElement=nodeSet)
		bendQuatSource = bendDM.outputQuat
	else:
		# local mode: driverJoint's own rotate channel is the bend, same as
		# before the quaternion rewrite - NOT driverJoint.matrix (that also
		# carries jointOrient, which is the joint's constant rest orientation,
		# not part of the live bend, and would get wrongly slerped/spread as
		# if it were). eulerToQuat converts straight from rotate+rotateOrder,
		# composition rather than decomposition, so no gimbal lock risk here.
		localToQuat = pm.createNode("eulerToQuat", n=name + "_bend_eulerToQuat")
		pm.PyNode(driverJoint).rotate >> localToQuat.inputRotate
		pm.PyNode(driverJoint).rotateOrder >> localToQuat.inputRotateOrder
		cmds.sets(localToQuat.name(), e=1, forceElement=nodeSet)
		bendQuatSource = localToQuat.outputQuat

	# grp sits somewhere between driverJoint's bend reference (its DAG parent
	# in local mode, parentJoint in world mode) and driverJoint itself - NOT
	# by scaling rx/ry/rz independently (tried first; that's only a valid
	# approximation for small/single-axis bends and goes wild on compound or
	# large rotations in both modes, since it's really about the Euler-angle
	# triplet itself being a bad stand-in for a genuine 3D rotation once more
	# than one axis is involved, not specifically about decomposeMatrix's own
	# gimbal lock) but by treating the whole bend as one quaternion and
	# slerping the fraction of it grp should show. reverseBisector.outputX =
	# (1 - bisector), so slerping from identity to the full bend by that much
	# and inverting gives exactly bisector's worth of the bend - equivalent to
	# raising the bend quaternion to the power (bisector - 1), which is what
	# the old per-axis multiply was crudely approximating, but quatSlerp only
	# accepts T in 0..1 so this goes the other way around instead of
	# extrapolating past that range.
	reverseBisector = pm.createNode("reverse", n=name + "_bisectorReverse_reverse")
	grp.bisector >> reverseBisector.inputX
	cmds.sets(reverseBisector.name(), e=1, forceElement=nodeSet)

	slerp = pm.createNode("quatSlerp", n=name + "_bisector_quatSlerp")
	# input1Quat left at its default identity (0,0,0,1)
	bendQuatSource >> slerp.input2Quat
	reverseBisector.outputX >> slerp.inputT
	cmds.sets(slerp.name(), e=1, forceElement=nodeSet)

	grpQuat = pm.createNode("quatInvert", n=name + "_grpRotation_quatInvert")
	slerp.outputQuat >> grpQuat.inputQuat
	cmds.sets(grpQuat.name(), e=1, forceElement=nodeSet)

	toEuler = pm.createNode("quatToEuler", n=name + "_grpRotation_quatToEuler")
	grpQuat.outputQuat >> toEuler.inputQuat
	cmds.sets(toEuler.name(), e=1, forceElement=nodeSet)
	toEuler.outputRotate >> grp.rotate

	# bend vector for the ring joints' dot product below: same grp rotation,
	# read back as axis+angle instead of picking two Euler components off it
	# (which is the same small-angle-only approximation the halving above
	# just moved away from) - this stays correct at any bend magnitude.
	toAxisAngle = pm.createNode("quatToAxisAngle", n=name + "_grpRotation_quatToAxisAngle")
	grpQuat.outputQuat >> toAxisAngle.inputQuat
	cmds.sets(toAxisAngle.name(), e=1, forceElement=nodeSet)

	# angle<->double bridges, explicit (not Maya's auto-inserted ones) so the
	# degrees conversion doesn't depend on the scene's angle UI unit; signs
	# baked in here rather than a separate negate step, same trick the old
	# ucY/ucZ pair used.
	angleDeg = pm.createNode("unitConversion", n=name + "_bendAngleDeg_unitConversion")
	angleDeg.conversionFactor.set(57.295779513082323)
	toAxisAngle.outputAngle >> angleDeg.input
	cmds.sets(angleDeg.name(), e=1, forceElement=nodeSet)

	negAngleDeg = pm.createNode("unitConversion", n=name + "_bendAngleDegNeg_unitConversion")
	negAngleDeg.conversionFactor.set(-57.295779513082323)
	toAxisAngle.outputAngle >> negAngleDeg.input
	cmds.sets(negAngleDeg.name(), e=1, forceElement=nodeSet)

	# bend vector = angle * axis, in degrees, on the (Y, Z) plane
	# perpendicular to the bone - same (0, -rz, ry)-shaped convention as
	# before (inner/compressed side of the bend), just built from axis+angle
	# instead of two Euler components so it stays correct past small angles.
	bendY = pm.createNode("multiplyDivide", n=name + "_bendVectorY_multiplyDivide")
	negAngleDeg.output >> bendY.input1X
	toAxisAngle.outputAxisZ >> bendY.input2X
	cmds.sets(bendY.name(), e=1, forceElement=nodeSet)

	bendZ = pm.createNode("multiplyDivide", n=name + "_bendVectorZ_multiplyDivide")
	angleDeg.output >> bendZ.input1X
	toAxisAngle.outputAxisY >> bendZ.input2X
	cmds.sets(bendZ.name(), e=1, forceElement=nodeSet)

	if useFalloff:
		# unit bend direction, shared by every joint's falloff below - kept
		# separate from bend magnitude (angleDeg) so falloff shapes direction
		# only, and doesn't depend on how far into maxAngle the bend currently is
		bendDirUnit = pm.createNode("vectorProduct", n=name + "_bendDir_vectorProduct")
		bendDirUnit.operation.set(0)  # no-op, just normalizes input1
		bendDirUnit.normalizeOutput.set(True)
		# input1X is otherwise unused (bendY/bendZ only ever feed Y/Z, and
		# every joint's dirVec below always has x=0, so it never reaches the
		# dot product) - nudging it off exactly 0 keeps the vector from ever
		# being exactly zero-length at rest (bendY=bendZ=0 there), which is
		# what normalizeOutput was warning about ("zero-length output vector")
		bendDirUnit.input1X.set(0.001)
		bendY.outputX >> bendDirUnit.input1Y
		bendZ.outputX >> bendDirUnit.input1Z
		cmds.sets(bendDirUnit.name(), e=1, forceElement=nodeSet)

		# how far into the bend we are, 0..1 - shared across the whole ring
		# since it doesn't depend on any one joint's placement, only the bend
		bendMagnitudeT = pm.createNode("setRange", n=name + "_bendMagnitude_setRange")
		grp.maxAngle >> bendMagnitudeT.oldMaxX
		angleDeg.output >> bendMagnitudeT.valueX
		bendMagnitudeT.maxX.set(1)
		cmds.sets(bendMagnitudeT.name(), e=1, forceElement=nodeSet)

	# manual control: sits between grp and the ring joints, so its translate/
	# rotate is an offset on top of the automatic bend/bisector/spread
	# reaction rather than a replacement for it. Named from the same base
	# name typed in the dialog - pm.circle() falls back to Maya's own
	# uniquifying if that name is already taken (e.g. the base name defaults
	# to driverJoint's own name), so `ctrl` (not the `name` string) is what
	# every later step below uses.
	ctrl = pm.circle(name=name, normal=(1, 0, 0), radius=radius, constructionHistory=False)[0]
	cmds.sets(ctrl.name(), e=1, forceElement=nodeSet)
	pm.parent(ctrl, grp)
	ctrl.t.set(0, 0, 0)
	ctrl.r.set(0, 0, 0)
	ctrl.s.set(1, 1, 1)

	joints = []
	for i in range(count):
		angle = 360.0 / count * i
		jName = "%s_%d" % (name, i + 1)

		# local +Y of dirGrp is the joint's radial direction in the ring;
		# its rotateX is driven live by the joint's own posAngle below.
		dirGrp = pm.group(em=1, n=jName + "_dirGrp")
		cmds.sets(dirGrp.name(), e=1, forceElement=nodeSet)
		pm.parent(dirGrp, ctrl)
		dirGrp.t.set(0, 0, 0)
		dirGrp.r.set(0, 0, 0)

		pm.select(dirGrp)
		j = pm.joint(n=jName)
		cmds.sets(j.name(), e=1, forceElement=nodeSet)
		j.r.set(0, 0, 0)
		j.jointOrient.set(0, 0, 0)

		# addAttr's dv for doubleAngle attributes is in radians regardless of
		# the scene's angle UI unit (unlike setAttr/getAttr, which use
		# degrees) - dv=angle here would silently store 45 as 45 radians
		# (~2578 degrees), so the real value has to be set separately.
		pm.addAttr(j, ln="posAngle", at="doubleAngle", k=1)
		j.posAngle.set(angle)
		pm.addAttr(j, ln="initPos", at="double", k=1, dv=radius)
		pm.addAttr(j, ln="moveMult", at="double", k=1, dv=1)
		pm.addAttr(j, ln="slideOffset", at="double", k=1, dv=0)
		j.posAngle >> dirGrp.rotateX

		# radial push direction = dirGrp's local Y axis, read back through its
		# matrix so it stays in sync as posAngle is tweaked afterwards.
		dirVec = pm.createNode("vectorProduct", n=jName + "_dir_vectorProduct")
		dirVec.operation.set(3)  # vector-matrix product, ignores translate
		dirVec.input1.set(0, 1, 0)
		dirGrp.matrix >> dirVec.matrix
		cmds.sets(dirVec.name(), e=1, forceElement=nodeSet)

		# moveMult scales the radial spread, so it changes how hard the joint
		# pushes out without touching its placement
		strengthScale = pm.createNode("multiplyDivide", n=jName + "_strength_multiplyDivide")
		grp.moveFactor >> strengthScale.input1X
		j.moveMult >> strengthScale.input2X
		cmds.sets(strengthScale.name(), e=1, forceElement=nodeSet)

		jointSpreadMax = pm.createNode("plusMinusAverage", n=jName + "_spreadMax_plusMinusAverage")
		j.initPos >> jointSpreadMax.input1D[0]
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

		if useFalloff:
			# true signed cosine between this joint's radial direction and
			# the bend direction - independent of how big the bend currently
			# is (that's bendMagnitudeT's job), so falloff below shapes
			# direction only: 1 = joint exactly facing the bend, -1 = joint
			# on the exact opposite side, 0 = perpendicular to it
			cosAngle = pm.createNode("vectorProduct", n=jName + "_cosAngle_vectorProduct")
			cosAngle.operation.set(1)  # dot product
			bendDirUnit.output >> cosAngle.input1
			dirVec.output >> cosAngle.input2
			cmds.sets(cosAngle.name(), e=1, forceElement=nodeSet)

			# remap cosAngle from -1..1 to 0..1 before shaping it with falloff
			falloffNorm = pm.createNode("setRange", n=jName + "_falloffNorm_setRange")
			cosAngle.outputX >> falloffNorm.valueX
			falloffNorm.oldMinX.set(-1)
			falloffNorm.oldMaxX.set(1)
			falloffNorm.maxX.set(1)
			cmds.sets(falloffNorm.name(), e=1, forceElement=nodeSet)

			# grp.falloff as an exponent on that weight: 1 gives a plain half-
			# cosine taper across the whole ring; raising it sharpens the
			# reaction down towards only the joint(s) nearest the bend
			# direction (minimum = just one), lowering it towards 0 widens it
			# until the whole ring reacts together regardless of position
			# (maximum = all)
			falloffShape = pm.createNode("multiplyDivide", n=jName + "_falloffShape_multiplyDivide")
			falloffShape.operation.set(3)  # power
			falloffNorm.outValueX >> falloffShape.input1X
			grp.falloff >> falloffShape.input2X
			cmds.sets(falloffShape.name(), e=1, forceElement=nodeSet)

			# combine direction shaping with how far into the bend we are, so
			# a small bend doesn't already show full falloff-shaped reaction
			finalWeight = pm.createNode("multiplyDivide", n=jName + "_finalWeight_multiplyDivide")
			bendMagnitudeT.outValueX >> finalWeight.input1X
			falloffShape.outputX >> finalWeight.input2X
			cmds.sets(finalWeight.name(), e=1, forceElement=nodeSet)

			spreadDelta = pm.createNode("plusMinusAverage", n=jName + "_spreadDelta_plusMinusAverage")
			spreadDelta.operation.set(2)  # subtract: spreadMax - initPos
			jointSpreadMax.output1D >> spreadDelta.input1D[0]
			j.initPos >> spreadDelta.input1D[1]
			cmds.sets(spreadDelta.name(), e=1, forceElement=nodeSet)

			spreadScaled = pm.createNode("multiplyDivide", n=jName + "_spreadScaled_multiplyDivide")
			spreadDelta.output1D >> spreadScaled.input1X
			finalWeight.outputX >> spreadScaled.input2X
			cmds.sets(spreadScaled.name(), e=1, forceElement=nodeSet)

			translateY = pm.createNode("plusMinusAverage", n=jName + "_translateY_plusMinusAverage")
			j.initPos >> translateY.input1D[0]
			spreadScaled.outputX >> translateY.input1D[1]
			cmds.sets(translateY.name(), e=1, forceElement=nodeSet)

			translateX = pm.createNode("multiplyDivide", n=jName + "_translateX_multiplyDivide")
			jointSlideMax.output1D >> translateX.input1X
			finalWeight.outputX >> translateX.input2X
			cmds.sets(translateX.name(), e=1, forceElement=nodeSet)

			translateY.output1D >> j.translateY
			translateX.outputX >> j.translateX
		else:
			# plain dot-product reaction, no falloff shaping: clamped to zero
			# for the entire outer half of the ring (dot<=0), ramping 0..1
			# across the inner half - same behavior addSleeve had before
			# falloff existed, and cheaper (one setRange instead of falloff's
			# ~7 extra nodes/joint)
			dot = pm.createNode("vectorProduct", n=jName + "_dot_vectorProduct")
			dot.operation.set(1)  # dot product
			bendY.outputX >> dot.input1Y
			bendZ.outputX >> dot.input1Z
			dirVec.output >> dot.input2
			cmds.sets(dot.name(), e=1, forceElement=nodeSet)

			sr = pm.createNode("setRange", n=jName + "_setRange")
			grp.maxAngle >> sr.oldMaxX
			grp.maxAngle >> sr.oldMaxY
			j.initPos >> sr.minX
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
