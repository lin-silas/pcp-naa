#!/bin/busybox ash

. /etc/init.d/tc-functions
. /var/www/cgi-bin/pcp-functions

useBusybox
TARGET=`cat /etc/sysconfig/backup_device`
cd /mnt/$TARGET
sed -i '/naa_arm64.tcz/d' onboot.lst
echo naa_arm64.tcz >>onboot.lst
cd optional
tce-load -i ca-certificates.tcz
wget https://raw.githubusercontent.com/lin-silas/pcp-naa/main/naa_arm64.tcz

sed -i '11,$d' /opt/bootlocal.sh
if [ `grep -c 'naa' /opt/bootlocal.sh` -eq 0 ]
then
  cat << 'EOL' >> /opt/bootlocal.sh
#--- Add by lin-silas
sudo /usr/local/etc/init.d/squeezelite  stop
networkaudiod &
sleep 3
sudo taskset -p 0x00000008 $(pgrep networkaudiod*)
#--- Add by lin-silas
EOL
fi

# tc home
cd ~
wget https://raw.githubusercontent.com/lin-silas/pcp-naa/main/naa.sh
wget https://raw.githubusercontent.com/lin-silas/pcp-naa/main/sq.sh
sudo chmod +x *.sh

echo "Rebooting..."
sleep 3
pcp br
