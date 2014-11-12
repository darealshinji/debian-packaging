#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

zip=Asylum_Teaser_Unix.zip
sha256_1=96fac7e8bbbb5cb200ae41c87e48eb15b21ca3cf18791a40ebf2e0b4b519effd

if [ ! -f $zip ] ; then
    wget "http://files.asylumgame.com/$zip"
fi

sha256_2=$(sha256sum $zip | head -c64)
if [ $sha256_2 != $sha256_1 ] ; then
    echo "$zip:"
    echo "SHA256 checksum is $sha256_2 but should be $sha256_1."
    echo "Delete '$zip' and try it again."
    exit 1
fi

./clean.sh
wget -O asylum-teaser.png "http://s14.directupload.net/images/141112/cbqmarg3.png"

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
