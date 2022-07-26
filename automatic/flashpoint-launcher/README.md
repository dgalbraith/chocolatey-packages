# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@71d741b5e9171786eff61aea63d42c7c6ef286c6/icons/flashpoint.png" width="48" height="48"/>Flashpoint Launcher - Launcher for BlueMaxima's Flashpoint](https://chocolatey.org/packages/flashpoint-launcher)

[![GitHub license](https://img.shields.io/badge/license-MIT-green)](https://github.com/FlashpointProject/launcher/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v10.1.3-blue)](https://github.com/FlashpointProject/launcher/releases/tag/10.1.3)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/flashpoint-launcher?label=Chocolatey)](https://chocolatey.org/packages/flashpoint-launcher)

The Flashpoint Launcher (FPL) is a desktop application made for browsing, storing and launching other applications
(games, animations, web apps etc.). It is specifically made for [BlueMaxima's Flashpoint](https://bluemaxima.org/flashpoint),
which is a web preservation project.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@71d741b5e9171786eff61aea63d42c7c6ef286c6/automatic/flashpoint-launcher/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - this puts a shortcut on your desktop to Flashpoint.

These parameters can be passed to the installer with the use of `--params`.
For example: `--params "/AddToDesktop"`.

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
