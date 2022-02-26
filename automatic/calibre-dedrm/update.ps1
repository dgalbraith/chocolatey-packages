import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/noDRM/DeDRM_tools/releases/latest"

$re32      = '(DeDRM(?=[^\/])[^\/\s]+\d\.zip)'
$reVersion = '(v)(?<Version>(\d+\.\d+\.\d+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($re32)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re32)"           = "$($Latest.Filename32)"
      '(Checksum:\s*)(.+)' = "`${1}$($Latest.Checksum32)"
      "$($reVersion)"      = "`${1}$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url32      = $downloadPage.links | where-object href -match $re32 | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $fileName32 = $url32 -split '/' | select-object -last 1

  $version = $downloadPage.Content -match $reversion | foreach-object { $Matches.Version }

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
