import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$domain   = 'https://build.openvpn.net'
$releases = "${domain}/downloads/releases/?C=M&O=D"

# oldest release line maintained as a stream - newer lines are added automatically
$minStream = [version]'2.6'

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

  $urls = $downloadPage.links | Where-Object { $_.href -match $reUrl } | Select-Object -ExpandProperty href | Where-Object { $_ -notmatch '[-_](beta|rc|alpha)' } | ForEach-Object { "$domain/downloads/releases/$_" }

  # releases for each line (eg. 2.6 and 2.7) are interleaved on the page so select by version rather than date, with a
  # stream per release line from $minStream onwards - new lines are added on their first final release
  $releases64 = $urls -Match $re64 | Sort-Object -Unique | ForEach-Object {
    $null = ($_ -split '/' | Select-Object -Last 1) -match $reVersion
    [pscustomobject]@{
      Url     = $_
      Release = $Matches[0]
      Stream  = '{0}.{1}'         -f $Matches.Major, $Matches.Minor
      Tag     = '{0}.{1}.{2}'     -f $Matches.Major, $Matches.Minor, $Matches.Patch
      Version = '{0}.{1}.{2}.{3}' -f $Matches.Major, $Matches.Minor, $Matches.Patch, $Matches.Increment
      Order   = [version]('{0}.{1}.{2}.{3}' -f $Matches.Major, $Matches.Minor, $Matches.Patch, [int]$Matches.Increment)
    }
  } | Where-Object { [version]$_.Stream -ge $minStream }

  $streams = [ordered]@{}

  $releases64 | Group-Object Stream | Sort-Object { [version]$_.Name } -Descending | ForEach-Object {
    $newest = $_.Group | Sort-Object Order -Descending | Select-Object -First 1
    $url32  = $urls -Match $re32 | Where-Object { $_ -like "*-$($newest.Release)-x86.msi" } | Select-Object -First 1

    $streams.Add($_.Name, @{
      Url32        = $url32
      Url64        = $newest.Url
      FileName32   = ($url32 -split '/' | Select-Object -Last 1)
      FileName64   = ($newest.Url -split '/' | Select-Object -Last 1)
      Tag          = $newest.Tag
      Version      = $newest.Version
      ChecksumType = 'sha512'
    })
  }

  return @{ Streams = $streams }
}

update -ChecksumFor none -NoReadme
