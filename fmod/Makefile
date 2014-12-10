include ../Makefile.inc

deps = wget
cleanfiles = fmodstudioapi*linux debian/control debian/changelog
tgz = fmodstudioapi-linux.tgz
distcleanfiles = $(tgz)
srcfiles = $(tgz)

download:
	./download.sh
	test -f $(tgz) && true || mv fmodstudioapi*linux.tar.gz $(tgz)
	debian/rules debian/control

