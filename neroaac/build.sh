#!/bin/sh -e

neroaac=NeroAACCodec-1.5.1.zip
sha256_1=e0496ad856e2803001a59985368d21b22f4fbdd55589c7f313d6040cefff648b

if [ ! -f $neroaac ] ; then
    wget "ftp://ftp6.nero.com/tools/$neroaac"
fi

sha256_2=$(sha256sum $neroaac | head -c64)
if [ $sha256_2 != $sha256_1 ] ; then
    echo "$neroaac:"
    echo "SHA256 checksum is $sha256_2 but should be $sha256_1."
    echo "Delete '$neroaac' and try it again."
    exit 1
fi

rm -rf neroaac
unzip $neroaac -d neroaac

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
