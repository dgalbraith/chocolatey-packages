import-module au

$base      = 'https://www.microsoft.com/download/'
$productId = '100122'

$detail       = "${base}details.aspx?id=${productId}"
$download     = "${base}confirmation.aspx?id=${productId}"

$reversion    = '(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'
$reexecutable = 'p>(?<Executable>(.*\.exe))<'

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reversion)" = "$($Latest.Version)"
    }

    'tools\ChocolateyInstall.ps1' = @{
      "(\s*url64bit\s*=\s*)('.*')"       = "`$1'$($Latest.URL64Bit)'"
      "(\s*checksum64\s*=\s*)('.*')"     = "`$1'$($Latest.Checksum64)'"
      "(\s*checksumType64\s*=\s*)('.*')" = "`$1'$($Latest.ChecksumType64)'"
    }
  }
}

function global:au_GetLatest {
  $detail_page   = Invoke-WebRequest -UseBasicParsing -Uri $detail
  $download_page = Invoke-WebRequest -UseBasicParsing -Uri $download

  $detail_page.Content -match $reversion
  $version = $Matches.Version

  $detail_page.Content -match $reexecutable
  $filename = $Matches.Executable

  $url = $download_page.Links | where-object { $_ -Match $filename } | Select-Object -ExpandProperty href | Select-Object -First 1

  $checksum = Get-RemoteChecksum $url

  @{
    Version        = $version
    URL64Bit       = $url
    Filename64     = $filename
    Checksum64     = $checksum
    ChecksumType64 = "sha256"
  }
}

update -ChecksumFor none -NoReadme
