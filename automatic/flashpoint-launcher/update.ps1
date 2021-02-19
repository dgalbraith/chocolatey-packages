import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/FlashpointProject/launcher/releases/latest"

$re32 = 'F.+win-ia32\.7z'
$re64 = 'F.+win-x64\.7z'

$reversion = '(?<Version>(\d+\.\d+\.\d))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($re32)" = "$($Latest.Filename32)"
      "$($re64)" = "$($Latest.Filename64)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "(\/v.*\/)(Keys.+msi)"       = "`${1}$($Latest.Filename32)"
      "(Checksum:\s)(.+)"          = "`${1}$($Latest.Checksum32)"
      "(\/v)([\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url32      = $downloadPage.links | where-object href -match $re32 | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $fileName32 = $url32 -split '/' | select-object -last 1
  $url64      = $downloadPage.links | where-object href -match $re64 | select-object -expand  href | select-object -first 1 | foreach-object { $domain + $_ }
  $fileName64 = $url64 -split '/' | select-object -last 1

  $version = $downloadPage.Content -match $reversion | foreach-object { $Matches.Version }

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Url64      = $url64
    FileName64 = $fileName64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
