Function Get-VSMarketplaceExtension() {
  <#
    .SYNOPSIS
        Download an extension from the Visual Studio Marketplace.

    .DESCRIPTION
        Get-VSMarketplaceExtension is a Powershell function to download an extension from the Visual Studio Marketplace.
        The extension to download is specified using the Publisher and the Extension.  Optionally a Path on which to
        save the package in may also be specified.  The latest version of the extension will be downloaded and saved to
        either the current working directory or to the specified Path.

    .PARAMETER $Extension
        The name of the extension

    .PARAMETER $Publisher
        The publisher of the extension

    .PARAMETER $Path
        The path to save the extension to

    .EXAMPLE
        PS C:\> Get-VSMarketplaceExtension.ps1 ms-python python

        Download the python extension published by ms-python from the Visual Studio Marketplace and save it to the current
        working directory.

    .EXAMPLE
        PS C:\> Get-MarketplaceExtension.ps1 ms-python python C:\Temp

        Download the python extension published by ms-python from the Visual Studio Marketplace and save it to the C:\Temp
        directory.
    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The name of the extension to be downloaded eg. python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Extension,

    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The publisher of the extension to be downloaded eg. ms-python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Publisher,

    [parameter(Position = 2,
      Mandatory = $false,
      ValueFromPipeline = $true,
      HelpMessage = "The path to save the extension to eg. C:\Temp")]
    [String]
    $Path
  )

  if ($PSBoundParameters.ContainsKey('Path')) {
    if ( -Not ( Test-Path $Path )) {
      New-Item -ItemType directory -Path $Path
    }
    $location = $Path
  }
  else {
    $location = Get-Location
  }

  $extensionDetails = Get-VSMarketplaceExtensionDetails -Extension $Extension -Publisher $Publisher

  $downloadTemplate = "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{0}/vsextensions/{1}/{2}/vspackage"

  $downloadUrl = $downloadTemplate -f $Publisher, $Extension, $extensionDetails.Version
  $outputFile = "{0}\{1}.{2}-{3}.vsix" -f $location, $Publisher, $Extension, $extensionDetails.Version

  Invoke-WebRequest -uri $downloadUrl -OutFile $outputFile
}
