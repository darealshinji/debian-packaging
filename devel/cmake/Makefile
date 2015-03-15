include ../../mk/include.mk

deps           = wget
bin            = cmake.tgz
srcfiles       = $(bin) ReleaseNotes
distcleanfiles = $(srcfiles)
changelog-msg  = New release version

VERSION  = $(shell wget -q -O - http://www.cmake.org/download/ | grep 'Latest Release' | head -n1 | cut -d'(' -f2 | cut -d')' -f1)
SHORTVER = $(shell echo $(VERSION) | head -c3 )

BINARCH = i386
ifeq ($(ARCH), amd64)
BINARCH = x86_64
endif


download:
	@ $(call download,$(bin),http://www.cmake.org/files/v$(SHORTVER)/cmake-$(VERSION)-Linux-$(BINARCH).tar.gz)
	@ $(call download,ReleaseNotes,http://www.cmake.org/cmake/help/v$(SHORTVER)/_sources/release/$(SHORTVER).txt)
	@ VERSION=$(VERSION); $(changelog-entry)

