#!/bin/bash

set -e
set -v

builddir=nightingale-hacking
latestcommit=$(git -C $builddir/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
VERSION=$(grep -e 'SB_MILESTONE=' $builddir/build/sbBuildInfo.mk.in | sed -e 's/SB_MILESTONE=//;')

changelog=$builddir/debian/changelog
mv $changelog $changelog.in

echo "nightingale (${VERSION}+git${latestcommit}-1) unstable; urgency=low" > $changelog.new
echo "" >> $changelog.new
echo "  * Current git snapshot" >> $changelog.new
echo "" >> $changelog.new
#echo " -- `whoami` <`uname -n`>  `date -R`" >> $changelog.new
echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> $changelog.new
echo "" >> $changelog.new
cat $changelog.new $changelog.in > $changelog
