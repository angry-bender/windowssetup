# windowssetup

## Pre-Requisites
Choclatey install

`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

## Description

Will install Common packages and basic windows defender config for a variety of PC's. Including a beta for Windows 11

It will also install sysmon, which gives enhanced event logs if you want to configure it, Id recommend the following 

https://github.com/olafhartong/sysmon-modular

and remove DNS / File Create, then follow the instuctions.

You might also want to increase your Event log sizes if you are doing GPO lockdowns as well.

## Usage

1. Install Choclatey
2. Select The PS1 for your system
3. Install the optional Get-Terminal, an experimental script

## Win11 Usage

1. Install winget https://docs.microsoft.com/en-us/windows/package-manager/winget/
2. Run the Script
3. Install sysmon manually (Until package update)