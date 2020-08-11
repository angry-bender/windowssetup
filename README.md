# windowssetup

# Pre-Requisites
Choclatey install

`Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))`

# Description
Will install Common packages and basic windows defender config for a variety of PC's. 

It will also install sysmon, which gives enhanced event logs if you want to configure it, Id reccomend the following 

https://github.com/olafhartong/sysmon-modular

and remove DNS / File Create, then follow the instuctions.

You might also want to increase your Event log sizes if you are doing GPO lockdowns as well.

# Usage
1. Install Coclatey
2. Select The PS1 for your system
