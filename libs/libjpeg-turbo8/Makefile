include ../../mk/include.mk

deps           = wget dh-autoreconf
dir            = libjpeg-turbo-1.3.0
bin            = $(dir).tgz
builddir       = $(dir)
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),http://archive.ubuntu.com/ubuntu/pool/main/libj/libjpeg-turbo/libjpeg-turbo_1.3.0.orig.tar.gz)
	@ $(call verifysha256,$(bin),2657008cfc08aadbaca065bd9f8964b8a2c0abd03e73da5b5f09c1216be31234)
	tar xfv $(bin)

