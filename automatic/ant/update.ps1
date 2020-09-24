import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://ant.apache.org'
$releases = "${domain}/bindownload.cgi" 

$refile    = '(apache-ant-.+\.zip)'
$reversion = '(v|-)(?<Version>([\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix -Algorithm $Latest.ChecksumType32
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($refile)"         = "$($Latest.FileName32)"
      "(Checksum:\s*)(.+)" = "`${1}$($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($refile)"    = "$($Latest.FileName32)"
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      "$($reversion)" = "`${1}$($Latest.Version)"
    }

  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url      = $downloadPage.links | where-object outerHTML -match $refile | select -Skip 3 -First 1 -expand href
  $fileName = $url -split '/' | select -Last 1

  $fileName -Match $reversion
  $version = $Matches.Version

  return @{
    Url32          = $url
    FileName32     = $fileName
    ChecksumType32 = 'sha512'
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme
