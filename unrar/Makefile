include ../Makefile.inc

deps = wget
cleanfiles = unrar unrar-nonfree.1 rar_add.htm *.tar.gz debian/changelog changelog.new

MAINURL = http://www.rarlab.com
URL = $(shell wget -q -O - "$(MAINURL)/rar_add.htm" | \
	grep -e '\/unrarsrc-' | cut -d '"' -f2)
VER = $(shell echo $(URL) | sed -e 's@$(MAINURL)/rar/unrarsrc-@@; s/.tar.gz//;')

download: clean
	wget $(URL)
	tar xvf unrarsrc-$(VER).tar.gz

	# create new Debian changelog entry
	BETA=$$(grep -e 'RARVER_BETA' unrar/version.hpp | sed -e 's/\#define//; s/RARVER_BETA//; s/ //g') ;\
	if [ $$BETA = 0 ] ; then \
	    BETA='' ;\
	    BETAVERSION='' ;\
	else \
	    BETA="~b$$BETA" ;\
	    BETAVERSION=' (beta version)' ;\
	fi ;\
	echo "unrar-nonfree (1:$(VER)$$BETA) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * New upstream release$$BETAVERSION" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new debian/changelog.in > \
	debian/changelog

