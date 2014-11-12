#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C


# download Dagon
rm -rf Dagon
git clone https://github.com/Senscape/Dagon.git


# create new Debian changelog entry
latestcommit=$(git -C Dagon/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
VERSION_MAJOR=$(grep '#define DAGON_VERSION_MAJOR' Dagon/src/Version.h | cut -d' ' -f3)
VERSION_MINOR=$(grep '#define DAGON_VERSION_MINOR' Dagon/src/Version.h | cut -d' ' -f3)
VERSION_RELEASE=$(grep '#define DAGON_VERSION_RELEASE' Dagon/src/Version.h | cut -d' ' -f3)
VERSION=$VERSION_MAJOR.$VERSION_MINOR.$VERSION_RELEASE

#echo "dagon ($VERSION-1) unstable; urgency=low" > changelog.new
echo "dagon ($VERSION~git$latestcommit-1~trusty) trusty; urgency=low" > changelog.new
echo "" >> changelog.new
echo "  * Current git snapshot" >> changelog.new
echo "" >> changelog.new
#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
echo "" >> changelog.new
cat changelog.new debian/changelog.in > debian/changelog
rm changelog.new


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
