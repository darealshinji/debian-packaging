include ../Makefile.inc

deps = wget dh-autoreconf autotools-dev bison gettext xmlto
cleanfiles = *.tar.gz *.pdf *.html source images debian/autoreconf.after debian/autoreconf.before

SITE = http://www.tortall.net/projects/yasm
VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | cut -d'-' -f1 | tail -c+2)


all: deps download build

nodeps: download build

build:
	mkdir -p images
	mv *.png images
	tar xvfz yasm-$(VERSION).tar.gz
	mv yasm-$(VERSION) source
	$(buildpackage)

download: clean
	wget "$(SITE)/releases/yasm-$(VERSION).tar.gz"
	wget "$(SITE)/manual/manual.pdf"
	wget -O manual-ru.pdf "$(SITE)/manual/ru/manual.pdf"
	wget -k "$(SITE)/manual/html/manual.html"
	wget -k -O manual-ru.html "$(SITE)/manual/ru/html/manual.html"
	wget "$(SITE)/manual/html/objfmt-win64/calling-convention.png"
	wget "$(SITE)/manual/html/objfmt-win64/stack-frame-detailed.png"
	wget "$(SITE)/manual/html/arch-x86/x86-registers.png"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

