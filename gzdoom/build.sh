#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C


# get latest fmod ex version
changelog=revision_4.44.txt
wget http://www.fmod.org/files/$changelog

pointversion=$(grep -e "Stable branch update" $changelog | cut -d' ' -f2 | head -n1)
version=$(echo $pointversion | sed -e 's/\.//g')
rm -f $changelog

dirname=fmodapi${version}linux
fname=${dirname}.tar.gz

# download fmod ex
if [ ! -f $fname ] ; then
    wget "http://www.fmod.org/download/fmodex/api/Linux/$fname"
fi


# download GZDoom
rm -rf gzdoom
git clone https://github.com/coelckers/gzdoom.git


# create new Debian changelog entry
latestcommit=$(git -C gzdoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
VERSION=1.8.5

#echo "gzdoom ($VERSION-1) unstable; urgency=low" > changelog.new
echo "gzdoom ($VERSION+git$latestcommit-1~trusty) trusty; urgency=low" > changelog.new
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
