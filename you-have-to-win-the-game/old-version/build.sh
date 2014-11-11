#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

game=TheGame_2014-01-30.tar.gz
sha256_game1=83ed5a02d222d280e439355f381e1115736c9d14c83171ac25e6b211c59e6751

ega=YHtWtG_EGA.zip
sha256_ega1=476a90500101d995ff5cb41b5d8e6548721daf44eb4ae65ecf58c3ba6ca165d9


if [ $(dpkg-architecture -qDEB_HOST_GNU_CPU) != "x86_64" ] ; then
    echo "This game is only available for 64 bit systems."
    exit 1
fi


if [ ! -f $game ] ; then
    wget "http://www.piratehearts.com/builds/$game"
fi
if [ ! -f $ega ] ; then
    wget "http://www.piratehearts.com/files/$ega"
fi


sha256_game2=$(sha256sum $game | head -c64)
if [ $sha256_game2 != $sha256_game1 ] ; then
echo "$game:"
    echo "SHA256 checksum is $sha256_game2 but should be $sha256_game1."
    exit 1
fi
sha256_ega2=$(sha256sum $ega | head -c64)
if [ $sha256_ega2 != $sha256_ega1 ] ; then
echo "$ega:"
    echo "SHA256 checksum is $sha256_ega2 but should be $sha256_ega1."
    exit 1
fi


tar xzvf $game
unzip $ega -d YHtWtG_EGA

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

