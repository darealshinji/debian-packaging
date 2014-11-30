include ../Makefile.inc

deps = git asciidoc deutex gsfonts imagemagick
cleanfiles = freedoom debian/changelog

build: build-default

download: clean
	git clone "https://github.com/freedoom/freedoom.git"
	./changelog.sh

