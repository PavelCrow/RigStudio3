# pk_wing — спека ноды

Замена Bifrost-графа модуля `wing2` (`<name>_bifrostGraphShape`, 2276 нодов).
Общая задача и порядок работ — в [../../docs/bifrost_to_plugin.md](../../docs/bifrost_to_plugin.md).

**Главное требование:** интерфейс повторяет порты графа один в один (имена, типы,
уровни multi). Тогда `modules/wing2/wing2.py` продолжает работать без правок —
он обращается к атрибутам по именам и индексам.

## Интерфейс

### Скаляры

| атрибут | тип | откуда | смысл |
|---|---|---|---|
| `layers_count` | long | `wing2.py:398` set | количество слоёв |
| `debug_layer_id` | long | `wing2.py:399` set | отладочный слой |
| `auto_twist_root` | float | UI/шаблон (`wing2.py:116,318,337`) | автотвист у основания |
| `auto_twist_tip` | float | UI/шаблон (`wing2.py:117,319,338`) | автотвист у кончика |
| `mirror` | bool | | правая сторона |
| `flatten` | bool | | распрямление |
| `global_transform` | fltMatrix | | глобальный трансформ рига |
| `mainPoser_transform` | fltMatrix | | трансформ mainPoser модуля |
| `root_offset_1` … `root_offset_7` | float | | смещения у основания |
| `JobPorts__Math_epsilonFloat` | float | служебный порт Bifrost | в ноде не нужен |

### Массивы по слоям — индекс `[layer]`

Все подключены от атрибутов контрола слоя (`wing2.py:419-430`).

| атрибут | тип | источник |
|---|---|---|
| `layer_feathers_count` | long[] | `layer_c.feather_count` |
| `layer_feather_controls_count` | long[] | `layer_c.feather_controls_count` |
| `layer_wide` | float[] | `layer_c.wide` |
| `layer_pos_min` | float[] | `layer_c.slideMin` |
| `layer_pos_max` | float[] | `layer_c.slideMax` |
| `layer_length_min` | float[] | `layer_c.lengthMin` |
| `layer_length_max` | float[] | `layer_c.lengthMax` |
| `layer_offset_root` | float[] | `layer_c.offsetRoot` |
| `layer_offset_tip` | float[] | `layer_c.offsetTip` |
| `layer_twist_root` | float[] | `layer_c.twistRoot` |
| `layer_twist_tip` | float[] | `layer_c.twistTip` |
| `layer_bend` | float[] | `layer_c.bend` |
| `init_curves_length` | float[] | `feathers_<0..3>_initCurve_curveInfo.arcLength` |

**Важно про эти два входа** (видно только из связей в `.ma`, не из `wing2.py`):

- `curves_position[i].curves_position_A[j]` ← `first_curve_<7-i>_<j+1>_locShape.worldPosition`,
  то есть локаторы, и **нумерация обратная**: `curves_position[0]` — это
  `first_curve_7_*`. У каждой вертикальной кривой ровно **4 CV** (j = 0..3),
  поэтому кубическая кривая по ним имеет один спан.
- `init_curves_length[0..3]` ← `feathers_<0..3>_initCurve_curveInfo.arcLength`, а
  `feathers_0_initCurve` — **отдельная живая кривая по 5 CV от позер-локаторов**
  (`start_poserOrient`, `feathers_5_init`, `middle_poserOrient`,
  `feathers_3_init`, `end_poserOrient`). Это НЕ длина главного сплайна, и
  сравнивать её с длиной главного сплайна нельзя — разные кривые по построению.
  Используется как масштабный ориентир (`scale_correct`, `stretch_factor`,
  `for_each_feather_locs`).

### Массивы по перьям — индекс `[layer][feather]`

Раскладка: multi compound `X` → дочерний multi float `X_A`. Подключены от
контрола кончика пера (`wing2.py:463-479`).

