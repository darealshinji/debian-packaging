#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

archive=SendSpace_Wizard_Debian-Linux-32-64bit.tgz

if [ ! -f $archive ] ; then
    wget -O $archive http://www.sendspace.com/pro/dl/bb0pg3
fi

rm -rf wizard
tar xzvf $archive
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
