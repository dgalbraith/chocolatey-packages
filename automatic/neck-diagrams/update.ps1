import-module au

$ErrorActionPreference = 'STOP'

$releases = 'https://www.neckdiagrams.com/download'

function global:au_SearchReplace {
    @{
        ".\tools\chocolateyInstall.ps1" = @{
          "(\s*url\s*=\s*)('.*')"             = "`$1'$($Latest.URL32)'"
          "(\s*url64bit\s*=\s*)('.*')"        = "`$1'$($Latest.URL64)'"
          "(\s*checksum\s*=\s*)('.*')"        = "`$1'$($Latest.Checksum32)'"
          "(\s*checksumType\s*=\s*)('.*')"    = "`$1'$($Latest.ChecksumType32)'"
          "(\s*checksum64\s*=\s*)('.*')"      = "`$1'$($Latest.Checksum64)'"
          "(\s*checksumType64\s*=\s*)('.*')"  = "`$1'$($Latest.ChecksumType64)'"
      }
    }
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = 'NeckDiagrams-(?<Version>(\d+(\.\d+){1,3})).*-Setup-(32)|(64)bit.exe'
  $re32  = '32bit.exe'
  $re64  = '64bit.exe'

  $urls = $download_page.links | where-object href -match $reurl | select-object -expand href | foreach-object { 'https:' + $_ }

  $url32 = $urls -match $re32 | select-object -first 1
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $filename32 = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $url64 = $urls -match $re64 | select-object -first 1
  $url64SegmentSize = $([System.Uri]$url64).Segments.Length
  $filename64 = $([System.Uri]$url64).Segments[$url64SegmentSize - 1]

  $version = $Matches.Version

  $regex = [regex] "(?s)(\'(?<File>NeckDiagrams-(?<Version>\d+\.\d+\.\d+)-Setup-(?<Bits>(32|64)bit)\.exe\')).*?((?<Type>[a-zA-Z0-9]+)\schecksum:\s(?<Digest>[a-zA-Z0-9]*))"
  $allmatches = $regex.Matches($download_page.Content)
  foreach ($match in $allmatches) {
    if ($match -match '32bit') {
      $checksumType32=$match.Groups.Item('Type').Value
      $checksum32=$match.Groups.Item('Digest').Value
    } elseif ($match -match '64bit') {
      $checksumType64=$match.Groups.Item('Type').Value
      $checksum64=$match.Groups.Item('Digest').Value
    }
  }

  return @{
    URL32 = $url32;
    URL64 = $url64;
    Checksum32 = $checksum32;
    Checksum64 = $checksum64;
    ChecksumType32 = $checksumType32;
    ChecksumType64 = $checksumType64;
    Filename32 = $filename32;
    Filename64 = $filename64;
    Version = $version;
  }
}

update -ChecksumFor none
