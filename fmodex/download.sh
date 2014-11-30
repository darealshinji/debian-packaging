#!/bin/sh

set -e
set -v

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

echo "download patchelfmod"
TGZ=patchelfmod.tar.gz
if [ ! -f $TGZ ] ; then
wget -O $TGZ "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
fi

sed -e "s/@REV@/$rev/; s/@VERSION@/$pointversion/; s/@DATE@/$(date -R)/;" \
debian/changelog.in > debian/changelog

