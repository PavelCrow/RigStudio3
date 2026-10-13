# Картинки-подсказки для страницы опций модуля shoulder (mayapy 2022).
#
# helpImage.png  - позеры (кружки с номерами) и кости (ромбы с буквами)
# helpImage2.png - зоны покраски скина по костям (ядро и переход)
# Вид спереди и сзади, левая сторона подписана, правая - зеркально.
# Положения берутся из констант generate_shoulder.py (позеры по умолчанию,
# пропорции шаблона human), так что после их правки картинки перерисовываются
# этим же скриптом. Рисуются в 2x, страница ставит devicePixelRatio 2.
# Легенды - текстом в shoulder_widget.ui, номера и буквы здесь должны с ними
# совпадать.
import os
import sys

from PySide2 import QtCore, QtGui

sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
import generate_shoulder as G

HERE = os.path.dirname(os.path.abspath(__file__))
SC = (1.216, 23.202, 0.604)        # грудино-ключичный сустав шаблона human (mainPoser)
SCALE = 2                          # рисуем в 2x
VIEW_W, VIEW_H = 168, 200          # один вид в 1x
RANGE = (-5.2, 5.2, 16.3, 27.0)    # x0, x1, y0, y1

BG = QtGui.QColor(60, 60, 60)
BODY = QtGui.QColor(78, 78, 78)
BODY_EDGE = QtGui.QColor(112, 112, 112)
BONE = QtGui.QColor(150, 148, 140)
TEXT = QtGui.QColor(190, 190, 190)
CLAV, SCAP, MUS = "#D85A30", "#1D9E75", "#9F97F0"
CLAV_J, SCAP_J, MUS_J = "#F0997B", "#5DCAA5", "#CECBF6"

# силуэт левой половины (x, y), правая - зеркально
SIL = [(0.75, 26.4), (0.8, 24.95), (2.2, 24.6), (3.3, 24.35), (3.95, 23.95), (5.4, 24.1), (5.4, 23.0),
       (4.0, 22.55), (3.55, 21.2), (3.15, 19.2), (2.85, 17.4), (2.95, 16.4)]
SPINE = [(0, 16.4), (0, 18.41), (0, 20.28), (0, 21.87), (0, 23.15), (0, 24.34), (0, 26.5)]
ARM_ROOT = (3.25, 23.62)


def world(local):
    return tuple(SC[i] + local[i] for i in range(3))


POS = {name: world(t) for name, t, _, _ in G.POSERS}
POS["root"] = SC
# какой вид показывает точку: F - спереди, B - сзади
VIEWS = {"root": "F", "shoulder": "FB", "scapulaTop": "B", "scapulaTip": "B",
         "pecUpperOrigin": "F", "pecLowerOrigin": "F", "pecInsert": "F",
         "latOrigin": "B", "latInsert": "B", "trapOrigin": "B", "trapInsert": "B"}
POSER_NUM = [("root", 1, CLAV), ("shoulder", 2, CLAV), ("scapulaTop", 3, SCAP), ("scapulaTip", 4, SCAP),
             ("pecUpperOrigin", 6, MUS), ("pecLowerOrigin", 7, MUS), ("pecInsert", 8, MUS),
             ("latOrigin", 9, MUS), ("latInsert", 10, MUS), ("trapOrigin", 11, MUS), ("trapInsert", 12, MUS)]


# центр подписи относительно маркера, px в 1x: (спереди, сзади)
LABEL = {1: ((-11, -9), None), 6: ((-4, -12), None), 2: ((-9, -10), (-9, -11)), 8: ((10, -9), None),
         3: (None, (12, -1)), 4: (None, (12, -3)), 9: (None, (11, -7)), 10: (None, (-2, 14)),
         11: (None, (10, -9)), 12: (None, (1, -13)),
         "К": ((5, 13), None), "ГВ": ((14, 11), None), "ГН": ((14, 11), None),
         "Л": (None, (-13, 9)), "Н": (None, (-13, 10)), "Ш": (None, (-13, 9)), "Т": (None, (-6, 12))}


def mid(a, b, t=0.5):
    return tuple(POS[a][i] + (POS[b][i] - POS[a][i]) * t for i in range(3))


# кости: буква, положение, виды, цвет
JOINTS = [("К", POS["root"], "F", CLAV_J), ("Л", POS["scapulaTop"], "B", SCAP_J),
          ("Н", POS["scapulaTip"], "B", SCAP_J)]
for m, o, _, i, _, _ in G.MUSCLES:
    letter = {"pecUpper": "ГВ", "pecLower": "ГН", "lat": "Ш", "trap": "Т"}[m]
    JOINTS.append((letter, mid(o, i), "F" if m.startswith("pec") else "B", MUS_J))

# зоны скина: буква, цвет, контур спереди, контур сзади (x, y левой стороны)
ZONES = [
    ("К", "#D85A30", [(1.0, 23.55), (2.2, 23.85), (3.3, 24.2), (3.5, 23.75), (2.3, 23.35), (1.1, 22.95)],
     [(2.0, 24.45), (3.3, 24.3), (3.4, 23.95), (2.1, 24.05)]),
    ("Т", "#BA7517", [(0.8, 25.0), (2.2, 24.65), (3.2, 24.35), (2.2, 24.05), (0.9, 24.35)],
     [(0.65, 25.6), (0.85, 24.95), (2.2, 24.6), (3.25, 24.35), (2.6, 23.95), (1.4, 23.75), (0.45, 23.6)]),
    ("ГВ", "#D4537E", [(1.3, 22.95), (2.4, 23.25), (3.6, 23.35), (4.15, 22.85), (3.6, 22.45), (2.3, 22.55), (1.35, 22.5)], None),
    ("ГН", "#7F77DD", [(0.35, 22.45), (1.6, 22.45), (3.1, 22.4), (3.95, 22.45), (3.45, 21.3), (2.5, 20.55), (1.3, 20.45), (0.4, 20.75)], None),
    ("Ш", "#378ADD", [(3.55, 22.25), (3.95, 22.4), (3.45, 20.9), (3.15, 19.6), (3.0, 20.6)],
     [(3.55, 22.85), (4.1, 22.6), (3.6, 21.1), (3.2, 19.2), (2.4, 18.4), (2.15, 19.4), (2.9, 21.0)]),
    ("Л", "#1D9E75", None, [(1.15, 23.35), (2.2, 23.65), (3.35, 23.9), (3.6, 23.15), (3.0, 21.95), (1.95, 21.55), (1.25, 21.75)]),
    ("Н", "#639922", None, [(1.45, 20.6), (2.4, 20.75), (2.95, 19.9), (2.55, 19.0), (1.75, 18.85), (1.3, 19.6)]),
]
NOT_MODULE = {"F": [(-0.3, 23.0), (0.35, 23.0), (0.35, 20.3), (-0.3, 20.3)],
              "B": [(-0.3, 24.0), (0.3, 24.0), (0.3, 17.0), (-0.3, 17.0)]}
DELTOID = {"F": [(3.45, 24.25), (4.3, 24.05), (4.6, 23.0), (4.1, 22.5), (3.7, 23.2)],
           "B": [(3.4, 24.3), (4.3, 24.05), (4.6, 23.0), (4.05, 22.55), (3.65, 23.3)]}


class View(object):
    def __init__(self, painter, x_off, back):
        self.p, self.back = painter, back
        x0, x1, y0, y1 = RANGE
        w, h = VIEW_W * SCALE, (VIEW_H - 16) * SCALE
        self.k = min(w / (x1 - x0), h / (y1 - y0))
        self.ox = x_off + (w - (x1 - x0) * self.k) / 2
        self.oy = 16 * SCALE + (h - (y1 - y0) * self.k) / 2

    def pt(self, x, y):
        x0, x1, y0, y1 = RANGE
        if self.back:
            x = -x
        return QtCore.QPointF(self.ox + (x - x0) * self.k, self.oy + (y1 - y) * self.k)

    def poly(self, pts, sign=1):
        return QtGui.QPolygonF([self.pt(x * sign, y) for x, y in pts])


def color(c, alpha=255):
    q = QtGui.QColor(c)
    q.setAlpha(alpha)
    return q


def grow(pts, s):
    cx = sum(p[0] for p in pts) / len(pts)
    cy = sum(p[1] for p in pts) / len(pts)
    return [(cx + (x - cx) * s, cy + (y - cy) * s) for x, y in pts]


def font(px, bold=False):
    f = QtGui.QFont("Segoe UI")
    f.setPixelSize(px * SCALE)
    f.setBold(bold)
    return f


def body(v, tag):
    p = v.p
    p.setPen(QtGui.QPen(BODY_EDGE, 1 * SCALE))
    p.setBrush(BODY)
    p.drawPolygon(QtGui.QPolygonF([v.pt(x, y) for x, y in SIL + [(-x, y) for x, y in reversed(SIL)]]))
    p.setBrush(QtCore.Qt.NoBrush)
    pen = QtGui.QPen(BONE, 3 * SCALE)
    pen.setCapStyle(QtCore.Qt.RoundCap)
    p.setPen(pen)
    p.drawPolyline(QtGui.QPolygonF([v.pt(x, y) for x, y in SPINE]))
    for s in (1, -1):
        p.drawLine(v.pt(ARM_ROOT[0] * s, ARM_ROOT[1]), v.pt(5.4 * s, ARM_ROOT[1]))
    p.setFont(font(11))
    p.setPen(TEXT)
    p.drawText(QtCore.QRectF(v.ox, 2 * SCALE, VIEW_W * SCALE, 14 * SCALE), QtCore.Qt.AlignCenter,
               u"сзади" if v.back else u"спереди")


def markers(v, tag, posers=True):
    p = v.p
    side = -1 if v.back else 1
    if posers:
        # кости ключицы и треугольник лопатки - для ориентира
        pen = QtGui.QPen(color(CLAV, 110), 3 * SCALE)
        pen.setCapStyle(QtCore.Qt.RoundCap)
        for s in (1, -1):
            p.setPen(pen)
            p.drawLine(v.pt(POS["root"][0] * s, POS["root"][1]), v.pt(POS["shoulder"][0] * s, POS["shoulder"][1]))
        if v.back:
            tri = [(POS[n][0], POS[n][1]) for n in ("scapulaTop", "shoulder", "scapulaTip")]
            p.setPen(QtGui.QPen(color(SCAP, 160), 1 * SCALE))
            p.setBrush(color(SCAP, 70))
            p.drawPolygon(v.poly(tri))
            p.setBrush(color(SCAP, 35))
            p.drawPolygon(v.poly(tri, -1))
        # эллипсоид рёбер
        c = world(G.RIBCAGE["t"])
        rx, ry = G.RIBCAGE["s"][0], G.RIBCAGE["s"][1]
        pen = QtGui.QPen(color(SCAP, 200), 1.2 * SCALE, QtCore.Qt.DashLine)
        p.setPen(pen)
        p.setBrush(QtCore.Qt.NoBrush)
        p.drawEllipse(v.pt(0, c[1]), rx * v.k, ry * v.k)
        # линии мышц
        p.setPen(QtGui.QPen(color(MUS, 200), 1.3 * SCALE, QtCore.Qt.DashLine))
        for m, o, _, i, _, _ in G.MUSCLES:
            if tag in VIEWS[o] and tag in VIEWS[i]:
                p.drawLine(v.pt(POS[o][0], POS[o][1]), v.pt(POS[i][0], POS[i][1]))
    # кости
    p.setFont(font(10, bold=True))
    for letter, pos, views, col in JOINTS:
        if tag not in views:
            continue
        q = v.pt(pos[0], pos[1])
        r = 4.5 * SCALE
        p.setPen(QtCore.Qt.NoPen)
        p.setBrush(color(col))
        p.drawPolygon(QtGui.QPolygonF([q + QtCore.QPointF(0, -r), q + QtCore.QPointF(r, 0),
                                       q + QtCore.QPointF(0, r), q + QtCore.QPointF(-r, 0)]))
        p.setPen(color(col))
        label(v, q, letter)
    # позеры
    if posers:
        p.setFont(font(10, bold=True))
        for name, num, col in POSER_NUM:
            if tag not in VIEWS[name]:
                continue
            q = v.pt(POS[name][0], POS[name][1])
            p.setPen(QtGui.QPen(color(col), 1.8 * SCALE))
            p.setBrush(color("#3c3c3c", 170))
            p.drawEllipse(q, 5 * SCALE, 5 * SCALE)
            p.setPen(color(col))
            label(v, q, num)


