Import-Module au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$extension = 'python'
$publisher = 'ms-python'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(copyright>)(.*)(<\/copyright>)"     = "`${1}$($Latest.Copyright)`${3}"
      "(<version>)([0-9]+\.[0-9]+\.[0-9]+)" = "`${1}$($Latest.Version)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
    }

    ".\legal\VERIFICATION.txt"      = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
      "(Checksum:\s*)(.*)"       = "`${1}$($Latest.Checksum32)"
    }
  }
}
function global:au_BeforeUpdate {
  Get-RemoteFiles -Purge -NoSuffix $($Latest.FileNameBase)
}

function global:au_AfterUpdate ($Package) {
  Set-DescriptionFromReadme $Package -SkipFirst 0 -SkipLast 1
}
function global:au_GetLatest {
  Write-Host('Running GetLatest')
  $extensionInfo = Get-VSMarketplaceExtensionDetails -Extension $extension -Publisher $publisher

  @{
    Copyright    = $extensionInfo.Copyright
    Version      = $extensionInfo.Version
    URL32        = $extensionInfo.DownloadUrl
    FileNameBase = $extensionInfo.Filename -match '(?<Filename>(.*))(.vsix)' | ForEach-Object { $Matches['Filename'] }
    FileType     = 'vsix'
  }
}

update -ChecksumFor none -NoCheckUrl
