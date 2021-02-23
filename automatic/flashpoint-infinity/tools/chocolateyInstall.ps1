$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  PackageName   = $env:ChocolateyPackageName
  UnzipLocation = $toolsDir
  Url           = 'https://bluemaxima.org/flashpoint/Flashpoint%208.2%20Infinity.exe'
  Checksum      = 'bee2d7eece684e95e78911109efabdda40c2f4cd5ed7ca5f99b95fcf6d780918'
  ChecksumType  = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

$files = Get-ChildItem $toolsDir -include *.exe -recurse

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

# ensure that the contents are not read-only to avoid issues on package uninstall.  When the package
# was constructed this was the case with FPSoftware\BrowserPlugins\Vitalize\Clickteam\Vitalize\v2
# and Chocolatey seems to have an issue with the uninstall of a package containing a directory
# where the ReadOnly attribute is set

Get-ChildItem $toolsDir -Recurse -Force -ErrorAction SilentlyContinue | Where-Object {
  $_.PSIsContainer -and $_.Attributes -match "ReadOnly" } | foreach-object { $_.Attributes="" }

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
  $desktopPath  = [Environment]::GetFolderPath("Desktop")
  $shortcutPath = Join-Path $desktopPath $applicationBinary.ReplaceEnd($executable.Extension, '.lnk')

  $shortcutArgs = @{
    ShortcutFilePath = $shortcutPath
    TargetPath       = $applictionBinary
    WorkingDirectory = $workingDirectory
  }

  Install-ChocolateyShortcut @shortcutArgs
}
