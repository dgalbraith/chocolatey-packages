# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ed7c4cc026f0f3a9f578dddea34adee6e38e45f0/icons/kyma-cli.png" width="48" height="48"/>Kyma CLI - Install, Manage and Test Kyma](<https://chocolatey.org/packages/kyma-cli>)

[![GitHub license](https://img.shields.io/github/license/kyma-project/kyma-cli)](https://github.com/kyma-project/cli/blob/master/LICENCE/)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/version-2.0.0-blue)](https://github.com/kyma-project/cli/releases/tags/2.0.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/kyma-cli?label=Chocolatey)](https://chocolatey.org/packages/kyma-cli)

Kyma CLI is a command line tool which supports Kyma developers. It provides a set of commands you can use to install, manage, and test Kyma.

## Features

* Generates and displays the bash or zsh completion script
* Launches the Kyma dashboard in a browser window
* Creates a system on the Kyma cluster with the specified name
* Deploys Kyma on a cluster based on the current or specified release
* Imports certificates to local certificates storage or adds domains to the local host file
* Provisions a new cluster on a platform of your choice. Currently, this command supports cluster provisioning on GCP, Azure, Gardener, and k3d
* Shows the cluster version and the Kyma CLI version
* Creates, applies and synchronizes local resources for you Function in the Kyma cluster
* Runs a Function in Docker from local sources
* [DEPRECATED] Runs and manages tests on a provisioned Kyma cluster. Using child commands, you can run tests, view test definitions, list and delete test suites, display test status, and fetch the logs of the tests

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ed7c4cc026f0f3a9f578dddea34adee6e38e45f0/automatic/kyma-cli/screenshot.png)

## Prerequisites

Kyma CLI requires the following software:

* [kubectl](https://github.com/kubernetes/kubectl)
* [k3d](https://www.chocolatey.org/packages/k3d)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
