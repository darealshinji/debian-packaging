include ../Makefile.inc

deps = git imagemagick libfreetype6-dev libglew-dev liblua5.1-0-dev \
	libogg-dev libopenal-dev libvorbis-dev libtheora-dev libsdl2-dev premake4
cleanfiles = Dagon debian/changelog

build: build-default

download: clean
	git clone "https://github.com/Senscape/Dagon.git"
	./changelog.sh
