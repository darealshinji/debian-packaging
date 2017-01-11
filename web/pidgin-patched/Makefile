include ../../mk/include.mk

VERSION = 2.11.0

deps           = wget
bin            = pidgin.tbz
builddir       = pidgin-$(VERSION)
cleanfiles     = debian/control debian/rules
distcleanfiles = $(bin)
changelog-msg  = Disable annoying ICQ error message

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

download: debian/control debian/rules
	@ $(call download,$(bin),http://downloads.sourceforge.net/project/pidgin/Pidgin/$(VERSION)/pidgin-$(VERSION).tar.bz2)
	@ $(call verifysha256,$(bin),f72613440586da3bdba6d58e718dce1b2c310adf8946de66d8077823e57b3333)
	tar xvf $(bin)
	@ VERSION="2:$(VERSION)"; $(changelog-entry)

debian/control:
	sed 's|@UBUNTU_DEPS@|$(UBUNTU_DEPS)|' $@.in > $@

debian/rules:
	sed 's|@ENABLE_UNITY@|$(ENABLE_UNITY)|' $@.in > $@

