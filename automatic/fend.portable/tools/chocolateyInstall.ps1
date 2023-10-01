$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'fend-1.2.2-windows-x64-exe.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$executable = Get-ChildItem $toolsDir -include fend.exe -recurse

Install-Binfile -Name 'fend' -Path $executable

$pp = Get-PackageParameters

if ($pp.AddToDesktop) {
    if ($pp.User) {
      $desktopPath  = [Environment]::GetFolderPath('Desktop')
    } else {
      $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
    }

    $shortcutPath = Join-Path $desktopPath 'fend.lnk'

    Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

if ($pp.AddToStart) {
  if ($pp.User) {
    $startMenuPath = [Environment]::GetFolderPath('StartMenu')
  } else {
    $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
  }

  $shortcutPath = Join-Path $startMenuPath 'fend.lnk'

  Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable
}

