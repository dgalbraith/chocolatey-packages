$ErrorActionPreference = 'Stop'

$installDir  = 'c:\ASL'

Write-Host "Removing iASL compiler/disassembler from the '$installDir'"
Uninstall-ChocolateyZipPackage `
  -PackageName 'iasl' `
  -ZipFileName 'iasl-win-20171110.zip'

Write-Host "Removing iASL compiler/disassembler from system PATH"
$newPath = $Env:Path.Replace(";$installLocation", '')
if ($newPath -eq $Env:PATH) {
  return
}
Install-ChocolateyEnvironmentVariable `
  -VariableName 'PATH' `
  -VariableValue $newPath `
  -VariableType 'Machine'

Write-Host "Removing IASL_PREFIX Environment Variable"
Uninstall-ChocolateyEnvironmentVariable `
  -VariableName 'IASL_PREFIX' `
  -VariableType 'Machine'
