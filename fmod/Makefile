include ../Makefile.inc

deps = execstack wget
cleanfiles = fmodstudioapi*linux debian/control

all: deps download build

nodeps: download build

build:
	debian/rules debian/control
	@$(buildpackage)

download:
	./download.sh

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	debian/rules override_dh_auto_clean
	rm -rf build.log $(cleanfiles)

distclean: clean
	rm -f fmodstudioapi*linux.tar.gz

