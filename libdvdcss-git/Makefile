include ../Makefile.inc

deps = git wget dh-autoreconf autotools-dev
cleanfiles = libdvdcss

download: clean
	git clone "git://git.videolan.org/libdvdcss"
	cp -r debian libdvdcss
	./changelog.sh

