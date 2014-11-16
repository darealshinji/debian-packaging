#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

VERSION=$(head -n1 debian/changelog|cut -d- -f1|cut -d'(' -f2)

./clean.sh

wget https://github.com/freedoom/freedoom/releases/download/v${VERSION}/freedoom-${VERSION}.zip
wget https://github.com/freedoom/freedoom/releases/download/v${VERSION}/freedm-${VERSION}.zip
wget https://raw.githubusercontent.com/freedoom/freedoom/master/README.adoc

dpkg-buildpackage -b -us -uc 2>&1 | tee build.log

for f in ../*.deb ; do
  echo "$f:"
  dpkg-deb -I $f
  lintian $f
  echo ""
done 2>&1 | tee -a build.log

for f in ../*.deb ; do
  echo "$f:"
  dpkg-deb -c $f
  echo ""
done 2>&1 | tee -a build.log
