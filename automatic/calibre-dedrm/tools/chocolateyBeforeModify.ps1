$ErrorActionPreference = 'Stop'

$toolsDir = (Split-Path -parent $MyInvocation.MyCommand.Definition)

if (Get-Command "calibre-customize.exe" -ErrorAction SilentlyContinue) 
{ 
  $pinfo                        = New-Object System.Diagnostics.ProcessStartInfo 
  $pinfo.FileName               = "calibre-customize.exe" 
  $pinfo.UseShellExecute        = $false 
  $pinfo.CreateNoWindow         = $true 
  $pinfo.RedirectStandardOutput = $true 
  $pinfo.RedirectStandardError  = $true

  $pinfo.Arguments   = '--remove-plugin=DeDRM'
  $process           = New-Object System.Diagnostics.Process 
  $process.StartInfo = $pinfo

  $process.Start() | Out-Null 
  Write-Verbose($process.StandardOutput.ReadToEnd())

  $stdout=$process.StandardOutput.ReadToEnd() 
  $stderr=$process.StandardError.ReadToEnd()

  $pinfo.Arguments   = '--remove-plugin="Obok DeDRM"'
  $process           = New-Object System.Diagnostics.Process 
  $process.StartInfo = $pinfo

  $process.Start() | Out-Null 
  Write-Verbose($process.StandardOutput.ReadToEnd())
} else {
  Write-Error -Message 'calibre-customize.exe not found on path' -Category ResourceUnavailable
}
