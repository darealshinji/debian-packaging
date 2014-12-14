include ../Makefile.inc

deps = git libtool
cleanfiles = debian/changelog
builddir = nix

download:
	git clone --depth 1500 "https://github.com/NixOS/nix.git"
	./changelog.sh
	rm -rf $(builddir)/.git $(builddir)/config/*
	cp /usr/share/libtool/config/config.* \
	   /usr/share/libtool/config/install-sh $(builddir)/config/
