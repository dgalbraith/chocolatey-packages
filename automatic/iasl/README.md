# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@fe977f362ae69c7f6ab164f87a9223d36538d3ed/icons/iasl.png" width="48" height="48" />iASL Compiler and ACPI Tools](https://community.chocolatey.org/packages/iasl)

[![Software license](https://img.shields.io/badge/license-Intel-lightgrey.svg)](https://www.intel.com/content/www/us/en/developer/articles/license/acpica-licensing.html)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/source-v2024.03.21-blue.svg)](https://www.intel.com/content/www/us/en/download/774881/acpi-component-architecture-downloads-windows-binary-tools.html)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/iasl?label=Chocolatey)](https://community.chocolatey.org/packages/iasl)

The iASL compiler/disassembler is a fully-featured translator for the ACPI Source Language (ASL) and ACPI
binary data tables. As part of the Intel ACPI Component Architecture, the Intel ASL compiler implements
translation for the ACPI Source Language (ASL) to the ACPI Machine Language (AML). The disassembler feature
will disassemble compiled AML code back to (near-original) ASL source code.

## Features

The major features of the iASL compiler include:

* Full support for the ACPI 5.1 Specification including ASL grammar elements and operators.
* Extensive compiler syntax and semantic error checking, especially in the area of control methods.
This reduces the number of errors that are not discovered until the AML code is actually interpreted
(i.e. the compile-time error checking reduces the number of run-time errors).
* An integrated preprocessor provides C-compatible preprocessor directives and conditional compilation
directives such as #define, #if, #ifdef, #else, etc.
* Multiple types of output files. Besides binary ACPI tables, output options include formatted listing
files with intermixed source, several types of AML files, and error messages.
* Automatic detection and compilation of either ASL source code or ACPI data table source code.
* Portable code (ANSI C) and source code availability allows the compiler to be easily ported and run
on multiple execution platforms.
* Support for integration with the Microsoft Visual C++ (or similar) development environments.
* Disassembly of all ACPI tables, including tables that contain AML (DSDT, SSDT) as well as ACPI “data”
tables such as the FADT, MADT, SRAT, etc.
* Support for compilation of non-AML data tables such as the FADT, MADT, SRAT, etc.
* Support for ASL language extensions that support symbolic math/logical operators and expressions.

![screenshot](https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@fe977f362ae69c7f6ab164f87a9223d36538d3ed/automatic/iasl/screenshot.png)

## Notes

* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
