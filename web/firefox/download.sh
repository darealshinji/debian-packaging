#!/bin/sh

if [ "$(uname -p)" = "x86_64" ]; then
    arch="x86_64"
else
    arch="i686"
fi

url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/linux-$arch"
languages="$(wget -q -O - $url | grep 'folder.gif' | cut -d '>' -f7 | cut -d '/' -f1 | tr '\n' ' ')"

echo "Firefox is available in many different languages:"
echo "$languages" | fold -s -w 76 | sed 's/^/  /'
read -p "Choose your language: [en-US] " fflang

if [ x"$fflang" = x ]; then
    fflang="en-US"
fi

version="$(wget -q -O - $url/$fflang | grep '.tar.bz2' | cut -d '>' -f7 | cut -d '<' -f1 | sed 's/firefox-//; s/.tar.bz2//;')"

rm -f firefox.tbz
wget -O firefox.tbz "$url/$fflang/firefox-$version.tar.bz2"
echo $version > VERSION

