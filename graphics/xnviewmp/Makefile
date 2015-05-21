include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) *.png
distcleanfiles = $(bin) *.png

bin = XnViewMP-linux$(x64).tgz
ifeq ($(ARCH), amd64)
x64 = -x64
endif

changelog-msg = New release version
VERSION       = $(shell wget -q -O - http://www.xnview.com/en/xnviewmp/ | grep -e 'Download <strong>XnViewMP' | \
		perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)

download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))
	@ $(call download,xnview.png,http://www.xnview.com/assets/img/app-xnviewmp-512.png)
	@ $(call download,xnview_2.png,http://www.xnview.com/assets/img/app-xnsoft-512.png)
	@ VERSION=$(VERSION); $(changelog-entry)