| атрибут | источник |
|---|---|
| `length` / `length_A` | `c_tip.length` |
| `length_min` / `length_min_A` | `c_tip.lengthMin` |
| `twist_root` / `twist_root_A` | `c_tip.twistRoot` |
| `twist_tip` / `twist_tip_A` | `c_tip.twistTip` |
| `wide` / `wide_A` | `c_tip.wide` |
| `root_pos` / `root_pos_A` | `c_tip.root_pos` |
| `tip_pos` / `tip_pos_A` | `c_tip.tip_pos` |
| `pos_2_offset` / `pos_2_offset_A` | `c_tip.middle_1_pos` |
| `pos_3_offset` / `pos_3_offset_A` | `c_tip.middle_2_pos` |
| `bend` / `bend_A` | `c_tip.bend` |

Ещё два входа той же вложенности:

- `curves_position` → `curves_position_A` (**float3**, `-nc 3`) — позиции CV кривых слоя
- `root_correct_matrix` → `root_correct_matrix_A` (**fltMatrix**) — коррекция у основания

### Выходы — индекс `[layer][feather][joint]`

Каждый выход: multi compound → multi compound → multi `fltMatrix`.

| атрибут | подключается к (`wing2.py:502-506`) |
|---|---|
| `out_controls_local_matrixes[l].._A[f].._A_B[i]` | `<name>_layer_<l>_feather_<f>_controls_group.offsetParentMatrix` и `<name>_layer_<l>_feather_<f>_<i>.offsetParentMatrix` |
| `out_joints_in_matrixes[l].._A[f].._A_B[i]` | `<name>_layer_<l>_feather_<f>_<i>_in_outJoint.offsetParentMatrix` |
| `out_joints_out_matrixes[l].._A[f].._A_B[i]` | `<name>_layer_<l>_feather_<f>_<i>_out_outJoint.offsetParentMatrix` |

Терминальные порты Bifrost (`Core__Graph__terminal__*`, тип `bifData`) не нужны.

## Решения по реализации

- Вложенные multi делаются составными атрибутами: multi compound с multi-детьми —
  ровно так же, как их создал Bifrost, иначе имена и индексы в питоне сломаются.
- Тип матриц в графе — `fltMatrix` (float). В ноде берём **double**
  (`MFnMatrixAttribute::kDouble`): подключение к `offsetParentMatrix` (double)
  работает так же, а точность выше. Если где-то поведение разойдётся — вернуть float.
- `wing2.py:281-285` удаляет элементы multi через `removeMultiInstance` и читает
  `getAttr(..., size=True)` — нода должна нормально переживать разреженные индексы
  и пустые элементы.

## Состояние

- **Сделано:** каркас плагина собирается и грузится (нода-заглушка `pk_wing`),
  интерфейс снят полностью, граф вычитан от верхнего уровня до листьев —
  математика ниже.
- **Дальше:** код. Порядок: примитивы сплайна (de Boor, узлы, репараметризация)
  с отладочными выходами и сверкой точек с графом, затем раскладка перьев,
  затем матрицы и коррекции.
- **Открытые вопросы** — в разделе «Проверить при написании кода».

## Математика графа

### Верхний уровень (13 нодов)

```
scale_correct(init_curves_length, global_transform, mainPoser_transform, mirror)
    -> init_curves_length_corrected
reconstruct_correct_matrixes(root_correct_matrix) -> array
locs_pos_to_curves1(curves_position, root_offset_1..7) -> bSplines   (4 сплайна)
flatten_compound(flatten, layer_twist_root, layer_twist_tip, layer_bend)
    -> обнуляет твисты/бенд при flatten
multiply/if: масштабные множители на layer_wide, layer_bend, bend,
    layer_offset_root/tip; if(mirror) даёт знак бенда
for_each_layer1(max_iterations = layers_count, ...)
    -> out_controls_local_matrixes, out_joints_in_matrixes, out_joints_out_matrixes
```

`for_each_layer1.max_iterations` в графе по умолчанию **10** — то есть слоёв не
больше 10 (приходит `layers_count`).

### Слой сплайнов: `locs_pos_to_curves1`

1. `for_each_get_main_bSplines1`, **7 итераций** — по одной на «вертикальную»
   линию локаторов (`curves_position[i]` — массив CV):
   - `construct_bSpline(control_points = CV, degree = 3, remap_range = true, 0..1)`
   - `reparameterize_bSpline(samples = 50, degree = 1)` — пересэмплировать в
     полилинию по длине дуги
   - вложенный `for_each` (**4 итерации**) снимает 4 точки вдоль этой линии;
     параметры берутся из `root_offset` (массив `root_offset_1..7`, дефолт 0.1789)
   - на выходе `h_curves_position_1..4`
2. `build_array` собирает 4 набора по 7 точек.
3. `for_each_get_main_bSplines`, **4 итерации** — на каждый набор
   `construct_bSpline(degree = 3, remap_range = true, 0..1)`.

Итого **4 главных кубических сплайна** (по 7 CV каждый) — это линия основания,
две промежуточные и линия кончиков; вдоль них раскладываются перья
(ср. входы `root_pos`, `pos_2_offset`, `pos_3_offset`, `tip_pos`).

### Примитивы, которые надо портировать

- **bSpline** в графе — объект-словарь с ключами `cvs`, `degree`, `knots`
  (`construct_bSpline` через `Core::Object::set_property`).
- **`knot_vector(cv_count, degree, remap_range, min, max)`** —
  `get_zeroToSpans_knot_vector` = `first_multiplicity` + `mid_section` +
  `last_multiplicity`, то есть зажатый (clamped) равномерный вектор узлов
  0..spans (`mid_section` = `sequence_array(start = 0, step = 1)`), затем
  `remap` в диапазон `min..max`.
- **`reparameterize_bSpline(bSpline, samples, degree)`** — `sample_bSpline_per_span`
  → `measure_linear_curve1` (длины хорд) → `find_segment_bounds` по накопленной
  длине → `parameter_array1` равномерных параметров → `construct_bSpline` степени 1.
  То есть: сэмплируем сплайн, копим длины, пересэмплируем равномерно по длине.
- **`sample_bSpline`** — `find_span` + `deBoor`.

Реализация в плагине: своя функция de Boor + построение clamped-узлов +
пересэмплирование по длине дуги. Кривые Maya не используем — они потребовали бы
правок в `wing2.py` (создание нод кривых) и добавили бы лишний шаг в DG.

### Каркас вычислений (что во что вложено)

```
for_each_layer1 (по слоям, max 10)
    get_from_array[current_index] по каждому массиву слоя  ->  layers(...)

layers (один слой):
    pos_limits(root_pos[], tip_pos[], global_pos_min, global_pos_max)
        -> out_root_pos[], out_tip_pos[]          позиции перьев вдоль слоя с лимитами
    wide = multiply(wide[], layer_wide)
    stretch_factor(bSplines, init_curves_length)  -> коэффициент растяжения
    for_each_feather_locs (по перьям; внутри 3 итерации)
        входы: bSplines, out_root_pos, out_tip_pos, pos_2_offset, pos_3_offset,
               wide, init_curves_length
        -> center_locs, in_locs, out_locs         опорные точки пера на сплайнах
    for_each_feather (по перьям, дефолт max 13)
        входы: center_locs/in_locs/out_locs, length, length_min/max,
               twist_root/tip, auto_twist_root/tip, global_twist_root/tip,
               offset_root/tip, controls_count, global_transform
        -> out_joints_in_matrixes, out_joints_out_matrixes (сразу наружу),
           out_controls_local_matrixes (идёт в коррекцию)
    for_each_feather_local_correct (по перьям, max 10)
        входы: out_controls_local_matrixes, root_correct, out_tip_pos
        -> matrix -> out_controls_local_matrixes
```

Числа-дефолты из графа: слоёв до 10, перьев до 13, контролов на перо — из
`controls_count`, опорных точек на перо — 3.

### Одно перо: `for_each_feather`

```
center_locs[i], in_locs[i], out_locs[i]  ->  три кубических сплайна (center/in/out)
wide = distance(center_locs[i][0], in_locs[i][0])        ширина пера
for_each_feather_segment_{center,in,out}  ->  массивы точек вдоль своего сплайна
feather_solver(center_position, in_position, out_position, wide, twist_*, offset_*,
               stretch_factor_root/tip, bend, layer_bend, global_transform, mirror)
    -> out_controls_local_matrixes, out_joints_in_matrixes, out_joints_out_matrixes
```

**Распределение точек вдоль пера** (`for_each_feather_segment_*`, формула точная):

```
t     = current_index / (max_iterations - 1)
param = length_min + global_length_min
        + t * (global_length_max - global_length_min) * (length - length_min)
pos   = sample_bSpline(bSpline, param)
```

где `length`, `length_min` — на перо, `global_length_min/max` — на слой.

### `feather_solver`

```
for_each_in_matrixes (up_negate = false)  ->  twisted_matrix[], out_matrix   "in" сторона
for_each_in_matrixes2 (up_negate = true)  ->  twisted_matrix[], out_matrix   "out" сторона
center = pk_lerp_matrix(in.out_matrix, out.out_matrix, fraction = 0.5,
                        always_use_shorter_arc = true)
out_joints_in_matrixes  = SRT_to_matrix(t)  * in.twisted_matrix  * inverse(center)
out_joints_out_matrixes = SRT_to_matrix(-t) * out.twisted_matrix * inverse(center)
    (t берётся из matrix_to_SRT(center).scale через divide - смещение на полширины)
mirror: применяется scale (-1, 1, 1) к center; if2 даёт знак -1/1
for_each_Controls_Local_Matrixes  ->  out_controls_local_matrixes
```

Количество итераций во всех трёх циклах = `array_size(center_position)`, то есть
число контролов пера.

### Точные формулы листьев

```
u = current_index / (max_iterations - 1)          # позиция вдоль пера, 0..1

get_offset      = offset_root * (1 - u) + offset_tip * u
get_twist_root  = (auto_twist_root * (1 - stretch_factor_root)
                   - global_twist_root - twist_root) * (1 - u)
get_twist_tip   = (auto_twist_tip  * (1 - stretch_factor_tip)
                   - global_twist_tip  - twist_tip)  * u
twist_degrees   = get_twist_root + get_twist_tip
```

Знаки важны: `auto_twist` идёт с плюсом и гасится растяжением, `global_twist` и
per-feather твист — с минусом (`Core::Math::negate`).

```
pos_limits:   out_root_pos = change_range(root_pos, 0..1 -> pos_min..pos_max, clamp)
              out_tip_pos  = change_range(tip_pos,  0..1 -> pos_min..pos_max, clamp)

stretch_factor:  root = length(bSplines[0]) / init_curves_length[0]
                 tip  = length(bSplines[3]) / init_curves_length[3]
                 (длина через get_d1_bSpline_length, диапазон 0..1)
```

### `for_each_in_matrixes` — ядро ориентации

Ноды, из которых складывается матрица (29 нодов, все формулы дальше):

- `pk_aim_matrix1(start_vec, end_vec, up_vec, position_blend, end_negate, up_negate)`
  — aim от точки `i` к соседней (`increment`/`decrement` по индексу, на концах
  `if2` подставляет 0), up-вектор от разницы center/in позиций, `up_negate`
  различает in- и out-сторону
- `get_twist_root` / `get_twist_tip` — угол твиста вдоль пера из
  `auto_twist_*`, `global_twist_*`, `twist_root/tip`, `stretch_factor_root`,
  `current_index`, `max_iterations`
- `pk_rotate_quaternion(..., rotate_axis = (1,0,0), degrees)` — поворот на угол
  твиста вокруг оси пера
- `get_offset(offset_root, offset_tip, current_index, max_iterations)` — смещение
  вдоль пера
- `bend` / `layer_bend` — доворот, знак от `mirror`
- `SRT_to_matrix` / `matrix_multiply` / `matrix_to_SRT` — сборка

