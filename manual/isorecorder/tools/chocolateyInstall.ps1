$ErrorActionPreference = 'Stop';

$packageArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileType     = 'msi'
  SilentArgs   = '/quiet /qn /norestart'
  Url          = 'https://web.archive.org/web/20161201184135if_/http://isorecorder.alexfeinman.com/download/IsoRecorder/ISORecorder3.1.3.x86.msi'
  Checksum     = '79BFBBD0D4ACB29776E91EAFB22B1143B4D5F9975FBF0C13A84FA5ED13826408'
  Url64        = 'https://web.archive.org/web/20161201183350if_/http://isorecorder.alexfeinman.com/download/IsoRecorder/ISORecorder3.1.3.x64.msi'
  Checksum64   = '1DB4C5DECD077357F996017A6D69062045CF0FAFDE5A282EF0581F106084E4B0'
  ChecksumType = 'sha256'
}

Install-ChocolateyPackage @packageArgs
