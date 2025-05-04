import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://cdex.mu'
$releases = "${domain}/download"

$refile    = '(CDex-.+\.exe)'
$reversion = '(-)(?<Version>(\d+\.\d+))'
function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($refile)"         = "$($Latest.FileName32)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($refile)" = "$($Latest.FileName32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url      = $downloadPage.links | where-object href -match $refile | select-object -First 1 -expand href
  $fileName = $url -split '/' | select-object -Last 1

  $fileName -match $reversion
  $version = $Matches.Version

  return @{
    Url32          = $url
    FileName32     = $fileName
    ChecksumType32 = 'sha256'
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
