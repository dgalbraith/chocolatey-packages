import-module au

$ErrorActionPreference = 'STOP'

$domain = 'https://nethack.org'
$info   = "${domain}/common/index.html"

$reChecksum     = '(?<Checksum>((?<=Checksum:\s+).+))'
$reFileName     = "(?<FileName>((?<=\d\/|\s|')(N.+\.zip)))"
$reShortVersion = '(?<ShortVersion>((?<=\/)(v\d{3})))'
$reVersion      = '(?<Version>((?<=NetHack\s|v|\/)([\d]+\.[\d]+\.[\d]+\.*[\d]{0,8})))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reShortVersion)" = "$($Latest.ShortVersion)"
    }

    ".\README.md" = @{
      "$($reVersion)"      = "$($Latest.Version)"
      "$($reShortVersion)" = "$($Latest.ShortVersion)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)"     = "$($Latest.Filename32)"
      "$($reChecksum)"     = "$($Latest.Checksum32)"
      "$($reVersion)"      = "$($Latest.Version)"
      "$($reShortVersion)" = "$($Latest.ShortVersion)"
    }
  }
}

function global:au_GetLatest {
  $informationPage = Invoke-WebRequest -Uri $info -UseBasicParsing

  $version      = $informationPage.Content -match $reVersion | foreach-object { $Matches.Version }
  $shortVersion = "v$($version.Replace('.',''))"

  $download = "https://nethack.org/$shortVersion/ports/download-win.html"

  $downloadPage = Invoke-WebRequest -Uri $download -UseBasicParsing

  $url32      = $downloadPage.Links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ } 
  $fileName32 = $url32 -match $reFileName | foreach-object { $Matches.FileName } 

  # updates are released under the same Major.Minor.Patch version with mm_dd_yyyy also included
  # this is only available in the filename so if this is the case update the version number to
  # include an additional yyyymmdd version portion
  if ($fileName32 -match '(?<Month>(\d{1,2}))_(?<Day>(\d{1,2}))_(?<Year>(\d{4}))') {
    $version = "{0}.{1}{2:D2}{3:D2}" -f $version,$Matches.Year,$Matches.Month,$Matches.Day
  }

  return @{
    Url32        = $url32
    FileName32   = $fileName32
    ShortVersion = $shortVersion
    Version      = $version
  }
}

update -ChecksumFor none -NoReadme
