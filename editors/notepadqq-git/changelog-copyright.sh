#!/bin/bash

set -e

. ../../mk/vercmp.inc

cd notepadqq

SRC_VERSION=$(grep -e 'POINTVERSION' src/ui/include/notepadqq.h | \
              cut -d' ' -f3 | sed -e 's/\"//g')
TAG_VERSION=$(git describe --abbrev=0 --tags | sed -e 's/v//g')
latestcommit=$(git log -1 --format=%ci | head -c10 | sed -e 's/-//g')

VERSION=$TAG_VERSION
git="+git${latestcommit}"

v=$( vercmp $TAG_VERSION $SRC_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$SRC_VERSION
   git="~git${latestcommit}"
fi


# create new Debian changelog entry
mv debian/changelog debian/changelog.in

echo "notepadqq (${VERSION}${git}-1~trusty) trusty; urgency=low" > changelog.new
#echo "notepadqq ($VERSION-1) unstable; urgency=low" > changelog.new
echo "" >> changelog.new
echo "  * Current git snapshot" >> changelog.new
echo "" >> changelog.new
#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
echo "" >> changelog.new
cat changelog.new debian/changelog.in > debian/changelog
rm changelog.new


# create debian/copyright
cat debian/copyright.in > debian/copyright
for f in `find src/extension_tools -name LICEN?E`; do
   cat <<EOF >> debian/copyright



Files: `dirname $f`/*

EOF
   cat $f >> debian/copyright
done

