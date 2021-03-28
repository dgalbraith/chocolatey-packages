$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path -parent $MyInvocation.MyCommand.Definition

Install-ChocolateyFont $toolsDir -multiple | Out-Null
