import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://www.amazon.com/Kindle-Previewer/b?node=21381691011'
$download = 'https://d2bzeorukaqrvt.cloudfront.net/KindlePreviewerInstaller.exe'

$reChecksum = "(?<=checksum64\s*=\s*')(?<Checksum>[^']+)"
$reVersion  = '(?<=v).*?(?<Version>(\d+\.\d+\.\d+))'

function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $download
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $downloadPage.Content -match $reVersion
  $version = $Matches.Version

  return @{
    URL64          = $download
    ChecksumType64 = 'sha256'
    Version        = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl -NoCheckChocoVersion