Расшифрованные связи (i = current_index, n = max_iterations):

```
isLast = (i == n - 1)
start  = center_position[i]
up     = in_position[i]
end    = isLast ? center_position[i-1] : center_position[i+1]
aim    = pk_aim_matrix(start, end, up, end_negate = isLast, up_negate = <сторона>)

scale  = matrix_to_SRT(SRT_to_matrix3 * global_transform).scale
offZ   = get_offset(...)
out_matrix = aim * SRT_to_matrix(scale = scale, translation = (0,0,offZ) * scale)

quat   = pk_rotate_quaternion(rotate_axis = (1,0,0), degrees = twist_degrees)
bendZ  = (layer_bend + bend) * i                  # бенд накапливается по индексу
twisted_matrix = out_matrix
                 * SRT_to_matrix2(quaternion = quat)
                 * SRT_to_matrix4(translation = (0,0,bendZ))
```

**Порядок умножения** взят из `multiInPortNames` в raw JSON ноды — в графе порты
фан-ина названы по источнику, и только этот список задаёт порядок:

- `matrix_multiply`  → `["out_matrix", "transform"]`  = aim, затем SRT
- `matrix_multiply2` → `["output1", "transform", "transform1"]` = out_matrix, quat, bend

**Осторожно с соглашением о векторах:** Bifrost умножает матрицы как
столбцовые (`A * B * v`, первым применяется правый множитель), Maya `MMatrix` —
как строчные (`v * A * B`, первым применяется левый). При переносе порядок
умножения инвертируется. Это надо проверить численно на простом случае, прежде
чем писать остальное.

На последней точке aim смотрит назад (`end_negate = isLast`), потому что
следующей точки нет. `up_negate` различает in- и out-сторону пера.

### `for_each_feather_locs` — опорные точки пера (46 нодов)

На вход: 4 главных сплайна `bSplines[0..3]`, их начальные длины
`init_curves_length[0..3]`, и per-feather `wide`, `root_pos`, `tip_pos`,
`pos_2_offset`, `pos_3_offset`.

```
wide_factor = init_curves_length[0] * wide[i]

center_locs = [ center_position_0(curve_0, root_pos)          # линия основания
                center_position_1(curve_1, lerp 0.333, pos_2_offset)
                center_position_2(curve_2, lerp 0.666, pos_3_offset)
                center_position_3(curve_3, tip_pos) ]          # линия кончиков
```

**`center_position_*`** (формула точная):

```
half        = wide_factor / length                  # полуширина в параметре кривой
base        = lerp(root_pos, tip_pos, fraction)     # fraction: 0 / 0.333 / 0.666 / 1
center_pos  = clamp(base + position_offset, min = half, max = 1 - half)
center_position = sample_bSpline(curve, center_pos)
```

`clamp` по полуширине не даёт перу вылезти за край кривой.

**`in_out_position_*`** — in/out точки на той же кривой, сэмплированные в
параметре на ±полуширину:

```
wf     = length_0 * wide
delta  = wf / length  (с поправкой на текущую длину кривой через
                       get_d1_bSpline_length)
out_position = sample_bSpline(curve, center_pos + delta)
in_position  = sample_bSpline(curve, center_pos - delta)
```

**in/out у основания считаются иначе** — через aim-фрейм с нормалью поверхности
крыла:

```
neighbour = center_position_4(curve_0, root_pos[i == 0 ? 0 : i - 1])
v1   = center_position_0 - neighbour        # вдоль линии основания
v2   = center_position_1 - center_position_0 # вдоль пера
n    = normalize(i == 0 ? cross(v1, v2) : cross(v2, v1))   # знак от первого пера
aim  = pk_aim_matrix(start = center_position_0, end = center_position_1,
                     up_vec = center_position_0 + n)
out_position = translation(aim * SRT(translation = (0, 0,  wide_factor)))
in_position  = translation(aim * SRT(translation = (0, 0, -wide_factor)))
```

