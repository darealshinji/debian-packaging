include ../../mk/include.mk

VERSION = 1.4.2

deps           = wget dh-autoreconf
dir            = libjpeg-turbo-$(VERSION)
bin            = $(dir).tgz
builddir       = $(dir)
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo_$(VERSION).orig.tar.gz)
	@ $(call verifysha256,$(bin),521bb5d3043e7ac063ce3026d9a59cc2ab2e9636c655a2515af5f4706122233e)
	tar xfv $(bin)

