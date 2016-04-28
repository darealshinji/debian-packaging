include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) $(xnconv) patchelf.cpp ../../mk/make-icons.sh
cleanfiles     = patchelf.cpp
distcleanfiles = *.tgz
changelog-msg  = New release version

VERSION = 1.18
ver = 118

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 15273b7e38bcac2b4a34034e383547243b3d086ac57259629e49afabe4adace5
sha256sum_xnconv = ca478a71c3a1cc847d20c66cf4477dc5e174faf6fc284dc56aa2fa987d814562
else
sha256sum = bfc35afc4e333db3cc298bffda1f35beca45e8b1b693bc9a45c5bceb161ceae2
sha256sum_xnconv = 1925e2bd20a3130284361a7e0081d9cb273902e66b6ad666c0436e3ced5b2946
endif
bin = XnSketch-linux$(x64).tgz

# required to install all Qt dependencies
xnconv = XnConvert-linux$(x64).tgz
conv_ver = 172


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnSketch-$(ver)-linux$(x64).tgz)
	@ $(call download,$(xnconv),http://download.xnview.com/old_versions/XnConvert-$(conv_ver)-linux$(x64).tgz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ $(call verifysha256,$(xnconv),$(sha256sum_xnconv))
	@ VERSION=$(VERSION); $(changelog-entry)

