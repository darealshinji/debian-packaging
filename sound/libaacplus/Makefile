include ../../mk/include.mk

deps          = wget dh-autoreconf
3gppref       = 26410-800.zip
VERSION       = 2.0.2
changelog-msg = Initial release
builddir      = libaacplus-$(VERSION)
bin           = $(builddir).tar.gz
srcfiles      = $(3gppref)
cleanfiles    = $(3gppref)

download:
	@ $(call download,$(bin),http://ffmpeg.gusari.org/uploads/$(bin))
	@ $(call download,$(3gppref),http://www.3gpp.org/ftp/Specs/archive/26_series/26.410/$(3gppref))
	@ $(call verifysha256,$(bin),60dceb64d4ecf0be8d21661d5af2f214710f9d5b6ab389a5bdebf746baa7e1d7)
	@ $(call verifysha256,$(3gppref),4e7b3268b4e21a4dc2c88ee3af57c9115334d6b616a6e5f2e3f43643bf37b72f)
	tar xf $(bin)
	@ VERSION=$(VERSION); $(changelog-entry)

