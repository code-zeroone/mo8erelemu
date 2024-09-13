#!/bin/sh
echo '======================================================'
echo '                                              		'
echo '           SCript BY- BAHAA LINUXCODE/n               '
echo '                               						'
echo '======================================================'
opkg install libcurl4
wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/uy61gjt6xku6g136neelh/enigma2-plugin-softcams-gosatplus_all.ipk?rlkey=k6ryhgwz8v767unqyhh80nuly&st=iwhsrff0&dl=0" -O /tmp/enigma2-plugin-softcams-gosatplus_all.ipk
opkg remove  --force-remove --force-depends enigma2-plugin-softcams-gosatplus
opkg install --force-reinstall --force-depends /tmp/enigma2-plugin-softcams-gosatplus_all.ipk
rm -f /tmp/enigma2-plugin-softcams-gosatplus_all.ipk
echo '=================================================='
echo '           INSTALL PLUGIN\n               '
echo '=================================================='
wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/c2dgmne5zs1icoowto5ug/enigma2-plugin-softcams-gosatplus_all.ipk?rlkey=36lsj96fu347g5z0wijvr29mf&st=pgv9cuch&dl=0" -O /tmp/GosatPlus_plugin.tar.gz
tar -xf /tmp/GosatPlus_plugin.tar.gz -C /tmp/
rm -r /usr/lib/enigma2/python/Plugins/Extensions/GosatPlus
cp -r /tmp/GosatPlus /usr/lib/enigma2/python/Plugins/Extensions
rm -f /tmp/GosatPlus_plugin.tar.gz
rm -r /tmp/GosatPlus
echo '=================================================='
echo '           Activate Server\n               '
echo '=================================================='
mac=$(ifconfig eth0 | awk '/HWaddr/ {print $5}')
# Create the URL
macUrl="https://api.qrserver.com/v1/create-qr-code/?size=512x512&data=https://e2.gosatplus.com/V3?id=${mac}"
# Download the QR code image
wget --no-check-certificate "$macUrl" -O /usr/lib/enigma2/python/Plugins/Extensions/GosatPlus/qr.png
echo '=================================================='
echo '           SCript BY- BAHAA LINUXCODE\n               '
echo '*              Power cam successfully installed                *'
echo '*                    RESTARTING... Box                         *'
echo '=================================================='
init 4
sleep 2
init 3
exit 0
