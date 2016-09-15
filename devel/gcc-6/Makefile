include ../../mk/include.mk

deps           = wget
srcfiles       = *-*.t?z ../../mk/config.* ../../mk/misc/gcc-wrapper.*
distcleanfiles = *-*.t?z
VERSION        = $(shell grep '^gcc_ver=' debian/get-orig-source | cut -d= -f2)
changelog-msg  = New release version

download:
	debian/get-orig-source
	@ VERSION=$(VERSION) ; $(changelog-entry)

