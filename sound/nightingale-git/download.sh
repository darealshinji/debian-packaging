#!/bin/sh -e

git clone --depth 1 "https://github.com/darealshinji/nightingale-deps"
rm -rf nightingale-deps/.git

git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-hacking"
git clone --depth 1 "https://github.com/darealshinji/minimizetotrayplus"

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
cp -r ../minimizetotrayplus/src extensions/minimizetotray
rm -rf ../minimizetotrayplus

# download additional extensions
git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-addons" addons
rm -rf addons/.git
chmod a+x addons/make.py
cd ..

# move NG deps to sources
mv nightingale-deps nightingale-hacking


