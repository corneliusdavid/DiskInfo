# README #

## DiskInfoLib ##

A small library of .NET's System.IO.DiskInfo routines simplified for use by a web service.
* Compiles to DiskInfoLibrary.dll

## TestDiskInfoConsole ##

A console application to test DiskInfoLib.
* Compiles to TestDiskInfoConsole.exe, no command-line parameters needed
* Running the app simply runs through each of the methods available as a demonstration

## DiskInfo (RO server) ##

.NET project with RemObjects SDK using DiskInfoLib that can run as:
* a server in WinForms mode with no parameters
* a server in console mode with /c
* a server that can be installed with /i or uninstalled with /u

When running, it communicatates through the defined RemObjects SDK port via:
* binary under the \bin folder
* SOAP under the \SOAP folder

## DiskInfoClientWPF (RO client) ##

.NET Windows desktop app using WPF for connecting to and testing the DiskInfo server

## DiskInfoClientVCL (RO Client) ##

Delphi XE Windows desktop app using VCL for connecting to and testing the DiskInfo server
