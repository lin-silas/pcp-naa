#!/bin/sh
sudo /usr/local/etc/init.d/squeezelite  stop
ps ax | awk '/[s]queezelite/ { print $1 }' | xargs sudo kill
networkaudiod &
sleep 3
sudo taskset -p 0x00000008 $(pgrep networkaudiod*)
