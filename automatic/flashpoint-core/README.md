# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@71d741b5e9171786eff61aea63d42c7c6ef286c6/icons/flashpoint.png" width="48" height="48"/>Flashpoint Core - BlueMaxima's Flashpoint Core Distribution](https://chocolatey.org/packages/flashpoint-core)

[![GitHub license](https://img.shields.io/badge/license-Various-blue)](https://github.com/FlashpointProject)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v11.0-blue)](https://bluemaxima.org/flashpoint/downloads)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/flashpoint-core?label=Chocolatey)](https://chocolatey.org/packages/flashpoint-core)

BlueMaxima's Flashpoint is a webgame preservation project dedicated to preserving as many experiences from web
platforms, including but not limited to Adobe Flash,  as possible, so that they aren't lost to time.

Flashpoint utilizes a strong selection of open-source software. By combining the power of Apache, a custom-built
launcher, and our own application called the Flashpoint Secure Player, we can play web-based media in a quick,
user-friendly environment without leaving permanent changes or security holes on your computer.

Flashpoint Core is a distribution of the Flashpoint Launcher (FPL) that is tailored specifically to project
contributors and contains example entries for each platform.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@86ac92e13a884fe35add4e73d5bd253da10613a6/automatic/flashpoint-core/screenshot.png))

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - this puts a shortcut on your desktop to Flashpoint.

These parameters can be passed to the installer with the use of `--params`.
For example: `--params "/AddToDesktop"`.

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* Flashpoint Core is targeted at project contributors.  If you are just looking to access the preserved content you are
most likely looking for [Flashpoint Infinity](https://chocolatey.org/packages/flashpoint-infinity).
* You may be prompted by the Windows Firewall to allow the Apache HTTP Server on first execution
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
