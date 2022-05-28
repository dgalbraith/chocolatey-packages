$ErrorActionPreference = 'Stop'

$toolsDir   = (Split-Path -parent $MyInvocation.MyCommand.Definition)
$installDir = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $fileName = 'Flashpoint-10.1.2_win-ia32.7z'
} else {
  $fileName = 'Flashpoint-10.1.2_win-x64.7z'
}

$archive = Join-Path $toolsDir $fileName

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $installDir
}

Get-ChocolateyUnzip @unzipArgs

$files = Get-ChildItem $installDir -include *.exe -recurse

foreach ($file in $files) {
  New-Item "$file.ignore" -type file -force | Out-Null
  if ($file.Name -eq 'Flashpoint.exe') {
    $executable = $file
  }
}

# generate a launcher command for the application binary.  The application is not well-behaved and
# will not run correctly if it is not launched with the working directory being the same as that
# containing the application binaries.  This secondary launcher is a way to support that while
# working around a chocolatey shimgen feature - a command line parameter --shimgen-use-targetworkingdirectory
# would be required on every launch without this work around as opposed to being able to simply
# launch via the shim flashpoint.exe

$applicationBinary = $executable.FullName
$workingDirectory  = $executable.FullName.TrimEnd($executable.Name)
$launchScript      = Join-Path $toolsDir "Flashpoint.cmd"
$launchCommand     = "@ECHO OFF$([Environment]::NewLine)cd `"$($workingDirectory)`"$([Environment]::NewLine)`"$($applicationBinary)`""

Set-Content -Path $launchScript -Value $launchCommand

Install-Binfile -Name 'Flashpoint' -Path $launchScript -UseStart

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
  $desktopPath  = [Environment]::GetFolderPath("Desktop")
  $shortcutPath = Join-Path $desktopPath 'Flashpoint Launcher.lnk'

  $shortcutArgs = @{
    ShortcutFilePath = $shortcutPath
    TargetPath       = $applicationBinary
    WorkingDirectory = $workingDirectory
  }

  Install-ChocolateyShortcut @shortcutArgs
}

$files = Get-ChildItem $toolsDir -include '*.7z'

foreach ($file in $files) {
  Remove-Item $file -Type file -Force -ErrorAction SilentlyContinue | Out-Null
}

