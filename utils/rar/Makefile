include ../../mk/include.mk

deps           = wget
builddir       = rar-src
srcfiles       = rar
cleanfiles     = rar* debian/changelog
changelog-file = changelog.new
changelog-msg  = New upstream release (beta version)

ifeq ($(ARCH), amd64)
x64 = x64-
endif
MAINURL = http://www.rarlabs.com
URL     = $(MAINURL)$(shell wget -q -O - "$(MAINURL)/download.htm" | \
		grep -e "\/rarlinux-$(x64)" | head -n1 | cut -d '"' -f2)
VER     = $(shell echo $(URL) | sed -e 's@$(MAINURL)/rar/rarlinux-$(x64)@@; s/.tar.gz//; s/-//;')

download:
	@ $(call download,rar.tar.gz,$(URL))
	tar xvf rar.tar.gz
	VERSION=2:$(shell echo $(VER) | sed -e 's/b/~b/;'); $(changelog-entry)
	cat changelog.new debian/changelog.in > debian/changelog

