$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'nethack-366-win-x86-1_25_2021.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$pp = Get-PackageParameters

$paths = New-Object System.Collections.ArrayList

if ($pp.count -gt 0) {
  $pp.GetEnumerator() | foreach-object {
    switch ($_.name) {
        'AddToDesktop' {
          Write-Verbose("Desktop shortcuts will be created for $env:ChocolateyPackageName")
          if ($pp.User) {
            $desktopPath = [Environment]::GetFolderPath('Desktop')
          } else {
            $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
          }

          $paths.add($desktopPath) | Out-Null
        }
        'AddToStartMenu' {
          Write-Verbose("$env:ChocolateyPackageName will be added to the Start Menu")
          if ($pp.User) {
            $startMenuPath = [Environment]::GetFolderPath('StartMenu')
          } else {
            $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
          }

          $startMenuFolder = Join-Path $startMenuPath 'NetHack'
          if (-Not (Test-Path -PathType Container $startMenuFolder)) {
            New-Item -Path $startMenuFolder -ItemType directory -Force | Out-Null
          }
          
          $paths.Add($startMenuFolder) | Out-Null
        }
        'User' {
          # ignore - no need to handle independently as it is a qualifier for other options
        }
        Default {
          Write-Verbose("Unknown parameter $_.name will be ignored")
        }
    }
  }

  if ($paths.Count -gt 0) {
    $executable        = Join-Path $toolsDir 'NetHack.exe'
    $classicExecutable = Join-Path $toolsDir 'NetHackW.exe'
    $icon              = Join-Path $toolsDir 'nethack.ico'
    
    $paths.GetEnumerator() | foreach-object {
      $shortcutPath = Join-Path $_ 'Nethack.lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -IconLocation $icon

      $shortcutPath = Join-Path $_ 'Nethack (Classic).lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $classicExecutable -IconLocation $icon
    }
  }
}
