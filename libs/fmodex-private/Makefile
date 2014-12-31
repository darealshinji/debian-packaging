include ../../include.mk

deps = wget
cleanfiles = fmodapi*linux debian/control debian/changelog
tgz = fmodapi-linux.tgz
distcleanfiles = $(tgz)
srcfiles = $(tgz)

download:
	./download.sh
	test -f $(tgz) && true || mv fmodapi*linux.tar.gz $(tgz)
	debian/rules debian/control

