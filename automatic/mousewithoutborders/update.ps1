import-module au

$base      = 'https://www.microsoft.com/download/'
$productId = '35460'

$detail       = "${base}details.aspx?id=${productId}"
$download     = "${base}confirmation.aspx?id=${productId}"

$reChecksum  = "(?<=Checksum\s*=\s*')((?<Checksum>([^']+)))"
$reInstaller = '(?<Installer>((?<=p>)(.+\.msi)))'
$reUrl       = '(?<Url>(h.+\.msi))'
$reVersion   = '(?<Version>([\d]+\.[\d]+\.[\d]+\.[\d]+))'

function global:au_BeforeUpdate {
  $Latest.Checksum = Get-RemoteChecksum $Latest.Url
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }

    'tools\ChocolateyInstall.ps1' = @{
      "$($reChecksum)" = "$($Latest.Checksum)"
      "$($reUrl)"      = "$($Latest.Url)"
    }
  }
}

function global:au_GetLatest {
  $detailPage   = Invoke-WebRequest -UseBasicParsing -Uri $detail
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $download

  $version  = $detailPage.Content -match $reVersion   | foreach-object { $Matches.Version }
  $filename = $detailPage.Content -match $reInstaller | foreach-object { $Matches.Installer}

  $url = $downloadPage.Links | where-object { $_ -match $filename } | select-object -ExpandProperty href | select-object -First 1

  @{
    Version = $version
    Url     = $url
  }
}

update -ChecksumFor none -NoReadme
