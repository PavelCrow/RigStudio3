import sys

if sys.version[0] == "2":
	import posers
	reload(posers)	
else:
	import importlib
	import rigStudio2.rigTools.posers as posers	