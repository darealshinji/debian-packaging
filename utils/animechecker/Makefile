include ../../mk/include.mk

ARCH       = i386
deps       = wget
srcfiles   = $(bin) animechecker.svg patchelf.cpp
cleanfiles = *.svg *.cpp
VERSION    = 0.9.6.1
bin        = animechecker-$(VERSION)-linux-i386-bin.tar.bz2

changelog-msg = Initial release


download:
	@ $(call download,$(bin),http://downloads.sourceforge.net/project/animechecker/animechecker-linux/$(VERSION)/$(bin)?r=)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call download,animechecker.svg,https://upload.wikimedia.org/wikipedia/commons/d/da/Wikipe-tan_face.svg)
	@ $(call verifysha256,$(bin),208b4485f7776db27109f974b064fc7ff9abdeb5676187a1206fb94e561bb11a)
	@ VERSION=$(VERSION); $(changelog-entry)

