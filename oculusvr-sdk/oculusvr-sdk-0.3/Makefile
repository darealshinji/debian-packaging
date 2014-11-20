include ../../Makefile.inc

deps = wget git automake freeglut3-dev imagemagick libudev-dev libxext-dev \
	libxinerama-dev libxrandr-dev libxxf86vm-dev mesa-common-dev
cleanfiles = OculusSDK *.png .pc

sha256_1 = 1456141f3f1a3120efd996c22e2d7f1ae50e57a8163b1e84c8a57622a5ce8d52
archive = ovr_sdk_linux_0.3.2.tar.gz


all: deps download build

nodeps: download build

build:
	rm -rf OculusSDK
	tar xvfz $(archive)
	@$(buildpackage)

download: clean
	test -f $(archive) || wget "http://static.oculus.com/sdk-downloads/$(archive)"
	wget -O oculusconfigutil.png "http://s14.directupload.net/images/141118/thesboba.png"
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
	debian/rules override_dh_auto_clean || true
	rm -rf build.log $(cleanfiles)

distclean: clean
	rm -f $(archive)
