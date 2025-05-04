import-module chocolatey-au

Import-Module "$env:ChocolateyInstall\helpers\chocolateyInstaller.psm1"
Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$base      = 'https://www.microsoft.com/download/'
$productId = '100122'

$detail = "${base}details.aspx?id=${productId}"

$reChecksum = "(?<=checksum64\s*=\s*')(?<Checksum>[^']+)"
$reUrl      = '(?<Url>(https.+\.exe))'
$reVersion  = '(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'


function au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.URL64Bit
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    'tools\ChocolateyInstall.ps1' = @{
      "$($reUrl)"      = "$($Latest.Url64)"
      "$($reChecksum)" = "$($Latest.Checksum64)"
    }
  }
}

function GetVersionInformation([string] $url64) {
  $fileName64  = $url64 -split '\/' | Select-Object -Last 1
  $destination = "$env:TEMP\{0}" -f $fileName64

  Get-WebFile `
    -Url $download `
    -FileName $destination | Out-Null

  try {
    $versionInfo = (Get-Item $destination).VersionInfo

    $versionMajor   = $versionInfo.FileMajorPart
    $versionMinor   = $versionInfo.FileMinorPart
    $versionBuild   = $versionInfo.FileBuildPart
    $versionPrivate = $versionInfo.FilePrivatePart

    $version = '{0}.{1}.{2}.{3}' -f $versionMajor, $versionMinor, $versionBuild, $versionPrivate

    return @{
      Url64      = $url64
      FileName64 = $fileName64
      Checksum64 = Get-FileHash $destination | ForEach-Object Hash
      Version    = $version
    }
  } finally {
    Remove-Item -Force $destination
  }
}

function global:au_GetLatest {
  $detailPage   = Invoke-WebRequest -UseBasicParsing -Uri $detail

  $download = $detailPage.Links | where-object { $_ -Match $reUrl } | Select-Object -ExpandProperty href | Select-Object -First 1

  $result = Update-OnETagChanged -Uri $download -OnETagChanged {
    GetVersionInformation $download
  }

  return $result
}

update -ChecksumFor none -NoReadme
