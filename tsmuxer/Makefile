include ../Makefile.inc

deps = help2man wget
cleanfiles = build.log *.tar.gz *.png *.1 *.txt tsMuxeR tsMuxerGUI

VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)
sha256_1 = 815a383aebc67e59b6e541b927ce14480efed9d103fe99e74ced9ea381f61764
archive = tsmuxer$(VERSION).tar.gz


all: deps download build

nodeps: download build

build:
	tar xvf $(archive)
	@$(buildpackage)

download:
	wget -O $(archive) 'https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download'
	@sha256_2=$$(sha256sum $(archive) | head -c64) ;\
if [ $$sha256_2 != $(sha256_1) ] ; then \
    echo "$(archive):" ;\
    echo "SHA256 checksum is $$sha256_2 but should be $(sha256_1)." ;\
    echo "Delete '$(archive)' and try it again." ;\
    exit 1 ;\
fi
	wget -O tsMuxerGUI.png "http://oi57.tinypic.com/250uh5t.jpg"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

