import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/gephi/gephi/releases/latest"

$reChecksum = '(Checksum:\s*)(?<Checksum>(.+))'
$reFileName = "(?<FileName>((?<=('|\s|\d\/))g.+\.exe))"
$reUrl      = '.+\.exe'
$reVersion  = '(?<Version>((?<=v)\d+\.\d+\.\d+))'

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
      "$($reFileName)" = "$($Latest.Filename)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.Filename)"
      "$($reChecksum)" = "`${1}$($Latest.Checksum64)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url      = $downloadPage.links | where-object href -match $reUrl | select-object -expand  href | foreach-object { $domain + $_ }
  $fileName = $url -split '/' | select-object -last 1
  $version  = $fileName -split '-' | select-object -skip 1 -first 1

  return @{
    Url64    = $url
    FileName = $fileName
    Version  = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
