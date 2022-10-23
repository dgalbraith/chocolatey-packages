import-module au

$ErrorActionPreference = 'Stop'

$domain   = 'https://acpica.org'
$releases = "${domain}/downloads/binary-tools"

$reFile      = '(iasl-win-\d{8}\.zip)'
$reChecksum  = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reCopyright = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})\s-\s))(?<CopyrightTo>[\d]{4})'
$reVersion   = '(?<=v)(?<Version>(\d{4}\.\d{2}\.\d{2}))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFile)" = "$($Latest.FileName32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFile)"     = "$($Latest.FileName32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | Where-Object href -match $reFile | Select-Object -expand href
  $fileName32 = $url32 -split '/' | Select-Object -Last 1

  $fileName32 -match '(?<Year>\d{4})(?<Month>\d{2})(?<Day>\d{2})'
  $version = '{0}.{1}.{2}' -f $Matches.Year, $Matches.Month, $Matches.Day

  $updateYear = (Get-Date).ToString('yyyy')

  return @{
    FileName32 = $fileName32
    Url32      = $url32
    Version    = $version
    UpdateYear = $updateYear
  }
}

update -ChecksumFor none -NoReadme
