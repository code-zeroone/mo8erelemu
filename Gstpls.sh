#!/bin/sh

# remove old version if any
chmod 777 /usr/bin/gosatplus_v3
chmod 777 /etc/init.d/softcam.GosatPlusV3.0
chmod 777 /etc/GosatPlusV3.0.emu
rm -f /usr/bin/gosatplus_v3 >/dev/null 2>&1
rm -f /etc/init.d/softcam.GosatPlusV3.0 >/dev/null 2>&1
rm -f /etc/GosatPlusV3.0.emu >/dev/null 2>&1
rm -r /usr/lib/enigma2/python/Plugins/Extensions/GosatPlus >/dev/null 2>&1

wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/aw52a5aawp19l61gi9hs6/GoSAT_plus_v3.tar.gz?rlkey=4qnek2c41xchgicocy0tz56yo&st=lae6v1ks&dl=0" -O /tmp/GoSAT_plus_v3.tar.gz
tar -xf  /tmp/GoSAT_plus_v3.tar.gz -C /
rm -f /tmp/GoSAT_plus_v3.tar.gz

mac=$(ifconfig eth0 | awk '/HWaddr/ {print $5}')

# Create the URL
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


