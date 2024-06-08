$ErrorActionPreference = 'Stop';

$packageArgs = @{
  packageName    = $env:ChocolateyPackageName
  fileType       = 'exe'
  url64          = 'https://d2bzeorukaqrvt.cloudfront.net/KindlePreviewerInstaller.exe'
  checksum64     = '6587236442c35180b8e9eb698a65b9d61406351f30e19b004749ddaa64eb01e1'
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
