$ErrorActionPreference = 'Stop';

$toolsDir    = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$desktopPath = [Environment]::GetFolderPath("Desktop")

$shortcutFilePath     = "$desktopPath\Prime95.lnk"
$targetPath           = "$toolsDir\prime95.exe"
$workingDirectoryPath = $toolsDir

function Close-Prime95 {
  Get-Process prime95 -ea 0 | ForEach-Object { $_.CloseMainWindow() | Out-Null }
  Start-Sleep 1
  Get-Process prime95 -ea 0 | Stop-Process  #in case graceful shutdown did not succeed, try hard kill
}

function Create-DesktopShortcut {
  $shortcutArgs = @{
    ShortcutFilePath     = $shortcutFilePath
    TargetPath           = $targetPath
    WorkingDirectoryPath = $workingDirectoryPath
  }

  Install-ChocolateyShortcut @shortcutArgs
}
function Remove-DesktopShortcut {
  if (Test-Path -Path $shortcutFilePath) {
    Remove-Item -Path $shortcutFilePath -Force | Out-Null
  }
}
