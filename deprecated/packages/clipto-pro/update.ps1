import-module au

$ErrorActionPreference = 'STOP'

$domain = 'https://github.com'
$releases = "${domain}/clipto-pro/Desktop/releases/latest"

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      ">([0-9]+\.[0-9]+\.[0-9]+)<" = ">$($Latest.Version)<"
    }

    ".\README.md"                   = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "([0-9]+\.[0-9]+\.[0-9]+)"   = "$($Latest.Version)"
      "(\s*checksum\s*=\s*)('.*')" = "`$1'$($Latest.Checksum32)'"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
      "(\s*Checksum:\s*)(.*)"    = "`${1}$($Latest.Checksum32)"
    }
  }
}

function global:au_BeforeUpdate {
  mkdir tools -ea 0 | Out-Null
  $toolsPath = Resolve-Path tools

  Write-Host 'Purging ' $Latest.FileType
  Remove-Item -Force "$toolsPath\*.$Latest.FileType" -ea ignore

  $outputFile = "{0}\{1}" -f $toolsPath, $Latest.Filename
  Invoke-WebRequest -uri $Latest.Url32 -OutFile $outputFile

  $global:Latest.Checksum32 = Get-FileHash $outputFile -Algorithm $Latest.ChecksumType32 | ForEach-Object Hash
}

function global:au_GetLatest {
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $releases

  $reurl = 'clipto.pro-.*\.exe'
  $reversion = '\/tag\/v(?<Version>([\d]*\.[\d]*\.[\d]*))'

  $urls = $download_page.links | where-object href -match $reurl | select-object -expand  href | foreach-object { $domain + $_ }

  $url32 = $urls | select-object -first 1
  $url32SegmentSize = $([System.Uri]$url32).Segments.Length
  $filename32 = $([System.Uri]$url32).Segments[$url32SegmentSize - 1]

  $download_page.links | where-object href -match $reversion
  $version = $Matches.Version

  return @{
    URL32          = $url32;
    Filename       = $filename32;
    Version        = $version;
    ChecksumType32 = 'sha256'
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
