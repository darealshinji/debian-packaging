include ../../mk/include.mk

deps           = wget
srcfiles       = $(bin) data.txz patchelf.cpp
cleanfiles     = patchelf.cpp $(deb)
distcleanfiles = *.tgz *.txz
changelog-msg  = New release version

VERSION = 0.82
ver = 082

ifeq ($(ARCH), amd64)
x64 = -x64
sha256sum = 592aec72ff0b730d3a2d8979131fb7d4944cd4c3b3a587c5a93dcbeb51a1c258
sha256sum_deb = b32d9c437e7ddbac25be3bce4297a4c2466352efc251e09bfecc866b6393025a
else
sha256sum = c7263b7d782027f41273d09491fdb1511af2ea3d8dbeb4f2be7771e3130a0250
sha256sum_deb = 0426a16db37a023b4c9a015dc674e92667f4bffa94ad66b1954cb99fca713762
endif
bin = XnViewMP-linux$(x64).tgz
deb = libilmbase6_deb


download:
	@ $(call download,$(bin),http://download.xnview.com/old_versions/XnViewMP-$(ver)-linux$(x64).tgz)
	@ $(call download,$(deb),http://archive.ubuntu.com/ubuntu/pool/main/i/ilmbase/libilmbase6_1.0.1-6ubuntu1_$(ARCH).deb)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),$(sha256sum))
	@ $(call verifysha256,$(deb),$(sha256sum_deb))
	ar x $(deb) data.tar.xz
	mv data.tar.xz data.txz
	@ VERSION=$(VERSION); $(changelog-entry)

