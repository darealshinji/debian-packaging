include ../../include.mk

deps = wget
srcfiles = $(bin)
distcleanfiles = $(bin)
srcpkg = xnconvert

bin = XnConvert-linux$(x64).tgz
ifeq ($(shell uname -p), x86_64)
x64 = -x64
endif

changelog-msg = New release version
VERSION = $(shell wget -q -O - http://www.xnview.com/en/xnconvert/ | grep -e 'Download <strong>XnConvert' | \
	perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)

download:
	test -f $(bin) || wget "http://download.xnview.com/$(bin)"
	VERSION=$(VERSION); $(changelog-entry)

