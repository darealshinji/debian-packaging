include ../../mk/include.mk

deps           = wget
bin            = SendSpace_Wizard_Debian-Linux-32-64bit.tgz
distcleanfiles = $(bin)
cleanfiles     = wizard patchelf.cpp
srcfiles       = wizard patchelf.cpp

VERSION       = 1.3.9
changelog-msg = Initial release

download:
	@ $(call download,$(bin),http://www.sendspace.com/pro/dl/bb0pg3)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),b95032d3932939522fc00c55b08e1cbd3aa2fdf62d1f0362aaf9e0a29c36cfcf)
	tar xvf $(bin)
	@ VERSION=$(VERSION); $(changelog-entry)

