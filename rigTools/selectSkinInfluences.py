# Select the joints (influences) that drive the selected geometry points through a skinCluster.
#
# Works with poly vertices / faces / edges (converted to vertices), NURBS and curve CVs, and lattice
# points. Influences with a weight above the threshold on at least one point are selected; with
# verbose=True the weights of every point are printed, largest first.

import maya.cmds as cmds


def run(threshold=0.001, verbose=True):
    sel = cmds.ls(sl=True, fl=True) or []
    if not sel:
        cmds.warning("Select geometry points")
        return []

    # faces/edges -> vertices; CVs and lattice points are taken as they are
    points = cmds.ls(cmds.polyListComponentConversion(sel, tv=True) or [], fl=True)
    points += cmds.filterExpand(sel, sm=(28, 46)) or []
    if not points:
        cmds.warning("No geometry points in the selection")
        return []

    byNode = {}
    for p in points:
        byNode.setdefault(p.split(".")[0], []).append(p)

    result = []
    for node, comps in byNode.items():
        skins = cmds.ls(cmds.listHistory(node, pdo=True) or [], type="skinCluster")
        if not skins:
            cmds.warning("{}: no skinCluster found".format(node))
            continue
        sc = skins[0]
        for comp in comps:
            infs = cmds.skinPercent(sc, comp, q=True, t=None)
            vals = cmds.skinPercent(sc, comp, q=True, v=True)
            used = [(i, w) for i, w in zip(infs, vals) if w > threshold]
            if verbose:
                print("{}  ({})".format(comp, sc))
                for i, w in sorted(used, key=lambda x: -x[1]):
                    print("    {:<40} {:.4f}".format(i, w))
            for i, _ in used:
                if i not in result:
                    result.append(i)

    if result:
        cmds.select(result, r=True)
    else:
        cmds.warning("No influences above the threshold")
    return result
