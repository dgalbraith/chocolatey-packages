import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/ElevenPaths/FOCA/releases/latest"

$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reFileName = "(?<FileName>((?<=\s|\d\/|')FO.+\.zip))"
$reVersion  = '(?<Version>((?<=\/v|e-v)\d+\.\d+\.\d+\.\d+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.FileName64)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.FileName64)"
      "$($reVersion)"  = "$($Latest.Version)"
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url64      = $downloadPage.links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64 = $url64 -split '/' | select-object -last 1
  $version    = $url64 -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url64      = $url64
    FileName64 = $fileName64
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
