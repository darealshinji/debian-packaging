include ../../mk/include.mk

deps          = wget dh-autoreconf
builddir      = nasm-$(VERSION)
bin           = nasm-$(VERSION).tar.xz
changelog-msg = New release version
VERSION       = $(shell wget -q -O - 'http://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D' | \
		grep -o '\/">.*\/<\/a>' | sed '/rc/d; s|/">||; s|/</a>||' | head -n1)


download:
	@ $(call download,$(bin),http://www.nasm.us/pub/nasm/releasebuilds/$(VERSION)/$(bin))
	tar xvf $(bin)
	@ VERSION=$$(echo $(VERSION) | sed 's|rc|~rc|'); \
	$(changelog-entry)

