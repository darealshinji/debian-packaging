include ../../mk/include.mk

deps           = wget
cleanfiles     = fmodapi*linux patchelfmod* debian/control debian/changelog
tgz            = fmodapi-linux.tgz
distcleanfiles = $(tgz)
srcfiles       = $(tgz) patchelfmod.tar.gz

download:
	./download.sh
	debian/rules debian/control

