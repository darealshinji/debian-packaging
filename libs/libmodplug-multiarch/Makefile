include ../../mk/include.mk

deps           = wget dh-autoreconf autotools-dev
dir            = libmodplug-0.8.8.5
bin            = libmodplug_0.8.8.5.orig.tar.gz
builddir       = $(dir)

download:
	@ $(call download,$(bin),http://http.debian.net/debian/pool/main/libm/libmodplug/$(bin))
	@ $(call verifysha256,$(bin),77462d12ee99476c8645cb5511363e3906b88b33a6b54362b4dbc0f39aa2daad)
	tar xfv $(bin)

