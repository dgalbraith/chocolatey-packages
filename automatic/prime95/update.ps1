import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://www.mersenne.org'
$releases = "${domain}/download"

$reurl     = '.+?zip'
$re32      = 'p95v\d{3}b\d{1,}\.win32\.zip'
$re64      = 'p95v\d{3}b\d{1,}\.win64\.zip'
$reversion = '(>P.+(?<Version>(\d{2,}\.\d+))).*?(?<Build>(\d+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "(v)(\d+\.\d+.\d+)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re32)"             = "$($Latest.FileName32)"
      "(Checksum32:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
      "$($re64)"             = "$($Latest.FileName64)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($re32)" = "$($Latest.FileName32)"
      "$($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urls = $download_page.links | where-object href -Match $reurl | select-object -Expand href

  $url32  = $urls -Match $re32 | select-object -First 1
  $filename32 = $url32 -split '/' | select-object -Last 1

  $url64  = $urls -Match $re64 | select-object -First 1
  $fileName64 = $url64 -split '/' | select-object -Last 1

  $download_page.Content -Match $reversion
  $version = "$($Matches.Version).$($Matches.Build)"

  return @{
    Url32          = $url32
    Url64          = $url64
    FileName32     = $fileName32
    FileName64     = $fileName64
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme
