include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) patchelf.cpp
cleanfiles     = patchelf.cpp
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 0.81
ver = 081

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 4c2ffcc801251f87c6abee7f2cec32d46acf1a491903e209270a67bef10b3103
else
sha256sum = abe4a032b42c8d046b31e8c2197b3812169ac76fc2b453e01619eb2e1fac0c18
endif
bin = XnViewMP-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

