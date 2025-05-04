import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$base      = 'https://www.bluej.org'
$releases  = "${base}/versions.html"

$reurl32   = '(bluej-bundled-.+\.msi)'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(BlueJ-source-)(\d{3})(.+zip)" = "`${1}$($Latest.RawVersion)`${3}"
    }

    ".\README.md" = @{
      "(v)(?<Version>([\d]+\.[\d]+\.[\d]+))" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(Url\s*=\s*)('.+')" = "`${1}'$($Latest.Url32)'"
      "(Checksum\s*=\s*)('.+')" = "`$1'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | where-object href -match $reurl32 | select-object -expand href | foreach-object { $base +  '/' + $_ } | select -First 1
  $filename32 = $url32 -split '/' | select -Last 1

  $filename32 -match '(?<Version>(\d{3}))'
  $rawVersion = $Matches.Version
  $version = '{0}.{1}.{2}' -f $rawVersion.Substring(0,1), $rawVersion.Substring(1,1), $rawVersion.Substring(2,1)

  return @{
    Url32      = $url32
    FileName32 = $filename32
    Version    = $version
    RawVersion = $rawVersion
  }
}

update -ChecksumFor none -NoReadme
