import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://data.services.jetbrains.com'
$releases = "${domain}/products?code=DCCLT&release.type=release"

$reFile32        = '(?<![\/\.])(?<FileName32>Jet.+x86.+zip)'
$reFile64        = '(?<![\/\.])(?<FileName64>Jet.+x64.+zip)'
$reChecksum32    = '(?<=Checksum32:\s*)(?<Checksum32>[^\s]+)'
$reChecksum64    = '(?<=Checksum64:\s*)(?<Checksum64>[^\s]+)'
$reChecksum32Url = '(?<Checksum32Url>https.+x86.+256)'
$reChecksum64Url = '(?<Checksum64Url>https.+x64.+256)'
$reUrl32         = '(?<Url32>https.+x86.+zip)'
$reUrl64         = '(?<Url64>https.+x64.+zip)'
$reVersion       = '(?<=v)(?<Version>\d+\.\d[\.\d]*)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFile32)"        = "$($Latest.FileName32)"
      "$($reUrl32)"         = "$($Latest.Url32)"
      "$($reChecksum32)"    = "$($Latest.Checksum32)"
      "$($reChecksum32Url)" = "$($Latest.Checksum32Url)"
      "$($reFile64)"        = "$($Latest.FileName64)"
      "$($reUrl64)"         = "$($Latest.Url64)"
      "$($reChecksum64)"    = "$($Latest.Checksum64)"
      "$($reChecksum64Url)" = "$($Latest.Checksum64Url)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFile32)" = "$($Latest.FileName32)"
      "$($reFile64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $json = Invoke-RestMethod -Uri $releases

  $release = $json[0].releases[0]

  $url32         = $release.downloads.windows32.link
  $fileName32    = $url32 -split '/' | Select-Object -Last 1
  $checksum32Url = $release.downloads.windows32.checksumLink
  $url64         = $release.downloads.windows64.link
  $fileName64    = $url64 -split '/' | Select-Object -Last 1
  $checksum64Url = $release.downloads.windows64.checksumLink
  $version       = $release.version

  return @{
    FileName32    = $fileName32
    Url32         = $url32
    Checksum32Url = $checksum32Url
    FileName64    = $fileName64
    Url64         = $url64
    Checksum64Url = $checksum64Url
    Version       = $version
  }
}

update -ChecksumFor none -NoReadme
