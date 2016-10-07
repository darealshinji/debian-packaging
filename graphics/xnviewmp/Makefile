include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) patchelf.cpp
cleanfiles     = patchelf.cpp $(deb)
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 0.83
ver = 083

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = d4bbc01ca8248e28b36f051aa427f9c9257367284a1130e473c280b66d466d0c
else
sha256sum = 95eac6b118d49e6baaa61e82516004b84ca90adda186e18a5cbd8c2bf2e88235
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

