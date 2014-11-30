include ../Makefile.inc

deps = wget imagemagick chrpath
cleanfiles = XnView *.tgz
archive = XnViewMP-linux$(x64).tgz

ifeq ($(shell uname -p), x86_64)
x64 = -x64
endif

build: build-default

download: clean
	wget "http://download.xnview.com/$(archive)"
	rm -rf XnView
	tar xvf $(archive)

