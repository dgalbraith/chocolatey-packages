import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://data.services.jetbrains.com'
$releases = "${domain}/products?code=DCCLT&release.type=release"

$refile    = "J.+zip"
$reversion = '(-v)(\d+\.\d\.*\d*)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($refile)"         = "`${1}$($Latest.FileName32)"
      "(http.+J.+zip)"     = "$($Latest.Url32)"
      "(http.+J.+256)"     = "$($Latest.ChecksumUrl)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($refile)"    = "$($Latest.FileName32)"
    }
  }
}

function global:au_GetLatest {
  $json = Invoke-RestMethod -Uri $releases

  $release = $json[0].releases[0]

  $url         = $release.downloads.windows.link
  $checksumUrl = $release.downloads.windows.checksumLink
  $version     = $release.version
  $fileName    = $url -split '/' | Select-Object -Last 1

  return @{
    FileName32  = $fileName
    Url32       = $url
    ChecksumUrl = $ChecksumUrl
    Version     = $version
  }
}

update -ChecksumFor none -NoReadme
