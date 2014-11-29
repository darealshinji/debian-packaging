#!/bin/sh

set -e
set -v

LANG=C
LANGUAGE=C
LC_ALL=C

# get latest fmod ex version
changelog=revision_4.44.txt
wget "http://www.fmod.org/files/$changelog"

pointversion=$(grep -e "Stable branch update" $changelog | cut -d' ' -f2 | head -n1)
version=$(echo $pointversion | sed -e 's/\.//g')
rm -f $changelog

##### BUGFIX #####
version=44447
##################
dirname=fmodapi${version}linux
fname=${dirname}.tar.gz

# download fmod ex
if [ ! -f $fname ] ; then
    wget "http://www.fmod.org/download/fmodex/api/Linux/$fname"
fi

# download ZDoom
rm -rf zdoom
git clone "https://github.com/rheit/zdoom.git"

# create new Debian changelog entry
latestcommit=$(git -C zdoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
TAG_VERSION=$(git -C zdoom/ describe --abbrev=0 --tags | sed -e 's/g//g; s/\pre/~pre/g')
VERSION="$TAG_VERSION+git${latestcommit}"

sed -e "s/@VERSION@/${VERSION}/g; s/@DATE@/$(date -R)/g" debian/changelog.in > debian/changelog

