# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@acfad5f2b064ccdc27c724a0354fd92a413d05aa/icons/vscode-oracle-devtools.png" width="48" height="48" />Oracle Developer Tolols VSCode Extension](<https://chocolatey.org/packages/vscode-oracle-devtools>)

[![Software license](https://img.shields.io/badge/license-proprietary-lightgrey)](https://marketplace.visualstudio.com/items/Oracle.oracledevtools/license)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/Oracle.oracledevtools?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=Oracle.oracledevtools)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-oracle-devtools?label=Chocolatey)](https://chocolatey.org/packages/vscode-oracle-devtools)

This extension enables editing and execution of SQL and PL/SQL for Oracle Database and Oracle Autonomous Database.

## Features

* Connect to Oracle Database and Oracle Autonomous Database using EZ Connect syntax, TNS connect aliases, or ODP.NET connection strings
* Create and manage connections and track most recently used connections
* Oracle Database Explorer tree control: connect and explore the Oracle schema; view table data; view, edit and save PL/SQL packages, procedures and functions. Run stored procedures and functions with a UI for entering parameter values
* Edit SQL and PL/SQL with autocompletion of schema object names, intellisense, code snippets, and syntax coloring
* Execute SQL and PL/SQL and view and save results

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@82e06bc18df415a03c0782f4891ce74a4ad38a87/automatic/vscode-oracle-devtools/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.51.1 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
