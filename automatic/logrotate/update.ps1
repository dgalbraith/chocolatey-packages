import-module au

$ErrorActionPreference = 'STOP'

$domain    = 'https://sourceforge.net'
$releases  = "${domain}/projects/logrotatewin/files"

$reChecksum  = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reFileName  = '(?<FileName>logrotateSetup_(?<Version>[\d]+\.[\d]+\.[\d]+\.[\d]+)_\d{8}\.zip)'
$reVersion   = '(?<=v)(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reFileName)" = "$($Latest.FileName)"
      "$($reVersion)"  = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum)" = "$($Latest.Checksum)"
      "$($reFileName)" = "$($Latest.FileName)"
    }

    ".\tools\chocolateyBeforeModify.ps1" = @{
      "$($reFileName)" = "$($Latest.FileName)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.FileName)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url      = $downloadPage.Links | Where-Object href -match $reInstall | Select-Object -First 1 -expand href
  $fileName = $Matches.FileName
  $version  = $Matches.Version

  return @{
    Url      = $url
    FileName = $fileName
    Version  = $version
  }
}

update -ChecksumFor none -NoReadme
