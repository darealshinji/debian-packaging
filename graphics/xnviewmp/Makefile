include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin)
cleanfiles     = $(deb)
distcleanfiles = *.tgz
changelog-msg  = New release version

# http://www.xnview.com/xnviewmp_update.txt
VERSION = 0.84
ver = 084

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 586b189b8fe6fd791dae918d010422f7463aeebd52f11507b710eaad8695a73b
else
sha256sum = c6d62f40e272698ecd41bc642fb6c7220f6e444f2f0f734885f430396ce5ba5c
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

