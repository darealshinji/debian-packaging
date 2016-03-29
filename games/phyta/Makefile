include ../../mk/include.mk

deps           = wget
bin            = Phyta.tgz
deb_           = alsa-oss_1.0.28-1ubuntu1_i386
deb            = $(deb_)-deb
srcfiles       = $(bin) $(deb) patchelf.cpp
cleanfiles     = alsa-oss debian/copyright
distcleanfiles = $(srcfiles)

sha256sum     = 0c69445129645fdfb1370a1b8f1acf863466ed65e66a79ed97bca2f35afe5a3c
sha256sum_deb = 546abbf6a4f5b13f640bef152c16fc189c90d344fd55e57fe3459f3285319901

download:
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call download,$(bin),http://cambriangames.com/Phyta.tar.gz)
	@ $(call download,$(deb),http://archive.ubuntu.com/ubuntu/pool/universe/a/alsa-oss/$(deb_).deb)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ $(call verifysha256,$(deb),$(sha256sum_deb))
	dpkg -x $(deb) alsa-oss
	cat debian/copyright.in alsa-oss/usr/share/doc/alsa-oss/copyright > debian/copyright
	rm -rf alsa-oss

