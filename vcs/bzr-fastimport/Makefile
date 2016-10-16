include ../../mk/include.mk

deps           = wget
tarball        = bzr-fastimport_$(VER).orig.tar.gz
deb_tarball    = bzr-fastimport_$(VER)-$(REV).debian.tar.xz
builddir       = bzr-fastimport-$(VER)

#URL = http://http.debian.net/debian/pool/main/b/bzr-fastimport
URL = http://archive.ubuntu.com/ubuntu/pool/universe/b/bzr-fastimport
VER = 0.13.0+bzr361
REV = 1


download:
	@ $(call download,$(tarball),$(URL)/bzr-fastimport_$(VER).orig.tar.gz)
	@ $(call download,$(deb_tarball),$(URL)/bzr-fastimport_$(VER)-$(REV).debian.tar.xz)
	@ $(call verifysha256,$(tarball),7d9467175279dd2f7a92638aaeeba9874098db6d6bda2fa127722f449f80326d)
	@ $(call verifysha256,$(deb_tarball),b6b20af5ab6e424a00bfb877cf5c3b1c0b746dbdc18516f80635d3f12da72b1e)
	tar xf $(tarball)
	cd $(builddir) && tar xf ../$(deb_tarball)

