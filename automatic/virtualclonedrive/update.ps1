import-module chocolatey-au

$ErrorActionPreference = 'STOP'

$releases = 'https://www.elby.ch/download/SetupVCD.exe'

function global:au_BeforeUpdate {
  $Latest.Checksum32 = Get-RemoteChecksum $Latest.Url32
}

function global:au_SearchReplace {
  @{
    ".\README.md" = @{
      "(v)([\d]+\.[\d]+\.[\d]+\.[\d]+)" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyInstall.ahk" = @{
      "(,\s)(S.+\.exe)" = "`${1}$($Latest.Filename32)"
    }

    ".\tools\chocolateyInstall.ps1" = @{
      "(h.+\.exe)"              = "$($Latest.Url32)"
      "(checksum\s*=\s*)('.+')" = "`${1}'$($Latest.Checksum32)'"
    }
  }
}

function global:au_GetLatest {
    $downloadPage = Invoke-WebRequest -Uri $releases -MaximumRedirection 0 -ErrorAction SilentlyContinue

    $url32      = $downloadPage.Headers.Location
    $filename32 = $url32 -split '/' | select-object -Last 1
    $rawVersion = $filename32 -match '(?<RawVersion>([\d]{4}))\.' | foreach-object { $Matches.RawVersion }

    if ($null -ne $rawVersion -and $rawVersion.Length -eq 4) {
        $version = '{0}.{1}.{2}.{3}' -f $rawVersion[0], $rawVersion[1], $rawVersion[2], $rawVersion[3]
    } else {
        if ($null -eq $rawVersion) {
            Write-Error('No raw version found')
        } else {
            Write-Error('Unexpected raw version/length {0}/{1}' -f $rawVersion, $rawVersion.Length)
        }
    }

  return @{
    Url32        = $url32
    Filename32   = $filename32
    checksumType = 'sha256'
    Version      = $version
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
