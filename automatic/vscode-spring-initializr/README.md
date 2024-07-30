# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@b2402666e13f1a1b2fad12a6f3408e71de668fe3/icons/vscode-spring-initializr.png" width="48" height="48" /> Spring Initializr VSCode Extension](<https://chocolatey.org/packages/vscode-spring-initializr>)

[![GitHub license](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/microsoft/vscode-spring-initializr/blob/master/LICENSE.txt)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/vscjava.vscode-spring-initializr?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=vscjava.vscode-spring-initializr)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-spring-initializr?label=Chocolatey)](<https://chocolatey.org/packages/vscode-spring-initializr>)

Spring Initializr is a lightweight extension to quickly generate a Spring Boot project in Visual Studio Code (VS Code). It helps you to customize your projects with configurations and manage Spring Boot dependencies.

## Features

* Generate a Maven/Gradle Spring Boot project
* Customize configurations for a new project (language, group id, artifact id, boot version and dependencies)
* Search for dependencies
* Quickstart with last settings
* Edit Spring Boot dependencies of an existing Spring Boot project

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@b2402666e13f1a1b2fad12a6f3408e71de668fe3/automatic/vscode-spring-initializr/screenshot.png)

## Notes

* A JDK (version 1.8.0 or later) is required.
* This package requires Visual Studio Code 1.75.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
