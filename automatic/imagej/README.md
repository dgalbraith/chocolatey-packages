# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@a306a1daa4f210fa0a5421f2a3c996804629256a/icons/imagej.png" width="48" height="48" />ImageJ - Image Processing and Analysis in Java](https://chocolatey.org/packages/imagej)

[![Software license](https://img.shields.io/badge/License-Public%20Domain-brightgreen.svg)](https://imagej.nih.gov/ij/disclaimer.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v1.53-blue)](http://wsr.imagej.net/distros/win/ij152-win-java8.zip)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/imagej?label=Chocolatey)](https://chocolatey.org/packages/imagej)

Public domain software for processing and analyzing scientific images – a.k.a. ImageJ 1.x.

## Features

* Display, edit, analyze, process, save, and print 8-bit color and grayscale, 16-bit integer, and 32-bit
floating point images

* Read many image file formats, including TIFF, PNG, GIF, JPEG, BMP, DICOM, and FITS, as well as raw formats

* Supports image stacks, a series of images that share a single window, and it is multithreaded, so
time-consuming operations can be performed in parallel on multi-CPU hardware

* Calculate area and pixel value statistics of user-defined selections and intensity-thresholded objects

* Measure distances and angles

* Create density histograms and line profile plots

* Supports standard image processing functions such as logical and arithmetical operations between images,
contrast manipulation, convolution, Fourier analysis, sharpening, smoothing, edge detection, and median
filtering

* Geometric transformations such as scaling, rotation, and flips

* Supports any number of images simultaneously, limited only by available memory

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@3d96ff972ea781c5e7ddf915b56f74c7b4baf5a4/automatic/imagej/screenshot.png)

## Package Parameters

The following package parameter can be set:

* `/AddToDesktop`   - add a desktop shortcut for ImageJ. By default the shortcut will be added for all users
* `/AddToStartMenu` - add a start menu entry for ImageJ. By default the shortcut will be added for all users

eg. `choco install -y imagej --package-parameters="/AddToDesktop /AddToStartMenu"`

* `/User`           - where the user parameter is specified any shortcuts created (`/AddToDesktop`, `/AddToStartMenu`)
will only be added for the current user

eg. `choco install -y imagej --package-parameters="/AddToDesktop /AddToStartMenu /User"`

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
