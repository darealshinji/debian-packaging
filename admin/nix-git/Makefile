include ../../mk/include.mk

deps       = git libtool
cleanfiles = debian/changelog
builddir   = nix

download:
	git clone --depth 1500 "https://github.com/NixOS/nix.git"
	git clone --depth 1 "https://github.com/jedisct1/libsodium.git" nix/libsodium
	./changelog.sh

	rm -rf nix/.git nix/libsodium/.git nix/config/*
	cp /usr/share/libtool/config/config.* /usr/share/libtool/config/install-sh nix/config/
	cp -f debian/bootstrap.sh nix/

	# link perl module correctly
	echo "Store_LDFLAGS += -lperl -pthread" >> nix/perl/local.mk

	# build and install nix-generate-patches manpage
	sed -i 's/^<!--$$//; s/^-->$$//;' nix/doc/manual/command-ref/utilities.xml
	sed -i 's/nix-channel.1/nix-channel.1 nix-generate-patches.1/;' nix/doc/manual/local.mk

