Function Update-OnETagChanged() {
  <#
    .SYNOPSIS
      Update persisted values and execute the supplied code block when the ETag header from the supplied URI
      has been modified.

    .DESCRIPTION
      Update-OnETagChanged is a Powershell function to check the ETag header value from the supplied URI.  If the
      value associated with the ETag header is new/does not match the last value that was persisted the stored value
      will be updated and the supplied script block executed

    .PARAMETER $Uri
        The URI to retrieve the ETag header from
    .PARAMETER $OnETagChanged
        The script block to execute if the value in the ETag header is new/does not match the last value persisted
    .PARAMETER $SaveFile
        The file to persist state to. Defaults to '.\info' if not supplied
    #>
    [CmdletBinding()]
    Param(
      [parameter(Position = 0,
        Mandatory = $true,
        ValueFromPipeline = $true,
        HelpMessage = 'The Uri to retrieve the ETag header from')]
      [ValidateNotNullOrEmpty()]
      [Uri]
      $Uri,
      [parameter(Position = 1,
        Mandatory = $false,
        ValueFromPipeline = $true,
        HelpMessage = 'Script block to execute if the value of the ETag header has changed')]
      [ValidateNotNullOrEmpty()]
      [ScriptBlock]
      $OnETagChanged,
      [parameter(Position = 2,
        Mandatory = $false,
        ValueFromPipeline = $true,
        HelpMessage = 'The file to persist state to')]
      [ValidateNotNullOrEmpty()]
      [String]
      $SaveFile = '.\info'
    )
  process {
    return Update-OnHeaderChanged `
      -Uri $Uri `
      -HeaderName 'ETag' `
      -OnHeaderChanged $OnETagChanged `
      -saveFile $SaveFile
  }
}
