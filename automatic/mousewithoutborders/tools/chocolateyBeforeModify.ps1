$ErrorActionPreference = 'Stop'

# The installer cannot overwrite the current or previous version, so we have
# to do this here, unfortunately.

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'msi'
  silentArgs     = '{D3BC954F-D661-474C-B367-30EB6E56542E} /quiet /qn /norestart'
  validExitCodes = @(0, 1605)
}

Uninstall-ChocolateyPackage @packageArgs | out-null
