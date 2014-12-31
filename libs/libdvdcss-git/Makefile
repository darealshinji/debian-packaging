include ../../include.mk

deps = git dh-autoreconf
builddir = libdvdcss
cleanfiles = debian/changelog

download:
	git clone --depth 1 "git://git.videolan.org/libdvdcss"
	./changelog.sh
	rm -rf libdvdcss/.git

