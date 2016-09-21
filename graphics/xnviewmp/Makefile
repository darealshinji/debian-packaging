include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) patchelf.cpp
cleanfiles     = patchelf.cpp
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 0.82
ver = 082

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 592aec72ff0b730d3a2d8979131fb7d4944cd4c3b3a587c5a93dcbeb51a1c258
else
sha256sum = c7263b7d782027f41273d09491fdb1511af2ea3d8dbeb4f2be7771e3130a0250
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

