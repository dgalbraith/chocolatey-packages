$ErrorActionPreference = 'Stop'

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  Write-Error -Message "32-bit version of sqlilte-shell-x64 not availabe" -Category ResourceUnavailable
}

$toolsDir   = Split-Path -parent $MyInvocation.MyCommand.Definition
$executable = Join-Path $toolsDir 'sqlite3.exe'

Install-Binfile -name 'sqlean' -path "$executable"

$pp = Get-PackageParameters

$paths = New-Object System.Collections.ArrayList

if ($pp.count -gt 0) {
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
    $icon = Join-Path $toolsDir 'sqlite3.ico'

    $paths.GetEnumerator() | foreach-object {
      $shortcutPath = Join-Path $_ 'sqlite3.lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%userprofile%' -IconLocation $icon
    }
  }
}

