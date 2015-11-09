include ../../mk/include.mk

VERSION = 2.10.11

deps           = wget
bin            = pidgin.tbz
builddir       = pidgin-$(VERSION)
cleanfiles     = debian/changelog debian/control debian/rules
distcleanfiles = $(bin)

ifneq ($(shell grep 'buntu' /etc/lsb-release),)
UBUNTU=1
else
UBUNTU=0
endif
ifeq ($(UBUNTU),0)
ifneq ($(shell grep 'buntu' /etc/issue),)
UBUNTU=1
endif
endif

ifeq ($(UBUNTU),1)
EPOCH=1:
# libmessaging-menu-dev is not available on Debian
# libunity-dev is only available in Debian Experimental
UBUNTU_DEPS=, libmessaging-menu-dev, libunity-dev
ENABLE_UNITY=--enable-unity
endif


download: debian/changelog debian/control debian/rules
	@ $(call download,$(bin),http://http.debian.net/debian/pool/main/p/pidgin/pidgin_$(VERSION).orig.tar.bz2)
	@ $(call verifysha256,$(bin),f2ae211341fc77efb9945d40e9932aa535cdf3a6c8993fe7919fca8cc1c04007)
	tar xvf $(bin)
	sed -i 's|dist-bzip2|dist-bzip2 subdir-objects|' $(builddir)/configure.ac

debian/changelog:
	sed 's|@EPOCH@|$(EPOCH)|' $@.in > $@

debian/control:
	sed 's|@UBUNTU_DEPS@|$(UBUNTU_DEPS)|' $@.in > $@

debian/rules:
	sed 's|@ENABLE_UNITY@|$(ENABLE_UNITY)|' $@.in > $@

