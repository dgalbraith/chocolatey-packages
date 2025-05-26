import-module chocolatey-au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'spyder-ide'
$repository = 'spyder'

$re64         = '(?<Filename64>(Spyder.*x86_64\.exe))'
$reChecksum64 = "(?<=checksum64\s*=\s*')(?<Checksum>[^']+)"
$reCopyright  = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reUrl64      = '(?<Url64>(https:\/\/.*\.exe))'
$reVersion    = '(?<=v)(?<Version>(?<Major>\d*)\.(?<Minor>\d*)\.(?<Patch>\d*))'
 
function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
      "$($reVersion)"   = "$($Latest.Version)"
    }
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
    ".\tools\chocolateyInstall.ps1" = @{
      "$($reUrl64)"      = "$($Latest.Url64)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url64      = $downloadPage.Links | Where-Object href -match $re64 | Select-Object -expand href | ForEach-Object { $domain + $_ }
  $fileName64 = $url64 -split '/' | Select-Object -last 1
  $version    = $url64 -match $reVersion | foreach-object { $Matches.Version }
  $updateYear = (Get-Date).ToString('yyyy')

  return @{
    Url64      = $url64
    FileName64 = $fileName64
    UpdateYear = $updateYear
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
