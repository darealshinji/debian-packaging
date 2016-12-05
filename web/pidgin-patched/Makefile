include ../../mk/include.mk

VERSION = 2.10.12

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
UBUNTU_DEPS=libmessaging-menu-dev, libunity-dev
ENABLE_UNITY=--enable-unity
endif


download: debian/changelog debian/control debian/rules
	@ $(call download,$(bin),http://archive.ubuntu.com/ubuntu/pool/universe/p/pidgin/pidgin_$(VERSION).orig.tar.bz2)
	@ $(call verifysha256,$(bin),2c7523f0fefe89749c03b2b738ab9f7bd186da435be4762f1487eee31e77ffdd)
	tar xvf $(bin)
	sed -i 's|dist-bzip2|dist-bzip2 subdir-objects|' $(builddir)/configure.ac

debian/changelog:
	sed 's|@EPOCH@|$(EPOCH)|' $@.in > $@

debian/control:
	sed 's|@UBUNTU_DEPS@|$(UBUNTU_DEPS)|' $@.in > $@

debian/rules:
	sed 's|@ENABLE_UNITY@|$(ENABLE_UNITY)|' $@.in > $@

