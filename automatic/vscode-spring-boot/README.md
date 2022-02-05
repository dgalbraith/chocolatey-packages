# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0bf6a976385899a2fff0d6c1adb822da42a08d10/icons/vscode-spring-boot.png" width="48" height="48" />Spring Boot Tools VSCode Extension](<https://chocolatey.org/packages/vscode-spring-boot>)

[![Software license](https://img.shields.io/badge/license-EPL--1.0-red)](https://github.com/spring-projects/sts4/blob/master/license.txt)
[![Maintenance status](https://img.shields.io/badge/maintained-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/Pivotal.vscode-spring-boot?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=Pivotal.vscode-spring-boot)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-spring-boot?label=Chocolatey)](https://chocolatey.org/packages/vscode-spring-boot)

VSCode extension and Language Server providing support for working with Spring Boot `application.properties`, `application.yml` and `.java` files.

## Features

* Easy navigation to Spring-specific elements of your source code.
* Easy navigation to the provided request mappings of running apps.
* Live application information hovers
* Write Spring code with templates, available via regular code completion.
* Additional code completions for Spring-specific annotations.
* Validation, code completions and information hovers while editing Spring Boot Properties.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@0bf6a976385899a2fff0d6c1adb822da42a08d10/automatic/vscode-spring-boot/screenshot.png)

## Notes

* This package requires Visual Studio Code >=1.53.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
