include ../Makefile.inc

deps = wget
cleanfiles = unrar unrar-nonfree.1 rar_add.htm *.tar.gz debian/changelog changelog.new
URL = $(shell wget -q -O - "http://rarlabs.com/rar_add.htm" | \
	grep -e '\/unrarsrc-' | cut -d '"' -f2)


all: deps download build

nodeps: download build

build:
	@ $(buildpackage)

download: clean
	wget $(URL)

	# create new Debian changelog entry
	VERSION=$$(echo $(URL) | sed -e 's@http://www.rarlab.com/rar/unrarsrc-@@; s/.tar.gz//;') ;\
	echo "unrar-nonfree (1:$$VERSION) unstable; urgency=low" > changelog.new
	echo "" >> changelog.new
	echo "  * New upstream release (beta version)" >> changelog.new
	echo "" >> changelog.new
	#echo " -- `whoami` <`uname -n`>  `date -R`" >> changelog.new
	echo " -- Marshall Banana <djcj@gmx.de>  `date -R`" >> changelog.new
	echo "" >> changelog.new
	cat changelog.new debian/changelog.in > \
	debian/changelog
	rm changelog.new

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean
	rm -rf build.log $(cleanfiles)

