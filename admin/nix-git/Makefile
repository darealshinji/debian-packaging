include ../../mk/include.mk

deps     = git
builddir = nix

download:
	git clone --depth 1500 "https://github.com/NixOS/nix.git"
	git clone --depth 1 "https://github.com/jedisct1/libsodium.git" nix/libsodium
	@ VERSION=`./changelog.sh`; $(changelog-entry)

	rm -rf nix/.git nix/libsodium/.git
	cp -f ../../mk/config.* ../../mk/install-sh nix/config/
	cp -f debian/bootstrap nix/

	# link perl module correctly
	echo "Store_LDFLAGS += -lperl -pthread" >> nix/perl/local.mk

	# build and install nix-generate-patches manpage
	sed -i 's/^<!--$$//; s/^-->$$//;' nix/doc/manual/command-ref/utilities.xml
	sed -i 's/nix-channel.1/nix-channel.1 nix-generate-patches.1/;' nix/doc/manual/local.mk

