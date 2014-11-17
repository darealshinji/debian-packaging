#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

echo "get latest fmod version"
changelog=studio_api_revision.txt
wget http://www.fmod.org/files/$changelog

pointversion=$(grep -e "Studio API" $changelog | head -n2 | tail -n-1 | cut -d' ' -f2)
version=$(echo $pointversion | sed -e 's/\.//g')
rm -f $changelog

dirname=fmodstudioapi${version}linux
fname=${dirname}.tar.gz

echo "download fmod"
if [ ! -f $fname ] ; then
    wget "http://www.fmod.org/download/fmodstudio/api/Linux/$fname"
fi
rm -rf "$dirname"
tar xvf "$fname"

echo "update Debian changelog"
lib="fmodstudioapi${version}linux/api/lowlevel/lib/x86/libfmod.so"
rev=$(readelf -d $lib |grep -e soname|sed -ne '/\[[^]]/s/^[^[]*\[\([^]]*\)].*$/\1/p'|cut -d. -f3)
deb_version=$(head -n1 debian/changelog | cut -d' ' -f2 | cut -d'-' -f1 | sed -e 's/\.//g' -e 's/(//g')
date=$(date -R)
if [ $version -gt $deb_version ] ; then
  rm -f debian/changelog.old
  mv debian/changelog debian/changelog.old
  echo "fmod${rev} ($pointversion-1) unstable; urgency=low" > debian/changelog
  echo "" >> debian/changelog
  echo "  * New upstream version" >> debian/changelog
  echo "" >> debian/changelog
  echo " -- Marshall Banana <djcj@gmx.de>  $date" >> debian/changelog
  echo "" >> debian/changelog
  cat debian/changelog.old >> debian/changelog
fi
