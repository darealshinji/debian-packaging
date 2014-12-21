#!/bin/bash

set -e

. ../vercmp.inc

debianversion=$(dpkg-parsechangelog -SVersion)
pkgversion=$(head -n1 XnView/WhatsNew.txt | sed -e 's/Changelog //; s/://;' | tr -d '[:cntrl:]')

VERSION=$debianversion
v=$( vercmp $debianversion $pkgversion )
if [ $v -lt 0 ]; then
   VERSION=$pkgversion
fi

sed -e "s/@VERSION@/${VERSION}/g; s/@DATE@/$(date -R)/g" debian/changelog.in > debian/changelog

