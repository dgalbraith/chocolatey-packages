$ErrorActionPreference = 'Stop'

Write-Host "iASL compiler/disassembler is going to be installed in '$(Get-ToolsLocation)\ASL'"
$packageArgs = @{
    PackageName    = 'iasl'
    Url            = 'https://acpica.org/sites/acpica/files/iasl-win-20171110.zip'
    UnzipLocation  = "$(Get-ToolsLocation)\ASL"
    Checksum       = 'EAF676C4F116C6EB749C27BACF8F406B922355A113D748CB9AFEE2217EA394E4'
    ChecksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

Write-Host "Installing iASL compiler/disassembler to system PATH"
Install-ChocolateyPath $packageArgs.UnzipLocation -PathType 'Machine'

Write-Host "Creating IASL_PREFIX Environment Variable"
Install-ChocolateyEnvironmentVariable `
  -VariableName 'IASL_PREFIX' `
  -VariableValue $packageArgs.UnzipLocation `
  -VariableType 'Machine'
