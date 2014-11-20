include ../Makefile.inc

deps = chrpath dh-autoreconf
cleanfiles = GoogleEarthLinux.bin patchelfmod.tar.gz patchelfmod-master debian/changelog temp

DATE = $(shell date -R)


all: deps download build

nodeps: download build

build:
	chmod a+x GoogleEarthLinux.bin
	./GoogleEarthLinux.bin --target temp --noexec
	version=$$(head -n2 temp/setup.data/setup.xml | tail -n-1 | cut -d '"' -f2 | cut -d- -f1) ; \
	sed -e "s/@VERSION@/$$version/g; s/@DATE@/$(DATE)/g" debian/changelog.in > debian/changelog
	@$(buildpackage)

download: clean
	wget "http://dl.google.com/earth/client/current/GoogleEarthLinux.bin"
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

