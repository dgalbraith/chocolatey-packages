# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9bd285a368d17e0f4fd8763fdf679d621b4a9657/icons/sqlite-shell-x64.png" width="48" height="48" />sqlite-shell-x64 - 64-bit SQLite shell](https://chocolatey.org/packages/sqlite-shell-x64)

[![Software license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/nalgeon/sqlite/blob/main/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v3.47.0-blue.svg)](https://github.com/nalgeon/sqlite/releases/tag/3.47.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sqlite-shell-x64?label=Chocolatey)](https://chocolatey.org/packages/sqlite-shell-x64)

SQLite Shell is a command-line shell that allows the user to manually enter and
execute SQL statements against an SQLite database.

Current builds from Hwaci are only provided in 32-bit versions - this package
addresses that and provides a 64-bit Windows build.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9bd285a368d17e0f4fd8763fdf679d621b4a9657/automatic/sqlite-shell-x64/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - add a desktop shortcut for sqlite3.  By default the shortcut will be added for all users  
e.g. `choco install -y sqlite-shell-x64 --package-parameters="/AddToDesktop"`
* `/AddToStart` - add a shortcut to the start menu for sqlite3.  By default the shortcut will be added for all users  
e.g. `choco install -y sqlite-shell-x64 --package-parameters="/AddToStart"`
* `/User` - where the user parameter is specified any shortcuts created (`/AddToDesktop` or `/AddToStart`) will be
for the current user only  
e.g. `choco install -y sqlite-shell-x64 --package-parameters="/AddToDesktop /User"`

## Notes

* sqlite-shell-x64 is only available as a 64-bit version.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
