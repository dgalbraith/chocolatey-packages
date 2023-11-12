import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/nushell/nushell/releases/latest"

$reChecksum  = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reCopyright = '(?<=(Copyright\s(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reInstall   = "(?<=\d\/|\s|')(?<Filename>(n.+x86_64.+w.+msvc\.msi))"
$rePortable  = "(?<=\d\/|\s|')(?<Filename>(n.+x86_64.+w.+msvc\.zip))"
$reVersion   = '(?<=v|\[|\/|-)(?<Version>([\d]+\.[\d]+\.[\d](\.(?=\d)\d+)?))'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reVersion)"   = "$($Latest.Version)"
      "$($reCopyright)" = "$($Latest.UpdateYear)"
    }

    ".\README.md" = @{
      "$($reVersion)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $downloadPage = Invoke-WebRequest -UseBasicParsing -Uri $releases
  $latestTag    = $downloadPage.BaseResponse.ResponseUri -split '\/' | Select-Object -Last 1
  $assetsUri    = "{0}/expanded_assets/{1}" -f ($releases.Substring(0, $releases.LastIndexOf('/'))), $latestTag
  $assetsPage   = Invoke-WebRequest -UseBasicParsing -Uri $assetsUri

  $url64Install = $assetsPage.links | where-object href -match $reInstall | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64Install = $url64Install -split '/' | select-object -last 1

  $url64Portable = $assetsPage.links | where-object href -match $rePortable | select-object -expand href | foreach-object { $domain + $_ }
  $fileName64Portable = $url64Portable -split '/' | select-object -last 1

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $fileName64Portable -match $reVersion | foreach-object { $Matches.Version }

  return @{
    Url64Install       = $url64Install
    FileName64Install  = $fileName64Install
    Url64Portable      = $url64Portable
    FileName64Portable = $fileName64Portable
    UpdateYear         = $updateYear
    Version            = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoCheckUrl -NoReadme
}
