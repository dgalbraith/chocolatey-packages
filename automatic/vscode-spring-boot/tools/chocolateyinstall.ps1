$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-VsCodeExtension -extensionId "$toolsDir\vmware.vscode-spring-boot-2.1.2026021000.vsix"
