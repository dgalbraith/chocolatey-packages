$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'mame0279b_64bit.exe'

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  $installDir = $pp.InstallDir
} else {
  $installDir  = Join-Path (Get-ToolsLocation) $env:ChocolateyPackageName
}

$unzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath64 = $archive
  Destination    = $installDir
}

Get-ChocolateyUnzip @unzipArgs

if ($pp.count -gt 0) {
  $paths = New-Object System.Collections.ArrayList

  $pp.GetEnumerator() | foreach-object {
    switch ($_.name) {
        'AddToDesktop' {
          if ($pp.User) {
            $desktopPath = [Environment]::GetFolderPath('Desktop')
          } else {
            $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
          }

          $paths.add($desktopPath) | Out-Null
        }
        'AddToStart' {
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

  $executable = Get-ChildItem $installDir -include mame.exe -recurse

  if ($paths.Count -gt 0) {
    $paths.GetEnumerator() | foreach-object {
      $shortcutPath = Join-Path $_ 'MAME.lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory $unzipDir
    }
  }
}

Get-ChildItem $toolsDir -recurse -include '*.exe' | foreach-object {
  New-Item "$_.Name.ignore" -type file -force | Out-Null
}

Get-ChildItem $installDir -recurse -include '*.exe' | foreach-object {
  Install-BinFile -Name ($_.Name -Replace '\..*') -Path $_.FullName
}
