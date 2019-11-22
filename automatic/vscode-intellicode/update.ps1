Import-Module au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$extension = 'vscodeintellicode'
$publisher = 'VisualStudioExptTeam'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(copyright>)(.*)(<\/copyright>)"                     = "`${1}$($Latest.Copyright)`${3}"
      "(id=`"vscode`"\sversion=`")([0-9]+\.[0-9]+\.[0-9]+)" = "`${1}$($Latest.VSCodeVersion)"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $extensionInfo = Get-VSMarketplaceExtensionDetails -Extension $extension -Publisher $publisher

  @{
    Copyright      = $extensionInfo.Copyright
    Version        = $extensionInfo.Version
    VSCodeVersion  = $extensionInfo.VSCodeVersion
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
