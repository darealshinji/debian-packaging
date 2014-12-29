#!/bin/bash

set -e

. ../../vercmp.inc

latestcommit=$(git -C freedoom/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
SRC_VERSION=$(cat freedoom/VERSION | tr -d "v" | tr -d "\n")
TAG_VERSION=$(git -C freedoom/ describe --abbrev=0 --tags | sed -e 's/v//g')

VERSION=$TAG_VERSION
git="+git${latestcommit}"

v=$( vercmp $TAG_VERSION $SRC_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$SRC_VERSION
   git="~git${latestcommit}"
fi

sed -e "s/@VERSION@/${VERSION}${git}-1/g; s/@DATE@/$(date -R)/g" debian/changelog.in > debian/changelog

