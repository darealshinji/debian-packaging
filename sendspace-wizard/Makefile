include ../Makefile.inc

deps = wget dh-autoreconf
cleanfiles = wizard SendSpace_Wizard_Debian-Linux-32-64bit.tgz patchelfmod.tar.gz patchelfmod-master

VERSION = $(shell dpkg-parsechangelog -SVersion)
sha256_1 = b95032d3932939522fc00c55b08e1cbd3aa2fdf62d1f0362aaf9e0a29c36cfcf
archive = SendSpace_Wizard_Debian-Linux-32-64bit.tgz


all: deps download
	tar xzvf $(archive)
	$(buildpackage)

download: deps
	wget -O patchelfmod.tar.gz "https://github.com/darealshinji/patchelfmod/archive/master.tar.gz"
	wget -O $(archive) "http://www.sendspace.com/pro/dl/bb0pg3"
	@sha256_2=$$(sha256sum $(archive) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(archive):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(archive)' and try it again." ;\
    exit 1 ;\
fi

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

