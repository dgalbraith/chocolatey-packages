$ErrorActionPreference = 'Stop'

$tools = Split-Path $MyInvocation.MyCommand.Definition

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition
$archive  = Join-Path $toolsDir 'apache-ant-1.10.6-bin.zip'

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = $archive
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

$ant_home = $archive -split '-bin' | select -first 1
$ant_bat  = Join-Path $ant_home 'bin/ant.bat'

$environmentArgs = @{
    VariableName  = 'ANT_HOME'
    VariableValue = $ant_home
    VariableType  = 'Machine'
}

Install-ChocolateyEnvironmentVariable @environmentArgs

Install-BinFile -Name 'ant' -Path $ant_bat

Update-SessionEnvironment
