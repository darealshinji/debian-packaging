#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

rev=4.44

echo "get latest fmod ex version"
changelog=revision_${rev}.txt
wget http://www.fmod.org/files/$changelog

pointversion=$(grep -e "Stable branch update" $changelog | cut -d' ' -f2 | head -n1)
version=$(echo $pointversion | sed -e 's/\.//g')
rm -f $changelog

dirname=fmodapi${version}linux
fname=${dirname}.tar.gz

echo "download fmod ex"
if [ ! -f $fname ] ; then
    wget "http://www.fmod.org/download/fmodex/api/Linux/$fname"
fi
rm -rf "$dirname"
tar xvf "$fname"

echo "update Debian changelog"
deb_version=$(head -n1 debian/changelog | cut -d' ' -f2 | cut -d'-' -f1 | sed -e 's/\.//g' -e 's/(//g')
date=$(date -R)
if [ $version -gt $deb_version ] ; then
  rm -f debian/changelog.old
  mv debian/changelog debian/changelog.old
  echo "fmodex${rev} ($pointversion-1) unstable; urgency=low" > debian/changelog
  echo "" >> debian/changelog
  echo "  * New upstream version" >> debian/changelog
  echo "" >> debian/changelog
  echo " -- Marshall Banana <djcj@gmx.de>  $date" >> debian/changelog
  echo "" >> debian/changelog
  cat debian/changelog.old >> debian/changelog
fi

