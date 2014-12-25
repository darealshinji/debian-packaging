include ../Makefile.inc

deps = wget
srcfiles = $(bin)
distcleanfiles = $(bin)
srcpkg = xnretro
bin = XnRetro-linux.tgz

changelog-msg = New release version
VERSION = $(shell wget -q -O - http://www.xnview.com/en/xnretro/ | grep -e 'Download <strong>XnRetro' | \
	perl -ne 'printf qq[%s\n], $$1 if m/<strong>([^<]+)<\/strong>/' | cut -d' ' -f2)

download:
	test -f $(bin) || wget "http://download.xnview.com/$(bin)"
	VERSION=$(VERSION); $(changelog-entry)

