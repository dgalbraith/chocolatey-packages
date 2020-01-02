. "$PSScriptRoot\..\sourcetrail\update.ps1"

function global:au_SearchReplace {
  @{
    ".\tools\chocolateyinstall.ps1" = @{
      "(\s')(S.*32.*\.zip)'" = "`${1}$($Latest.Filename32)'"
      "(\s')(S.*64.*\.zip)'" = "`${1}$($Latest.Filename64)'"
      "('S.*32.*r')"         = "'$($Latest.Directory32)'"
      "('S.*64.*r')"         = "'$($Latest.Directory64)'"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "(?i)(32-Bit:\s)"     = "`${1}$($Latest.URL32)"
      "(?i)(64-Bit:\s)"     = "`${1}$($Latest.URL64)"
      "(Type32:\s*)(\w*)"   = "`${1}$($Latest.ChecksumType32)"
      "(?i)(Checksum32:\s)" = "`${1}$($Latest.Checksum32)"
      "(Type64:\s*)(\w*)"   = "`${1}$($Latest.ChecksumType64)"
      "(?i)(Checksum64:\s)" = "`${1}$($Latest.Checksum64)"
      "(\s)(S.*32.*\.zip)"  = "`${1}$($Latest.Filename32)"
      "(\s)(S.*64.*\.zip)"  = "`${1}$($Latest.Filename64)"
    }
  }
}


function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl     = '(_Portable\.zip)'
  $re32      = '32bit'
  $re64      = '64bit'
  $reversion = '\/tag\/(?<Version>([\d]{4}\.[1-4]\.[\d]*))'

  $urls = $download_page.links | where-object href -match $reurl | select-object -expand  href | foreach-object { $domain + $_ }

  $url32 = $urls -match $re32 | select-object -first 1
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $filename32 = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $url64 = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $download_page.links | where-object href -match $reversion
  $version = $Matches.Version

  return @{
    URL32       = $url32;
    URL64       = $url64;
    Filename    = $filename32;
    Filename64  = $filename64;
    Directory32 = $filename32 -replace '(.zip)';
    Directory64 = $filename64 -replace '(.zip)';
    Version     = $version;
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
