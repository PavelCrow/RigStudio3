#include "pkTypeIds.h"
#include "pkIbtwNode.h"
#include "pkTwistNode.h"

#include <maya/MFnPlugin.h>

#define PK_EXPORT __declspec(dllexport)

PK_EXPORT MStatus initializePlugin(MObject obj)
{
    MFnPlugin plugin(obj, "Pavel Korolev", "0.1", "Any");

    MStatus status = plugin.registerNode("pk_ibtw", pk::kIbtwNodeId,
                                         PkIbtwNode::creator, PkIbtwNode::initialize);
    if (!status)
    {
        status.perror("registerNode pk_ibtw");
        return status;
    }

    status = plugin.registerNode("pk_twist", pk::kTwistNodeId,
                                 PkTwistNode::creator, PkTwistNode::initialize);
    if (!status)
    {
        status.perror("registerNode pk_twist");
        return status;
    }

    return MS::kSuccess;
}

PK_EXPORT MStatus uninitializePlugin(MObject obj)
{
    MFnPlugin plugin(obj);

    MStatus status = plugin.deregisterNode(pk::kIbtwNodeId);
    if (!status)
    {
        status.perror("deregisterNode pk_ibtw");
        return status;
    }

    status = plugin.deregisterNode(pk::kTwistNodeId);
    if (!status)
    {
        status.perror("deregisterNode pk_twist");
        return status;
    }

    return MS::kSuccess;
}
