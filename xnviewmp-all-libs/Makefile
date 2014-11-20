include ../Makefile.inc

deps = wget imagemagick chrpath
cleanfiles = build.log converted_icons usr XnView *.tgz *.tar.xz *.deb

arch = i386
ifeq ($(shell uname -p), x86_64)
x64 = -x64
arch = amd64
endif

archive = XnViewMP-linux$(x64).tgz
deb = libqt4-opengl_4.8.5+git192-g085f851+dfsg-2ubuntu4_$(arch).deb


all: deps download build

nodeps: download build

build:
	rm -rf XnView
	tar xvf $(archive)
	ar x $(deb) data.tar.xz
	tar xvf data.tar.xz
	@$(buildpackage)

download:
	wget "http://download.xnview.com/$(archive)"
	wget "http://archive.ubuntu.com/ubuntu/pool/main/q/qt4-x11/$(deb)"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	dh_clean || true
	rm -rf build.log $(cleanfiles)

