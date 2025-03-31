# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@04c2c097ddd064697ce5d666d0dc3138ac671dbc/icons/vscode-kubernetes-tools.png" width="48" height="48" />Kubernetes Tools VSCode Extension](<https://chocolatey.org/packages/vscode-kubernetes-tools>)

[![GitHub license](https://img.shields.io/github/license/azure/vscode-kubernetes-tools)](https://github.com/Azure/vscode-kubernetes-tools/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Visual Studio Marketplace version](https://img.shields.io/visual-studio-marketplace/v/ms-kubernetes-tools.vscode-kubernetes-tools?label=Marketplace)](https://marketplace.visualstudio.com/items?itemName=ms-kubernetes-tools.vscode-kubernetes-tools)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/vscode-kubernetes-tools?label=Chocolatey)](https://chocolatey.org/packages/vscode-kubernetes-tools)

The extension for developers building applications to run in Kubernetes clusters and for DevOps staff troubleshooting Kubernetes applications.

Works with any Kubernetes anywhere (Azure, Minikube, AWS, GCP and more!).

## Features

* View your clusters in an explorer tree view, and drill into workloads, services, pods and nodes.
* Browse Helm repos and install charts into your Kubernetes cluster.
* Intellisense for Kubernetes resources and Helm charts and templates.
* Edit Kubernetes resource manifests and apply them to your cluster.
* Build and run containers in your cluster from Dockerfiles in your project.
* View diffs of a resource's current state against the resource manifest in your Git repo
* Easily check out the Git commit corresponding to a deployed application.
* Run commands or start a shell within your application's pods.
* Get or follow logs and events from your clusters.
* Forward local ports to your application's pods.
* Create Helm charts using scaffolding and snippets.
* Bootstrap applications using Draft, and rapidly deploy and debug them to speed up the development loop.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@04c2c097ddd064697ce5d666d0dc3138ac671dbc/automatic/vscode-kubernetes-tools/screenshot.png)

## Notes

* This package requires Visual Studio Code 1.98.0 or newer.
  You can install either the [vscode](https://chocolatey.org/packages/vscode) or [vscode-insiders](https://chocolatey.org/packages/vscode-insiders) package.
* The extension will be installed in all editions of Visual Studio Code which can be found.
* While this package installs a specific version of the extension, Visual Studio Code by default will update the extension to the latest version on startup if there's a newer version available on the marketplace.
  See [Extension auto-update](https://code.visualstudio.com/docs/editor/extension-gallery#_extension-autoupdate) for instructions on how to disable auto-update.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
