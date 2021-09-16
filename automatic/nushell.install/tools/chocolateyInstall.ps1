$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  SoftwareName   = 'Nu'
  File64         = Join-Path $toolsDir 'nu_0_37_0_windows.msi'
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  ValidExitCodes = @(0, 3010, 1641)
}

# cache the path prior to package install so we can restore it - the installer
# adds the bin directory form the install to the path but we will be using shims
# so this is not needed
$path = Get-EnvironmentVariable -name 'Path' -scope 'Machine' -PreserveVariables

Install-ChocolateyInstallPackage @packageArgs

# restore the cached path
Install-ChocolateyEnvironmentVariable -VariableName 'Path' -VariableValue $path -VariableType Machine

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName 'Nu'
$installLocation = $uninstallKey.InstallLocation

Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
  Install-BinFile -Name $_.Name -Path $_.FullName
}

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

          $paths.add($desktopPath) | Out-Null
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
    $executable = Join-Path $installLocation 'bin' | Join-Path -ChildPath 'nu.exe'
    $icon       = Join-Path $toolsDir 'nushell.ico'

    $paths.GetEnumerator() | foreach-object {
      $shortcutPath = Join-Path $_ 'Nu Shell.lnk'
      Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%userprofile%' -IconLocation $icon
    }
  }
}
