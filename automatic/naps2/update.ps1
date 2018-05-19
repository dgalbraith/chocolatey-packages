import-module au

$releases = 'https://api.github.com/repos/cyanfish/naps2/releases/latest'

function global:au_SearchReplace {
    @{
        'tools\ChocolateyInstall.ps1' = @{
            "(^[$]downloadUrl\s*=\s*)('.*')" = "`$1'$($Latest.URL)'"
            "(^[$]checksum\s*=\s*)('.*')"    = "`$1'$($Latest.Checksum)'"
        }
     }
}

function global:au_GetLatest {
    $json = $(Invoke-WebRequest -Uri $releases | ConvertFrom-Json)
    $msi_release = $json.assets | Where-Object { $_.name.EndsWith(".msi") }

    # Get Version
    $version = $($json | Select-Object -ExpandProperty "name")

    # Get URL
    $url = $($msi_release | Select-Object -ExpandProperty "browser_download_url")

    # Get Checksum
    $filename = $($msi_release | Select-Object -ExpandProperty "name")
    $temp_file = $env:TEMP + '\' + $filename
    Invoke-WebRequest $url -OutFile $temp_file
    $checksum = $(Get-FileHash $temp_file -Algorithm SHA256 | Select-Object -ExpandProperty Hash)

    $Latest = @{ URL = $url; Checksum = $checksum; Version = $version }
    return $Latest
}

update -ChecksumFor 32
