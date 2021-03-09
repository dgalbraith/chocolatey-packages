$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

$unzipArgs = @{
  PackageName  = $env:ChocolateyPackageName
  FileFullPath = Join-Path $toolsDir 'DeDRM_tools_7.1.0.zip'
  Destination  = $toolsDir
}

Get-ChocolateyUnzip @unzipArgs

if (Get-Command "calibre-customize.exe" -ErrorAction SilentlyContinue) 
{ 
  $pinfo                        = New-Object System.Diagnostics.ProcessStartInfo 
  $pinfo.FileName               = "calibre-customize.exe" 
  $pinfo.UseShellExecute        = $false 
  $pinfo.CreateNoWindow         = $true 
  $pinfo.RedirectStandardOutput = $true 
  $pinfo.RedirectStandardError  = $true

  $pinfo.Arguments   = '--add-plugin={0}' -f (Join-Path $toolsDir 'DeDRM_plugin.zip')
  $process           = New-Object System.Diagnostics.Process 
  $process.StartInfo = $pinfo

  $process.Start() | Out-Null 
  Write-Verbose($process.StandardOutput.ReadToEnd())

  $pinfo.Arguments   = '--add-plugin={0}' -f (Join-Path $toolsDir 'Obok_plugin.zip')
  $process           = New-Object System.Diagnostics.Process 
  $process.StartInfo = $pinfo

  $process.Start() | Out-Null 
  Write-Verbose($process.StandardOutput.ReadToEnd())
} else {
  Write-Error -Message 'calibre-customize.exe not found on path' -Category ResourceUnavailable
}

