import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://www.itefix.net'
$releases = "${domain}/cwrsync"

$re64      = 'cwrsync_.+\.zip'
$reVersion = '([v|_])(?<Version>([\d]+.[\d]+.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re64)"             = "$($Latest.FileName64)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64      = $downloadPage.links | where-object href -Match $re64 | select-object -First 1 -expand href
  $fileName64 = $url64 -split '/' | select-object -Last 1

  $version = $filename64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url64          = $url64
    FileName64     = $fileName64
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme
