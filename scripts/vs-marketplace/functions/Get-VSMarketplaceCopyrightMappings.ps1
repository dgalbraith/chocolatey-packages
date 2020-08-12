Function Get-VSMarketplaceCopyrightMappings() {
  <#
    .SYNOPSIS
        Get the copyright mappings for the Visual Studio Marketplace.

    .DESCRIPTION
        Get-VSMarketplaceCopyrightMappings is a Powershell function to load copyright configuration.
        Copyright configuration is used to specfy overreide for VSCode Marketplace extension details
        to appropriate long names for inclusion in a copyright message. The configuration will be
        loaded as a PSCustomObject containing Hashtable mappings for each of Authors, Display Publishers
        and Publishers constructed from the CopyrightMappings.json file present in the same
        directory as the function definition.

    .OUTPUTS
        A PSCustomObject containing Hashtable mappings for each of Authors, Display Publishers
        and Publishers as defined in the CopyrightMappings.json file.

    .EXAMPLE
        PS C:\> Get-VSMarketplaceCopyrightMappings.ps1

        Retrieve a PSCustomObject containing Hashtable mappings for each of Authors, Display Publishers
        and Publishers constructed from the file C:\CopyrightMappings.json.

    #>
  [CmdletBinding()]
  Param()

  try {
      $json = Get-Content -Path "CopyrightMappings.json" -ErrorAction 'Stop' | Out-String | ConvertFrom-Json
      $authors = @{}
      $json.Author.psobject.properties | Foreach { $authors[$_.Name] = $_.Value }
      $displayPublishers = @{}
      $json.DisplayPublishers.psobject.properties | Foreach { $DisplayPublishers[$_.Name] = $_.Value }
      $publishers = @{}
      $json.Publisher.psobject.properties | Foreach { $publishers[$_.Name] = $_.Value }

      $copyrightMaps = [PSCustomObject]@{
        Authors           = $authors
        DisplayPublishers = $displayPublishers
        Publishers        = $publishers
      }

      return $copyrightMaps
  } catch {
    throw 'Unable to load copyright configuration from copyright.json'
  }
}
