# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@27cefa4e9cecaae41e719fb7ed7564439eb46c46/icons/vscode-java.png" width="48" height="48" />Java™ Language Support VSCode Extension](<https://chocolatey.org/packages/vscode-java>)

[![GitHub license](https://img.shields.io/github/license/redhat-developer/vscode-java)](https://github.com/redhat-developer/vscode-java/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/redhat.java?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=redhat.java)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-java?label=Chocolatey)](<https://chocolatey.org/packages/vscode-java>)

Provides Java™ language support via [Eclipse™ JDT Language Server](<https://github.com/eclipse/eclipse.jdt.ls>), which utilizes [Eclipse™ JDT](<http://www.eclipse.org/jdt>), [M2Eclipse](<http://www.eclipse.org/m2e>) and [Buildship](<https://github.com/eclipse/buildship>).

## Features

* Supports code from Java 1.5 to Java 13
* Maven pom.xml project support
* Basic Gradle Java project support (Android, Java 13 not supported)
* Standalone Java files support
* As-you-type reporting of parsing and compilation errors
* Code completion
* Code/Source actions / Refactoring
* Javadoc hovers
* Organize imports
* Type search
* Code outline
* Code folding
* Code navigation
* Code lens (references/implementations)
* Highlights
* Code formatting (on-type/selection/file)
* Code snippets
* Annotation processing support (automatic for Maven projects)
* Semantic selection
* Diagnostic tags

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@27cefa4e9cecaae41e719fb7ed7564439eb46c46/automatic/vscode-java/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.40.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
