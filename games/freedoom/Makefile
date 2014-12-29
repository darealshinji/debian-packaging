include ../../Makefile.inc

deps = wget unzip
cleanfiles = freed*
VERSION = $(shell dpkg-parsechangelog -SVersion | cut -d- -f1)
gitadress = https://github.com/freedoom/freedoom/releases/download
srcfiles = freedm-$(VERSION) freedoom-$(VERSION) files

download:
	wget "$(gitadress)/v$(VERSION)/freedoom-$(VERSION).zip"
	wget "$(gitadress)/v$(VERSION)/freedm-$(VERSION).zip"
	unzip freedm-$(VERSION).zip
	unzip freedoom-$(VERSION).zip

