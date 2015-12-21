include ../../mk/include.mk

deps       = wget
bin        = hterm.tar.gz
srcfiles   = $(bin) patchelf.cpp ../../mk/make-icons.sh
cleanfiles = patchelf.cpp

download:
	@ $(call download,$(bin),http://www.der-hammer.info/terminal/$(bin))
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),a329b7f671da73bbffaa3ff828db299ba8e4a52415777ed41d24bb6780647c7a)

