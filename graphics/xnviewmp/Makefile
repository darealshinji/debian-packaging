include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin)
cleanfiles     = $(deb)
distcleanfiles = *.tgz xnviewmp_update.txt
changelog-msg  = New release version

VERSION = $(shell wget -c -q http://www.xnview.com/xnviewmp_update.txt && head -n1 xnviewmp_update.txt | cut -d'=' -f2)
ver = $(shell echo $(VERSION) | tr -d '.')

ifeq ($(ARCH), amd64)
x64 = -x64
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/$(bin))
	@ VERSION=$(VERSION); $(changelog-entry)

