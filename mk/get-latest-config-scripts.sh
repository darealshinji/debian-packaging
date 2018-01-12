#!/bin/sh

URL="http://git.savannah.gnu.org/cgit/config.git/plain/config."

rm -f config.guess config.sub
wget -q "${URL}guess"
wget -q "${URL}sub"

chmod a+x config.guess config.sub

./config.guess -v | head -n1
./config.sub -v | head -n1

