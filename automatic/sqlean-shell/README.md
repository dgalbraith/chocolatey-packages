# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ee024e32bd615c9597654203de1907c6533027f8/icons/sqlean-shell.png" width="48" height="48" />sqlean-shell - SQLite shell bundled with essential extensions](https://chocolatey.org/packages/sqlean-shell)

[![Software license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/nalgeon/sqlite/blob/main/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v3.45.0-blue.svg)](https://github.com/nalgeon/sqlite/releases/tag/3.45.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sqlean-shell?label=Chocolatey)](https://chocolatey.org/packages/sqlean-shell)

sqlean shell is SQLite shell bundled with a collection of [essential extensions](https://github.com/nalgeon/sqlean#main-set)
ranging from regular expressions and math statistics to file I/O and dynamic SQL.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ee024e32bd615c9597654203de1907c6533027f8/automatic/sqlean-shell/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - add a desktop shortcut for sqlean.  By default the shortcut will be added for all users  
e.g. `choco install -y sqlean-shell --package-parameters="/AddToDesktop"`
* `/AddToStart` - add a shortcut to the start menu for sqlean.  By default the shortcut will be added for all users  
e.g. `choco install -y sqlean-shell --package-parameters="/AddToStart"`
* `/User` - where the user parameter is specified any shortcuts created (`/AddToDesktop` or `/AddToStart`) will be
for the current user only  
e.g. `choco install -y sqlean-shell --package-parameters="/AddToDesktop /User"`

## Notes

* sqlean-shell is only available as a 64-bit version.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact
  the maintainer(s) and let them know the package is no longer updating
  correctly.
