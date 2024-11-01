# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@e184f68c9b0399f6ed12453be4b6dd5f79beeaa2/icons/mame.png" width="48" height="48" />MAME - Emulation Framework](https://community.chocolatey.org/packages/mame)

[![GitHub license](https://img.shields.io/github/license/mamedev/mame)](https://github.com/dbgate/dbgate/blob/master/COPYING)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v0.271-blue)](https://github.com/mamedev/mame/releases/tag/mame0271)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/mame?label=Chocolatey)](https://community.chocolatey.org/packages/mame)

MAME’s purpose is to preserve decades of software history. As electronic
technology continues to rush forward, MAME prevents this important "vintage"
software from being lost and forgotten. This is achieved by documenting the
hardware and how it functions. The source code to MAME serves as this
documentation. The fact that the software is usable serves primarily to
validate the accuracy of the documentation (how else can you prove that you
have recreated the hardware faithfully?). Over time, MAME (originally stood
for Multiple Arcade Machine Emulator) absorbed the sister-project MESS (Multi
Emulator Super System), so MAME now documents a wide variety of (mostly
vintage) computers, video game consoles and calculators, in addition to the
arcade video games that were its initial focus.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@80973991692dc8557725ecef9caefba958369241/automatic/mame/screenshot.png)

## Package Parameters

* `/AddToDesktop` - add a desktop shortcut for MAME.  By default the shortcut will be added for all users
e.g. `choco install -y mame --package-parameters="/AddToDesktop"`
* `/AddToStart` - add a shortcut to the start menu for MAME.  By default the shortcut will be added for all users
e.g. `choco install -y mame --package-parameters="/AddToStart"`
* `/User` - where the user parameter is specified any shortcuts created (`/AddToDesktop` or `/AddToStart`) will only
be added for the current user
e.g. `choco install -y mame --package-parameters="/AddToDesktop /AddToStart /User"`
* `/InstallDir=[directory]` - set the installation directory to `[directory]`
  e.g. `choco install -y mame --package-parameters="/InstallDir=C:\Tools\MAME"`

## Notes

* Mame only provides a 64-bit version
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
