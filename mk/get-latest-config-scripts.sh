#!/bin/sh

URL=http://git.savannah.gnu.org/cgit/config.git/plain

rm -f config.guess config.sub
wget -q "$URL/config.guess"
wget -q "$URL/config.sub"

chmod a+x config.guess config.sub

./config.guess -v | head -n1
./config.sub -v | head -n1

