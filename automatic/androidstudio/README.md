# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9cba6e3678771538f289e2459ce02c96de9ea842/icons/androidstudio.png" width="48" height="48" />Android Studio - Official IDE for Android development](https://community.chocolatey.org/packages/androidstudio)

[![Software License](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://developer.android.com/studio/terms)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v2022.3.1.20-blue)](https://developer.android.com/studio)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/androidstudio?label=Chocolatey)](https://community.chocolatey.org/packages/androidstudio)

Android Studio is the official integrated development environment for Google's
Android operating system, built on JetBrains' IntelliJ IDEA software and
designed specifically for Android development.

It provides a unified environment where you can build apps for Android phones,
tablets, Android Wear, Android TV, and Android Auto. Structured code modules
allow you to divide your project into units of functionality that you can
independently build, test, and debug.

## Features

* Design tools
* Intelligent code editor
* Flexible build system
* Easily emulate any device
* APK Analyzer

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@dc94196b2cf602aac6cccde0b3e0b417ef611c4e/automatic/androidstudio/screenshot.png)

* `/AddToDesktop` - add a desktop shortcut for Android Studio
e.g. `choco install -y androidstudio --package-parameters="/AddToDesktop"`
* `/InstallDir=[directory]` - set the installation directory to `[directory]`
  e.g. `choco install -y androidstudio --package-parameters="/InstallDir=C:\Tools\Android Studio"`
* `/NoStartMenu` - do not add a start menu entry for Android Studio
e.g. `choco install -y androidstudio --package-parameters="/NoStartMenu"`
* `/PinToTaskbar` - this put a shortcut on your taskbar to Android Studio
e.g. `choco install -y androidstudio --package-parameters="/PinToTaskbar"`

## Notes

* Android Studio provides both 32 and 64-bit versions in the package
* The shim and shortcuts added will be based on the bitness of the OS or 32-bit if `--forceX86` is specifed on a 64-bit machine
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
