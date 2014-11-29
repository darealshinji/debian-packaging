include ../Makefile.inc

deps = help2man wget
cleanfiles = *.tar.gz *.png *.1 *.txt tsMuxeR tsMuxerGUI

VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)
URL = 'https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download'
sha256_1 = 815a383aebc67e59b6e541b927ce14480efed9d103fe99e74ced9ea381f61764
bin = tsmuxer$(VERSION).tar.gz

download:
	wget -O $(bin) $(URL)
	@ $(verifysha256)
	wget -O tsMuxerGUI.png "http://oi57.tinypic.com/250uh5t.jpg"
	tar xvf $(bin)

