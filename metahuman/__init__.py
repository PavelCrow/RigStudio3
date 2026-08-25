# Fitting a rigStudio3 rig onto a MetaHuman skeleton.
#
# The tedious part of the job is that every poser has to be put on the
# right bone by hand. It only has to be tedious once: bone names are the
# same on every MetaHuman, so a map written against one rig template
# fits every character built on that template afterwards.
#
# The work splits in two, and they use different maps on purpose. There
# are far fewer posers than bones - the twist bones have no poser, and
# neither do the hundreds of correctives - so a single table would be
# mostly holes.
#
#   placement   poser -> bone. A table, written once and saved as a map.
#               place.py applies it.
#   binding     bone -> rig joint. No table at all: once the posers are
#               placed, the rig's joints are standing on the bones, so
#               bind.py finds each driver by measuring rather than by
#               guessing at names. Nothing to maintain, but it has to
#               run after the fitting, not before.
#
# Only the main body bones are bound. The twist and corrective bones are
# left free for the plugin that drives them; bindSkeleton(twists=True)
# takes the twists back if that ever changes.
#
# The run, from a fresh scene with the skeleton imported and the rig
# built from a template:
#
#     from rigStudio3 import metahuman
#
#     metahuman.guessMap()                 # select the skeleton root first
#     # read the printout, then fix whatever it got wrong:
#     #   select a poser and a bone -> metahuman.pick()
#     metahuman.placePosers(dryRun=True)   # check
#     metahuman.placePosers()              # move them
#     # ... build the rig, check it ...
#     metahuman.bindSkeleton(dryRun=True)  # check
#     metahuman.bindSkeleton()             # constrain
#
# metahuman.detach() takes the constraints back off. dumpScene() writes
# the whole lot out to JSON, which is the thing to send when something
# needs looking at outside Maya.
#
# While editing this package, reload it like this - the Debug flag only
# hot-reloads modules/<type>/<type>.py, not this:
#
#     import sys, importlib, rigStudio3
#     for m in [k for k in sys.modules if k.startswith("rigStudio3.metahuman")]:
#         del sys.modules[m]
#     if hasattr(rigStudio3, "metahuman"):
#         delattr(rigStudio3, "metahuman")
#     metahuman = importlib.import_module("rigStudio3.metahuman")
#
# Clearing sys.modules on its own is not enough: `from rigStudio3 import
# metahuman` finds the stale attribute still sitting on the rigStudio3
# package object and never looks at sys.modules at all.

from rigStudio3.metahuman import bones, scene, guess, place, bind

dumpScene = scene.dumpScene

guessMap = guess.run
pick = guess.pick
loadMap = guess.load
saveMap = guess.save

placePosers = place.run
placePoser = place.one

bindSkeleton = bind.run
bindPlan = bind.plan
bindStatus = bind.status
detach = bind.detach
