Function Get-VSMarketplaceExtensionPageUrl() {
  <#
    .SYNOPSIS
        Get the URL for an extension page on the Visual Studio Marketplace.

    .DESCRIPTION
        Get-VSMarketplaceExtensionPageUrl is a Powershell function to construct the URL for an extension page on the
        Visual Studio Marketplace.  The extension to construct the URL for is specified using the Extension and the
        Publisher.

        Extension URLs are of the form https://marketplace.visualstudio.com/items?itemName={publisher}.{name}

    .PARAMETER $Extension
        The name of the extension

    .PARAMETER $Publisher
        The publisher of the extension

    .OUTPUTS
        A String representing the URL for the specified extension on the Visual Studio Marketplace.

    .EXAMPLE
        PS C:\> Get-VSMarketplaceExtensionPageUrl -Package python -Publisher ms-python
        https://marketplace.visualstudio.com/items?itemName=ms-python.python

        Retrieve the package page URL for the specified package on the Visual Studio Marketplace.
    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The name of the extension to construct the VS Marketplace page URL for eg. python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Extension,

    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The publisher of the extension to construct the VS Marketplace page URL for eg. ms-python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Publisher
  )

  $pageTemplate = "https://marketplace.visualstudio.com/items?itemName={0}.{1}"
  $pageTemplate -f $Publisher, $Extension
}
