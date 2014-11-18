include ../Makefile.inc

deps = execstack wget
cleanfiles = fmodapi*linux patchelfmod.tar.gz debian/control

all: deps download build

nodeps: download build

build:
	debian/rules debian/control
	$(buildpackage)

download: deps
	./download.sh

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	debian/rules override_dh_auto_clean
	rm -rf build.log $(cleanfiles)

distclean: clean
	rm -f fmodapi*linux.tar.gz

