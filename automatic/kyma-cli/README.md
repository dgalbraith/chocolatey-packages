# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ed7c4cc026f0f3a9f578dddea34adee6e38e45f0/icons/kyma-cli.png" width="48" height="48"/>Kyma CLI - Install and Manage Kyma](<https://chocolatey.org/packages/kyma-cli>)


[![GitHub license](https://img.shields.io/github/license/kyma-project/kyma-cli)](https://github.com/kyma-project/cli/blob/master/LICENCE/)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/version-2.0.0-blue)](https://github.com/kyma-project/cli/releases/tags/2.0.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/kyma-cli?label=Chocolatey)](https://chocolatey.org/packages/kyma-cli)

Kyma CLI is a command line tool that supports Kyma developers. It provides a set of commands you can use to install and manage Kyma.


## Features

* Cluster Management
  * Installs and updates Kyma on a Kubernetes cluster supporting custom configuration
  * Shows the cluster version and the Kyma CLI version
* Local Environment
  * Provisions a local K3D cluster
  * Launches the Kyma dashboard in a browser window
  * Imports certificates to local certificates storage
  * Generates hosts file entries
* Serverless support
  * Creates, applies and synchronizes local resources to Functions in a Kyma cluster
  * Runs a Function in Docker from local sources

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ed7c4cc026f0f3a9f578dddea34adee6e38e45f0/automatic/kyma-cli/screenshot.png)

## Prerequisites

To use Kyma CLI, you must install the following software:


* [kubectl](https://github.com/kubernetes/kubectl)
* [k3d](https://www.chocolatey.org/packages/k3d)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