Итого `center_locs`, `in_locs`, `out_locs` — по **4 точки** каждый, и все три
сплайна пера строятся кубическими по 4 CV (это снимает вопрос про degree 3 при
трёх точках).

### Примитивы сплайна

```
sample_bSpline(bSpline, parameter):
    cvs, degree, knots = bSpline["cvs"], bSpline["degree"], bSpline["knots"]
    x, span = find_span(parameter, knots)
    return deBoor(cvs, degree, knots, x, span)

find_span(parameter, knots):
    x = clamp_parameter(parameter, knots)
    # тонкость на конце домена:
    if x != knots[last]:  span = последний i, где knots[i] <= x
    else:                 span = последний i, где knots[i] <  x
    return x, span

deBoor(cvs, degree, knots, x, span):     # учебниковый алгоритм
    d[j] = cvs[j + span - degree]        для j = 0..degree
    для r = 1..degree: обычная рекурсия де Бура
    return d[degree]
```

Узлы: зажатый равномерный вектор `0..spans` (`get_zeroToSpans_knot_vector`),
затем ремап в `min..max` (обычно 0..1).

### `pk_aim_matrix` (библиотечный + вариант в графе)

```
aim  = end_vec - start_vec          # в графе: if (end_negate) aim = -aim
upv  = up_vec  - end_vec            # именно от end, не от start!
                                    # в графе: if (up_negate) upv = -upv
side = normalize(cross(aim, upv))
up   = normalize(cross(side, aim))

столбцы матрицы:  c0 = normalize(aim)   ось X
                  c1 = up               ось Y
                  c2 = side             ось Z
                  c3 = (lerp(start_vec, end_vec, position_blend), 1)   позиция
```

Bifrost хранит матрицу столбцами, Maya `MMatrix` — строками, поэтому
`c0..c3` в Maya становятся строками 0..3 (то есть просто транспонирование, и
базисные векторы кладутся по строкам — как Maya и любит).

### `pk_lerp_matrix`

Разобрать обе матрицы в SRT, `lerp` масштаба и позиции, `slerp` кватерниона
(с `always_use_shorter_arc`), собрать обратно. Используется с `fraction = 0.5`
для центральной матрицы пера.

### Локальные матрицы контролов

`for_each_Controls_Local_Matrixes` (порядок из `multiInPortNames` = `[inverted, value]`):

```
i == 0 ?  transform[0]
       :  inverse(transform[i-1]) * transform[i]      # порядок Bifrost
```

То есть матрица относительно предыдущего контрола. В Maya (строчное соглашение)
это `transform[i] * inverse(transform[i-1])`.

### Константы-множители верхнего уровня

На верхнем уровне графа лежит константа `value = 0.1`, и по связям входы
домножаются на неё до попадания в цикл слоёв. **НО:** замер по джойнтам графа
(`width_check` в отладочном скрипте) показал, что в пути ширины этот множитель
не участвует — без него ширина пера совпадает с графом до четвёртого знака:

```
2 * init_curves_length[0] * wide[f] * layer_wide = 2 * 26.0982 * 1.0 * 0.0718 = 3.748
эталон (расстояние между _in_outJoint и _out_outJoint)                        = 3.7477
```

Имена портов в этом графе доверия не заслуживают: например порт, буквально
названный `layer_wide`, получает `layer_bend`. Поэтому по 0.1 доверять надо
замеру, а не чтению связей. Для `bend` и офсетов множитель ещё не проверен —
проверить тем же способом, когда появятся матрицы.

```
layer_wide         -> layer_wide * 0.1
bend               -> bend * 0.1
layer_bend         -> layer_bend * 0.1 * (mirror ? -1 : 1)   -> flatten_compound
layer_offset_root  -> layer_offset_root * (mirror ? -1 : 1)
layer_offset_tip   -> layer_offset_tip  * (mirror ? -1 : 1)
```

Порядки умножения матриц (из `multiInPortNames`, порядок Bifrost — первым
применяется правый множитель):

