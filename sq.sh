#!/bin/sh
sudo killall networkaudiod
sudo /usr/local/etc/init.d/squeezelite  start
sudo taskset -p 0x00000008 $(pgrep squeezelite*)
