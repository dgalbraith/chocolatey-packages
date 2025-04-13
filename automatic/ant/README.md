# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@170f8cefaff042f0fb37731acc25ce804e878d88/icons/ant.png" width="48" height="48" />Apache Ant](https://chocolatey.org/packages/ant)

[![Software license](https://img.shields.io/badge/License-Apache%202.0-green.svg)](https://github.com/apache/ant/blob/master/LICENSE)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.10.15-blue.svg)](https://ant.apache.org/bindownload.cgi)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/ant?label=Chocolatey)](https://chocolatey.org/packages/ant)

[Apache Ant](https://ant.apache.org/index.html) is a Java library and command-line tool whose mission is to drive processes described in build files as targets and extension points dependent upon each other. The main known usage of Ant is the build of Java applications. Ant supplies a number of built-in tasks allowing to compile, assemble, test and run Java applications. Ant can also be used effectively to build non Java applications, for instance C or C++ applications. More generally, Ant can be used to pilot any type of process which can be described in terms of targets and tasks.

Ant is written in Java. Users of Ant can develop their own "antlibs" containing Ant tasks and types, and are offered a large number of ready-made commercial or open-source "antlibs".

Ant is extremely flexible and does not impose coding conventions or directory layouts to the Java projects which adopt it as a build tool.

Software development projects looking for a solution combining build tool and dependency management can use Ant in combination with [Apache Ivy](https://ant.apache.org/ivy/).

The Apache Ant project is part of the [Apache Software Foundation](https://www.apache.org/).

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@170f8cefaff042f0fb37731acc25ce804e878d88/automatic/ant/screenshot.png)

## Package Parameters

* `/User` - override the default behaviour and set the `ANT_HOME` environment variable for the current user only.
  e.g. `choco install -y ant --package-parameters="/User"`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* Ant requires a Java Development Kit to be installed and available on the path.  A minimum of Java 8 is required.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
