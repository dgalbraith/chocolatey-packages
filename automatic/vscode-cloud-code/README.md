# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@edf2228388178bdda72db56ab68b5ef8ae7e1359/icons/vscode-cloud-code.png" width="48" height="48" />Cloud Code VSCode Extension](<https://chocolatey.org/packages/vscode-cloud-code>)

[![Software license]https://img.shields.io/badge/license-Proprietary-lightgrey)](https://cloud.google.com/terms/plugins/)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/GoogleCloudTools.cloudcode?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=GoogleCloudTools.cloudcode)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-cloud-code?label=Chocolatey)](https://chocolatey.org/packages/vscode-cloud-code)

Cloud Code for VS Code extends VS Code to bring all the power and convenience of IDEs to developing cloud-native Kubernetes applications. With Google’s command-line [container tools](https://github.com/GoogleContainerTools) like [skaffold](https://skaffold.dev/) and [kubectl](https://kubernetes.io/docs/tasks/tools/install-kubectl/) under the hood, Cloud Code gives you local, continuous feedback on your project as you build it, extending this local edit-compile-debug loop to create cloud-native Kubernetes environments, on your workstation or in the cloud. Support for [deployment profiles](https://skaffold.dev/docs/how-tos/profiles/) lets you define different environments, like local development, shared development, test, or production, so you can easily test and debug on your workstation or in the cloud.

## Features

* Support for Go, Node, Java, and Python
* Rapid Edit, Package, Deploy loop to your K8s cluster
* Integrated Debugging and Log Viewing/Streaming
* Snippets, completions, and linting for K8s artifacts
* Profile support for dev, test and production environments
* Cluster management, resource browsing and inspection of K8s clusters
* Cluster creation supporting Google GKE, Amazon EKS and Azure AKS
* Support for Custom Resources (CRDs) e.g. Istio, KNative
* Automatically uses your Google Cloud SDK credentials

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@edf2228388178bdda72db56ab68b5ef8ae7e1359/automatic/vscode-cloud-code/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.38.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
