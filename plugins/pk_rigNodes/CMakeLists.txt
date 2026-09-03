# pk_rigNodes - Maya plugin nodes for rigStudio3
#
# Two plugins are built from this project:
#   pk_rigNodes.mll    - pk_wing, the replacement for the bifrost graphs
#   pk_correctives.mll - pk_ibtw, the solver of the local inbetweens
# They are kept apart on purpose: a rig that only needs correctives should not
# have to load the wing node, which is still work in progress.
#
# Build (see build.ps1):
#   cmake -B build/2026 -G "Visual Studio 17 2022" -T v143 -A x64 -DMAYA_VERSION=2026
#   cmake --build build/2026 --config Release
#
# The .mll files go to plugins/plug-ins/<MAYA_VERSION>/ - nothing is written
# outside the plugins folder, the working scripts of the autorig stay untouched.

cmake_minimum_required(VERSION 3.20)
project(pk_rigNodes CXX)

set(MAYA_VERSION 2022 CACHE STRING "Maya version to build against")
set(MAYA_LOCATION "C:/Program Files/Autodesk/Maya${MAYA_VERSION}" CACHE PATH "Maya install dir")

if(NOT EXISTS "${MAYA_LOCATION}/include/maya/MPxNode.h")
    message(FATAL_ERROR "Maya headers not found in ${MAYA_LOCATION}/include/maya")
endif()

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Maya locks the .mll while the plugin is loaded, so the output dir can be
# redirected (-DPK_OUTPUT_DIR=...) to build without unloading it first.
set(PK_OUTPUT_DIR "${CMAKE_SOURCE_DIR}/../plug-ins/${MAYA_VERSION}" CACHE PATH "Where to put the .mll")

add_library(pk_rigNodes SHARED
    src/pluginMain.cpp
    src/pkWingNode.cpp
    src/pkMath.cpp
)

add_library(pk_correctives SHARED
    src/pkCorrectivesMain.cpp
    src/pkIbtwNode.cpp
)

foreach(pk_target pk_rigNodes pk_correctives)
    target_include_directories(${pk_target} PRIVATE "${MAYA_LOCATION}/include")
    target_link_directories(${pk_target} PRIVATE "${MAYA_LOCATION}/lib")
    target_link_libraries(${pk_target} PRIVATE Foundation OpenMaya OpenMayaAnim)
    target_compile_definitions(${pk_target} PRIVATE NT_PLUGIN REQUIRE_IOSTREAM _BOOL)

    # The VS2022 toolset emits the new exception handler (__CxxFrameHandler4 from
    # VCRUNTIME140_1.dll), which Maya does not ship. /d2FH4- goes back to the old
    # handler, so the .mll needs nothing but the runtime Maya already has.
    if(MSVC)
        target_compile_options(${pk_target} PRIVATE /d2FH4-)
    endif()

    set_target_properties(${pk_target} PROPERTIES
        PREFIX ""
        SUFFIX ".mll"
        RUNTIME_OUTPUT_DIRECTORY         "${PK_OUTPUT_DIR}"
        RUNTIME_OUTPUT_DIRECTORY_RELEASE "${PK_OUTPUT_DIR}"
        RUNTIME_OUTPUT_DIRECTORY_DEBUG   "${PK_OUTPUT_DIR}"
    )
endforeach()
