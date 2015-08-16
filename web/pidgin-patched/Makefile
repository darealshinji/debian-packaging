include ../../mk/include.mk

VERSION = 2.10.11

deps           = wget
bin            = pidgin.tbz
builddir       = pidgin-$(VERSION)
cleanfiles     = debian/control debian/rules
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


# libmessaging-menu-dev is not available on Debian
# libunity-dev is only available in Debian Experimental
debian/control:
ifeq ($(UBUNTU),1)
	sed 's|@UBUNTU_DEPS@|, libmessaging-menu-dev, libunity-dev|' $@.in > $@
else
	sed 's|@UBUNTU_DEPS@||' $@.in > $@
endif

debian/rules:
ifeq ($(UBUNTU),1)
	sed 's|@UNITY@|--enable-unity|' $@.in > $@
else
	sed 's|@UNITY@||' $@.in > $@
endif

download: debian/control debian/rules
	@ $(call download,$(bin),http://http.debian.net/debian/pool/main/p/pidgin/pidgin_$(VERSION).orig.tar.bz2)
	@ $(call verifysha256,$(bin),f2ae211341fc77efb9945d40e9932aa535cdf3a6c8993fe7919fca8cc1c04007)
	tar xvf $(bin)
	sed -i 's|dist-bzip2|dist-bzip2 subdir-objects|' $(builddir)/configure.ac

