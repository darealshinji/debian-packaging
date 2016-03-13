include ../../mk/include.mk

deps = git

download:
	rm -rf $(builddir)
	git clone --depth 1 "https://github.com/ultravideo/kvazaar.git" $(builddir)
	git -C $(builddir) submodule init
	git -C $(builddir) submodule update
	@ ver="$$(awk '/#define KVZ_VERSION/ { print $$3 }' $(builddir)/src/global.h)"; \
	latestcommit="$$(git -C $(builddir) log -1 --format=%ci | head -c10 | tr -d '-')"; \
	VERSION="$${ver}+git$${latestcommit}"; $(changelog-entry)
	mkdir -p $(builddir)/m4

