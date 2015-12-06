include ../../mk/include.mk

deps       = wget
bin        = hterm.tar.gz
png        = hterm.png
srcfiles   = $(bin) $(png) patchelf.cpp
cleanfiles = $(png) patchelf.cpp

download:
	@ $(call download,$(bin),http://www.der-hammer.info/terminal/$(bin))
	@ $(call download,$(png),http://icons.iconarchive.com/icons/everaldo/crystal-clear/128/App-terminal-icon.png)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ $(call verifysha256,$(bin),a329b7f671da73bbffaa3ff828db299ba8e4a52415777ed41d24bb6780647c7a)
	@ $(call verifysha256,$(png),38f912ebb76a96e7c31f2749349ea45e95918bf1f6a616739b58096926ebd0ec)

