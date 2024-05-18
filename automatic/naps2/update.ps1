import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/cyanfish/naps2/releases/latest"

$reChecksum   = '(?<=Checksum:\s*)(?<Checksum>[^\s]+)'
$reChecksum32 = '(?<=Checksum32:\s*)(?<Checksum>[^\s]+)'
$reChecksum64 = '(?<=Checksum64:\s*)(?<Checksum>[^\s]+)'
$reCopyright  = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$rePortable   = "(?<=\d\/|\s|')(?<Filename>n.+zip)"
$reInstall32  = "(?<=\d\/|\s|')(?<Filename>n.+x86\.msi)"
$reInstall64  = "(?<=\d\/|\s|')(?<Filename>n.+x64\.msi)"
$reVersion    = '(?<=v|\[)(?<Version>[\d]+\.[\d]+\.[\d]+\.?[\d]*)'

function global:au_BeforeUpdate {
}

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "$($reCopyright)" = "$($Latest.UpdateYear)"
      "$($reVersion)"   = "$($Latest.Version)"
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

  $urlInstall32      = $assetsPage.links | where-object href -match $reInstall32 | select-object -expand href | foreach-object { $domain + $_ }
  $fileNameInstall32 = $urlInstall32 -split '/' | select-object -last 1
  $urlInstall64      = $assetsPage.links | where-object href -match $reInstall64 | select-object -expand href | foreach-object { $domain + $_ }
  $fileNameInstall64 = $urlInstall64 -split '/' | select-object -last 1

  $urlPortable      = $assetsPage.links | where-object href -match $rePortable | select-object -expand href | foreach-object { $domain + $_ }
  $fileNamePortable = $urlPortable -split '/' | select-object -last 1

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $urlPortable -match $reVersion | foreach-object { $Matches.Version }

  return @{
    UrlInstall32      = $urlInstall32
    FileNameInstall32 = $fileNameInstall32
    UrlInstall64      = $urlInstall64
    FileNameInstall64 = $fileNameInstall64
    UrlPortable       = $urlPortable
    FileNamePortable  = $fileNamePortable
    UpdateYear        = $updateYear
    Version           = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoReadme
}
