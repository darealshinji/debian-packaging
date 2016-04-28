include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) patchelf.cpp ../../mk/make-icons.sh
cleanfiles     = patchelf.cpp
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 1.72
ver = 172

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = ca478a71c3a1cc847d20c66cf4477dc5e174faf6fc284dc56aa2fa987d814562
else
sha256sum = 1925e2bd20a3130284361a7e0081d9cb273902e66b6ad666c0436e3ced5b2946
endif
bin = XnConvert-linux$(x64).tgz


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnConvert-$(ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ VERSION=$(VERSION); $(changelog-entry)

