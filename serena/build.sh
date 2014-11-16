#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

zip=Serena.1.zip
sha256_1=b25bbabad910db78c9446e2d293eb161588a7b2098713e77a512f8c10345f530

if [ ! -f $zip ] ; then
    echo 'To build Serena download the Windows zip archive,'
    echo 'save it in this directory and run `./build.sh` again:'
    echo 'http://www.indiedb.com/games/serena/downloads/serena'
    exit 1
fi

sha256_2=$(sha256sum $zip | head -c64)
if [ $sha256_2 != $sha256_1 ] ; then
    echo "$zip:"
    echo "SHA256 checksum is $sha256_2 but should be $sha256_1."
    echo "Delete '$zip' and try it again."
    exit 1
fi

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
