# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@699888431c179087758a7021bed3ea5be50f9611/icons/prime95.png" width="48" height="48" />Great Internet Mersenne Prime Search (GIMPS)](https://chocolatey.org/packages/prime95)

[![Software License](https://img.shields.io/badge/License-Free-green.svg)](https://www.mersenne.org/legal/#EULA)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v30.19.20-blue)](https://www.mersenne.org/download/)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/prime95?label=Chocolatey)](https://chocolatey.org/packages/prime95)

The [Great Internet Mersenne Prime Search (GIMPS)](https://www.mersenne.org) is a collaborative project of volunteers
using the Prime95 client to participate in a distributed computing effort to find [Mersenne Prime numbers](http://www.utm.edu/research/primes/mersenne.shtml).

The Prime95 client can also be used as a stress testing tool.  The Prime95 client includes a "torture test" that places
a heavy computational load on a system.  Continuous computations are run and checked against tolerances while they are
executing with the final results being compared to the known correct answers.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@699888431c179087758a7021bed3ea5be50f9611/automatic/prime95/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop` - this puts a shortcut on your desktop to Prime95.

This parameter can be passed to the installer with the use of `--params`.
For example: `--params '"/AddToDesktop"'`.

To have choco remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* If support for 32-bit Windows XP is required use the legacy version [Prime95 29.8.6](https://chocolatey.org/packages/prime95/29.8.6).

  ```powershell
  choco install prime95 --version 29.8.6
  choco pin pin add -n=prime95 --version 29.8.6
  ```

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
