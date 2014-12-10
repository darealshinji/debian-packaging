include ../Makefile.inc

deps = wget dh-autoreconf autotools-dev
builddir = yasm-$(VERSION)
cleanfiles = *.tar.gz *.pdf *.html images

VERSION = $(shell head -n1 debian/changelog | cut -d' ' -f2 | cut -d'-' -f1 | tail -c+2)
SITE = http://www.tortall.net/projects/yasm
sha256_1 = 3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f
bin = yasm-$(VERSION).tar.gz

download: clean
	wget "$(SITE)/releases/$(bin)"
	wget "$(SITE)/manual/manual.pdf"
	wget -O manual-ru.pdf "$(SITE)/manual/ru/manual.pdf"
	wget -k "$(SITE)/manual/html/manual.html"
	wget -k -O manual-ru.html "$(SITE)/manual/ru/html/manual.html"
	wget "$(SITE)/manual/html/objfmt-win64/calling-convention.png"
	wget "$(SITE)/manual/html/objfmt-win64/stack-frame-detailed.png"
	wget "$(SITE)/manual/html/arch-x86/x86-registers.png"

	sed -i 's@$(SITE)/manual/html/objfmt-win64/calling-convention.png@images/calling-convention.png@; s@$(SITE)/manual/html/objfmt-win64/stack-frame-detailed.png@images/stack-frame-detailed.png@; s@$(SITE)/manual/html/arch-x86/x86-registers.png@images/x86-registers.png@;' manual.html
	sed -i 's@$(SITE)/manual/ru/html/objfmt-win64/calling-convention.png@images/calling-convention.png@; s@$(SITE)/manual/ru/html/objfmt-win64/stack-frame-detailed.png@images/stack-frame-detailed.png@; s@$(SITE)/manual/ru/html/arch-x86/x86-registers.png@images/x86-registers.png@;' manual-ru.html

	@ $(verifysha256)
	tar xvfz $(bin)
	mkdir -p images && mv *.png images
	mv *.html *.pdf images $(builddir)

