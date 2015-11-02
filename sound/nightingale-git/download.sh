#!/bin/sh -e

git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-deps.git"
cd nightingale-deps

# remove all source files except xulrunner, taglib and sqlite
rm -rf $(ls -1 -d */ | grep -v xulrunner | grep -v taglib | grep -v sqlite)

# remove some other file to reduce size
rm -rf xulrunner-1.9.2/mozilla/toolkit/mozapps/update/src/updater/macbuild \
  xulrunner-1.9.2/mozilla/toolkit/crashreporter/client/macbuild \
  xulrunner-1.9.2/mozilla/xpcom/tests/unit/data/SmallApp.app \
  xulrunner-1.9.2/mozilla/xpcom/tests/unit/data/presentation.key \
  xulrunner-1.9.2/mozilla/plugin/oji/JEP/JavaEmbeddingPlugin.bundle \
  xulrunner-1.9.2/mozilla/plugin/oji/JEP/MRJPlugin.plugin/Contents \
  xulrunner-1.9.2/mozilla/js/src/trace-test/lib/mandelbrot-results.js
rm -f `find . -name *.a` `find . -name *.o` `find . -name *.exe` \
  `find . -name *.dll` `find . -name *.class` `find . -name *.jar`

# VCS directory
rm -rf .git
cd ..

git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-hacking.git"
wget -O minimizetotray.tar.gz "https://github.com/darealshinji/minimizetotrayplus/archive/master.tar.gz"

tar xfvz minimizetotray.tar.gz

cd nightingale-hacking

ngver=$(grep -e '^SB_MILESTONE=' build/sbBuildInfo.mk.in | cut -d '=' -f2)
date=$(git log -1 --format=%ci | head -c10 | tr -d '-')
echo "${ngver}+git${date}" > VERSION
cp debian/changelog changelog.in

# add githash to sbBuildInfo.mk.in
githash=$(git describe --long --always --dirty --abbrev=10)
sed -i "s|\`git describe --long --always --dirty --abbrev=10\`|$githash|" build/sbBuildInfo.mk.in

# make source package smaller
find . -name *.mp3 -delete
rm -r debian tools/win32 vcproj extensions/lastfm tools/tracemalloc \
  documentation/sharing installer/macosx
# VCS directory
rm -rf .git

# copy minimizetotray extension
cp -r ../minimizetotrayplus-master/src extensions/minimizetotray
rm -r ../minimizetotray.tar.gz ../minimizetotrayplus-master

# download additional extensions
wget "https://github.com/nightingale-media-player/nightingale-addons/archive/master.tar.gz"
tar xfvz master.tar.gz
rm master.tar.gz
mv nightingale-addons-master addons
chmod a+x addons/make.py
cd ..

# move NG deps to sources
mv nightingale-deps nightingale-hacking


