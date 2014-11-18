#!/bin/sh -e

LANG=C
LANGUAGE=C
LC_ALL=C

pkgver=$(head -n1 debian/changelog | cut -d '(' -f2 | cut -d ')' -f1 | cut -d- -f1)
archive=tsmuxer$pkgver.tar.gz
sha256_1=815a383aebc67e59b6e541b927ce14480efed9d103fe99e74ced9ea381f61764

if [ ! -f $archive ] ; then
    wget -O $archive 'https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download'
fi

sha256_2=$(sha256sum $archive | head -c64)
if [ $sha256_2 != $sha256_1 ] ; then
    echo "$archive:"
    echo "SHA256 checksum is $sha256_2 but should be $sha256_1."
    echo "Delete '$archive' and try it again."
    exit 1
fi

wget -O tsMuxerGUI.png http://oi57.tinypic.com/250uh5t.jpg
tar xvf $archive

