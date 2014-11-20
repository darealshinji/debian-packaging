include ../../Makefile.inc

deps = wget automake freeglut3-dev imagemagick libudev-dev libxext-dev \
	libxinerama-dev mesa-common-dev git
cleanfiles = OculusSDK *.png .pc

sha256_1 = d225957c76343aa4db157d1a39ae836c4257558f0b8667a4f180d3a5c60e5635
archive = ovr_sdk_linux_0.2.5c.tar.gz


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
