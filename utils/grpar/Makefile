include ../../mk/include.mk

deps           = wget
bin            = grpar-$(VERSION).tgz
builddir       = grpar-$(VERSION)
distcleanfiles = $(bin)

VERSION       = 0.2
changelog-msg = Initial release

download:
	@ $(call download,$(bin),http://contribs.martymac.org/grpar/$(bin))
	@ $(call verifysha256,$(bin),bc9184bb84b80cb0f4d4d05b0f0ad34676124910cf79a7bcd998a7cfd5e175ab)
	tar xvf $(bin)
	@ VERSION=$(VERSION); $(changelog-entry)

