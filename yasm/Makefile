include ../Makefile.inc

builddir = yasm-$(VERSION)
deps = wget dh-autoreconf autotools-dev bison gettext xmlto
cleanfiles = *.tar.gz *.pdf *.html $(builddir) images

VERSION = $(shell head -n1 debian-files/changelog | cut -d' ' -f2 | cut -d'-' -f1 | tail -c+2)
SITE = http://www.tortall.net/projects/yasm
HTML = $(SITE)/manual/html
sha256_1 = 3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f
bin = yasm-$(VERSION).tar.gz

build: build-default

download: clean
	wget "$(SITE)/releases/$(bin)"
	wget "$(SITE)/manual/manual.pdf"
	wget -O manual-ru.pdf "$(SITE)/manual/ru/manual.pdf"
	wget -k "$(HTML)/manual.html"
	wget -k -O manual-ru.html "$(SITE)/manual/ru/html/manual.html"
	wget "$(HTML)/objfmt-win64/calling-convention.png"
	wget "$(HTML)/objfmt-win64/stack-frame-detailed.png"
	wget "$(HTML)/arch-x86/x86-registers.png"

	@ $(verifysha256)
	tar xvfz $(bin)
	mkdir -p images && mv *.png images
	mv *.html *.pdf images $(builddir)
	cp -r debian-files $(builddir)/debian

