# plugins

Исходники C++ плагинов rigStudio3. Собранные `.mll` кладутся в
`<repo>\plug-ins\<mayaVersion>\` — оттуда их грузит сам авториг, ставить
ничего не нужно.

## pk_rigNodes

Ноды, заменяющие тяжёлые Bifrost-графы модулей. Задача и порядок работ —
в [../docs/bifrost_to_plugin.md](../docs/bifrost_to_plugin.md).

| нода | что заменяет | состояние |
|---|---|---|
| `pk_wing` | граф модуля `wing2` (2276 нодов) | этап 1: примитивы сплайна + 4 главных сплайна, отладочные выходы |

Спека ноды (интерфейс, разобранная математика графа) — [pk_wing_spec.md](pk_rigNodes/pk_wing_spec.md).

### Отладка в Maya

```python
import sys
sys.path.append(r"f:\Maya_Projects\rigStudio3\plugins\pk_rigNodes\scripts")
import pk_wing_debug as d

d.load_plugin()              # загрузить (или перезагрузить) плагин
n = d.make_from_graph()      # создать pk_wing и залить входы из Bifrost-графа сцены
d.show_points(n, stage=3)    # локаторы на точки выбранной стадии
d.lengths(n)                 # длины сплайнов против init_curves_length графа
```

`debug_stage`: 0 — выключено, 1 — входные CV, 2 — вертикальные кривые после
репараметризации, 3 — CV четырёх главных сплайнов, 4 — сами главные сплайны.

### Сборка

```powershell
cd plugins\pk_rigNodes
.\build.ps1                    # Maya 2022
.\build.ps1 -MayaVersion 2025
```

Нужны Visual Studio 2022 (toolset v142 для Maya 2022/2023, v143 для 2024+) и
установленная Maya соответствующей версии — заголовки и библиотеки берутся из
`C:\Program Files\Autodesk\Maya<version>`.

### Проверка в Maya

```python
import maya.cmds as cmds
cmds.loadPlugin(r"f:\Maya_Projects\rigStudio3\plug-ins\2022\pk_rigNodes.mll")
n = cmds.createNode("pk_wing")
cmds.setAttr(n + ".layers_count", 3)
print(cmds.getAttr(n + ".out_joints_out_matrixes[0]"))
```

## pk_dynamics

Отдельный плагин `pk_dynamics.mll`, нода `pk_chainDynamics` — простая динамика
цепочки без nucleus: на входе мировые матрицы целей (анимированная поза), на
выходе мировые матрицы после симуляции. Математика и поведение по времени — в
шапке [pkChainDynNode.h](pk_rigNodes/src/pkChainDynNode.h).

```python
import sys
sys.path.append(r"f:\Maya_Projects\rigStudio3\plugins\pk_rigNodes\scripts")
import pk_chain_dyn as dyn

dyn.build("tail", count=6, length=10)   # цепочка контролов + нода + джоинты
dyn.build("tail", count=3, joints=10)   # контролов 3, костей 10
dyn.demo("tail")                        # ключи на корень для проверки
dyn.fromSelection("tail")               # или на выделенных трансформах
dyn.editRamp("tail")                    # кривая жёсткости вдоль цепочки
```

Собрать только его: `.\build.ps1 -MayaVersion 2026 -Target pk_dynamics`.
