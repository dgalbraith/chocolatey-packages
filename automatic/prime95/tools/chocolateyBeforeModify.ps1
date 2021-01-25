$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

. ("$toolsDir/helpers.ps1")

Close-Prime95

Remove-DesktopShortcut
