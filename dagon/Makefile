include ../Makefile.inc

deps = git imagemagick libfreetype6-dev libglew-dev liblua5.1-0-dev \
	libogg-dev libopenal-dev libvorbis-dev libtheora-dev libsdl2-dev premake4
cleanfiles = Dagon converted_icons debian/changelog


all: deps download build

nodeps: download build

build:
	# create new Debian changelog entry
	latestcommit=$$(git -C Dagon/ log -1 --format=%ci | head -c10 | sed -e 's/-//g') ;\
	VERSION_MAJOR=$$(grep '#define DAGON_VERSION_MAJOR' Dagon/src/Version.h | cut -d' ' -f3) ;\
	VERSION_MINOR=$$(grep '#define DAGON_VERSION_MINOR' Dagon/src/Version.h | cut -d' ' -f3) ;\
	VERSION_RELEASE=$$(grep '#define DAGON_VERSION_RELEASE' Dagon/src/Version.h | cut -d' ' -f3) ;\
	VERSION=$$VERSION_MAJOR.$$VERSION_MINOR.$$VERSION_RELEASE ;\
	echo "dagon ($$VERSION~git$$latestcommit-1~trusty) trusty; urgency=low" > changelog.new
	#echo "dagon ($$VERSION-1) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * Current git snapshot" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new debian/changelog.in > debian/changelog
	rm changelog.new
	$(buildpackage)

download: deps clean
	git clone https://github.com/Senscape/Dagon.git

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

