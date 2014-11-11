#!/bin/sh

LANG=C
LANGUAGE=C
LC_ALL=C

GAMEDIR="$HOME/.steam/steam/SteamApps/common/You Have to Win the Game"

if [ ! -d "$GAMEDIR" ] ; then
    echo "can't find '$GAMEDIR'"
    exit 1
fi

mkdir -p tmp
cp "$GAMEDIR"/* tmp/

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
