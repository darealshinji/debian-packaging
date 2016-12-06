include ../../mk/include.mk

deps       = wget
bin        = transmission.txz
VERSION    = 2.92
builddir   = transmission-$(VERSION)
cleanfiles = $(bin)


download:
	@ $(call download,$(bin),http://archive.ubuntu.com/ubuntu/pool/main/t/transmission/transmission_$(VERSION).orig.tar.xz)
	@ $(call verifysha256,$(bin),3a8d045c306ad9acb7bf81126939b9594553a388482efa0ec1bfb67b22acd35f)
	rm -rf $(builddir)
	tar xvf $(bin)

