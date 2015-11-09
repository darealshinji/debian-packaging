include ../../mk/include.mk

deps           = wget
cleanfiles     = fmodstudioapi*linux debian/control debian/changelog
tgz            = fmodstudioapi-linux.tgz
distcleanfiles = $(tgz)
srcfiles       = $(tgz)

download:
	./download.sh
	debian/rules debian/control

