include ../Makefile.inc

deps = unzip
cleanfiles = README.adoc freedoom-* freedm-*
VERSION = $(shell dpkg-parsechangelog -SVersion | cut -d- -f1)
gitadress = https://github.com/freedoom/freedoom/releases/download

download: clean
	wget "$(gitadress)/v$(VERSION)/freedoom-$(VERSION).zip"
	wget "$(gitadress)/v$(VERSION)/freedm-$(VERSION).zip"
	wget "https://raw.githubusercontent.com/freedoom/freedoom/master/README.adoc"
	unzip freedm-$(VERSION).zip
	unzip freedoom-$(VERSION).zip

