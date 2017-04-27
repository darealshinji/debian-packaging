#!/bin/sh

LANG=C

echo "get minimum glibc version..."

for f in `find ./* -type f`; do
  glibc=$(objdump -t "$f" 2>/dev/null | sed -n 's/.*@@GLIBC_//p' | grep -e '^[0-9]' | cut -d ' ' -f1 | tr -d ')' | sort -uV | tail -1)
  if [ -z $glibc ]; then
    glibc=$(objdump -T "$f" 2>/dev/null | sed -n 's/.*GLIBC_//p' | grep -e '^[0-9]' | cut -d ' ' -f1 | tr -d ')' | sort -uV | tail -1)
  fi
  glibcdeps="$glibcdeps $glibc"
done
glibcver="$(echo $glibcdeps | tr ' ' '\n' | sort -uV | tail -1)"
echo "found ($glibcver)"

echo "get Debian package dependencies..."

alldeps="$( (find ./* -type f -exec readelf -d '{}' 2>/dev/null \;) | grep 'NEEDED' | cut -d '[' -f2 | tr -d ']' | sort | uniq )"
for f in $alldeps; do
  if [ "x$(find ./* -name $f)" = "x" ]; then
    deps="$deps $f"
  fi
done
for f in $deps; do
  if [ "$f" = "libGL.so.1" ]; then
    pkgs="$pkgs libgl1-mesa-glx"
  else
    pkgs="$pkgs $(dpkg -S $f | grep "amd64" | grep "\/$f\$" | head -n1 | cut -d: -f1)"
  fi
done

echo "dependencies are:"
echo "$pkgs" | sed 's| |,\n |g' | sort | uniq
echo ""
echo "glibc minimum version: $glibcver"

