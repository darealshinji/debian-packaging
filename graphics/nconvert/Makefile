include ../../mk/include.mk

deps       = wget
srcfiles   = $(bin)
cleanfiles = $(bin)

bin = NConvert-linux$(x64).tgz
ifeq ($(ARCH), amd64)
x64 = 64
endif

changelog-msg = Latest release version
VERSION       = $(shell wget -q -O - http://www.xnview.com/en/nconvert/ | grep -e 'for Linux (x86)' | \
		perl -ne 'printf qq[%s\n], $$1 if m/<p>([^<]+)<\/p>/' | cut -d' ' -f2)

download:
	wget "http://download.xnview.com/$(bin)"
	VERSION=$(VERSION); $(changelog-entry)

