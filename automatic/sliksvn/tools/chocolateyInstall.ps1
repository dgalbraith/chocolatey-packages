$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

$silentArgs = "/qn /norestart /l*v `"$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log`""

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  Write-Verbose("$env:ChocolateyPackageName will be installed to $($_.value)")
  $silentArgs += " INSTALLLOCATION=`"$($pp.InstallDir)`""
}

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = Join-Path $toolsDir 'Slik-Subversion-1.11.1-win32.msi'
  File64         = Join-Path $toolsDir 'Slik-Subversion-1.11.1-x64.msi'
  FileType       = 'msi'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

# cache the current system path prior to package install for a restore in the case where /NoPath is specified
$path = Get-EnvironmentVariable -name 'Path' -scope 'Machine' -PreserveVariables

Write-Host('SilentArgs: ' + $silentArgs)

Install-ChocolateyInstallPackage @packageArgs

if (!$pp.AddToStart) {
  # the installer adds the documentation folder automatically so remove unless it has been explicitly requested
  Write-Host('Removing documentation folder from the start menu')
  $subversionStart = Join-Path ([Environment]::GetFolderPath('CommonStartMenu')) 'Programs' | Join-Path -ChildPath 'Subversion'

  if (Test-Path $subversionStart) {
    Remove-Item -Path $subversionStart -Recurse -Force | Out-Null
  }
} 

if ($pp.NoPath) {
  # the installer adds the bin folder of the install to the path so remove it if the path inclusion is not desired
  # removal is achieved by setting the path to the version cached immediately prior to the package install
  Write-Verbose("Restoring cached path $path")
  Install-ChocolateyEnvironmentVariable -VariableName 'PATH' -VariableValue $path -VariableType Machine
}
