include ../../mk/include.mk

deps           = wget
bin            = $(builddir).tbz
distcleanfiles = $(bin)
builddir       = FFmbc-0.7-rc8


download:
	@ $(call download,$(bin),https://ffmbc.googlecode.com/files/$(builddir).tar.bz2)
	@ $(call verifysha256,$(bin),f23fc8658a703f40e25f6c510fa44f9d05376d1c1280df4de26631f139a8dbc3)
	tar xvf $(bin)

