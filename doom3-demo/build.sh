#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

BIN=doom3-linux-1.1.1286-demo.x86.run

if [ ! -f $BIN ] ; then
    wget "ftp://ftp.fu-berlin.de/pc/games/idgames/idstuff/doom3/linux/$BIN"
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
