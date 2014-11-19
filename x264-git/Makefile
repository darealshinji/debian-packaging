include ../Makefile.inc

deps = git wget help2man libx11-dev yasm zlib1g-dev
cleanfiles = ffmpeg l-smash x264-source *.tar.bz2 debian/changelog \
	debian/test.y4m test.mp4 x264_2pass.log*


all: deps download build

nodeps: download build

build:
	echo "x264 (2:$(shell ./version.sh)) unstable; urgency=low" > debian/changelog
	echo "" >> debian/changelog
	echo "  * Update to new upstream snapshot" >> debian/changelog
	echo "" >> debian/changelog
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> debian/changelog
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> debian/changelog
	echo "" >> debian/changelog
	$(buildpackage)

download: clean
	git clone "git://git.videolan.org/x264.git" x264-source
	cp -vf /usr/share/misc/config.guess x264-source
	cp -vf /usr/share/misc/config.sub x264-source
	wget "http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2"
	tar xvf ffmpeg-snapshot.tar.bz2
	git clone "https://github.com/l-smash/l-smash.git"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

