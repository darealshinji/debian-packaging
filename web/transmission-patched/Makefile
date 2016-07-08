include ../../mk/include.mk

deps       = wget
bin        = transmission.txz
VERSION    = 2.92
builddir   = transmission-$(VERSION)
distcleanfiles = $(bin)


download:
	@ $(call download,$(bin),https://download.transmissionbt.com/files/transmission-$(VERSION).tar.xz)
	@ $(call verifysha256,$(bin),3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f)
	rm -rf $(builddir)
	tar xvf $(bin)

