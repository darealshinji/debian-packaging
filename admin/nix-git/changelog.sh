#!/bin/bash

set -e

. ../../mk/vercmp.inc

latestcommit=$(git -C nix/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
SRC_VERSION=$(cat nix/version)
TAG_VERSION=$(git -C nix/ describe --abbrev=0 --tags | sed -e 's/v//g')


VERSION=$TAG_VERSION
git="+git${latestcommit}"

v=$( vercmp $TAG_VERSION $SRC_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$SRC_VERSION
   git="~git${latestcommit}"
fi

sed -e "s/@VERSION@/${VERSION}${git}/g; s/@DATE@/$(date -R)/g" debian/changelog.in > debian/changelog

