import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://www.stunnel.org'
$releases = "${domain}/downloads.html"

$re64      = '(stunnel-.+\.exe)'
$reversion = '(v|-)(?<Version>([\d]+\.[\d]+))'

function global:au_BeforeUpdate {
    Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re64)"             = "$($Latest.FileName64)"
      "(Checksum64:\s)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64 = $downloadPage.links | where-object href -match $re64 | select-object -First 1 -expand href | foreach-object { $domain + '/' + $_ }
  $fileName64 = $url64 -split '/' | select -Last 1

  $filename64 -match $reversion
  $version = $Matches.Version

  return @{
    FileName64 = $fileName64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
