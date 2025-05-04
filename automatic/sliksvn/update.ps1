import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$releases = 'https://sliksvn.com/download'

$re32         = '(Slik-(?=[^\s]+win32)[^\s]+\.(zip))'
$re64         = '(Slik-(?=[^\s]+-x64)[^\s]+\.(zip))'
$reMsi32      = '(Slik-(?=[^\s]+win32)[^\s]+\.(msi))'
$reMsi64      = '(Slik-(?=[^\s]+-x64)[^\s]+\.(msi))'
$reChecksum32 = '(?<=Checksum32:\s*)((?<Checksum>([^\s].+)))'
$reChecksum64 = '(?<=Checksum64:\s*)((?<Checksum>([^\s].+)))'
$reVersion    = '(?<=-v|-)(?<Version>([\d]+\.[\d]+\.[\d]+))'


function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    '.\README.md' = @{
      "$reVersion" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re32)"         = "$($Latest.FileName32)"
      "$($re64)"         = "$($Latest.FileName64)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($re32)"    = "$($Latest.FileName32)"
      "$($re64)"    = "$($Latest.FileName64)"
      "$($reMsi32)" = "$($Latest.MsiFileName32)"
      "$($reMsi64)" = "$($Latest.MsiFileName64)"
    }
  }
}

function global:au_GetLatest {
$downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

$url32         = $downloadPage.Links | where-object href -match $re32 | select-object -expand href
$fileName32    = $url32 -split '/' | select-object -last 1
$msiFileName32 = $fileName32.replace('zip', 'msi')

$url64         = $downloadPage.Links | where-object href -match $re64 | select-object -expand href
$fileName64    = $url64 -split '/' | select-object -last 1
$msiFileName64 = $fileName64.replace('zip', 'msi')

$version = $fileName64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    FileName32    = $fileName32
    FileName64    = $fileName64
    MsiFileName32 = $msiFileName32
    MsiFileName64 = $msiFileName64
    Url32         = $url32
    Url64         = $url64
    Version       = $version
  }
}

update -ChecksumFor none -NoReadme
