include ../Makefile.inc

deps = execstack wget
cleanfiles = fmodapi*linux patchelfmod.tar.gz debian/control debian/changelog

download:
	./download.sh
	debian/rules debian/control

distclean: clean
	rm -f fmodapi*linux.tar.gz

