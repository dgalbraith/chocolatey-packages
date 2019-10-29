Function Get-VSMarketplaceExtensionName() {
  <#
    .SYNOPSIS
        Get the name for an extenion download from the Visual Studio Marketplace.

    .DESCRIPTION
        Get-VSMarketplaceExtensionName is a Powershell function to construct the full name for an extension
        from the Visual Studio Marketplace.  The extension to construct the name for is specified using the
        Extension and the Publisher.  The name is constructed for either the supplied or most recent version
        of the extension.

        Extension names are of the form {publisher}.{name}-{version}.vsix.

    .PARAMETER $Extension
        The name of the extension

    .PARAMETER $Publisher
        The publisher of the extension

    .PARAMETER $Version
        The version of the extension

    .OUTPUTS
        A String representing the full name for the specified extension on the Visual Studio Marketplace.

    .EXAMPLE
        PS C:\> Get-VSMarketplaceExtensionName -Extension python -Publisher ms-python
        ms-python.python-2019.10.44104.vsix

        Construct the full extension name on the Visual Studio Marketplace for the python pacvkage published by
        ms-python and determining the version dynamically.

    .EXAMPLE
        PS C:\> Get-VSMarketplaceExtensionName -Package python -Publisher ms-python -Version 2019.10.44104
        ms-python.python-2019.10.44104.vsix

        Construct the full extension name on the Visual Studio Marketplace for the python pacvkage published by
        ms-python using the supplied version.
    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The name of the extension to construct the VS Marketplace extension name for eg. python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Extension,

    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The publisher of the extension to construct the VS Marketplace extension name for eg. ms-python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Publisher,

    [parameter(Position = 2,
      Mandatory = $false,
      ValueFromPipeline = $true,
      HelpMessage = "The version of the extension to construct the VS Marketplace extension name for eg. 2019.10.44104")]
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

  $nameTemplate = "{0}.{1}-{2}.vsix"
  $nameTemplate -f $Publisher, $Extension, $packageVersion
}