```
for_each_feather_locs:  matrix_multiply  = [aim, SRT]                 -> aim * SRT
feather_solver:         matrix_multiply  = [inverse(center), twisted, SRT]
for_each_in_matrixes:   matrix_multiply  = [aim, SRT]
                        matrix_multiply2 = [out_matrix, quat, bend]
for_each_Controls_Local_Matrixes:        = [inverse(prev), current]
```

Знаки векторов у основания пера (тоже из порядка портов, по связям не видно):

```
neighbour_index = (f == 0) ? f + 1 : f - 1    # if7.true_case = 1
vN = neighbour - center0        # НЕ center0 - neighbour
vF = center1  - center0
n  = normalize(f == 0 ? vN x vF : vF x vN)
```

### Подготовка входов

```
scale_correct:
    gz = matrix_to_SRT(global_transform).scale.z
    mz = matrix_to_SRT(mainPoser_transform).scale.z
    init_curves_length_corrected = (init_curves_length / mz) * (gz * (mirror ? -1 : 1))

flatten_compound:
    w = 1 - flatten
    layer_twist_root *= w;  layer_twist_tip *= w;  layer_bend *= w

reconstruct_correct_matrixes:
    пересобирает root_correct_matrix в массив ровно из 7 элементов (индексы 0..6)
```

### Коррекция локальных матриц

`for_each_feather_local_correct` →
`correct_local_matrixes_from_controls_to_feathers(root_correct_control_matrixes,
out_tip_pos = 1 - out_tip_pos, middle_point_1..5)` →
`for_each_feather_add_correct_local_matrix(feather_matrix, root_correct)`.

Константы `middle_point_1..5` в графе: `0.4268, 0.4932, 0.5941, 0.817, 0.9062`.
Числа неокруглённые — надо убедиться, что это именно константы, а не
закэшированные значения подключённых портов (Bifrost сохраняет в `values` и то,
и другое; например у `for_each_feather.auto_twist_root` лежит `7.99`, хотя порт
подключён снаружи).

## Установлено измерением (сверка с выходами графа)

Эталон — собственные выходы нода графа
(`out_controls_local_matrixes` / `out_joints_in_matrixes` / `out_joints_out_matrixes`),
а НЕ джойнты сцены: у джойнтов своя ориентация и родительство, которые всё
искажают. Прогон автономный: `plugins/pk_rigNodes/scripts/pk_wing_test.py` под
`mayapy` на `F:\Projects\SMF\owl\owl.v000.ma` (Maya 2025).

**`pk_rotate_quaternion` — разгадка.** Компаунд поворачивает направление
`(0,1,0)` вокруг оси X на угол твиста и отдаёт **вектор** `(0, cos D, sin D)`,
который подаётся в порт **кватерниона** — то есть достраивается `w = 0`.
Кватернион с `w = 0` это поворот на **180°** вокруг своей оси. При `D = 0` это
180° вокруг Y: X и Z переворачиваются, Y остаётся. Без этого оси джойнтов
смотрят в противоположную сторону. Реализовано как
`MQuaternion(0, cos D, sin D, 0)`; после этого X-расхождение стало ровно 0.000.

**Соглашение о векторах подтвердилось.** Все произведения матриц развёрнуты
относительно порядка Bifrost (`srt * aim`, `bend * quat * frame`,
`srt * twisted * inverse(center)`) — и совпали с графом.

**Множитель 0.1** в пути ширины не участвует (замер: `ratio = 1.000` по всем
перьям против расстояния между `_in_outJoint` и `_out_outJoint`).

**Первое перо** смотрит на следующее (`if7.true_case = 1`), у него же меняется
порядок cross.

**`get_d1_bSpline_length`** строит полилинию `[start, mid_cvs, end]` и меряет её,
то есть для кубической кривой это длина контрольного полигона, а не дуги.
Реализовано (`polygonLength`), но на результат влияет слабо (0.02°).

**Плотность репараметризации** — `steps = samples` на **спан**
(`sample_bSpline_per_span`), выход — `samples` CV.

