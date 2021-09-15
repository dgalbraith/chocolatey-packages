# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@e1f9ccab58bbb3818c8b08f2ed977c0cbfae1d87/icons/nushell.png" width="48" height="48" />Nushell - A new type of shell](https://chocolatey.org/packages/nushell)

[![Software license](https://img.shields.io/github/license/nushell/nushell)](https://github.com/nushell/nushell/blob/main/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v0.37.0-blue.svg)](https://github.com/nushell/nushell/releases/tag/0.37.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/nushell?label=Chocolatey)](https://chocolatey.org/packages/nushell)

Nushell, or Nu for short, is a new shell that takes a modern, structured approach to your commandline. It works
seamlessly with the data from your filesystem, operating system, and a growing number of file formats to make it easy
to build powerful commandline pipelines.

## Features

* **Control your system with powerful pipelines** Pipelines let you command your system like never before. Your system
belongs to you, and it awaits your command
* **Everything is data** Rather than having the need to remember all the parameters to all the commands, we can just use
the same, regardless of where it came from
* **Powerful Plugins** Nu can't come with everything you might want to do with it, so you can extend using its powerful
plugin system

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@e1f9ccab58bbb3818c8b08f2ed977c0cbfae1d87/automatic/nushell/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - add a desktop shortcuts for Nu Shell.  By default the shortcuts will be added for all users  
e.g. `choco install nushell.install --package-parameters="/AddToDesktop"`
* `/AddToStartMenu` - add entries to the Start Menu for Koodoo Reader.  By default the shortcut will be added for all
users  
e.g. `choco install nushell.install --package-parameters="/AddToStartMenu"`
* `/User` - where the user parameter is specified any shortcuts created (using `/AddToDesktop` or `/AddToStartMenu`)
will only be added for the current user  
e.g. `choco install nushell.install --package-parameters="/AddToDesktop /User"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* Nushell only provides a 64-bit version
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
