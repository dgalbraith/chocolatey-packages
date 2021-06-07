Function Get-RedirectedUri() {
  <#
    .SYNOPSIS
      Get the uri that is being redirected to when using the supplied uri parameter.

    .DESCRIPTION
      Get-RedirectedUri is a Powershell function to obtain the URI that is being redirected to from the supplied URI.
      The URI to obtain the redirection for is specified using the Uri parameter.  The redirected URI will be returned
      or the supplied URI if no redirection has taken place.

    .PARAMETER $Uri
        The URI to obtain the redirection for

    .EXAMPLE
        PS C:\> Get-RedirectedUri -Uri 'https://download.mozilla.org/?product=firefox-latest&os=win64'

        Obtain the redirected URI for the Windows 64-bit Mozilla Firefox download.

    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = 'The Uri to obtain the redirection for')]
    [ValidateNotNullOrEmpty()]
    [String]
    $Uri
  )
  process {
    do {
      try {

        Write-Verbose('Attempting to retrieve URL redirect for ' + $Uri)
        $response = Invoke-WebRequest -Method Head -Uri $Uri

        if ($null -ne $response.BaseResponse.ResponseUri) {
          Write-Verbose('Extracting redirected URI from BaseResponse')
          $redirectUri = $response.BaseResponse.ResponseUri.AbsoluteUri
        } elseif ($null -ne $response.BaseResponse.RequestMessage.RequestUri) {
          Write-Verbose('Extracting redirected URI from RequestMessage')
          $redirectUri = $response.BaseResponse.RequestMessage.RequestUri.AbsoluteUri
          Write-Verbose('Redirected URL ' + $redirectUrl)
        }
        $retry = $false
      } catch {
        if (($_.Exception.GetType() -match 'HttpResponseException') -and ($_.Exception -match '302')) {
          $Uri = $_.Exception.Response.Headers.Location.AbsoluteUri
          $retry = $true
        } else {
          throw $_
        }
      }
    } while ($retry)
 
    Write-Verbose('Returning redirected URL ' + $redirectUrl)
    $redirectUri
  }
}
