include ../Makefile.inc

cleanfiles = ffmpeg ffmpeg-snapshot.tar.bz2 debian/control debian/changelog


all: deps download build

nodeps: download build

make-control = \
test -f /usr/include/frei0r.h && \
sed -e 's/@//g' debian/control.in > debian/control || \
grep -v '@' debian/control.in > debian/control

build:
	$(make-control)
	tar xvf ffmpeg-snapshot.tar.bz2

	VER=$$(grep -v 'version <next>:' ffmpeg/Changelog | grep 'version ' | head -n1 | sed 's/version //; s/://;' -) ;\
	GIT=$$(cd ffmpeg && ./version.sh) ;\
	echo "ffmpeg (8:$${VER}+$${GIT}) unstable; urgency=low" > debian/changelog
	echo "" >> debian/changelog
	echo "  * Current git snapshot" >> debian/changelog
	echo "" >> debian/changelog
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> debian/changelog
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> debian/changelog
	echo "" >> debian/changelog

	@$(buildpackage)

download: clean
	wget "http://ffmpeg.org/releases/ffmpeg-snapshot.tar.bz2"

deps:
	@ ./dependencies.sh || true

clean:
	$(make-control)
	dh_clean || true
	rm -rf build.log $(cleanfiles)

