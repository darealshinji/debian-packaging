include ../../Makefile.inc

deps = wget git automake imagemagick
builddir = OculusSDK
cleanfiles = $(builddir) ovr_sdk_linux_$(VERSION) *.png .pc

sha256_1 = a1924360c6264d9a6c602ece5c50ebfb1bce740a730e2ed64079e44fe6461017
VERSION = 0.4.3
bin = ovr_sdk_linux_$(VERSION).tar.xz

download: clean
	test -f $(bin) || wget "http://static.oculus.com/sdk-downloads/$(bin)"
	wget -O riftconfigutil.png "http://s14.directupload.net/images/141118/thesboba.png"
	@ $(verifysha256)
	tar xvf $(bin)
	mv ovr_sdk_linux_$(VERSION) OculusSDK

distclean: clean
	rm -f $(bin)
