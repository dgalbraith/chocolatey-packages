# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@35b12b29a0d812446e72152623467d25daf0d7c6/icons/sqlite.png" width="48" height="48" />SQLite Shell](https://chocolatey.org/packages/sqlite.shell)

[![Software License](https://img.shields.io/badge/License-Public%20Domain-brightgreen.svg)](https://sqlite.org/copyright.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v3.50.4-blue)](https://sqlite.org)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sqlite.shell?label=Chocolatey)](https://chocolatey.org/packages/sqlite.shell)

SQLite Shell is a command-line shell that allows the user to manually enter and execute SQL statements against an SQLite database.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@35b12b29a0d812446e72152623467d25daf0d7c6/automatic/sqlite.shell/screenshot.png)

## Notes

* Current versions of sqlite shell provide 64-bit support only - for a 32-bit version use [sqlite.shell 3.43.2](https://chocolatey.org/packages/sqlite.shell/3.43.2).

  ```powershell
  choco install sqlite.shell --version 3.43.2
  choco pin add -n=sqlite.shell --version 3.43.2
  ```

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
