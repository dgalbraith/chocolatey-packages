$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$installer = Join-Path $toolsDir 'mongocli_1.24.0_windows_x86_64.msi'

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'msi'
  SilentArgs     = '/qn /norestart'
  ValidExitCodes = @(0, 3010, 1641)
}

# cache the current system path prior to package install - the isntaller adds
# the install location to the path but does not remove it on uninstall so we
# will restore the path to the initial value post install and use a shim instead
$path = Get-EnvironmentVariable -name 'Path' -scope 'User' -PreserveVariables

Install-ChocolateyInstallPackage @packageArgs

# restore the cached path
Install-ChocolateyEnvironmentVariable -VariableName 'PATH' -VariableValue $path -VariableType 'User'

$executable = Join-Path ([Environment]::GetFolderPath("ProgramFilesX86")) 'MongoDB CLI' | Join-Path -ChildPath 'mongocli.exe'

Install-Binfile -name 'mongocli' -path "$executable"
