# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@29b127e2ca776b16ae8749e68f7d9b71f03087a7/icons/jruby.png" width="48" height="48"/>JRuby - The Ruby Programming Language on the JVM](https://chocolatey.org/packages/jruby)

[![GitHub license](https://img.shields.io/badge/license-EPL%20v2.0%20%7C%20GPL%20v2%20%7C%20LGPL%20v2.1-blue)](https://github.com/jruby/jruby/blob/master/COPYING)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v9.3.9.0-blue)](https://github.com/jruby/jruby/releases/tag/9.3.9.0)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/jruby?label=Chocolatey)](https://chocolatey.org/packages/jruby)

JRuby is a 100% Java implementation of the Ruby programming language. It is Ruby for the JVM.

JRuby provides a complete set of core "builtin" classes and syntax for the Ruby language, as well as most of the Ruby
Standard Libraries. The standard libraries are mostly Ruby's own complement of `.rb` files, but a few that depend on
C language-based extensions have been reimplemented.

## Features

* aims to provide a complete, correct and fast implementation of Ruby
* concurrency without a global-interpreter-lock
* true parallelism
* embed a JRuby interpreter into any Java application
* tight integration with the Java language to allow the use of Java classes in your Ruby program
* full two-way access between Java and Ruby code

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@d4bd3c3759406a1c76caf7e507d448c06d066eb6/automatic/jruby/screenshot.png)

## Package Parameters

* `/AddToDesktop` - adds a desktop shortcut for the JRuby IRB Console
e.g. `choco install -y jruby --package-parameters="/AddToDesktop"`
* `/InstallDir` - sets the directory in which to install JRuby.  The installation defaults to `C:\Tools\jrubyXY` where XY are the major and minor version parts
e.g. `choco install -y jruby --package-parameters="/InstallDir:C:\Tools\jruby"`
* `/NoPath` - do not add the jruby bin folder to the user PATH
e.g. `choco install -y jruby --package-parameters="/NoPath"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* Requires an installation of Java SE 1.8+ to be available on the machine.
* The user path will be updated by the installation unless explicitly suppressed using the `/NoPath` option.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
