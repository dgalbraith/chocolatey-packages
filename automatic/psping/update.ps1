import-module au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$documentation = 'https://learn.microsoft.com/en-us/sysinternals/downloads/psping'
$download      = 'https://download.sysinternals.com/files/PSTools.zip'

$reVersion  = '(?<=v)(?<Version>\d+\.\d+)'
$reChecksum = "(?<=checksum\s[^']*')(?<Checksum>[^']*)"

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reVersion" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$reChecksum" = "$($Latest.Checksum)"
    }
  }
}
  
function global:au_GetLatest {
  $documentationPage = Invoke-WebRequest -Uri $documentation

  $version = $documentationPage.Content -match $reVersion | ForEach-Object { $Matches.Version }

  return @{
    Url     = $download
    Version = $version
  }
}
    
update -ChecksumFor none -NoReadme
