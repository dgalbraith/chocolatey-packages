# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@49a00ae931effc89c2d837be01e09bf86ca2ea1a/icons/fend.png" width="48" height="48" />fend - Arbitary-Precision Unit-Aware Calculator (Portable)](https://community.chocolatey.org/packages/fend.portable)

[![GitHub license](https://img.shields.io/github/license/printfn/fend)](https://github.com/printfn/fend/blob/main/LICENSE.md)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.5.5-blue)](https://github.com/printfn/fend/releases/tag/v1.5.5)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/fend.portable?label=Chocolatey)](https://community.chocolatey.org/packages/fend.portable)

[fend](https://printfn.github.io/fend) is an arbitrary-precision unit-aware calculator.

## Features

* Arbitrary-precision arithmetic using rational numbers
* Full support for complex numbers
* D&D-style dice rolls
* Variables
* Binary, octal, hexadecimal and all other bases between 2 and 36
* Keep track of units, with support for SI, US and UK customary and many historical units
* Emacs-style CLI shortcuts
* Trigonometric functions
* Lambda calculus

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@49a00ae931effc89c2d837be01e09bf86ca2ea1a/automatic/fend/screenshot.png)

## Package Parameters

* `/AddToDesktop` - add a desktop shortcut for Fend
e.g. `choco install -y fend.portable --package-parameters="/AddToDesktop"`
* `/AddToStart` - add a start menu entry for Fend
e.g. `choco install -y fend.portable --package-parameters="/AddToStartMenu"`
* `/User` - where the user parameter is specified any shortcuts (`/AddToDesktop`, `AddToStart`) will
only be added for the current user
e.g. `choco install -y fend.portable --package-parameters="/AddToDesktop /User"`

## Notes

* Fend only provides a 64-bit version
* Fend cannot be launched in a Powershell ISE session - if it is attempted `Error: Incorrect function. (os error 1)` will be returned
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
