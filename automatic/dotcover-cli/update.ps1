import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://data.services.jetbrains.com'
$releases = "${domain}/products?code=DCCLT&release.type=release"

$reFile        = '(?<![\/\.])(?<FileName>Jet.+[zip|gz])'
$reChecksum    = "(?<=Checksum\s*[:=]\s*'?)(?<Checksum>[^\s|^']+)"
$reChecksumUrl = '(?<ChecksumUrl>https.+256)'
$reUrl         = '(?<Url>https.+?\.(zip|gz)$)'
$reVersion     = '(?<=v)(?<Version>\d+\.\d+[\.\d]*)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFile)"        = "$($Latest.FileName32)"
      "$($reUrl)"         = "$($Latest.Url32)"
      "$($reChecksum)"    = "$($Latest.Checksum32)"
      "$($reChecksumUrl)" = "$($Latest.Checksum32Url)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFile)"     = "$($Latest.FileName32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $packageData = Invoke-RestMethod -Uri $releases

  $release = $packageData.releases[0]

  $url         = $release.downloads.'cross-platform'.link
  $fileName    = $url -split '/' | Select-Object -Last 1
  $checksumUrl = $release.downloads.'cross-platform'.checksumLink
  $version     = $release.version

  return @{
    FileName32    = $fileName
    Url32         = $url
    Checksum32Url = $checksumUrl
    Version       = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
