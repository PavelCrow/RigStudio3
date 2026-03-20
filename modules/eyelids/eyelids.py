import maya.cmds as cmds
import maya.mel as mel
from functools import partial
import logging, traceback, os, imp, sys

from ... import utils, module

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken2 import wrapInstance
    from PySide2.QtWidgets import QAction
else:
    from PySide6 import QtWidgets, QtGui, QtCore, QtUiTools
    from shiboken6 import wrapInstance
    from PySide6.QtGui import QAction

fileName = __name__.split('.')[0]
rootPath = os.path.abspath(imp.find_module(fileName)[1])#.split(fileName)[0]

class Eyelids(module.Module) :
	def __init__(self, name):
		super(self.__class__, self).__init__()

		self.name = name
		self.type = __name__.split('.')[-1]
		self.unic = False
		self.topEdges = ''
		self.bottomEdges = ''		

	def connectSignals(self, mainInstance, w):
		module = mainInstance.curModule
		w.setTopEdges_btn.clicked.connect(partial(self.setEdges, w, "top"))
		w.setBottomEdges_btn.clicked.connect(partial(self.setEdges, w, "bottom"))
		w.regenerate_btn.clicked.connect(self.generate)
		
	def setEdges(self, widget, side):
		edges = cmds.ls(sl=1)

		edges_string = ""
		for e in edges:
			edges_string += e
			edges_string += " "
	
		options = self.getOptions()
		options[side+'Edges'] = edges_string
		self.setOptions(options)	

		w_lineEdit = eval("widget.%sEdges_lineEdit" %side)
		w_lineEdit.setText(edges_string)		

	def updateOptionsPage(self, widget):

		pixmap = QtGui.QPixmap(rootPath+'/modules/eyelids/helpImage.png')
		widget.image_label.setPixmap(pixmap)
	
		data = self.getOptions()

		widget.topEdges_lineEdit.setText(self.topEdges)
		widget.bottomEdges_lineEdit.setText(self.bottomEdges)

	def getOptions(self):

		if cmds.objExists(self.root+'.options'):
			optionsData = utils.attrToPy(self.root+'.options')
		else:
			optionsData = {}

		if optionsData == {}:
			optionsData['topEdges'] = ''
			optionsData['bottomEdges'] = ''

		else:
			self.topEdges = optionsData['topEdges']
			self.bottomEdges = optionsData['bottomEdges']		
		
		return optionsData		

	def setOptions(self, optionsData):
		
		if 'topEdges' in optionsData:
			self.topEdges = optionsData['topEdges']
		else:
			self.topEdges = ""
			
		if 'bottomEdges' in optionsData:
			self.bottomEdges = optionsData['bottomEdges']
		else:
			self.bottomEdges = ""

		utils.pyToAttr(self.root+'.options', optionsData)

	def generate(self):
		init_bfS = self.name+"_init_bifrostGraphShape"
		solve_bfS = self.name+"_solver_bifrostGraphShape"

		# delete old 
		cmds.delete(cmds.listRelatives(self.name+"_l_root_outJoint"))
		cmds.delete(cmds.listRelatives(self.name+"_r_root_outJoint"))
		
		length = cmds.getAttr(f"{init_bfS}.t_joints_pos", size=True) or 0
		for i in range(length):
			cmds.removeMultiInstance(f"{init_bfS}.t_joints_pos[{i}]")

		length = cmds.getAttr(f"{init_bfS}.b_joints_pos", size=True) or 0
		for i in range(length):
			cmds.removeMultiInstance(f"{init_bfS}.b_joints_pos[{i}]")

		def get_u_values(points, dir):
			mel.eval(f'select -r {points}')
			init_crv = cmds.polyToCurve(degree=1,ch=0,n="crv_name")[0]
			mel.eval('rebuildCurve -ch 1 -rpo 1 -rt 0 -end 1 -kr 0 -kcp 1 -kep 1 -kt 0 -s 4 -d 3 -tol 0.01 "crv_name";')

			mel.eval(f'select -r {points}')
			mel.eval('ConvertSelectionToVertices')
			vtx_list = cmds.ls(sl=1, flatten=True)

			vtx_pos = [(vtx, cmds.pointPosition(vtx, world=True)) for vtx in vtx_list]
			print(111, vtx_pos)
			# Сортируем по X
			sorted_coords = [pos for vtx, pos in sorted(vtx_pos, key=lambda x: x[1][0])]
			print(1112, sorted_coords)
			info_node = f'{self.name}_{dir}_nearestPointOnCurve'

			u_values = []
			for vtx_pos in sorted_coords:
				cmds.setAttr(f"{info_node}.inPosition", *vtx_pos)
				# Получаем U параметр (нормализованный 0-1)
				u_value = cmds.getAttr(f"{info_node}.result.parameter") 
				print(33, vtx_pos, u_value)
				u_values.append(u_value)

			# Удаляем nodes
			cmds.delete(init_crv)			
			print(222, u_values)
			return u_values[1:-1]

		t_u_values = get_u_values(self.topEdges, "t")
		b_u_values = get_u_values(self.bottomEdges, "b")

		def create_joints(u_values, side, dir):
			for i, v in enumerate(u_values):
				j = cmds.joint(n=f"{self.name}_{side}_{dir}_{i}_outJoint")
				cmds.parent(j, f"{self.name}_{side}_root_outJoint")
				utils.removeTransformParentJoint(j)
				cmds.addAttr(j, ln="pos", min=0, max=1, k=1, dv=v)
				cmds.connectAttr(j+".pos", f'{init_bfS}.{dir}_joints_pos[{i}]')
				cmds.connectAttr(f'{solve_bfS}.out_{side}_{dir}_joint_matrix[{i}]', j+".offsetParentMatrix")
			
		create_joints(t_u_values, "l", "t")
		create_joints(b_u_values, "l", "b")
			