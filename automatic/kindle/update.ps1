import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://www.amazon.com/kindlepcdownload'

$re32      = '.+exe$'
$reVersion = '(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(url\s*=\s*)('.*')"      = "`$1'$($Latest.Url32)'"
      "(checksum\s*=\s*)('.*')" = "`$1'$(Get-RemoteChecksum $Latest.Url32)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases -MaximumRedirection 0 -ErrorAction SilentlyContinue

  $url32 = $downloadPage.Links | where-object href -match $re32 | select-object -First 1 -expand href
  $filename32 = $url32 -split '/' | select-object -Last 1

  $url32 -match $reVersion
  $version = $Matches.Version

  return @{
    URL32          = $url32
    Filename32     = $filename32
    ChecksumType32 = 'sha256'
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme
