# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ca5faf67d35c123083f63c7517c1a7b01ad28728/icons/sliksvn.png" width="48" height="48"/>Slik SVN - Command Line Subverion Client](https://chocolatey.org/packages/sliksvn)

[![GitHub license](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://svn.apache.org/repos/asf/subversion/trunk/LICENSE)
[![Maintenance status](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.12.0-blue)](https://sliksvn.com/download)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sliksvn?label=Chocolatey)](https://chocolatey.org/packages/sliksvn)

A standalone command-line Subversion client for Windows. The installer contains all command line tools (svn, svnadmin,
svnsync, svnserve, svnmucc) but no application bindings nor Apache modules. The tools are fully side-by-side
compatible with other packages. Ideal for build systems, deploy scripts, et cetera.

The software contained in the Slik Subversion package is “Apache Subversion”. Slik Subversion simply packages the
Apache free software for easier installation.

## Features

* The command line client works the same on each platform. You can use the same knowledge if you need to work on a
remote system, for instance a unix system with only shell access
* Very fast and has a small memory footprint
* Often does not require modifications to the system, installation of shell hooks, et cetera
* Very simple to integrate in batch scripts, build/continuous integration systems, or other automated applications

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ca5faf67d35c123083f63c7517c1a7b01ad28728/automatic/sliksvn/screenshot.png))

## Package Parameters

* `/AddToStartMenu` - add a Subversion documentation folder to the start menu
  e.g. `choco install -y sliksvn --package-parameters="/AddToStartMenu"`
* `/InstallDir=[directory]` - set the installation directory to `[directory]`
  e.g. `choco install -y sliksvn --package-parameters="/InstallDir=C:\Tools\sliksvn"`
* `/NoPath` - override the default behaviour and do not add the package `bin` folder to the system `PATH`
  e.g. `choco install -y sliksvn --package-parameters="/NoPath"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`

## Notes

* This package requires administrative access to install
* Unless the package parameter `NoPath` is passed the package bin folder will be added to the system path
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
