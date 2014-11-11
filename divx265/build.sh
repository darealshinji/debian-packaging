#!/bin/sh -e

LANG=C
LANGUAGE=C
LC_ALL=C

VERSION=$(head -n1 debian/changelog | cut -d '(' -f2 | cut -d ')' -f1 | cut -d- -f1)

sha256_1=f1887ba3ef72f47ed0330eb40751e6e966653b84fc2035fd08c1b22b0f2e62ef
bin=DivX265_$VERSION

if [ ! -f $bin ] ; then
    wget "http://download.divx.com/hevc/$bin"
fi

sha256_2=$(sha256sum $bin | head -c64)
if [ $sha256_2 != $sha256_1 ] ; then
    echo "$bin:"
    echo "SHA256 checksum is $sha256_2 but should be $sha256_1."
    echo "Delete '$bin' and try it again."
    exit 1
fi

mv $bin DivX265

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
