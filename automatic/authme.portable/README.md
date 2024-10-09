# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2dce4f4c50f91c7e2ed4b31988faaad635c19d44/icons/authme.png" width="48" height="48" />Authme (Portable) - Simple 2FA Desktop Application](https://chocolatey.org/packages/authme.portabe)

[![GitHub license](https://img.shields.io/github/license/Levminer/authme)](https://github.com/Levminer/authme/blob/main/LICENSE.md)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/source-v5.3.1-blue)](https://github.com/Levminer/authme/releases/tag/5.3.1)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/authme.portable?label=Chocolatey)](https://chocolatey.org/packages/authme.portable)

Authme is a simple two-factor (2FA) authenticator application for the desktop with support for
TOTP and Google Authenticator QR codes.

## Features

* **Secure** - codes are secured by AES 256-bit encryption + your own password
* **Import Codes** - import codes from any TOTP 2FA QR code or directly from Google Authenticator
* **Shortcuts** - easily open Authme with custom shortcuts
* **Completely Offline** - data is stored locally
* **Privacy** - Authme is hidden from video capture and screenshots
* **Easy Export and Backup** - 2FA codes can be exported at any time and backups taken easily

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@2dce4f4c50f91c7e2ed4b31988faaad635c19d44/automatic/authme/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/InstalllDir` - install Authme to the specified folder
eg. `choco install -y authme.portable --package-parameters="/InstallDir=C:\Tools\Authme"`
* `/AddToDesktop` - add a desktop shortcut for Authme.  By default the shortcut will be added for all users
e.g. `choco install -y authme.portable --package-parameters="/AddToDesktop"`
* `/AddToStart` - add a shortcut to the start menu for Authme.  By default the shortcut will be added for all users
e.g. `choco install -y authme.portable --package-parameters="/AddToStart"`
* `/User` - where the user parameter is specified any shortcuts created (`/AddToDesktop` or `/AddToStart`) will be
for the current user
e.g. `choco install -y authme.portable --package-parameters="/AddToDesktop /User"`

## Notes

* Authme is ony provided as a 64-bit version
* Authme will automatically update on aunch
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly
