#!/bin/sh

set -e

LANG=C
LANGUAGE=C
LC_ALL=C

# get latest fmod ex version
changelog=revision_4.44.txt
wget "http://www.fmod.org/files/$changelog"

pointversion=$(grep -e "Stable branch update" $changelog | cut -d' ' -f2 | head -n1)
version=$(echo $pointversion | sed -e 's/\.//g')
rm -f $changelog

dirname=fmodapi${version}linux
fname=${dirname}.tar.gz

# fmod ex
if [ -f fmodapi-linux.tgz ] ; then
    ln -s fmodapi-linux.tgz $fname
else
    echo "download fmod ex"
    if [ ! -f $fname ] ; then
        wget "http://www.fmod.org/download/fmodex/api/Linux/$fname"
    fi
fi

# download ZDoom
rm -rf zdoom
git clone "https://github.com/rheit/zdoom.git"

# create new Debian changelog entry
latestcommit=$(git -C zdoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
TAG_VERSION=$(git -C zdoom/ describe --abbrev=0 --tags | sed -e 's/g//g; s/\pre/~pre/g')
VERSION="$TAG_VERSION+git${latestcommit}"

sed -e "s/@VERSION@/${VERSION}/g; s/@DATE@/$(date -R)/g" debian/changelog.in > debian/changelog

