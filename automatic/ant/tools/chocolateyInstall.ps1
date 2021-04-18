$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'apache-ant-1.10.9-bin.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$ant_home = $archive -split '-bin' | Select-Object -first 1
$ant_bat  = Join-Path $ant_home 'bin/ant.bat'

$pp = Get-PackageParameters

if ($pp.User) {
  $variableType = 'User'
} else {
  $variableType = 'Machine'
}

$environmentArgs = @{
    VariableName  = 'ANT_HOME'
    VariableValue = $ant_home
    VariableType  = $variableType
}

Install-ChocolateyEnvironmentVariable @environmentArgs

Install-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
