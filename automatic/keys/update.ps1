import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/keys-pub/app/releases/latest"

$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reFileName = '(?<FileName>Keys.+msi)'
$reVersion  = '(?<=v|n-)(?<Version>[\d]+\.[\d]+\.[\d]+)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url32      = $assetsPage.links | where-object href -match $reFileName | select-object -expand  href | foreach-object { $domain + $_ }
  $fileName32 = $url32 -split '/' | select-object -last 1

  $version = $url32-match $reVersion | foreach-object { $Matches.Version }

  return @{
    FileName32 = $fileName32
    Url32      = $url32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
