$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$installer = Join-Path $toolsDir 'mcwin32-build209-setup.exe'

$silentArgs= '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$pp = Get-PackageParameters

#if ($pp.Count > 0) {
  $parameters = @()

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

  $silentArgs += " /TASKS=`"{0}`"" -f ($parameters -join ",")
  Write-Verbose("Constructed silent args $silentArgs")
#}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0)
}

Install-ChocolateyInstallPackage @packageArgs
