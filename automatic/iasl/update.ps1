import-module au

$ErrorActionPreference = 'Stop'

$releases  = 'https://www.intel.com/content/www/us/en/download/774881/acpi-component-architecture-downloads-windows-binary-tools.html'
$userAgent = 'Mozilla/5.0 AppleWebKit/537.36 (KHTML, like Gecko; compatible; bingbot/2.0; +http://www.bing.com/bingbot.htm) Chrome/W.X.Y.Z Safari/537.36'

$reFile      = '(?<Filename>iasl-win-\d{8}.*\.zip)'
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
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases -UserAgent $userAgent

  $downloadPage.Content -match "(?<Url>https:\/\/.+$reFile)"
  $url32      = $Matches.Url
  $fileName32 = $Matches.Filename

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
