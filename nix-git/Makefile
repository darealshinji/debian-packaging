include ../Makefile.inc

deps = git libtool
cleanfiles = debian/changelog
srcpkg = nix
builddir = $(srcpkg)

download:
	git clone --depth 1500 "https://github.com/NixOS/nix.git"
	./changelog.sh
	rm -rf nix/.git nix/config/*
	cp /usr/share/libtool/config/config.* \
	   /usr/share/libtool/config/install-sh nix/config/
	cp -rf nix/doc/manual/figures nix/doc/manual/packages
	sed -i 's@ $$(d)/manual.is-valid@@' nix/doc/manual/local.mk
	sed -i 's@http://docbook.sourceforge.net/release/xsl-ns/1.78.1/@/usr/share/xml/docbook/stylesheet/docbook-xsl@;' \
	    nix/doc/manual/local.mk

