$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-VsCodeExtension -extensionId "$toolsDir\connorshea.vscode-test-explorer-status-bar-1.2.0.vsix"
