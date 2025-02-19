# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@35b12b29a0d812446e72152623467d25daf0d7c6/icons/sqlite.png" width="48" height="48" />SQLite Analyzer](https://chocolatey.org/packages/sqlite.analyzer)

[![Software License](https://img.shields.io/badge/License-Public%20Domain-brightgreen.svg)](https://sqlite.org/copyright.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v3.49.1-blue)](https://sqlite.org)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sqlite.analyzer?label=Chocolatey)](https://chocolatey.org/packages/sqlite.analyzer)

SQLite Analyzer is a command-line utility program that measures and displays how much and how efficiently space is used
by individual tables and indexes with an SQLite database file.

The `sqlite3_analyzer.exe` binary is a command-line utility program that measures and displays how much and how
efficiently space is used by individual tables and indexes with an SQLite database file. Example usage:

```posh
sqlite3_analyzer database.sqlite
```

The output is a human-readable ASCII text report that provides information on the space utilization of the database
file. The report is intended to be self-explanatory, though there is some additional explanation of the various
parameters reported toward the end of the report.

The output is also valid SQL. Most of the report text is contained within a header comment, with various SQL statements
that create and initialize a database at the end of the report.

The constructed database contains the raw data from which the report was extracted. Hence the original report can be
read into an instance of the command-line shell and then the raw data can be queried to dig deeper into the space
utilization of a particular database file.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@cfec165034cc237b21940613a9d68a4ee601edc2/automatic/sqlite.analyzer/screenshot.png)

## Notes

* The `sqlite3_analyzer.exe` program is a [TCL](http://www.tcl.tk/) program that uses the [dbstat virtual table](https://www.sqlite.org/dbstat.html)
  to gather information about the database file and then format that information neatly.
* Current versions of sqlite analyzer provide 64-bit support only - for a 32-bit version use [sqlite.analyzer 3.43.2](https://chocolatey.org/packages/sqlite.analyzer/3.43.2).

  ```powershell
  choco install sqlite.analyzer --version 3.43.2
  choco pin add -n=sqlite.analyzer --version 3.43.2
  ```

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
