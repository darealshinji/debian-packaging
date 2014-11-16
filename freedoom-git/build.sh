#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C


# download Freedoom
rm -rf freedoom
git clone https://github.com/freedoom/freedoom.git


# create new Debian changelog entry
latestcommit=$(git -C freedoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
VERSION=$(cat freedoom/VERSION | tr -d "v" | tr -d "\n")

#echo "freedoom ($VERSION-1) unstable; urgency=low" > changelog.new
echo "freedoom ($VERSION+git$latestcommit-1~trusty) trusty; urgency=low" > changelog.new
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
