# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@7b66886c48c75ece0a8c80b175ac993b7d30cff0/icons/sqljdbc.png" width="48" height="48" />Sqljdbc - Microsoft JDBC Driver for SQL Server](https://chocolatey.org/packages/sqljdbc)

[![Software license](https://img.shields.io/badge/License-Proprietary-grey.svg)](https://github.com/microsoft/mssql-jdbc/blob/master/mssql-jdbc_auth_LICENSE)
[![Maintenance status](https://img.shields.io/badge/Maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![AppVeyor build](https://img.shields.io/appveyor/ci/dgalbraith/chocolatey-packages)](https://ci.appveyor.com/project/dgalbraith/chocolatey-packages)
[![Software version](https://img.shields.io/badge/Source-v9.2.1.0-blue.svg)](https://docs.microsoft.com/en-us/sql/connect/jdbc/download-microsoft-jdbc-driver-for-sql-server)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/sqljdbc?label=Chocolatey)](https://chocolatey.org/packages/sqljdbc)

Java Database Connectivity (JDBC) driver for use with SQL Server, and Azure SQL Database. The driver is available at no
extra charge and provides Java database connectivity from any Java application, application server, or Java-enabled
applet. This driver is a Type 4 JDBC driver that provides database connectivity through the standard JDBC application
program interfaces (APIs).

The Microsoft JDBC Driver for SQL Server has been tested against major application servers such as IBM WebSphere, and
SAP NetWeaver.

## Package Parameters

The `Languages` package parameter can be set to install the package with the specified language.  If no language is
specified the install will default to English.

Multiple languages can be installed by providing a comma-separated list of language codes.

* `/Languages=[language-codes]` - installs the package using the specified languages.  The languages must be supplied
as a comma-separated listSupported languages are:

|Language              |Code   |Mapping |Parameters                    |
|----------------------|:-----:|:------:|------------------------------|
Brazilian (Portuguese) | br    | ptb    |`--params "/Languages=br"`
German                 | de    | deu    |`--params "/Languages=de"`
English                | en    | enu    |`--params "/Languages=en"`
Spanish                | es    | esn    |`--params "/Languages=es"`
French                 | fr    | fra    |`--params "/Languages=fr"`
Italian                | it    | ita    |`--params "/Languages=it"`
Japanese               | ja    | jpn    |`--params "/Languages=ja"`
Korean                 | ko    | kor    |`--params "/Languages=ko"`
Russian                | ru    | rus    |`--params "/Languages=ru"`
Chinese (Simplified)   | zh    | chs    |`--params "/Languages=zh"`
Chinese (Simplified)   | zh-CN | chs    |`--params "/Languages=zh-CN"`
Chinese (Traditional)  | zh-TW | cht    |`--params "/Languages=zh-TW"`

For example: `choco install sqljdbc --params "/Languages=en,fr"` to install the English and French versions of the driver

* `/InstallDir` - sets the directory in which to install sqljdbc.  The installation defaults to the system
directory `[Environment]::GetFolderPath('ProgramFiles')\Microsoft JDBC DRIVER for SQL Server`
* `/User` - override the default installation directory and install the driver in the user directory
`[Environment]::GetFolderPath('Programs')\Microsoft JDBC DRIVER for SQL Server`

To have Chocolatey remember parameters on upgrade, be sure to set `choco feature enable -n=useRememberedArgumentsForUpgrades`.

## Notes

* The drivers will be installed under `[InstallDir]\sqljdbc_X.Y\[LanguageMaping]` where `X.Y` represents the
`Major.Minor` versions of the package and `LanguageMapping` is the sub directory representing the mapping for
the default (English - `enu`) or other specified languages
* This package is automatically updated using the [Chocolatey Automatic Package Update Model (AU)](https://github.com/majkinetor/au/blob/master/README.md).
If you find it is out of date by more than a day or two, please contact the maintainer(s) and let them know the package is no longer updating correctly.
