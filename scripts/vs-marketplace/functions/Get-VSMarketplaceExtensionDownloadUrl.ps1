Function Get-VSMarketplaceExtensionDownloadUrl() {
  <#
    .SYNOPSIS
        Get the URL for an extension download from the Visual Studio Marketplace.

    .DESCRIPTION
        Get-VSMarketplaceExtensionDownloadUrl is a Powershell function to construct the URL for an extension download
        from the Visual Studio Marketplace.  The extension to construct the URL for is specified using the Extension
        and the Publisher. If a Version is supplied the URL will be constructed using it, otherwise the latest version
        will be determined.

    .PARAMETER $Extension
        The name of the extension

    .PARAMETER $Publisher
        The publisher of the extension

    .PARAMETER $Version
        The version of the extension

    .OUTPUTS
        A String representing the extension download URL for the specified extension on the Visual Studio Marketplace.

    .EXAMPLE
        PS> C:\Get-VSMarketplaceExtensionDownloadUrl -Extension python -Publisher ms-python
        https://marketplace.visualstudio.com/_apis/public/gallery/publishers/ms-python/vsextensions/python/2019.10.41019/vspackage

        Construct the extension download URL for the python extension published by ms-python on the Visual Studio
        Marketplace.
    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The name of the extension to construct the VS Marketplace download URL for eg. python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Extension,

    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The publisher of the extension to construct the VS Marketplace download URL for eg. ms-python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Publisher,

    [parameter(Position = 2,
      Mandatory = $false,
      ValueFromPipeline = $true,
      HelpMessage = "The version of the extension to construct the VS Marketplace download URL for eg. 2019.10.41019")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Version
  )

  if ($PSBoundParameters.ContainsKey('Version')) {
    $packageVersion = $Version
  }
  else {
    $packageDetails = Get-VSMarketplaceExtensionDetails -Extension $Extension -Publisher $Publisher
    $packageVersion = $packageDetails.Version
  }

  $downloadTemplate = "https://marketplace.visualstudio.com/_apis/public/gallery/publishers/{0}/vsextensions/{1}/{2}/vspackage"
  $downloadTemplate -f $Publisher, $Extension, $packageVersion
}