**Зеркальное крыло: знаки гасят друг друга.** Замер на обоих крыльях совы
(`mirror_probe`):

```
левое:  det(global_transform) = +26.03, mirror = False
        граф: in T.y = +0.2403, out T.y = -0.2403
правое: det(global_transform) = -26.03, mirror = True
        граф: in T.y = +0.2403, out T.y = -0.2403     <- ТО ЖЕ САМОЕ
```

В графе смещение на полширины умножается на `(mirror ? -1 : 1)` и делится на
`matrix_to_SRT(global_transform).scale.y`, а при отрицательном определителе
Bifrost возвращает там **отрицательный** масштаб — два переворота гасятся.
Maya в `MTransformationMatrix::getScale` держит длины положительными, поэтому
дословное воспроизведение обоих шагов оставляет один непогашенный переворот и
джойнты уезжают ровно на двойную полуширину (замеряно: 1.2645 = 2 x 0.6323).
Поэтому воспроизводится **итог**: смещение всегда `+wide / |scale.y|` для in и
`-...` для out, одинаково на обоих крыльях.

### Текущая точность

| выход | worst позиция | worst угол |
|---|---|---|
| `out_controls_local_matrixes` | 0.0005 | 0.28° |
| `out_joints_in_matrixes` | 0.0064 | 0.60° |
| `out_joints_out_matrixes` | 0.0072 | 0.66° |

(слои 0, 1, 5; 247 сравнений; крыло ~100 единиц, ширина пера ~3.7)

Ось прицела (X) совпадает **точно** (0.000) — остаток это чистый ролл вокруг
прицела. Вероятная причина: центральная матрица пера считается как slerp двух
фреймов, которые различаются почти на 180° (у out-стороны up-вектор
негирован), а это вырожденный случай — крошечные различия во входах
усиливаются в ролле. То есть и мой, и графовский результат «правильны», просто
неоднозначность 180° разрешается чуть по-разному.

## Проверить при написании кода

- **соглашение о векторах**: инвертировать ли порядок умножения (Bifrost
  столбцовый, Maya строчный) — проверить численно на одной точке
- в графовом варианте `pk_aim_matrix1`: идут ли в `cross` негированные векторы
  или исходные (`negate` точно влияет на `c0`, про cross нужно уточнить)
- `pk_rotate_quaternion`: его выход `.vector` подаётся в
  `SRT_to_matrix.quaternion` — как именно вектор трактуется как кватернион,
  это единственное место, где я не уверен в семантике
- точная обвязка `in_out_position_*`: где вмешивается `get_d1_bSpline_length`
- `middle_point_1..5` — константы или мусор
- `some_math`, `measure_segments`, `solve_start/mid_section/end` — не
  понадобились в разобранном пути; проверить, что они не влияют на выход

## Отладочная визуализация

Нужна и для проверки, и в работе. Делается в два этапа.

**Этап 1 — отладочные выходы + скрипт.** У `pk_wing` появляются:

| атрибут | тип | смысл |
|---|---|---|
| `debug_stage` | enum/long | что публиковать: 0 = выключено (ничего не считается), 1 = CV сплайнов, 2 = точки после репараметризации, 3 = опорные точки перьев (center/in/out), 4 = финальные матрицы |
| `debug_points` | float3[] | точки выбранной стадии |
| `debug_matrices` | matrix[] | матрицы выбранной стадии (для осей) |

Скрипт в `plugins/pk_rigNodes/scripts/` создаёт локаторы и подключает их к этим
выходам — локаторы живые, ездят вместе с ригом. Это же используется для
численного сравнения с Bifrost-графом.

**Этап 2 — нода-локатор `pk_wingDebug` с VP2 draw override:** рисует точки и оси
прямо во вьюпорте, не создавая нод в сцене. Отдельная нода, чтобы `pk_wing`
осталась чистой DG-нодой без накладных расходов шейпа. От математики не зависит,
делается параллельно. В графе этому соответствовали компаунды
`pk_draw_position/positions/matrix/vector` из библиотеки.
