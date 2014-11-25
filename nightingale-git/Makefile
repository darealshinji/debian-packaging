include ../Makefile.inc

deps = autoconf autotools-dev libasound2 libdbus-glib-1-dev libgnomevfs2-dev \
	libgstreamer-plugins-base0.10-dev libgtk2.0-dev libidl0 libjpeg-turbo8 \
	libsqlite0-dev libtag1-dev libnotify-dev libnspr4-dev libpng12-0 libunity-dev \
	libxext-dev libxt6 unzip wget zip
cleanfiles = nightingale-hacking-sb-trunk-oldxul usr data.tar.xz *.tar.gz *.deb

TARBALL = sb-trunk-oldxul.tar.gz
ARCH = $(shell dpkg-architecture -qDEB_HOST_ARCH)
XULVERSION = 20140722-3%7Etrusty2


all: deps download build

nodeps: download build

build:
	tar xfv $(TARBALL)
	ar x nightingale-deps*.deb data.tar.xz
	tar xfv data.tar.xz
	rm -rf nightingale-deps*.deb nightingale-hacking-sb-trunk-oldxul/debian
	cp -r debian nightingale-hacking-sb-trunk-oldxul/

	@ cd nightingale-hacking-sb-trunk-oldxul && \
	$(buildpackage)
	mv -f nightingale-hacking-sb-trunk-oldxul/build.log .
	mv -f *.deb *.changes ../

download: clean
	wget "https://github.com/nightingale-media-player/nightingale-hacking/archive/$(TARBALL)"
	wget "https://launchpad.net/~djcj/+archive/ubuntu/nightingale/+files/nightingale-deps_$(XULVERSION)_$(ARCH).deb"

deps:
	sudo apt-get install debhelper $(deps)

clean:
	rm -rf build.log $(cleanfiles)

