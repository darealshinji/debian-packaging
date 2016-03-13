include ../../mk/include.mk

deps           = wget
bin            = grpar-$(VERSION).tgz
builddir       = grpar-grpar-$(VERSION)
distcleanfiles = $(bin)

VERSION       = 0.2
changelog-msg = Initial release

download:
	@ $(call download,$(bin),https://github.com/martymac/grpar/archive/grpar-0.2.tar.gz)
	@ $(call verifysha256,$(bin),7184561d5ce0b83d374af20537f3e7e358b326463b3ebebe4c7998f0ba157316)
	tar xvf $(bin)
	rm -f $(builddir)/Makefile
	@ VERSION=$(VERSION); $(changelog-entry)

