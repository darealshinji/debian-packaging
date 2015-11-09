#!/bin/sh

if [ "$(uname -p)" = "x86_64" ]; then
    arch="x86_64"
else
    arch="i686"
fi

url="https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/latest/linux-$arch"
languages="$(wget -q -O - $url/ | grep "href=\"/pub/thunderbird/releases/latest/linux-$arch/" | cut -d '>' -f3 | cut -d '/' -f1)"

echo "thunderbird is available in many different languages:"
echo "$languages" | tr '\n' ' ' | fold -s -w 76 | sed 's/^/  /'
echo
read -p "Choose your language: [en-US] " fflang

if [ x"$fflang" = x ]; then
    fflang="en-US"
fi

version="$(wget -q -O - $url/en-US/ | tr '>' '\n' | grep '^thunderbird-' | sed 's|thunderbird-||g; s|\.tar\.bz2<\/a||g' | tail -n1)"

rm -f thunderbird.tbz
wget -O thunderbird.tbz "$url/$fflang/thunderbird-$version.tar.bz2"
