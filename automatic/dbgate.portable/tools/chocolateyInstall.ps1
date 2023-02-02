$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$archive = Join-Path $toolsDir 'dbgate-5.2.2-win_x64.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$executable = Get-ChildItem $toolsDir -include dbgate.exe -recurse

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
    if ($pp.User) {
      $desktopPath  = [Environment]::GetFolderPath('Desktop')
    } else {
      $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
    }

    $shortcutPath = Join-Path $desktopPath 'dbgate.lnk'

    Write-Verbose("Adding shortcut to $shortcutPath to desktop")
    Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

if ($pp.AddToStart) {
  if ($pp.User) {
    $startMenuPath = [Environment]::GetFolderPath('StartMenu')
  } else {
    $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  }

  $shortcutPath = Join-Path $startMenuPath 'dbgate.lnk'

  Write-Verbose("Adding shortcut to $shortcutPath to start menu")
  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

