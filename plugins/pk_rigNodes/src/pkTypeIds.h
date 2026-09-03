#pragma once
#include <maya/MTypeId.h>

// Autodesk reserves 0x00000000 - 0x0007ffff for in-house / testing plugins.
// Keep every node of this plugin listed here so the ids stay unique.
namespace pk {
    const MTypeId kWingNodeId(0x00073001);
    const MTypeId kIbtwNodeId(0x00073002);
}
