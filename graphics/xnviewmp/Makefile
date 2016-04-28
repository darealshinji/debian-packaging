include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) patchelf.cpp
cleanfiles     = patchelf.cpp
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 0.79
ver = 079

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 9e736b3b9ad674f0add9191c614b15902c8cb18e1cb27af7d3e9a5756b47dd55
else
sha256sum = e54b9f40016eeeb4335c4a13511560a19a95b5fd6a7870d1900bb4ccb08164fe
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

