import-module au

$ErrorActionPreference = 'Stop'

$releases = "https://imagej.nih.gov/ij/download.html"

$reArchive    = "(?<=\/|\s|')(?<Filename>(ij.+win.+zip))"
$reChecksum   = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reRawVersion = '(?<RawVersion>(?<=ij)(?<Major>[\d]{1})(?<Minor>[\d]{2}))'
$reVersion    = '(?<=v)(?<Version>([\d]{1}\.[\d]{2}\.?[\d]*))'


function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reArchive)"  = "$($Latest.FileName64)"
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reArchive)" = "$($Latest.FileName64)"
    }

    ".\tools\chocolateyUninstall.ps1" = @{
      "$($reArchive)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64      = $downloadPage.links | where-object href -match $reArchive | select-object -expand href
  $fileName64 = $url64 -split '/' | select-object -last 1

  $version = $url64 -match $reRawVersion | foreach-object { '{0}.{1}' -f $Matches.Major, $Matches.Minor }

  return @{
    Url64      = $url64
    FileName64 = $fileName64
    FileType   = 'zip'
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
