import-module chocolatey-au

Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$download = 'https://download.sysinternals.com/files/PSTools.zip'

$reVersion  = '(?<=v)(?<Version>\d+\.\d+\.\d+\.\d+)'
$reChecksum = "(?<=checksum\s[^']*')(?<Checksum>[^']*)"

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $download
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

function GetVersionInformation([string] $url) {
  $response = Invoke-WebRequest -Method HEAD -Uri $download -UseBasicParsing
    
  $lastModified = $response.Headers['Last-Modified']

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    Checksum32 = Get-FileHash $destination | ForEach-Object Hash
    Version    = $version
  }

}
  
function global:au_GetLatest {
  $latest = Update-OnETagChanged -Uri $download -OnETagChanged {
    $response = Invoke-WebRequest -Method HEAD -Uri $download -UseBasicParsing
    
    $lastModified = [datetime]::Parse($response.Headers['Last-Modified'])
    $version = "1.{0}.{1:d2}.{2:d2}" -f $lastModified.Year, $lastModified.Month, $lastModified.Day

    return @{
      Url     = $download
      Version = $version
    }
  }
    
  return $latest
}

update -ChecksumFor none -NoReadme
