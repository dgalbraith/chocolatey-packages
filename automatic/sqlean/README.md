# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5c00af62769ca23287f09747288b62b554e35d06/icons/sqlean.png" width="48" height="48" />sqlean - all the missing sqlite functions](https://chocolatey.org/packages/sqlean)

[![Software license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/nalgeon/sqlean/blob/main/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v0.21.9-blue.svg)](https://github.com/nalgeon/sqlean/releases/tag/0.21.9)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sqlean?label=Chocolatey)](https://chocolatey.org/packages/sqlean)

SQLite has few functions compared to other database management systems. SQLite
authors see this as a feature rather than a problem, because SQLite has an
extension mechanism in place.

There are a lot of SQLite extensions out there, but they are incomplete,
inconsistent and scattered across the internet. sqlean brings them together,
neatly packaged into domain modules, documented and tested.

SQLean provides a well-thought set of domain modules with a convenient API - a
kind of standard library for SQLite.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@5c00af62769ca23287f09747288b62b554e35d06/automatic/sqlean/screenshot.png)

## Package Parameters

* `/InstallDir=[directory]` - set the installation directory to `[directory]`  
  e.g. `choco install -y sqlean --package-parameters="/InstallDir=C:\Tools\sqlean"`

## Notes

* Extensions distributed with sqlean are compiled in 64-bit and require a
  64-bit SQLite version.
* A 64-bit SQLite shell is currently not available from source but there is one
  available pre-bundled with the sqlean extensions in the [sqlean-shell](https://community.chocolatey.org/packages/sqlean-shell)
  package.
* A stand-alone 64-bit SQLite shell binary is available in the [sqlite-shell-x64](https://community.chocolatey.org/packages/sqlite-shell-x64)
  package.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact
  the maintainer(s) and let them know the package is no longer updating
  correctly.
