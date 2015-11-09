include ../../mk/include.mk

deps           = wget
cleanfiles     = fmodapi*linux debian/control debian/changelog
tgz            = fmodapi-linux.tgz
distcleanfiles = $(tgz)
srcfiles       = $(tgz)

download:
	./download.sh
	debian/rules debian/control

