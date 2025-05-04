import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://ant.apache.org'
$releases = "${domain}/bindownload.cgi" 

$reFile     =  '(apache-ant-.+\.zip)'
$reVersion  =  '(?<=[v|-])(?<Version>([\d]+\.[\d]+\.[\d]+))'
$reChecksum = '(?<=Checksum:\s*)(?<Checksum>[^\s]+)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix -Algorithm $Latest.ChecksumType32
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFile)"     = "$($Latest.FileName32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFile)"    = "$($Latest.FileName32)"
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url      = $downloadPage.links | Where-Object href -Match $refile | Select-Object -First 1 -Expand href
  $fileName = $url -split '/' | Select-Object -Last 1

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
