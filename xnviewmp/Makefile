include ../Makefile.inc

deps = wget imagemagick chrpath
cleanfiles = build.log converted_icons XnView *.tgz
archive = XnViewMP-linux$(x64).tgz

arch = i386
ifeq ($(shell uname -p), x86_64)
x64 = -x64
arch = amd64
endif

download: clean
	wget "http://download.xnview.com/$(archive)"
	rm -rf XnView
	tar xvf $(archive)

