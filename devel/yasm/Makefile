include ../../mk/include.mk

deps       = wget dh-autoreconf autotools-dev
builddir   = yasm-$(VERSION)
cleanfiles = *.pdf *.png *.html images

VERSION    = 1.3.0
bin        = yasm-$(VERSION).tar.gz
bin_sha256 = 3dce6601b495f5b3d45b59f7d2492a340ee7e84b5beca17e48f862502bd5603f
SITE       = http://www.tortall.net/projects/yasm

download:
	@ $(call download,$(bin),$(SITE)/releases/$(bin))
	@ $(call download,manual.pdf,$(SITE)/manual/manual.pdf)
	@ $(call download,manual-ru.pdf,$(SITE)/manual/ru/manual.pdf)
	test -f manual.html || wget -k "$(SITE)/manual/html/manual.html"
	test -f manual-ru.html || wget -k -O manual-ru.html "$(SITE)/manual/ru/html/manual.html"
	@ $(call download,calling-convention.png,$(SITE)/manual/html/objfmt-win64/calling-convention.png)
	@ $(call download,stack-frame-detailed.png,$(SITE)/manual/html/objfmt-win64/stack-frame-detailed.png)
	@ $(call download,x86-registers.png,$(SITE)/manual/html/arch-x86/x86-registers.png)

	sed -i 's@$(SITE)/manual/html/objfmt-win64/calling-convention.png@images/calling-convention.png@;' manual.html
	sed -i 's@$(SITE)/manual/html/objfmt-win64/stack-frame-detailed.png@images/stack-frame-detailed.png@;' manual.html
	sed -i 's@$(SITE)/manual/html/arch-x86/x86-registers.png@images/x86-registers.png@;' manual.html

	sed -i 's@$(SITE)/manual/ru/html/objfmt-win64/calling-convention.png@images/calling-convention.png@;' manual-ru.html
	sed -i 's@$(SITE)/manual/ru/html/objfmt-win64/stack-frame-detailed.png@images/stack-frame-detailed.png@;' manual-ru.html
	sed -i 's@$(SITE)/manual/ru/html/arch-x86/x86-registers.png@images/x86-registers.png@;' manual-ru.html

	@ $(call verifysha256,$(bin),$(bin_sha256))
	tar xvfz $(bin)
	mkdir -p images && mv *.png images
	mv *.html *.pdf images $(builddir)

	VERSION=$(VERSION) ; $(changelog-entry)

