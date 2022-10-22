import-module au

$ErrorActionPreference = 'STOP'

$domain    = 'https://sourceforge.net'
$releases  = "${domain}/projects/logrotatewin/files"

$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reFileName = '(?<FileName>logrotateSetup_(?<Version>[\d]+\.[\d]+\.[\d]+\.[\d]+)_\d{8}\.zip)'
$reVersion  = '(?<=v)(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix -FileNameSkip 1
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reFileName)" = "$($Latest.FileName32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($reFileName)" = "$($Latest.FileName32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.FileName32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url      = $downloadPage.Links | Where-Object href -match $reFileName | Select-Object -First 1 -expand href
  $fileName = $Matches.FileName
  $version  = $Matches.Version

  return @{
    Url32      = $url
    FileName32 = $fileName
    FileType   = 'zip'
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
