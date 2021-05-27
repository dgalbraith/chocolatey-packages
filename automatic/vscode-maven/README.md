# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@df6a42399764d6755fc05671a467f4fea2904d74/icons/vscode-maven.png" width="48" height="48" />Maven for Java VSCode Extension](<https://chocolatey.org/packages/vscode-maven>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-maven)](https://github.com/microsoft/vscode-maven/blob/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/vscjava.vscode-maven?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-maven)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-java?label=Chocolatey)](<https://chocolatey.org/packages/vscode-maven>)

Maven extension for VS Code. It provides a project explorer and shortcuts to execute Maven commands, improving user experience for Java developers who use Maven.

## Features

* Support to generate projects from Maven Archetype.
* Support to generate effective POM.
* Provide shortcuts to common goals, plugin goals and customized commands.
* Preserve command history to fast re-run.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@df6a42399764d6755fc05671a467f4fea2904d74/automatic/vscode-maven/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.56.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
