$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$unzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath64 = Join-Path $toolsDir 'nu-0.107.0-x86_64-pc-windows-msvc.zip'
  Destination    = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$pp = Get-PackageParameters

if ($pp.count -gt 0) {
  $paths = New-Object System.Collections.ArrayList

  $pp.GetEnumerator() | foreach-object {
    switch ($_.name) {
        'AddToDesktop' {
          Write-Verbose("Desktop shortcuts will be created for $env:ChocolateyPackageName")
          if ($pp.User) {
            $desktopPath = [Environment]::GetFolderPath('Desktop')
          } else {
            $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
          }

          $paths.Add($desktopPath) | Out-Null
        }
        'AddToStartMenu' {
          Write-Verbose("$env:ChocolateyPackageName will be added to the Start Menu")
          if ($pp.User) {
            $startMenuPath = [Environment]::GetFolderPath('StartMenu')
          } else {
            $startMenuPath = [Environment]::GetFolderPath('CommonStartMenu')
          }

          $paths.Add($startMenuPath) | Out-Null
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
    $executable = Get-ChildItem $toolsDir -Recurse -Filter 'nu.exe' | Select-Object -First 1 | ForEach-Object { $_.FullName }
    $icon       = Join-Path $toolsDir 'nushell.ico'

    $paths.GetEnumerator() | foreach-object {
      $shortcutPath = Join-Path $_ 'Nu Shell.lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%USERPROFILE%' -IconLocation $icon
    }
  }
}
