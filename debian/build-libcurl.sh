#!/bin/sh
# build on CentOS 6.9 (64 bit)
# https://github.com/probonopd/AppImages/issues/187
# https://github.com/TheAssassin/zsync2/issues/4
# https://launchpad.net/~djcj/+archive/ubuntu/libcurl-slim
set -e
set -x

# https://github.com/mxe/mxe/blob/master/src/curl.mk
version=$(wget -q -O- 'https://curl.haxx.se/download/?C=M;O=D' | \
  sed -n 's,.*curl-\([0-9][^"]*\)\.tar.*,\1,p' | head -1)

mbed_version="2.8.0"

wget -c "https://curl.haxx.se/download/curl-${version}.tar.bz2"
wget -c "https://tls.mbed.org/download/mbedtls-${mbed_version}-apache.tgz"

rm -rf curl-${version}
tar xf curl-${version}.tar.bz2
cd curl-${version}
patch -p1 < ../curl-ssl-searchpaths.patch

tar xf ../mbedtls-${mbed_version}-apache.tgz
cd mbedtls-${mbed_version}
make -j`nproc` CFLAGS="-O3 -fstack-protector -fPIC -DPIC"
make install DESTDIR="$PWD/tmp_x86_64"
make clean
make -j`nproc` CFLAGS="-m32 -O3 -fstack-protector -fPIC -DPIC" LDFLAGS="-m32"
make install DESTDIR="$PWD/tmp_i686"
cd ..

sed -i 's|FLAVOUR@4|FLAVOUR@3|' lib/libcurl.vers.in

CFLAGS="-O3 -fstack-protector" LDFLAGS="-Wl,--as-needed -Wl,-z,relro" \
./configure --enable-optimize --disable-debug --enable-shared --disable-static \
    --without-ssl --with-mbedtls="$PWD/mbedtls-${mbed_version}/tmp_x86_64"
make -j`nproc`
libcurl=$(readlink lib/.libs/libcurl.so)
cp src/.libs/curl ../curl.x86_64
cp lib/.libs/$libcurl ../${libcurl}.x86_64
make clean

CFLAGS="-m32 -O3 -fstack-protector" LDFLAGS="-m32 -Wl,--as-needed -Wl,-z,relro" \
./configure --enable-optimize --disable-debug --enable-shared --disable-static --host=i686-pc-linux-gnu \
    --without-ssl --with-mbedtls="$PWD/mbedtls-${mbed_version}/tmp_i686"
make -j`nproc`
cp src/.libs/curl ../curl.i686
cp lib/.libs/$libcurl ../${libcurl}.i686
cd ..

strip libcurl.so.* curl.i686 curl.x86_64

set +x

file curl.i686
file curl.x86_64
file ${libcurl}.i686
file ${libcurl}.x86_64

for bin in curl.i686 curl.x86_64 ${libcurl}.i686 ${libcurl}.x86_64 ; do
  chrpath -d $bin || true
  glibc=$(objdump -t $bin | sed -n 's/.*@@GLIBC_//p' | grep -e '^[0-9]' | cut -d ' ' -f1 | tr -d ')' | sort -uV | tail -1)
  if [ -z "$glibc" ]; then
    glibc=$(objdump -T $bin | sed -n 's/.*GLIBC_//p' | grep -e '^[0-9]' | cut -d ' ' -f1 | tr -d ')' | sort -uV | tail -1)
  fi
  echo "$bin: GLIBC $glibc"
done

