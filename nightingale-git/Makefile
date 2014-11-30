include ../Makefile.inc

builddir = nightingale-hacking

deps = autoconf autotools-dev libasound2 libdbus-glib-1-dev libgnomevfs2-dev \
	libgstreamer-plugins-base0.10-dev libgtk2.0-dev libidl0 libjpeg-turbo8 \
	libsqlite0-dev libtag1-dev libnotify-dev libnspr4-dev libpng12-0 libunity-dev \
	libxext-dev libxt6 unzip wget zip
cleanfiles = $(builddir) usr data.tar.xz

ARCH = $(shell dpkg-architecture -qDEB_HOST_ARCH)
XULVERSION = 20140722-3%7Etrusty2

build: build-default

download: clean
	git clone --depth 1 "https://github.com/nightingale-media-player/nightingale-hacking.git"
	wget "https://launchpad.net/~djcj/+archive/ubuntu/nightingale/+files/nightingale-deps_$(XULVERSION)_$(ARCH).deb"

	ar x nightingale-deps*.deb data.tar.xz
	tar xfv data.tar.xz
	rm -rf nightingale-deps*.deb $(builddir)/debian/*
	cp -r debian-files/* $(builddir)/debian

	cd $(builddir)/debian && \
	wget "https://raw.githubusercontent.com/nightingale-media-player/nightingale-hacking/sb-trunk-oldxul/debian/changelog"
	./changelog.sh
