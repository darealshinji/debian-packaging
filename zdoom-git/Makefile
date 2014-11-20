include ../Makefile.inc

deps = git wget cmake libbz2-dev libfluidsynth-dev libgtk2.0-dev \
	libjpeg-dev libsdl1.2-dev zlib1g-dev
cleanfiles = fmodapi*linux zdoom debian/changelog *.tar.gz


all: deps download build

nodeps: download build

build:
	@$(buildpackage)

download: clean
	./download.sh

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

