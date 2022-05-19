# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ac9e0ef462b93905584b248422198303de1a4823/icons/kui.png" width="48" height="48" />Kui - CLI Driven Graphics for Kubernetes](https://chocolatey.org/packages/kui)

[![GitHub license](https://img.shields.io/github/license/IBM/kui)](https://github.com/IBM/kui/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v11.5.0-blue.svg)](https://github.com/IBM/kui/releases/tag/v11.5.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/kui?label=Chocolatey)](https://chocolatey.org/packages/kui)

We love CLIs, and think they are critical for interacting in a flexible way with the cloud. We need the power to go off
the rails.  But ASCII is tedious.  Kui takes your normal kubectl command line requests and responds with graphics.
Instead of ASCII tables, you are presented with sortable ones.  Instead of copying and pasting long auto-generated
resource names to drill down, in Kui **you just click**.

Kui enhances your CLI experience, but is also fast.  It launches in 1-2 seconds, and can process standard `kubectl`
commands **2-3 times faster** than `kubectl` itself.

## Features

* Works with any Kubernetes or OpenWhisk provider
* View output from `watch` and `apply` requests in live tables
* Browse facets of your resources in a tabbed UI
* Drill down, drill up and view logs or events related to the resource of interest
* View details from table rows in a side terminal
* Display jobs in a waterfall diagram

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ac9e0ef462b93905584b248422198303de1a4823/automatic/kui/screenshot.png)

## Notes

* Kui only provides a 64-bit application
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
