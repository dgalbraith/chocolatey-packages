$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

$ant_home = Join-Path $toolsDir 'apache-ant-1.10.9'
$ant_bat  = Join-Path $ant_home 'bin/ant.bat'

$environmentArgs = @{
    VariableName  = 'ANT_HOME'
    VariableValue = $null
    VariableType  = 'Machine'
}

Install-ChocolateyEnvironmentVariable @environmentArgs

Uninstall-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
