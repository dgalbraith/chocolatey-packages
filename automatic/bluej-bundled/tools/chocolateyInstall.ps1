$ErrorActionPreference = 'Stop';

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$packageArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileType     = 'msi'
  SilentArgs   = '/quiet /qn /norestart'
  Url          = 'https://www.bluej.org/download/files/bluej-bundled-317.msi'
  Checksum     = 'c40b7c68c73c8886f9af9095e921f356c85da9d8ca1c1bf91b3aa008b7305d1c'
  ChecksumType = 'sha256'
}

Install-ChocolateyPackage @packageArgs
