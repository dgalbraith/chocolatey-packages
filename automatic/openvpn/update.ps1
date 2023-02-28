import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://openvpn.net'
$releases = "${domain}/community-downloads"

$reUrl        = '.+?msi$'
$re32         = '(?-i)OpenVPN.+-x86\.msi'
$re64         = '(?-i)OpenVPN.+-amd64\.msi'
$reChecksum32 = '(?<=Checksum32:\s+)(.+)'
$reChecksum64 = '(?<=Checksum64:\s+)(.+)'
$reVersion    = '(?<=[v|-])(?<Version>(?<Major>\d+)\.(?<Minor>\d+)\.(?<Patch>\d+)(-I(?<Increment>\d{3}))?)'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix -Algorithm $Latest.ChecksumType
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)" = "$($Latest.Tag)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Tag)"
    }

    ".\legal\VERIFICATION.txt" = @{
      "$($re32)"         = "$($Latest.FileName32)"
      "$($reChecksum32)" = "$($Latest.Checksum32)"
      "$($re64)"         = "$($Latest.FileName64)"
      "$($reChecksum64)" = "$($Latest.Checksum64)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "$($re32)" = "$($Latest.FileName32)"
      "$($re64)" = "$($Latest.FileName64)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $urls = $downloadPage.links | where-object href -Match $reUrl | select-object -Expand href

  $url32      = $urls -Match $re32 | select-object -First 1
  $filename32 = $url32 -split '/' | select-object -Last 1

  $url64      = $urls -Match $re64 | select-object -First 1
  $fileName64 = $url64 -split '/' | select-object -Last 1

  $fileName64 -match $reVersion
  $tag     = '{0}.{1}.{2}'     -f $Matches.Major, $Matches.Minor, $Matches.Patch
  $version = '{0}.{1}.{2}.{3}' -f $Matches.Major, $Matches.Minor, $Matches.Patch, $Matches.Increment

  return @{
    Url32        = $url32
    Url64        = $url64
    FileName32   = $fileName32
    FileName64   = $fileName64
    Tag          = $tag
    Version      = $version
    ChecksumType = 'sha512'
  }
}

update -ChecksumFor none -NoReadme
