import-module au

$ErrorActionPreference = 'STOP'

$base      = 'https://www.nirsoft.net/utils'
$releases  = "${base}/usb_devices_view.html"

$reurl32   = '(usbdeview\.zip)'
$reurl64   = '(usbdeview-x64\.zip)'
$reversion = '(v)(?<Version>([\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
  Write-Host ($Latest.Checksum64)
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reversion" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(Checksum32:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
      "(Checksum64:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | where-object href -match $reurl32 | select-object -expand href | foreach-object { $base +  '/' + $_ } | select -First 1
  $filename32 = $url32 -split '/' | select -Last 1

  $url64      = $downloadPage.links | where-object href -match $reurl64 | select-object -expand href | foreach-object { $base +  '/' + $_ } | select -First 1
  $filename64 = $url64 -split '/' | select -Last 1

  $downloadPage.Content -match $reversion
  $version = $Matches.Version

  return @{
    FileType   = 'zip'
    FileName32 = $filename32
    Url32      = $url32
    FileName64 = $filename64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
