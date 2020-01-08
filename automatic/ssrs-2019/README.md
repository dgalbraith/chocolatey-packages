# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@7b581b8f8d5d9c933b4dad49d2c9966f3c5bf5e5/icons/ssrs-2019.png" width="48" height="48" />Microsoft SQL Server 2019 Reporting Services](<https://chocolatey.org/packages/ssrs-2019>)

[![Software license](https://img.shields.io/badge/license-proprietary-lightgrey)](https://www.microsoft.com/sql-server/sql-server-2019-pricing/)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://github.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/version-15.0.7243.37714-blue)](https://www.microsoft.com/download/details.aspx?id=100122)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/ssrs-2019?label=Chocolatey)](https://chocolatey.org/packages/ssrs-2019)

SQL Server Reporting Services (SSRS) provides a set of on-premises tools and services that create, deploy, and manage mobile and paginated reports.

## Features

* **"Traditional" paginated reports** so you can create modern-looking reports, with updated tools and new features for creating them.
* **New mobile reports** with a responsive layout that adapts to different devices and the different ways you hold them.
* **A modern web portal** you can view in any modern browser. In the new portal, you can organize and display mobile and paginated Reporting Services reports and KPIs. You can also store Excel workbooks on the portal.

## Package Parameters

* `/log <file>` specifies the setup log file location.  By default log files are created under `%TEMP%`.
    > Example: `/log log.txt`
* `/InstallFolder` sets the install folder.
    > Default: `"C:\Program Files\Microsoft SQL Server Reporting Services"`\
    > Example: `choco install -y ssrs-2019 --package-parameters='"/InstallFolder:"'C:\Program Files\SSRS'""'`
* `/PID` sets the custom license key.
    > Example: `choco install -y ssrs-2019 --package-parameters='"/PID:12345-12345-12345-12345-12345"'`
* `/Edition` sets the custom free edition.  Options are `Dev`, `Eval`, or `ExprAdv`.
    > Default: `Eval`\
    > Example: `choco install -y ssrs-2019 --package-parameters='"/Edition:Dev"'`
* `/EditionUpgrade` upgrades the edition of the installed product.  Required `/PID` or `/Edition` flag.
    > Example: `choco install -y ssrs-2019 --package-parameters='"/EditionUpgrade /Edition:Dev"'`\
    > Example: `choco install -y ssrs-2019 --package-parameters='"/EditionUpgrade /PID:PID:12345-12345-12345-12345-12345"'`

## Notes

* The Microsoft SQL Server Reporting Services package requires:
  * .NET Framework 4.7 or newer
  * A SQL Server Database Engine (2008 R3 SP3 or later), to store the report server database
* You do not need a SQL Server Database Engine server available at the time of install. You will need one to configure Reporting Services after install.
* Supported operating systems are Windows Server 2019, Windows Server 2016 and Windows 10.
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
  If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
