include ../../mk/include.mk

deps           = wget
VERSION        = 0.2.3
bin            = openrpgmaker-$(VERSION)-linux.tbz
srcfiles       = $(bin) ../../mk/make-icons.sh
distcleanfiles = $(bin)

download:
	@ $(call download,$(bin),http://downloads.sourceforge.net/project/openrpgmaker/$(VERSION)/openrpgmaker-$(VERSION)-linux.tar.bz2?r)
	@ $(call verifysha256,$(bin),62568dc35223740d2c73185a67657d011fd8e05161fa05f8f1e87faa4b92dcd3)
	@ VERSION=$(VERSION); $(changelog-entry)

