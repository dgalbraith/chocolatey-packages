$ErrorActionPreference = 'Stop'

$toolsDir = $(Split-Path -parent $MyInvocation.MyCommand.Definition)

Install-VsCodeExtension -extensionId "$toolsDir\hbenl.vscode-test-explorer-liveshare-1.0.5.vsix"
