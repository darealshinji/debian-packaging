include ../Makefile.inc

deps = chrpath dh-autoreconf
cleanfiles = GoogleEarthLinux.bin patchelfmod* debian/changelog

build: build-default

download: clean
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	wget "http://dl.google.com/earth/client/current/GoogleEarthLinux.bin"
	chmod a+x GoogleEarthLinux.bin
	./GoogleEarthLinux.bin --target temp --noexec
	version=$$(head -n2 temp/setup.data/setup.xml | tail -n-1 | cut -d '"' -f2 | cut -d- -f1) ; \
	sed -e "s/@VERSION@/$$version/g; s/@DATE@/$(shell date -R)/g" \
	debian/changelog.in > debian/changelog

