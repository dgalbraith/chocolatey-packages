import-module chocolatey-au

$base      = 'https://www.microsoft.com/download/'
$productId = '35460'

$detail   = "${base}details.aspx?id=${productId}"

$reChecksum  = "(?<=Checksum\s*=\s*')((?<Checksum>([^']+)))"
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

  $url      = $detailPage.Links | where-object { $_ -match $reUrl } | select-object -ExpandProperty href | select-object -First 1
  $version  = $detailPage.Content -match $reVersion   | foreach-object { $Matches.Version }

  @{
    Url     = $url
    Version = $version
  }
}

update -ChecksumFor none -NoReadme
