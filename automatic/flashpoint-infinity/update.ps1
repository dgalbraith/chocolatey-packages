import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://bluemaxima.org/flashpoint/downloads/'

$reInfinityUrl     = 'F.+Infinity\.exe$'
$reInfinityVersion = '>F.+Infinity\s(?<Version>(\d\.\d))<'
$reversion         = '(?<Version>(\d+\.\d))'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(http.*\.exe)"           = "$($Latest.Url)"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urlCore = $downloadPage.links | where-object href -match $reInfinityUrl | select-object -expand href | foreach-object { $releases + $_ }
  $version = $downloadPage.Content -match $reInfinityVersion | foreach-object { $Matches.Version }

  return @{
    Url     = $urlCore
    Version = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
