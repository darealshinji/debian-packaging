include ../../include.mk

ARCH = i386

deps = wget
srcfiles = *.png $(bin)
bin = tsmuxer$(VERSION).tar.gz
cleanfiles = $(srcfiles) $(bin) *.1
VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | head -c-2 | tail -c+2)

download:
	wget -O $(bin) 'https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download'
	@$(call verifysha256,$(bin),815a383aebc67e59b6e541b927ce14480efed9d103fe99e74ced9ea381f61764)
	wget -O tsMuxerGUI.png "http://fs1.directupload.net/images/150103/lmvmwlnx.png"

