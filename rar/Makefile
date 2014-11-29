include ../Makefile.inc

deps = wget
cleanfiles = rar rar.1 *.tar.gz debian/changelog changelog.new

ifeq ($(shell dpkg-architecture -qDEB_HOST_ARCH),amd64)
x64 = x64
endif
MAINURL = http://www.rarlabs.com
URL = $(MAINURL)$(shell wget -q -O - "$(MAINURL)/download.htm" | \
	grep -e '\/rarlinux-$(x64)' | head -n1 | cut -d '"' -f2)
VER = $(shell echo $(URL) | sed -e 's@$(MAINURL)/rar/rarlinux-$(x64)@@; s/.tar.gz//; s/-//;')


download: clean
	wget $(URL)

	# create new Debian changelog entry
	VERSION=$$(echo $(VER) | sed -e 's/.b/.0~b/;') ;\
	echo "rar (2:$$VERSION) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * New upstream release (beta version)" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new debian/changelog.in > debian/changelog

	tar xvf rarlinux-$(x64)-$(VER).tar.gz

