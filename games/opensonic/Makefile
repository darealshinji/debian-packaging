include ../../mk/include.mk

deps     = wget
VERSION  = 0.1.4
builddir = opensnc-src-$(VERSION)
bin      = $(builddir).tar.gz

download:
	@ $(call download,$(bin),http://downloads.sourceforge.net/project/opensnc/Open%20Sonic/$(VERSION)/$(bin)?ts=1420143879)
	@ $(call verifysha256,$(bin),3a4c3fa9538ee27c04b5ea848c9ad0a83f335471936d4617a18d3648c42588e9)
	tar xvf $(bin)
