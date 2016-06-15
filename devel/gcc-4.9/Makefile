include ../../mk/include.mk

deps           = wget
srcfiles       = *-*.t?z ../../mk/config.* patchelf.cpp
cleanfiles     = patchelf.cpp
distcleanfiles = *-*.t?z
VERSION        = $(shell grep '^gcc_ver=' debian/get-orig-source | cut -d= -f2)
changelog-msg  = New release version

download:
	debian/get-orig-source
	@ $(call download,patchelf.cpp,https://raw.githubusercontent.com/NixOS/patchelf/master/src/patchelf.cc)
	@ VERSION=$(VERSION) ; $(changelog-entry)

