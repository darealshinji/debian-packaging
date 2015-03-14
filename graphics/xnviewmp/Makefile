include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin)
distcleanfiles = $(bin)

bin = XnViewMP-linux$(x64).tgz
ifeq ($(ARCH), amd64)
x64 = -x64
endif

changelog-msg = New release version
VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnviewmp/ | grep -e 'Download <strong>XnViewMP' | \
		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)

download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))
	VERSION=$(VERSION); $(changelog-entry)

