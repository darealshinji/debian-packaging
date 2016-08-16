include ../../mk/include.mk

deps           = wget
bin            = go-ipfs.tgz
srcfiles       = $(bin) CHANGELOG.md
cleanfiles     = CHANGELOG.md
distcleanfiles = $(bin)
VERSION        = $(shell wget -q -O - https://dist.ipfs.io/go-ipfs/versions | grep -v 'rc' | tail -n1 | tr -d 'v')
changelog-msg  = Initial release

DLARCH = 386
ifeq ($(ARCH), amd64)
DLARCH = amd64
endif

download:
	@ $(call download,$(bin),https://dist.ipfs.io/go-ipfs/v$(VERSION)/go-ipfs_v$(VERSION)_linux-$(DLARCH).tar.gz)
	@ $(call download,CHANGELOG.md,https://raw.githubusercontent.com/ipfs/go-ipfs/v$(VERSION)/CHANGELOG.md)
	@ VERSION=$(VERSION); $(changelog-entry)

