# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@6d5f2fdf113667b9af01b1586fe6debf0c731982/icons/angband.png" width="48" height="48" />Angband - Single Player Dungeon Exploration](https://chocolatey.org/packages/angband)

[![Software license](https://img.shields.io/badge/Licenses-Angband-blue.svg)](https://github.com/angband/angband/blob/master/src/angband.h)
[![GPLv2](https://img.shields.io/badge/GPLv2-blue.svg)](https://www.gnu.org/licenses/old-licenses/gpl-2.0.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v4.2.1-blue.svg)](https://github.com/angband/angband/releases/tag/4.2.1)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/angband?label=Chocolatey)](https://chocolatey.org/packages/angband)

Angband is a complex single player dungeon simulation. A player (you!) creates a character, choosing from a variety of
races and classes, and then plays that character over a period of days, weeks, even months.

The player will begin their adventure on the town level where they may acquire supplies, weapons, armor, and magical
devices by buying from various shop owners. Then the player can descend into the Pits of Angband, where they will
explore the many levels of the dungeon, gaining experience by killing fierce creatures, collecting powerful objects and
valuable treasure, and returning to town occasionally to buy supplies. Eventually, as the player grows more experienced,
they may attempt to win the game by defeating Morgoth, the Lord of Darkness, who resides far below the surface.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@926dac932143d2ce85b90d4657f34ba04e2b57d6/automatic/angband/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - add a desktop shortcut for Angband.  By default the shortcut will be added for all users
e.g. `choco install -y angband --package-parameters="/AddToDesktop"`
* `/User` - where the user parameter is specified any shortcuts created (`/AddToDesktop`) will only be added for
the current user
e.g. `choco install -y angband --package-parameters="/AddToDesktop /User"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* User data is stored in the package install location in the `'lib\user'` directory.  Data is migrated with upgrades but
  will be left in the `"Get-ToolsLocation()\Angband\user"` directory if the package is uninstalled.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
