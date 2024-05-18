import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$domain     = 'https://github.com'
$user       = 'angband'
$repository = 'angband'

$reFileName = "(?<FileName>(?<=\s|'|(?<=\d\/))(ang.+-win\.zip))"
$reChecksum = "(?<=Checksum:\s+)(?<Checksum>[^\s]*)"
$reVersion  = '(?<Version>(?<=v|\/)([\d]+\.[\d]+\.[\d]+(\.*\d*)))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url32      = $downloadPage.links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ }
  $fileName32 = $Matches.FileName

  $version = $filename32 -split '-' | select-object -skip 1 -first 1

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    FileType   = 'zip'
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
