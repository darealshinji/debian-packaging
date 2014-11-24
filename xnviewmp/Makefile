include ../Makefile.inc

deps = wget imagemagick chrpath
cleanfiles = build.log converted_icons XnView *.tgz

arch = i386
ifeq ($(shell uname -p), x86_64)
x64 = -x64
arch = amd64
endif

archive = XnViewMP-linux$(x64).tgz


all: deps download build

nodeps: download build

build:
	rm -rf XnView
	tar xvf $(archive)
	@$(buildpackage)

download: clean
	wget "http://download.xnview.com/$(archive)"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

