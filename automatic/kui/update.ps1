import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/IBM/kui/releases/latest"

$re64      = '(K.+win32-x64\.zip)'
$reversion = '(v)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Write-Host('downloading file')
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(Checksum64:\s)(.+)" = "`${1}$($Latest.Checksum64)"
      "$($reversion)"       = "`${1}$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urls       = $downloadPage.links | where-object href -match $reurl | select-object -expand href | foreach-object { $domain + $_ }
  $url64      = $urls -match $re64 | select-object -first 1
  $filename64 = $url64 -split '/' | select-object -last 1

  $version = $downloadPage.Content -match $reversion | foreach-object { $Matches.Version }

  return @{
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