def label(v, q, key):
    off = LABEL.get(key, (None, None))[1 if v.back else 0]
    if off is None:
        off = (-12, -9) if isinstance(key, int) else (12, 9)
        if v.back:
            off = (-off[0], off[1])
    c = q + QtCore.QPointF(off[0] * SCALE, off[1] * SCALE)
    v.p.drawText(QtCore.QRectF(c.x() - 12 * SCALE, c.y() - 7 * SCALE, 24 * SCALE, 14 * SCALE), QtCore.Qt.AlignCenter, str(key))


def zones(v, tag):
    p = v.p
    p.setPen(QtCore.Qt.NoPen)
    for s, a1, a2 in ((-1, 20, 50), (1, 45, 140)):          # сначала бледная правая сторона
        for letter, col, front, back in ZONES:
            pts = back if v.back else front
            if not pts:
                continue
            p.setBrush(color(col, a1))
            p.drawPolygon(v.poly(grow(pts, 1.3), s))
            p.setBrush(color(col, a2))
            p.drawPolygon(v.poly(pts, s))
    p.setBrush(color("#888780", 120))
    p.drawPolygon(v.poly(NOT_MODULE[tag]))
    p.setBrush(QtCore.Qt.NoBrush)
    p.setPen(QtGui.QPen(color("#B4B2A9", 200), 1 * SCALE, QtCore.Qt.DashLine))
    for s in (1, -1):
        p.drawPolygon(v.poly(DELTOID[tag], s))


def render(path, draw):
    img = QtGui.QImage(VIEW_W * 2 * SCALE + SCALE, VIEW_H * SCALE, QtGui.QImage.Format_ARGB32)
    img.fill(BG)
    p = QtGui.QPainter(img)
    p.setRenderHint(QtGui.QPainter.Antialiasing)
    p.setRenderHint(QtGui.QPainter.TextAntialiasing)
    for i, back in enumerate((False, True)):
        v = View(p, i * (VIEW_W * SCALE + SCALE), back)
        p.setClipRect(QtCore.QRectF(i * (VIEW_W * SCALE + SCALE), 0, VIEW_W * SCALE, VIEW_H * SCALE))
        draw(v, "B" if back else "F")
        p.setClipping(False)
    p.end()
    assert img.save(path), path
    print("saved", path, img.width(), img.height())


if __name__ == "__main__":
    app = QtGui.QGuiApplication(sys.argv)

    def posers_and_joints(v, tag):
        body(v, tag)
        markers(v, tag, posers=True)

    def skin(v, tag):
        body(v, tag)
        zones(v, tag)
        markers(v, tag, posers=False)

    render(os.path.join(HERE, "helpImage.png"), posers_and_joints)
    render(os.path.join(HERE, "helpImage2.png"), skin)
