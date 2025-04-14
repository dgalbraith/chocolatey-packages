import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'k-pet-group'
$repository = 'BlueJ-Greenfoot'

$reFilename64 = '(?<Filename64>Bluej-windows-.+\.msi)'
$reChecksum64 = "(?<=Checksum64\s*=\s*')((?<Checksum64>([^'].+)))"
$reUrl64      = "(?<=Url64Bit\s*=\s*')((?<Url64>([^'].+)))"
$reVersion    = '(?<=[-|v])(?<Version>([\d]+\.[\d]+\.[\d]+))'
function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reUrl64)"      = "$($Latest.Url64)'"
      "$($reChecksum64)" = "$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url64      = $downloadPage.links | Where-Object href -match $reFileName64 | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64 = $Matches.FileName64

  $fileName64 -Match $reversion
  $version = $Matches.Version

  return @{
    Url64      = $url64
    FileName64 = $filename64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
