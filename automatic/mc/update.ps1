import-module au

$domain    = 'https://sourceforge.net'
$releases  = "${domain}/projects/mcwin32/files"


$reversion  = '(v?)(?<Version>([\d]+\.[\d]+)+\.[\d]+)'
$reinstall  = '(mcwin32-.+-setup\.exe)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reversion.[\d]+" = "`${1}$($Latest.Version)"
    }
    ".\legal\VERIFICATION.txt" = @{
      "$reinstall"          = "$($Latest.FileName32)"
      "(Checksum32:\s)(.+)" = "`${1}$($Latest.Checksum32)"
    }
    ".\tools\chocolateyinstall.ps1" = @{
      "$reinstall" = "$($Latest.FileName32)"
    }

  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $fileName32 = (($downloadPage.Links -match $reinstall | select-object -First 1 -expand title) -split ':' |
                select-object -First 1).Remove(0,1)
  $url32      = "{0}/{1}" -f $releases, $fileName32 
  
  $downloadPage.Content -Match $reversion
  $version = $Matches.Version

  $fileName32 -Match 'build(?<Build>([\d]+))'
  $build = $Matches.Build

  $version = "{0}.{1}" -f $version, $build

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
