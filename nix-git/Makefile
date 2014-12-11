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
	sed -i 's/docbookxsl =/docbookxsl ?=/; s/docbookrng =/docbookrng ?=/;' nix/doc/manual/local.mk
