include ../Makefile.inc

deps = unzip
cleanfiles = README.adoc freedoom-* freedm-*

VERSION=$(shell dpkg-parsechangelog -SVersion | cut -d- -f1)


all: deps download build

nodeps: download build

build:
	unzip freedm-$(VERSION).zip
	unzip freedoom-$(VERSION).zip
	$(buildpackage)

download:
	wget "https://github.com/freedoom/freedoom/releases/download/v$(VERSION)/freedoom-$(VERSION).zip"
	wget "https://github.com/freedoom/freedoom/releases/download/v$(VERSION)/freedm-$(VERSION).zip"
	wget "https://raw.githubusercontent.com/freedoom/freedoom/master/README.adoc"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

