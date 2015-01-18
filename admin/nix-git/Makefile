include ../../mk/include.mk

deps       = git libtool
cleanfiles = debian/changelog
builddir   = nix

download:
	git clone --depth 1500 "https://github.com/NixOS/nix.git"
	./changelog.sh
	rm -rf $(builddir)/.git $(builddir)/config/*
	cp /usr/share/libtool/config/config.* \
	   /usr/share/libtool/config/install-sh $(builddir)/config/
	# build and install nix-generate-patches manpage
	sed -i 's/^<!--$$//; s/^-->$$//;' nix/doc/manual/command-ref/utilities.xml
	sed -i 's/nix-channel.1/nix-channel.1 nix-generate-patches.1/;' nix/doc/manual/local.mk
