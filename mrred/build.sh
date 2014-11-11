#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

game="Mr Reds Adventure TMB.tar.gz"
sha256_1=ae0164bfc842a409016518985f8e1f11e07d4730209eb891a36d04135e283049

if [ ! -f "$game" ] ; then
    echo "Can't find '$game'"
    echo "Download the Linux version from https://killmonday.wordpress.com/games-2/mr-reds-adventure-the-missing-balls/"
    exit 1
fi

sha256_2=$(sha256sum "$game" | head -c64)
if [ $sha256_2 != $sha256_1 ] ; then
    echo "$game:"
    echo "SHA256 checksum is $sha256_2 but should be $sha256_1."
    exit 1
fi

#wget "https://killmonday.files.wordpress.com/2013/11/icon_170.png"
#mv icon_170.png mrred.png
wget "http://s14.directupload.net/images/140508/oslo47cn.png"
mv oslo47cn.png mrred.png

tar xzvf "$game"

dpkg-buildpackage -b -us -uc 2>&1 | tee build.log

for f in ../*.deb ; do
  echo "$f:"
  dpkg-deb -I $f
  lintian $f
  echo ""
done 2>&1 | tee -a build.log

for f in ../*.deb ; do
  echo "$f:"
  dpkg-deb -c $f
  echo ""
done 2>&1 | tee -a build.log
