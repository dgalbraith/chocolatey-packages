Import-Module au
Import-Module ..\..\scripts\chocolatey-helpers\Chocolatey-Helpers.psd1

$ErrorActionPreference = 'STOP'

$releases = 'https://www.amazon.com/sendtokindle/pc'

$reChecksum  = "(?<=checksum\s[^']*')(?<Checksum>[^']*)"
$reInstaller = '.exe$'
$reUrl       = "(?<=url\s[^']*')(?<Url>[^']*)"
$reVersion   = '(?<=v)(?<Version>\d+\.\d+\.\d+\.\d+)'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "$($reUrl)"      = "$($Latest.FileName32)"
      "$($reChecksum)" = "$($Latest.Checksum32)"
    }
  }
}

function GetVersionInformation([string] $url32) {
  $fileName32  = $url32 -split '\/' | Select-Object -Last 1
  $destination = "$env:TEMP\{0}" -f $fileName32

  Get-WebFile `
    -Url $download `
    -FileName $destination | Out-Null

  try {
    $versionInfo = (Get-Item $destination).VersionInfo

    $versionMajor   = $versionInfo.FileMajorPart
    $versionMinor   = $versionInfo.FileMinorPart
    $versionBuild   = $versionInfo.FileBuildPart
    # Unfortunately package versions 1.1.0.x have been flagged in Chocolatey as 1.1.1.x
    # so forcing an increment of $versionBuild to 1 where the detected version is 1.1.0.x.
    # This will correctly handle the current case and any future versions where there is
    # an increment to either the major and/or minor version parts but will lead to newer
    # versions where only the build version is incremented to 1 to be seen as an existing
    # version
    if (($versionMajor -eq 1) -and ($versionMinor -eq 1) -and ($versionBuild -eq 0)) {
      $versionBuild = 1
    }
    $versionPrivate = $versionInfo.FilePrivatePart

    $version = '{0}.{1}.{2}.{3}' -f $versionMajor, $versionMinor, $versionBuild, $versionPrivate

    return @{
      Url32      = $url32
      FileName32 = $fileName32
      Checksum32 = Get-FileHash $destination | ForEach-Object Hash
      Version    = $version
    }
  } finally {
    Remove-Item -Force $destination
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -Uri $releases -UseBasicParsing

  $download = $downloadPage.Links | Where-Object href -Match $reInstaller | Select-Object -First 1 -Expand href

  $result = Update-OnETagChanged -Uri $download -OnETagChanged {
      GetVersionInformation $download
    }
    return $result
}

update -ChecksumFor none -NoReadme
