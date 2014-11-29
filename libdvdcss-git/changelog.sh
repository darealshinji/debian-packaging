#!/bin/bash

set -e
set -v

. ../vercmp.inc

Sources="http://download.videolan.org/pub/debian/unstable/Sources"
STABLE_VERSION=$(wget -q -O - $Sources | grep -e '^Version: ' | sed -e 's/Version: //;' | cut -d- -f1)
GIT_VERSION=$(grep -e 'AC_INIT' libdvdcss/configure.ac | cut -d, -f2 | sed -e 's/ //g')
latestcommit=$(git -C libdvdcss/ log -1 --format=%ci | head -c10 | sed -e 's/-//g')

VERSION=$STABLE_VERSION
git="+git${latestcommit}"

v=$( vercmp $STABLE_VERSION $GIT_VERSION )
if [ $v -lt 0 ]; then
   VERSION=$GIT_VERSION
   git="~git${latestcommit}"
fi

sed -e "s/@VERSION@/${VERSION}${git}/g; s/@DATE@/$(date -R)/g" \
libdvdcss/debian/changelog.in > libdvdcss/debian/changelog

