#!/bin/sh
sudo /usr/local/etc/init.d/squeezelite  stop
networkaudiod &
sleep 3
sudo taskset -p 0x00000008 $(pgrep networkaudiod*)
