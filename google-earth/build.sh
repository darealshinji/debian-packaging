#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

BIN=GoogleEarthLinux.bin
TGZ=patchelfmod.tar.gz

if [ ! -f $BIN ] ; then
    wget "http://dl.google.com/earth/client/current/$BIN"
fi
if [ ! -f $TGZ ] ; then
    wget -O $TGZ "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
fi

rm -rf temp
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
