#!/bin/busybox ash

. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions

useBusybox
TARGET=`cat /etc/sysconfig/backup_device`
cd /mnt/$TARGET
sed -i '/naa_4.2.0-50.tcz/d' onboot.lst
echo naa_arm64.tcz >>onboot.lst
cd optional
tce-load -i ca-certificates.tcz
wget https://raw.githubusercontent.com/lin-silas/pcp-naa/main/naa_4.2.0-50.tcz

# tc home
cd ~
wget https://raw.githubusercontent.com/lin-silas/pcp-naa/main/naa.sh
wget https://raw.githubusercontent.com/lin-silas/pcp-naa/main/sq.sh
sudo chmod +x *.sh
pcp_write_var_to_config USER_COMMAND_1 "/home/tc/naa.sh"

echo "Rebooting..."
sleep 3
pcp br
