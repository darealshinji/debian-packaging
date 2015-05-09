include ../../mk/include.mk

deps       = wget
srcfiles   = *.png $(bin)
bin        = tsmuxer$(VERSION).tar.gz
cleanfiles = $(srcfiles) *.1

VERSION       = 2.6.11
changelog-msg = Initial release

download:
	@ $(call download,$(bin),https://docs.google.com/uc?authuser=0&id=0B0VmPcEZTp8NekJxLUVJRWMwejQ&export=download)
	@ $(call download,tsMuxerGUI.png,http://fs1.directupload.net/images/150103/lmvmwlnx.png)
	@ $(call verifysha256,$(bin),815a383aebc67e59b6e541b927ce14480efed9d103fe99e74ced9ea381f61764)
	@ $(call verifysha256,tsMuxerGUI.png,ff166c09d7e5218ee566d876c20873e26ccf6242a3f37a7f01e6514c4396a753)
	@ VERSION=$(VERSION); $(changelog-entry)

