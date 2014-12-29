include ../../Makefile.inc

deps = wget
cleanfiles = fmodapi*linux patchelfmod* debian/control debian/changelog
tgz = fmodapi-linux.tgz
distcleanfiles = $(tgz)
srcfiles = $(tgz) patchelfmod.tar.gz

download:
	./download.sh
	test -f $(tgz) && true || mv fmodapi*linux.tar.gz $(tgz)
	debian/rules debian/control

