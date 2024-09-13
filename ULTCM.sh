#!/bin/sh
echo '======================================================'
echo '                                              		'
echo '           SCript BY- BAHAA LINUXCODE/n               '
echo '                               						'
echo '======================================================'
wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/o6nx6v0gpjqvjqnclxcfz/enigma2-plugin-softcams-ultracam.ipk?rlkey=66zlbf2vswn8g9uzsyn4mgvix&st=8nxtolrs&dl=0" -O /tmp/enigma2-plugin-softcams-ultracam.ipk
opkg remove  --force-remove --force-depends enigma2-plugin-softcams-ultracam
opkg install --force-reinstall --force-depends /tmp/enigma2-plugin-softcams-ultracam.ipk
rm -f /tmp/enigma2-plugin-softcams-ultracam.ipk
echo '=================================================='
echo '           SCript BY- BAHAA LINUXCODE\n               '
echo '*              Power cam successfully installed                *'
echo '*                    RESTARTING... Box                         *'
echo '=================================================='
exit 0