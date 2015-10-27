#!/bin/sh

if [ "$(uname -p)" = "x86_64" ]; then
    arch="x86_64"
else
    arch="i686"
fi

url="https://download-installer.cdn.mozilla.net/pub/firefox/releases/latest/linux-$arch"
languages="$(wget -q -O - $url/ | grep "href=\"/pub/firefox/releases/latest/linux-$arch/" | cut -d '>' -f3 | cut -d '/' -f1)"

echo "Firefox is available in many different languages:"
echo "$languages" | tr '\n' ' ' | fold -s -w 76 | sed 's/^/  /'
echo
read -p "Choose your language: [en-US] " fflang

if [ x"$fflang" = x ]; then
    fflang="en-US"
fi

version="$(wget -q -O - $url/en-US/ | tr '>' '\n' | grep '^firefox-' | sed 's|firefox-||g; s|\.tar\.bz2<\/a||g' | tail -n1)"

rm -f firefox.tbz
wget -O firefox.tbz "$url/$fflang/firefox-$version.tar.bz2"

