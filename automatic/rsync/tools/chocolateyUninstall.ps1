$ErrorActionPreference = 'Stop'

# we don't have access to the install parameters so we need to adopt a coarse approach to remove the CWRSYNC_HOME variable
# if it is present as we are not able to determine if the install was done at a machine or user level.  Given the lack
# of information we will always remove at a user level but only action at the machine level if the process is running
# with admin priviledges
$userHome = Get-EnvironmentVariable -name 'CWRSYNC_HOME' -Scope 'User'

if ($null -ne $userHome -and $userHome -ne '') {
  Uninstall-ChocolateyEnvironmentVariable -VariableName 'CWRSYNC_HOME' -VariableType 'User'
}

if (Test-ProcessAdminRights) {
  $machineHome = Get-EnvironmentVariable -name 'CWRSYNC_HOME' -Scope 'Machine'

  if ($null -ne $machineHome -and $machineHome -ne '') {
    Uninstall-ChocolateyEnvironmentVariable -VariableName 'CWRSYNC_HOME' -VariableType 'Machine'
  }
}

# the -Path argument is mandatory but unused on removal so does not need to be resolved to the correct value
Uninstall-BinFile -Name 'rsync' -Path 'rsync.bat'

Update-SessionEnvironment
