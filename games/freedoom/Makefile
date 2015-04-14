include ../../mk/include.mk

deps       = wget unzip
cleanfiles = freed*
VERSION    = $(shell dpkg-parsechangelog -SVersion | cut -d- -f1)
URL        = https://github.com/freedoom/freedoom/releases/download
freedm     = freedm-$(VERSION)
freedoom   = freedoom-$(VERSION)
srcfiles   = $(freedm) $(freedoom) files

download:
	@ $(call download,$(freedoom).zip,$(URL)/v$(VERSION)/$(freedoom).zip)
	@ $(call download,$(freedm).zip,$(URL)/v$(VERSION)/$(freedm).zip)
	unzip $(freedoom).zip
	unzip $(freedm).zip

