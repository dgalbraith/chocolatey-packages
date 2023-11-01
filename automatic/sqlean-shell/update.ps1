import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'nalgeon'
$repository = 'sqlite'

$re64       = 'sqlean.exe'
$reChecksum = '(?<=Checksum:\s*)(?<Checksum>.+)'
$reVersion  = '(?<=[v|\/])(?<Version>(\d+\.\d+\.\d+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url64      = $downloadPage.links | where-object href -match $re64 | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64 = $url64 -split '/' | select-object -last 1

  $version = $url64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url64          = $url64
    FileName64     = $fileName64
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
