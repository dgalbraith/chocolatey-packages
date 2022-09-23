import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'Stop'

$releases = 'https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/windowsdesktop'

$re32         = 'W.+32-bit'
$re64         = 'W.+64-bit'
$reFileName   = '(?<FileName>Remote.+_(?<Version>[\d]+\.[\d]+\.[\d]+)\.[\d]+.+msi)'
$reUrl32      = "(?<=url[^']*')(?<Ur32>[^']*)"
$reChecksum32 = "(?<=Checksum[^']*')(?<Checksum>[^']*)"
$reUrl64      = "(?<=url64[^']*')(?<Ur32>[^']*)"
$reChecksum64 = "(?<=Checksum64[^']*')(?<Checksum>[^']*)"
$reVersion    = "(?<=v)(?<Version>[\d]+\.[\d]+\.[\d]+\.?[\d]*)"

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32 -Algorithm 'sha256'
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64 -Algorithm 'sha256'
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reUrl32)"      = "$($Latest.Url32)"
      "$($reUrl64)"      = "$($Latest.Url64)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $downloadUri = $downloadPage.links | Where-Object outerHTML -match $re32 | select-object -expand href
  $url32       = Get-RedirectedUri -Uri $downloadUri
  $apiResponse = Invoke-WebRequest -Method Head -UseBasicParsing -Uri $url32 -MaximumRedirection 0
  $fileName32  = $apiResponse.Headers['Content-Disposition'] -match $reFileName | ForEach-Object { $Matches.FileName}

  $downloadUri = $downloadPage.links | Where-Object outerHTML -match $re64 | Select-Object -expand href
  $url64       = Get-RedirectedUri -Uri $downloadUri
  $apiResponse = Invoke-WebRequest -Method Head -UseBasicParsing -Uri $url64 -MaximumRedirection 0
  $fileName64  = $apiResponse.Headers['Content-Disposition'] -match $reFileName | ForEach-Object { $Matches.FileName }

  $version    = $Matches.Version

  return @{
    FileName   = $fileName32
    Url        = $url32
    FileName64 = $fileName64
    Url64      = $url64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
