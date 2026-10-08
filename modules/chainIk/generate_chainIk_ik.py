r"""Run this file in Maya to rebuild one chainIk rig with three IK boxes and a master.

Translation moves FK positions; rotation turns parent groups without moving
neutral FK pivots. FK controls remain free and use their rotated local axes.

Maya Python tab::

    import runpy
    runpy.run_path(r"F:\Maya_Projects\rigStudio3\modules\chainIk\generate_chainIk_ik.py",
                   run_name="__main__")

Edit the four constants below to change the generated chain.
"""

import importlib
import sys
from pathlib import Path


NAME = "chainIkDemo2"
FK_CONTROLS = 5
JOINTS = 10
LENGTH = 10.0


def run():
    project_parent = str(Path(__file__).resolve().parents[3])
    if project_parent not in sys.path:
        sys.path.insert(0, project_parent)

    from rigStudio3.modules.chainIk import chainIk_ik_controls

    importlib.reload(chainIk_ik_controls)
    boxes = chainIk_ik_controls.regenerate(
        NAME, controls_count=FK_CONTROLS, joints_count=JOINTS, length=LENGTH
    )
    print("Created {} with IK controls {}".format(NAME, boxes))
    return boxes


if __name__ == "__main__":
    run()
