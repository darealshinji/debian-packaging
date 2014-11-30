#!/bin/sh

set -e
set -v

LANG=C
LANGUAGE=C
LC_ALL=C

echo "get latest fmod version"
changelog=studio_api_revision.txt
wget "http://www.fmod.org/files/$changelog"

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

lib="fmodstudioapi${version}linux/api/lowlevel/lib/x86/libfmod.so"
rev=$(readelf -d $lib |grep -e soname|sed -ne '/\[[^]]/s/^[^[]*\[\([^]]*\)].*$/\1/p'|cut -d. -f3)
date=$(date -R)

sed -e "s/@REV@/$rev/; s/@VERSION@/$pointversion/; s/@DATE@/$(date -R)/;" \
debian/changelog.in > debian/changelog

