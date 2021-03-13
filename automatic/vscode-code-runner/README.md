# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@4fa478d748b9e792ac48216d123cd3f90b3e543b/icons/vscode-code-runner.png" width="48" height="36" />Code Runner VSCode Extension](https://chocolatey.org/packages/vscode-code-runner)

[![GitHub license](https://img.shields.io/github/license/formulahendry/vscode-code-runner)](https://github.com/formulahendry/vscode-code-runner/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/formulahendry.code-runner?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=formulahendry.code-runner)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-code-runner?label=Chocolatey)](https://chocolatey.org/packages/vscode-code-runner)

The Code Runner extension provides support for executing code snippets or files for multiple languages:

*C, C++, Java, JavaScript, PHP, Python, Perl, Perl 6, Ruby, Go, Lua, Groovy, PowerShell, BAT/CMD, BASH/SH, F# Script, F# (.NET Core), C# Script, C# (.NET Core), VBScript, TypeScript, CoffeeScript, Scala, Swift, Julia, Crystal, OCaml Script, R, AppleScript, Elixir, Visual Basic .NET, Clojure, Haxe, Objective-C, Rust, Racket, Scheme, AutoHotkey, AutoIt, Kotlin, Dart, Free Pascal, Haskell, Nim, D, Lisp, Kit, V, SCSS, Sass, CUDA, Less,* and custom commands

## Features

* Run code file of current active Text Editor
* Run code file through context menu of file explorer
* Run selected code snippet in Text Editor
* Run code per Shebang
* Run code per filename glob
* Run custom command
* Stop code running
* View output in Output Window
* Set default language to run
* Select language to run
* Support REPL by running code in Integrated Terminal

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@4fa478d748b9e792ac48216d123cd3f90b3e543b/automatic/vscode-code-runner/screenshot.gif)

## Notes

* This package requires Visual Studio Code 1.54.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.f you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
