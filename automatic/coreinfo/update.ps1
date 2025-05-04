import-module chocolatey-au

$releases = 'https://learn.microsoft.com/sysinternals/downloads/coreinfo'
$download = 'https://download.sysinternals.com/files/Coreinfo.zip'

$reChecksum = "(?<=checksum\s*=\s*')((?<Checksum>([^\s']+)))"
$reUrl      = "(?<=url\s*=\s*')((?<Url>([^\s']+)))"
$reVersion  = '(?<=<h1.*>Coreinfo v)(?<Version>\d+\.\d+)(?=</h1>)'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url32
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      '(?<=v)(?<Version>\d+\.\d+)' = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$reChecksum" = "$($Latest.Checksum)"
      "$reUrl"      = "$($Latest.Url32)"
    }
  }
}

function global:au_GetLatest {
    $releasePage = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $version  = $releasePage.Content -match $reVersion | foreach-object { $Matches.Version }

    return @{
      Url32   = $download
      Version = $version
    }
}

update -ChecksumFor none -NoReadme
