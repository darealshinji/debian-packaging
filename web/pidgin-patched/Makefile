include ../../mk/include.mk

VER            = 2.10.11

deps           = wget
bin            = pidgin.tbz
builddir       = pidgin-$(VER)
distcleanfiles = $(bin)
URL            = http://http.debian.net/debian/pool/main/p/pidgin


download:
	@ $(call download,$(bin),$(URL)/pidgin_$(VER).orig.tar.bz2)
	@ $(call verifysha256,$(bin),f2ae211341fc77efb9945d40e9932aa535cdf3a6c8993fe7919fca8cc1c04007)
	tar xvf $(bin)

