$ErrorActionPreference = 'Stop'

$toolsDir   = $(Split-Path -parent $MyInvocation.MyCommand.Definition)
$packageDir = $($toolsDir | Split-Path -parent)

$silentArgs = "/qn /norestart /l*v `"$($env:TEMP)\$($env:ChocolateyPackageName).$($env:ChocolateyPackageVersion).MsiInstall.log`" INSTALLLEVEL=300"

$pp = Get-PackageParameters

if ($pp.InstallDir) {
  Write-Verbose("$env:ChocolateyPackageName will be installed to $($_.value)")
  $silentArgs += " INSTALLLOCATION=`"$($pp.InstallDir)`""
}

$unzipArgs = @{
  PackageName    = $env:ChocolateyPackageName
  FileFullPath   = Join-Path $toolsDir 'Slik-Subversion-1.14.1-win32.zip'
  FileFullPath64 = Join-Path $toolsDir 'Slik-Subversion-1.14.1-x64.zip'
  Destination    = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = Join-Path $toolsDir 'Slik-Subversion-1.14.1-win32.msi'
  File64         = Join-Path $toolsDir 'Slik-Subversion-1.14.1-x64.msi'
  FileType       = 'msi'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

# cache the current system path prior to package install for a restore in the case where /NoPath is specified
$path = Get-EnvironmentVariable -name 'Path' -scope 'Machine' -PreserveVariables

Install-ChocolateyInstallPackage @packageArgs

if (-Not $pp.AddToStart) {
  # the installer adds the documentation folder automatically so remove unless it has been explicitly requested
  Write-Verbose('Removing documentation folder from the start menu')
  $subversionStart = Join-Path ([Environment]::GetFolderPath('CommonStartMenu')) 'Programs' | Join-Path -ChildPath 'Subversion'

  if (Test-Path $subversionStart) {
    Remove-Item -Path $subversionStart -Recurse -Force | Out-Null
  }
}

if (-Not $pp.AddToPath) {
  # the installer adds the bin folder of the install to the path so remove it if the path inclusion is not desired
  # removal is achieved by setting the path to the version cached immediately prior to the package install
  Write-Verbose("Restoring cached path $path")
  Install-ChocolateyEnvironmentVariable -VariableName 'PATH' -VariableValue $path -VariableType Machine

  # the bin folder has not been added to the path so generate shims instead
  if ($pp.InstallDir) {
    $installLocation = $pp.InstallDir
  } else {
    if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
      $installLocation = [Environment]::GetFolderPath('ProgramFilesX86') + [IO.Path]::DirectorySeparatorChar + 'SlikSvn'
    } else {
      $installLocation = [Environment]::GetFolderPath('ProgramFiles') + [IO.Path]::DirectorySeparatorChar + 'SlikSvn'
    }
  }

  Get-ChildItem $installLocation -recurse -include '*.exe' | foreach-object {
    Install-BinFile -Name ($_.Name -Replace '\..*') -Path $_.FullName
  }
}

# update the registry key to set the InstallLocation - the installer leaves this blank
$installKey   = Get-InstallRegistryKey -SoftwareName 'Slik Subversion*'
$registryPath = $installKey.PSPath

if (Test-Path $RegistryPath) {
  New-ItemProperty -Path $RegistryPath -Name 'InstallLocation' -Value $installLocation -PropertyType String -Force | Out-Null
}

# locate the zip content file for the installed version in the package folder
$zipContentFile = Get-ChildItem -Path "$packageDir\*" -Filter '*.zip.txt' | Select-Object -ExpandProperty FullName

if ((Test-Path -path $zipContentFile)) {
  # extract the name of original .zip file that the contents was unpacked from and use the Chocolatey helper to remove the contents
  $zipPackage = $zipContentFile -Match '(?<ZipContentFile>^(?<Path>(?<Drive>[a-zA-Z]:)(?:\\[^:]+)?)\\(?<FileName>[^\\\n]+?)(?<Extension>\.[^.]*$|$))' | Foreach-Object { $Matches.FileName }
  Uninstall-ChocolateyZipPackage $env:ChocolateyPackageName $zipPackage
}

# remove the additional files added through the installation process
foreach ($file in Get-ChildItem -Path "$packageDir\*" -Include @('*.zip.txt','*.ignore') -Recurse | Select-Object -ExpandProperty FullName) {
  Remove-Item $file -ErrorAction SilentlyContinue -Force
}
