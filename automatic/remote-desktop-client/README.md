# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@557720006f4961d40c36ae5ba129a6f923fb9a6e/icons/remote-desktop-client.png" width="48" height="48" />Remote Desktop Client (MSRDC)](https://community.chocolatey.org/packages/remote-desktop-client)

[![Software license](https://img.shields.io/badge/license-Proprietary-lightgrey)](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ae31f3c2a0f3c01522a777ed8186a3b39f75c480/automatic/remote-desktop-client/legal/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/source-v1.2.6980.0-blue)](https://learn.microsoft.com/en-us/windows-server/remote/remote-desktop-services/clients/windowsdesktop)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/remote-desktop-client?label=Chocolatey)](https://community.chocolatey.org/packages/remote-desktop-client)

Use the Remote Desktop Services client (MSRDC) to access Windows apps and desktops remotely from a different Windows device.

Use and control a remote PC. With a Remote Desktop client, you can do all the things with a remote PC that you can do with a physical PC, such as:

* Use apps installed on the remote PC
* Access files and network resources on the remote PC
* Leave the apps open when you turn off the client

## Package Parameters

* `/User` - override the default behaviour and install the RDS Client for the current user only
  e.g. `choco install -y remote-desktop-client --package-parameters="/User"`
* `/AutoUpdate` - override the default package behaviour and configure the RDS Client to update automatically
  e.g. `choco install -y remote-desktop-client --package-parameters="/AutoUpdate"`
* `/AddToDesktop` - add a desktop shortcut for the RDS Client
  e.g. `choco install -y remote-desktop-client --package-parameters="/AddToDesktop"`
* `/NoStartMenu`  - do not create a start menu entry for the RDS Client
  e.g. `choco install -y remote-desktop-client --package-parameters="/NoStartMenu"`


![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@557720006f4961d40c36ae5ba129a6f923fb9a6e/automatic/remote-desktop-client/screenshot.png)

## Notes

* This package is not for the Remote Desktop Connection (MSTSC) client that ships with Windows. It's for the new Remote Desktop (MSRDC) client.
* This client currently only supports accessing remote apps and desktops from Azure Virtual Desktop and Windows 365.
* The 32-bit version of the Remote Desktop Client will not run in a 64-bit environment and the installation will fail if forced with `--forceX86`
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
