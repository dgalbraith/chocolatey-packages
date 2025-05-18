# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9f2ecca5e3ca949d13bbe6a2a6ec05b23f4e6f88/icons/netradio.png" width="48" height="48" />NetRadio - Play Internet Radio Streams (Portable)](https://community.chocolatey.org/packages/netradio.portable)

[![GitHub license](https://img.shields.io/github/license-freeware-orange)](https://github.com/ophthalmos/NetRadio/blob/master/LicenseAgreement.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v2.5.5-blue.svg)](https://www.ophthalmostar.de/freeware/#netradio)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/netradio.portable?label=Chocolatey)](https://community.chocolatey.org/packages/netradio.portable)

A versatile and user-friendly freeware application designed for all Windows users to listen to
internet radio streams.  NetRadio allows you to play online radio streams and conveniently manage
your preferred stations, all within a sleek interface.

## Features

* **Stream a World of Audio**: Access a vast array of internet radio stations directly from your PC.
* **Organize Your Favorites**: Easily save and manage your go-to stations with 25 preset buttons on
  the player page.
* **Record Live Radio**: Capture آن-air streams and save them as files for later listening.
* **Stay Informed**: Benefit from automatic stream title updates and synchronization, so you always
  know what's playing. Keep track of your listening with a song history feature, which can also be
  exported.  
* **Modern Streaming Support**: NetRadio includes m3u8 support for HLS playlists, ensuring compatibility
  with current streaming standards.
* **Flexible Playback Options**: Choose between the full main window, a compact MiniPlayer, or minimize
  NetRadio to the system tray for unobtrusive listening.
* **Schedule Your Listening**: Set up scheduled tasks to automatically play, record, or stop streams at
  your convenience.
* **Optimized Station Discovery**: An enhanced online search function helps you find new internet radio
  stations to explore.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@9f2ecca5e3ca949d13bbe6a2a6ec05b23f4e6f88/automatic/netradio/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/InstalllDir` - install NetRadio to the specified folder
eg. `choco install -y netradio.portable --package-parameters="/InstallDir=C:\Tools\NetRadio"`
* `/AddToDesktop` - add a desktop shortcut for NetRadio.  By default the shortcut will be added for all users
e.g. `choco install -y netradio.portable --package-parameters="/AddToDesktop"`
* `/AddToStart` - add a shortcut to the start menu for NetRadio.  By default the shortcut will be added for all users
e.g. `choco install -y netradio.portable --package-parameters="/AddToStart"`
* `/User` - where the user parameter is specified any shortcuts created (`/AddToDesktop` or `/AddToStart`) will be
for the current user
e.g. `choco install -y netradio.portable --package-parameters="/AddToDesktop /User"`

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (chocolatey-au)](https://github.com/chocolatey-community/chocolatey-au/blob/develop/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
