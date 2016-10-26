include ../../mk/include.mk

VERSION = 1.5.0

deps           = wget dh-autoreconf
dir            = libjpeg-turbo-$(VERSION)
bin            = $(dir).tgz
builddir       = $(dir)
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo_$(VERSION).orig.tar.gz)
	@ $(call verifysha256,$(bin),9f397c31a67d2b00ee37597da25898b03eb282ccd87b135a50a69993b6a2035f)
	tar xfv $(bin)

