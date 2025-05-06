$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-VsCodeExtension -extensionId "$toolsDir\vmware.vscode-spring-boot-1.63.2025050600.vsix"
