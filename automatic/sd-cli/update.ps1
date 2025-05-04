import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/chmln/sd/releases/latest"

$re64      = '(sd\..+-windows-.+zip)'
$reVersion = "(v|')(?<Version>([\d]+\.[\d]+\.[\d]+))"

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\update.ps1" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$re64" = "$($Latest.Filename64)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$re64"              = "$($Latest.Filename64)"
      "$reVersion"         = "`${1}$($Latest.Version)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64      = $downloadPage.links | where-object href -match $re64 | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $filename64 = $url64 -split '/' | select-object -last 1

  $version = $url64 -match $reVersion | foreach-object { $Matches.Version }

  # windows binaries are not released for all versions of this package so populate $version with the current version if
  # there are no windows binaries available.  The nuspec has not been parsed at this stage so the current version is not
  # available in the environment - hardcode here and use the package update process to rewrite
  if ([string]::IsNullOrWhiteSpace($version)) {
    $version = '0.7.5'
  }

  return @{
    Filename64 = $filename64
    URL64 = $url64;
    Version = $version;
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
