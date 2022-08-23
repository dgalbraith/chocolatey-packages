# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@81ac243b44259eb52e3b16c908322bb1a0207810/icons/watchman.png" width="48" height="48" />Watchman - A file watching service](https://chocolatey.org/packages/watchman)

[![GitHub license](https://img.shields.io/github/license/facebook/watchman)](https://github.com/facebook/watchman/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/source-v2022.08.22.00-blue.svg)](https://github.com/facebook/watchman/releases/tag/v2022.08.22.00)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/watchman?label=Chocolatey)](https://chocolatey.org/packages/watchman)

Watchman exists to watch files and record when they change. It can also trigger actions (such as
rebuilding assets) when matching files change.

## Features

* Watchman can recursively watch one or more directory trees (they are called roots)
* Watchman does not follow symlinks. It knows they exist, but they show up the same as any other file in its reporting
* Watchman waits for a root to settle down before it will start to trigger notifications or command execution
* Watchman is conservative, preferring to err on the side of caution; it considers files to be freshly changed when you start to watch them or when it is unsure
* You can query a root for file changes since you last checked, or the current state of the tree
* You can subscribe to file changes that occur in a root

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@81ac243b44259eb52e3b16c908322bb1a0207810/automatic/watchman/screenshot.png)

## Notes

* Watchman is only provided in a 64-bit version
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
