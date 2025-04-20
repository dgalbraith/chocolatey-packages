Function Get-GitHubLatestReleaseUri() {
  <#
    .SYNOPSIS
      Get the uri where the latest releases for the supplied user and repository can be found.

    .DESCRIPTION
      Get-GitHubLatestReleaseUri is a Powershell function to obtain the URI where the latest releases for the supplied
      user and repository can be found.

    .PARAMETER $User
      The GitHub user to retrieve the latest release URI for

    .PARAMETER $Repository
      The GitHub repository to retrieve the latest release URI for

    .EXAMPLE
        PS C:\> Get-GitHubLatestReleaseUri -User 'microsoft' -Repository 'terminal'

        Obtain the latest release URI for the terminal repository owned by microsoft.

    #>
  [CmdletBinding()]
  Param(
    [parameter(Position = 0,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = 'The GitHub user to retrieve the latest release URI for')]
    [ValidateNotNullOrEmpty()]
    [String]
    $User,
    [parameter(Position = 1,
      Mandatory = $true,
      ValueFromPipeline = $true,
      HelpMessage = 'The GitHub repository to retrieve the latest release URI for')]
    [ValidateNotNullOrEmpty()]
    [String]
    $Repository
  )

  process {
    $releases    = 'https://github.com/{0}/{1}/releases/latest' -f $User, $Repository
    Write-Verbose('Retrieving latest releases for repository ' + $releases)

    $downloadUri = Get-RedirectedUri -Uri $releases
    Write-Verbose('Redirected URL for latest repository releases is ' + $downloadUri)

    $latestTag   = $downloadUri -split 'tag\/' | Select-Object -Last 1
    Write-Verbose('Tag for latest version is ' + $latestTag)

    $latestUri   = 'https://github.com/{0}/{1}/releases/expanded_assets/{2}' -f $User, $Repository, $latestTag

    Write-Verbose('Latest release for user {0} in repository {1} available at {2}' -f $user, $Repository, $latestUri)

    return $latestUri
  }
}
