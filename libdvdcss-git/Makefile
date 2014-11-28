include ../Makefile.inc

deps = git wget dh-autoreconf autotools-dev
cleanfiles = libdvdcss


all: deps download build

nodeps: download build

build:
	cp -r debian libdvdcss
	./changelog.sh

	@cd libdvdcss && $(buildpackage)
	mv -f libdvdcss/build.log .
	mv -f *.deb *.changes ../

download: clean
	git clone "git://git.videolan.org/libdvdcss"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

