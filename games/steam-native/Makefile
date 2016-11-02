include ../../mk/include.mk

deps          = wget
srcfiles      = steam-native *_deb
cleanfiles    = *_deb
changelog-msg = Initial release

libpng_deb  = libpng12-0_1.2.54-1ubuntu1_i386.deb
libudev_deb = libudev0_175-0ubuntu9.10_i386.deb
libpng_sum  = d88be3c183fd753d0af22c732611735958d674b154ff473dc0fd140fef1cd17f
libudev_sum = e37839f0390920247c996e6df9bdf12c06cd84441c29f3dc9d4138190e8219f0
URL         = http://archive.ubuntu.com/ubuntu/pool/main


download:
	@ $(call download,libpng12-0_deb,$(URL)/libp/libpng/$(libpng_deb))
	@ $(call download,libudev0_deb,$(URL)/u/udev/$(libudev_deb))
	@ $(call verifysha256,libpng12-0_deb,$(libpng_sum))
	@ $(call verifysha256,libudev0_deb,$(libudev_sum))
	@ VERSION=0; $(changelog-entry)
