include ../../Makefile.inc

deps = wget git automake imagemagick
cleanfiles = OculusSDK *.png .pc

sha256_1 = a1924360c6264d9a6c602ece5c50ebfb1bce740a730e2ed64079e44fe6461017
VERSION = 0.4.3
archive = ovr_sdk_linux_$(VERSION).tar.xz


all: deps download build

nodeps: download build

build:
	rm -rf ovr_sdk_linux_$(VERSION) OculusSDK
	tar xvf $(archive)
	mv ovr_sdk_linux_$(VERSION) OculusSDK
	@$(buildpackage)

download: clean
	test -f $(archive) || wget "http://static.oculus.com/sdk-downloads/$(archive)"
	wget -O riftconfigutil.png "http://s14.directupload.net/images/141118/thesboba.png"
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
	rm -rf build.log $(cleanfiles) ovr_sdk_linux_$(VERSION)

distclean: clean
	rm -f $(archive)
