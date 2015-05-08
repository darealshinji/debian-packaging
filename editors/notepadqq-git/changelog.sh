#!/bin/bash

set -e

. ../../mk/vercmp.inc


SRC_VERSION=$(grep -e 'POINTVERSION' notepadqq/src/ui/include/notepadqq.h | \
              cut -d' ' -f3 | sed -e 's/\"//g')
TAG_VERSION=$(git -C notepadqq/ describe --abbrev=0 --tags | sed -e 's/v//g')
latestcommit=$(git -C notepadqq/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')

VERSION=$TAG_VERSION
git="+git${latestcommit}"

v=$( vercmp $TAG_VERSION $SRC_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$SRC_VERSION
   git="~git${latestcommit}"
fi


# create new Debian changelog entry
mv notepadqq/debian/changelog notepadqq/debian/changelog.in

echo "notepadqq (${VERSION}${git}-1~trusty) trusty; urgency=low" > changelog.new
#echo "notepadqq ($VERSION-1) unstable; urgency=low" > changelog.new
echo "" >> changelog.new
echo "  * Current git snapshot" >> changelog.new
echo "" >> changelog.new
#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
echo "" >> changelog.new
cat changelog.new notepadqq/debian/changelog.in > notepadqq/debian/changelog
rm changelog.new

