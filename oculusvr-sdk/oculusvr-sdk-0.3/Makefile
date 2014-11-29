include ../../Makefile.inc

deps = wget git automake freeglut3-dev imagemagick libudev-dev libxext-dev \
	libxinerama-dev libxrandr-dev libxxf86vm-dev mesa-common-dev
builddir = OculusSDK
cleanfiles = $(builddir) *.png .pc
sha256_1 = 1456141f3f1a3120efd996c22e2d7f1ae50e57a8163b1e84c8a57622a5ce8d52
bin = ovr_sdk_linux_0.3.2.tar.gz

download: clean
	test -f $(bin) || wget "http://static.oculus.com/sdk-downloads/$(bin)"
	wget -O oculusconfigutil.png "http://s14.directupload.net/images/141118/thesboba.png"
	@ $(verifysha256)
	tar xvfz $(bin)

distclean: clean
	rm -f $(bin)
