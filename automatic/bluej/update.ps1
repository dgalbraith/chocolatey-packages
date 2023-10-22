import-module au

$ErrorActionPreference = 'STOP'

$base      = 'https://www.bluej.org'
$releases  = "${base}/index.html"

$reurl64   = '(Bluej-windows-.+\.msi)'

function global:au_BeforeUpdate {
  $Latest.Checksum64 = Get-RemoteChecksum $Latest.Url64
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "(v)(?<Version>([\d]+\.[\d]+\.[\d]+))" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(Url64Bit\s*=\s*)('.+')"   = "`${1}'$($Latest.Url64)'"
      "(Checksum64\s*=\s*)('.+')" = "`$1'$($Latest.Checksum64)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url64      = $downloadPage.links | where-object href -match $reurl64 | select -First 1 -expand href
  $filename64 = $url64 -split '/' | select -Last 1

  $filename64 -match '(?<Version>(\d{3}))'
  $rawVersion = $Matches.Version
  $version = '{0}.{1}.{2}' -f $rawVersion.Substring(0,1), $rawVersion.Substring(1,1), $rawVersion.Substring(2,1)

  return @{
    Url64      = $url64
    FileName64 = $filename64
    Version    = $version
    RawVersion = $rawVersion
  }
}

update -ChecksumFor none -NoReadme
