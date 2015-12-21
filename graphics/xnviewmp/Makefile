include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin)
distcleanfiles = $(bin)

bin = XnViewMP-linux$(x64).tgz
ifeq ($(ARCH), amd64)
x64 = -x64
endif

changelog-msg = New release version
VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnviewmp/ | grep -e 'Download <strong>XnView' | \
		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | sed 's|[A-Za-z]||g; s| ||g; s|:||g')

download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))
	@ VERSION=$(VERSION); $(changelog-entry)

