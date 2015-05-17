#!/bin/sh

LATEST=$(wget -q -O - http://download.virtualbox.org/virtualbox/LATEST.TXT)
LATEST_BETA=$(wget -q -O - http://download.virtualbox.org/virtualbox/LATEST-BETA.TXT)

echo "VirtualBox versions available from repositories:"
echo ""
echo "Ubuntu 12.04 - 4.1.12"
echo "Ubuntu 14.04 - 4.3.10"
echo "Ubuntu 14.10 - 4.3.18"
echo "Ubuntu 15.04 - 4.3.26"
echo ""
echo "Debian wheezy (oldstable) - 4.1.18"
echo "Debian wheezy-backports - 4.3.14"
echo "Debian jessie (stable) - 4.3.18"
echo "Debian stretch (testing) - 4.3.26"
echo ""
echo "Latest release version - $LATEST"
echo "Latest beta version - $LATEST_BETA"
echo ""
read -p "Enter VirtualBox version (e.g. 4.3.26): " PKG_VERSION

if [ -z $PKG_VERSION ] ; then
   echo "no version entered"
   exit 1
fi

make version=$PKG_VERSION
