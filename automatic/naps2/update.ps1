import-module au

$ErrorActionPreference = 'STOP'

$domain   = 'https://github.com'
$releases = "${domain}/cyanfish/naps2/releases/latest"

$reChecksum     = '(?<=Checksum:\s*)((?<Checksum>([^\s].+)))'
$reCopyright    = '(?<=(Copyright.+(?<CopyrightFrom>[\d]{4})-))(?<CopyrightTo>[\d]{4})'
$reInstall      = "(?<=\d\/|\s|')(?<Filename>(n.+msi))"
$rePortable     = "(?<=\d\/|\s|')(?<Filename>(n.+7z))"
$reVersion      = '(?<=v|\[)(?<Version>([\d]+\.[\d]+\.[\d]+\.?[\d]*))'

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

  $urlInstall      = $downloadPage.links | where-object href -match $reInstall | select-object -expand href | foreach-object { $domain + $_ }
  $fileNameInstall = $urlInstall -split '/' | select-object -last 1

  $urlPortable      = $downloadPage.links | where-object href -match $rePortable | select-object -expand href | foreach-object { $domain + $_ }
  $fileNamePortable = $urlPortable -split '/' | select-object -last 1

  $updateYear = (Get-Date).ToString('yyyy')
  $version    = $urlPortable -match $reVersion | foreach-object { $Matches.Version }

  return @{
    UrlInstall       = $urlInstall
    FileNameInstall  = $fileNameInstall
    UrlPortable      = $urlPortable
    FileNamePortable = $fileNamePortable
    UpdateYear       = $updateYear
    Version          = $version
  }
}

if ($MyInvocation.InvocationName -ne '.') {
  update -ChecksumFor none -NoReadme
}
