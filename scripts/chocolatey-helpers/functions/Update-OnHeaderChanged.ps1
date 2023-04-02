Function Update-OnHeaderChanged() {
  <#
    .SYNOPSIS
      Update persisted values and execute the supplied code block when the requested header from the supplied URI
      has been modified.

    .DESCRIPTION
      Update-OnHeaderChanged is a Powershell function to check a header value from the supplied URI.  If the value
      associated with the header is new/does not match the last value that was persisted the stored value will be
      updated and the supplied script block executed

    .PARAMETER $Uri
        The URI to retrieve the header from
    .PARAMETER $HeaderName
        The HTTP header to compare against
    .PARAMETER $OnHeaderChanged
        The script block to execute if the value in the header is new/does not match the last value persisted
    .PARAMETER $SaveFile
        The file to persist state to. Defaults to '.\info' if not supplied
    #>
    [CmdletBinding()]
    Param(
      [parameter(Position = 0,
        Mandatory = $true,
        ValueFromPipeline = $true,
        HelpMessage = 'The Uri to retrieve the headers from')]
      [ValidateNotNullOrEmpty()]
      [Uri]
      $Uri,
      [parameter(Position = 1,
        Mandatory = $true,
        ValueFromPipeline = $true,
        HelpMessage = 'The header to check against for udpates')]
      [ValidateNotNullOrEmpty()]
      [String]
      $HeaderName,
      [parameter(Position = 2,
        Mandatory = $false,
        ValueFromPipeline = $true,
        HelpMessage = 'Script block to execute if the value of the header has changed')]
      [ValidateNotNullOrEmpty()]
      [ScriptBlock]
      $OnHeaderChanged,
      [parameter(Position = 3,
        Mandatory = $false,
        ValueFromPipeline = $true,
        HelpMessage = 'The file to persist state to')]
      [ValidateNotNullOrEmpty()]
      [String]
      $SaveFile = '.\info'
    )
  process {
    $request = [System.Net.WebRequest]::CreateDefault($uri)

    try {
      $response    = $request.GetResponse()
      $headerValue = $response.Headers.Get($headerName)
    } finally {
      $response.Dispose()
      $response = $null
    }

    $saveResult = $false
    if (!(Test-Path $saveFile)) {
      $result = . $OnHeaderChanged
      $saveResult = $true
    } else {
      $existingInfo = (Get-Content $SaveFile -Encoding UTF8 -TotalCount 1) -split '\|'

      if ($existingInfo[0] -ne $headerValue) {
        $result = . $OnHeaderChanged
        $saveResult = $true
      } else {
        $result = . $OnUpdated
        $result["Version"] = $existingInfo[1]
        $result[$headerName] = $existingInfo[0]
        $saveResult = $false
      }
    }

    if ($saveResult) {
      $result[$headerName] = $headerValue
      "$($result[$headerName])|$($result["Version"])" | Out-File $SaveFile -Encoding utf8 -NoNewline
    }

    return $result
  }
}
