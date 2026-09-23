#include "pkTypeIds.h"
#include "pkChainDynNode.h"

#include <maya/MFnPlugin.h>
#include <maya/MGlobal.h>

#define PK_EXPORT __declspec(dllexport)

namespace
{
    // The Attribute Editor finds a template by the name of its proc, so
    // defining it here is enough - no .mel file has to be on the script path.
    // Without it the ramp shows up as a bare list of its entries.
    const char* kAETemplate = R"MEL(
global proc AEpk_chainDynamicsTemplate(string $nodeName)
{
    editorTemplate -beginScrollLayout;

    editorTemplate -beginLayout "Dynamics" -collapse 0;
        editorTemplate -addControl "enable";
        editorTemplate -addControl "weight";
        editorTemplate -addControl "startFrame";
        AEaddRampControl ($nodeName + ".weightRamp");
    editorTemplate -endLayout;

    editorTemplate -beginLayout "Stiffness" -collapse 0;
        editorTemplate -addControl "stiffness";
        AEaddRampControl ($nodeName + ".stiffnessRamp");
    editorTemplate -endLayout;

    editorTemplate -beginLayout "Motion" -collapse 0;
        editorTemplate -addControl "damping";
        editorTemplate -addControl "dampingEven";
        editorTemplate -addControl "gravity";
        editorTemplate -addControl "gravityDirection";

        editorTemplate -beginLayout "Local space" -collapse 1;
            editorTemplate -addControl "localTranslate";
            editorTemplate -addControl "localRotate";
        editorTemplate -endLayout;
    editorTemplate -endLayout;

    editorTemplate -beginLayout "Stretch" -collapse 0;
        editorTemplate -addControl "stretch";
        editorTemplate -addControl "stretchDamping";

        editorTemplate -beginLayout "By hand" -collapse 1;
            editorTemplate -addControl "stretchLimit";
            editorTemplate -addControl "stretchSpeed";
            editorTemplate -addControl "stretchRelease";
        editorTemplate -endLayout;
    editorTemplate -endLayout;

    editorTemplate -beginLayout "Solver" -collapse 0;
        editorTemplate -addControl "maxBend";
        editorTemplate -addControl "bendSoftness";
        editorTemplate -addControl "outputCount";
        editorTemplate -addControl "aimAxis";

        editorTemplate -addControl "substeps";
    editorTemplate -endLayout;

    editorTemplate -suppress "time";
    editorTemplate -suppress "spaceMatrix";
    editorTemplate -suppress "goalMatrix";
    editorTemplate -suppress "outMatrix";

    AEdependNodeTemplate $nodeName;
    editorTemplate -addExtraControls;
    editorTemplate -endScrollLayout;
}
)MEL";
}

PK_EXPORT MStatus initializePlugin(MObject obj)
{
    MFnPlugin plugin(obj, "Pavel Korolev", "0.1", "Any");

    MStatus status = plugin.registerNode("pk_chainDynamics", pk::kChainDynNodeId,
                                         PkChainDynNode::creator, PkChainDynNode::initialize);
    if (!status)
    {
        status.perror("registerNode pk_chainDynamics");
        return status;
    }

    // no UI in batch - there is nothing to show a template in
    if (MGlobal::mayaState() == MGlobal::kInteractive)
        MGlobal::executeCommand(kAETemplate);

    return MS::kSuccess;
}

PK_EXPORT MStatus uninitializePlugin(MObject obj)
{
    MFnPlugin plugin(obj);

    MStatus status = plugin.deregisterNode(pk::kChainDynNodeId);
    if (!status)
    {
        status.perror("deregisterNode pk_chainDynamics");
        return status;
    }

    return MS::kSuccess;
}
