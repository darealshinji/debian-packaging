include ../../mk/include.mk

deps           = curl wget unzip
freedm         = freedm-$(VERSION)
freedoom       = freedoom-$(VERSION)
srcfiles       = $(freedm) $(freedoom) files
cleanfiles     = $(freedm) $(freedoom)
distcleanfiles = *.zip

URL           = https://github.com/freedoom/freedoom/releases
VERSION       = $(shell curl $(URL)/latest -s -L -I -o /dev/null -w '%{url_effective}' | sed 's|.*tag/v||')
changelog-msg = New upstream release

download:
	@ $(call download,$(freedoom).zip,$(URL)/download/v$(VERSION)/$(freedoom).zip)
	@ $(call download,$(freedm).zip,$(URL)/download/v$(VERSION)/$(freedm).zip)
	unzip $(freedoom).zip
	unzip $(freedm).zip
	@ VERSION="$(VERSION)"; $(changelog-entry)

