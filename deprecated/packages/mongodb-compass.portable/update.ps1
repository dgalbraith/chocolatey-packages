import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/mongodb-js/compass/releases/latest"

$reFile32     = '(mongodb-c.+win32-x64\.zip)'
$reChecksum32 = '(Checksum:\s)(.+)'
$reVersion    = '(\/v|\[|e-)(?<Version>([\d]+\.[\d]+\.[\d]+))'

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

    ".\legal\VERIFICATION.txt" = @{
      "$($reFile32)"     = "$($Latest.Filename32)"
      "$($reChecksum32)" = "`${1}$($Latest.Checksum32)"
      "$($reVersion)"    = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(')$($reFile32)" = "`${1}$($Latest.FileName32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  
  $urls  = $downloadPage.links | select-object -expand href | foreach-object { $domain + $_ }
  
  $url32 = $urls -match $reFile32 | select-object -first 1
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $fileName32       = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $url32 -match $reVersion
  $version = $Matches.Version

  return @{
    FileType   = 'zip'
    FileName32 = $fileName32
    Url32      = $url32
    Version    = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
