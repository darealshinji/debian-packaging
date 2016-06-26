include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) patchelf.cpp
cleanfiles     = patchelf.cpp
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 0.80
ver = 080

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 70dfd611559acafb491a4af96d5a4c64129c96fc71a4a0441af1a9f36294bd94
else
sha256sum = bb9128a4bd12246ccc864b68694915fcf9872ac8522272cbe426b3a0884b8dcd
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

