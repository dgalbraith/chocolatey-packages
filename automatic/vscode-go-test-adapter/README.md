# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@8b519032ce75071e44d5d46b3ea8ae89dadd8537/icons/vscode-go-test-adapter.png" width="48" height="48" />Go Test Explorer VSCode Extension](https://chocolatey.org/packages/vscode-go-test-adapter)

[![GitLab license](https://img.shields.io/badge/license-MIT-brightgreen)](https://gitlab.com/firelizzard/vscode-go-test-adapter/-/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/ethan-reesor.vscode-go-test-adapter?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=ethan-reesor.vscode-go-test-adapter)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-go-test-adapter?label=Chocolatey)](https://chocolatey.org/packages/vscode-go-test-adapter)

An explorer for Go tests, based on [VS Code Test Explorer](https://marketplace.visualstudio.com/items?itemName=hbenl.vscode-test-explorer).

The Go Test Explorer supports running and debugging tests and benchmarks as
well as profiling the CPU and memory usage of benchmarks. [Profiling](https://golang.org/doc/diagnostics.html#profiling)
is provided by Go and visualization by the [Go PProf](https://golang.org/pkg/net/http/pprof/)
tool.

## Features

* Run and debug tests and benchmarks
* Profile the CPU and memory usage of benchmarks

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@8b519032ce75071e44d5d46b3ea8ae89dadd8537/automatic/vscode-go-test-adapter/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.43.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.f you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
