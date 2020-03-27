# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@e40e5a5cd5cb19d59ff6dfc195d74ab6df635b5a/icons/vscode-arduino.png" width="48" height="48" />Arduino VSCode Extension](<https://chocolatey.org/packages/vscode-arduino>)

[![GitHub license](https://img.shields.io/github/license/microsoft/vscode-arduino)](https://github.com/microsoft/vscode-arduino/blob/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/vsciot-vscode.vscode-arduino?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=vsciot-vscode.vscode-arduino)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-arduino?label=Chocolatey)](https://chocolatey.org/packages/vscode-arduino)

The Arduino extension makes it easy to develop, build, deploy and debug your Arduino sketches in Visual Studio Code, with a rich set of functionalities

## Features

* IntelliSense and syntax highlighting for Arduino sketches
* Verify and upload your sketches in Visual Studio Code
* Built-in board and library manager
* Built-in example list
* Built-in serial monitor
* Snippets for sketches
* Automatic Arduino project scaffolding
* Command Palette (F1) integration of frequently used commands (e.g. Verify, Upload...)
* Integrated Arduino debugging

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@e40e5a5cd5cb19d59ff6dfc195d74ab6df635b5a/automatic/vscode-arduino/screenshot.png)

## Notes

* This package requires an Arduino IDE 1.6.x or newer.
  You can install a version using the [Arduino Chocolatey package](https://www.chocolatey.org/packages/arduino) or using the [official distribution](https://www.arduino.cc/en/main/software#download). Note the Windows Store / App version is **not** supported.
* This package requires Visual Studio Code 1.43.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
