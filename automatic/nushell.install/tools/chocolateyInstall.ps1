$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$silentArgs = '/qn /norestart'
$pathScope  = 'Machine'

$pp = Get-PackageParameters

# install for all users (default), or the current user only if explicitly requested
if ($pp.User) {
  $silentArgs = 'ALLUSERS=2 MSIINSTALLPERUSER=1 ' + $silentArgs
  $pathScope = 'User'
} else {
  # match the application folder to the hard-coded install location - regardless of
  # what is specified the installer will always record [Environment]::GetFolderPath('ProgramFiles')\nu
  # as the install location
  $programFiles = [Environment]::GetFolderPath('ProgramFiles')
  $silentArgs = "ALLUSERS=1 MSIINSTALLPERUSER=0 APPLICATIONFOLDER=`"$programFiles\nu`" $silentArgs"
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  SoftwareName   = 'Nushell'
  File64         = Join-Path $toolsDir 'nu-0.117.0-x86_64-pc-windows-msvc.msi'
  FileType       = 'msi'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

# the installer adds the bin directory to the path - no shims are created as a shim
# terminates nu on Ctrl+C rather than letting it handle the signal
Install-ChocolateyInstallPackage @packageArgs

$uninstallKey = Get-UninstallRegistryKey -SoftwareName 'Nushell' -ErrorAction SilentlyContinue

if ($uninstallKey) {
  $installLocation = $uninstallKey.InstallLocation

  if (($installLocation) -and ($installLocation -ne '') -and (Test-Path $installLocation)) {
    # interim backstop - the installer does not add the bin directory to the path when run over an existing
    # install of the same version, as when upgrading from 0.117.0 (which removed the path entry in favour of
    # shims) to 0.117.0.20261114 - so ensure it is present.  Can be removed once past that release
    Install-ChocolateyPath -PathToInstall (Join-Path $installLocation 'bin') -PathType $pathScope

    if ($pp.count -gt 0) {
      $paths = New-Object System.Collections.ArrayList

      $pp.GetEnumerator() | foreach-object {
        switch ($_.name) {
          'AddToDesktop' {
            Write-Verbose("Desktop shortcuts will be created for $env:ChocolateyPackageName")
            if ($pp.User) {
              $desktopPath = [Environment]::GetFolderPath('Desktop')
            }
            else {
              $desktopPath = [Environment]::GetFolderPath('CommonDesktopDirectory')
            }

            $paths.Add($desktopPath) | Out-Null
          }
          'AddToStartMenu' {
            Write-Verbose("$env:ChocolateyPackageName will be added to the Start Menu")
            if ($pp.User) {
              $startMenuPath = [Environment]::GetFolderPath('StartMenu')
            }
            else {
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
        $icon = Join-Path $toolsDir 'nushell.ico'

        $paths.GetEnumerator() | foreach-object {
          $shortcutPath = Join-Path $_ 'Nu Shell.lnk'
          Install-ChocolateyShortcut -ShortcutFilePath $shortcutPath -TargetPath $executable -WorkingDirectory '%USERPROFILE%' -IconLocation $icon
        }
      }
    }
  }
} else {
  throw 'Unable to find the Nushell uninstall key. The package may not have been installed correctly.'
}
