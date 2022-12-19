$ErrorActionPreference = 'Stop';

$toolsDir = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

# Remove legacy executables (from before we renamed the web file)
$content = Join-Path (Split-Path $toolsDir) 'content'
$legacy  = Join-Path $content 'cloc-*.exe'
Remove-Item -Path $legacy -Force -ErrorAction SilentlyContinue | Out-Null

$binArgs = @{
  name = $env:ChocolateyPackageName
  path = "$toolsDir\cloc-1.96.exe"
}

Install-BinFile @binArgs
