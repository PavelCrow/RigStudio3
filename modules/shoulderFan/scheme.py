# Схема позеров shoulderFan на странице опций: вид спереди и сзади, точки -
# позеры по раскладке по умолчанию (fan.py). Клик выделяет позер модуля в
# сцене, Shift+клик добавляет к выделению, наведение - где его ставить.
#
# Точки схематичные (умолчания шаблона), а не текущие положения позеров: схема
# показывает, куда что ставить. Соседние точки, попавшие друг на друга,
# раздвигаются; от сдвинутой точки к её месту - тонкая линия.
import math
import maya.cmds as cmds

from . import fan

version = int(cmds.about(v=True).split(" ")[0])
if version <= 2024:
    from PySide2 import QtWidgets, QtGui, QtCore
else:
    from PySide6 import QtWidgets, QtGui, QtCore

CLAV, SCAP, FAN, CENTER = "#D85A30", "#1D9E75", "#9F97F0", "#B4B2A9"
BODY_FILL, BODY_LINE, DOT_TEXT = "#5a5a5a", "#808080", "#1a1a1a"

MID_X = fan.RIBCAGE["t"][0]          # середина тела в кадре mainPoser
DOT_R = 8
MIN_GAP = 17                          # ближе - раздвигаем
X_EXT, Y_TOP, Y_BOT = 4.9, 3.4, -6.3  # что видно (единицы кадра mainPoser)
TITLE_H, KEY_H = 20, 34

# имя позера: (буква на точке, цвет, где ставить)
BASE_INFO = {
    "root": ("R", CLAV, u"грудино-ключичный сустав: у верха грудины, где в неё упирается ключица"),
    "shoulder": ("A", CLAV, u"акромион, костяной верх плеча (над плечевым суставом); за ним едет лопатка"),
    "scapulaTop": ("S", SCAP, u"верхний внутренний угол лопатки: сзади у позвоночника, на уровне верха лопатки"),
    "fanCenter": ("C", CENTER, u"центр веера: в глубине грудной клетки, посередине между грудиной и "
                               u"позвоночником, на высоте середины груди"),
}
RIBCAGE_INFO = u"эллипсоид грудной клетки (пунктир): повторяет спину под лопаткой, по нему скользит лопатка"
KEY = (u"R root · A shoulder (акромион) · S scapulaTop · C fanCenter · пунктир - ribcage · "
       u"1..N - кости веера (spoke). Клик - выделить позер, Shift+клик - добавить")

# силуэт торса (половина: X от середины тела наружу, Y вверх; плечи с началом рук)
_HALF = [(0.0, 3.4), (0.85, 3.4), (0.95, 1.8), (2.2, 1.35), (3.3, 0.95), (4.4, 0.7), (4.9, 0.6),
         (4.9, -1.0), (4.3, -1.05), (3.1, -1.7), (2.85, -3.6), (2.6, -6.3), (0.0, -6.3)]


def _points(module_name):
    """Позеры схемы: [(имя позера без модуля, подпись, цвет, (x, y, z) в кадре mainPoser, подсказка)]."""
    pts = [("root",) + BASE_INFO["root"][:2] + ((0.0, 0.0, 0.0), BASE_INFO["root"][2])]
    for name, t, _, _ in fan.BASE_POSERS:
        letter, color, info = BASE_INFO[name]
        pts.append((name, letter, color, t, info))
    count = fan.scene_count(module_name + "_") if module_name else 0
    for k in range(1, (count or fan.DEFAULT_COUNT) + 1):
        pos, w = fan.default_spoke(k)
        if k <= len(fan.SPOKE_PLACES):
            title, where = fan.SPOKE_PLACES[k - 1]
            info = u"%s: %s" % (title, where)
        else:
            info = u"кость сверх %d - по умолчанию между соседними по номеру" % len(fan.SPOKE_PLACES)
        info += u" (%s)" % u", ".join(u"%s %g" % (a, v) for a, v in zip(fan.WEIGHTS, w) if v)
        pts.append((fan.spoke_name(k), str(k), FAN, pos, info))
    return pts


def _in_view(name, z, view):
    """Спереди видно то, что не глубже середины рёбер сзади, сзади - не ближе к груди;
    центр и акромион - в обоих видах."""
    if name in ("fanCenter", "shoulder"):
        return True
    return z > -1.6 if view == "front" else z < -0.9


def _event_pos(event):
    """Положение мыши: position() в Qt6, pos() в Qt5."""
    if hasattr(event, "position"):
        return event.position().toPoint()
    return event.pos()


