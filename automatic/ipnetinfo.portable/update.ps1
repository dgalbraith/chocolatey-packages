import-module au

$base      = 'https://www.nirsoft.net/utils'
$releases  = "${base}/ipnetinfo.html"

$reversion  = '([v|"](?<Version>([\d]+\.[\d]+)))'
$reportable = 'ipnetinfo\.zip'

function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$reversion" = "`${1}$($Latest.Version)"
    }
    ".\legal\VERIFICATION.txt" = @{
      "(Checksum32:\s)(.+)" = "`${1}$($Latest.Checksum32)"
    }

  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $url32      = $downloadPage.links | where-object href -match $reportable | select-object -expand href | foreach-object { $base +  '/' + $_ } | select -First 1
  $fileName32 = $url32 -split '/' | select -Last 1
  $fileType   = $fileName32 -split '.' | select -Last 1

  $downloadPage.Content -match $reversion
  $version = $Matches.Version

  return @{
    Url32      = $url32
    FileName32 = $fileName32
    fileType   = $fileType
    Version    = $version
  }
}

update -ChecksumFor none -NoReadme
