import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/isacikgoz/tldr/releases/latest"

$re64      = '(tldr.+_w.+\.zip)'
$reVersion = "(v|')(?<Version>([\d]+\.[\d]+\.[\d]+))"

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\Update.ps1" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(\/v.+|\s)$($re64)"  = "`${1}$($Latest.Filename64)"
      "(Checksum64:\s)(.+)" = "`${1}$($Latest.Checksum64)"
      "$($reversion)"       = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64 = $download_page.links | where-object href -match $re64 | select-object -expand href | foreach-object { $domain + $_ }
  $filename64 = $url64 -split '/' | select-object -last 1

  $version = $url64 -match $reVersion | foreach-object { $Matches.Version }

  # windows binaries are not released for all versions of this package so populate $version with the current version if
  # there are no windows binaries available.  The nuspec has not been parsed at this stage so the current version is not
  # available in the environment - hardcode here and use the package update process to rewrite
  if ([string]::IsNullOrWhiteSpace($version)) {
    $version = '0.6.1'
  }

  return @{
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
