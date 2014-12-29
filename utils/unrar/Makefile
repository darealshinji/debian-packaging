include ../../Makefile.inc

deps = wget
cleanfiles = unrar* rar_add.htm debian/changelog
srcfiles = unrar
srcpkg = unrar-nonfree
changelog-file = changelog.new
changelog-msg = New upstream release$$BETAVERSION

MAINURL = http://www.rarlab.com
URL = $(shell wget -q -O - "$(MAINURL)/rar_add.htm" | \
	grep -e '\/unrarsrc-' | cut -d '"' -f2)
VER = $(shell echo $(URL) | sed -e 's@$(MAINURL)/rar/unrarsrc-@@; s/.tar.gz//;')

download:
	wget $(URL)
	tar xvf unrarsrc-$(VER).tar.gz

	BETA=$$(grep -e 'RARVER_BETA' unrar/version.hpp | sed -e 's/\#define//; s/RARVER_BETA//; s/ //g') ;\
	if [ $$BETA = 0 ] ; then \
	    BETA='' ;\
	    BETAVERSION='' ;\
	else \
	    BETA="~b$$BETA" ;\
	    BETAVERSION=' (beta version)' ;\
	fi ;\
	VERSION=1:$(VER)$$BETA ;\
	$(changelog-entry)
	cat changelog.new debian/changelog.in > debian/changelog

