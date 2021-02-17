import-module au

$releases = 'https://docs.microsoft.com/sysinternals/downloads/rammap'
$download = 'https://download.sysinternals.com/files/RAMMap.zip'

$reVersion = '(v)(?<Version>(\d+\.\d+))'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $download
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reVersion" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "(checksum\s*=\s*)(.+)" = "`${1}'$($Latest.Checksum)'"
    }
  }
}

function global:au_GetLatest {
    $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

    $version = $downloadPage.Content -match $reversion | foreach-object { $Matches.Version }

    return @{
      Version = $version
    }
}

update -ChecksumFor none -NoReadme -NoCheckUrl
