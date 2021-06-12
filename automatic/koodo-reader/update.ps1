import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/troyeguo/koodo-reader/releases/latest"

$reFileName = "(?<FileName>((?<=\s|'|\d\/))(K.+\.7z))"
$reChecksum = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reVersion  = '(?<Version>(?<=v|\/)([\d]+\.[\d]+\.[\d]+\.*[\d]*))'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($reFileName)" = "$($Latest.Filename32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
      "$($reVersion)"  = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $url32      = $downloadPage.links | where-object href -match $reFileName | select-object -expand href | foreach-object { $domain + $_ } 
  $fileName32 = $Matches.FileName

  $version = $filename32 -split '-' | select-object -skip 2 -first 1

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
