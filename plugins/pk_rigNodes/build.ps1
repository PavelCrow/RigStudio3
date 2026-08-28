<#
    Builds pk_rigNodes.mll for one Maya version.

        .\build.ps1                 # Maya 2022 (default)
        .\build.ps1 -MayaVersion 2025

    Only the VS2022 toolset (v143) is installed here, and it is used for every
    Maya version - the MSVC 2015-2022 runtimes are binary compatible, so such a
    .mll loads in Maya 2022 too. Pass -Toolset v142 if the VS2019 build tools
    ever get installed and a strictly official build is wanted.

    The result goes to plugins\plug-ins\<MayaVersion>\pk_rigNodes.mll
#>
param(
    [string]$MayaVersion = "2022",
    [string]$Config = "Release",
    [string]$Toolset = "v143",
    [string]$OutputDir = ""
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

$cmake = "C:\Program Files\Microsoft Visual Studio\2022\Community\Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
if (-not (Test-Path $cmake)) {
    $found = Get-Command cmake -ErrorAction SilentlyContinue
    if ($null -eq $found) { throw "cmake not found" }
    $cmake = $found.Source
}

$buildDir = Join-Path $root "build\$MayaVersion"

$cmakeArgs = @("-B", $buildDir, "-S", $root, "-G", "Visual Studio 17 2022", "-T", $Toolset, "-A", "x64", "-DMAYA_VERSION=$MayaVersion")
# всегда задаём путь явно: иначе значение остаётся в кэше CMake от прошлой
# сборки и .mll молча уезжает не туда
if ($OutputDir -eq "") { $OutputDir = Join-Path $root "..\plug-ins\$MayaVersion" }
$cmakeArgs += "-DPK_OUTPUT_DIR=$OutputDir"

& $cmake @cmakeArgs
if ($LASTEXITCODE -ne 0) { throw "configure failed" }

& $cmake --build $buildDir --config $Config
if ($LASTEXITCODE -ne 0) {
    # LNK1104 on the .mll almost always means Maya still has the plugin loaded
    Write-Host "`nIf the linker could not write the .mll, unload it in Maya first:" -ForegroundColor Yellow
    Write-Host '    cmds.unloadPlugin("pk_rigNodes.mll")' -ForegroundColor Yellow
    Write-Host "or build elsewhere: .uild.ps1 -OutputDir C:\some\dir" -ForegroundColor Yellow
    throw "build failed"
}

Write-Host "`nBuilt: $OutputDir\pk_rigNodes.mll"
