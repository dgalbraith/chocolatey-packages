# [<img src="https://cdn.jsdelivr.net/gh/dgalbraith/chocolatey-packages@ad774ac1b3b8812daa6ce89e0dbeab2ecf91dbf1/icons/mssqlserver.png" width="48" height="48" />Microsoft SQLServer Compact 4.0 with SP1](https://chocolatey.org/packages/mssqlserver-compact4.0)

[![Software License](https://img.shields.io/badge/license-proprietary-lightgrey)](https://www.microsoft.com/download/details.aspx?id=30709)
[![Maintenance status](https://img.shields.io/badge/maintained%3F-yes-green.svg)](https://gitHub.com/dgalbraith/chocolatey-packages/graphs/commit-activity)
[![Software version](https://img.shields.io/badge/Source-v4.0.8876.1-blue.svg)](https://www.microsoft.com/download/details.aspx?id=30709)
[![Chocolatey package version](https://img.shields.io/chocolatey/v/go-fonts?label=Chocolatey)](https://chocolatey.org/packages/mssqlserver-compact4.0)

Microsoft SQL Server Compact 4.0 is a free, embedded database that software developers can use for building ASP.NET
websites and Windows desktop applications. SQL Server Compact 4.0 has a small footprint and supports private
deployment of its binaries within the application folder, easy application development in Visual Studio and
WebMatrix, and seamless migration of schema and data to SQL Server.

## Features

* Default database for Microsoft WebMatrix, which is a stack of web technologies for easily building and deploying
  websites on the Windows platform
* Visual Studio can be used to develop ASP.NET web applications and websites using SQL Server Compact 4.0
* Enabled to work in the medium or partial trust environments in the web servers, and can be easily deployed along with
  the website to the third party website hosting service providers
* Private deployment of SQL Server Compact further simplified by having all the required managed assemblies, and the
  x86 and x64 DLLs, including the Visual C++ 2008 runtime libraries (x86 and x64) SP1 in a single private folder in the
  install location of SQL Server Compact
* Stronger data security with the use of the SHA2 encryption algorithms for encrypting the databases
* T-SQL syntax enhancement by adding support for OFFSET and FETCH that can be used to write paging queries and new APIs
* like SqlCeConnection.GetSchema that provides the metadata information of the database
* Used with ADO.NET Entity Framework, SQL Server Compact now supports the columns that have server generated keys like
  identity, rowguid etc. and the code-first programming model

## Package Parameters

The `language` package parameter can be set to install the package with the specified language.  If no language is
specified the install will default to English.

* `/language=[language-code]` - installs the package using the specified language.  Supported languages are:
  * br - Brazilian (Portuguese) - `--params '"/language=br"'`
  * cz - Czech - `--params '"/language=cz"'`
  * de - German - `--params '"/language=de"'`
  * en - English - `--params '"/language=en"'`
  * es - Spanish - `--params '"/language=es"'`
  * fr - French - `--params '"/language=fr"'`
  * it - Italian - `--params '"/language=it"'`
  * ja - Japanese - `--params '"/language=ja"'`
  * ko - Korean - `--params '"/language=ko"'`
  * pl - Polish - `--params '"/language=pl"'`
  * ru - Russian - `--params '"/language=ru"'`
  * tr - Turkish - `--params '"/language=tr"'`
  * zh - Chinese (Simplified) - `--params '"/language=zh"'`
  * zh-CN - Chinese (Simplified) - `--params '"/language=zh-CN"'`
  * zh-TW - Chinese (Tradition) - `--params '"/language=gz-TW"'`

For example: `choco install mssqlserver-compact4.0 --params '"/language=fr"'` to install the French version of the package

## Notes

* This package is manually updated
* SQL Server compact edition was deprecated in February 2013
* Although no new versions or updates are planned extended support is available through to July 2021
* If the package does not represent the latest version please contact the maintainer(s) and let them know the package requires updating
