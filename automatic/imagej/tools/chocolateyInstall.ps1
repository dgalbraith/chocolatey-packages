$ErrorActionPreference = 'Stop'

$toolsDir   = (Split-Path -parent $MyInvocation.MyCommand.Definition)
$archive    = Join-Path $toolsDir 'ij152-win-java8.zip'
$installDir = Get-ToolsLocation

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = $archive
  Destination    = $installDir
}

Get-ChocolateyUnzip @packageArgs

$executable = Get-ChildItem $installDir -include ImageJ.exe -recurse

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
  if ($pp.User) {
    $desktopPath = [Environment]::GetFolderPath('Desktop')
  } else {
    $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
  }

  $shortcutPath = Join-Path $desktopPath 'imagej.lnk'

  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable

  Write-Host("Added {0} desktop shortcut pointed at {1}" -f $shortcutPath, $executable)
}

if ($pp.AddToStartMenu) {
  if ($pp.User) {
    $startMenuPath = [Environment]::GetFolderPath('StartMenu')
  } else {
    $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  }

  $shortcutPath = Join-Path $startMenuPath 'imagej.lnk'

  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable

  Write-Host("Added {0} start menu entry pointed at {1}" -f $shortcutPath, $executable)
}

Install-Binfile -Name 'imagej' -Path $executable -UseStart
