$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$silentArgs= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$pp = Get-PackageParameters

$parameters = @()

if ($pp.Count -gt 0) {
  $pp.GetEnumerator() | ForEach-Object {
    switch ($_.name) {
        'desktopicon' {
            Write-Verbose("A shortcut on the desktop will be created for $env:ChocolateyPackageName")
            $parameters += $_
        }
        'modifypath' {
            #$silentArgs += " /$($_.name)=`"$($_.value)`""
            Write-Verbose("Path will be modified to include $env:ChocolateyPackageName install location")
            $parameters += $_
        }
        Default {
            Write-Warning("Unknown parameter $_ will be ignored")
        }
    }
  }
}

$silentArgs += " /TASKS=`"{0}`"" -f ($parameters -join ",")
Write-Verbose("Constructed silent args $silentArgs")

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File32         = Join-Path $toolsDir 'mcwin32-build232-setup.exe'
  File64         = Join-Path $toolsDir 'mcwin32-build232-x64-setup.exe'
  FileType       = 'exe'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
