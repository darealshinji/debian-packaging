include ../Makefile.inc

deps = execstack wget
cleanfiles = fmodapi*linux patchelfmod* debian/control debian/changelog

build: build-default

download:
	./download.sh
	debian/rules debian/control

distclean: clean
	rm -f fmodapi*linux.tar.gz

