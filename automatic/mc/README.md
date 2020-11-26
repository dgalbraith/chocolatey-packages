# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ec1652f85e86682fba61efdbeb5a556dd6ad0284/icons/ipnetinfo.png" width="48" height="48"/>Midnight Commander](https://chocolatey.org/packages/mc)

[![Software license](https://img.shields.io/badge/License-GPLv3-blue.svg)](https://github.com/adamyg/mcwin32/blob/master/mcsrc/doc/COPYING)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v4.17.0.214-blue.svg)](https://sourceforge.net/projects/mcwin32/)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/mc?label=Chocolatey)](https://chocolatey.org/packages/mc)

Windows XP+/32 bit native port of GNU Midnight Commander.

Midnight Commander (also known as mc) is a free cross-platform orthodox file manager and a clone of Norton Commander.

## Features

* supports the recent Windows 10 plus the prior legacy console
* 16 and 256 colour modes are available
* ability work with common archive formats as if they were simply another directory
* ability to function as an SFTP/FTP client
* includes a builtin editor/view
  * syntax highlighing for many languages
  * macros
  * code snuppets
  * simple integration with external tools
  * automatic indentation
  * mouse and clipboard support
  * ability to work in both ASCII and hex modes* rename groups of files
* move files to a different directory at the same time they are renamed
* specify original and resulting filenames using wildcards

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@48b2855247b0e422e994f50e85b9bf8c8ca98c79/automatic/mc/screenshot.png)

## Package Parameters

* `desktopicon` - create a shortcut on the desktop eg. `choco install mc --package-parameters='"/desktopicon"'`

* `modifypath` - add the install directory to the path eg. `choco install mc --package-parameters='"/modifypath"'`

## Notes

* An uninstaller is provided for the package to ensure silent removal - the flags registered with the installation for a silent removal are not complete
  and result in the automatic uninstaller displaying gui elements
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
