import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://sliksvn.com/download'

$re32      = '(Slik-(?=[^\s]+win32)[^\s]+\.(msi|zip))'
$re64      = '(Slik-(?=[^\s]+-x64)[^\s]+\.(msi|zip))'
$reVersion = '(-v*)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    '.\README.md' = @{
      "$reVersion" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$re32"                = "$($Latest.FileName32)"
      "$re64"                = "$($Latest.FileName64)"
      '(Checksum32:\s*)(.+)' = "`${1}$($Latest.Checksum32)"
      '(Checksum64:\s*)(.+)' = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$re32" = "$($Latest.FileName32)"
      "$re64" = "$($Latest.FileName64)"
    }

  }
}

function global:au_GetLatest {
$downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

$url32      = $downloadPage.Links | where-object href -match $re32 | select-object -expand href | foreach-object { $_.replace('zip', 'msi') }
$fileName32 = $url32 -split '/' | select-object -last 1

$url64      = $downloadPage.Links | where-object href -match $re64 | select-object -expand href | foreach-object { $_.replace('zip', 'msi') }
$fileName64 = $url64 -split '/' | select-object -last 1

$version = $fileName64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    FileName32 = $fileName32
    FileName64 = $fileName64
    Url32      = $url32
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
