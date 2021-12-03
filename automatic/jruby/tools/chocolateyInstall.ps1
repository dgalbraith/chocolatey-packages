$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$defaultDir = 'jruby' + ($Env:ChocolateyPackageVersion -replace '\.').Substring(0,2)

$pp = Get-PackageParameters

if ($pp['InstallDir']) {
  $installDir = $pp['InstallDir']
} else {
  $installDir = Join-Path (Get-ToolsLocation) $defaultDir
}

# the default for the installer is to add to the path so we only need to update parameters for removal
if ($pp['NoPath']) {
  $pathArgs = '-Vconfigure.path$Boolean=false'
}

$silentArgs = '-q -overwrite -dir {0} {1}' -f $installDir, $pathArgs

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = Join-Path $toolsDir 'jruby_windows_9_3_2_0.exe'
  File64         = Join-Path $toolsDir 'jruby_windows_x64_9_3_2_0.exe'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs

if ($pp['AddToDesktop']) {
  $desktopPath = [Environment]::GetFolderPath("Desktop")

  $shortcutArgs = @{
    ShortcutFilePath = "$desktopPath\JRuby IRB Console.lnk"
    TargetPath = "$installDir\irb.exe"
  }

  Install-ChocolateyShortcut @shortcutArgs
}

Remove-Item $toolsDir\*.exe -Force -ErrorAction Ignore | Out-Null
