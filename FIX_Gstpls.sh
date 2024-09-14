#!/bin/sh
mac=$(ifconfig eth0 | awk '/HWaddr/ {print $5}')
macUrl="https://api.qrserver.com/v1/create-qr-code/?size=512x512&data=https://e2.gosatplus.com/V3?id=${mac}"

chmod 755 /usr/bin/gosatplus_v3
chmod 755 /etc/init.d/softcam.GosatPlusV3.0
chmod 755 /etc/GosatPlusV3.0.emu

echo "#########################################################"
echo "#          GosatPlus V3.0  installed successfully       #"
echo "#########################################################"
echo "#           YOUR STB WILL RESTART NOW                   #"
echo "#########################################################"
# reboot


