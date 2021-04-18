$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$ant_home = Join-Path $toolsDir 'apache-ant-1.10.9'
$ant_bat  = Join-Path $ant_home 'bin/ant.bat'

# we don't have access to the install parameters so we need to adopt a coarse approach to remove the ANT_HOME variable
# if it is present as we are not able to determine if the install was done at a machine or user level.  Given the lack
# of information we will always remove at a user level but only action at the machine level if the process is running
# with admin priviledges
$userHome = Get-EnvironmentVariable -name 'ANT_HOME' -Scope 'User'

if ($null -ne $userHome -and $userHome -ne '') {
  Uninstall-ChocolateyEnvironmentVariable -VariableName 'ANT_HOME' -VariableType 'User'
}

if (Test-ProcessAdminRights) {
  $machineHome = Get-EnvironmentVariable -name 'ANT_HOME' -Scope 'Machine'

  if ($null -ne $machineHome -and $machineHome -ne '') {
    Uninstall-ChocolateyEnvironmentVariable -VariableName 'ANT_HOME' -VariableType 'Machine'
  }
}

Uninstall-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
