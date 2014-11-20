include ../Makefile.inc

cleanfiles = mplayer-export debian/changelog
archive = mplayer-export-snapshot.tar.bz2


all: deps download build

nodeps: download build

build:
	REV=$$(cat mplayer-export/snapshot_version | cut -d- -f1) ;\
	echo "mplayer (2:1.1.1+svn$${REV}) unstable; urgency=low" > debian/changelog
	echo "" >> debian/changelog
	echo "  * Current svn snapshot" >> debian/changelog
	echo "" >> debian/changelog
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> debian/changelog
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> debian/changelog
	echo "" >> debian/changelog

	@$(buildpackage)

download: clean
	wget "http://mplayerhq.hu/MPlayer/releases/$(archive)"

	tar xvf $(archive)
	rm -f $(archive)
	mv mplayer-export-* mplayer-export

	git clone -b master --depth 1 git://source.ffmpeg.org/ffmpeg.git mplayer-export/ffmpeg && \
	touch mplayer-export/ffmpeg/mp_auto_pull

deps:
	./dependencies.sh

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles) $(archive)