class FanScheme(QtWidgets.QWidget):
    def __init__(self, module_name, parent=None):
        super(FanScheme, self).__init__(parent)
        self.module_name = module_name
        self.mirror = module_name.startswith("r_")
        self.points = _points(module_name)
        self.hits = []                # (имя позера, экранная точка, подсказка) - для кликов
        self.setMouseTracking(True)
        self.setMinimumHeight(320)
        self.setSizePolicy(QtWidgets.QSizePolicy.Expanding, QtWidgets.QSizePolicy.Fixed)

    def sizeHint(self):
        return QtCore.QSize(480, 320)

    # ------------------------------------------------------------ геометрия
    def _views(self):
        w, h = self.width(), self.height()
        half = w / 2.0
        scale = min((half - 12) / (2 * X_EXT), (h - TITLE_H - KEY_H - 8) / (Y_TOP - Y_BOT))
        cy = TITLE_H + 4 + Y_TOP * scale
        return [(view, half * i + half / 2.0, cy, scale) for i, view in enumerate(("front", "back"))]

    def _to_screen(self, view, cx, cy, scale, x, y):
        """x - от середины тела наружу по стороне модуля."""
        # спереди левая сторона персонажа справа от зрителя, сзади - слева;
        # у правого модуля наоборот
        sign = 1 if view == "front" else -1
        if self.mirror:
            sign = -sign
        return QtCore.QPointF(cx + sign * x * scale, cy - y * scale)

    def _rib_of(self, view, cx, cy, scale):
        c = self._to_screen(view, cx, cy, scale, fan.RIBCAGE["t"][0] - MID_X, fan.RIBCAGE["t"][1])
        return c, fan.RIBCAGE["s"][0] * scale, fan.RIBCAGE["s"][1] * scale

    def _dots(self, view, cx, cy, scale):
        dots = []
        for name, label, color, (x, y, z), info in self.points:
            if not _in_view(name, z, view):
                continue
            p = self._to_screen(view, cx, cy, scale, x - MID_X, y)
            dots.append([name, label, color, p, QtCore.QPointF(p), info])
        # раздвинуть слипшиеся точки
        for _ in range(40):
            moved = False
            for a in range(len(dots)):
                for b in range(a + 1, len(dots)):
                    pa, pb = dots[a][4], dots[b][4]
                    d = pb - pa
                    ln = math.hypot(d.x(), d.y())
                    if ln < MIN_GAP:
                        if ln < 1e-3:
                            d, ln = QtCore.QPointF(1, 0.3), math.hypot(1, 0.3)
                        push = d * ((MIN_GAP - ln) / ln * 0.5)
                        dots[a][4] = pa - push
                        dots[b][4] = pb + push
                        moved = True
            if not moved:
                break
        return dots

    # ------------------------------------------------------------ рисование
    def paintEvent(self, event):
        qp = QtGui.QPainter(self)
        qp.setRenderHint(QtGui.QPainter.Antialiasing)
        text = self.palette().color(QtGui.QPalette.WindowText)
        selected = set(cmds.ls(sl=1) or [])
        self.hits = []
        font = qp.font()
        for view, cx, cy, scale in self._views():
            self._body(qp, view, cx, cy, scale)
            dots = self._dots(view, cx, cy, scale)
            center = [d for d in dots if d[0] == "fanCenter"]
            # кости веера: от центра к концам
            if center:
                qp.setPen(QtGui.QPen(QtGui.QColor(FAN), 1))
                for d in dots:
                    if d[0].startswith("spoke_"):
                        qp.drawLine(center[0][3], d[3])
            for name, label, color, true_p, p, info in dots:
                if (p - true_p).manhattanLength() > 2:
                    qp.setPen(QtGui.QPen(QtGui.QColor("#d0d0d0"), 1, QtCore.Qt.DotLine))
                    qp.drawLine(true_p, p)
                    qp.setPen(QtCore.Qt.NoPen)
                    qp.setBrush(QtGui.QColor(color))
                    qp.drawEllipse(true_p, 2, 2)
                poser = "%s_%s_poser" % (self.module_name, name)
                sel = poser in selected
                qp.setPen(QtGui.QPen(QtGui.QColor("#ffffff" if sel else "#202020"), 2.5 if sel else 1))
                qp.setBrush(QtGui.QColor(color))
                qp.drawEllipse(p, DOT_R, DOT_R)
                font.setPointSize(7 if len(label) > 1 else 8)
                font.setBold(True)
                qp.setFont(font)
                qp.setPen(QtGui.QColor(DOT_TEXT))
                qp.drawText(QtCore.QRectF(p.x() - DOT_R, p.y() - DOT_R, 2 * DOT_R, 2 * DOT_R), QtCore.Qt.AlignCenter, label)
                self.hits.append((name, p, info))
            font.setPointSize(9)
            qp.setFont(font)
            qp.setPen(text)
            qp.drawText(QtCore.QRectF(cx - 60, 2, 120, TITLE_H), QtCore.Qt.AlignCenter,
                        u"Спереди" if view == "front" else u"Сзади")
        # расшифровка букв
        font.setPointSize(8)
        font.setBold(False)
        qp.setFont(font)
        qp.setPen(text)
        qp.drawText(QtCore.QRectF(4, self.height() - KEY_H, self.width() - 8, KEY_H),
                    QtCore.Qt.AlignCenter | QtCore.Qt.TextWordWrap, KEY)
        qp.end()

    def _body(self, qp, view, cx, cy, scale):
        half = [self._to_screen(view, cx, cy, scale, x, y) for x, y in _HALF]
        other = [self._to_screen(view, cx, cy, scale, -x, y) for x, y in reversed(_HALF)]
        qp.setPen(QtGui.QPen(QtGui.QColor(BODY_LINE), 1))
        qp.setBrush(QtGui.QColor(BODY_FILL))
        qp.drawPolygon(QtGui.QPolygonF(half + other))
        # эллипсоид рёбер - кликабельный контур
        c, rx, ry = self._rib_of(view, cx, cy, scale)
        qp.setPen(QtGui.QPen(QtGui.QColor(CENTER), 1, QtCore.Qt.DashLine))
        qp.setBrush(QtCore.Qt.NoBrush)
        qp.drawEllipse(c, rx, ry)
        # ориентиры: грудина и ключица спереди, позвоночник и лопатка сзади
        qp.setPen(QtGui.QPen(QtGui.QColor(BODY_LINE), 2))
        qp.drawLine(self._to_screen(view, cx, cy, scale, 0, 0.2),
                    self._to_screen(view, cx, cy, scale, 0, -6.0 if view == "back" else -4.5))
        sh = fan.BASE_POSERS[0][1]
        acromion = self._to_screen(view, cx, cy, scale, sh[0] - MID_X, sh[1])
        if view == "front":
            qp.setPen(QtGui.QPen(QtGui.QColor(CLAV), 2))
            qp.drawLine(self._to_screen(view, cx, cy, scale, -MID_X, 0), acromion)
        else:
            top = fan.BASE_POSERS[1][1]
            tip = fan.default_spoke(9)[0]
            pts = [self._to_screen(view, cx, cy, scale, top[0] - MID_X, top[1]), acromion,
                   self._to_screen(view, cx, cy, scale, tip[0] - MID_X, tip[1])]
            qp.setPen(QtGui.QPen(QtGui.QColor(SCAP), 1.5))
            qp.drawPolygon(QtGui.QPolygonF(pts))

    # ------------------------------------------------------------ мышь
    def _pick(self, pos):
        best = None
        for name, p, info in self.hits:
            d = math.hypot(p.x() - pos.x(), p.y() - pos.y())
            if d <= DOT_R + 2 and (best is None or d < best[0]):
                best = (d, name, info)
        if best:
            return best[1], best[2]
        # контур эллипсоида рёбер
        for view, cx, cy, scale in self._views():
            c, rx, ry = self._rib_of(view, cx, cy, scale)
            r = math.hypot((pos.x() - c.x()) / rx, (pos.y() - c.y()) / ry)
            if abs(r - 1) * min(rx, ry) < 5:
                return "ribcage", RIBCAGE_INFO
        return None, None

    def mouseMoveEvent(self, event):
        pos = _event_pos(event)
        name, info = self._pick(pos)
        if name:
            self.setCursor(QtCore.Qt.PointingHandCursor)
            QtWidgets.QToolTip.showText(self.mapToGlobal(pos), u"<b>%s</b><br>%s" % (name, info), self)
        else:
            self.unsetCursor()
            QtWidgets.QToolTip.hideText()

    def mousePressEvent(self, event):
        name, _ = self._pick(_event_pos(event))
        if not name:
            return
        poser = "%s_%s_poser" % (self.module_name, name)
        if not cmds.objExists(poser):
            cmds.warning("%s: no poser %s" % (self.module_name, poser))
            return
        add = bool(event.modifiers() & QtCore.Qt.ShiftModifier)
        cmds.select(poser, add=add)
        self.update()
