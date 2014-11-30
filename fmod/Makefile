include ../Makefile.inc

deps = execstack wget
cleanfiles = fmodstudioapi*linux debian/control debian/changelog

build: build-default

download:
	./download.sh
	debian/rules debian/control

distclean: clean
	rm -f fmodstudioapi*linux.tar.gz

