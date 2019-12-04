# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@003fee8d66c6e11583d5d142c9670f419e859d15/icons/vscode-java-debug.png" width="48" height="48" />Debugger for Java VSCode Extension](<https://chocolatey.org/packages/vscode-java-debug>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-java-debug)](https://raw.githubusercontent.com/microsoft/vscode-java-debug/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/vscjava.vscode-java-debug?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-java-debug?label=Chocolatey)](<https://chocolatey.org/packages/vscode-java-debug>)

A lightweight Java Debugger based on [Java Debug Server](https://github.com/Microsoft/java-debug) which extends the [Language Support for Java by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.java). It allows users to debug Java code using Visual Studio Code (VS Code).

## Features

* Launch/Attach
* Breakpoints/Conditional Breakpoints/Logpoints
* Exceptions
* Pause & Continue
* Step In/Out/Over
* Variables
* Callstacks
* Threads
* Debug console
* Evaluation
* Hot Code Replace

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@003fee8d66c6e11583d5d142c9670f419e859d15/automatic/vscode-java-debug/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.32.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
