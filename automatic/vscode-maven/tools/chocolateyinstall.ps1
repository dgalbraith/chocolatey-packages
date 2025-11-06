$ErrorActionPreference = 'Stop'

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

Install-VsCodeExtension -extensionId "$toolsDir\C:\projects\chocolatey-packages\automatic\vscode-maven\tools\C:\projects\chocolatey-packages\automatic\vscode-maven\tools\C:\projects\chocolatey-packages\automatic\vscode-maven\tools\C:\projects\chocolatey-packages\automatic\vscode-maven\tools\vscjava.vscode-maven-0.44.2025110601.vsix"
