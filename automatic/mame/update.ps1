import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'Stop'

$domain     = 'https://github.com'
$user       = 'mamedev'
$repository = 'mame'

$reFileName   = '(?<FileName>mame\d{4}b_64bit.exe)'
$reChecksum   = '(?<=Checksum:\s+)(?<Checksum>[^\s]*)'
$reCopyright  = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reRawVersion = '(?<=mame)(?<RawVersion>\d{4}(?=\b))'
$reVersion    = '(?<=v)(?<Version>\d\.\d{3})'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
        "$($reCopyright)" = "$($Latest.UpdateYear)"
    }

    ".\README.md" = @{
        "$($reVersion)"    = "$($Latest.Version)"
        "$($reRawVersion)" = "$($Latest.RawVersion)"
    }

    ".\legal\VERIFICATION.txt" = @{
        "$($reFileName)"   = "$($Latest.Filename64)"
        "$($reChecksum)"   = "$($Latest.Checksum64)"
        "$($reRawVersion)" = "$($Latest.RawVersion)"
    }
  
    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.Filename64)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
        "$($reFileName)" = "$($Latest.Filename64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Get-GitHubLatestReleasePage -User $user -Repository $repository

  $url64      = $downloadPage.links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64 = $url64 -split '/' | Select-Object -Last 1

  $updateYear = (Get-Date).ToString('yyyy')

  $rawVersion = $filename64 -match $reRawVersion | ForEach-Object { $Matches.RawVersion }
  $rawVersion = $url64 -match $reRawVersion | ForEach-Object { $Matches.RawVersion }
  $version    = "{0}.{1}" -f ($rawVersion.Substring(0,1), $rawVersion.Substring(1,3))

  return @{
    Url64      = $url64
    FileName64 = $fileName64
    FileType   = 'exe'
    RawVersion = $rawVersion
    UpdateYear = $updateYear
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
