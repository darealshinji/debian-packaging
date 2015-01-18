#!/bin/bash

set -e

. ../../mk/vercmp.inc

latestcommit=$(git -C Dagon/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')
VERSION_MAJOR=$(grep '#define DAGON_VERSION_MAJOR' Dagon/src/Version.h | cut -d' ' -f3)
VERSION_MINOR=$(grep '#define DAGON_VERSION_MINOR' Dagon/src/Version.h | cut -d' ' -f3)
VERSION_RELEASE=$(grep '#define DAGON_VERSION_RELEASE' Dagon/src/Version.h | cut -d' ' -f3)

SRC_VERSION=$VERSION_MAJOR.$VERSION_MINOR.$VERSION_RELEASE
TAG_VERSION=$(git -C Dagon/ describe --abbrev=0 --tags | sed -e 's/v//g')


VERSION=$TAG_VERSION
git="+git${latestcommit}"

v=$( vercmp $TAG_VERSION $SRC_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$SRC_VERSION
   git="~git${latestcommit}"
fi

echo ${VERSION}${git}

