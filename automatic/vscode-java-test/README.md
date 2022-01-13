# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@8efbf94309d2d79bfe2ec5e0ce26104a36a2d4d2/icons/vscode-java-test.png" width="48" height="48" />Debugger for Java VSCode Extension](<https://chocolatey.org/packages/vscode-java-test>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-java-test)](https://raw.githubusercontent.com/microsoft/vscode-java-test/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/vscjava.vscode-java-test?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-test)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-java-test?label=Chocolatey)](<https://chocolatey.org/packages/vscode-java-test>)

 lightweight extension to run and debug Java test cases in Visual Studio Code. The extension support following test frameworks:

* JUnit 4 (v4.8.0+)
* JUnit 5 (v5.1.0+)
* TestNG (v6.8.0+)

## Features

The [Java Test Runner](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-test) works with [Language Support for Java by Red Hat](https://marketplace.visualstudio.com/items?itemName=redhat.java) and [Debugger for Java](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-java-debug) to provide the following features:

* Run/Debug test cases
* Customize test configurations
* View test report
* View tests in Test Explorer
* Show test logs

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@8efbf94309d2d79bfe2ec5e0ce26104a36a2d4d2/automatic/vscode-java-test/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.63.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
