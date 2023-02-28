Function Get-GitHubLatestReleasePage() {
  <#
    .SYNOPSIS
      Get the page where the latest release for the supplied user and repository can be found.

    .DESCRIPTION
      Get-GitHubLatestReleasePage is a Powershell function to obtain the page containing the latest releases for the
      supplied user and repository are found.

    .PARAMETER $User
      The GitHub user to retrieve the latest release page for

    .PARAMETER $Repository
      The GitHub repository to retrieve the latest release page for

    .EXAMPLE
        PS C:\> Get-GitHubLatestReleaseUri -User 'microsoft' -Repository 'terminal'

        Obtain the page containing the latest release for the terminal repository owned by microsoft.

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
    $latestUri = Get-GitHubLatestReleaseUri -User $User -Repository $Repository

    Write-Verbose('Retrieving latest release page from ' + $latestUri)
    $latestReleasePage = Invoke-WebRequest -UseBasicParsing -Uri $latestUri

    return $latestReleasePage
  }
}
