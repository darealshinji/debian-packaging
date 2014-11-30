include ../Makefile.inc

deps = mercurial cmake help2man python3-sphinx yasm
cleanfiles = source test.hevc x265_2pass.log* debian/test.y4m debian/changelog

build: build-default

download: clean
	hg clone "https://bitbucket.org/multicoreware/x265" source
	cd source && hg log --style changelog > ChangeLog

	VERSION=$$(cd source && hg parents --template '{latesttag}+{latesttagdistance}+hg{node|short}') ;\
	echo "x265 ($$(echo $$VERSION)) unstable; urgency=low" > debian/changelog
	echo "" >> debian/changelog
	echo "  * Current snapshot" >> debian/changelog
	echo "" >> debian/changelog
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> debian/changelog
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> debian/changelog
	echo "" >> debian/changelog

