import-module au

$releases = 'https://docs.microsoft.com/en-us/sysinternals/downloads/sigcheck'
$download = 'https://download.sysinternals.com/files/Sigcheck.zip'

$reChecksum = "(?<=Checksum\s*=\s*')((?<Checksum>([^']+)))"
$reVersion  = '(?<=v)((?<Version>([\d]+\.[\d]+)))'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $download
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reVersion" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$reChecksum" = "$($Latest.Checksum)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $version = $downloadPage.Content -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Version = $version
  }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
