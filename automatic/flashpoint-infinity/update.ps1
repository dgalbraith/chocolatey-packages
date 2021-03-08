import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://bluemaxima.org/flashpoint/downloads/'

$reInfinityUrl     = 'F.+Infinity\.exe$'
$reInfinityVersion = '>F.+Infinity\s(?<Version>(\d+\.\d+))<'
$reVersion         = '(?<Version>(\d+\.\d+))'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      '(http.*\.exe)'           = "$($Latest.Url)"
      "(Checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum)'"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      '(Fl.+\.exe)' = "$($Latest.Archive)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urlInfinity = $downloadPage.links | where-object href -match $reInfinityUrl | select-object -expand href | foreach-object { $releases + $_ }
  $archive     = ($urlInfinity.split('/') | select-object -last 1) -replace '%20',' '
  $version     = $downloadPage.Content -match $reInfinityVersion | foreach-object { $Matches.Version }

  return @{
    Archive = $archive
    Url     = $urlInfinity
    Version = $version
  }
}

update -ChecksumFor none -NoReadme
