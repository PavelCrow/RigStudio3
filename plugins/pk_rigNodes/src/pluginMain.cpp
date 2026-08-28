#include "pkTypeIds.h"
#include "pkWingNode.h"

#include <maya/MFnPlugin.h>

#define PK_EXPORT __declspec(dllexport)

PK_EXPORT MStatus initializePlugin(MObject obj)
{
    MFnPlugin plugin(obj, "Pavel Korolev", "0.1", "Any");

    MStatus status = plugin.registerNode("pk_wing", pk::kWingNodeId,
                                         PkWingNode::creator, PkWingNode::initialize);
    if (!status)
    {
        status.perror("registerNode pk_wing");
        return status;
    }

    return MS::kSuccess;
}

PK_EXPORT MStatus uninitializePlugin(MObject obj)
{
    MFnPlugin plugin(obj);

    MStatus status = plugin.deregisterNode(pk::kWingNodeId);
    if (!status)
    {
        status.perror("deregisterNode pk_wing");
        return status;
    }

    return MS::kSuccess;
}
