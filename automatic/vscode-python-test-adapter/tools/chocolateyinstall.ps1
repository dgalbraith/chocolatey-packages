$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-VsCodeExtension -extensionId "$toolsDir\LittleFoxTeam.vscode-python-test-adapter-0.6.0.vsix"
