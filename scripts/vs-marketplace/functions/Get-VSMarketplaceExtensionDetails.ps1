
Function Get-VSMarketplaceExtensionDetails() {
  <#
    .SYNOPSIS
        Get details for an extension from the Visual Studio Marketplace.

    .DESCRIPTION
        Get-VSMarketplaceExtensionDetails is a Powershell function to retrieve extension details from the Visual
        Studio Marketplace.  The extension  to retrieve the details for is specified using the Publisher and the
        Extension.  Details for the extension will be retrieved and returned in a Hashtable.

    .PARAMETER $Extension
        The name of the extension

    .PARAMETER $Publisher
        The publisher of the extension

    .EXAMPLE
        PS C:\> Get-VSMarketplaceExtensionDetails.ps1 ms-python python

        Retrieve details for the python extension published by ms-python from the Visual Studio Marketplace.
    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The name of the extension that the details are to be retrieved for eg. python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Extension,

    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The publisher of the extension that the details are to be retrieved for eg. ms-python")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Publisher
  )

  $extensionUrl = Get-VSMArketplaceExtensionPageUrl -Extension $Extension -Publisher $Publisher
  $extensionPage = Invoke-WebRequest -UseBasicParsing $extensionUrl

  $extensionPage -match '(\"releaseDate.*?(?<ReleaseYear>[0-9]{4}))' | Out-Null
  $releaseYear = $Matches.ReleaseYear
  $extensionPage -match '(\"lastUpdated.*?(?<UpdateYear>[0-9]{4}))' | Out-Null
  $updateYear = $Matches.UpdateYear

  $extensionPage.Content -match 'assetUri":"([^"]+)' | Out-Null
  $assetUri = $Matches[1]
  $json = Invoke-RestMethod -UseBasicParsing -Uri ('{0}/Microsoft.VisualStudio.Code.Manifest' -f $assetUri)

  $extensionFilename = Get-VSMarketplaceExtensionName -Extension $Extension -Publisher $Publisher -Version $json.version
  $extensionDownloadUrl = Get-VSMarketplaceExtensionDownloadUrl -Extension $Extension -Publisher $Publisher -Version $json.version

  $repository = if ($json.repository) { if ($json.reposotory -is [PSCustomObject]) { $json.repository.url } else { $json.repository } }

  @{
    Name                 = $json.name
    Publisher            = $json.publisher
    Author               = if ($json.author -is [PSCustomObject]) { $json.author.name } else { $json.author }
    License              = $json.license
    DisplayName          = $json.displayName
    Copyright            = Get-CopyrightString $releaseYear $updateYear $json
    Description          = $json.description
    Version              = $json.version
    VSCodeVersion        = $json.engines.vscode.TrimStart('^')
    Repository           = $repository
    Homepage             = if ([string]::IsNullOrWhiteSpace($json.homepage)) { $repository } else { $json.homepage }
    Issues               = if ($json.bugs) { if ($json.bugs -is [PSCustomObject]) { $json.bugs.url } else { $json.bugs } }  else { '{0}/issues' -f $repository };
    Questions            = $json.qna
    Keywords             = $json.keywords
    Categories           = $json.categories
    MarketplaceUrl       = $extensionUrl
    MarketplacePage      = $extensionPage
    Filename             = $extensionFilename
    DownloadUrl          = $extensionDownloadUrl
    ReleaseYear          = $releaseYear
    UpdateYear           = $updateYear
    JSON                 = $json
    Id                   = $json.__metadata.id
    PublisherDisplayName = $json.__metadata.publisherDisplayName
    PublisherId          = $json.__metadata.publisherId
  }
}

Function Get-CopyrightString() {
  <#
    .SYNOPSIS
        Construct a copyright string.

    .DESCRIPTION
        Get-CopyrightString is a Powershell function to construct a copyright string.  The stringwill be constructed
        using the Released year and the Last updated year with the copyright assignee being determined from the
        extension maniefest details passed in JSON - if an Author is available it will be used with a fallback to
        Publisher if not available.

    .PARAMETER $Released
        The year of intitial publication

    .PARAMETER $Updated
        The year of the last update

    .PARAMETER $JSON
        The JSON from a Visual Studio Marketplace extension manifest

    .OUTPUTS
        A copyright string for a Visual Studio Extension
    .EXAMPLE
      $releaseYear = '2016'
      $updateYear  = '2019'
      $json = Invoke-RestMethod -UseBasicParsing -Uri 'https://ms-python.gallerycdn.vsassets.io/extensions/ms-python/python/2019.10.44104/1571859930378/Microsoft.VisualStudio.Code.Manifest'

      Get-CopyrightString $released $updated $json
      Copyright 2016-2019 Microsoft Corporation

      Retrieve the conyright string using the supplied Release and Update years and the extension manifest details from the
      Visual Studio Marketplace.
    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The year of initial publication eg. 2000")]
    [ValidateNotNullOrEmpty()]
    [String]
    $Released,

    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The year of the last update eg. 2019")]
    [String]
    $Updated,

    [parameter(Position = 2,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = "The JSON from a Visual Studio Marketplace extension manifest")]
    [ValidateNotNullOrEmpty()]
    [PSCustomObject]
    $JSON
  )

  if ([string]::IsNullOrWhiteSpace($Updated)) {
    $copyrightRange = 'Copyright {0}' -f $Released
  }
  else {
    $copyrightRange = 'Copyright {0}-{1}' -f $Released, $Updated
  }

  # determine copyright attribution - start with Author and fall back to publisher display name followed by publisher
  # which must always be present
  if ($JSON.author) {
    switch ($JSON.author.getType().Name) {
      'PSCustomObject' { $copyrightAttribution = $JSON.author.name }
      default { $copyrightAttribution = $JSON.author }
    }
  }
  elseif (![string]::IsNullOrWhiteSpace($JSON.__metadata.publisherDisplayName)) {
    $copyrightAttribution = $JSON.__metadata.publisherDisplayName
  }
  else {
    $copyrightAttribution = $JSON.publisher
  }

  '{0} {1}' -f $copyrightRange, $copyrightAttribution
}
