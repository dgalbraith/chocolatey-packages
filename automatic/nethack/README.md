# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@fe013b8fec16af504e14dc2217b085507a4ea791/icons/nethack.png" width="48" height="48" />Nethack - Single Player Dungeon Exploration](https://chocolatey.org/packages/nethack)

[![Software license](https://img.shields.io/badge/License-Nethack-blue.svg)](https://nethack.org/common/license.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v3.6.6.2021125-blue.svg)](https://nethack.org/v366/downloads.html)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/nethack?label=Chocolatey)](https://chocolatey.org/packages/nethack)

NetHack is a single player dungeon exploration game that runs on a wide variety of computer systems, with a variety of
graphical and text interfaces all using the same game engine. Unlike many other Dungeons &amp; Dragons-inspired games,
the emphasis in NetHack is on discovering the detail of the dungeon and not simply killing everything in sight - in
fact, killing everything in sight is a good way to die quickly. Each game presents a different landscape - the random
number generator provides an essentially unlimited number of variations of the dungeon and its denizens to be
discovered by the player in one of a number of characters: you can pick your race, your role, and your gender.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0bf5df88f64a0574fba394651f89a836283b651f/automatic/nethack/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - add desktop shortcuts for Nethack.  By default the shortcuts will be added for all users
e.g. `choco install nethack --package-parameters="/AddToDesktop"`
* `/AddToStartMenu` - add entries to the Start Menu for Nethack.  By default the shortcut will be added for
all users e.g. `choco install nethack --package-parameters="/AddToStartMenu"`
* `/User` - where the user parameter is specified any shortcuts created (using `/AddToDesktop` or `/AddToStartMenu`)
will only be added for the current user
e.g. `choco install nethack --package-parameters="/AddToDesktop /User"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* Two versions of Nethack will be installed by the package - Nethack and Nethack Classic.  The underlying game engine
is the same but Nethack (`NetHack.exe`) presents a Windows interface with graphical tiles while Nethack Classic
(`NetHackW.exe`) provides the traditional console experience
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
