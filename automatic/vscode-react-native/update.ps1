import-module chocolatey-au
Import-Module ..\..\scripts\vs-marketplace\VS-Marketplace.psd1

$extension = 'vscode-react-native'
$publisher = 'msjsdiag'

function global:au_SearchReplace {
  @{
    "$($Latest.PackageName).nuspec" = @{
      "(Visual Studio Code )([0-9]+\.[0-9]+\.[0-9]+)( or newer)" = "`${1}$($Latest.VSCodeVersion)`${3}"
    }

    ".\README.md" = @{
      "(Visual Studio Code )([0-9]+\.[0-9]+\.[0-9]+)( or newer)" = "`${1}$($Latest.VSCodeVersion)`${3}"
    }

    ".\tools\chocolateyinstall.ps1" = @{
      "([0-9]+\.[0-9]+\.[0-9]+)" = "$($Latest.Version)"
    }
  }
}

function global:au_GetLatest {
  $extensionInfo = Get-VSMarketplaceExtensionDetails -Extension $extension -Publisher $publisher

  @{
    Version       = $extensionInfo.Version
    VSCodeVersion = $extensionInfo.VSCodeVersion
  }
}

update -ChecksumFor none -NoCheckUrl -NoReadme
