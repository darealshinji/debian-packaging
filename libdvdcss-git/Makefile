include ../Makefile.inc

deps = git wget dh-autoreconf autotools-dev
cleanfiles = libdvdcss

build: build-default

download: clean
	git clone --depth 1 "git://git.videolan.org/libdvdcss"
	cp -r debian libdvdcss
	./changelog.sh

