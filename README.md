# pcp-naa
naa(Network Audio Daemon) for picoreplayer

Script to install naa on piCorePlayer 7.x or later version.

Login to piCorePlayer using ssh

* login: `tc`
* password: `piCore`

To install naa, run:

`wget -O - https://raw.githubusercontent.com/lin-silas/pcp-naa/main/naa_install.sh | sh`

If you don't want to autostart naa, you can change in piCorePlayer's web UI.

Choose [Tweaks] -> [User command #1]

Change `/home/tc/naa.sh` to `#/home/tc/naa.sh`
