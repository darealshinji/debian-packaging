#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

if [ $(uname -p) = "x86_64" ] ; then
    x64="-x64"
fi

xnview=XnViewMP-linux$x64.tgz

if [ ! -f $xnview ] ; then
    wget "http://download.xnview.com/$xnview"
fi

rm -rf XnView
tar xzvf $xnview
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
