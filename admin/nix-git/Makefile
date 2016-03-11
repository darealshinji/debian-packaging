include ../../mk/include.mk

deps     = git
builddir = nix

download:
	git clone "https://github.com/NixOS/nix.git"
	git clone --depth 1 "https://github.com/jedisct1/libsodium.git" nix/libsodium

	@ latestcommit=$$(git -C nix/ log -1 --format=%ci | head -c10 | sed -e 's/-//g'); \
	version=$$(cat nix/version); \
	tagver=$$(git -C nix/ describe --abbrev=0 --tags | sed -e 's/v//g'); \
	test "$$version" = "$$tagver" && git="+git" || git="~git"; \
	VERSION="$${version}$${git}$${latestcommit}"; \
	$(changelog-entry)

	rm -rf nix/.git nix/libsodium/.git
	cp -f ../../mk/config.* ../../mk/install-sh nix/config/
	cp -f debian/bootstrap nix/

	# link perl module correctly
	echo "Store_LDFLAGS += -lperl -pthread" >> nix/perl/local.mk

	# build and install nix-generate-patches manpage
	sed -i 's/^<!--$$//; s/^-->$$//;' nix/doc/manual/command-ref/utilities.xml
	sed -i 's/nix-channel.1/nix-channel.1 nix-generate-patches.1/;' nix/doc/manual/local.mk

