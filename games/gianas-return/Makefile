include ../../mk/include.mk

deps           = wget
bin            = giana.tgz
distcleanfiles = $(bin) patchelf.cpp
srcfiles       = $(bin) patchelf.cpp


download:
	@ $(call download,$(bin),http://www.retroguru.com/gianas-return/gianas-return-v.latest-linux.tar.gz)
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)

