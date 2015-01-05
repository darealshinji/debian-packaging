include ../../mk/include.mk

deps          = wget dh-autoreconf
builddir      = nasm-$(VERSION)
bin           = nasm-$(VERSION).tar.xz
changelog-msg = New release version
VERSION       = $(shell wget -q -O - 'http://www.nasm.us/pub/nasm/releasebuilds/?C=M;O=D' | \
		grep 'alt="\[DIR]"></td><td>' - | head -n1 | cut -d '>' -f7 | sed 's@/</a@@')


download:
	wget "http://www.nasm.us/pub/nasm/releasebuilds/$(VERSION)/$(bin)"
	tar xvf $(bin)
	@ VERSION=$(VERSION); $(changelog-entry)

