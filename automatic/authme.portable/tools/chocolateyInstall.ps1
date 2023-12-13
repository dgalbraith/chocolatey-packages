$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)
$archive  = Join-Path $toolsDir 'authme-4.2.1-windows-x64.zip'

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  $unzipDir = $pp.InstallDir
} else {
  $unzipDir = $toolsDir
}

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $unzipDir
}

Get-ChocolateyUnzip @unzipArgs

$executable = Get-ChildItem $unzipDir -include authme.exe -recurse

Install-Binfile -name 'Authme' -path "$executable"

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

  if ($paths.Count -gt 0) {
    $executable = Join-Path $unzipLocation 'Authme.exe'
    $icon       = Join-Path $toolsDir 'authme.ico'

    $paths.GetEnumerator() | foreach-object {
      $shortcutPath = Join-Path $_ 'Authme.lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%userprofile%' -IconLocation $icon
    }
  }
}
