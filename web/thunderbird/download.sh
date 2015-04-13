#!/bin/sh

if [ "$(uname -p)" = "x86_64" ]; then
    arch="x86_64"
else
    arch="i686"
fi

url="https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/latest/linux-$arch"
languages="$(wget -q -O - $url | grep 'folder.gif' | cut -d '>' -f7 | cut -d '/' -f1 | tr '\n' ' ')"

echo "thunderbird is available in many different languages:"
echo "$languages" | fold -s -w 76 | sed 's/^/  /'
read -p "Choose your language: [en-US] " fflang

if [ x"$fflang" = x ]; then
    fflang="en-US"
fi

version="$(wget -q -O - $url/$fflang | grep '.tar.bz2' | cut -d '>' -f7 | cut -d '<' -f1 | sed 's/thunderbird-//; s/.tar.bz2//;')"

rm -f thunderbird.tbz
wget -O thunderbird.tbz "$url/$fflang/thunderbird-$version.tar.bz2"
echo "1:$version" > VERSION
sed "s/@L10N@/$fflang/g" debian/control.in > debian/control

