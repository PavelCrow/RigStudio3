<#
    Builds the plugins of rigStudio3 for one Maya version.

        .\build.ps1                 # Maya 2022 (default)
        .\build.ps1 -MayaVersion 2025

    Visual Studio 2026 or 2022 is used, whichever is installed (2026 first).
    The toolset is v143 (the VS2022 one; VS2026 installs it as a component) for
    every Maya version - the MSVC 2015-2022 runtimes are binary compatible, so
    such a .mll loads in Maya 2022 too. Pass -Toolset v142 if the VS2019 build
    tools ever get installed and a strictly official build is wanted.

    The results go to plugins\plug-ins\<MayaVersion>\ - pk_rigNodes.mll
    (pk_ibtw, pk_twist), pk_wings.mll (pk_wing) and pk_dynamics.mll
    (pk_chainDynamics).
#>
param(
    [string]$MayaVersion = "2022",
    [string]$Config = "Release",
    [string]$Toolset = "v143",
    [string]$OutputDir = "",
    [string]$Target = ""
)

$ErrorActionPreference = "Stop"
$root = $PSScriptRoot

# Visual Studio и генератор CMake к нему: сначала 2026 (папка 18), потом 2022
$vsCmake = "Common7\IDE\CommonExtensions\Microsoft\CMake\CMake\bin\cmake.exe"
$studios = @(
    @{ Dir = "C:\Program Files\Microsoft Visual Studio\18\Community"; Generator = "Visual Studio 18 2026" },
    @{ Dir = "C:\Program Files\Microsoft Visual Studio\2022\Community"; Generator = "Visual Studio 17 2022" }
)
$cmake = $null
$generator = $null
foreach ($vs in $studios) {
    $candidate = Join-Path $vs.Dir $vsCmake
    if (Test-Path $candidate) {
        $cmake = $candidate
        $generator = $vs.Generator
        break
    }
}
if ($null -eq $cmake) { throw "Visual Studio 2026/2022 Community with C++ CMake tools not found" }

$buildDir = Join-Path $root "build\$MayaVersion"

# кэш, собранный другой студией, CMake не перенастраивает, а падает на смене
# генератора - такой кэш сбрасываем, исходники он не трогает
$cache = Join-Path $buildDir "CMakeCache.txt"
if (Test-Path $cache) {
    $line = Select-String -Path $cache -Pattern "^CMAKE_GENERATOR:INTERNAL=(.*)$" | Select-Object -First 1
    if ($line -and $line.Matches[0].Groups[1].Value -ne $generator) {
        Write-Host "Build cache was made by '$($line.Matches[0].Groups[1].Value)', resetting it for '$generator'"
        Remove-Item $cache
        Remove-Item (Join-Path $buildDir "CMakeFiles") -Recurse -Force -ErrorAction SilentlyContinue
    }
}

$cmakeArgs = @("-B", $buildDir, "-S", $root, "-G", $generator, "-T", $Toolset, "-A", "x64", "-DMAYA_VERSION=$MayaVersion")
# всегда задаём путь явно: иначе значение остаётся в кэше CMake от прошлой
# сборки и .mll молча уезжает не туда
if ($OutputDir -eq "") { $OutputDir = Join-Path $root "..\plug-ins\$MayaVersion" }
$cmakeArgs += "-DPK_OUTPUT_DIR=$OutputDir"

& $cmake @cmakeArgs
if ($LASTEXITCODE -ne 0) { throw "configure failed" }

$buildArgs = @("--build", $buildDir, "--config", $Config)
if ($Target -ne "") { $buildArgs += @("--target", $Target) }
& $cmake @buildArgs
if ($LASTEXITCODE -ne 0) {
    # LNK1104 on the .mll almost always means Maya still has the plugin loaded
    Write-Host "`nIf the linker could not write the .mll, unload it in Maya first:" -ForegroundColor Yellow
    Write-Host '    cmds.unloadPlugin("pk_rigNodes.mll"); cmds.unloadPlugin("pk_wings.mll"); cmds.unloadPlugin("pk_dynamics.mll")' -ForegroundColor Yellow
    Write-Host "or build elsewhere: .\build.ps1 -OutputDir C:\some\dir" -ForegroundColor Yellow
    throw "build failed"
}

$built = @("pk_wings", "pk_rigNodes", "pk_dynamics")
if ($Target -ne "") { $built = @($Target) }
Write-Host ""
foreach ($b in $built) { Write-Host "Built: $OutputDir\$b.mll" }
