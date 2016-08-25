include ../../mk/include.mk

ARCH = i386

deps           = wget
bin            = cde-src.tgz
srcfiles       = cde-$(version)/*
cleanfiles     = cde-$(version)
distcleanfiles = $(bin)
version        = 2.2.4


download:
	@ $(call download,$(bin),https://sourceforge.net/projects/cdesktopenv/files/src/cde-src-$(version).tar.gz/download)
	@ $(call verifysha256,$(bin),557d8a4c86263fb96bb912a8fe26285ecccca4a4d734cf96462f2dc9e3dca67e)
	tar xf $(bin)
	@ VERSION=$(version); $(changelog-entry)

