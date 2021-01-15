import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'http://directory.apache.org/studio/download'
$releases = "${domain}/download-windows.html" 

$refile    = '(ApacheDirectoryStudio-.+\.exe)'
$reversion = '(?<Version>((\d\.){3}v\d+-M\d+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix -Algorithm $Latest.ChecksumType64
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)"                   = "$($Latest.FullVersion)"
      "$($reversion.Replace('-','--'))" = "$($Latest.FullVersion.Replace('-','--'))"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($refile)"         = "$($Latest.FileName64)"
      "$($reversion)"      = "$($Latest.FullVersion)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum64)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($refile)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url      = $downloadPage.links | where-object outerHTML -match $refile | select -Skip 1 -First 1 -expand href
  $fileName = $url -split '/' | select -Last 1

  $fileName -Match $reversion
  $fullVersion = $Matches.Version
  
  $fileName -Match '(?<Version>(\d\.\d\.\d))(.+)(?<Suffix>(-M\d+))'
  $version = $Matches.Version + $matches.Suffix

  return @{
    Url64          = $url
    FileName64     = $fileName
    ChecksumType64 = 'sha512'
    Version        = $version
    FullVersion    = $fullVersion
  }
}

update -ChecksumFor none -NoReadme
