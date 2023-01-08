$ErrorActionPreference = 'Stop'

$toolsDir  = (Split-Path -parent $MyInvocation.MyCommand.Definition)
$installer = Join-Path $toolsDir 'gephi-0.10.0-windows-x64.exe'

$silentArgs = '/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-'

$pp = Get-PackageParameters

if ($pp.InstallDir) {
    Write-Verbose("$env:ChocolateyPackageName will be installed to $pp.InstallDir")
    $silentArgs += " /DIR=`"$($pp.InstallDir)`""
}

$tasks = @()

if (-Not ($pp.count = 0)) {
  $pp.GetEnumerator() | foreach-object {
  switch ($_.name) {
      'AddToDesktop' {
        Write-Verbose("A desktop shortcut will be created for $env:ChocolateyPackageName")
        $tasks += 'desktopicon'
      }
      'AddToQuickLaunch' {
        Write-Verbose("A shortcut on the quick launch menu will be created for $env:ChocolateyPackageName")
        $tasks += 'quicklaunchicon'
      }
      'AssociateGephi' {
        Write-Verbose("A file association to $env:ChocolateyPackageName will be added for Gephi Project files (.gephi)")
        $tasks += 'associategephi'
      }
      'AssociateGexf' {
        Write-Verbose("A file association to $env:ChocolateyPackageName will be added for Graph Exchange XML Format files (.gexf)")
        $tasks += 'associategexf'
      }
      'AssociateGdf' {
        Write-Verbose("A file association to $env:ChocolateyPackageName will be added for GUESS format GDF Graph files (.gdf)")
        $tasks += 'associategdf'
      }
      'AssociateGraphml' {
        Write-Verbose("A file association to $env:ChocolateyPackageName will be added for GraphML Graph files (.graphml)")
        $tasks += 'associategraphml'
      }
      'AssociateNet' {
        Write-Verbose("A file association to $env:ChocolateyPackageName will be added for Pajek NET Graph files (.net)")
        $tasks += 'associatenet'
      }
      'CleanUserDir' {
        Write-Verbose("Previous user preferences for $env:ChocolateyPackageName will be cleared")
        $tasks += 'cleanuserdir'
      }
      'InstallDir' {
        # not a task so ignre - handled previously
      }
      Default {
        Write-Verbose("Unknown parameter $_ will be ignored")
      }
    }
  }
} else {
  # the actual install defaults add a desktop shortcut and install a quick launch icon so setting the default explicity if nothing is supplied to avoid this
  Write-Verbose('No parameters supplied - installing to default location and adding file associations for Gephi Project files (.gephi) and Graph Exchange XML Format files (.gexf)')
  $tasks += 'associategephi'
  $tasks += 'associategexf'
}

$silentArgs += " /TASKS=`"{0}`"" -f ($tasks -join ",")

$packageArgs = @{
  PackageName    = $env:ChocolateyPackageName
  File           = $installer
  FileType       = 'exe'
  SilentArgs     = $silentArgs
  ValidExitCodes = @(0, 3010, 1641)
}

Install-ChocolateyInstallPackage @packageArgs

$uninstallKey    = Get-UninstallRegistryKey -SoftwareName "$Env:ChocolateyPackageName $Env:ChocolateyPackageVersion"
$installLocation = $uninstallKey.InstallLocation

$javaHome = Get-EnvironmentVariable -name 'JAVA_HOME' -scope process

if (($javaHome -ne $null) -and ($javaHome -ne "")) {
  Write-Verbose("Using Java located at $javaHome")
  Add-Content -path "$installLocation\etc\gephi.conf" -value "jdkhome=$javaHome"
} else {
  Write-Warning("JAVA_HOME not set - manual configuration required.")
  Write-Warning("Edit $($installLocation)etc\gephi.conf and set jdkhome to the location of a Java 1.8+ install.")
}

if ((Get-ProcessorBits 32) -or $env:ChocolateyForceX86 -eq 'true') {
  $executable = "$installLocation\bin\gephi.exe"
} else {
  $executable = "$installLocation\bin\gephi64.exe"
}

Install-BinFile -name 'gephi' -path $executable -usestart
