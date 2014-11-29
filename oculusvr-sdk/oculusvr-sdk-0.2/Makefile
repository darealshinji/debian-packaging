include ../../Makefile.inc

deps = wget automake freeglut3-dev imagemagick libudev-dev libxext-dev \
	libxinerama-dev mesa-common-dev git
builddir = OculusSDK
cleanfiles = $(builddir) *.png .pc
sha256_1 = d225957c76343aa4db157d1a39ae836c4257558f0b8667a4f180d3a5c60e5635
bin = ovr_sdk_linux_0.2.5c.tar.gz

download: clean
	test -f $(bin) || wget "http://static.oculus.com/sdk-downloads/$(bin)"
	wget -O oculusconfigutil.png "http://s14.directupload.net/images/141118/thesboba.png"
	@ $(verifysha256)
	tar xvfz $(bin)

distclean: clean
	rm -f $(bin)
