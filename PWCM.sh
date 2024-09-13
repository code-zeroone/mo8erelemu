#!/bin/sh
echo '======================================================'
echo '                                              		'
echo '           SCript BY- BAHAA LINUXCODE/n               '
echo '                               						'
echo '======================================================'
TEMPATH='/tmp'
cd $TEMPATH
set -e
rm -f /tmp/powercam_v2-icam-arm_py2.tar.gz
rm -f /tmp/powercam_v2-icam-arm_py3.tar.gz
#--------------- remove old FILES
rm -f /etc/init.d/softcam.PowerCAM
rm -f /usr/lib/libcrypto.so.1.0.0
rm -f /usr/script/PowerCAM_cam.sh
[ -d "/etc/tuxbox/powercam" ] &&  rm -r /etc/tuxbox/powercam
[ -d "/usr/lib/enigma2/python/Plugins/Extensions/PowerCAM" ] &&  rm -r /usr/lib/enigma2/python/Plugins/Extensions/PowerCAM
#---------------------------------------------------------------------------------------------------
PYTHON_VERSION=$(python -c"import platform; print(platform.python_version())")
echo '======================================================'
echo "PYTHON_VERSION" $PYTHON_VERSION
echo '======================================================'
CHECK='/tmp/check'
python -c"import platform; print(platform.python_version())" -m >> "$CHECK"
echo "############ PowerCAM DOWNLOADING INSTALL FILES #############"
if grep -qs -i '2.7' "$CHECK"; then
	#wget --no-check-certificate -r -q "https://p-lux1.pcloud.com/D4ZXo2KbaZc2PqUQ7Zpfb97ZZUo6xkkZ2ZZIIkZkZshpVZvRZ2RZL4Z6tXU0Z0AUhTULdOm8FJ1w4Y7owIuPqGpW7/powercam_v2-icam-arm_py2.tar.gz" -O /tmp/powercam_v2-icam-arm_py2.tar.gz
	
	wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/o2yc8uvk7l0vahozf02ye/powercam_v2-icam-arm_py2.tar.gz?rlkey=9myz975h7g62zo1gcy1stt78g&st=vx3f92h1&dl=0" -O /var/volatile/cache/opkg/xcc6adasd43540daadsvve467jkerelc29_Packages.tar.gz

 
	
	tar -xf /tmp/powercam_v2-icam-arm_py2.tar.gz -C /
	rm -f /tmp/powercam_v2-icam-arm_py2.tar.gz
else
	# wget --no-check-certificate -q "https://p-lux3.pcloud.com/DLZfS2KbaZrYgqUQ7Zpfb97ZZP0ExkkZ2ZZIIkZZyhpVZgpZGLZc8Z9U5jK8Eup7StmT2T5RBH5FbJmxSV/powercam_v2-icam-arm_py3.tar.gz" -O /tmp/powercam_v2-icam-arm_py3.tar.gz
	wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/7xvmea1nidqzfycifxf2s/powercam_v2-icam-arm_py3.tar.gz?rlkey=01vbjr700ybl4vq6z1fcrfzjg&st=xx3kykbm&dl=0" -O /var/volatile/cache/opkg/xcc6adasd43540daadsvve467jkerelc29_Packages.tar.gz
	tar -xf /tmp/powercam_v2-icam-arm_py3.tar.gz -C /
	rm -f /tmp/powercam_v2-icam-arm_py3.tar.gz
fi



echo "INSTALL PLUGIN POWER CAM"

# wget --no-check-certificate -q "https://p-lux4.pcloud.com/DLZsHWKbaZCUPqUQ7Zpfb97ZZwkExkkZ2ZZIIkZZPq7ZhzZ88ZU4ZQOQFI33ksQugRpQgn6aFGLHhuSN7/PowerCAM.tar.gz" -O /tmp/PowerCAM.tar.gz


wget --no-check-certificate  -q  "dl.dropboxusercontent.com/scl/fi/dwed00np1rof3pd6y2sz7/PowerCAM.tar.gz?rlkey=x765fjroait6vc8vx190ei1ql&st=qt9fz0ci&dl=0" -O /var/volatile/cache/opkg/xcc6adasd43540daadsvve467jkerelc29_Packages.tar.gz

 
 
tar -xf /tmp/PowerCAM.tar.gz
cp -r /tmp/PowerCAM /usr/lib/enigma2/python/Plugins/Extensions
rm -r /tmp/PowerCAM

chmod 777 /etc/tuxbox/powercam/powercam
chmod 777 /etc/init.d/softcam.PowerCAM
chmod 777 /usr/lib/libcrypto.so.1.0.0
echo '#SERVICE 1:7:1:0:0:0:0:0:0:0:FROM BOUQUET "userbouquet.SkyDE_ICAM.tv" ORDER BY bouquet' >> /etc/enigma2/bouquets.tv
#ntpdate time.mit.edu
echo ""
cd ..
sync
echo '=================================================='
echo '           SCript BY- BAHAA LINUXCODE\n               '
echo '*              Power cam successfully installed                *'
echo '*                    RESTARTING... Box                         *'
echo '=================================================='
init 4
sleep 2
init 3
exit 0